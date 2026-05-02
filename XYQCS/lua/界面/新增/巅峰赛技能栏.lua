-- @Author: baidwwy
-- @Date:   2025-06-06 13:11:28
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-06-06 17:11:11
local s窗宽,s窗高 =420,581
local 巅峰赛技能栏 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("巅峰赛技能栏", 50+420 + abbr.py.x, 0 + abbr.py.y,420,581)
local 当前 = 多开数据.当前

local format = string.format
local 介绍文本 = 巅峰赛技能栏:创建文本("介绍文本", 170, 89, 230, 253)
function 介绍文本:初始化()
end

function 巅峰赛技能栏:初始化()
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
    置窗口背景("巅峰赛技能栏",0,12,280,485,true):显示(0,0)
    
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
  self.赛前技能={}
end

function 巅峰赛技能栏:打开(数据,位置)
  self:置可见(true)
  self.选中=0
  if 位置==1 then
    self.回合=1
    self.区分=1
    elseif 位置==2 then
    self.回合=1
    self.区分=2
    elseif 位置==3 then
    self.回合=2
    self.区分=1
    elseif 位置==4 then
    self.回合=2
    self.区分=2
    elseif 位置==5 then
    self.回合=3
    self.区分=1
    elseif 位置==6 then
    self.回合=3
    self.区分=2
    elseif 位置==7 then
    self.回合=4
    self.区分=1
    elseif 位置==8 then
    self.回合=4
    self.区分=2
    elseif 位置==9 then
    self.回合=5
    self.区分=1
    elseif 位置==10 then
    self.回合=5
    self.区分=2
    end
    self.技能数据={}
  for i=1,#数据 do
    self.技能数据[i]={名称=数据[i]}
  end
    self.技能网格:置技能( self.技能数据)
end
local 技能网格 = 巅峰赛技能栏["创建网格"](巅峰赛技能栏, "技能网格", 50, 60, 280, 475)
function 技能网格:初始化()
  self:创建格子(55, 55, 10, 10, 10, 3, true)
end
function 技能网格:左键弹起(x, y, a, b, msg)
  if not self.子控件[a]._spr or not self.子控件[a]._spr.模型 then return end
  self.子控件[a]._spr:详情打开(400, 300)
   巅峰赛技能栏.选中=  巅峰赛技能栏.选中+1
   if 巅峰赛技能栏.选中==2 then
    巅峰赛技能栏.选中=0
    多开数据[当前].__UI界面.窗口层.巅峰赛赛前备战界面.赛前技能[巅峰赛技能栏.回合][巅峰赛技能栏.区分] =  巅峰赛技能栏.技能数据[a].名称
    多开数据[当前].__UI界面.窗口层.巅峰赛赛前备战界面:重置()
    巅峰赛技能栏:置可见(false)
   end

end
function 技能网格:置技能(数据)
  for i = 1, #技能网格["子控件"] do
    local lssj = __技能格子2["创建"](当前)
    lssj:置数据(数据[i], 0, 0, 55, 55, 178, 64)
    技能网格["子控件"][i]["置精灵"](技能网格["子控件"][i], lssj)

  end
end

local 关闭 = 巅峰赛技能栏:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", s窗宽-37, 0)
function 关闭:左键弹起(x, y, msg)
  巅峰赛技能栏:置可见(false)
end
  
