-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2024-05-04 11:33:43

local SDL = require('SDL')
local m_pack = require('cmsgpack').pack
local m_unpack = require('cmsgpack.safe').unpack
local _list = setmetatable({}, { __mode = 'v' })
local function t_unpack(t)
    local max = 0
    for k, v in pairs(t) do
        max = math.max(max, k)
    end
    return table.unpack(t, 1, max)
end

local _event = SDL.RegisterUserEvent(
    function(code, data1, data2)
        local self = _list[code]
        if self then
            local id, str = self._th:Receive(data1)
            if self._co[id] then
                coroutine.xpcall(self._co[id], t_unpack(m_unpack(str)))
                self._co[id] = nil
            end
        end
    end
)
local SDL线程 = class 'SDL线程'
local init = [[
    local m_pack = require('cmsgpack').pack
    local m_unpack = require('cmsgpack.safe').unpack

    local function t_unpack(t)
        local max = 0
        for k, v in pairs(t) do
            max = math.max(max, k)
        end
        return table.unpack(t, 1, max)
    end

    return function(par)
        local t = m_unpack(par)
        local k = table.remove(t, 1)
        if type(_G[k]) == 'function' then
            local r = { ggexpcall(_G[k], t_unpack(t)) }
            if next(r) then
                return m_pack(r)
            end
        end
    end
]]

function SDL线程:SDL线程(main)
    self._code = gge.hash(tostring(self))
    _list[self._code] = self
    self._co = {}
    self._th = assert(SDL.CreateThread(init, main), '创建失败')
end

function SDL线程:__index(k)
    local co, main = coroutine.running()
    if co and not main and coroutine.isyieldable() then
        return function(_, ...)
            local id = self._th:Send(_event, self._code, m_pack { k, ... })
            self._co[id] = co
            return coroutine.yield()
        end
    else
        error('必须协程内调用')
    end
end

return SDL线程
