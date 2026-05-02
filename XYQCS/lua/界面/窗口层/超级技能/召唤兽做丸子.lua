-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2024-07-12 20:59:02
-- @Last Modified time  : 2024-07-12 23:53:35
local 召唤兽做丸子 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("召唤兽做丸子", 179 + abbr.py.x, 5 + abbr.py.y, 738, 520)
local 当前 = 多开数据.当前
function 召唤兽做丸子:初始化()
  local nsf = require("SDL.图像")(730, 520)
  if nsf:渲染开始() then
    置窗口背景("制作丸子 ", 0, 12, 730, 506, true):显示(0, 0)
    local lssc = 取白色背景(0, 0, 308, 188, true)
    lssc:显示(18, 50)
    lssc:显示(399, 50)
    字体18:置颜色(39, 53, 81)
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
end
function 召唤兽做丸子:打开(数据)
  self:置可见(true)
  self.刷新(self)
  self.道具 = 数据.道具
  self.材料网格1:置物品(nil)
  self.材料网格2:置物品(nil)
end
function 召唤兽做丸子:刷新()

end


local 材料网格1 = 召唤兽做丸子:创建网格("材料网格1",  50, 55, 50, 50)
function 材料网格1:初始化()
  self:创建格子(55, 55, 0, 0, 1, 1)
end

function 材料网格1:左键弹起(x, y, a, b, msg)
  多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(召唤兽做丸子.道具, 235 + 120, 58, "做丸子1")
end

function 材料网格1:置物品(数据, bh)
  local lssj = __材料格子.创建(当前)
  lssj:置物品(数据)
  材料网格1.子控件[1]:置精灵(lssj)
  材料网格1.子控件[1]._spr.原始编号 = bh
end

local 材料网格2 = 召唤兽做丸子:创建网格("材料网格2",  420, 55, 50, 50)
function 材料网格2:初始化()
  self:创建格子(55, 55, 0, 0, 1, 1)
end

function 材料网格2:左键弹起(x, y, a, b, msg)
  多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(召唤兽做丸子.道具, 235 + 120, 58, "做丸子2")
end

function 材料网格2:置物品(数据, bh)
  local lssj = __材料格子.创建(当前)
  lssj:置物品(数据)
  材料网格2.子控件[1]:置精灵(lssj)
  材料网格2.子控件[1]._spr.原始编号 = bh
end

local 关闭 = 召唤兽做丸子:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 688, 0)
function 关闭:左键弹起(x, y, msg)
  召唤兽做丸子:置可见(false)
end
local 合成按钮 = 召唤兽做丸子:创建我的按钮(__res:getPNGCC(3, 1075, 257, 107, 107), "合成按钮", 308, 199)
function 合成按钮:左键弹起(x, y, msg)
  发送数据(当前 or self and self.当前, 3900, { 材料1 = 召唤兽做丸子.材料网格1.子控件[1]._spr.原始编号, 材料2 = 召唤兽做丸子.材料网格2.子控件[1]._spr.原始编号})
end
