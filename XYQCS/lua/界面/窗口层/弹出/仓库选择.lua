--[[
Author: GGELUA
Date: 2024-04-18 14:50:17
Last Modified by: GGELUA
Last Modified time: 2024-04-18 14:53:34
--]]

多开数据[多开数据.当前].__UI弹出.仓库选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("仓库选择",0,0,520,300)
local 仓库选择 = 多开数据[多开数据.当前].__UI弹出.仓库选择
local 当前 = 多开数据.当前
local y值 = 0
local x值 = 0
function 仓库选择:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(520,300)
    if nsf:渲染开始() then
        取黑透明背景(0,0,520,300,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 仓库选择:打开(总页)
    self:置可见(true)
    
    for i = 1, 80, 1 do
        if i <= 总页 then
            self.扩展格子["仓库"..i]:置可见(true)
        else
            self.扩展格子["仓库"..i]:置可见(false)
        end
    end
end

local 扩展格子 = 仓库选择:创建控件("扩展格子", 0, 0, 520, 300)

for n = 1, 80, 1 do
    local x坐标 = 5 + x值*51
    local y坐标 = 5 + y值*36
    for i, v in ipairs {
        { name = "仓库"..n, x =x坐标, y = y坐标, tcp = __res:getPNGCC(1, 449, 28, 174, 35, true):置拉伸(50, 35), font = tostring(n) },
    } do
        local 临时函数 = 扩展格子:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
        function 临时函数:左键弹起(x, y)
            发送数据(当前 or self and self.当前, 6705, { 序列 = n })
            仓库选择:置可见(false)
        end
    end
    x值 = x值 + 1
    if x值 == 10 then
        y值 = y值 + 1
        x值 = 0
    end
end