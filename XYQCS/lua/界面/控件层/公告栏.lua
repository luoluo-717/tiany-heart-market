--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:36:47
--]]

多开数据[多开数据.当前].__UI弹出.公告栏 = 多开数据[多开数据.当前].__UI界面:创建界面("公告栏",20,math.floor(10))
local 公告栏 = 多开数据[多开数据.当前].__UI弹出.公告栏
local 当前 = 多开数据.当前
local 数据组 = {}
local xx = 0--(引擎.宽度-40)/2
local 滚动显示=false
function 公告栏:初始化()
end

function 公告栏:更新()
    if 滚动显示 then
        xx=xx-1
        self.提示文本:置坐标(xx,5)
        if xx <= -(引擎.宽度-20) and math.abs(xx)>=#数据组[1]*14  then
            xx = 0
            table.remove(数据组,1)
            if #数据组==0 then
                滚动显示=false
                self.提示文本:清空()
                self:置可见(false,false)
            else
                self.提示文本:清空()
                self.提示文本:置文本(数据组[1])
            end
        end
    end
end

function 公告栏:刷新(数据)
    数据组[#数据组+1]="#Y"..数据
    if 滚动显示==false then
        self.提示文本:清空()
        self.提示文本:置文本(数据)
        self.提示文本:置坐标(xx,5)
        self:置精灵(__res:getPNGCC(2,230,965,402,51):拉伸(引擎.宽度-40 , 30):到精灵())
        self:置宽高(引擎.宽度-40 , 30)
        滚动显示=true
        self:置可见(true,true)
    end
end

local 提示文本 = 公告栏:创建文本("提示文本",20,5,960,25)
function 提示文本:初始化()
end
