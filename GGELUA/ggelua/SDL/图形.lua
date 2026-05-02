-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-05-08 23:45:41
-- @Last Modified time  : 2024-05-23 04:52:27

local SDL = require('SDL')

local SDL图形 = class('SDL图形')

function SDL图形:初始化()
    self._var = ''
    self._win = SDL._win --默认窗口
    -- self._rt = require('SDL.矩形')()
end

function SDL图形:置纹理(tex)
    if ggetype(tex) == 'SDL_Texture' then
        self._tex = tex
    elseif ggetype(tex) == 'SDL纹理' then
        self._tex = tex:取对象()
    end
end

function SDL图形:取纹理()
    return self._tex
end

function SDL图形:置颜色(r, g, b, a, i)

end

function SDL图形:取颜色(i)

end

function SDL图形:置坐标(x, y)
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

function SDL图形:取坐标()
    return self._x, self._y
end

function SDL图形:置中心(x, y)
    if not y and ggetype(x) == 'GGE坐标' then
        x, y = x:get()
    end
    if x and y then
        self._hx, self._hy = math.floor(x), math.floor(y)
    end
    -- self._rt:置中心(x, y)
    return self
end

function SDL图形:取中心()
    return self._hx, self._hy
end

function SDL图形:添加点(x, y, r, g, b, a, tx, ty)
    self._var = self._var .. string.pack('<!1ffBBBBff', x, y,
        r or 255,
        g or 255,
        b or 255,
        a or 255,
        tx or 0,
        ty or 0
    )

    -- if x > self._rt.w then
    --     self._rt.w = math.floor(x)
    -- end
    -- if y > self._rt.h then
    --     self._rt.h = math.floor(y)
    -- end
end

function SDL图形:删除点(i)
    if i then
        local pointSize = string.packsize('<!1ffBBBBff') -- 获取点数据的大小
        local startIndex = (i - 1) * pointSize + 1
        local endIndex = i * pointSize
        local prefix = self._var:sub(1, startIndex - 1)
        local suffix = self._var:sub(endIndex + 1)
        self._var = prefix .. suffix
    else
        self._var = ''
    end
end

-- function SDL图形:检查点(x, y)
--     return self._rt:检查点(x, y)
-- end

-- function SDL图形:取矩形()
--     return self._rt
-- end

function SDL图形:三角形(x1, y1, x2, y2, x3, y3, r, g, b, a, tx, ty) --等边
    self:添加点(x1, y1, r, g, b, a, tx, ty)
    self:添加点(x2, y2, r, g, b, a, tx, ty)
    self:添加点(x3, y3, r, g, b, a, tx, ty)
    return self
end

-- radius1：圆的半径。
-- radius2：圆的半径。
-- segments：圆的边数。
-- angle：圆的旋转角度。
-- sangle：圆的起始角度。
local function circle(self, radius1, radius2, segments, angle, sangle, r, g, b, a, tx, ty)
    local angleStep = math.rad(angle) / segments
    local start = math.rad(sangle)
    for i = 0, segments - 1 do
        local x1 = radius1 * math.cos(start + i * angleStep)
        local y1 = radius2 * math.sin(start + i * angleStep)
        local x2 = radius1 * math.cos(start + (i + 1) * angleStep)
        local y2 = radius2 * math.sin(start + (i + 1) * angleStep)

        self:三角形(
            0, 0,
            x1, y1,
            x2, y2,
            r, g, b, a, tx, ty
        )
    end
end

function SDL图形:圆形(radius, segments, r, g, b, a, tx, ty)
    circle(self, radius, radius, segments, 360, 0, r, g, b, a, tx, ty)
    return self
end

function SDL图形:扇形(radius, segments, angle, sangle, r, g, b, a, tx, ty)
    circle(self, radius, radius, segments, angle, sangle, r, g, b, a, tx, ty)
    return self
end

function SDL图形:椭圆(da, db, segments, r, g, b, a, tx, ty)
    circle(self, da, db, segments, 360, 0, r, g, b, a, tx, ty)
    return self
end

function SDL图形:四边形(w, h, r, g, b, a, tx, ty) --两个三角形
    self:添加点(0, 0, r, g, b, a, tx, ty)
    self:添加点(w, 0, r, g, b, a, tx, ty)
    self:添加点(w, h, r, g, b, a, tx, ty)
    self:添加点(0, 0, r, g, b, a, tx, ty)
    self:添加点(w, h, r, g, b, a, tx, ty)
    self:添加点(0, h, r, g, b, a, tx, ty)
    return self
end

function SDL图形:显示(x, y)
    self:置坐标(x, y)
    self._win:显示图形(self._tex, self._var, self._x, self._y)
    -- self._rt:置坐标(x, y)
    --self._rt:显示()
end

return SDL图形
