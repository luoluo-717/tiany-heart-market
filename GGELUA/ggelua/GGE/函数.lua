-- @Author              : GGELUA
-- @Date                : 2022-04-03 14:00:28
-- @Last Modified by    : baidwwy
-- @Last Modified time  : 2024-06-01 02:15:17

local gge = gge
local _print = print
local _ENV = setmetatable({}, { __index = _G })
MD5 = require('md5')

function isnan(v) --tostring(v)=='nan'
    return v ~= v
end

gge.isnan = isnan

local inf = 1 / 0
function isinf(v)
    return v == inf
end

gge.isinf = isinf
--G ===========================================================
function pairsi(t) --泛型倒序
    local i = #t + 1
    return function()
        i = i - 1
        if i >= 1 then
            return i, t[i]
        end
    end
end

_G.pairsi = pairsi
--table ===========================================================
function insert(t) --比table.insert 快
    local i = #t + 1
    return function(data)
        if data ~= nil then
            t[i] = data
            i = i + 1
        end
    end
end

function 复制表(t) --FIXME loop
    local r = {}
    if type(t) == 'table' then
        for k, v in pairs(t) do
            local tp = type(v)
            if tp == 'table' then
                r[k] = 复制表(v)
            elseif tp == 'string' or tp == 'number' or tp == 'boolean' then
                r[k] = v
            end
        end
    end
    return r
end

table.copy = 复制表
tablecopy = 复制表

function 取表数量(t)
    local max = 0
    for k, v in pairs(t) do
        max = math.max(max, k)
    end
    return max
end

table.maxn = 取表数量

function _ENV.print(t)
    _print(require('serpent').block(t))
    local info = debug.getinfo(2)
    _print(string.format('%s:%d', info.source, info.currentline))
end

table.print = _ENV.print

function 表到文本(t)
    return require('serpent').dump(t)
end

table.dump = 表到文本

function 文本到表(t)
    return require('serpent').load(t)
end

table.load = 文本到表

function 表序列化(t)
    return require('cmsgpack').pack(t)
end

table.msgpack = 表序列化

function 表反序列化(t)
    return require('cmsgpack.safe').unpack(t)
end

table.unmsgpack = 表反序列化

function loadini(str, len)
    local section
    local data = {}
    local function Parser(line)
        local tempSection = line:match('^%[([^%[%]]+)%]$') --节点
        if tempSection then
            section = tonumber(tempSection) and tonumber(tempSection) or tempSection
            data[section] = data[section] or {}
        end
        local param, value = line:match('^(.-)%s*=%s*(.+)$') --line:match('^([%w|_]+)%s-=%s-(.+)$');
        if param then
            -- if tonumber(param) then
            --     param = tonumber(param)
            -- elseif param == 'true' then
            --     param = true
            -- elseif param == 'false' then
            --     param = false
            -- end
            if tonumber(value) then
                value = tonumber(value)
            elseif value == 'true' then
                value = true
            elseif value == 'false' then
                value = false
            end
            if section then
                data[section][param] = value
            else
                data[param] = value
            end
        end
    end

    if len and #str == len then
        for line in str:gmatch('([^\r\n]+)') do
            if line ~= '' then
                Parser(line)
            end
        end
    else
        local file = assert(io.open(str, 'r'))
        for line in file:lines() do
            if line ~= '' then
                Parser(line)
            end
        end
        file:close()
    end

    return data
end

table.loadini = loadini

function dumpini(t, file)
    assert(type(t) == 'table', '参数错误')
    for k, v in pairs(t) do
        assert(type(k) == 'string', '参数错误')
        assert(type(v) == 'table', '参数错误')
    end
    local r = ''
    for k, v in pairs(t) do
        r = r .. string.format('[%s]\n', k)
        for k, v in pairs(v) do
            r = r .. string.format('%s = %s\n', k, v)
        end
    end
    if file then
        写出文件(file, r)
    else
        return r
    end
end

table.dumpini = dumpini

function loadcsv(str)

end

function dumpcsv(str)

end

function 随机表(t, n)
    local r = {}
    if type(t) == 'table' then
        local tk = {}
        for k in pairs(t) do
            table.insert(tk, k)
        end
        n = n or math.random(#tk)

        while n > 0 do
            n = n - 1
            local k = table.remove(tk, math.random(#tk))
            r[k] = t[k]
        end
    end
    return r
end

--string ===========================================================
function 分割字符(str, tv)
    local t = tv or {}
    local add = insert(t)
    for p, c in utf8.codes(str) do
        add(utf8.char(c))
    end
    return t
end

splitchar = 分割字符
string.splitchar = splitchar

function 分割文本(input, delimiter, num)
    if not input then
        return {}
    end
    if type(delimiter) ~= 'string' or #delimiter <= 0 then
        return
    end
    local start = 1
    local arr = {}
    local add = insert(arr)
    while true do
        local pos = string.find(input, delimiter, start, true)
        if not pos then
            break
        end
        add(string.sub(input, start, pos - 1))
        start = pos + #delimiter
    end
    add(string.sub(input, start))
    return arr
end

split = 分割文本
string.split = split

function 替换文本(str, as, bs)
    repeat
        local a, b = str:find(as, 1, true)
        if a then
            str = str:sub(1, a - 1) .. bs .. str:sub(b + 1)
        end
    until a == nil
    return str
end

gsub = 替换文本

function 是否邮箱(str)
    return str:match('[%d%a]+@%a+.%a+') == str
end

function 删首尾空(str)
    return str:match('%s*(.-)%s*$')
end

function 删除文件名(file)
    --local sep = package.config:sub(1, 1)
    file = file:gsub('\\', '/')
    return string.match(file, '(.+)/[^/]*%.%w+$')
end

delfilename = 删除文件名

function 取文件名(str, ex)
    str = str:gsub('\\', '/')
    if str:find('/') then
        str = str:match('.+/([^/]*%.?.+)$')
    end
    return ex and 删除扩展名(str) or str
end

getfilename = 取文件名


function 删除扩展名(str)
    local idx = str:match('.+()%.%w+$')
    if (idx) then
        return str:sub(1, idx - 1)
    else
        return str
    end
end

delextname = 删除扩展名

function 取扩展名(str)
    return str:match('.+%.(%w+)$')
end

getextname = 取扩展名

function 格式化货币(n) -- credit http://richard.warburton.it
    local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
end

--match ===========================================================
function 四舍五入(v)
    return math.floor(v + 0.5)
end

round = 四舍五入
math.round = round
--=============================================================================
function argb(a, r, g, b)
    return a << 24 | r << 16 | g << 8 | b
end

ARGB = argb

function rgba(r, g, b, a)
    return r << 24 | g << 16 | b << 8 | a
end

RGBA = argb

ftoi = argb --4toINT
function itof(v)
    return v >> 24 & 0xFF, v >> 16 & 0xFF, v >> 8 & 0xFF, v & 0xFF
end

function itoip(v)
    return string.format('%d.%d.%d.%d', itof(v))
end

function rgb(r, g, b)
    return r << 16 | g << 8 | b
end

RGB = rgb

function xrgb(r, g, b)
    return ARGB(255, r, g, b)
end

XRGB = xrgb

function HSVtoRGB(h, s, v, a)
    if s == 0 then --gray
        return v, v, v, a
    end
    h = math.fmod(h, 1) / (60 / 360)
    local i = math.floor(h)
    local f = h - i
    local p = v * (1 - s)
    local q = v * (1 - s * f)
    local t = v * (1 - s * (1 - f))
    if i == 0 then
        return v, t, p
    elseif i == 1 then
        return q, v, p
    elseif i == 2 then
        return p, v, t
    elseif i == 3 then
        return p, q, v
    elseif i == 4 then
        return t, p, v
    else
        return v, p, q
    end
end

--filesystem =============================================================================
function 遍历目录(path, ...)
    if select('#', ...) > 0 then
        path = path:format(...)
    end
    local pn = #path + 2
    local sep = package.config:sub(1, 1)
    local lfs = require('lfs')
    local dir, u = lfs.dir(path)
    local pt = {}
    return function()
        repeat
            local file = dir(u)

            if file then
                local f = path .. sep .. file
                local attr = lfs.attributes(f)

                if attr and attr.mode == 'directory' then
                    if file ~= '.' and file ~= '..' then
                        table.insert(pt, f)
                    end
                    file = '.'
                else
                    return f, f:sub(pn)
                end
            elseif pt[1] then
                path = table.remove(pt, 1)
                dir, u = lfs.dir(path)
                file = '.'
            end
        until file ~= '.'
    end
end

dir = 遍历目录

function 遍历文件(path, ...)
    if select('#', ...) > 0 then
        path = path:format(...)
    end
    local pn = #path + 2
    local sep = package.config:sub(1, 1)
    local lfs = require('lfs')
    local dir, u = lfs.dir(path)

    return function()
        repeat
            local file = dir(u)
            if file then
                local f = path .. sep .. file
                local attr = lfs.attributes(f)

                if attr and attr.mode ~= 'directory' then
                    return f, f:sub(pn)
                end
            end
        until not file
    end
end

function 创建目录(path, ...)
    if not path then
        return
    end
    if select('#', ...) > 0 then
        path = path:format(...)
    end
    local lfs = require('lfs')
    path = path:gsub('\\', '/'):match('(.+)/')
    path = 分割文本(path, '/')
    for i, v in ipairs(path) do
        lfs.mkdir(table.concat(path, '/', 1, i))
        end
    end

mkdir = 创建目录

function 复制文件(old, new)
    local rf = io.open(old, 'rb')
    if rf then
        创建目录(new)
        local wf = io.open(new, 'wb')
        if wf then
            wf:write(rf:read('a'))
            rf:close()
            wf:close()
            return true
        end
        rf:close()
    end
    return false
end

copyfile = 复制文件

function 复制目录(old, new)
    for file in 遍历目录(old) do
        复制文件(file, new .. '/' .. 取文件名(file))
    end
end

copydir = 复制目录

function 读入文件(path, def)
    if not path then
        return def
    end

    local file = io.open(path, 'rb')
    if file then
        local data = file:read('a')
        file:close()
        return data
    end
    return def
end

readfile = 读入文件

function 写出文件(path, data)
    创建目录(path)
    local file = io.open(path, 'wb')
    if file then
        file:write(data)
        file:close()
        return true
    end
    return false
end

writefile = 写出文件

function 判断文件(file, ...)
    if select('#', ...) > 0 then
        file = file:format(...)
    end
    local lfs = require('lfs')
    return lfs.attributes(file, 'mode') == 'file'
end

checkfile = 判断文件

function 判断目录(path, ...)
    if select('#', ...) > 0 then
        path = path:format(...)
    end
    local lfs = require('lfs')
    return lfs.attributes(path, 'mode') == 'directory'
end

checkdir = 判断目录

function setfenv(fn, env)
    local i = 1
    while true do
        local name = debug.getupvalue(fn, i)
        if name == '_ENV' then
            debug.upvaluejoin(
                fn,
                i,
                (function()
                    return env
                end),
                1
            )
            break
        elseif not name then
            break
        end
        i = i + 1
    end
    return fn
end

function getfenv(fn)
    local i = 1
    while true do
        local name, val = debug.getupvalue(fn, i)
        if name == '_ENV' then
            return val
        elseif not name then
            break
        end
        i = i + 1
    end
end

function printuv(fn)
    local i = 1
    while true do
        local k, v = debug.getupvalue(fn, i)
        if k then
            _print(i, k, v)
        else
            break
        end
        i = i + 1
    end
end

function print2(...)
    local info = debug.getinfo(2)
    local arg = { ... }
    for i = 1, select('#', ...) do
        arg[i] = tostring(arg[i])
    end
    _print(table.concat(arg, '\t'), string.format('%s:%d', info.source, info.currentline))
end

return _ENV
