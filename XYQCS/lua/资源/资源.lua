local SDL = require('SDL')
local SDLF = require('SDL.函数')
local res_tcp = require('资源/tcp')
local res_ani = require('资源/动画')
local res_png = require('SDL.图像')
local 资源基类 = require 'GGE.资源'
local 资源配置 = require '资源/配置'
local 资源 = class('资源',资源配置,资源基类)

function 资源:初始化()
    self:初始化配置()
    if gge.platform == 'Windows' then
        self:添加路径('assets')
    else
        self:添加路径('assets')
    end
    self.UI素材={}
    self.cache = {}
    self.sndcache = {}
    self.mapcache = {}
    self.mcache = setmetatable({}, {__mode = 'v'})
    引擎:注册事件(self, self) --更新事件
end

function 资源:添加WDF(file)
    print('添加WDF', file)
    self:添加加载器(require('资源/wdf')(file))
end

function 资源:更新事件()
    local time = os.time()
    for k, v in pairs(self.cache) do
        if type(v) == 'table' and v.检查时间 and v:检查时间(time) then
            self.mcache[k] = self.cache[k]
            self.cache[k] = nil
        end
    end
    for k, v in pairs(self.mapcache) do
        if type(v) == 'table' and v.检查时间 and v:检查时间(time) then
            self.mapcache[k] = nil
        end
    end
end

function 资源:取地图(path)
    if self.mapcache[path] then
        self.mapcache[path]:更新时间(60)
        return self.mapcache[path]
    end
    local r = self:是否存在(path)
    if ggetype(r) == 'string' then
        self.mapcache[path] = require('资源/map')(r)
        return self.mapcache[path]
    elseif ggetype(r) == 'wdf' then
        local data = r:取数据(path)
        self.mapcache[path] = require('资源/map')(data, #data)
        return self.mapcache[path]
    end
end

function 资源:取动画(path,path1,path2)
    return self:get(path)
end

function 资源:取精灵(path)
    return self:get(path):取精灵(1)
end

function 资源:取图像(path)
    return self:get(path):取图像(1)
end

function 资源:取图片(path)
    path = self:是否存在(path)
    if path then
        if self.cache[path] then --5分钟缓存
            self.cache[path]:更新时间()
            return self.cache[path]
        elseif self.mcache[path] then --弱缓存
            self.cache[path] = self.mcache[path]
            self.cache[path]:更新时间()
        else
            local data = res_png(path)
            self.cache[path] = data
        end
        return self.cache[path]
    end
end

function 资源:取动画2(path)
    return res_ani(self:get(path))
end

function 资源:取动画3(tcp)
    return res_ani(tcp)
end

function 资源:get(path)
    local data
    local paths = path
    if type(path) == "table" then path  = path[1] end
    -- path = self:是否存在(path)
    local r = self:是否存在(path)
    if self.cache[path] then
        self.cache[path]:更新时间()
        return self.cache[path]
    elseif self.mcache[path] then
        self.cache[path] = self.mcache[path]
        self.cache[path]:更新时间()
        return self.cache[path]
    end
    if ggetype(r) == 'string' then
        data = self:取数据(path)
    elseif ggetype(r) == 'wdf' then
        data = r:取数据(path)
    end
    if data then
        self.cache[path] = res_tcp(data)
        return self.cache[path]
    end
    __下载数据[#__下载数据+1] = {paths}
    coroutine.wrap(function ()
        httpdata:检查更新()
    end)()
    return res_tcp(self:取数据('shape/FCD58523.was'))
end

function 资源:取地址(path,xh,lx)
    if lx == "音效" then
        if not xh then return nil end
        if self:是否存在(path..xh..'.wav') then
            return path..xh..'.wav'
        else
            local dz = path..string.sub(string.format("%#X",xh),3)..'.wav'
            local dz2 = path..string.sub(string.format("%#x",xh),3)..'.wav'
            local dz3 = path.."0"..string.sub(string.format("%#X",xh),3)..'.was'
            local dz4 = path.."00"..string.sub(string.format("%#X",xh),3)..'.was'
            if self:是否存在(dz) then
                return dz
            elseif self:是否存在(dz2) then
                return dz2
            elseif self:是否存在(dz3) then
                return dz3
            elseif self:是否存在(dz4) then
                return dz4
            else
                return nil
            end
        end
    else
        if not xh then
            if path == 'shape/mx/' then
                xh = 0xBFCA22B3
            else
                path = 'shape/'
                xh = 0xFCD58523
            end
        end
        if self:是否存在(path..xh..'.was') then
            return path..xh..'.was'
        else
            if tonumber(xh)==nil  then
                print("找不到资源 "..path..xh..'.was')
                path = 'shape/'
                xh = 0xFCD58523
            end
            local dz = path..string.sub(string.format("%#X",xh),3)..'.was'
            local dz2 = path..string.sub(string.format("%#x",xh),3)..'.was'
            local dz3 = path.."0"..string.sub(string.format("%#X",xh),3)..'.was'
            local dz4 = path.."00"..string.sub(string.format("%#X",xh),3)..'.was'
            if self:是否存在(dz) then
                return dz
            elseif self:是否存在(dz2) then
                return dz2
            elseif self:是否存在(dz3) then
                return dz3
            elseif self:是否存在(dz4) then
                return dz4
            else
                print('未找到资源 '..path..xh..'.was')
                __下载数据[#__下载数据+1] = {dz}
                __下载数据[#__下载数据+1] = {dz2}
                coroutine.wrap(function ()
                    httpdata:检查更新()
                end)()
                return 'shape/FCD58523.was',dz,dz2
            end
        end
    end
end


function 资源:取地址1(path)
    if self:是否存在(path) then
        return path
    else
        return 'shape/FCD58523.was',dz,dz2
    end
end

function 资源:置染色(tcp, a, b, c, d)
    local wpal = self:dewpal(a)
    if b == nil then b = 0 end
    if c == nil then c = 0 end
    if d == nil then d = 0 end
    if b > 0 then b = b + 1 end
    if c > 0 then c = c + 1 end
    if d > 0 then d = d + 1 end
    local xx = string.format('0x%02d%02d%02d%02d', b, c, d, 0x01)
    tcp:调色(wpal, tonumber(xx))
end

function 资源:取染色(path)
    path = self:是否存在('wpal/'..path..'.wpal')
    if path then
        local data = self:取数据(path)
        if data then
            return self:depp(data)
        end
    end
end

function 资源:公共资源(path)
    path = self:是否存在(path)
    if path then
        self.UI素材[#self.UI素材+1]=require('SDL.图像')(path)
    end
end

function 资源:getPNGCC(id,x,y,w,h,txt)
    local path = id..'*'..x..'*'..y..'*'..w..'*'..h
    if self.cache[path] then --5分钟缓存
        self.cache[path]:更新时间()
        if txt then
            return self.cache[path]:复制()
        else
            return self.cache[path]
        end
    elseif self.mcache[path] then --弱缓存
        self.cache[path] = self.mcache[path]
        self.cache[path]:更新时间()
        if txt then
            return self.cache[path]:复制()
        else
            return self.cache[path]
        end
    end
    self.cache[path] = self.UI素材[id]:复制区域(x,y,w,h)
    if txt then
        return self.cache[path]:复制()
    else
        return self.cache[path]
    end
end

function 资源:读入文件(path)
    return self:取数据(path)
end

function 资源:写出文件(path,dtat)
    SDL.写出文件(SDLF.取内部存储路径()..'/'..path,dtat)
end

return 资源
