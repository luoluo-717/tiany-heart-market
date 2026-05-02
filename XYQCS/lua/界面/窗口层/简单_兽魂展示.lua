--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-07-19 21:13:25
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-19 21:23:57
FilePath: \XYQCS\lua\界面\窗口层\简单_兽魂展示.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2024-06-09 16:28:48
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2024-06-09 16:36:30
FilePath: \紫禁之巅互通\lua\紫禁之巅界面\窗口层\简单_兽魂展示.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]

local 简单_兽魂展示 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("简单_兽魂展示", 138 + abbr.py.x, 17 + abbr.py.y, 750, 496)

function 简单_兽魂展示:初始化()
  local nsf = require("SDL.图像")(750, 500)
  if nsf["渲染开始"](nsf) then
    置窗口背景("兽魂系统", 0, 12, 750, 500, true)["显示"](置窗口背景("兽魂系统", 0, 12, 750, 500, true), 0, 0)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.模型格子 = __UI模型格子["创建"]()
end


function 简单_兽魂展示:打开(数据)
  self:置可见(true)

  self.技能名称 = {"暴起","雷伤","灵涌","相胜","祈胜"
  ,"千手","疗愈","残忍","激励","附体"
  ,"傀儡","陷足","暴戾","破体","御盾"
  ,"辉耀","沸血","返照","爆裂","破伤"}
  self.技能名称1={}
  for i = 1,20 do 
    self.技能名称1[i]={}
    self.技能名称1[i].名称=self.技能名称[i]
  end 
  self.兽魂技能["重置"]()
end


local 兽魂技能 = 简单_兽魂展示["创建控件"](简单_兽魂展示, "兽魂技能", 17, 108, 700, 372)
function 兽魂技能:初始化()
  local nsf = require("SDL.图像")(700, 372)
  if nsf["渲染开始"](nsf) then
    取白色背景(0, 0, 437, 290, true)["显示"](取白色背景(0, 0, 437, 290, true), 7, 4)
    取白色背景(0, 0, 233, 290, true)["显示"](取白色背景(0, 0, 233, 290, true), 447, 4)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
end
function 兽魂技能:重置()
    简单_兽魂展示["兽魂技能"]["兽魂技能网格"]["置技能"](简单_兽魂展示["兽魂技能"]["兽魂技能网格"], 简单_兽魂展示["技能名称1"])
end
local 兽魂技能网格 = 兽魂技能["创建网格"](兽魂技能, "兽魂技能网格", 20, 10, 437, 275)
function 兽魂技能网格:初始化()
  self:创建格子(190, 61, 10, 10, 10, 2, true)
end
function 兽魂技能网格:左键弹起(x, y, a, b, msg)
    if not self.子控件[a]._spr.模型 then return end

    兽魂技能.技能文本:清空()
    兽魂技能.技能文本:置文本("#R" .. 简单_兽魂展示.技能名称1[a].名称)
    兽魂技能.技能文本:置文本("#K" .. 兽魂技能.兽魂技能网格.子控件[a]._spr.数据[1])

end
function 兽魂技能网格:置技能(数据)
  for i = 1, #兽魂技能网格["子控件"] do
    local lssj = __技能格子2["创建"](当前)
    lssj["置数据"](lssj, 数据[i], 1, 1, 55, 55, 190, 61,true)
    兽魂技能网格["子控件"][i]["置精灵"](兽魂技能网格["子控件"][i], lssj)

  end
end
local 技能文本 = 兽魂技能["创建文本"](兽魂技能, "技能文本", 448+11, 16, 219, 270)
function 技能文本:初始化()
end



local 关闭 = 简单_兽魂展示["创建我的按钮"](简单_兽魂展示, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 705, 0)
function 关闭:左键弹起(x, y, msg)
  简单_兽魂展示["置可见"](简单_兽魂展示, false)
end
