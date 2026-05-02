
local 赐福bb格子 = class("赐福bb格子")
function 赐福bb格子:初始化()
  self.py = {x = 0, y = 0}
  self.文字 = false
  self.xuanz= __res.UI素材[7]:复制区域(484, 0, 154, 51):到精灵()
end
function 赐福bb格子:置头像(数据)
  local nsf = require("SDL.图像")(198, 57)
  self.模型 = nil
  self.数据 = nil
  if 数据 then
    if nsf:渲染开始() then
      __res:getPNGCC(7, 984, 0, 47, 47):显示(0, 0)
      local lssj = 取头像(数据.模型)
      if 0 == lssj[2] then
        lssj[2] = lssj[1]
      end
      __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(35, 35):显示(6, 6)
      if 数据.名称 and 数据.等级 then
        字体14:置颜色(159,33,51)
        字体14:取图像(数据.名称):显示(75-21, 4)
        字体14:取图像(数据.等级.. "级"):显示(75-21, 25)
      end
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
    self.数据 = 数据
  end
end
function 赐福bb格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
  if self.确定 then
    self.xuanz:显示(x + self.py.x, y + self.py.y)
  end
end
return 赐福bb格子
