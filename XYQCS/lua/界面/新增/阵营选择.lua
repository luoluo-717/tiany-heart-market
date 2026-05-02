--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-11-12 12:24:52
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-11-12 12:28:06
FilePath: \XYQCS\lua\界面\新增\阵营选择.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]

local 阵营选择 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("阵营选择",150 + abbr.py.x, 20 + abbr.py.y,620, 520)
local 当前=多开数据.当前
function 阵营选择:初始化()
  local nsf = require("SDL.图像")(620, 520)
  if nsf["渲染开始"](nsf) then
      置窗口背景("阵营选择", 0, 12, 595,490, true):显示(0, 0)
  end
  self.允许移动 = true
  self:置精灵(nsf["到精灵"](nsf))
end
function 阵营选择:打开(内容)
  self:置可见(true)
  self.四海=内容.四海
  self.覆海=内容.覆海
end


local 快捷按钮组 = {
    {name = "覆海",x = 247,y = 45,tcp = __res:取图像(__res:取地址('shape/slzz/', 0xba000001))}, 
    {name = "四海",x = 10,y = 45,tcp =  __res:取图像(__res:取地址('shape/slzz/', 0xba000002))},
}
for i, v in ipairs(快捷按钮组)  do
    local 临时函数 = 阵营选择:创建我的按钮(v.tcp, v.name, v.x, v.y)
    function 临时函数:左键弹起(x, y)
        if not 多开数据[当前].__主控.战斗中 then
            if v.name == "四海" then
                local 事件 = function()
              	发送数据(当前,219,{序号1=1,选中=1})
            end
                多开数据[当前].__UI界面.窗口层.文本栏:打开("确认要加入四海龙宫吗？", 285, 155, 390, 200, 事件)
            elseif v.name == "覆海" then
              	local 事件 = function()
              	发送数据(当前,219,{序号1=1,选中=2})
            end
                多开数据[当前].__UI界面.窗口层.文本栏:打开("确认要加入覆海帮吗？", 285, 155, 390, 200, 事件)
            end
        end
    end
end



local 关闭 = 阵营选择["创建我的按钮"](阵营选择, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 565, 0)
function 关闭:左键弹起(x, y, msg)
  阵营选择["置可见"](阵营选择, false)
end
