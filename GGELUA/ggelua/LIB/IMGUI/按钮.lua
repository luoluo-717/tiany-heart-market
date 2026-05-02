-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-10-10 17:42:51

---@diagnostic disable
local GGF = require('GGE.函数')
local im = require 'gimgui'
local IM控件 = require 'IMGUI.控件'

local IM按钮 = class('IM按钮', IM控件)

function IM按钮:初始化(name)
    self._tp = 1
    self._name = name .. '##' .. tostring(self)
end

function IM按钮:__index(k)
    if rawget(self, '_tp') == 2 then
        if k == '是否选中' then
            return rawget(self, '_cur')[1] == rawget(self, '_bid')
        end
    end
end

function IM按钮:__newindex(k, v)
    if self._tp == 2 and k == '是否选中' then
        return true
    end
end

function IM按钮:_更新(dt)
    if self._tp == 1 then
        local pop = 0
        if self.Col_Button then
            pop = pop + 1
            im.PushStyleColor(21, self.Col_Button)
        end
        if self.Col_ButtonHovered then
            pop = pop + 1
            im.PushStyleColor(21, self.Col_ButtonHovered)
        end
        if self.Col_ButtonActive then
            pop = pop + 1
            im.PushStyleColor(21, self.Col_ButtonActive)
        end
        if im.Button(self._name, self.宽度, self.高度) then
            self:发送消息('左键单击')
        end
        if pop > 0 then
            im.PopStyleColor()
        end
    elseif self._tp == 2 then --单选
        if im.RadioButton(self._name, self._cur, self._bid) then
            self:发送消息('选中事件', true)
        end
    elseif self._tp == 3 then --多选
        if im.Checkbox(self._name, self) then
            self.是否选中 = self[1]
            self:发送消息('选中事件', self[1])
        end
    elseif self._tp == 4 then --纹理
        if self._tex then
            im.PushID(self._name)
            if im.ImageButton(self._name, self._tex) then
                self:发送消息('左键单击')
            end
            im.PopID()
        end
    elseif self._tp == 5 then --无形
        local w, h = self.宽度, self.高度
        if not w or not h then
            w, h = im.GetContentRegionAvail()
        end
        local x, y = im.GetCursorPos()

        if im.InvisibleButton(self._name, w, h) then
        end
        im.SetCursorPos(x, y)
    end
    IM控件._检查鼠标(self)
end

function IM按钮:置选中(v)
    if self._tp == 2 then
        self._cur[1] = self._bid
    else
        self[1] = v == true
        self.是否选中 = self[1]
    end

    return self
end

function IM按钮:置纹理(tex, w, h, bg)
    if ggetype(tex) == 'SDL纹理' then
        self._tex = tex:取对象()
    end

    return self
end

function IM按钮:置正常颜色(r, g, b, a)
    self.Col_Button = r and GGF.RGBA(r or 0, g or 0, b or 0, a or 255)
end

function IM按钮:置经过颜色(r, g, b, a)
    self.Col_ButtonHovered = r and GGF.RGBA(r or 0, g or 0, b or 0, a or 255)
end

function IM按钮:置按下颜色(r, g, b, a)
    self.Col_ButtonActive = r and GGF.RGBA(r or 0, g or 0, b or 0, a or 255)
end

--==============================================================================
function IM控件:创建按钮(name, ...)
    assert(self.控件[name] == nil, name .. '->已经存在')
    self.控件[name] = IM按钮(name, ...)
    table.insert(self._子控件, self.控件[name])
    return self.控件[name]
end

function IM控件:创建单选按钮(name, ...)
    if not self._currb then
        self._currb = { 0, 0 } --1=当前选中,2=累加id
    end
    local r = self:创建按钮(name, ...)
    r._cur = self._currb
    r._bid = self._currb[2]
    r._tp = 2
    self._currb[2] = self._currb[2] + 1
    return r
end

function IM控件:创建多选按钮(name, ...)
    local r = self:创建按钮(name, ...)
    r._tp = 3
    return r
end

function IM控件:创建纹理按钮(name, x, y, w, h)
    w = w or 50
    h = h or 50
    local r = self:创建按钮(name, x, y, w, h)
    r._tp = 4
    --r:置纹理(require('SDL.纹理')(w, h))
    return r
end

function IM控件:创建无形按钮(name, ...)
    local r = self:创建按钮(name, ...)
    r._tp = 5
    return r
end

return IM按钮
