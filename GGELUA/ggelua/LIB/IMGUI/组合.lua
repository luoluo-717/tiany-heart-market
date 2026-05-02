-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-06-20 10:33:20

---@diagnostic disable
local im = require 'gimgui'
local IM控件 = require 'IMGUI.控件'

local IM组合 = class('IM组合', IM控件)

function IM组合:初始化(name)
    self._list = {}
    self._name = name .. '##' .. tostring(self)
    self[1] = -1
end

function IM组合:_更新(dt)
    if im.Combo(self._name, self, self._list) then
        self:置选中(self[1])
    end
end

function IM组合:添加(v)
    table.insert(self._list, tostring(v))
end

function IM组合:删除(i)
    table.remove(self._list, i)
end

function IM组合:置列表(v)
    if type(v) == 'table' then
        self._list = v
    end
end

function IM组合:取文本(i)
    i = i or self.当前选中
    return self._list[i]
end

function IM组合:置选中(i)
    if self._list[i] then
        if not self._lock then
            self._slock = true
            if self:发送消息('选中事件', i, self._list[i]) ~= false then
                self[1] = i
                self.当前选中 = self[1]
            else
                self[1] = self.当前选中
            end
            self._slock = false
        end
    end
end

--==============================================================================
function IM控件:创建组合(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM组合(name, ...)
    table.insert(self._子控件, self.控件[name])
    --self.控件[name]._tp = 2
    return self.控件[name]
end

return IM组合
