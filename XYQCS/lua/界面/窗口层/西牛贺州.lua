--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-06-27 06:51:07
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-10 18:17:13
FilePath: \XYQCS\lua\界面\窗口层\西牛贺州.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2023-12-01 22:54:48
Last Modified by: GGELUA
Last Modified time: 2023-12-25 11:52:19
--]]
--[[
Author: GGELUA
Date: 2023-11-27 19:17:49
Last Modified by: GGELUA
Last Modified time: 2023-11-27 19:52:34
--]]
local 西牛贺洲 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("西牛贺洲",0,0,800,560)
local 当前 = 多开数据.当前
function 西牛贺洲:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(800,560)
    if nsf:渲染开始() then
        -- 取黑色背景(0,0,660,500,true):显示(0,0)
        -- __res:取图像(__res:取地址('shape/ui/xz/',0xBF90A4C2)):显示(10,10)
         __res:getPNGCC(13, 0, 0, 800, 560):显示(5,5)

    end
    self:置精灵(nsf:到精灵())
end

function 西牛贺洲:打开(id)
    self:置可见(true)
end

-- local 方寸山 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x6A154DDE),"方寸山",552,17) --方寸山 A
local 方寸山 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A848),"方寸山",511,53) --方寸山 A

function 方寸山:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1135,true)
    西牛贺洲:置可见(false)
end

-- local 长寿村 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x637B3C48),"长寿村",424,125) --长寿村 A
local 长寿村 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A849),"长寿村",350,140) --长寿村 A

function 长寿村:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1070,true)
    西牛贺洲:置可见(false)
end

-- local 宝象国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x0D906C8D),"宝象国",371,200) --宝象国 A
local 宝象国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A841),"宝象国",281,223) --宝象国 A

function 宝象国:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1226,true)
    西牛贺洲:置可见(false)
end

-- local 朱紫国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x689EB676),"朱紫国",274,176) --朱紫国 A
local 朱紫国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A842),"朱紫国",195,245) --朱紫国 A

function 朱紫国:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1208,true)
    西牛贺洲:置可见(false)
end

-- local 西凉女国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xE329AD6A),"西凉女国",498,345) --西凉女国 A
local 西凉女国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A847),"西凉女国",452,394) --西凉女国 A

function 西凉女国:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1040,true)
    西牛贺洲:置可见(false)
end

-- local 麒麟山 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x048DA00D),"麒麟山",308,280) --麒麟山 A
local 麒麟山 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A844),"麒麟山",222,362) --麒麟山 A

function 麒麟山:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1210,true)
    西牛贺洲:置可见(false)
end

-- local 无底洞 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xBFF5620B),"无底洞",396,240) --无底洞 A

local 无底洞 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A843),"无底洞",383,237) --无底洞 A
function 无底洞:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1139,true)
    西牛贺洲:置可见(false)
end

-- local 比丘国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x63566DA9),"比丘国",372+15,313+24) --比丘国 A
local 比丘国 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A846),"比丘国",322,313+122) --比丘国 A

function 比丘国:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1232,true)
    西牛贺洲:置可见(false)
end


local 凌云渡 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A845),"凌云渡",180,313+142) --凌云渡 A

function 凌云渡:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1920,true)
    西牛贺洲:置可见(false)
end

local 须弥东界 = 西牛贺洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A850),"须弥东界",198,117) --须弥东界 A

function 须弥东界:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1242,true)
    西牛贺洲:置可见(false)
end

local 关闭 = 西牛贺洲:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",732,8)
function 关闭:左键弹起(x,y)
        多开数据[当前].__UI弹出.世界大地图:打开()
    西牛贺洲:置可见(false)
end