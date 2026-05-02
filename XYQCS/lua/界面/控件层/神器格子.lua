local 基类 = require("界面/控件层/基类/物品基类")
local 神器格子 = class("神器格子", 基类)
function 神器格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.当前 = 当前
end
function 神器格子:置物品(数据)
  self.模型 = nil
  self.物品 = nil
  local nsf = require("SDL.图像")(70, 70)
  if 数据 then
    if not 判断是否为空表(数据) then
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
        __res:取图像(__res:取地址("shape/ui/xz/", 0x01AC0109)):显示(0,0)
        __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(8,8)
        nsf:渲染结束()
      end
    else
      if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/xz/", 0x01AC0109)):显示(0,0)
        nsf:渲染结束()
      end
    end
    self.模型 = nsf:到精灵()
  else
    if nsf:渲染开始() then
      __res:取图像(__res:取地址("shape/ui/xz/", 0x01AC0110)):显示(0,0)
      nsf:渲染结束()
    end
    self.模型 = nsf:到精灵()
  end
  self.数据 = 数据
end
function 神器格子:更新(dt)
end
function 神器格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
end


return 神器格子
