require("资源/base")
local xyq_tcp = require("gxyq.tcp")
local tcp = class("tcp", "base")
function tcp:初始化(data)
    local ud, info = xyq_tcp(data)
    self.ud = ud
    for k, v in pairs(info) do
        self[k] = v
    end
    self.wframe = self.frame
    self.cache = {
        [0] = {}
    }
    self.pal = {}
    self.cp = 0
    self.p = 0
    self.i = 0
end

function tcp:取纹理(id)
    self.更新时间(self)
    id = id - 1 + self.i
    local p = self.p
    if self.cache[p][id] then
        return self.cache[p][id]
    end
    if self.cp ~= p and self.pal[p] ~= nil then
        self.cp = p
        self.ud:SetPal(self.pal[p])
    end
    local sf, info = self.ud:GetFrame(id)
    local tex = require("SDL.纹理")(sf)
    self.cache[p][id] = tex
    if info then
        for k, v in pairs(info) do
            tex[k] = v
        end
    else
        tex.x = 0
        tex.y = 0
    end
    return tex
end

function tcp:取精灵(...)
    local tex = self:取纹理(...)
    return require("SDL.精灵")(tex):置中心(tex.x, tex.y)
end

function tcp:取灰度精灵(...)
    return self:取图像(...):到灰度():到精灵()
end

function tcp:取动画(d)
    if d > self.group then d = 1 end
    assert(d <= self.group, 'message')
    local t =
        setmetatable(
            {
                p = 0,
                i = (d - 1) * self.frame,
                帧数 = self.wframe,
                帧率 = 1 / 8,
                宽度 = self.width,
                高度 = self.height
            },
            { __index = self, __newindex = self }
        )
    return require 'GGE.动画' (t)
end

function tcp:取图像(id, fun)
    id = id - 1
    local sf, info = self.ud:GetFrame(id)
    sf = require("SDL.图像")(sf)
    sf:置中心(info.x, info.y)
    for k, v in pairs(info) do
        sf[k] = v
    end
    if type(fun) == "function" then
        sf:渲染开始()
        fun(sf)
        sf:渲染结束()
    elseif ggetype(fun) == "SDL图像" then
        sf:渲染开始()
        fun:显示(0, 0)
        sf:渲染结束()
    end
    return sf
end

function tcp:调色(pp, p) --资源/配置/pp
    if not self.pal[0] then
        self.pal[0x00000000] = self.ud:GetPal() --默认颜色
    end
    if pp and not self.pal[p] then
        local pid = {(p >> 24) & 0xFF, (p >> 16) & 0xFF, (p >> 8) & 0xFF, p & 0xFF} --4个位置
        for i, v in ipairs(pp) do
            local n = pid[i] --方案值
            if n and v.a and v.b and v[n] and #v[n] == 9 then --ab范围
                self.ud:SetPP(v.a, v.b, table.unpack(v[n])) --设置分段颜色
            end
        end
        self.cache[p] = {}
        self.pal[p] = self.ud:GetPal()
        self.cp = p
        return true
    end
end

function tcp:炫彩调色(pp, p, data, rsid)
    if not self.pal[0] then
        self.pal[0] = self.ud:GetPal()
    end
    if pp and not self.pal[p + rsid] then
        local pid = {
            p >> 24 & 255,
            p >> 16 & 255,
            p >> 8 & 255,
            p & 255
        }
        for i, v in ipairs(pp) do
            local n = pid[i]
            if n and v.a and v.b and v[n] and 9 == #v[n] then
                v[n][1] = data[1][1].R
                v[n][2] = data[1][1].G
                v[n][3] = data[1][1].B
                v[n][4] = data[1][2].R
                v[n][5] = data[1][2].G
                v[n][6] = data[1][2].B
                v[n][7] = data[1][3].R
                v[n][8] = data[1][3].G
                v[n][9] = data[1][3].B
                self.ud:SetPP(v.a, v.b, table.unpack(v[n]))
            end
        end
        self.cache[p + rsid] = {}
        self.pal[p + rsid] = self.ud:GetPal()
        self.cp = p + rsid
        return true
    end
end

return tcp
