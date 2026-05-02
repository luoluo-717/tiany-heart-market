--[[
Author: GGELUA
Date: 2023-12-25 09:32:26
Last Modified by: GGELUA
Last Modified time: 2024-01-03 14:51:38
--]]
--[[
Author: GGELUA
Date: 2023-11-08 21:33:34
Last Modified by: GGELUA
Last Modified time: 2023-11-09 11:04:47
--]]
local 基类 = require("界面/控件层/基类/物品基类")
local 材料格子 = class("材料格子", 基类)
function 材料格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.当前 = 当前
end
function 材料格子:置物品(数据)
  self.模型 = nil
  self.物品 = nil
  local nsf = require("SDL.图像")(55, 55)
  if 数据 then
    self:取数据(数据)
    local 返回值 = 取同名物品(self.物品.名称, self.物品.子类, self.物品.类型, self.物品.等级)
    if not 判断是否为空表(返回值) then
      self.物品.资源 = 返回值[5] or 返回值[1]
      self.物品.小模型资源 = 返回值[2]
      if 返回值[5] then
        self.物品.url = 返回值[1]
        self.物品.小模型资源 = 返回值[4]
      end
      self.物品.大模型资源 = 返回值[3]
      if 返回值[6] then
        self.物品.pyz = 返回值[6] --动态
      end
    end
    if nsf:渲染开始() then
      __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
      __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  else
    if nsf:渲染开始() then
      __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
      __res:getPNGCC(3, 777, 550, 45, 46):显示(4, 4)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  end
  self.数据 = 数据
end
function 材料格子:更新(dt)
end
function 材料格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
  if self.确定 then
    多开数据[self.当前].__主控.道具选中小:显示(x, y)
  end
end

function 材料格子:详情打开(x, y, w, h, lx, bh)
 多开数据[当前 or self and self.当前].__UI弹出.道具详情:置可见(true, true)
 多开数据[当前 or self and self.当前].__UI弹出.道具详情.道具文本:清空()
 多开数据[当前 or self and self.当前].__UI弹出.道具详情:打开(self.物品, x, y, 360, 360, Button, Button2, Button3, Button4, bh, lx)
end


return 材料格子
