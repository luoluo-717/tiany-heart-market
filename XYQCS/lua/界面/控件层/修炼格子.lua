local 修炼格子 = class("修炼格子")
function 修炼格子:初始化()
  self.py = {x = 0, y = 0}
end
function 修炼格子:置数据(数据, w, h)
  self.模型 = nil
  local nsf = require("SDL.图像")(w, h)
  if 数据 then
    if nsf:渲染开始() then
      self.数据 = 取技能信息(数据.名称)
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
function 修炼格子:更新(dt)
end
function 修炼格子:显示(x, y)
  if self.模型 then
    self.模型["显示"](self.模型, x + self.py.x, y + self.py.y)
  end
end
return 修炼格子
