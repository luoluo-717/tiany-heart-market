local 小技能格子 = class("小技能格子")
function 小技能格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.当前 = 当前

end
function 小技能格子:置数据(数据, w, h, mp,坐骑金额跟)
  self.模型 = nil
  local nsf = require("SDL.图像")(w, h)
  if 数据 then
    if nsf["渲染开始"](nsf) then
      self.数据 = 取技能信息(数据["名称"])
      self.数据.名称=数据["名称"]
      if 坐骑金额跟 then
        self.数据.等级=坐骑金额跟
      end
      __res:getPNGCC(3, 757, 291, 57, 56)["拉伸"](__res:getPNGCC(3, 757, 291, 57, 56), w, h)["显示"](__res:getPNGCC(3, 757, 291, 57, 56)["拉伸"](__res:getPNGCC(3, 757, 291, 57, 56), w, h), 0, 0)
      __res:取图像(__res["取地址"](__res, "shape/jn/", self.数据[7])):拉伸(45, 45):显示(5,5)
      nsf["渲染结束"](nsf)
    end
    self.模型 = nsf["到精灵"](nsf)
  else
    if nsf["渲染开始"](nsf) then
      __res:getPNGCC(3, 757, 291, 57, 56)["拉伸"](__res:getPNGCC(3, 757, 291, 57, 56), w, h)["显示"](__res:getPNGCC(3, 757, 291, 57, 56)["拉伸"](__res:getPNGCC(3, 757, 291, 57, 56), w, h), 0, 0)
      nsf["渲染结束"](nsf)
    end
    self.模型 = nsf["到精灵"](nsf)
  end
end
function 小技能格子:详情打开(x, y, w, h)
  多开数据[self.当前].__UI弹出.技能详情:置可见(true, true)
  多开数据[self.当前].__UI弹出.技能详情.技能文本:清空()
  多开数据[self.当前].__UI弹出.技能详情:打开(self.数据, x - 240, y - 125, 240, 300, self.模型)
end
function 小技能格子:显示(x, y)
  if self.模型 then
    self.模型["显示"](self.模型, x + self.py.x, y + self.py.y)
    if self.确定 then
      多开数据[self.当前].__主控["道具选中小"]["显示"](多开数据[self.当前].__主控["道具选中小"], x, y)
    end
  end
end
return 小技能格子
