--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-11-16 12:21:00
FilePath: \XYQCS\lua\网络\网站处理.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]

local SDLF = require("SDL.函数")
local Http = require("HPSocket.HttpClient")(true)
function Http:重载()
    self.receivedata = ""
    self.更新 = 1
    self.updata = {}
    self.upsize = 0
    self.tablereceivedata = {}
end
function Http:报文事件(dwConnID, pData)
    self.receivedata = self.receivedata .. pData
    if #self.receivedata >= 10024000 then
        table.insert(self.tablereceivedata, self.receivedata)
        self.receivedata = ""
    end
end
function Http:连接事件(dwConnID)
    print(dwConnID, "连接事件")
end
function Http:报头事件(dwConnID, lpszName, lpszValue)
    if "Content-Length" == lpszName then
        self.upsize = lpszValue
    end
end
function Http:结束事件(data)
    print(data, "结束事件")
    if 1 == self.更新 then
        if __res.配置.版本号 == self.receivedata then
            多开数据[多开数据.当前].__UI界面.登录层.更新界面:效验资源()
        else
            多开数据[多开数据.当前].__UI界面.登录层.更新界面:更新主体(self.receivedata)
        end
    end
    Http:保存事件()
end
function Http:发送请求(lpszPath, path)
    -- print(lpszPath, path)
    self.savepath = path
    self:GET(lpszPath)
end
function Http:保存事件()
    if self.savepath then
        if #self.tablereceivedata > 0 then
            local recata = ""
            for i, v in ipairs(self.tablereceivedata) do
                recata = recata .. v
            end
            __res:写出文件(self.savepath, recata .. self.receivedata)
        else
            __res:写出文件(self.savepath, self.receivedata)
        end
        self.receivedata = ""
        self.tablereceivedata = {}
        if self.savepath == "/ggelua" then
            引擎:关闭()
        elseif #self.updata > 0 then
            if self.updata[1].path == self.savepath and self.updata[1].lx == "WDF" then
                __res.wdfs:加载(SDLF:取内部存储路径() .. "/" .. self.savepath)
                __res.wdfs:allwas(self.updata[1].pid, self.updata[1].jb)
                if "updata" ~= self.updata[1].name then
                    __res.配置.资源包[self.updata[1].name] = true
                end
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            end
            table.remove(self.updata, 1)
        end
    end
    self.savepath = nil
    self.upsize = 0
    if #self.updata > 0 then
        self:发送请求(self.updata[1].http, self.updata[1].path)
    else
        self.断开(self)
    end
end
return Http
