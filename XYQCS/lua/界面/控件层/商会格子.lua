--[[
Author: GGELUA
Date: 2023-12-25 09:32:26
Last Modified by: GGELUA
Last Modified time: 2024-01-03 14:50:28
--]]
--[[
Author: GGELUA
Date: 2023-12-25 09:32:26
Last Modified by: GGELUA
Last Modified time: 2023-12-29 15:05:48
--]]
--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 18:38:20
--]]
local 基类 = require("界面/控件层/基类/物品基类")
local 商会格子 = class("商会格子", 基类)
function 商会格子:初始化(当前)
  self.当前=当前
end
function 商会格子:置物品(数据, lx)
  if "商会" == lx then
    local nsf = require("SDL.图像")(270, 68)
    local 返回值 = 取同名物品(数据.名称, 数据.子类, 数据.类型, 数据.等级)
    if not 判断是否为空表(返回值) then
      数据.资源 = 返回值[5] or 返回值[1]
      数据.小模型资源 = 返回值[2]
      if 返回值[5] then
        数据.url = 返回值[1]
        数据.小模型资源 = 返回值[4]
      end
      数据.大模型资源 = 返回值[3]
      if 返回值[6] then
        数据.pyz = 返回值[6] --动态
      end
    end
    if nsf:渲染开始() then
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(270, 68):显示(0, 0)
      字体18:置颜色(__取颜色("黑色"))
      字体18:取图像(数据.编号 .. "/" .. 数据.名称):显示(15, 27)
      字体18:取图像(10):显示(175, 27)
      字体18:取图像("综合店"):显示(207, 27)
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "商会召唤兽" == lx then
    local nsf = require("SDL.图像")(173, 64)
    if nsf:渲染开始() then
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(173, 64):显示(0, 0)
      字体18:置颜色(__取颜色("黑色"))
      字体18:取图像(数据.模型.."     "..数据.种类):显示(10, 18)
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  end
  self.数据 = 数据
end
function 商会格子:显示(x, y)
  if self.精灵 then
    self.精灵["显示"](self.精灵, x, y)
  end
  if self.确定 and self.格子类型 == "商会" then
    多开数据[self.当前].__主控.商会选中:显示(x, y)
  elseif self.确定 and self.格子类型 == "商会召唤兽" then
    多开数据[self.当前].__主控.商会召唤兽选中:显示(x, y)
  end
end
return 商会格子
