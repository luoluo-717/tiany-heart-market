local 头像选择格子 = class("头像选择格子")
function 头像选择格子:初始化()
  self.py = {x = 0, y = 0}
end
function 头像选择格子:置头像(数据)
  local nsf = require("SDL.图像")(50, 50)
  if 数据 then
    if nsf:渲染开始() then
      __res:getPNGCC(3, 1091, 374, 49, 49)["显示"](__res:getPNGCC(3, 1091, 374, 49, 49), 0, 0)
      local lssj = 取头像(数据["模型"])
      if 0 == lssj[2] then
        lssj[2] = lssj[1]
      end
      __res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2]))["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2])), 44, 44)["显示"](__res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2]))["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2])), 44, 44), 2, 2)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  else
    if nsf:渲染开始() then
      __res:getPNGCC(3, 1091, 374, 49, 49)["显示"](__res:getPNGCC(3, 1091, 374, 49, 49), 0, 0)
      __res:getPNGCC(3, 777, 550, 45, 46)["显示"](__res:getPNGCC(3, 777, 550, 45, 46), 2, 2)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  end
  self.数据 = 数据
end
function 头像选择格子:更新(dt)
end
function 头像选择格子:显示(x, y)
  if self.模型 then
    self.模型["显示"](self.模型, x + self.py.x, y + self.py.y)
  end
end
return 头像选择格子
