-- @Author: baidwwy
-- @Date:   2025-06-07 23:34:59
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-06-12 21:42:03
local s宽,s高 = 720,350
local GGF = require("GGE.函数")
local 法宝附灵 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("法宝附灵", 100 + abbr.py.x, 50 + abbr.py.y, s宽 + 15, s高 + 30)
local 当前 = 多开数据.当前

function 法宝附灵:初始化()
  local nsf = require("SDL.图像")(s宽+15,s高+15+12)
  if nsf:渲染开始() then
    字体18:置颜色(__取颜色("白"))
    置窗口背景("法宝附灵", 0, 0, s宽,s高, true):显示(0, 12)
    取灰色背景(0, 0, 342, 280, true):显示(15,53)
    字体18:取图像("结果预览："):显示(375,150)
    字体18:取图像("消耗经验"):显示(375,260)
    取输入背景(0, 0, 145, 23):显示(375+80,260-2)
    取白色背景(0, 0, 325, 80, true):显示(375,53)
    字体18:置颜色(__取颜色("黑色"))
    字体18:取图像("请先选择要附灵的法宝"):显示(440,70)
    字体18:取图像("仅满层的四级被动法宝可附灵"):显示(420,100)
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
end

function 法宝附灵:打开(daoju)
  self:置可见(true)
  self.物品 = (daoju and type(daoju)=="table") and daoju or {}
  self.道具网格:置物品()
  self.介绍文本:清空()
  self.介绍文本2:清空()
  self.选中道具 = 0
end

function 法宝附灵:置消耗经验()
  self.介绍文本2:清空()
  if self.选中道具 and self.选中道具 ~= 0 and self.道具网格.子控件[法宝附灵.选中道具] and self.道具网格.子控件[法宝附灵.选中道具]._spr then
    local xxx = self:取附灵需扣经验(self.道具网格.子控件[法宝附灵.选中道具]._spr.物品.附灵等级)
    self.介绍文本2:置文本("#N" ..xxx)
  end
end

function 法宝附灵:取附灵需扣经验(sss) --改这客户端也要改
  sss = tonumber(sss) or 1
  local data = {50000000,500000000,700000000,800000000,1000000000,1000000000}
  if not data[sss] then
    return 9999999999999
  end
  return data[sss]
end

local 道具网格 = 法宝附灵:创建网格("道具网格", 25, 63, 339, 272)
function 道具网格:初始化(data)
  self:创建格子(67, 67, 0, 0, 4, 5)
end

-- function 道具网格:置物品()
--   for i = 1, #self.子控件 do
--     if 法宝附灵.物品[i] then
--       local lssj = __物品格子:创建(当前)
--       lssj:置物品(法宝附灵.物品[i], "白格子", "战斗道具")
--       self.子控件[i]:置精灵(lssj)
--     else
--       local lssj = __物品格子:创建(当前)
--       lssj:置物品(nil, "白格子", "战斗道具")
--       self.子控件[i]:置精灵(lssj)
--     end
--   end
-- end
function 道具网格:置物品()
  for i = 1, #self.子控件 do
    if 法宝附灵.物品[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, 法宝附灵.物品[i], "白格子", "战斗道具")
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, 法宝附灵.物品[i], "白格子", "战斗道具")
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    end
  end
end


function 道具网格:刷新法宝(shuju)
  if 法宝附灵.选中道具 and self.子控件[法宝附灵.选中道具] and self.子控件[法宝附灵.选中道具]._spr then
    self.子控件[法宝附灵.选中道具]._spr.确定 = nil
  end
  法宝附灵.物品 = GGF.复制表(shuju)
  self:置物品()
  法宝附灵.选中道具 = 0
end

function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr.物品 and not self.子控件[a]._spr.物品禁止 then
    local x, y = self.子控件[a]:取坐标()
    local w, h = self.子控件[a]:取宽高()
    if 法宝附灵.选中道具 and self.子控件[法宝附灵.选中道具] and self.子控件[法宝附灵.选中道具]._spr then
      self.子控件[法宝附灵.选中道具]._spr.确定 = nil
    end
    self.子控件[a]._spr.确定 = true
    self.子控件[a]._spr:详情打开(190, 86, w, h)
    法宝附灵.选中道具 = a
    法宝附灵:置消耗经验()
  end
end

local 介绍文本 = 法宝附灵:创建文本("介绍文本", 385, 180, 310, 70)
function 介绍文本:初始化()
end

local 介绍文本2 = 法宝附灵:创建文本("介绍文本2", 375+80+10, 260+1, 300, 20)
function 介绍文本2:初始化()
end

local 关闭 = 法宝附灵:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", s宽-35, 0)
function 关闭:左键弹起(x, y, msg)
  法宝附灵:置可见(false)
end

local 泉愈按钮 = 法宝附灵:创建我的was按钮("shape/ui/DAFC12EA.was", "泉愈按钮", 460,150-2)
local 叶障按钮 = 法宝附灵:创建我的was按钮("shape/ui/1B004E75.was", "叶障按钮", 540,150-2)
local 岚载按钮 = 法宝附灵:创建我的was按钮("shape/ui/D67E82C8.was", "岚载按钮", 620,150-2)
local 清除按钮 = 法宝附灵:创建我的按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(90,43), "清除按钮", 380-5, 294, "清除")
local 附灵按钮 = 法宝附灵:创建我的按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(130,43), "附灵按钮", 480-5, 294, "法宝附灵")
local 升级按钮 = 法宝附灵:创建我的按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(90,43), "升级按钮", 620-5, 294, "升级")

function 泉愈按钮:左键弹起(x, y, msg)
  法宝附灵.介绍文本:清空()
  法宝附灵.介绍文本:置文本("泉愈(1级)\n战斗前4回合受到的治疗量提高5%")
end
function 叶障按钮:左键弹起(x, y, msg)
  法宝附灵.介绍文本:清空()
  法宝附灵.介绍文本:置文本("岚载(1级)\n战斗前4回合有2.5%几率使受到的伤害降低50%")
end
function 岚载按钮:左键弹起(x, y, msg)
  法宝附灵.介绍文本:清空()
  法宝附灵.介绍文本:置文本("叶障(1级)\n进入战斗时，获得4%最大生命值的护盾")
end

function 清除按钮:左键弹起(x, y, msg)
  if 法宝附灵.选中道具 and 法宝附灵.选中道具 ~= 0 then
    发送数据(当前,3818,{x事件="清除",s选中=法宝附灵.选中道具})
  else
    多开数据[当前].__UI弹出.提示框:打开("#Y请选择法宝")
  end
end
function 附灵按钮:左键弹起(x, y, msg)
  if 法宝附灵.选中道具 and 法宝附灵.选中道具 ~= 0 then
    发送数据(当前,3818,{x事件="附灵",s选中=法宝附灵.选中道具})
  else
    多开数据[当前].__UI弹出.提示框:打开("#Y请选择法宝")
  end
end
function 升级按钮:左键弹起(x, y, msg)
  if 法宝附灵.选中道具 and 法宝附灵.选中道具 ~= 0 then
    发送数据(当前,3818,{x事件="升级",s选中=法宝附灵.选中道具})
  else
    多开数据[当前].__UI弹出.提示框:打开("#Y请选择法宝")
  end
end