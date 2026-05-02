--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-12-23 13:13:35
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2026-01-06 15:12:14
FilePath: \XYQCS\lua\界面\助战窗口\助战bb格子.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
local 助战bb格子 = class("助战bb格子")
function 助战bb格子:初始化()
  self.py = {x = 0, y = 0}
  self.文字 = false
  self.xuanz= __res["UI素材"][7]:复制区域(484, 0, 154, 51):到精灵()
end
function 助战bb格子:置头像(数据)
  local nsf = require("SDL.图像")(198, 57)
  self.模型 = nil
  self.数据 = nil
  if 数据 then
    if nsf["渲染开始"](nsf) then
      __res:getPNGCC(3,683,284,73,73):拉伸(45,45):显示(0, 0)
      local lssj = 取头像(数据["模型"])
      if 0 == lssj[2] then
        lssj[2] = lssj[1]
      end
      __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(35, 35):显示(6, 6)
      if 数据["名称"] and 数据["等级"] then
        -- 字体14["置颜色"](字体14, 159,33,51)
        字体14:置颜色(__取颜色("浅黑"))
        字体14["取图像"](字体14, 数据["名称"])["显示"](字体14["取图像"](字体14, 数据["名称"]), 75-21, 4)
        字体14["取图像"](字体14, 数据["等级"] .. "级")["显示"](字体14["取图像"](字体14, 数据["等级"] .. "级"), 75-21, 25)
      end
      nsf["渲染结束"](nsf)
    end
    self.模型 = nsf["到精灵"](nsf)
    self.数据 = 数据
  end
end
function 助战bb格子:显示(x, y)
  if self.模型 then
    self.模型["显示"](self.模型, x + self.py.x, y + self.py.y)
  end
  if self.确定 then
    self.xuanz["显示"](self.xuanz, x + self.py.x, y + self.py.y)
  end
end
return 助战bb格子
