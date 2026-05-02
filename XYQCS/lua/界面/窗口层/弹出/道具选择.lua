-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2024-06-30 20:45:48
-- @Last Modified time  : 2024-07-13 12:03:16
--[[
    @Author       : GGELUA
    @Date         : 2022-04-04 20:03:03
Last Modified by: GGELUA
Last Modified time: 2023-06-13 08:51:46
--]]
多开数据[多开数据.当前].__UI弹出.道具选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("道具选择",0,0,370,350)
local 道具选择 = 多开数据[多开数据.当前].__UI弹出.道具选择
local 当前 = 多开数据.当前
function 道具选择:初始化()
    local nsf = require('SDL.图像')(370,350)
    if nsf:渲染开始() then
        取黑透明背景(0,0,370,350,true):显示(0,0)
        __res:getPNGCC(3,694,4,338,273):显示(20,14)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中道具 = nil
end

function 道具选择:打开(数据,x,y,lx,总类,分类,bh)
    self:置可见(true)
    if lx == "洗炼" then --
        self.道具网格:置物品(数据,{"金柳露","超级金柳露","净瓶玉露","超级净瓶玉露","神兜兜"})
    elseif lx == "炼化" then --炼妖石
        self.道具网格:置物品(数据,{"炼妖石","吸附石"})
    elseif lx == "打书" or lx == "增加" or lx == "替换" then --魔兽要诀 高级魔兽要诀
        self.道具网格:置物品(数据,{"魔兽要诀","高级魔兽要诀","特殊魔兽要诀","超级魔兽要诀"})
    elseif lx == "内丹" then --召唤兽内丹 高级召唤兽内丹
        self.道具网格:置物品(数据,{"召唤兽内丹","高级召唤兽内丹"})
    elseif lx == "法宝合成" then --召唤兽内丹 高级召唤兽内丹
        self.道具网格:置物品(数据,总类,分类)
    elseif lx == "做丸子1" then
        self.道具网格:置物品(数据, {"神兽涎"})
    elseif lx == "做丸子2" then
        self.道具网格:置物品(数据, {"仙露小丸子"})
    else
        self.道具网格:置物品(数据)
    end
    self:置坐标(x+abbr.py2.x,y+abbr.py2.y)
    self.类型 = lx
    self.选中道具 = nil
    self.返回编号 = bh
    self.道具 = 数据
end

local 道具网格 = 道具选择:创建网格("道具网格",20,14,339,272)

function 道具网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and not self.子控件[a]._spr.物品禁止 then
        local xx,yy = 0,0--道具选择:取坐标减宽()
        if 道具选择.选中道具 and self.子控件[道具选择.选中道具]._spr.物品 then
            self.子控件[道具选择.选中道具]._spr.确定 = nil
        end
        道具选择.选中道具 = a
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(xx,yy,nil,nil,"选择",a)
    end
end

function 道具网格:置物品(data,zl,fl)
    --self:创建格子(67,67,0,0,math.ceil(#data/5),5)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],nil,"道具选择")
            lssj:置禁止(zl,fl)
            lssj:置偏移(10,10)
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 取消材料 = 道具选择:创建我的按钮(__res:getPNGCC(3,126,563,111,36,true),"取消材料",15,300,"取消材料")

function 取消材料:左键弹起(x,y,msg)
    道具选择:置可见(false)
end

local 添加材料 = 道具选择:创建我的按钮(__res:getPNGCC(3,126,563,111,36,true),"添加材料",228,300,"添加材料")

function 添加材料:左键弹起(x,y,msg)
    if 道具选择.选中道具 and 道具选择.道具[道具选择.选中道具] then
        if 道具选择.类型 == "法宝合成" then
            多开数据[当前].__UI界面.窗口层.法宝锻造.材料网格:置物品(道具选择.道具[道具选择.选中道具],道具选择.返回编号,道具选择.选中道具)
            道具选择:置可见(false)
        elseif 道具选择.类型 == "增加" or 道具选择.类型 == "替换" then
            多开数据[当前].__UI界面.窗口层.神兽增加技能.材料网格:置物品(道具选择.道具[道具选择.选中道具], 道具选择.选中道具)
            道具选择:置可见(false)
        elseif 道具选择.类型 == "做丸子1" then
            多开数据[当前].__UI界面.窗口层.召唤兽做丸子.材料网格1:置物品(道具选择.道具[道具选择.选中道具],道具选择.选中道具)
            道具选择:置可见(false)
        elseif 道具选择.类型 == "做丸子2" then
            多开数据[当前].__UI界面.窗口层.召唤兽做丸子.材料网格2:置物品(道具选择.道具[道具选择.选中道具],道具选择.选中道具)
            道具选择:置可见(false)
        else
            多开数据[当前].__UI界面.窗口层.召唤兽洗炼.材料网格:置物品(道具选择.道具[道具选择.选中道具],道具选择.选中道具)
            道具选择:置可见(false)
        end
    end
end