-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-05-01 01:10:38

---@diagnostic disable
local im = require 'gimgui'
local IM控件 = require 'IMGUI.控件'

local IM容器 = class('IM容器', IM控件)

function IM容器:初始化()
    self._name = tostring(self)
    --self._frame = true
end

function IM容器:_更新(dt)
    --不需要if
    if self._frame then
        im.BeginChildFrame(self._name, self.宽度, self.高度, self._flag)
    else
        im.BeginChild(self._name, self.宽度, self.高度, self._border, self._flag)
    end

    IM控件._更新(self, dt)
    if self._auto then
        if im.GetScrollY() >= im.GetScrollMaxY() then
            im.SetScrollHereY(1)
        end
    end
    if self._frame then
        im.EndChildFrame()
    else
        im.EndChild()
    end
end

function IM容器:置自动滚动(b)
    self._auto = b
    return self
end

function IM容器:置边框(b)
    self._border = b
    return self
end
--==============================================================================
function IM控件:创建容器(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM容器(name, ...)
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]
end

function IM控件:创建区域(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM容器(name, ...)
    self.控件[name]._frame = true
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]
end
return IM容器
