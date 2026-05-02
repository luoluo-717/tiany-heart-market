local 东胜神洲 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("东胜神洲",0,0,800,560)
local 当前 = 多开数据.当前
function 东胜神洲:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(800,560)
    if nsf:渲染开始() then
        -- 取黑色背景(0,0,660,500,true):显示(0,0)
        -- __res:取图像(__res:取地址('shape/ui/xz/',0x26E89B1F)):显示(10,10)
         __res:getPNGCC(11, 0, 0, 800, 560):显示(5,5)

    end
    self:置精灵(nsf:到精灵())
end

function 东胜神洲:打开(id)
    self:置可见(true)
end

-- local 花果山 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x6B27F57F),"花果山",273,20) --花果山 A
local 花果山 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A834),"花果山",340,70) --花果山 A

function 花果山:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1514,true)
    东胜神洲:置可见(false)
end

-- local 女儿村 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x6BF13E64),"女儿村",221,170) --女儿村 A
local 女儿村 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A836),"女儿村",238,237) --女儿村 A

function 女儿村:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1142,true)
    东胜神洲:置可见(false)
end

-- local 傲来国 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xCCB7A7C3),"傲来国",354,282) --傲来国 A
local 傲来国 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A833),"傲来国",505,475) --傲来国 A

function 傲来国:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1092,true)
    东胜神洲:置可见(false)
end

-- local 蓬莱仙岛 = 东胜神洲:创建我的was按钮(__res:5取地址('shape/ui/xz/',0xA9BC7D93),"蓬莱仙岛",159,322) --蓬莱仙岛 A
local 蓬莱仙岛 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A837),"蓬莱仙岛",164,405) --蓬莱仙岛 A

function 蓬莱仙岛:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1207,true)
    东胜神洲:置可见(false)
end

local 幻境花果山 = 东胜神洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A835),"幻境花果山",546,144) --幻境花果山 A

function 幻境花果山:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1251,true)
    东胜神洲:置可见(false)
end


local 关闭 = 东胜神洲:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",732,8)
function 关闭:左键弹起(x,y)
        多开数据[当前].__UI弹出.世界大地图:打开()

    东胜神洲:置可见(false)
end