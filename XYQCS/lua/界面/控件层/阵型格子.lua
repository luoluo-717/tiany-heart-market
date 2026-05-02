local 阵型格子 = class("阵型格子")
function 阵型格子:初始化()
end
function 阵型格子:置数据(name)
  local nsf = require("SDL.图像")(184, 55)
  if nsf:渲染开始() then
    __res:getPNGCC(3, 1040, 201, 149, 37, true):拉伸(184, 55):显示(0, 0)
    local tsf = 字体20:置颜色(255, 255, 255, 255):取图像(name)
    tsf:显示((184 - tsf.宽度) // 2, (55 - tsf.高度) // 2)
    nsf:渲染结束()
  end
  self.图像 = nsf:到精灵()
  nsf = require("SDL.图像")(184, 55)
  if nsf:渲染开始() then
    __res:getPNGCC(3, 1039, 160, 148, 36, true):拉伸(184, 55):显示(0, 0)
    local tsf = 字体20:置颜色(255, 255, 255, 255):取图像(name)
    tsf:显示((184 - tsf.宽度) // 2, (55 - tsf.高度) // 2)
    nsf:渲染结束()
  end
  self.图像2 = nsf:到精灵()
end
function 阵型格子:显示(x, y)
  if self.图像 and not self.确定 then
    self.图像:显示( x, y)
  end
  if self.图像2 and self.确定 then
    self.图像2:显示( x, y)
  end
end
return 阵型格子
