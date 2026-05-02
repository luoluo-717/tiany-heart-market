--[[
    @Author       : GGELUA
    @Date         : 2022-04-03 15:49:43
Last Modified by: GGELUA
Last Modified time: 2023-10-15 13:14:15
--]]
local 文本栏 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("文本栏",0,0,引擎.宽度,引擎.高度)
local 当前 = 多开数据.当前
function 文本栏:初始化()

end

function 文本栏:打开(数据,x,y,w,h,sj)
    -- print(数据)
    self:置可见(true,true)
    self.文本栏文本:清空()
    self:置坐标(x+abbr.py.x,y+abbr.py.y)
    if sj then
        self.事件 = sj
    else
        self.事件 = nil
    end
    local nsf = require('SDL.图像')(w,h)
    if nsf:渲染开始() then
        __res:getPNGCC(3,213,927,30,30):显示(0,0)
        __res:getPNGCC(3,213,927+30,30,141):平铺(30,h-60):显示(0,30)
        __res:getPNGCC(3,213,927+171,30,31):显示(0,h-30)
        
        __res:getPNGCC(3,213+30,927,140,30):平铺(w-60,30):显示(30,0)
        __res:getPNGCC(3,213+30,927+30,155,141):平铺(w-60,h-60):显示(30,30)
        __res:getPNGCC(3,213+30,927+171,155,31):平铺(w-60,30):显示(30,h-30)

        __res:getPNGCC(3,228+170,927,30,30):显示(w-30,0)
        __res:getPNGCC(3,228+170,927+30,30,141):平铺(30,h-60):显示(w-30,30)
        __res:getPNGCC(3,228+170,927+171,30,31):显示(w-30,h-30)
        nsf:渲染结束()
    end
    文本栏:置精灵(nsf:到精灵())
    self.文本栏文本:置文本(数据)
end

local 确定 = 文本栏:创建我的按钮(__res:getPNGCC(1,401,65,175,43,true):拉伸(124,43),"确定",30,140,"确定")

function 确定:左键弹起(x,y,msg)
    文本栏:置可见(false)
    if 文本栏.事件 then
        文本栏.事件() 
    end
end

local 取消 = 文本栏:创建我的按钮(__res:getPNGCC(1,401,65,175,43,true):拉伸(124,43),"取消",240,140,"取消")

function 取消:左键弹起(x,y,msg)
    文本栏:置可见(false)
end

local 文本栏文本 = 文本栏:创建我的文本("文本栏文本",18,18,359,106)
function 文本栏文本:初始化()

end