local was格子 = class("was格子")
function was格子:初始化()
end
function was格子:置数据(name,tcp)
  local nsf = __res:get(tcp):取图像(1)
  if nsf:渲染开始() then
    local tsf = 字体20:置颜色(255, 255, 255, 255):取图像(name)
    tsf:显示((184 - tsf.宽度) // 2, (55 - tsf.高度) // 2)
    nsf:渲染结束()
  end
  self.图像 = nsf:到精灵()
  nsf = __res:get(tcp):取图像(4)
  if nsf:渲染开始() then
    local tsf = 字体20:置颜色(255, 255, 255, 255):取图像(name)
    tsf:显示((184 - tsf.宽度) // 2, (55 - tsf.高度) // 2)
    nsf:渲染结束()
  end
  self.图像2 = nsf:到精灵()
end
function was格子:显示(x, y)
  if self.图像 and not self.确定 then
    self.图像:显示( x, y)
  end
  if self.图像2 and self.确定 then
    self.图像2:显示( x, y)
  end
end
return was格子
