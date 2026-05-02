--[[
    @Author       : GGELUA
    @Date         : 2022-04-24 08:43:10
Last Modified by: GGELUA
Last Modified time: 2023-11-07 14:43:21
--]]
local 临时背包 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("临时背包",0,0,380,370)
local 当前 = 多开数据.当前
function 临时背包:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(380,370)
    if nsf:渲染开始() then
        置窗口背景("临时包裹",0,12,370,360,true):显示(0,0)
        __res:getPNGCC(3,694,4,338,273):显示(20,44)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 临时背包:打开(data)
    self:置可见(true)
    self.道具网格:置物品(data.道具)
end

function 临时背包:刷新数据(data)
    self.道具网格:置物品(data.道具)
end

local 关闭 = 临时背包:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",330,0)

function 关闭:左键弹起(x,y,msg)
    临时背包:置可见(false)
end

local 道具网格 = 临时背包:创建网格("道具网格",20,44,339,272)

function 道具网格:左键弹起(x, y, a, b, msg)
    if 临时背包.选中道具 then
        self.子控件[临时背包.选中道具]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
       local w,h = self.子控件[a]:取宽高()
        临时背包.选中道具 = a
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
    end
end

function 道具网格:置物品(data)
    临时背包.选中道具 = nil
    self:创建格子(67,67,0,0,math.ceil(#data/5),5)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],nil,"临时背包")
            lssj:置偏移(10,10)
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 清空包裹 = 临时背包:创建我的按钮(__res:getPNGCC(3,126,563,111,36,true),"清空包裹",15,330,"清空包裹")

function 清空包裹:左键弹起(x,y,msg)
    发送数据(当前 or self and self.当前,3749,{方式="清空"})
    临时背包:置可见(false)
end

local 取出物品 = 临时背包:创建我的按钮(__res:getPNGCC(3,126,563,111,36,true),"取出物品",228,330,"取出物品")

function 取出物品:左键弹起(x,y,msg)
    if 临时背包.选中道具 then
        发送数据(当前 or self and self.当前,3749,{方式="获取",选中 =临时背包.选中道具 })
    end
end