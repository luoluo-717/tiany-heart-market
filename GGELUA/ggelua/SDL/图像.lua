-- @Author              : GGELUA
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified by    : baidwwy
-- @Last Modified time  : 2024-05-04 11:32:44

local SDL = require('SDL')
local ggetype = ggetype
local assert = assert
local IMG = SDL.IMG_Init()
local _target = SDL._sftarget

local SDL图像 = class 'SDL图像'

function SDL图像:SDL图像(a, b, c, d)
    local tp = ggetype(a)
    if tp == 'number' then
        if type(b) == 'number' then
            self._sf = SDL.CreateRGBSurfaceWithFormat(a, b, c, d) --宽度，高度，位深，格式
        end
    elseif tp == 'string' then
        self._sf = assert(IMG.LoadARGB8888(a, b), SDL.GetError()) --文件,透明色
    elseif tp == 'SDL_Surface' then
        self._sf = a
    elseif tp == 'SDL_RWops' then
        self._sf = assert(IMG.LoadARGB8888_RW(a, b), SDL.GetError())
    elseif tp == 'SDL读写' then
        self._sf = assert(IMG.LoadARGB8888_RW(a:取对象(), b), SDL.GetError())
    end

    if self._sf then
        SDL._sfs[self] = self._sf
        self._win = SDL._win
    else
        error(SDL.GetError())
    end
end

function SDL图像:__index(key)
    if rawget(self, '_sf') then
        if key == '宽度' then
            return self._sf.w or 0
        elseif key == '高度' then
            return self._sf.h or 0
        end
        return self._sf[key]
    end
end

function SDL图像:取对象()
    return self._sf
end

function SDL图像:复制()
    if self._win then
        return self._win:创建图像(self._sf:DuplicateSurface())
    end
    return require('SDL.图像')(self._sf:DuplicateSurface())
end

function SDL图像:置窗口(v)
    self._win = v
    return self
end

function SDL图像:显示(x, y)
    if not y and ggetype(x) == 'GGE坐标' then
        x, y = x:get()
    end
    if self._hx then --中心
        x, y = x - self._hx, y - self._hy
    end
    if _target[1] then
        local t = _target[1]
        t.rect:SetRectXY(math.ceil(x), math.ceil(y))
        self._sf:BlitSurface(self._rect, t.sf, t.rect)
    elseif self._win then
        self._x, self._y = x, y
        self._win:显示图像(self._sf, x, y, self._rect)
    end
    return self
end

function SDL图像:锁定()
    if self._sf then
        return self._sf:LockSurface()
    end
end

function SDL图像:解锁()
    return self._sf and self._sf:UnlockSurface()
end

function SDL图像:到灰度()
    self._sf:SurfaceToGrayscale()
    return self
end

function SDL图像:到纹理()
    if self._win then
        return self._win:创建纹理(self._sf)
    end
    return require('SDL.纹理')(self._sf)
end

function SDL图像:到精灵()
    local sf = self._sf
    -- if self._rect then
    --     sf = self:复制区域(self._rect)
    -- end
    if self._win then
        return self._win:创建精灵(sf):置中心(self._hx, self._hy)
    end
    return require('SDL.精灵')(sf):置中心(self._hx, self._hy)
end

function SDL图像:检查点(x, y)
    local _x, _y = self._x or 0, self._y or 0
    local _w, _h = self._sf.w, self._sf.h
    return (x >= _x) and (x < _x + _w) and (y >= _y) and (y < _y + _h)
end

function SDL图像:检查透明(x, y)
    local _, _, _, a = self:取像素(x, y)
    return a > 0
end

--xy从0开始
function SDL图像:取像素(x, y)--置区域?
    return self._sf:GetSurfacePixel(x, y)
end

--xy从0开始
function SDL图像:置像素(x, y, r, g, b, a)
    self._sf:SetSurfacePixel(x, y, r, g, b, a)
    return self
end

function SDL图像:保存文件(file, tp, quality)
    if not tp or tp == 'BMP' then
        return self._sf:SaveBMP(file)
    elseif tp == 'PNG' then
        return self._sf:SavePNG(file)
    elseif tp == 'JPG' then
        return self._sf:SaveJPG(file, quality)
    end
end

function SDL图像:置透明色(r, g, b)
    return self._sf:SetColorKey(r, g, b)
end

function SDL图像:取透明色()
    return self._sf:GetColorKey()
end

function SDL图像:置透明(a)
    self._sf:SetSurfaceBlendMode(SDL.BLENDMODE_BLEND)
    self._sf:SetSurfaceAlphaMod(a)
    return self
end

function SDL图像:取透明()
    return self._sf:GetSurfaceBlendMode()
end

function SDL图像:置颜色(r, g, b, a)
    self._sf:SetSurfaceColorMod(r, g, b)
    if a then
        self:置透明(a)
    end
    return self
end

function SDL图像:取颜色()
    return self._sf:GetSurfaceColorMod()
end

function SDL图像:置混合(b)
    self._sf:SetSurfaceBlendMode(b)
    return self
end

function SDL图像:取混合()
    return self._sf:GetSurfaceBlendMode()
end

function SDL图像:置区域(x, y, w, h)
    if x and y and w and h then
        self._rect = SDL.CreateRect(x, y, w, h)
    else
        self._rect = nil
    end
    return self
end

function SDL图像:取区域()
    return self._rect
end

function SDL图像:置渲染区域(x, y, w, h)
    if x and y and w and h then
        self._sf:SetClipRect(SDL.CreateRect(x, y, w, h))
    else
        self._sf:SetClipRect()
    end
    return self
end

function SDL图像:取渲染区域()
    return self._sf:GetClipRect()
end

function SDL图像:复制区域(x, y, w, h)
    if ggetype(x) == 'SDL_Rect' then
        local rect = x
        x, y = rect:GetRectXY()
        w, h = rect:GetRectWH()
    end
    local sf = SDL图像(w, h)
    if sf:渲染清除() then
        self:置区域(x, y, w, h):显示(0, 0)
        sf:渲染结束()
    end
    return sf
end

function SDL图像:平铺(w, h)
    if w < 0 or h < 0 then
        return self
    end
    local sf = SDL图像(w, h)
    if sf:渲染清除() then
        for y = 0, h, self._sf.h do
            for x = 0, w, self._sf.w do
                self:显示(x, y)
            end
        end
        sf:渲染结束()
    end
    return sf
end

function SDL图像:拉伸(w, h, linear)
    local sf = SDL图像(w, h)
    local dst = sf:取对象()
    if linear then
        self._sf:SoftStretch(nil, dst, nil)
    else
        self._sf:SoftStretchLinear(nil, dst, nil)
    end
    return sf
end

SDL图像.置拉伸 = SDL图像.拉伸

function SDL图像:九宫(W, H, L, T, R, B)
    assert(type(L) == 'number', '参数错误')
    T = T or L
    R = R or L
    B = B or T

    local w, h = self.宽度, self.高度
    local sf = SDL图像(W, H)
    if T + B > h then
        B = h - T
    end
    if L + R > w then
        R = w - L
    end
    if sf:渲染开始() then
        self:置区域(0, 0, L, T):显示(0, 0)
        if W <= w then
            if W - L - R > 0 then self:置区域(L, 0, W - L - R, T):显示(L, 0) end
        else
            self:复制区域(L, 0, w - L - R, T):平铺(W - L - R, T):显示(L, 0)
        end
        self:置区域(w - R, 0, R, T):显示(W - R, 0)

        if H <= h then
            if H - T - B > 0 then self:置区域(0, T, L, H - T - B):显示(0, T) end
        else
            self:复制区域(0, T, L, h - T - B):平铺(L, H - T - B):显示(0, T)
        end
        if W <= w and H <= h then
            if H - T - B > 0 and W - L - R > 0 then
                self:置区域(L, T, W - L - R, H - T - B):显示(L, T)
            end
        else
            self:复制区域(L, T, w - L - R, h - T - B):平铺(W - L - R, H - T - B):显示(L, T)
        end
        if H <= h then
            if H - T - B > 0 then self:置区域(w - R, T, R, H - T - B):显示(W - R, T) end
        else
            self:复制区域(w - R, T, R, h - T - B):平铺(R, H - T - B):显示(W - R, T)
        end

        self:置区域(0, h - B, L, B):显示(0, H - B)
        if W <= w then
            if W - L - R > 0 then self:置区域(L, h - B, W - L - R, H - B):显示(L, H - B) end
        else
            self:复制区域(L, h - B, w - L - R, B):平铺(W - L - R, B):显示(L, H - B)
        end
        self:置区域(w - R, h - B, R, B):显示(W - R, H - B)
        sf:渲染结束()
    end
    return sf
end

function SDL图像:转换格式(format)
    if type(format) == 'number' then
        if self._win then
            return self._win:创建图像(self._sf:ConvertSurfaceFormat(format))
        end
        return require('SDL.图像')(self._sf:ConvertSurfaceFormat(format))
    elseif ggetype(format) == 'SDL_PixelFormat' then
        if self._win then
            return self._win:创建图像(self._sf:ConvertSurface(format))
        end
        return require('SDL.图像')(self._sf:ConvertSurface(format))
    end
end

function SDL图像:填充颜色(r, g, b, a)
    self._sf:FillRect(r, g, b, a)
    return self
end

function SDL图像:置中心(x, y)
    self._hx, self._hy = x and math.floor(x), y and math.floor(y)
    return self
end

function SDL图像:取中心()
    return self._hx, self._hy
end

function SDL图像:取引用()
    return self._sf.refcount
end

function SDL图像:加引用()
    local refcount = self._sf.refcount
    self._sf.SetSurfaceRef(refcount + 1)
    return refcount
end

function SDL图像:减引用()
    local refcount = self._sf.refcount
    if refcount > 1 then
        self._sf.SetSurfaceRef(refcount + 1)
    end
    return refcount
end

function SDL图像:渲染清除(r, g, b, a)
    if r then
        self._sf:FillRect(r, g, b, a or 0)
    end
    table.insert(
        _target,
        1,
        {
            sf = self._sf,
            rect = SDL.CreateRect(0, 0, self._sf.w, self._sf.h)
        }
    )
    return true
end

SDL图像.渲染开始 = SDL图像.渲染清除
function SDL图像:渲染结束()
    table.remove(_target, 1)
end

--PremultiplyAlpha

return SDL图像
