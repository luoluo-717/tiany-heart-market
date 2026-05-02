
local 技能格子2 = class("技能格子2")
function 技能格子2:初始化(当前)
  self.py = {x = 0, y = 0}
  self.当前=当前
end
function 技能格子2:置数据(数据, x, y, w, h, w2, h2, mc, dj)
  self.模型 = nil
  self.数据 = nil
  local nsf = require("SDL.图像")(w2, h2)
  if 数据 then
    if nsf:渲染开始() then
      self.数据 = 取技能信息(数据.名称)
      self.数据.名称 = 数据.名称
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(w2, h2):显示(0, 0)
      __res:取图像(__res:取地址("shape/jn/", self.数据[7])):拉伸(w, h):显示(x, y)
      if mc then
        字体20:置颜色(39, 53, 81)
        字体20:取图像(数据.名称):显示(x + w + 10, 10)
        if dj then
          字体20:取图像(数据.等级):显示(x + w + 10, 30)
        end
      end
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  end
end
function 技能格子2:详情打开(x, y, w, h)
 多开数据[当前 or self and self.当前].__UI弹出.技能详情:置可见( true, true)
 多开数据[当前 or self and self.当前].__UI弹出.技能详情.技能文本:清空(_)
 多开数据[当前 or self and self.当前].__UI弹出.技能详情:打开(self.数据, x - 300, y - 150, 300, 300, self.模型)
end
function 技能格子2:更新(dt)
end
function 技能格子2:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
  if self.确定 then
    多开数据[self.当前].__主控.技能选中大:显示(x, y)
  elseif self.确定1 then
    多开数据[self.当前].__主控.技能选中大2:显示(x, y)
  end
end
return 技能格子2
