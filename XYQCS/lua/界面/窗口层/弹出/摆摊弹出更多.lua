--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-07-17 20:46:09
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-20 17:26:37
FilePath: \XYQCS\lua\界面\窗口层\弹出\摆摊弹出更多.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
-- __UI弹出["摆摊弹出更多"] = __UI界面["创建弹出窗口"](__UI界面, "摆摊弹出更多", 327 + abbr.py.x, 284-30-119 + abbr.py.y, 150, 192+64+59)
多开数据[多开数据.当前].__UI弹出.摆摊弹出更多 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("摆摊弹出更多", 523+ abbr.py.x, 284-30-119 + abbr.py.y+130+57, 150, 135)----背景坐标
local 摆摊弹出更多 = 多开数据[多开数据.当前].__UI弹出.摆摊弹出更多
local 当前 = 多开数据.当前

function 摆摊弹出更多:初始化()
  self:置精灵(取黑色背景(0, 0, 150, 135))
end
function 摆摊弹出更多:打开(lx)
  if self.是否可见 then
    self:置可见(false)
  else
    self:置可见(true)
  end
end
local lsan = {
  "摆 摊",
  "收 购",
}

for i = 1, #lsan do
  local 临时函数 = 摆摊弹出更多["创建我的按钮"](摆摊弹出更多, __res:getPNGCC(2, 368, 906, 126, 52, true), lsan[i], 12, 11 + (i - 1) * 60, lsan[i])
  function  临时函数:左键弹起(x, y, msg)
    if "摆 摊" == lsan[i] then
          发送数据(当前 or self and self.当前, 3720)
    elseif "收 购" == lsan[i] then
          发送数据(当前 or self and self.当前, 3720.1)
      
    end
    摆摊弹出更多["置可见"](摆摊弹出更多, false)
  end
end