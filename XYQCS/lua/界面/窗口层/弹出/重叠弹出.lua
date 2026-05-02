--[[
Author: GGELUA
Date: 2023-11-15 18:48:35
Last Modified by: GGELUA
Last Modified time: 2023-11-15 18:51:51
--]]
多开数据[多开数据.当前].__UI弹出.重叠弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("重叠弹出",0,0,140,300)
local 重叠弹出 = 多开数据[多开数据.当前].__UI弹出.重叠弹出
local 当前 = 多开数据.当前
function 重叠弹出:初始化()
    
end

function 重叠弹出:左键弹起()
    self.选中 = nil
    self:置可见(false)
end

function 重叠弹出:打开(数据,x,y)
    self.数据 = 数据
    self.选中 = nil
    self:置坐标(x+30,y-100)
    local w,h=140,#数据*35 < 250 and  #数据*35 or 250
    self:置宽高(w,h)
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
    self:置可见(true,true)
    self.怪物列表:重置()
end

local 怪物列表 = 重叠弹出:创建列表("怪物列表",20,10,90,200)
function 怪物列表:初始化()
    self:置文字(字体18)
    self.行间距 = 10
end

function 怪物列表:重置()
    怪物列表:清空()
    怪物列表:置颜色(255,255,255)
    for i = 1,#重叠弹出.数据 do
        怪物列表:添加(重叠弹出.数据[i].名称)
    end
end

function 怪物列表:左键弹起(x, y, i, item, msg)
    发送数据(当前 or self and self.当前,1501,{地图=多开数据[当前 or self and self.当前].角色信息.地图数据.编号,编号=重叠弹出.数据[i].pid,序列=重叠弹出.数据[i].pid,标识=重叠弹出.数据[i].id})
    重叠弹出:左键弹起()
end

