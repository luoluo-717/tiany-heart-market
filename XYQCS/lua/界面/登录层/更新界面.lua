--[[
Author: GGELUA
Date: 2026-03-12 10:24:29
Last Modified by: GGELUA
Last Modified time: 2026-03-12 21:33:45
--]]
--[[
Author: GGELUA
Date: 2024-06-26 21:56:08
Last Modified by: GGELUA
Last Modified time: 2024-06-26 23:11:35
--]]
--[[
Author: GGELUA
Date: 2023-12-01 22:54:48
Last Modified by: GGELUA
Last Modified time: 2024-01-30 11:08:27
--]]
local GGEF = require('GGE.函数')
local SDLF = require("SDL.函数")
http = require('网络/网站处理下载')
更新状态 = "检查版本更新"  --1是检查更新 2是索要更新文件  3是开始更新 4是更新结束 or 无需更新  --检查版本更新
更新文件 = "sdadasdas"
更新进度 = 0
local 更新界面 = 多开数据[多开数据.当前].__UI界面.登录层:创建控件("更新界面",220+abbr.py2.x,45+abbr.py2.y,535,460)
local 当前=多开数据.当前
function 更新界面:初始化()
    local nsf = require('SDL.图像')(535,460)
    if nsf:渲染开始() then
        取黑色背景(0,0,535,460,true):显示(0,0)
        字体14:取图像("版本号:" .. 版本号):显示(400,430)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end


更新界面:创建我的文本("公告文本",30,0,475,420,true)
更新界面.公告文本:置文本(版本公告)

function 更新界面:更新(dt,x,y)
    self.下载进度条:置位置(更新进度)
end

function 更新界面:显示(x,y)
    字体14:显示(x+200,y+380,更新文件)
    self.下载进度条:置位置(更新进度)
end

local 下载进度条 = 更新界面:创建进度("下载进度条",110,400,305,18)
function 下载进度条:初始化()
    self:置精灵(__res:getPNGCC(1,401,145,305,18):拉伸(305,22):到精灵())
    self:置位置(0)
end

function 下载进度条:显示(x,y)
    if 更新状态 == "检查版本更新" then
        更新状态 = "开始连接服务器"
        coroutine.wrap(function ()
            http:开始连接()
        end)()
    end
    字体14:显示(x+90,y+1,更新状态)
end

function 更新界面:消息事件(msg) --消息事件是协程
    if __更新 == 3 then
        多开数据[当前].__UI界面.登录层.更新界面:置可见(false)
        多开数据[当前].__UI界面.登录层.选择大区:置可见(true,true)
    end
end