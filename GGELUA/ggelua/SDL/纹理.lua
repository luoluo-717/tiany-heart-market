-- @Author              : GGELUA
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified by    : baidwwy
-- @Last Modified time  : 2024-06-27 20:22:18

local SDL = require('SDL')
local assert = assert
local ggetype = ggetype
local IMG = SDL.IMG_Init()

local SDL纹理 = class('SDL纹理')

function SDL纹理:SDL纹理(...)
    if ... == nil then return end
    self._win = SDL._win --默认窗口
    local rdr = self._win:取渲染器()
    local arg = { ... }
    local vtype = ggetype(arg[1])

    if vtype == 'number' and type(arg[2]) == 'number' then --默认 SDL_TEXTUREACCESS_TARGET, SDL_PIXELFORMAT_ARGB8888
        self._tex = assert(rdr:CreateTexture(table.unpack(arg)), SDL.GetError()) --宽度,高度,SDL_TEXTUREACCESS_?,SDL_PIXELFORMAT_?
    elseif vtype == 'string' then --默认 SDL_TEXTUREACCESS_STATIC
        self._tex = assert(rdr:LoadTexture(table.unpack(arg)), SDL.GetError()) --FILE, SDL_TEXTUREACCESS_?
    elseif vtype == 'SDL_Texture' then
        self._tex = arg[1]
    elseif vtype == 'SDL_Surface' then
        self._tex = assert(rdr:CreateTextureFromSurface(table.unpack(arg)), SDL.GetError())
    elseif vtype == 'SDL图像' and arg[1]:取对象() then
        self._tex = assert(rdr:CreateTextureFromSurface(arg[1]:取对象(), arg[2]), SDL.GetError())
    elseif vtype == 'SDL读写' and arg[1]:取对象() then
        self._tex = assert(rdr:LoadTexture_RW(arg[1]:取对象(), arg[2]), SDL.GetError())
    elseif vtype == 'SDL_RWops' then
        self._tex = assert(rdr:LoadTexture_RW(table.unpack(arg)), SDL.GetError())
    elseif vtype ~= nil then
        error('未知模式')
    end

    if ggetype(self._tex) == 'SDL_Texture' then
        self._win._texs[self] = self._tex
        self._format, self._access, self.宽度, self.高度 = self._tex:QueryTexture()
        if self._access == SDL.TEXTUREACCESS_TARGET then
            self._tex:SetTextureBlendMode(SDL.BLENDMODE_BLEND)
        end
    else
        -- return false
    end
end

function SDL纹理:取对象()
    return self._tex
end

function SDL纹理:取模式()
    return self._access
end

function SDL纹理:取格式()
    return self._format
end

function SDL纹理:取宽度()
    return self.宽度 or 0
end

function SDL纹理:取高度()
    return self.高度 or 0
end

-- function SDL纹理:复制()
-- end

function SDL纹理:锁定(x, y, w, h)
    if self._tex then
        assert(self._access == SDL.TEXTUREACCESS_STREAMING, '无法锁定')
        return self._tex:LockTexture2(x, y, w, h)
    end
end

function SDL纹理:解锁()
    if self._tex then
        self._tex:UnlockTexture()
    end
    return self
end

function SDL纹理:写像素(pixels, pitch)
    self._tex:UpdateTexture(nil, pixels, pitch)
end

function SDL纹理:写图像(x, y, w, h, sf)
    if ggetype(sf) == 'SDL图像' then
        sf = sf:取对象()
    end
    return self._tex:UpdateTextureFormSurface(x, y, w, h, sf)
end

function SDL纹理:到精灵()
    return self._win:创建精灵(self)
end

function SDL纹理:到图像(x, y, w, h)
    assert(self._access == SDL.TEXTUREACCESS_STREAMING, '无法锁定')
    x = x or 0
    y = y or 0
    w = w or self.宽度
    h = h or self.高度
    local sf = self._tex:LockTextureToSurface2(x, y, w, h)
    if sf then
        local img = require('SDL.图像')(sf)
        local copy = img:复制()
        self._tex:UnlockTexture()
        return copy
    end
end

function SDL纹理:置过滤(v)
    if self._tex then
        self._tex:SetTextureScaleMode(v)
    end
    return self
end

function SDL纹理:渲染开始(r, g, b, a)
    if self._access == SDL.TEXTUREACCESS_TARGET then
        return self._win:置渲染区(self._tex) and self._win:渲染清除(r, g, b, a or 0)
    end
end

SDL纹理.渲染清除 = SDL纹理.渲染开始
function SDL纹理:渲染结束()
    self._win:置渲染区()
    return self
end

function SDL纹理:渲染(fun, r, g, b, a)
    self.渲染重建 = function()
        if self:渲染开始(r, g, b, a) then
            fun()
            self:渲染结束()
        end
    end
    if self:渲染开始(r, g, b, a) then
        fun()
        self:渲染结束()
    end
    return self
end

return SDL纹理
