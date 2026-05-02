-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-04-30 20:31:54
-- @Last Modified time  : 2024-05-31 11:06:13


local 日志窗口 = 引擎.IM:创建窗口('日志窗口', nil, nil, 600, 400)
function 日志窗口:初始化()
    self.禁止关闭按钮 = true
    --self:置样式(样式_关闭按钮)
end

local 容器 = 日志窗口:创建容器('容器')
容器:置自动滚动(true)
function 日志窗口:可见事件(v)
    容器:创建文本('创建成功')
end

-- 容器:清空控件()
-- for i = 1, 50 do
--     容器: 创建文本('test' .. i)
-- end

function 日志窗口:清空()
    容器:清空控件()
end

function 日志窗口:添加(v, ...)
    if select('#', ...) > 0 then
        v = string.format(v, ...)
    end
    容器:创建文本(v)
end

return 日志窗口
