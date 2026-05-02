-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-03-12 00:13:11

---@diagnostic disable
local im = require 'gimgui'
local IM控件 = require 'IMGUI.控件'

local IM列表 = class('IM列表', IM控件)

function IM列表:初始化(name)
    self._list = {}
    self._name = name .. '##' .. tostring(self)
    self[1] = -1
end

function IM列表:_更新(dt)
    if im.ListBox(self._name, self, self._list) then
        self.当前选中 = self[1]
        self:发送消息('选中事件', self[1])
    end
end

function IM列表:添加(v)
    table.insert(self._list, tostring(v))
end

function IM列表:删除(i)
    table.remove(self._list, i)
end

function IM列表:置列表(v)
    if type(v) == 'table' then
        self._list = v
    end
end

function IM列表:取文本(i)
    return self._list[i]
end
--==============================================================================
function IM控件:创建列表(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM列表(name, ...)
    table.insert(self._子控件, self.控件[name])
    --self.控件[name]._tp = 2
    return self.控件[name]
end

return IM列表
