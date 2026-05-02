-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-04-14 06:58:54
-- @Last Modified time  : 2024-05-04 11:27:51

local SDL = require('SDL')
if not SDL.Init(0x00000001|0x00004000) then --SDL_INIT_TIMER|SDL_INIT_EVENTS
    gge.messagebox(SDL.GetError(), 'SDL_Init')
end
local _userevents
SDL.RegisterUserEvent = function(id, fun) --用户事件
    if not _userevents then
        _userevents = {}
    end
    if type(id) == 'function' then
        fun = id
        local id = SDL.RegisterEvents()
        _userevents[id] = fun
        return id
    elseif type(id) == 'number' and type(fun) == 'function' then
        _userevents[id] = fun
        return true
    end
end

local _list = setmetatable({}, { __mode = 'v' })
local 日志 = require('GGE.日志')
local GGE服务 = class('GGE服务', 日志)

function GGE服务:GGE服务(name)
    _list[self] = self
    self._reg = setmetatable({}, { __mode = 'k' }) --注册消息
    self._tick = {}
    self._timer = setmetatable({}, { __mode = 'kv' })
    if name then
        self:GGE日志(name, name)
    end
end

function GGE服务:定时(ms, fun, ...)
    if type(fun) == 'function' then
        local t = { ms = ms, time = os.clock() * 1000 + ms, fun = fun, arg = { ... } }
        self._timer[t] = t
        t.删除 = function()
            self._timer[t] = nil
        end
        return t
    end
    local co, main = coroutine.running()
    if not main then
        self._tick[co] = os.clock() * 1000
        coroutine.yield()
        self._tick[co] = nil
        return true
    end
end

function GGE服务:注册事件(k, t)
    if t == nil then
        t = k
        k = {}
    end
    if type(t) == 'table' then
        self._reg[k] = t
        return k, t
    end
end

function GGE服务:取消注册事件(k)
    self._reg[k] = nil
end

local function _Sendreg(self, k, ...)
    local reg = {}
    for _, v in pairs(self._reg) do
        if type(v[k]) == 'function' then
            table.insert(reg, v)
        end
    end
    for _, v in ipairs(reg) do
        ggexpcall(v[k], v, ...)
    end
end

function GGE服务:_UPDATE()
    _Sendreg(self, '循环事件')
    if self.更新 then
        ggexpcall(self.更新, self)
    end
    if next(self._tick) then --协程定时
        local oc = os.clock() * 1000
        local tick = self._tick
        self._tick = {}
        for co, t in pairs(tick) do
            if oc >= t then
                coroutine.xpcall(co)
            end
        end
    end
    if next(self._timer) then --函数定时
        local oc = os.clock() * 1000
        local timer = {}
        for k, t in pairs(self._timer) do --防invalid key to 'next'
            if oc >= t.time then
                timer[k] = t
            end
        end
        for k, t in pairs(timer) do
            t.ms = ggexpcall(t.fun, t.ms, table.unpack(t.arg))
            if t.ms == 0 or type(t.ms) ~= 'number' then
                self._timer[k] = nil
            else
                t.time = t.ms + oc
            end
        end
    end
end

local e, x, y = SDL.CreateEvent(), 0, 0
local PollEvent = e.PollEvent
local GetEvent = e.GetEvent
local Delay = SDL.Delay
function main()
    ggexpcall(
        function()
            while true do
                while PollEvent(e) do
                    local t = GetEvent(e)
                    if _userevents and _userevents[t.type] then --用户消息
                        _userevents[t.type](t.code, t.data1, t.data2)
                    end
                end
                for _, v in pairs(_list) do
                    v:_UPDATE()
                end
                --Delay(10)
            end
        end
    )
end

return GGE服务
