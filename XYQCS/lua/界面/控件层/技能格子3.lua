
local 技能格子3 = class("技能格子3")
function 技能格子3:初始化(当前)
  self.当前=当前
  self.py = {x = 0, y = 0}
end
function 技能格子3:置数据(数据, w, h, mp)
  self.模型 = nil
  local nsf = require("SDL.图像")(w, h)
  if 数据 then
    if nsf:渲染开始() then
      self.数据 = 取技能信息(数据.名称)
      self.数据.名称=数据.名称
      __res:getPNGCC(3, 757, 291, 57, 56):拉伸(w, h):显示(0, 0)
      __res:取图像(__res:取地址("shape/jn/", self.数据[7])):拉伸(w - 5, h - 5):显示(2, 2)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  else
    if nsf:渲染开始() then
      __res:getPNGCC(3, 757, 291, 57, 56):拉伸(w, h):显示(0, 0)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  end
end
function 技能格子3:更新(dt)
end
function 技能格子3:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
end

function 技能格子3:详情打开(x, y, w, h)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情:置可见( true, true)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情.技能文本:清空(_)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情:打开(self.数据, x , y - 150, 300, 200, self.模型)
end
return 技能格子3
