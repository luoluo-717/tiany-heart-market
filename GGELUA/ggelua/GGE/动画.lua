-- @Author              : GGELUA
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified by    : baidwwy
-- @Last Modified time  : 2024-05-04 11:26:30

local GGE动画 = class('GGE动画')

function GGE动画:GGE动画(t, maxf, width, height, fps)
    self.帧率 = 0.1
    self.帧数 = 0
    self.宽度 = 0
    self.高度 = 0
    if type(t) == 'table' then --载入器
        assert(type(t.取精灵) == 'function', '没有取精灵函数')
        assert(type(t.帧数) == 'number', '没有指定帧数')
        self.资源 = t
        self.帧率 = t.帧率 or (1.0 / 8)
        self.帧数 = t.帧数
        self.宽度 = t.宽度
        self.高度 = t.高度
    elseif ggetype(t) == 'SDL纹理' then
        assert(type(maxf) == 'number', '没有指定帧数')
        assert(type(width) == 'number', '没有指定宽度')
        assert(type(height) == 'number', '没有指定高度')
        self.帧率 = fps or (1.0 / 8)
        self.帧数 = maxf
        self.宽度 = width
        self.高度 = height
        local x, y = 0, 0
        for i = 1, maxf do
            GGE动画.添加帧(self, require 'SDL.精灵' (t, x, y, width, height))
            x = x + width
            if x + width > t:取宽度() then
                x = 0
                y = y + height
            end
        end
    end
    self.当前帧 = 0
    self.是否循环 = false
    self._delta_ = 1 --递增值
    self._list_ = {}
    self._load_ = {} --协程加载中
    self._dt_ = 0
    self._x_ = 0
    self._y_ = 0
end

function GGE动画:复制()
    local r = GGE动画()
    for k, v in pairs(self) do
        if type(v) ~= 'table' then
            r[k] = v
        end
    end
    r.资源 = self.资源
    for i, v in ipairs(self._list_) do
        r._list_[i] = v:复制()
    end
    return r
end

function GGE动画:更新(dt)
    if not self.是否播放 then
        return
    end
    self._dt_ = self._dt_ + dt

    if self._dt_ >= self.帧率 then
        self._dt_ = self._dt_ - self.帧率
        local i = self.当前帧 + self._delta_

        if i > self.帧数 then
            if self.是否循环 then --循环
                if self.循环往返 then --往返
                    self._delta_ = -self._delta_
                else
                    self.当前帧 = 0
                end
            else
                GGE动画.暂停(self)
            end
        elseif i < 1 then
            if self.是否循环 then --循环
                self._delta_ = 1
            else
                GGE动画.暂停(self)
            end
        end

        if self.是否播放 then
            GGE动画.置当前帧(self, self.当前帧 + self._delta_)
        else
            return true
        end
    end
end

function GGE动画:显示(x, y)
    if self._spr_ then
        GGE动画.置坐标(self, x, y)
        x, y = self._x_, self._y_
        local r = self._rect_
        if r then
            引擎:置区域(x - r.x, y - r.y, r.w, r.h)
        end

        self._spr_:显示(x, y)

        if r then
            引擎:置区域()
        end
    end
end

function GGE动画:置坐标(x, y)
    if not y and ggetype(x) == 'GGE坐标' then
        x, y = x:get()
    end
    if x and y then
        if self._hx_ then
            x, y = x - self._hx_, y - self._hy_
        end
        self._x_, self._y_ = x, y
    end
end

function GGE动画:取坐标()
    return self._x_, self._y_
end

function GGE动画:播放(循环)
    self.是否播放 = true
    self.是否暂停 = false
    if 循环 ~= nil then
        GGE动画.置循环(self, 循环)
    end
    local i = self.当前帧 + self._delta_
    if i > self.帧数 then
        if self.循环往返 then --往返
            self._delta_ = -1
        else
            self._delta_ = 1
            GGE动画.置当前帧(self, 1)
        end
    elseif i < 1 then
        self._delta_ = 1
    end
    return self
end

local function _停止事件(self)
    if self.停止事件 then
        if type(self.停止事件) == 'function' then
            self.停止事件(self)
        elseif type(self.停止事件) == 'thread' then
            if coroutine.status(self.停止事件) == 'suspended' then
                coroutine.xpcall(self.停止事件)
            end
        end
    end
end

function GGE动画:停止()
    if not self.是否播放 then
        return
    end
    GGE动画.置首帧(self)
    self.是否播放 = false
    _停止事件(self)
    return self
end

function GGE动画:暂停()
    if not self.是否播放 then
        return
    end
    self.是否播放 = false
    self.是否暂停 = true
    _停止事件(self)
    return self
end

function GGE动画:恢复()
    self.是否播放 = true
    self.是否暂停 = false
    return self
end

function GGE动画:置往返(v)
    self.循环往返 = v == true
    return self
end

function GGE动画:置循环(v)
    self.是否循环 = v == true
    return self
end

function GGE动画:置帧率(v)
    assert(type(v) == 'number', '参数错误')
    self.帧率 = v
    return self
end

function GGE动画:取帧率()
    return self.帧率
end

function GGE动画:取宽高()
    return self.宽度, self.高度
end

function GGE动画:取宽度()
    return self.宽度
end

function GGE动画:取高度()
    return self.高度
end

function GGE动画:置首帧()
    self._dt_ = 0
    self._delta_ = 1
    GGE动画.置当前帧(self, 1)
    return self
end

function GGE动画:置尾帧()
    self._dt_ = 0
    self._delta_ = 1
    GGE动画.置当前帧(self, self.帧数)
    return self
end

--协程载入
local function _协程取精灵(self, i)
    self._load_[i] = true
    local r = self.资源:取精灵(i)
    if self._load_[i] and (ggetype(r) == 'SDL精灵' or ggetype(r) == 'GGE精灵') then
        self._list_[i] = r
        self._load_[i] = nil
    end
end

function GGE动画:置当前帧(i)
    if self.当前帧 ~= i and i > 0 and i <= self.帧数 then
        if not self._list_[i] and self.资源 then
            if not self._load_[i] then
                coroutine.xpcall(_协程取精灵, self, i)
            end
        end
        if self._list_[i] then
            self.当前帧 = i
            self._spr_ = self._list_[i]
            if self._r_ or self._g_ or self._b_ then
                self._spr_:置颜色(self._r_, self._g_, self._b_)
            end
            if self._a_ then
                self._spr_:置透明(self._a_)
            end
            if self._hl_ then
                self._spr_:置高亮(self._hl_)
            end
            local 帧事件 = self.帧事件
            if type(帧事件) == 'function' then
                if ggexpcall(帧事件, self, i, self.帧数) == false and 帧事件 == self.帧事件 then
                    self.帧事件 = nil
                end
            end
        end
    end
    return self
end

function GGE动画:添加帧(v)
    if ggetype(v) == 'SDL精灵' then
        table.insert(self._list_, v)
    elseif ggetype(v) == 'GGE精灵' then
        table.insert(self._list_, v)
    elseif ggetype(v) == 'SDL纹理' then
        table.insert(self._list_, require 'SDL.精灵' (v))
    else
        error('不支持')
    end
    self.帧数 = #self._list_
    return self
end

GGE动画.添加 = GGE动画.添加帧

function GGE动画:删除帧(i)
    table.remove(self._list_, i)
    return self
end

GGE动画.删除 = GGE动画.删除帧

function GGE动画:取精灵(i)
    return i and self._list_[i] or self._spr_
end

function GGE动画:清空()
    self._dt_ = 0
    self.当前帧 = 0
    self._list_ = {}
    self._load_ = {}
    self._spr_ = nil
    return self
end

function GGE动画:置颜色(r, g, b, a)
    for _, v in pairs(self._list_) do
        v:置颜色(r, g, b, a)
    end
    self._a_ = a
    self._r_ = r
    self._g_ = g
    self._b_ = b
    return self
end

function GGE动画:置透明(a)
    for _, v in pairs(self._list_) do
        v:置透明(a)
    end
    self._a_ = a
    return self
end

function GGE动画:置高亮(r, g, b, a)
    for _, v in pairs(self._list_) do
        v:置高亮(r, g, b, a)
    end
    self._hl_ = r
    return self
end

function GGE动画:取高亮()
    return self._spr_ and self._spr_:取高亮()
end

function GGE动画:检查点(x, y)
    return self._spr_ and self._spr_:检查点(x, y)
end

function GGE动画:取透明(x, y)
    return self._spr_ and self._spr_:取透明(x, y)
end

function GGE动画:检查透明(x, y)
    return self._spr_ and self._spr_:检查透明(x, y)
end

function GGE动画:置中心(x, y)
    self._hx_ = x or self._hx_ or 0
    self._hy_ = y or self._hy_ or 0
    return self
end

function GGE动画:取中心()
    return self._hx_, self._hy_
end

function GGE动画:取矩形()
    if self._spr_ then
        return self._spr_:取矩形()
    end
    return require('SDL.矩形')()
end

function GGE动画:置区域(x, y, w, h)
    self._rect_ = require('SDL.矩形')(x, y, w, h)
    return self
end

return GGE动画
