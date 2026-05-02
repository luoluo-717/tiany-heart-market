local 头像格子2 = class("头像格子2")
function 头像格子2:初始化()
  self.py = {x = 0, y = 0}
  self.文字 = false
end
function 头像格子2:置头像(数据)
  local nsf = require("SDL.图像")(198, 57)
  self.模型 = nil
  self.数据 = nil
  if 数据 then
    if nsf:渲染开始() then
      __res:getPNGCC(3, 851, 539, 198, 57)["显示"](__res:getPNGCC(3, 851, 539, 198, 57), 0, 0)
      __res:getPNGCC(3, 1091, 374, 49, 49)["显示"](__res:getPNGCC(3, 1091, 374, 49, 49), 16, 4)
      local lssj = 取头像(数据["模型"])
      if 0 == lssj[2] then
        lssj[2] = lssj[1]
      end
      __res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2]))["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2])), 44, 44)["显示"](__res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2]))["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2])), 44, 44), 19, 7)
      字体18["置颜色"](字体18, 255, 255, 255)
      字体18["取图像"](字体18, 数据["名称"])["显示"](字体18["取图像"](字体18, 数据["名称"]), 75, 7)
      字体18["取图像"](字体18, 数据["等级"] .. "级")["显示"](字体18["取图像"](字体18, 数据["等级"] .. "级"), 75, 32)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
    self.数据 = 数据
  end
end
function 头像格子2:显示(x, y)
  if self.模型 then
    self.模型["显示"](self.模型, x + self.py.x, y + self.py.y)
  end
end
return 头像格子2
