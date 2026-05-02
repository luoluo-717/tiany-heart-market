--[[
Author: GGELUA
Date: 2024-01-25 18:05:29
Last Modified by: GGELUA
Last Modified time: 2024-01-26 21:43:04
--]]
--[[
Author: GGELUA
Date: 2023-12-04 13:07:39
Last Modified by: GGELUA
Last Modified time: 2023-12-04 16:11:31
--]]
local 藏宝阁出售 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("藏宝阁出售",0,0,374,408)
local 当前 = 多开数据.当前
function 藏宝阁出售:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(374,408)
    if nsf:渲染开始() then
        置窗口背景("功能界面",0,12,362,395,true):显示(0,0)
        取灰色背景(0,0,340,280,true):显示(15,50)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('价格'):显示(13,350)
        local lssj = 取输入背景(0,0,180,23)
        lssj:显示(70,350)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 藏宝阁出售:打开(数据)
    self:置可见(true)
    self.数据=数据.道具
    藏宝阁出售.选中 = nil
    self:重置()
end

function 藏宝阁出售:刷新(数据)
    self.数据=数据.道具
    藏宝阁出售.选中 = nil
    self:重置()
end

function 藏宝阁出售:重置()
    self.道具网格:置物品(self.数据)
    self.选中类型 = "道具"
end

local 道具网格 = 藏宝阁出售:创建网格("道具网格",20,60,326,260)

function 道具网格:初始化()
    self:创建格子(55,55,14,13,20,5,true)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if  藏宝阁出售.选中 and  self.子控件[藏宝阁出售.选中]._spr and  self.子控件[藏宝阁出售.选中]._spr.物品 then
        self.子控件[藏宝阁出售.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品  then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(520,86,w,h)
        self.子控件[a]._spr.确定 = true
        藏宝阁出售.选中 = a
    end
end

function 道具网格:置物品(数据)
    for i = 1,#道具网格.子控件 do
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据[i],"藏宝阁出售")
        道具网格.子控件[i]:置精灵(lssj)
    end
end

local 关闭 = 藏宝阁出售:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",320,0)

function 关闭:左键弹起(x,y,msg)
    藏宝阁出售:置可见(false)
end


local 出售按钮 = 藏宝阁出售:创建我的按钮(__res:getPNGCC(3,2,507,124,41):拉伸(70,35),"出售按钮",260,350,"出售")
function 出售按钮:左键弹起(x,y,msg)
    if 藏宝阁出售.选中 == nil then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请先选中需要操作的物品')
        return
    elseif tonumber(藏宝阁出售.出售价格:取数值()) == nil then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请正确输入价格")
        return
    end
    发送数据(当前 or self and self.当前,60.5,{编号=藏宝阁出售.选中,价格=藏宝阁出售.出售价格:取数值()})
    藏宝阁出售:置可见(false)
end

local 出售价格 = 藏宝阁出售:创建我的输入('出售价格',75,352,200,18,2,10,'黑色')