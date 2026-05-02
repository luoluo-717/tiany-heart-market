--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-12-02 00:11:54
FilePath: \XYQCS\lua\界面\窗口层\弹出\神器道具选择.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2024-02-02 17:46:12
Last Modified by: GGELUA
Last Modified time: 2024-02-02 17:47:49
--]]
多开数据[多开数据.当前].__UI弹出.神器道具选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("神器道具选择",0,0,356,350)
local 神器道具选择 = 多开数据[多开数据.当前].__UI弹出.神器道具选择
local 当前 = 多开数据.当前
function 神器道具选择:初始化()
    local nsf = require('SDL.图像')(356,350)
    if nsf:渲染开始() then
        取黑透明背景(0,0,356,350,true):显示(0,0)
        __res:getPNGCC(3,694,4,338,273):显示(10,14)
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像('请选择一个需要添加的灵犀玉'):显示(10,305)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中道具 = nil
end

function 神器道具选择:打开(数据,x,y,lx,pid)
    self:置可见(true)
    self.道具网格:置物品(数据)
    self:置坐标(x+abbr.py2.x,y+abbr.py2.y)
    self.类型 = lx
    self.选中道具 = nil
    self.道具 = 数据
    self.pid = pid
end

local 道具网格 = 神器道具选择:创建网格("道具网格",10,14,339,272)

function 道具网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and not self.子控件[a]._spr.物品禁止 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        if 神器道具选择.选中道具 and self.子控件[神器道具选择.选中道具]._spr.物品 then
            self.子控件[神器道具选择.选中道具]._spr.确定 = nil
        end
        神器道具选择.选中道具 = a
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
    end
end

function 道具网格:置物品(data,zl,fl)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],nil,"道具选择")
            lssj:置偏移(10,10)
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 替换 = 神器道具选择:创建我的按钮(__res:getPNGCC(3,126,563,111,36,true):拉伸(75,35),"替换",270,300,"替换")

function 替换:左键弹起(x,y,msg)
    if 神器道具选择.选中道具 and 神器道具选择.道具[神器道具选择.选中道具] then
        if 神器道具选择.道具[神器道具选择.选中道具].名称=="灵犀玉"then
            多开数据[当前].__UI界面.窗口层.神器修复.五行控件:置临时物品(神器道具选择.道具[神器道具选择.选中道具],神器道具选择.pid,神器道具选择.选中道具)
            神器道具选择:置可见(false)
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择正确的灵犀玉')
        end
    end
end