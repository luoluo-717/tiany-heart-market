--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-14 01:44:53
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-08-14 07:13:04
FilePath: \XYQCS\lua\界面\助战窗口\助战更多属性弹出.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
多开数据[多开数据.当前].__UI弹出["助战更多属性弹出"] = 多开数据[多开数据.当前].__UI界面["创建弹出窗口"](多开数据[多开数据.当前].__UI界面, "助战更多属性弹出", 323 + abbr.py.x, 70 + abbr.py.y, 320, 410)
local 当前 =  多开数据.当前
local 助战更多属性弹出 = 多开数据[多开数据.当前].__UI弹出["助战更多属性弹出"]
function 助战更多属性弹出:初始化()
  self:置精灵(取灰色背景(0, 0, 320, 410):置透明(230))
end
function 助战更多属性弹出:打开(内容)
  if self.是否可见 then
    self:置可见(false)
  else
    self:置可见(true)
  end
  self.shux=内容
  if self.shux.等级==0 then
    self.shux.等级=1
  end
  self.更多属性列表:重置22()
end
local 更多属性列表 = 助战更多属性弹出["创建列表"](助战更多属性弹出, "更多属性列表", 10, 5, 320, 410)
function 更多属性列表:初始化()
  self:置文字(字体18)
  self.选中精灵 = nil
  self.焦点精灵 = nil
  self.行高度 = self.行高度 + 9
end
function 更多属性列表:重置22()
  self.清空(self)
  local sxxx = {
    "灵力",
    "物理暴击等级",
    "穿刺等级",
    "狂暴等级",
    "法术暴击等级",
    "法术伤害结果",
    "封印命中等级",
    "固定伤害",
    "治疗能力",
    "抗物理暴击等级",
    "格挡值",
    "抗法术暴击等级",
    "抵抗封印等级",
    "气血回复效果",
    "躲避"
  }
  self:置颜色(255, 255, 255)
  for i = 1, #sxxx do
    self.添加(self)
    local nsf = require("SDL.图像")(340, 23)
    if nsf["渲染开始"](nsf) then
      local lssj = 取输入背景(0, 0, 150, 23)
      lssj["显示"](lssj, 148, 0)
      字体18["置颜色"](字体18, 255, 255, 255)
      字体18["取图像"](字体18, sxxx[i])["置混合"](字体18["取图像"](字体18, sxxx[i]), 0)["显示"](字体18["取图像"](字体18, sxxx[i])["置混合"](字体18["取图像"](字体18, sxxx[i]), 0), 0, 0)
      字体18["置颜色"](字体18, 39, 53, 81)
      if sxxx[i] == "物理暴击等级" or sxxx[i] == "法术暴击等级" then
        字体18:取图像(助战更多属性弹出.shux[sxxx[i]].."("..string.format("%.2f",助战更多属性弹出.shux[sxxx[i]]*10/助战更多属性弹出.shux.等级).."%)"):显示(159, 0)
        -- 字体18:取图像(string.format("%s(+%s%s", 助战更多属性弹出.shux[sxxx[i]], 助战更多属性弹出.shux[sxxx[i]] * 0.05, "%)")):显示(159, 0)
      elseif sxxx[i] == "封印命中等级" then
        字体18:取图像(助战更多属性弹出.shux[sxxx[i]].."("..string.format("%.2f",助战更多属性弹出.shux[sxxx[i]]*10/(助战更多属性弹出.shux.等级+25)).."%)"):显示(159, 0)
      elseif sxxx[i] == "穿刺等级" then
        字体18:取图像(助战更多属性弹出.shux[sxxx[i]].."("..string.format("%.2f",助战更多属性弹出.shux[sxxx[i]]*0.0017).."%)"):显示(159, 0)
      elseif sxxx[i] == "狂暴等级" then
        字体18:取图像(助战更多属性弹出.shux[sxxx[i]].."("..string.format("%.2f",助战更多属性弹出.shux[sxxx[i]]*0.005).."%)"):显示(159, 0)
      else
        字体18:取图像(助战更多属性弹出.shux[sxxx[i]]):显示(159, 0)
      end

      -- 字体18:取图像(string.format("%s(+%s%s", 助战更多属性弹出.shux[sxxx[i]], 助战更多属性弹出.shux[sxxx[i]] * 0.05, "%)")):显示(159, 0)
      nsf["渲染结束"](nsf)
    end
    self.子控件[i]["置精灵"](self.子控件[i], nsf["到精灵"](nsf))
  end
end