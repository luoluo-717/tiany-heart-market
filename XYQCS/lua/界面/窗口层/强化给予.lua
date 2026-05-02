--[[
    @Author       : GGELUA
    @Date         : 2022-04-08 10:57:22
Last Modified by: GGELUA
Last Modified time: 2023-07-30 21:33:33
--]]
local 强化给予 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("强化给予",0,0,374,408)
local 当前 = 多开数据.当前
function 强化给予:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(374,408)
    if nsf:渲染开始() then
        置窗口背景("功能界面",0,12,362,395,true):显示(0,0)
        取灰色背景(0,0,340,280,true):显示(15,50)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 强化给予:打开(数据,mc,lx,dj)
    self:置可见(true)
    self:重置(数据,mc,lx,dj)
end

function 强化给予:重置(数据,mc,lx,dj)
    local nsf = require('SDL.图像')(326,260)
    if nsf:渲染开始() then
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.道具网格:置物品(多开数据[当前].__主控.道具列表)
    self.选中类型 = "道具"
end

local 道具网格 = 强化给予:创建网格("道具网格",20,60,326,260)

function 道具网格:初始化()
    self:创建格子(55,55,14,13,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if  强化给予.选中 and  self.子控件[强化给予.选中]._spr and  self.子控件[强化给予.选中]._spr.物品 then
        self.子控件[强化给予.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品  then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(520,86,w,h)
        self.子控件[a]._spr.确定 = true
        强化给予.选中 = a
    end

end

function 道具网格:置物品(数据,bh)
    if not bh then
        for i = 1,#道具网格.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i],"强化给予")
            道具网格.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"强化给予")
        道具网格.子控件[bh]:置精灵(lssj)
    end
end

local 关闭 = 强化给予:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",320,0)

function 关闭:左键弹起(x,y,msg)
    强化给予:置可见(false)
end


local 确定按钮 = 强化给予:创建我的按钮(__res:getPNGCC(3,2,507,124,41):拉伸(123,41),"确定按钮",115,350,"确定")

function 确定按钮:左键弹起(x,y,msg)
    if 强化给予.选中 == nil then
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请先选中需要操作的物品')
        return
    end
    发送数据(当前 or self and self.当前,3715,{格子={强化给予.选中},银子=0,数量=1,类型=强化给予.选中类型})
    强化给予:置可见(false)
end