--[[
Author: GGELUA
Date: 2023-11-08 21:33:34
Last Modified by: GGELUA
Last Modified time: 2023-11-09 11:14:06
--]]
local 特性格子 = class("特性格子")
function 特性格子:初始化(当前)
  self.当前 = 当前
  self.py = { x = 0, y = 0 }
  self.文字 = false
end

function 特性格子:置数据(数据, w, h)
  self.数据 = nil
  self.模型 = nil
  self.图像 = nil
  if 数据.特性 and 数据.特性 ~= "无" then
    self.数据 = {}
    self.数据.说明 = 取特性(数据)
    self.数据.名称 = 数据.特性
    self.数据.类型 = "召唤兽特性"
    local nsf = require("SDL.图像")(w, h)
    if nsf:渲染开始() then
      __res:取图像(__res:取地址("shape/ui/zhs/", 669142266)):拉伸(122, 102):显示(4, 0)
      字体25:置颜色(252, 252, 8)
      字体25:取图像("特性"):显示(50, 35)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  else
    local nsf = require("SDL.图像")(w, h)
    if nsf:渲染开始() then
      __res:取图像(__res:取地址("shape/ui/zhs/", 2948784481)):拉伸(126, 102):显示(0, 0)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  end
end

function 特性格子:详情打开(x, y, w, h)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情:置可见(true, true)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情.技能文本:清空(_)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情:打开(self.数据, x - 240, y - 125, 240, 300)
end

function 特性格子:更新(dt)
end

function 特性格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
end

return 特性格子
