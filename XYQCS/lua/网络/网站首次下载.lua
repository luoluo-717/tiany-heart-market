--[[
Author: GGELUA
Date: 2024-06-27 10:59:36
Last Modified by: GGELUA
Last Modified time: 2024-07-15 14:46:21
--]]
package.loaded["ltn12"] = require('socket.ltn12')
local http = require("socket.http")
local ltn12 = require("ltn12")
local GGF = require('GGE.函数')
local SDLF = require('SDL.函数')
-- 定义下载的URL和保存的文件路径
local url = 'http://xyq.gdl.netease.com/MHXY-JD-3.0.506.exe?key1=c9191f49d0dd06c7bddeb162f1576739&key2=65be5979'--"http://www.libsdl.org/media/SDL_logo.png"
local file_path = 'updata.wdf'--"SDL_logo.png"
-- 定义用于保存下载进度的变量
local total_size = 2056344249
local downloaded_size = 0
local 首次下载  = {}
local 当前进度
local function update_progress(chunk, err)
    if chunk then
        downloaded_size = downloaded_size + #chunk
        local progress = downloaded_size / total_size * 100
        -- print(string.format("下载进度：%.2f%%", progress))
        -- __res:写出文件("configures.txt",string.format("下载进度：%.2f%%", progress))
        GGF.写出文件(SDLF.取内部存储路径() .. "/configures.txt", progress)
    end
    return chunk, err
end
首次下载.下载开始 = function ()
    -- 自定义sink函数，用于更新下载进度
    -- 发起HTTP请求并下载文件
    local response, status, headers = http.request {
        url = url,
        sink = ltn12.sink.chain(
            update_progress,
            ltn12.sink.file(io.open(file_path, "wb"))
        ),
        headers = {
            ["Accept-Encoding"] = "identity"
        }
    }
    -- 检查下载是否成功
    if status == 200 then
        GGF.写出文件(SDLF.取内部存储路径() .. "/configures.txt", "开始解压资源")
    else
        GGF.写出文件(SDLF.取内部存储路径() .. "/configures.txt", "资源下载失败")
    end  
end

return 首次下载