--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-07-20 19:53:05
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-20 19:55:23
FilePath: \XYQCS\lua\界面\弹出\符石道具选择.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
-- __UI弹出["符石道具选择"] = __UI界面["创建弹出窗口"](__UI界面, "符石道具选择", 0, 0, 356, 350)
多开数据[多开数据.当前].__UI弹出.符石道具选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("符石道具选择",0,0,356,350)
local 符石道具选择 = 多开数据[多开数据.当前].__UI弹出.符石道具选择
local 当前 = 多开数据.当前

function 符石道具选择:初始化()
  local nsf = require("SDL.图像")(356, 350)
  if nsf["渲染开始"](nsf) then
    取黑透明背景(0, 0, 356, 350, true)["显示"](取黑透明背景(0, 0, 356, 350, true), 0, 0)
    __res:getPNGCC(3, 694, 4, 338, 273)["显示"](__res:getPNGCC(3, 694, 4, 338, 273), 10, 14)
    字体18["置颜色"](字体18, __取颜色("黄色"))
    字体18["取图像"](字体18, "请选择一个需要添加的符石")["显示"](字体18["取图像"](字体18, "请选择一个需要添加的符石"), 10, 307)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.选中道具 = nil
end
function 符石道具选择:打开(lx, pid)
  self:置可见(true)
  self.道具网格["置物品"](self.道具网格, 多开数据[多开数据.当前].__主控["道具列表"])
  self:置坐标(497 + abbr.py2.x, 165 + abbr.py2.y) 
  self.类型 = lx
  self.选中道具 = nil
  self.道具 = 多开数据[多开数据.当前].__主控["道具列表"]
  self.pid = pid
end
local 道具网格 = 符石道具选择["创建网格"](符石道具选择, "道具网格", 10, 14, 339, 272)
function 道具网格:初始化()
  self:创建格子(67, 67, 0, 0, 4, 5)
end
function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品禁止"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    if 符石道具选择["选中道具"] and self.子控件[符石道具选择["选中道具"]]._spr["物品"] then
      self.子控件[符石道具选择["选中道具"]]._spr["确定"] = nil
    end
    符石道具选择["选中道具"] = a
    self.子控件[a]._spr["确定"] = true
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170-95, 86, w, h, "选择", a)
  end
end
function 道具网格:置物品(data, zl, fl)
  for i = 1, #self.子控件 do
    if data[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], nil, "道具选择")
      lssj["置偏移"](lssj, 10, 10)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end
local 添加 = 符石道具选择["创建我的按钮"](符石道具选择, __res:getPNGCC(3, 126, 563, 111, 36, true), "添加", 229, 300, "添加")
function 添加:左键弹起(x, y, msg)
  local  xuanz=符石道具选择["选中道具"]
  if xuanz and 符石道具选择["道具"][xuanz] then
    -- print(符石道具选择["道具"][xuanz]["总类"] , 符石道具选择["道具"][xuanz].分类  , 符石道具选择["道具"][xuanz]["级别限制"])
    if 符石道具选择["类型"] == "符石" and 889 == 符石道具选择["道具"][xuanz]["总类"] and 符石道具选择["道具"][xuanz].分类 == 88 and 符石道具选择["道具"][xuanz]["子类"] < 4 then
      多开数据[多开数据.当前].__UI界面["窗口层"]["符石镶嵌"]:新增符石(符石道具选择["道具"][xuanz],xuanz,符石道具选择["类型"])
      符石道具选择["置可见"](符石道具选择, false)
    elseif 符石道具选择["类型"] == "星石" and 889 == 符石道具选择["道具"][xuanz]["总类"] and 符石道具选择["道具"][xuanz].分类 == 91 then
      多开数据[多开数据.当前].__UI界面["窗口层"]["符石镶嵌"]:新增符石(符石道具选择["道具"][xuanz],xuanz,符石道具选择["类型"])
      符石道具选择["置可见"](符石道具选择, false)
    else
      多开数据[多开数据.当前].__UI弹出["提示框"]["打开"](多开数据[多开数据.当前].__UI弹出["提示框"], "#Y请选择正确的符石")
    end
  end
end
