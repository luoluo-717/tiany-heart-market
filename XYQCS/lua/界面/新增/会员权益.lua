--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-11-12 12:24:52
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-11-12 12:28:06
FilePath: \XYQCS\lua\界面\新增\会员权益.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]

local 会员权益 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("会员权益",80+67 + abbr.py.x, 20 + abbr.py.y,696, 492)
local 当前=多开数据.当前
function 会员权益:初始化()
  local nsf = require("SDL.图像")(696, 492)
  if nsf["渲染开始"](nsf) then
      置窗口背景("购买会员", 0, 12, 457,411, true):显示(0, 0)
      __res:取图像(__res:取地址("shape/pic/", 0xbf000009)):显示(10,50) 
      字体16:置颜色(__取颜色("白色"))
      字体16:取图像("开通获得1W仙玉"):显示(60,110)
      字体16:取图像("开通获得3W仙玉"):显示(280,110)
      字体16:置颜色(__取颜色("红色"))
      字体16:取图像("激活挂机"):显示(60,285)
      字体16:取图像("激活副本扫荡"):显示(60,305)
      字体16:取图像("每日领取物品奖励"):显示(60,325)

      字体16:取图像("激活挂机"):显示(280,285)
      字体16:取图像("激活副本扫荡"):显示(280,305)
      字体16:取图像("每日领取物品奖励"):显示(280,325)

  end
  self.允许移动 = true
  self:置精灵(nsf["到精灵"](nsf))
end

function 会员权益:打开(内容)
  self:置可见(true)
  self.消耗=内容.月卡
	self.消耗1=内容.半年卡
  self:sdfsdaa()
end

function 会员权益:sdfsdaa()
 self:重置数据()
end

function 会员权益:重置数据()
  local nsf = require("SDL.图像")(700, 500)
  if nsf["渲染开始"](nsf) then
      字体14["置颜色"](字体14,__取颜色("黑色"))
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf["到精灵"](nsf)
end

local 购买 = 会员权益:创建我的按钮(__res:getPNGCC(1,449,28,174,35,true):置拉伸(90,30),"购买",75,365,"购买")
function 购买:左键弹起(消息,x,y)
    local 事件 = function()
      发送数据(当前,103,{时间=30})
    end
    多开数据[当前].__UI界面.窗口层.文本栏:打开("是否需要花费"..会员权益.消耗.."点卡购买30天会员？", 285, 155, 390, 200, 事件)
end
local 购买1 = 会员权益:创建我的按钮(__res:getPNGCC(1,449,28,174,35,true):置拉伸(90,30),"购买1",296,365,"购买")
function 购买1:左键弹起(消息,x,y)
     local 事件 = function()
      发送数据(当前,103,{时间=180})
    end
    多开数据[当前].__UI界面.窗口层.文本栏:打开("是否需要花费"..会员权益.消耗1.."点卡购买180天会员？", 285, 155, 390, 200, 事件)
end
local 道具网格 = 会员权益["创建网格"](会员权益, "道具网格", 20, 55, 400, 400)
function 道具网格:左键弹起(x, y, a, b, msg)
  if 会员权益["材料位置"] and self.子控件[会员权益["材料位置"]] then
    self.子控件[会员权益["材料位置"]]._spr["确定"] = nil
  end
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
   self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", a)
  end
end
function 道具网格:置物品(data)
  会员权益["材料位置"] = nil
  self:创建格子(65, 85, 0, 0,6, 6)
  for i = 1, #self.子控件 do
    if data[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], nil, "会员权益")
      lssj["置偏移"](lssj, 5, 5)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end

local 关闭 = 会员权益["创建我的按钮"](会员权益, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 430, 0)
function 关闭:左键弹起(x, y, msg)
  会员权益["置可见"](会员权益, false)
end