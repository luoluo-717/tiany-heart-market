-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-04-29 15:12:12
-- @Last Modified time  : 2023-05-09 02:03:05
local SDL        = require('SDL')
local GGF        = require('GGE.函数')
local m_pack     = require('cmsgpack').pack
local m_unpack   = require('cmsgpack.safe').unpack
local log        = require('Android/日志')
local PackServer = require('SDL.网络.PackServer')
local 网络     = class('网络', PackServer)

local _path      = require('SDL.函数').取外部存储路径()

local _file
local _list      = {}
local _id

if GGF.判断文件(_path .. '/list.gge') then
    _list = table.load(GGF.读入文件(_path .. '/list.gge')) or {}
end

function 网络:连接事件(id)
    _id = id
    log:清空()
    log:添加(_path)
    log:添加('连接成功')
    log:置可见(true)
    self:发送(id, 0, _list)
end

function 网络:断开事件(id)
    log:添加('连接断开')
end

function 网络:接收事件(id, data)
    local t = m_unpack(data)
    if type(t) == 'table' then
        if t[1] == 1 then
            local path = string.format('%s/%s', _path, t[2])
            --path = path:lower():gsub('\\', '/')
            GGF.创建目录(path)
            _list[t[2]] = nil
            _file = io.open(path, 'wb')
            if _file then
                self:发送(id, 2)
            else
                log:添加('打开失败:' .. path)
            end
        elseif t[1] == 2 then
            if _file then
                _file:write(t[2])
                self:发送(id, 2)
            end
        elseif t[1] == 3 then
            if _file then
                _file:close()
                _file = nil
                _list[t[2]] = t[3]
                log:添加('>' .. t[2])
            end
        elseif t[1] == 0 then
            self:print('run')
            GGF.写出文件(_path .. '/list.gge', table.dump(_list))
            self:run()
        end
    end
end

网络.Send = PackServer.发送

function 网络:发送(id, ...)
    self:Send(id, m_pack { ... })
end

function 网络:print(...)
    local t = { ... }
    for i = 1, select('#', ...) do
        t[i] = tostring(t[i])
    end

    log:添加(table.concat(t, '\t'))
    self:发送(_id, 4, t)
end

local ppath = package.path
local pcpath = package.cpath
function 网络:run()
    gge.isdebug = true
    print = function(...)
        self:print(...)
    end
    local g = {
        print = print
    }
    g._G = g
    self.env = setmetatable(g, { __index = 初始环境 })

    local path = ''
    for i, v in ipairs {
        '!/lua/?.lua',
        ';!/lua/?/?.lua',
        ';!/lua/lua/?.lua',
        ';!/lua/lua/?/?.lua',
        ';!/lua/lib/?.lua',
        ';!/lua/lib/?/?.lua',
        ';!/ggelua/?.lua',
        ';!/ggelua/?/?.lua',
        ';!/ggelua/lua/?.lua',
        ';!/ggelua/lua/?/?.lua',
        ';!/ggelua/lib/?.lua',
        ';!/ggelua/lib/?/?.lua'
    } do
        path = path .. v:gsub('!', _path)
    end

    package.path = path
    package.cpath = pcpath .. string.format(';%s/lib/%s/lib?.so', _path, pcpath:match('lib/(.+)/'))

    package.resume()
    package.loaded.SDL = SDL
    package.loaded.ggelua = gge

    package.loaded['SDL.窗口'] = function(t)
        引擎.宽度 = t.宽度
        引擎.高度 = t.高度
        return 引擎
    end

    gge.require('GGE', self.env)
    gge.require('main', self.env)

    local w, h = 引擎:取渲染宽高()

    引擎._inited = false
    引擎:_Event(0x200, { event = SDL.WINDOWEVENT_SIZE_CHANGED, data1 = w, data2 = h })
end

return 网络
