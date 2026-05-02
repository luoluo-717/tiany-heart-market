--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:53:17
--]]
多开数据[多开数据.当前].__UI弹出.指引弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("指引弹出",0,0,240,200)
local 指引弹出 = 多开数据[多开数据.当前].__UI弹出.指引弹出
local 当前 = 多开数据.当前
function 指引弹出:初始化()
end

function 指引弹出:左键弹起()
    self:置可见(false)
end

function 指引弹出:打开(数据,x,y,w,h,mx)
    self.数据 = 数据
    self:置坐标(x,y)
    self:置宽高(w,h)
    if self.数据 then
        local nsf = require('SDL.图像')(w,h)
        if nsf:渲染开始() then
            __res:getPNGCC(2,230,964,10,10):显示(0,0)
            __res:getPNGCC(2,230,964+10,10,31):平铺(10,h-20):显示(0,10)
            __res:getPNGCC(2,230,964+41,10,10):显示(0,h-10)

            __res:getPNGCC(2,230+10,964,382,10):平铺(w-20,10):显示(10,0)
            __res:getPNGCC(2,230+10,964+10,382,31):平铺(w-20,h-20):显示(10,10)
            __res:getPNGCC(2,230+10,964+41,382,10):平铺(w-20,10):显示(10,h-10)

            __res:getPNGCC(2,230+392,964,10,10):显示(w-10,0)
            __res:getPNGCC(2,230+392,964+10,10,31):平铺(10,h-20):显示(w-10,10)
            __res:getPNGCC(2,230+392,964+41,10,10):显示(w-10,h-10)
            nsf:渲染结束()
        end
        self:置精灵(nsf:到精灵())
        if self.数据 then
            指引弹出.技能文本:置文本(self.数据)
        end
    else
        local nsf = require('SDL.图像')(w,h)
        if nsf:渲染开始() then
            __res:getPNGCC(2,230,964,10,10):显示(0,0)
            __res:getPNGCC(2,230,964+10,10,31):平铺(10,h-20):显示(0,10)
            __res:getPNGCC(2,230,964+41,10,10):显示(0,h-10)

            __res:getPNGCC(2,230+10,964,382,10):平铺(w-20,10):显示(10,0)
            __res:getPNGCC(2,230+10,964+10,382,31):平铺(w-20,h-20):显示(10,10)
            __res:getPNGCC(2,230+10,964+41,382,10):平铺(w-20,10):显示(10,h-10)

            __res:getPNGCC(2,230+392,964,10,10):显示(w-10,0)
            __res:getPNGCC(2,230+392,964+10,10,31):平铺(10,h-20):显示(w-10,10)
            __res:getPNGCC(2,230+392,964+41,10,10):显示(w-10,h-10)
            nsf:渲染结束()
        end
        self:置精灵(nsf:到精灵())
    end
end

local 技能文本 = 指引弹出:创建文本("技能文本",20,20,300,150)
function 技能文本:初始化()

end