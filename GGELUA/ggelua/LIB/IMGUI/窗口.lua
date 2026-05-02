-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-06-19 15:14:10
---@diagnostic disable

local ggf = require('GGE.函数')
local im = require 'gimgui'
local IM控件 = require 'IMGUI.控件'

local IM窗口 = class('IM窗口', IM控件)
IM窗口.是否窗口 = true

function IM窗口:初始化(name, x, y, w, h)
    self._tp = 1
    self._name = name .. '##' .. tostring(self)
    self._iswin = true
    self._flag = 64 --自动宽高

    if x and y then
        self._x = x
        self._y = y
    end
    if w and h then
        self._w = w
        self._h = h
        self._flag = 0
    end
    self:置可见(false)
end

local _flag = setmetatable(
    {
        禁止标题 = 1 << 0,
        禁止调整 = 1 << 1,
        禁止移动 = 1 << 2,
        禁止滑块 = 1 << 3,
        禁止滚动 = 1 << 4,
        禁止折叠 = 1 << 5,
        自动宽高 = 1 << 6,
        禁止背景 = 1 << 7,
        禁止保存 = 1 << 8,
        禁止鼠标 = 1 << 9,
        禁止菜单 = 1 << 10,
        保存提示 = 1 << 20,
        样式_禁止标题 = 1 << 0,
        样式_禁止调整 = 1 << 1,
        样式_禁止移动 = 1 << 2,
        样式_禁止滑块 = 1 << 3,
        样式_禁止滚动 = 1 << 4,
        样式_禁止折叠 = 1 << 5,
        样式_自动宽高 = 1 << 6,
        样式_禁止背景 = 1 << 7,
        样式_禁止保存 = 1 << 8,
        样式_禁止鼠标 = 1 << 9,
        样式_禁止菜单 = 1 << 10,
        样式_禁止装饰 = 43, --禁止标题|禁止调整|禁止滑块|禁止折叠 Decoration
    },
    { __index = _G }
)

function IM窗口:__newindex(k, v)
    if k == '初始化' then
        ggf.setfenv(v, _flag)
    end
    if rawget(_flag, k) then
        if v then
            self._flag = self._flag | _flag[k]
        else
            self._flag = self._flag & ~_flag[k]
        end

        return true
    end
end

function IM窗口:__index(k)
    local v = rawget(_flag, k)
    if v then
        return self._flag & v == v
    end
end

function IM窗口:__call(path, ...)
    if select('#', ...) > 0 then
        path = path:format(...)
    end
    local t = self.控件
    local r
    for v in string.gmatch(path, '([^/]+)') do
        if t[v] then
            r = t[v]
            t = r.控件
        end
    end
    return r
end

function IM窗口:_更新(dt)
    if self.是否可见 then
        if self._x then
            im.SetNextWindowPos(self._x, self._y)
            self._x = nil
            self._y = nil
        end
        if self._w and self._h then
            im.SetNextWindowSize(self._w, self._h)
            self._w = nil
            self._h = nil
        end
        if self._alpha then
            im.SetNextWindowBgAlpha(self._alpha)
        end
        local flag = self._flag & 0x1FFFFF
        if self._tp == 1 or self._tp == 3 then --普通窗口
            local r
            if self.禁止关闭按钮 then
                r = im.Begin(self._name, flag)
            else
                r = im.Begin(self._name, self, flag)
            end
            if r then
                if self.是否可见 ~= self[1] then
                    self:发送消息('可见事件', self[1])
                    self.是否可见 = self[1]
                    if not self.是否可见 and self._tp == 3 then
                        self.父控件:删除控件(self.名称)
                    end
                end

                IM控件._更新(self, dt)
                local w, h = im.GetWindowSize()
                if w ~= self.宽度 or self.高度 ~= h then
                    self.宽度, self.高度 = w, h
                    self:发送消息('宽高改变事件', w, h, im.GetWindowContentRegionMax())
                end
                --local x, y = im.GetWindowPos()
            end
            im.End()
        elseif self._tp == 2 then --模态窗口
            if self._状态 == 1 then
                im.OpenPopup(self._name)
                self._状态 = 0
            end

            local r
            if self.禁止关闭按钮 then
                r = im.BeginPopupModal(self._name, flag)
            else
                r = im.BeginPopupModal(self._name, self, flag)
            end
            if r then
                if self.是否可见 ~= self[1] then
                    self:发送消息('可见事件', self[1])
                    self.是否可见 = self[1]
                end
                self.是否可见 = self[1]

                IM控件._更新(self, dt)
                if self._状态 == 2 then
                    im.CloseCurrentPopup()
                    self._状态 = 0
                end
                im.EndPopup()
            end
        end
    end
end

function IM窗口:置可见(v)
    self[1] = v == true
    IM控件.置可见(self, v)


    if self._tp == 2 then --模态窗口
        self._状态 = self[1] and 1 or 2
    elseif not v and self._tp == 3 then
        self.父控件:删除控件(self.名称)
    end
    return self
end

function IM窗口:折叠(b)
    --SetNextWindowCollapsed
    return self
end

function IM窗口:置样式(b)
    self._flag = b
    return self
end

function IM窗口:取样式()
    return self._flag
end

function IM窗口:置坐标(x, y)
    self._x = x
    self._y = y
    return self
end

function IM窗口:置透明(v)
    self._alpha = v / 255
    return self
end

--==============================================================================
function IM控件:创建窗口(name, x, y, w, h)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM窗口(name, x, y, w, h, self)
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]
end

function IM控件:创建模态窗口(name, x, y, w, h)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM窗口(name, x, y, w, h, self)
    table.insert(self._子控件, self.控件[name])
    self.控件[name]._tp = 2
    return self.控件[name]
end

function IM控件:创建临时窗口(name, x, y, w, h) --关闭将被删除
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM窗口(name, x, y, w, h, self)
    table.insert(self._子控件, self.控件[name])
    self.控件[name]._tp = 3
    return self.控件[name]
end

return IM窗口
