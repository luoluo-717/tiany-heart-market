--[[
Author: GGELUA
Date: 2023-11-08 21:33:34
Last Modified by: GGELUA
Last Modified time: 2023-12-04 08:51:15
--]]
local http = require('HPSocket.HttpClient')()
local GGF = require('GGE.函数')
local SDLF = require('SDL.函数')
local 更新内容 = {}
local 更新数量 = { 1, 1 }
local function zdloadstring(t)
    if t then
        local f = load(t)
        if f then
            -- print(f)
            return f()
        end
    end
end
function http:断开事件(ec, ed)
    -- print(ec, ed)
end

function http:错误事件(ec, ed)
    -- print(ec, ed)
end

function http:进度事件(p)
    更新进度 = math.floor(p * 100)
end

function http:下载文件(file, fun)
    local data = http:GET(file)
    return data
end

function http:版本更新(版本号, 首次)
    local path = 更新内容[1]
    更新状态 = "正在下载第" .. 更新数量[1] .. "/" .. 更新数量[2] .. "个文件"
    更新文件 = path
    local data = self:下载文件(path, function(p)
        进度.位置 = p * 100
    end)
    if data then
        
        更新数量[1] = 更新数量[1] + 1
        GGF.写出文件(SDLF.取内部存储路径() .. "/" .. path, data)
        data = nil
        table.remove(更新内容, 1)
        if #更新内容 == 0 then
            if 首次 then
                更新状态 = ""
                __res.配置.首次更新 = true
                __res:写出文件("configure.txt", zdtostring(__res.配置))
                self:版本对比()
            else
                更新状态 = "更新完毕，重启进入游戏！"
                GGF.写出文件(SDLF.取内部存储路径() .. "/assets/Version.txt", 版本号)
                标签:关闭窗口()
                http:断开()
            end
        else
            self:版本更新(版本号, 首次)
        end
    end
end

function http:版本对比()
    local data = self:下载文件("/assets/Version.txt", function(p)
        进度.位置 = p * 100
    end)
    if data then
        if data ~= 版本号 then
            更新状态 = "开始版本更新"
            self:开始版本更新(data)
            data = nil
        else
            更新状态 = "已是最新版本"
            更新进度 = 100
            http:断开()
            __更新 = 3
        end
    end
end

function http:开始版本更新(版本)
    local data = self:下载文件("assets/Updata.txt", function(p)
        进度.位置 = p * 100
    end)
    更新内容 = zdloadstring(data)
    更新数量[1] = 1
    更新数量[2] = #更新内容
    if 更新内容 then
        更新状态 = "开始版本更新内容"
        self:版本更新(版本)
    else
        更新状态 = "获取版本更新失败"
    end
    data = nil
end

function http:首次更新()
    local data = self:下载文件("assets/FirstUpdata.txt", function(p)
        进度.位置 = p * 100
    end)
    local 更新表 = zdloadstring(data)
    更新内容 = {}
    for i, v in ipairs(更新表) do
        if not __res:是否存在(v) then
            更新内容[#更新内容 + 1] = v
        end
    end
    更新数量[2] = #更新内容
    if #更新内容 > 0 then
        更新状态 = "开始下载必要数据"
        self:版本更新(版本号, true)
    elseif #更新内容 == 0 then
        更新状态 = "获取版本信息"
        self:版本对比()
    else
        更新状态 = "获取必要数据失败"
    end
    data = nil
end

function http:检查更新()
    if __res.配置.首次更新 then
        更新状态 = "获取版本信息"
        self:版本对比()
    else
        更新状态 = "首次数据更新"
        self:首次更新()
    end
end

function http:开始连接()
    self.连接地址 = "http://"..host..":"..port
    print(self.连接地址)
    http:连接(self.连接地址)
    if not http:是否连接() then
        更新状态 = "连接更新服务器失败"
    else
        __更新 = 1
        self:检查更新()
    end
end

return http
