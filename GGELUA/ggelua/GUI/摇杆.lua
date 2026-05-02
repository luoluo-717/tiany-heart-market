-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-05-19 09:47:16
-- @Last Modified time  : 2023-07-25 03:03:48

local SDL = require 'SDL'
local GUI控件 = require('GUI.控件')
local GUI摇杆 = class('GUI摇杆', GUI控件)

function GUI摇杆:初始化(name, x, y, w, h)
    self._r = {}
    self._w2 = w // 2
    self._h2 = h // 2
    self._cx = self._w2
    self._cy = self._h2
    self._cp = require('GGE.坐标')()
end

GUI摇杆.__call = GUI控件.__call --索引子控件
function GUI摇杆:_更新(dt, ...)
    GUI控件._更新(self, dt, ...)
end

function GUI摇杆:_显示(x, y, win)
    local _x, _y = self._x, self._y
    if self._rgs then
        self._cp:set(_x + self._w2, _y + self._h2)
        self._rgs:显示(_x + self._cx, _y + self._cy)
    end
    GUI控件._显示(self, x, y, win)
end

function GUI摇杆:添加方向(r, id)
    table.insert(self._r, { r = r, id = id })
end

function GUI摇杆:置摇杆精灵(v)
    self._rgs = v
end

function GUI摇杆:检查透明(x, y)
    return self:检查点(x, y)
end

function GUI摇杆:_消息事件(msg)
    if not self.是否可见 then
        return
    end
    GUI控件._消息事件(self, msg)

    self:_基本事件(msg)
end

function GUI摇杆:发送消息(name, ...)
    if name == '左键按下' then
        local x1, y1, x2, y2 = ...
        if self:检查点(x2, y2) and self._cp:取距离(x2, y2) < self._w2 then
            self._cx = x2 - x1
            self._cy = y2 - y1
            self._kd = true
            local r = self._cp:取角度(x2, y2)
            for i, v in ipairs(self._r) do
                if r < v.r then
                    GUI控件.发送消息(self, '移动事件', v.id)
                    break
                end
            end
        end
    elseif name == '左键按住' then
        local x1, y1, x2, y2 = ...
        if self:检查点(x2, y2) or self._kd then
            if self._cp:取距离(x2, y2) > self._w2 then
                x2, y2 = self._cp:取移动坐标(self._w2, x2, y2):get()
            end
            self._cx = x2 - x1
            self._cy = y2 - y1
            local r = self._cp:取角度(x2, y2)
            for i, v in ipairs(self._r) do
                if r < v.r then
                    GUI控件.发送消息(self, '移动事件', v.id)
                    break
                end
            end
        end
    elseif name == '左键弹起' then
        self._kd = false
        self._cx = self._w2
        self._cy = self._h2
        -- GUI控件.发送消息(self, '移动事件')
    end
    return GUI控件.发送消息(self, name, ...)
end

function GUI控件:创建摇杆(name, x, y, w, h)
    assert(not self.控件[name], name .. ':此按钮已存在，不能重复创建.')
    local r = GUI摇杆(name, x, y, w, h, self)
    table.insert(self.子控件, r)
    self.控件[name] = r
    return r
end

return GUI摇杆
