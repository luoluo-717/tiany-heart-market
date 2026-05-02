--[[
Author: GGELUA
Date: 2023-11-13 09:00:20
Last Modified by: GGELUA
Last Modified time: 2023-11-14 16:50:57
--]]
--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 18:37:22
--]]
local 技能格子 = class("技能格子")
function 技能格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.文字 = false
  self.当前 = 当前
end
function 技能格子:置数据(数据, w, h, mp)
  self.模型 = nil
  local nsf = require("SDL.图像")(w, h)
  if 数据 then
    if nsf:渲染开始() then
      self.数据 = 取技能信息(数据.名称)
      __res:取图像(__res:取地址("shape/jn/", self.数据[7])):拉伸(w - 5, h - 5):显示(3, 3)
      字体16:置颜色(255, 255, 255)
      local 增加等级 = 0
      if 多开数据[self.当前].角色信息.符石组合 and 多开数据[self.当前].角色信息.符石组合[数据.名称.."符石"] then
        if 多开数据[self.当前].角色信息.符石组合[数据.名称.."符石"].等级 == 1 then
          增加等级 = 2
        elseif 多开数据[self.当前].角色信息.符石组合[数据.名称 .. "符石"].等级 == 2 then
          增加等级 = 4
        elseif 多开数据[self.当前].角色信息.符石组合[数据.名称 .. "符石"].等级 == 3 then
          增加等级 = 6
        end
      end
      local 技能等级 = 数据.等级 + 增加等级
      字体16:取图像(技能等级):显示(27, 37)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  end
end
function 技能格子:更新(dt)
end
function 技能格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
  if self.确定 then
    多开数据[self.当前].__主控.技能选中小:显示(x - 2, y - 2)
  end
end
return 技能格子
