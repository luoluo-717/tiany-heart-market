-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-02-19 07:10:17
-- @Last Modified time  : 2024-05-04 11:26:45

local GGE精灵 = class('GGE精灵')

function GGE精灵:初始化(p, x, y, w, h)
    self._list = {}
    self._hash = {}
    if p then
        self:添加(require('SDL.精灵')(p, x, y, w, h))
    end
end

function GGE精灵:显示(x, y)
    self:置坐标(x, y)
    for _, v in ipairs(self._list) do
        v:显示(self._x, self._y)
    end
end

function GGE精灵:添加(v, flag)
    assert(ggetype(v) == 'SDL精灵', '非精灵')
    table.insert(self._list, v)
    if flag then
        self._hash[flag] = v
    end
    self._rect = nil
    return self
end

function GGE精灵:插入(i, v, flag)
    assert(ggetype(v) == 'SDL精灵', '非精灵')
    table.insert(self._list, i, v)
    if flag then
        self._hash[flag] = v
    end
    self._rect = nil
    return self
end

function GGE精灵:删除(i)
    if type(i) == 'number' then
        local r = table.remove(self._list, i)
        if r then
            for k, v in pairs(self._hash) do
                if v == r then
                    self._hash[k] = nil
                    return r
                end
            end
        end
    else
        local r = self._hash[i]
        if r then
            self._hash[i] = nil
            for i, v in ipairs(self._list) do
                if v == r then
                    table.remove(self._list, i)
                    return r
                end
            end
        end
    end
end

function GGE精灵:清空(v)
    self._list = {}
    return self
end

function GGE精灵:排序(fun)
    table.sort(self._list, fun)
    return self
end

function GGE精灵:置坐标(x, y)
    if not y and ggetype(x) == 'GGE坐标' then
        x, y = x:get()
    end
    if x and y then
        if self._hx then --中心
            x, y = x - self._hx, y - self._hy
        end
        self._x, self._y = x, y
    end
    return self
end

function GGE精灵:取坐标()
    return self._list[1] and self._list[1]:取坐标()
end

function GGE精灵:置过滤(v)
    for _, v in ipairs(self._list) do
        v:置过滤(v)
    end
    return self
end

function GGE精灵:取过滤()
    return self._list[1] and self._list[1]:取过滤()
end

function GGE精灵:置透明(a)
    for _, v in ipairs(self._list) do
        v:置透明(a)
    end
    return self
end

function GGE精灵:取透明(x, y)
    return self._list[1] and self._list[1]:取透明(x, y)
end

function GGE精灵:置颜色(r, g, b, a)
    for _, v in ipairs(self._list) do
        v:置颜色(r, g, b, a)
    end
    return self
end

function GGE精灵:取颜色()
    return self._list[1] and self._list[1]:取颜色()
end

function GGE精灵:置混合(v)
    for _, v in ipairs(self._list) do
        v:置混合(v)
    end
    return self
end

function GGE精灵:取混合()
    return self._list[1] and self._list[1]:取混合()
end

function GGE精灵:置中心(x, y)
    if not y and ggetype(x) == 'GGE坐标' then
        x, y = x:get()
    end
    if x and y then
        self._hx, self._hy = math.floor(x), math.floor(y)
    end
    return self
end

function GGE精灵:取中心()
    return self._hx, self._hy
end

function GGE精灵:检查点(x, y)
    for _, v in ipairs(self._list) do
        if v:检查点(x, y) then
            return true
        end
    end
    return false
end

function GGE精灵:检查透明(x, y)
    for _, v in ipairs(self._list) do
        if v:检查透明(x, y) then
            return true
        end
    end
    return false
end

function GGE精灵:置高亮(r, g, b, a)
    for _, v in ipairs(self._list) do
        v:置高亮(r, g, b, a)
    end
    return self
end

function GGE精灵:取高亮()
    return self._list[1] and self._list[1]:取高亮()
end

function GGE精灵:取矩形()
    if not self._rect then
        self._rect = require('SDL.矩形')():置颜色(255, 0, 0)
        for _, v in ipairs(self._list) do
            self._rect = self._rect:取并集(v:取矩形())
        end
    end
    return self._rect
end

return GGE精灵
