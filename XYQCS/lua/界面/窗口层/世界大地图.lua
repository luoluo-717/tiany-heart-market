--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-06-27 06:51:06
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-10 14:33:26
FilePath: \XYQCS\lua\界面\窗口层\世界大地图.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2023-11-27 18:15:51
Last Modified by: GGELUA
Last Modified time: 2023-11-27 19:42:03
--]]
多开数据[多开数据.当前].__UI弹出.世界大地图 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("世界大地图",0,0,800,560)
local 世界大地图 = 多开数据[多开数据.当前].__UI弹出.世界大地图
local 当前 = 多开数据.当前
function 世界大地图:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(800,560)
    if nsf:渲染开始() then
        -- 取黑色背景(0,0,660,500,true):显示(0,0)
        -- __res:取图像(__res:取地址('shape/ui/xz/',0x93E77F54)):显示(10,10)
         __res:getPNGCC(9, 0, 0, 800, 560):显示(5,5)
    end
    self:置精灵(nsf:到精灵())
end

function 世界大地图:打开(id)
    self:置可见(true)
end

-- local 东胜神洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xCC1742A6),"东胜神洲",508,172) --东胜神洲c
local 东胜神洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A808),"东胜神洲",603,138) --东胜神洲c
function 东胜神洲:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.东胜神洲:打开()
    世界大地图:置可见(false)
end

-- local 南瞻部洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0x7FFAB47A),"南瞻部洲",97,113) --南瞻部洲 B
local 南瞻部洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A802),"南瞻部洲",118,146) --南瞻部洲 B

function 南瞻部洲:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.南瞻部洲:打开()
    世界大地图:置可见(false)
end

-- local 北俱芦洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xEA1F50E2),"北俱芦洲",280,20) --北俱芦洲 D
local 北俱芦洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A803),"北俱芦洲",322,20) --北俱芦洲 D

function 北俱芦洲:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.北俱芦洲:打开()
    世界大地图:置可见(false)
end

-- local 西牛贺洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0x0AF24A29),"西牛贺洲",10,65) --西牛贺洲 A
local 西牛贺洲 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A807),"西牛贺洲",4,48) --西牛贺洲 A

function 西牛贺洲:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.西牛贺洲:打开()
    世界大地图:置可见(false)
end

-- local 龙宫 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xCE11152D),"龙宫",400,386) --龙宫 A
local 龙宫 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A801),"龙宫",487,443) --龙宫 A

function 龙宫:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1116,true)
    世界大地图:置可见(false)
end

-- local 月宫 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF63C410E),"月宫",83,14) --月宫 A
local 月宫 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A806),"月宫",139,8) --月宫 A

function 月宫:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1114,true)
    世界大地图:置可见(false)
end

-- local 天宫 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0x5ABFF907),"天宫",176,33) --天宫 A
local 天宫 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A805),"天宫",216,6) --天宫 A

function 天宫:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1111,true)
    世界大地图:置可见(false)
end

-- local 蟠桃园 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A67A7A),"蟠桃园",209,9) --蟠桃园 A
local 蟠桃园 = 世界大地图:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A804),"蟠桃园",285,6) --蟠桃园 A

function 蟠桃园:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1231,true)
    世界大地图:置可见(false)
end


local 关闭 = 世界大地图:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",732,8)
function 关闭:左键弹起(x,y)
    世界大地图:置可见(false)
end
