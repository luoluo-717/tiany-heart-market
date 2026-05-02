--[[
Author: GGELUA
Date: 2025-01-05 16:09:23
Last Modified by: GGELUA
Last Modified time: 2025-01-05 18:16:03
--]]
--[[
Author: GGELUA
Date: 2023-11-15 19:12:14
Last Modified by: GGELUA
Last Modified time: 2023-11-22 17:22:17
--]]
local 属性={
	[1]={"防御","魔法"},
	[2]={"灵力"},
	[3]={"伤害","命中"},
	[4]={"防御","伤害","命中"},
	[5]={"防御","气血"},
	[6]={"防御","敏捷"},
}
local 装备强化 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("装备强化", 0, 0, 550, 440)
local 当前 = 多开数据.当前
function 装备强化:初始化()
    __置窗口坐标(self, '右')
    local nsf = require('SDL.图像')(550, 440)
    if nsf:渲染开始() then
        置窗口背景("装备强化", 0, 12, 550, 440, true):显示(0, 0)
        字体14:取图像('鬼卡状态：'):显示(21, 50)
        字体14:取图像('剩余时间：'):显示(21, 80)
        nsf:渲染结束()
    end
    装备强化.保护=false 
    self:置精灵(nsf:到精灵())
    self.允许移动 = true
end

function 装备强化:打开(数据)
   
    table.print(数据)
    self:置可见(true)
    self.数据 = data
    self.状态 = 1
    self.加入 = 0
    self.时间 = 0 
    self.数据=数据
    装备强化:重置(数据)
end
function 装备强化:重置(数据)
    local nsf = require('SDL.图像')(550, 440)
    if nsf:渲染开始() then
        置窗口背景("装备强化", 0, 12, 550, 440, true):显示(0, 0)
        for n=1,6 do  
            if 数据[n] then  
                字体14:取图像(数据[n].名称):显示(71, n*67-37+22)
                字体14:取图像((数据[n].升星 or 0).."★"):显示(71, n*67-7+22)
            end     
        end     
        字体18:取图像("当前属性"):显示(390, 80)
        字体18:取图像("下级属性"):显示(390, 230)
        字体14:取图像("保护"):显示(450,390)
        if 装备强化.选中 and 数据[装备强化.选中] then  
            字体18:取图像(数据[装备强化.选中].名称):显示(185, 60)
            local dj = 取物品(数据[装备强化.选中].名称)
            __res:取图像(__res:取地址("shape/dj/", dj[13])):显示(210,150)
            local sx=属性[装备强化.选中] 
            local zz=0
            local 星=数据[装备强化.选中].升星 or 0
            local 历史=""
            for n=1,星 do  
                历史=历史.."★" 
            end  
            -- 字体18:取图像(历史):显示(135, 360)   
            for n=1,#sx do  
               
                
                if 数据[装备强化.选中][sx[n]] then  
                    zz=zz+1
                    字体14:取图像(sx[n].." "..数据[装备强化.选中][sx[n]].."+"..math.floor(数据[装备强化.选中][sx[n]]*星*0.01)):显示(390, 80+zz*30)
                    字体14:取图像(sx[n].." "..数据[装备强化.选中][sx[n]].."+"..math.floor(数据[装备强化.选中][sx[n]]*(星+1)*0.01)):显示(390, 230+zz*30)
                end     
            end     
        end     
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    装备强化.道具网格:置数据(数据)
end     
local 道具网格 = 装备强化:创建网格("道具网格", 0, 30, 100, 420)
function 道具网格:初始化()
    self:创建格子(67, 67, 0, 0, 6,1)
end
function 道具网格:左键弹起(x, y, a, b, msg)
    装备强化.选中=a 
    local w, h = self.子控件[a]:取宽高()
   -- self.子控件[a]._spr:详情打开(170, 86, w, h, "道具", a) 
    装备强化:重置(装备强化.数据) 
end   
function 道具网格:置数据(数据)
    for i = 1, #道具网格.子控件 do
        if 数据[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(数据[i], "白格子", "强化")
            lssj:置偏移(10, 10)
            道具网格.子控件[i]:置精灵(lssj)
        else
            道具网格.子控件[i]:置精灵()
        end
    end
end   
function 装备强化:刷新(数据)
    if 数据.成功 then 

    else     
    self.数据 = 数据
    self:重置(数据) 
    end 
end
local 临时函数 = 装备强化:创建我的多选按钮(__res:getPNGCC(2,1172,107,26,26,true),__res:getPNGCC(2,1171,75,26,26,true),"1按钮",410,390)
function 临时函数:左键弹起(x, y) 
  装备强化.保护=not 装备强化.保护 
   
end     
 

function 装备强化:显示()
   
end
local 强化 = 装备强化:创建我的按钮(__res:getPNGCC(3,511,11,117,43,true):拉伸(125,43), "强化", 208, 390," 强化")
function 强化:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前, 222,{事件="升星",事项="升星",编号=装备强化.选中,保护=装备强化.保护})
end
local 关闭 = 装备强化:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46):置拉伸(30, 30), "关闭", 480, 12)
function 关闭:左键弹起(x, y, msg)
    self.开启 = false
    装备强化:置可见(false)
    发送数据(当前 or self and self.当前, 42, { 进程 = "关闭" })
end
