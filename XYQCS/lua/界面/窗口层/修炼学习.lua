--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:25:52
--]]
local 修炼学习 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("修炼学习",0,0,390,250)
local 当前 = 多开数据.当前
local sts = {"攻击修炼","法术修炼","猎术修炼","防御修炼","抗法修炼"}
function 修炼学习:初始化()
end

function 修炼学习:打开()
    self:置可见(true,true)
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(390,250)
    if nsf:渲染开始() then
        置窗口背景("修炼",0,10,390,250,"修炼"):显示(0,0)
        取白色背景(0, 0, 350, 170,true):显示(20,40)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.修炼列表:重置()
    self.选中 = nil
end

local 修炼 = 修炼学习:创建我的按钮(__res:getPNGCC(1,401,65,175,43,true):拉伸(124,37),"修炼",230,210,"修炼")

function 修炼:左键弹起(x,y,msg)
    if 修炼学习.选中 then
        发送数据(当前 or self and self.当前,3743,{修炼项目=修炼学习.选中})
    else
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择你的修炼项目！')
    end
end

local 关闭 = 修炼学习:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",345,0)

function 关闭:左键弹起(x,y,msg)
    修炼学习:置可见(false)
end


local 修炼列表 = 修炼学习:创建列表("修炼列表",24,50,347,155)

function 修炼列表:初始化()
    self:置文字(字体16)
    self.行高度 = 30
    self.行间距 = 0
end

function 修炼列表:重置()
    self:清空()
    for _, v in pairs(sts) do
        local nsf = require('SDL.图像')(347,30)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v):显示(25,10)
            if _ <= 3 then
                字体16:取图像("30000两/次"):显示(140,10)
            else
                字体16:取图像("20000两/次"):显示(140,10)
            end
            nsf:渲染结束()
        end
        local r = self:添加()
        r.name = v
        r:置精灵(nsf:到精灵())
    end
end

function 修炼列表:左键弹起(x, y, i, item, msg)
    修炼学习.选中 = self.子控件[i].name
end