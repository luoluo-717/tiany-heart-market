--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:32:19
--]]
多开数据[多开数据.当前].__UI弹出.子女弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("子女弹出",引擎.宽度-585,引擎.高度-344,335,150)
local 子女弹出 = 多开数据[多开数据.当前].__UI弹出.子女弹出
local 当前 = 多开数据.当前
local 输入类型 = {"体质","魔力","力量","耐力","敏捷"}
function 子女弹出:初始化()
    local nsf = require('SDL.图像')(335,150)
    local lssj = 取输入背景(0,0,50,23)
    if nsf:渲染开始() then
        取黑透明背景(0,0,335,150,true):显示(0,0)
        字体18:置颜色(__取颜色('白色'))
        for n=1,5 do
            字体18:取图像(输入类型[n]):显示(20+n*60-60,35)
            lssj:显示(20+n*60-60,55)
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 子女弹出:打开(选中)
    self:置可见(true)
    self.选中=选中

end

for i,v in ipairs {
    {name = '体质', x = 23 ,y = 60,w = 40,h = 30},
    {name = '魔力', x = 83 ,y = 60,w = 40,h = 30},
    {name = '力量', x = 143 ,y = 60,w = 40,h = 30},
    {name = '耐力', x = 203,y = 60,w = 40,h = 30},
    {name = '敏捷', x = 263,y = 60,w = 40,h = 30},
} do
    local 属性输入 = 子女弹出:创建输入(v.name,v.x,v.y,v.w,v.h)
    function 属性输入:初始化()
        self:取光标精灵()
        self:置限制字数(8)
        self:置颜色(255,255,255,255)
    end
end

for i, v in ipairs {
    {name = '确定',  x = 180 ,y = 100 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(122,42) , font = '确定'},
} do
    local 临时函数 = 子女弹出:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        local 加点方式 = {}
        for n=1,5 do
            if tonumber(子女弹出[输入类型[n]]:取数值()) then
                加点方式[n] = tonumber(子女弹出[输入类型[n]]:取数值())
                子女弹出[输入类型[n]]:清空()
            end
        end
        发送数据(当前 or self and self.当前,95,{加点方式=加点方式,编号=子女弹出.选中})
        子女弹出:置可见(false)
    end
end

