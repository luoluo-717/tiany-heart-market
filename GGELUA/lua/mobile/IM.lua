-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-04-29 14:35:37
-- @Last Modified time  : 2024-06-01 16:49:07

local IM = require('IMGUI')(引擎, 'assets/simsun.ttc', 14)
引擎.IM = IM
引擎:注册事件(IM, IM)
function IM:更新事件(dt)
    IM:更新(dt)
end

function IM:渲染事件()
    IM:显示()
end

-- IM:打开DEMO()

-- local server = require('Android/网络')()

local 创建服务 = IM:创建模态窗口('创建服务')
function 创建服务:初始化()
    self.禁止关闭按钮 = true
    self:置样式(自动宽高)
end

local 地址列表 = 创建服务:创建组合('地址列表'):隐藏名称()

for i, v in ipairs(require('gsdl2.net').GetLocalAddresses()) do
    地址列表:添加(v)
end
地址列表:置选中(1)


local 端口输入 = 创建服务:创建整数输入('端口')
端口输入:置文本(9527)


local 创建按钮 = 创建服务:创建按钮('创建')


local 提示窗口 = 创建服务:创建模态窗口('提示')
do
    function 提示窗口:初始化()
        self.禁止关闭按钮 = true
        self:置样式(自动宽高)
    end

    local 提示文本 = 提示窗口:创建文本('提示文本')
    local 关闭按钮 = 提示窗口:创建按钮('关闭')

    function 关闭按钮:左键单击()
        提示窗口:置可见(false)
    end
end

function 创建按钮:左键单击()
    -- if server:启动(地址列表:取文本(), 端口输入:取文本()) then
    --     创建服务:置可见(false)
    --     require('Android/日志'):置可见(true)
    -- else
    --     提示窗口.提示文本:置文本('创建失败')
    --     提示窗口:置可见(true)
    -- end
end

-- 创建服务:置可见(true)


return IM
