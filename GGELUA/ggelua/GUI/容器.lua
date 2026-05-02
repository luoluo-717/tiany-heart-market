-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-03-17 11:02:31
-- @Last Modified time  : 2023-08-12 20:34:19

local SDL = require 'SDL'
local GUI控件 = require('GUI.控件')
local GUI容器 = class('GUI容器', GUI控件)

function GUI容器:初始化()
    --self.自动坐标 = 1
    self.自动刷新 = true
    self.行间距 = 0
    self.列间距 = 0
    --self.自动隐藏滚动条

    self._sh = 0
    self._sw = 0
    self._sx = 0 --滚动
    self._sy = 0 --滚动
    self._dt = 0
    self._ty = 0 --惯性滚动量

    self.关联控件 = {}
end

GUI容器.__call = GUI控件.__call --索引子控件
function GUI容器:_更新(dt, x, y)
    if rawget(self, '更新') then
        self:更新(dt, x, y)
    end
    if self._spr and self._spr.更新 then
        self._spr:更新(dt, x, y)
    end
    for _, v in ipairs(self.子控件) do
        if v.是否可见 and self.矩形:检查交集(v.矩形) then
            v:_更新(dt, x, y)
        end
    end
    for _, v in ipairs(self.关联控件) do
        if v.是否可见 then
            v:_更新(dt, x, y)
        end
    end
    if self.自动刷新 then
        self._dt = self._dt + dt
        if self._dt >= 0.05 then --20fps
            self._dt = 0
            self:_刷新()
        end
    end

    -- if self._ty ~= 0 then --惯性
    --     self:_滚动(nil, math.floor(self._sy - self._ty), true)
    --     local _ty = self._ty
    --     if _ty < 0 then
    --         self._ty = _ty + dt * 100 --衰减速度
    --     else
    --         self._ty = _ty - dt * 100
    --     end

    --     if _ty < 0 then
    --         if self._ty > 0 then
    --             self._ty = 0
    --         end
    --     else
    --         if self._ty < 0 then
    --             self._ty = 0
    --         end
    --     end
    -- end
end

function GUI容器:_显示(x, y, win)
    local _x, _y = self._x, self._y

    if rawget(self, '后显示') then
        self:后显示(_x, _y, x, y)
    end

    if win:置区域(_x, _y, self.宽度, self.高度) then
        if self._spr then
            self._spr:显示(_x, _y)
        end
        if rawget(self, '显示') then
            self:显示(_x, _y, x, y)
        end
        for _, v in ipairs(self.子控件) do
            if v.是否可见 and self.矩形:检查交集(v.矩形) then
                v:_显示(x, y, win)
            end
        end
        for _, v in ipairs(self.关联控件) do
            if v.是否可见 then
                v:_显示(x, y, win)
            end
        end
        win:置区域()
    end
    if rawget(self, '前显示') then
        self:前显示(_x, _y, x, y)
    end
end

if gge.isdebug then
    local 控件_显示 = GUI容器._显示
    function GUI容器:_显示(x, y, win)
        控件_显示(self, x, y, win)
        if win:取按键状态(SDL.KEY_F1) then
            self.矩形:显示()
        end
    end
end

GUI容器.检查碰撞 = GUI控件.检查点

function GUI容器:_消息事件(msg)
    if not self.是否可见 then
        return
    end
    if msg.鼠标 then
        for _, v in ipairs(msg.鼠标) do
            if v.type == SDL.MOUSE_DOWN then
                if v.button == SDL.BUTTON_LEFT then --左键按下
                    if self:检查点(v.x, v.y) then
                        if gge.platform == 'Android' or gge.platform == 'iOS' then
                            self._rms = os.clock()
                            self._ty = 0
                            self._rmy = 0
                            self._my = v.y
                            self._downpos = (v.x << 0xFFFFFFFF)|v.y --记录按下坐标
                        end
                    end
                end
            elseif v.type == SDL.MOUSE_UP then --左键弹起
                if self._rms then
                    if self._downpos ~= (v.x << 0xFFFFFFFF)|v.y then
                        -- v.type = nil
                        if os.clock() - self._rms < 0.2 then
                            self._ty = self._rmy
                        end
                    end
                    self._rms = nil
                end
                -- elseif v.type == SDL.MOUSE_MOTION then
                --     if self._rms and (gge.platform == 'Android' or gge.platform == 'iOS') then
                --         local _, _, my = SDL.GetRelativeMouseState() --距上次鼠标相对坐标

                --         self:_滚动(nil, self._sy + -my, true)
                --         self._rmy = self._rmy + my
                --     end
            end
        end
    end

    GUI控件._消息事件(self, msg)

    if msg.鼠标 then
        for _, v in ipairs(msg.鼠标) do
            if v.type == SDL.MOUSE_MOTION or --左键按住
                (v.typed == SDL.MOUSE_MOTION and --已经被子控件接收
                    (not v.control._sh or v.control._sh == 0)) then --子控件没有滚动
                if self._rms and v.y > 0 and (gge.platform == 'Android' or gge.platform == 'iOS') then
                    local my = v.y - self._my
                    self._my = v.y

                    self:_滚动(nil, self._sy + -my, true)
                    self._rmy = self._rmy + my
                end
            end
        end
    end
    self:_基本事件(msg)
end

function GUI容器:发送消息(name, ...)
    if name == '鼠标滚轮' then
        if self._sh > 0 then --竖滚
            local _, _, _, _, wx, wy = ...
            local y = -wy * 10 + self._sy

            self:_滚动(nil, y, true)
        end
    end
    return GUI控件.发送消息(self, name, ...)
end

function GUI容器:_刷新()
    if self.自动坐标 == 1 then --自动调整子控件坐标
        local x, y, h = 0, 0, 0
        for _, v in self:遍历控件(true) do
            if v.是否可见 then
                if self.内容宽度 and x + v.宽度 > self.内容宽度 then
                    x = 0
                    y = y + h
                    h = 0
                end
                v:置坐标(x, y)
                x = x + v.宽度 + self.列间距
                if v.高度 > h then
                    h = v.高度 + self.行间距
                end

                if v.换行 then
                    x = 0
                    y = y + h
                    h = 0
                end
            else
                v:置坐标(0, 0)
            end
        end
    elseif self.自动坐标 == 2 then --倒高
        local x, y, h = 0, 0, 0
        local line = {}
        for _, v in self:遍历控件(true) do
            if v.是否可见 then
                if self.内容宽度 and x + v.宽度 > self.内容宽度 then
                    for _, v in ipairs(line) do
                        v:置坐标(v.x, v.y + (h - v.高度))
                    end
                    line = {}
                    x = 0
                    y = y + h
                    h = 0
                end
                v:置坐标(x, y)
                x = x + v.宽度 + self.列间距
                if v.高度 > h then
                    h = v.高度 + self.行间距
                end
                table.insert(line, v)
                if v.换行 then
                    for _, v in ipairs(line) do
                        v:置坐标(v.x, v.y + (h - v.高度))
                    end
                    line = {}
                    x = 0
                    y = y + h
                    h = 0
                end
            else
                v:置坐标(0, 0)
            end
        end

        for i, v in ipairs(line) do
            v:置坐标(v.x, v.y + (h - v.高度))
        end
    end

    --自动生成所有子控件总宽高
    local rect = require('SDL.矩形')()
    self._sh = 0
    self._sw = 0
    for _, v in self:遍历控件(true) do
        rect = rect:取并集(v.矩形)
        if rect.h > self.高度 then
            self._sh = rect.h - self.高度 --可滚高度
        end
        if rect.w > self.宽度 then
            self._sw = rect.w - self.宽度
        end
    end

    if self._sy ~= 0 then
        if self._sh == 0 then
            self:_滚动(nil, 0, true)
        elseif self._sy > self._sh then
            self:_滚动(nil, self._sh, true)
        end
    end
    if self._sx ~= 0 then
        if self._sw == 0 then
            self:_滚动(0, nil, true)
        elseif self._sx > self._sw then
            self:_滚动(self._sw, nil, true)
        end
    end
end

function GUI容器:_滚动(x, y, v)
    if x then
        if x < 0 then
            x = 0
        end
        if x > self._sw then
            x = self._sw
        end
        self._sx = x

        if v then
            v = self.控件.横滚动条
            if v then
                v.位置 = math.floor((math.abs(self._sx) / self._sw) * v.最大值)
            end
        end
    end

    if y then
        if y < 0 then
            y = 0
        end

        if y > self._sh then
            y = self._sh
        end
        self._sy = y

        if v then
            v = self.控件.竖滚动条
            if v then
                v.位置 = math.floor((math.abs(self._sy) / self._sh) * v.最大值)
            end
        end
    end

    if not self.自动坐标 then
        self:_更新坐标()
    end
end

-- function GUI容器:_惯性滚动()
-- end

function GUI容器:取滚动坐标()
    return self._sx, self._sy
end

function GUI容器:取滚动坐标x()
    return self._sx
end

function GUI容器:取滚动坐标y()
    return self._sy
end

function GUI容器:取滚动宽高()
    return self._sw, self._sh
end

function GUI容器:取滚动宽度()
    return self._sw
end

function GUI容器:取滚动高度()
    return self._sh
end

function GUI容器:向上滚动()
    if self._sh > 0 then
        self:_滚动(nil, self._sy - self.高度, true)
    end
end

function GUI容器:向下滚动()
    if self._sh > 0 then
        self:_滚动(nil, self._sy + self.高度, true)
        return self:是否到底()
    end
end

function GUI容器:滚动到顶()
    self:_滚动(nil, 0, true)
end

function GUI容器:滚动到底()
    if self._sh > 0 then
        self:_滚动(nil, self._sh, true)
    end
end

function GUI容器:是否到底()
    if self._sy and self._sh > 0 then
        return self._sy == self._sh
    end
end

local GUI滑块 = require('GUI.滑块')
local GUI滚动 = class('GUI滚动', GUI滑块)
GUI滚动.__call = GUI控件.__call
GUI滚动.创建滚动按钮 = GUI滑块.创建滑块按钮

function GUI容器:创建滚动条(x, y, w, h)
    local name = '竖滚动条'
    if w > h then
        name = '横滚动条'
    end
    local r = GUI滚动(name, x, y, w, h, self)

    table.insert(self.关联控件, r)
    self.控件[name] = r
    return r
end

function GUI控件:创建容器(name, x, y, w, h)
    assert(not self.控件[name], name .. ':此按钮已存在，不能重复创建.')
    local r = GUI容器(name, x, y, w, h, self)
    table.insert(self.子控件, r)
    self.控件[name] = r
    return r
end

return GUI容器
