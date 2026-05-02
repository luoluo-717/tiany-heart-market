-- @Author              : GGELUA
-- @Date                : 2022-04-03 14:00:28
-- @Last Modified by    : baidwwy
-- @Last Modified time  : 2023-11-15 15:02:08

local SDL = require 'SDL'
local GUI控件 = require('GUI.控件')

local GUI按钮 = class('GUI按钮', GUI控件)

do
    function GUI按钮:初始化(_, x, y, w, h)
        self.__btn = 1 --用来读
        self._btnspr = {}
    end

    local _set = {
        置禁止精灵 = 0,
        置正常精灵 = 1,
        置按下精灵 = 2,
        置经过精灵 = 3,
    }
    function GUI按钮:__index(k)
        if _set[k] then
            return function(_, v)
                if not v then
                    return
                end
                assert(type(v) == 'table', '对象错误')
                assert(v.显示, '对象错误')
                local i = _set[k]
                if i == self.__btn and not self.是否选中 then
                    self._curspr = v
                end
                local spr = self._btnspr1 or self._btnspr
                spr[i] = v
                if self.宽度 == 0 or self.高度 == 0 then
                    self:置宽高(v.宽度, v.高度)
                end
                return self
            end
        end
        if k == '_btn' then
            return rawget(self, '__btn')
        end
    end

    function GUI按钮:__newindex(k, v)
        if k == '_btn' then
            rawset(self, '_curspr', self._btnspr[v] or self._btnspr[1])
            rawset(self, '__btn', v)
            return
        end
        rawset(self, k, v)
    end

    function GUI按钮:_更新(dt, ...)
        GUI控件._更新(self, dt, ...)
        if self._curspr and self._curspr.更新 then
            self._curspr:更新(dt)
        end
    end

    function GUI按钮:_显示(...)
        local _x, _y = self:取坐标()
        self._win:置区域(_x, _y, self.宽度, self.高度)
        if self._curspr then
            self._curspr:显示(_x, _y)
        end
        self._win:置区域()
        GUI控件._显示(self, ...)
    end

    function GUI按钮:检查点(x, y)
        if self._curspr then
            return self._curspr:检查点(x, y)
        end
        return self[GUI控件]:检查点(x, y)
    end

    function GUI按钮:检查透明(x, y)
        if self._curspr then
            if gge.platform == 'Android' or gge.platform == 'iOS' then
                return self._curspr:检查点(x, y)
            end
            return self._curspr:取透明(x, y) ~= 0
        end
        return self[GUI控件]:检查点(x, y)
    end

    function GUI按钮:置可见(v, s)
        GUI控件.置可见(self, v, s)

        if gge.platform == 'Windows' and v and not self.是否禁止 and self._win:取鼠标焦点() then
            local x, y = self._win:取鼠标坐标()
            if self:检查透明(x, y) then
                self._btn = 3
            else
                self._btn = 1
            end
        end
        return self
    end

    function GUI按钮:置精灵(tcp)
        self.jl = tcp
    end

    function GUI按钮:置正常的精灵(tcp)
        self._curspr =  tcp:置中心(0, 0)
    end
    

    function GUI按钮:置禁止(v)
        self.是否禁止 = v == true
        if self.是否禁止 then
            self._btn = 0
        else
            self._btn = 1
        end
        if self._btn == 0 and self.jl then
            self._curspr = self.jl:复制():到灰度():到精灵():置中心(0,0)
        end
        return self
    end

    local _state = {
        禁止 = 0,
        正常 = 1,
        按下 = 2,
        经过 = 3,
        [0] = '禁止',
        [1] = '正常',
        [2] = '按下',
        [3] = '经过',
    }
    function GUI按钮:取状态()
        return _state[self._btn]
    end

    function GUI按钮:置状态(v)
        if type(v) == 'string' and _state[v] then
            -- if v == '按下' then
            --     self._LEFTDOWN = true
            -- end
            self._btn = _state[v]
        end
    end

    function GUI按钮:_消息事件(msg)
        if not self.是否可见 then
            return
        end
        GUI控件._消息事件(self, msg)

        self:_基本事件(msg)
    end

    function GUI按钮:发送消息(name, x, y, mx, my)
        if name == '左键按下' or name == '右键按下' then
            self._btn = 2
        elseif name == '左键弹起' or name == '右键弹起' then
            if not self.是否禁止 and self._btn == 2 then
                self._btn = 1
            end
        elseif name == '获得鼠标' then
            if not self.是否禁止 and self._btn == 1 then
                self._btn = 3
            end
        elseif name == '失去鼠标' then
            if not self.是否禁止 and self._btn == 3 then
                self._btn = 1
            end
        elseif name == '左键单击' then
            self._btn = 3
        end
        return GUI控件.发送消息(self, name, x, y, mx, my)
    end
end

function GUI控件:创建按钮(name, x, y, w, h)
    assert(not self[name], name .. ':此按钮已存在，不能重复创建.')
    self[name] = GUI按钮(name, x, y, w, h, self)
    table.insert(self.子控件, self[name])
    return self[name]
end

--======================================================================
local GUI多选按钮 = class('GUI多选按钮', GUI按钮)
do
    function GUI多选按钮:初始化()
        self.是否选中 = false

        self._btnspr1 = {}
        self._btnspr2 = {}
        self._btnspr = self._btnspr1
    end

    local _set = {
        置选中禁止精灵 = 0,
        置选中正常精灵 = 1,
        置选中按下精灵 = 2,
        置选中经过精灵 = 13,
    }
    function GUI多选按钮:__index(k)
        if _set[k] then
            return function(_, v)
                if not v then
                    return
                end
                assert(type(v) == 'table', '对象错误')
                assert(v.显示, '对象错误')
                local i = _set[k]

                if self.是否选中 and i == self._btn then
                    self._curspr = v
                end
                self._btnspr2[i] = v

                if self.宽度 == 0 or self.高度 == 0 then
                    self:置宽高(v.宽度, v.高度)
                end
                return self
            end
        end
    end

    GUI多选按钮.__newindex = GUI按钮.__newindex

    function GUI多选按钮:置选中(v, msg)
        if self.禁止任何操作 then return end
        self.是否选中 = v == true
        self._btnspr = v and self._btnspr2 or self._btnspr1
        self._curspr = self._btnspr[self._btn] or self._btnspr[1]
        if self.是否实例 and self.是否可见 and not self._lock and msg ~= false then
            self._lock = true --防止循环
            self:发送消息('选中事件', self.是否选中)
            self._lock = nil
        end
        return self
    end

    function GUI多选按钮:发送消息(name, x, y, mx, my)
        local r = GUI按钮.发送消息(self, name, x, y, mx, my)
        if name == '左键单击' and self.禁止默认操作 == nil then
            self:置选中(not self.是否选中)
        end
    end
end

function GUI控件:创建多选按钮(name, x, y, w, h)
    assert(not self[name], name .. ':此按钮已存在，不能重复创建.')
    self[name] = GUI多选按钮(name, x, y, w, h, self)
    table.insert(self.子控件, self[name])
    return self[name]
end

--======================================================================
local GUI单选按钮 = class('GUI单选按钮', GUI多选按钮)

do
    GUI单选按钮.__index = GUI多选按钮.__index
    GUI单选按钮.__newindex = GUI按钮.__newindex

    function GUI单选按钮:发送消息(name, x, y, mx, my)
        local r = GUI按钮.发送消息(self, name, x, y, mx, my)
        if self.我已经禁止了 and name == '左键单击' then
            self.我已经禁止了=nil
            return
        end
        if not self.是否选中 and name == '左键单击' then
            self:置选中(not self.是否选中)
        end
    end

    function GUI单选按钮:置选中(v, msg ,b)
        if v == true then
            for _, c in ipairs(self.父控件.子控件) do
                if c ~= self and ggetype(c) == 'GUI单选按钮' then
                    GUI多选按钮.置选中(c, false)
                end
            end
            GUI多选按钮.置选中(self, true, msg)
        elseif v == false and b then
            for _, c in ipairs(self.父控件.子控件) do
                if c == b and ggetype(c) == 'GUI单选按钮' then
                    GUI多选按钮.置选中(c, true)
                end
            end
            GUI多选按钮.置选中(self, false, msg)
            self.我已经禁止了=true
        end
        return self
    end
end

function GUI控件:创建单选按钮(name, x, y, w, h)
    assert(not self[name], name .. ':此按钮已存在，不能重复创建.')
    self[name] = GUI单选按钮(name, x, y, w, h, self)
    table.insert(self.子控件, self[name])
    return self[name]
end

return GUI按钮
