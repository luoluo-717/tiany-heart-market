--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-06-27 06:51:06
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-10 16:53:57
FilePath: \XYQCS\lua\界面\窗口层\北俱芦洲.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2023-11-27 19:17:48
Last Modified by: GGELUA
Last Modified time: 2023-11-27 20:09:02
--]]
local 北俱芦洲 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("北俱芦洲",0,0,800,560)
local 当前 = 多开数据.当前
function 北俱芦洲:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(800,560)
    if nsf:渲染开始() then
        -- 取黑色背景(0,0,660,500,true):显示(0,0)
        -- __res:取图像(__res:取地址('shape/ui/xz/',0xE9EC7A25)):显示(10,10)
         __res:getPNGCC(12, 0, 0, 800, 560):显示(5,5)

    end
    self:置精灵(nsf:到精灵())
end

function 北俱芦洲:打开(id)
    self:置可见(true)
end

local 龙窟 = 北俱芦洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A839),"龙窟",147,252) --龙窟 A
function 龙窟:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1174,true)
    北俱芦洲:置可见(false)
end

-- local 凤巢 = 北俱芦洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x13659C02),"凤巢",339,155) --凤巢 A
local 凤巢 = 北俱芦洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A840),"凤巢",435,239) --凤巢 A

function 凤巢:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1174,true)
    北俱芦洲:置可见(false)
end

-- local 女娲神殿 = 北俱芦洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xEDEEF9AF),"女娲神殿",170,31) --女娲神殿 A
local 女娲神殿 = 北俱芦洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A838),"女娲神殿",303,97) --女娲神殿 A

function 女娲神殿:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1201,true)
    北俱芦洲:置可见(false)
end


local 关闭 = 北俱芦洲:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",732,8)
function 关闭:左键弹起(x,y)
        多开数据[当前].__UI弹出.世界大地图:打开()

    北俱芦洲:置可见(false)
end