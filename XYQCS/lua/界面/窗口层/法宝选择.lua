--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-08-17 22:10:13
FilePath: \XYQCS\lua\界面\窗口层\法宝选择.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2024-03-26 11:42:49
Last Modified by: GGELUA
Last Modified time: 2024-03-26 11:58:03
--]]
local 法宝选择 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("法宝选择",0,0,384,420)
local 当前 = 多开数据.当前
local 法宝类型 = {
    [1] = {"碧玉葫芦","五色旗盒","飞剑","拭剑石","金甲仙衣","惊魂铃","嗜血幡","风袋","清心咒","九黎战鼓","盘龙壁","神行飞剑","汇灵盏","天师符","织女扇"},
    [2] = {"发瘟匣","断线木偶","五彩娃娃","七杀","金刚杵","兽王令","摄魂"},
    [3] = {"失心钹","五火神焰印","九幽","普渡","鬼泣","斩魔","奇门五行令","神木宝鼎","金箍棒","混元伞","无魂傀儡","苍白纸人","乾坤玄火塔","无尘扇","无字经","干将莫邪","慈悲","救命毫毛","伏魔天书","镇海珠"},
}
function 法宝选择:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(384,420)
    if nsf:渲染开始() then
        置窗口背景("法宝选择",0,12,372,400,true):显示(0,0)
        取灰色背景(0,0,340,350,true):显示(15,50)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 法宝选择:打开()
    self:置可见(true)
    self.选择=1
    self.道具网格:置物品(法宝类型[1])
    self.一级:置选中(true)
end

for i, v in ipairs {
    { name = '一级', x = 20, y = 55, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(80,35), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):置拉伸(80,35), font = "一 级" },
    { name = '二级', x = 110, y = 55, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(80,35), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):置拉伸(80,35), font = "二 级" },
    { name = '三级', x = 200, y = 55, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(80,35), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):置拉伸(80,35), font = "三 级" },

} do
    local 临时函数 = 法宝选择:创建我的单选按钮(v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '一级' then
            法宝选择.选择=1
            法宝选择.道具网格:置物品(法宝类型[1])
        elseif v.name == '二级' then
            法宝选择.选择=2
            法宝选择.道具网格:置物品(法宝类型[2])
        elseif v.name == '三级' then
            法宝选择.选择=3
            法宝选择.道具网格:置物品(法宝类型[3])
        end
    end
end


local 道具网格 = 法宝选择:创建网格("道具网格",20,100,326,260)

function 道具网格:初始化()
    self:创建格子(55,55,14,13,5,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if  法宝选择.选中 and  self.子控件[法宝选择.选中]._spr.物品 then
        self.子控件[法宝选择.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and  self.子控件[a]._spr.物品  then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(520,86,w,h)
        self.子控件[a]._spr.确定 = true
        法宝选择.选中 = a
    end
end

function 道具网格:置物品(数据)
    for i = 1,#数据 do
        local lssj = __商店格子.创建(当前)
        lssj:置物品({名称=数据[i]},"法宝选择")
        道具网格.子控件[i]:置精灵(lssj)
    end
end

local 领取 = 法宝选择:创建我的按钮(__res:getPNGCC(3,511,11,117,43,true):拉伸(50,30),"领取",240,345,'领取')
function 领取:左键弹起(x, y)
    if 法宝选择.选择 == nil or 法宝选择.选中==nil then
        多开数据[当前].__UI弹出.提示框:打开("#Y/请选择你要领取的法宝！")
        return
    end
    发送数据(当前,126,{名称=法宝类型[法宝选择.选择][法宝选择.选中],编号=法宝选择.选择})
    法宝选择:置可见(false)
end


local 关闭 = 法宝选择:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",326,0)
function 关闭:左键弹起(x,y,msg)
    法宝选择:置可见(false)
end
