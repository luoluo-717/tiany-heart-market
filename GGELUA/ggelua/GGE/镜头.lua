-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-02-19 13:32:40
-- @Last Modified time  : 2024-05-04 11:26:52

local SDL = require('SDL')
local SDL矩形 = require('SDL.矩形')
local GGE坐标 = require('GGE.坐标')
local GGE镜头 = class('GGE镜头', SDL矩形, GGE坐标)

local _cam
local _rect = SDL.CreateRect()
local _显示纹理 = 引擎.显示纹理
local _显示图形 = 引擎.显示图形
local _画点 = 引擎.画点
local _画线 = 引擎.画线
local _画矩形 = 引擎.画矩形

引擎.显示纹理 = function(this, tex, srcrect, dstrect, angle, flip, centerx, centery)
    if _cam then
        local x, y = _cam:取坐标(true)
        _rect.x = dstrect.x - x
        _rect.y = dstrect.y - y
        _rect.w = dstrect.w
        _rect.h = dstrect.h
        dstrect = _rect
    end

    _显示纹理(this, tex, srcrect, dstrect, angle, flip, centerx, centery)
end

引擎.显示图形 = function(this, tex, ver, x, y)
    if _cam then
        local cx, cy = _cam:取坐标(true)
        x = x - cx
        y = y - cy
    end
    _显示图形(this, tex, ver, x, y)
end

引擎.画点 = function(this, x, y, x1, y1)
    if _cam then
        local cx, cy = _cam:取坐标(true)
        x = x - cx
        y = y - cy
    end
    _画点(this, x, y, x1, y1)
end

引擎.画线 = function(this, x, y, x1, y1)
    if _cam then
        local cx, cy = _cam:取坐标(true)
        x = x - cx
        y = y - cy
        x1 = x1 - cx
        y1 = y1 - cy
    end
    _画线(this, x, y, x1, y1)
end

引擎.画矩形 = function(this, rect, fill)
    if _cam then
        local cx, cy = _cam:取坐标(true)
        _rect.x = rect.x - cx
        _rect.y = rect.y - cy
        _rect.w = rect.w
        _rect.h = rect.h
        rect = _rect
    end
    _画矩形(this, rect, fill)
end

function GGE镜头:GGE镜头(x, y, w, h)
    x        = x or 0
    y        = y or 0
    w        = w or 引擎.宽度
    h        = h or 引擎.高度
    self._cw = math.floor(w / 2) --镜头
    self._ch = math.floor(h / 2)
    self._ww = math.floor(引擎.宽度 / 2) --窗口
    self._wh = math.floor(引擎.高度 / 2)
    SDL矩形.SDL矩形(self, x - self._cw, y - self._ch, w, h)

    引擎:注册事件(self, self)
end

function GGE镜头:更新事件(dt)
    if self._pos then
        if self._pos:更新(dt) then
            self:置坐标(self._pos, true)
        else
            self._pos = nil
            self.是否移动 = false
            return false
        end
        return true
    end
end

-- function GGE镜头:更新(dt)
--     if self._pos then
--         if self._pos:更新(dt) then
--             self:置坐标(self._pos, true)
--         else
--             self._pos = nil
--             self.是否移动 = false
--             return false
--         end
--         return true
--     end
-- end

-- function GGE镜头:显示()
--     if self._en then
--         self[SDL矩形]:显示()
--     else
--         self._en = true
--         self[SDL矩形]:显示()
--         self._en = false
--     end
-- end

function GGE镜头:置地图边界(x, y, w, h)
    self._by = require('SDL.矩形')(x, y, w, h)
end

local function get(self, bw, bh)
    local x, y = self.x, self.y
    for cy = y, (y + self.h + bh), bh do
        for cx = x, (x + self.w + bw), bw do
            coroutine.yield(cx // bw, cy // bh)
        end
    end
end
--这是一个迭代函数
--参数是图块宽高
--每次返回镜头对应图块xy
function GGE镜头:遍历地图区域(bw, bh)
    local f = coroutine.wrap(get)
    return function()
        return f(self, bw, bh)
    end
end

function GGE镜头:置坐标(x, y, abs)
    if ggetype(x) == 'GGE坐标' then
        abs = y
        x, y = x:get()
    end
    if not abs then
        x = x - self._cw
        y = y - self._ch
    end
    if self._by then
        if x < self._by.x then
            x = self._by.x
        end
        if y < self._by.y then
            y = self._by.y
        end
        if x + self.w > self._by.w then
            x = self._by.w - self.w
        end
        if y + self.h > self._by.h then
            y = self._by.h - self.h
        end
    end
    SDL矩形.置坐标(self, x, y)
end

function GGE镜头:取坐标(abs)
    if abs then
        return self.x - (self._ww - self._cw), self.y - (self._wh - self._ch)
    end
    return self.x + self._cw, self.y + self._ch
end

function GGE镜头:移动到(x, y, speed)
    if ggetype(x) == 'GGE坐标' then
        speed = y
        x, y = x:get()
    end
    if not self._pos then
        self._pos = require('GGE.坐标')(self.x, self.y)
    end
    x = x - self._cw
    y = y - self._ch
    if x < 0 then
        x = 0
    end
    if y < 0 then
        y = 0
    end


    self._pos:移动到(x, y, speed or 200)
    self.是否移动 = true
end

function GGE镜头:取距离(x, y)
    if ggetype(x) == 'GGE坐标' then
        x, y = x:get()
    end
    x = x - self._cw
    y = y - self._ch
    if x < 0 then
        x = 0
    end
    if y < 0 then
        y = 0
    end
    return GGE坐标.取距离(self, x, y)
end

function GGE镜头:取鼠标坐标(x, y)
    local wx, wy = self:取坐标(true)
    return wx + x, wy + y
end

function GGE镜头:置禁止(v)
    _cam = (not v) and self or false
end

return GGE镜头
