--[[
Author: GGELUA
Date: 2026-03-12 10:24:29
Last Modified by: GGELUA
Last Modified time: 2026-03-12 17:41:44
--]]

local httpdata =  require('HPSocket.HttpClient')()
local GGF = require('GGE.函数')
local SDLF = require('SDL.函数')

function httpdata:断开事件(ec, ed)
    -- print(ec, ed)
end

function httpdata:错误事件(ec, ed)
    -- print(ec, ed)
end

function httpdata:进度事件(p)

end

function httpdata:下载文件(file, fun)
    -- print(httpdata:是否连接(),"是否连接")
    if httpdata:是否连接() then
        local data = httpdata:GET(file,false)
        return data
    end
end

function httpdata:开始下载()
    if #__下载数据 > 0 then
        self.下载中 = true
        local file = __下载数据[1][1]
        if file == nil then return end
        print("开始下载 "..file.."") 
        local data = self:下载文件("assets/"..file, function(p)
            进度.位置 = p * 100
        end)
       -- print("下载完成 "..file.."")
        if data then
            if __UI弹出 and __UI弹出.提示框 then
                __UI弹出.提示框:打开("#G资源 "..file.."下载完成")
            end
            GGF.写出文件(SDLF.取内部存储路径().."/assets/"..file,data)
        end
        if __下载数据[1][2] then
            local paths,dz,dz2 =  __res:取地址1(file)
            if paths ~= 'shape/FCD58523.was' then
                __下载数据[1][2]:置模型()
            end
        end
        
        table.remove(__下载数据,1)
        if #__下载数据 > 0 then
            --self:开始下载()
        else
            self.下载中 = nil
            httpdata:OnClose()
        end
    end
end

function httpdata:检查更新()
    self.连接地址 = "http://"..host..":"..port
    if httpdata._hp then
        if not httpdata:是否连接() then
            httpdata:连接(self.连接地址) --bug 重连后收不到
        end
    else
        httpdata:连接(self.连接地址) --bug 重连后收不到
    end
    
    if self.下载中 == nil then
        --self:开始下载()
    end
end

return httpdata
