--[[
Author: GGELUA
Date: 2024-08-08 08:53:53
Last Modified by: GGELUA
Last Modified time: 2024-08-17 15:04:46
--]]
local GGF = require('GGE.函数')
local SDLF = require('SDL.函数')


 自己 = true
--团=true
取随机数=math.random

if 自己 then
    host ="150.158.158.150"
    port = 212
    服务器表 = {
        {服务组="二零二六",IP="43.142.255.235",端口="13779",状态="爆满"},
        {服务组="测试专区",IP="127.0.0.1",端口="13779",状态="爆满"},
    }

elseif 团 then
    host ="123.207.50.20"
    port = 122
    服务器表 = {
        {服务组="新年快乐",IP="43.142.255.235",端口="13779",状态="爆满"},
        {服务组="测试专区",IP="127.0.0.1",端口="13779",状态="爆满"},
    }

end








__res = require('资源')()
版本公告 = __res:读入文件("Notice.txt")
版本号 = __res:读入文件("Version.txt")
地图下载 = __res:读入文件("scene.txt")
__更新 = 1
__下载数据 = {}
httpdata = require('网络/网站资源下载')
__res:公共资源("shape/ui/jm/zd1.png")
__res:公共资源("shape/ui/jm/zd2.png")
__res:公共资源("shape/ui/jm/zd3.png")
__res:公共资源("shape/ui/jm/zd4.png")

__res:公共资源("shape/ui/jm/zd5.png")
__res:公共资源("shape/ui/jm/zd6.png")
__res:公共资源("shape/ui/jm/zd7.png")
__res:公共资源("shape/ui/jm/zd8.png")
__res:公共资源("shape/ui/jm/zd9.png")
__res:公共资源("shape/ui/jm/zd10.png")
__res:公共资源("shape/ui/jm/zd11.png")
__res:公共资源("shape/ui/jm/zd12.png")
__res:公共资源("shape/ui/jm/zd13.png")
__res:公共资源("shape/ui/jm/zd14.png")
__res:公共资源("shape/ui/jm/zd15.png")
__res:公共资源("shape/ui/jm/zd16.png")
__res:公共资源("shape/ui/jm/zd17.png")
__res:公共资源("shape/ui/jm/zd18.png")





require('数据/锦衣数据')
require('数据/模型数据')
require('数据/特效数据')
require('数据/技能数据')
require('数据/物品数据')
require('数据/音效数据')
require('数据/场景数据')
require('数据/自定义数据')
require('数据/场景npc')
require('数据/传送数据')
require('数据/内丹数据')
require('数据/特性数据')
require('数据/图标数据')
require("数据/经脉库")

ItemData = {}
__助战道具={}
加载物品数据()
坐骑文件完整=true
显示战斗鼠标 = false
锦衣文件完整=true
主角飞行=false---C改飞行
tp战斗速度倍数=1.0
function 判断下载文件是否完整()
    if __res["是否存在"](__res, "assets/shape/zuoqi/aabbcc99.was") then
        坐骑文件完整=true
    end
    if __res["是否存在"](__res, "assets/shape/mx/52A385FE.was") then
        锦衣文件完整=true
    end
    print("判断下载文件是否完整","锦衣",锦衣文件完整,"坐骑",坐骑文件完整)
end
字体8 = require("SDl.文字")("assets/hkyt.ttf", 8, true)
字体12 = require("SDl.文字")("assets/hkyt.ttf", 12, true)
字体13 = require("SDl.文字")("assets/hkyt.ttf", 13, true)
字体14 = require("SDl.文字")("assets/hkyt.ttf", 14, true)
物品格子字体 = require("SDl.文字")("assets/hkyt.ttf", 14, true)

字体15 = require("SDl.文字")("assets/hkyt.ttf", 15, true)

字体16 = require("SDl.文字")("assets/hkyt.ttf", 16, true)
字体166 = require("SDl.文字")("assets/hkyt.ttf", 16, true)

字体17 = require("SDl.文字")("assets/hkyt.ttf", 17, true)
字体181 = require("SDl.文字")("assets/hkyt.ttf", 18, true, 0)
字体182 = require("SDl.文字")("assets/hkyt.ttf", 18, false, 0)

字体18 = require("SDl.文字")("assets/hkyt.ttf", 18, true, 0)
字体20 = require("SDl.文字")("assets/hkyt.ttf", 20, true, 0)
字体22 = require("SDl.文字")("assets/hkyt.ttf", 22, true)
字体25 = require("SDl.文字")("assets/hkyt.ttf", 25, true)
名字16 = require("SDl.文字")("assets/hkyt.ttf", 16, true)
名字17 = require("SDl.文字")("assets/hkyt.ttf", 17, true)
技能字体 = require("SDl.文字")("assets/hyf2gjm.ttf", 17, true)
技能字体大 = require("SDl.文字")("assets/hyf2gjm.ttf", 20, true)


选择字体 = { 字体8, 字体14, 字体16, 字体18, 字体20, 字体22, 字体25, 名字16, 名字17 }

abbr = {
    py = { x = math.floor(引擎.宽度 - 960), y = math.floor(引擎.高度 - 540) },
    py2 = { x = math.floor((引擎.宽度 - 960) / 2), y = math.floor((引擎.高度 - 540) / 2) }
}
require('界面/自定义')
require('界面/自定义2')
多开数据 = {}
function 初始化多开(当前)
    多开数据[当前] = {}
    多开数据.当前 = 当前
    多开数据[当前].全局数据 = {}
    多开数据[当前].__连接信息 = {}
    多开数据[当前].__主控 = require('对象/主控')(当前)
    多开数据[当前].__UI界面 = require('GUI')(引擎, 字体16, 当前)
    多开数据[当前].__UI弹出 = {}
    package.loaded['界面/登录层'] = nil
    require('界面/登录层')
    package.loaded['界面/界面层'] = nil
    require('界面/界面层')
    package.loaded['界面/窗口层'] = nil
    require('界面/窗口层')
    package.loaded['界面/控件层'] = nil
    require("界面/控件层")

    多开数据[当前].__UI界面.登录层:置可见(true)
   -- 多开数据[当前].__UI界面.登录层.更新界面:置可见(true, true)
   多开数据[当前].__UI界面.登录层.选择大区:置可见(true,true)

  

    package.loaded['战斗逻辑/战斗主控'] = nil
    多开数据[当前].__战斗主控 = require('战斗逻辑/战斗主控')(当前)
end

初始化多开(1)
客户端 = require('网络/网络处理')
客户端:启动('0.0.0.0', false)

__战斗单位 = require('战斗逻辑/战斗单位')
__战斗动画 = require('战斗逻辑/战斗动画')
__昼夜=0

__频道表 = {
    xt = 900,
    sj = 901,
    dq = 902,
    sl = 903,
    cy = 904,
    cw = 905,
    bp = 906,
    dw = 907,
    hd = 908
}
