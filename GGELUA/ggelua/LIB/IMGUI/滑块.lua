-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-04-28 01:16:37
-- @Last Modified time  : 2023-06-16 14:47:04

local im = require 'gimgui'
local IM控件 = require 'IMGUI.控件'
local IM滑块 = class('IM滑块', IM控件)

function IM滑块:初始化(name)
    self._tp = 1
    self.列数 = 1
    self.最小值 = 0
    self.最大值 = 100
    self._buf = { 0, 0, 0, 0 }
    self._name = name .. '##' .. tostring(self)
end

function IM滑块:_更新()
    local r
    local tp = self._tp
    if tp == 1 then
        if self.列数 == 1 then
            r = im.SliderFloat(self._name, self._buf, self.最小值, self.最大值)
        elseif self.列数 == 2 then
            r = im.SliderFloat2(self._name, self._buf, self.最小值, self.最大值)
        elseif self.列数 == 3 then
            r = im.SliderFloat3(self._name, self._buf, self.最小值, self.最大值)
        elseif self.列数 == 4 then
            r = im.SliderFloat4(self._name, self._buf, self.最小值, self.最大值)
        end
    elseif tp == 2 then
        if self.列数 == 1 then
            r = im.SliderInt(self._name, self._buf, self.最小值, self.最大值)
        elseif self.列数 == 2 then
            r = im.SliderInt2(self._name, self._buf, self.最小值, self.最大值)
        elseif self.列数 == 3 then
            r = im.SliderInt3(self._name, self._buf, self.最小值, self.最大值)
        elseif self.列数 == 4 then
            r = im.SliderInt4(self._name, self._buf, self.最小值, self.最大值)
        end
    end
    IM控件._检查鼠标(self)
    if r then
        self:发送消息('滚动事件', table.unpack(self._buf, 1, self.列数))
    end
end

function IM滑块:置数值(...)
    self._buf = { ... }
    return self
end

function IM滑块:取数值()
    return table.unpack(self._buf, 1, self.列数)
end

function IM滑块:置小数模式(a, b)
    self._tp = 1
    self._buf = { 0, 0, 0, 0 }
    self.最小值 = a or 0
    self.最大值 = b or 10
    return self
end

function IM滑块:置整数模式(a, b)
    self._tp = 2
    self._buf = { 0, 0, 0, 0 }
    self.最小值 = a or 0
    self.最大值 = b or 100
    return self
end

function IM滑块:置列数(v)
    self.列数 = v
    return self
end

function IM控件:创建滑块(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM滑块(name, ...)
    table.insert(self._子控件, self.控件[name])
    self.控件[name]:置整数模式()
    return self.控件[name]
end

return IM滑块
