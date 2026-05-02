--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-11-03 21:28:15
FilePath: \XYQCS\lua\界面\窗口层\弹出\道具弹出更多.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-09-26 16:39:09
FilePath: \XYQCS\lua\界面\窗口层\弹出\道具弹出更多.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-07-17 20:46:09
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-20 17:26:37
FilePath: \XYQCS\lua\界面\窗口层\弹出\道具弹出更多.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
-- __UI弹出["道具弹出更多"] = __UI界面["创建弹出窗口"](__UI界面, "道具弹出更多", 327 + abbr.py.x, 284-30-119 + abbr.py.y, 150, 192+64+59)
多开数据[多开数据.当前].__UI弹出.道具弹出更多 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("道具弹出更多", 385+ abbr.py.x, 284-30-119 + abbr.py.y, 150, 192+64+59)----背景坐标
local 道具弹出更多 = 多开数据[多开数据.当前].__UI弹出.道具弹出更多
local 当前 = 多开数据.当前

function 道具弹出更多:初始化()
  self:置精灵(取黑色背景(0, 0, 150, 192+64+59))
end
function 道具弹出更多:打开(lx)
  if self.是否可见 then
    self:置可见(false)
  else
    self:置可见(true)
  end
end
local lsan = {
  "临时包裹",
  "仓 库",
  -- "整 理",
  "打 造",
  "道具回收",
  "一键附魔"
}

for i = 1, #lsan do
  local 临时函数 = 道具弹出更多["创建我的按钮"](道具弹出更多, __res:getPNGCC(2, 368, 906, 126, 52, true), lsan[i], 12, 11 + (i - 1) * 60, lsan[i])
  function  临时函数:左键弹起(x, y, msg)
    if "临时包裹" == lsan[i] then
      发送数据(当前,3749,{方式="索取"})
    elseif "仓 库" == lsan[i] then
        if 多开数据[当前].__UI界面.窗口层.仓库.是否可见 then
            多开数据[当前].__UI界面.窗口层.仓库:置可见(false)
        else
            发送数据(当前 or self and self.当前, 6701)
        end

    elseif "道具回收" == lsan[i] then
          发送数据(当前,179.1,{数据序列=10})
    elseif "一键附魔" == lsan[i] then
        local 事件 = function()
          发送数据(当前,179)
        end
        local wb = "一键附魔需要消耗5000W,强化符等级均为186级,确定要附魔吗？"
        多开数据[多开数据.当前].__UI界面.窗口层.文本栏.打开(多开数据[多开数据.当前].__UI界面.窗口层.文本栏, wb, 285, 155, 390, 200, 事件)
    elseif "打 造" == lsan[i] then
        if 多开数据[当前].__UI界面.窗口层.打造.是否可见 then
            多开数据[当前].__UI界面.窗口层.打造:置可见(false)
        else
            发送数据(当前,53)
        end
    -- elseif "整 理" == lsan[i] then
    --   if 多开数据[多开数据.当前].__UI界面["窗口层"]["道具行囊"]["是否可见"] then 
    --     if 多开数据[多开数据.当前].__UI界面["窗口层"]["道具行囊"]["包裹类型"]=="行囊" then 
    --       发送数据(当前,3815,{类型="整理行囊"})
    --     else
    --       发送数据(当前,3815,{类型="整理道具"})
    --     end
    --   end
    end
    道具弹出更多["置可见"](道具弹出更多, false)
  end
end