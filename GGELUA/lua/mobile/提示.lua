-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-04-30 03:09:51
-- @Last Modified time  : 2024-05-31 11:06:22

local 提示窗口 = IM:创建模态窗口('提示窗口')
function 提示窗口:初始化()
    self.禁止关闭按钮 = true
    self:置样式(自动宽高)
end

local 关闭按钮 = 提示窗口:创建按钮('关闭')

function 关闭按钮:左键单击()
    提示窗口:置可见(false)
end

function 提示窗口:打开(v)
    提示窗口:置可见(true)
end

return 提示窗口
