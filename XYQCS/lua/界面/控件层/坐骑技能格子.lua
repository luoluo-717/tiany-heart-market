--[[
    @Author       : GGELUA
    @Date         : 2022-10-31 22:57:27
Last Modified by: GGELUA
Last Modified time: 2023-07-10 13:09:31
--]]
local 坐骑技能格子 = class("坐骑技能格子")
function 坐骑技能格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.文字 = false
  self.当前=当前
end
function 坐骑技能格子:置数据(数据, w, h, lx, 认证)
  self.数据 = nil
  self.模型 = nil
  self.图像 = nil
  if 数据 then
    self.数据 = 取技能信息(数据.名称)
    self.数据.名称 = 数据.名称
    self.数据.类型 = "坐骑技能"
    self.数据.等级 = 数据.等级 or 3
    self.图像 = __res:取图像(__res:取地址("shape/jn/", self.数据[7])):拉伸(w, h)
    local nsf = require("SDL.图像")(w, h)
    if nsf:渲染开始() then
      self.图像:显示(0, 0)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  else
    self.模型 = __res:getPNGCC(3, 757, 291, 57, 56):拉伸(w, h):到精灵(w, h)
  end
end
function 坐骑技能格子:详情打开(x, y, w, h)
 多开数据[当前 or self and self.当前].__UI弹出.技能详情:置可见(true, true)
 多开数据[当前 or self and self.当前].__UI弹出.技能详情.技能文本:清空()
 多开数据[当前 or self and self.当前].__UI弹出.技能详情:打开(self.数据, x - 240, y - 125, 240, 300, self.图像)
end
function 坐骑技能格子:更新(dt)
end
function 坐骑技能格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
  if self.确定 then
    多开数据[self.当前].__主控.技能选中小2:显示(x + self.py.x, y + self.py.y)
  end
end
return 坐骑技能格子
