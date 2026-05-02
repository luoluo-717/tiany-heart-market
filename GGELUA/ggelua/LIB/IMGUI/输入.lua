-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-10-10 17:46:24

---@diagnostic disable
local im = require 'gimgui'
local IM控件 = require 'IMGUI.控件'

local IM输入 = class('IM输入', IM控件)

function IM输入:初始化(name)
    --self._flag = 0
    self._tp = 1
    self._len = 128
    self._buf = { '', self._len }
    self._name = name .. '##' .. tostring(self)
end

function IM输入:_更新()
    local r
    local tp = self._tp
    if tp == 1 then
        r = im.InputText(self._name, self._buf)
    elseif tp == 2 then
        r = im.InputTextMultiline(self._name, self._buf, self.宽度, self.高度, self._flag)
    elseif tp == 3 then
        r = im.InputFloat(self._name, self._buf)
    elseif tp == 4 then
        r = im.InputInt(self._name, self._buf)
    end
    IM控件._检查鼠标(self)
    if r then
        self:发送消息('输入事件', self._buf[1])
    end
end

function IM输入:置文本(v)
    self._buf = { tostring(v), self._len }
    return self
end

function IM输入:取文本()
    return self._buf[1]
end

function IM输入:取数值()
    return tonumber(self._buf[1]) or 0
end

function IM输入:取内容()
    return self._buf[1]
end

function IM输入:置最大输入(v)
    self._len = v
    return self
end

function IM输入:置文本模式(v)
    self._tp = 1
    self._len = v or 512
    self._buf = { '', self._len }
    return self
end

function IM输入:置多行模式(v)
    self._tp = 2
    self._len = v or 512
    self._buf = { '', self._len }
    return self
end

function IM输入:置小数模式()
    self._tp = 3
    self._buf = { 0 }
    return self
end

function IM输入:置整数模式()
    self._tp = 4
    self._buf = { 0 }
    return self
end

--==============================================================================
function IM控件:创建输入(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM输入(name, ...)
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]
end

function IM控件:创建多行输入(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM输入(name, ...)
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]:置多行模式()
end

function IM控件:创建整数输入(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM输入(name, ...)
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]:置整数模式()
end

function IM控件:创建小数输入(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM输入(name, ...)
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]:置小数模式()
end

--==============================================================================
local IM拖拽输入 = class('IM拖拽输入', IM控件)

function IM拖拽输入:初始化(name)
    self._tp = 1
    self.列数 = 1
    self.步长 = 1
    self.最小值 = 0
    self.最大值 = 100
    self._buf = { 0, 0, 0, 0 }
    self._name = name .. '##' .. tostring(self)
end

function IM拖拽输入:_更新()
    local r
    local tp = self._tp
    if tp == 1 then
        if self.列数 == 1 then
            r = im.DragFloat(self._name, self._buf, self.步长, self.最小值, self.最大值)
        elseif self.列数 == 2 then
            r = im.DragFloat2(self._name, self._buf, self.步长, self.最小值, self.最大值)
        elseif self.列数 == 3 then
            r = im.DragFloat3(self._name, self._buf, self.步长, self.最小值, self.最大值)
        elseif self.列数 == 4 then
            r = im.DragFloat4(self._name, self._buf, self.步长, self.最小值, self.最大值)
        end
    elseif tp == 2 then
        if self.列数 == 1 then
            r = im.DragInt(self._name, self._buf, self.步长, self.最小值, self.最大值)
        elseif self.列数 == 2 then
            r = im.DragInt2(self._name, self._buf, self.步长, self.最小值, self.最大值)
        elseif self.列数 == 3 then
            r = im.DragInt3(self._name, self._buf, self.步长, self.最小值, self.最大值)
        elseif self.列数 == 4 then
            r = im.DragInt4(self._name, self._buf, self.步长, self.最小值, self.最大值)
        end
    end
    IM控件._检查鼠标(self)
    if r then
        self:发送消息('输入事件', table.unpack(self._buf, 1, self.列数))
    end
end

function IM拖拽输入:置数值(...)
    self._buf = { ... }
    return self
end

function IM拖拽输入:取数值()
    return table.unpack(self._buf, 1, self.列数)
end

function IM拖拽输入:置小数模式(a, b, c)
    self._tp = 1
    self._buf = { 0, 0, 0, 0 }
    self.最小值 = a or 0
    self.最大值 = b or 10
    self.步长 = c or 0.1
    return self
end

function IM拖拽输入:置整数模式(a, b, c)
    self._tp = 2
    self._buf = { 0, 0, 0, 0 }
    self.最小值 = a or 0
    self.最大值 = b or 100
    self.步长 = c or 1
    return self
end

function IM拖拽输入:置列数(v)
    self.列数 = v
    return self
end

function IM控件:创建拖拽输入(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM拖拽输入(name, ...)
    table.insert(self._子控件, self.控件[name])
    self.控件[name]:置整数模式()
    return self.控件[name]
end

return IM输入
