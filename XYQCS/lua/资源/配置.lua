--[[
    @Author       : GGELUA
    @Date         : 2022-04-10 10:30:38
Last Modified by: GGELUA
Last Modified time: 2023-07-20 21:55:37
--]]
local ggf = require('GGE.函数')
local SDL = require 'SDL'
local en64 = require('base64').encode
local de64 = require('base64').decode
local unpk = require('cmsgpack').unpack
local pack = require('cmsgpack').pack

local s_format = string.format
local s_unpack = string.unpack
local t_insert = table.insert
local t_remove = table.remove
local ipairs = ipairs
local pairs = pairs
local assert = assert
local tonumber = tonumber
local toutf8 = gge.gbktoutf8
local togbk = gge.utf8togbk

local 配置 = class('资源配置')

function 配置:初始化配置()
    local SDLF = require('SDL.函数')
    local cfg =zdloadstring(SDL.LoadFile(SDLF.取内部存储路径()..'/configure.txt'))
    -- if data then
    --     cfg = ggf.ini(data, #data)
    --     cfg = cfg.Setting
    -- end
    -- for k, v in pairs(cfg) do
    --     print('cfg', k, v)
    -- end
    if not cfg then
        cfg = {}
    end
    self.配置 = {}
    self.配置.音乐 = cfg.音乐 or 1
    self.配置.音效 = cfg.音效 or 1
    self.配置.音乐音量 = tonumber(cfg.音乐音量) or 80
    self.配置.音效音量 = tonumber(cfg.音效音量) or 80
    self.配置.账号 = cfg.账号 and tostring(cfg.账号) or ''
    self.配置.密码 = cfg.密码 and tostring(cfg.密码) or ''
    self.配置.版本号 = cfg.版本号
    self.配置.玩家显示 = cfg.玩家显示
    self.配置.首次更新 = cfg.首次更新
    self.配置.显示变身造型 = tonumber(cfg.显示变身造型) or 1
    self.配置.关闭遮罩 = tonumber(cfg.关闭遮罩) or 0
    self.配置.锦衣 = tonumber(cfg.锦衣) or 1
    self.配置.轮盘移动 = tonumber(cfg.轮盘移动) or 0
    self.配置.显示坐骑 = tonumber(cfg.显示坐骑) or 1

end

local function _split(str, mark)
    local t = {}
    local N = 1
    for line in str:gmatch('([^' .. mark .. ']+)') do
        if tonumber(line) then
            t[N] = tonumber(line)
        else
            t[N] = line
        end
        N = N + 1
    end
    return t
end

--动画染色板
--https://blog.csdn.net/leexuany/article/details/2504913

function 配置:depp(str)
    if not str then
        return
    end
    str = toutf8(str)
    local line = _split(str, '\r\n')
    local h = _split(line[1], ' ')
    local n = 1
    local ret = {}
    local num = tonumber(t_remove(h, 1))
    if num > 1000 then --新的
        for i = 1, num - 1000 do --分段数
            ret[i] = {a = h[i], b = h[i + 1]}
            n = n + 1
            for j = 1, line[n] do --方案数
                ret[i][j] = {}
                local N = 1
                for c = 2, 4 do --1和5未知
                    for _, v in ipairs(_split(line[n + c], ' ')) do
                        ret[i][j][N] = v
                        N = N + 1
                    end
                end
                n = n + 5
            end
        end
    else
        for i = 1, num do --分段数(部位)
            ret[i] = {a = h[i], b = h[i + 1]}
            n = n + 1
            for j = 1, line[n] do --方案数
                ret[i][j] = {}
                local N = 1
                for c = 1, 3 do
                    for _, v in ipairs(_split(line[n + c], ' ')) do
                        ret[i][j][N] = v
                        N = N + 1
                    end
                end
                n = n + 3
            end
        end
    end
    --分段数，方案数，RGB
    return ret
end

function 配置:dewpal(id)
    local data = SDL.LoadFile("assets/wpal/" .. id .. ".wpal")
    local flag, num, pos = string.unpack('<c4I4', data)
    if flag == 'wpal' then
        local h, n = {}
        for i = 1, num + 1 do
            n, pos = string.unpack('<I4', data, pos)
            table.insert(h, n)
        end
        if 1 == id then
            h[2] = 57
            h[3] = 112
            h[4] = 172
        elseif 2 == id then---------剑侠客
            h[2] = 57
            h[3] = 95
            h[4] = 186
        elseif 201 == id then
            h[2] = 45
            h[3] = 81
            h[4] = 181
        elseif 202 == id then
            h[2] = 50
            h[3] = 166
            h[4] = 206
        elseif 203 == id then
            h[2] = 40
            h[3] = 126
            h[4] = 206
        elseif 7 == id then
            h[2] = 40
            h[3] = 130
            h[4] = 191
        elseif 3 == id then
            h[2] = 55
            h[3] = 104
            h[4] = 186
        elseif 5 == id then
            h[2] = 62
            h[3] = 122
            h[4] = 184
        elseif 6 == id then
            h[2] = 70
            h[3] = 140
            h[4] = 186
        elseif 8 == id then
            h[2] = 60
            h[3] = 126
            h[4] = 186
        elseif 9 == id then
            h[2] = 40
            h[3] = 115
            h[4] = 190
        elseif 10 == id then
            h[2] = 50
            h[3] = 100
            h[4] = 196
        elseif 11 == id then
            h[2] = 66
            h[3] = 146
            h[4] = 186
        elseif 12 == id then
            h[2] = 50
            h[3] = 110
            h[4] = 190
        elseif 204 == id then
            h[2] = 50
            h[3] = 130
            h[4] = 200
        elseif 205 == id then
            h[2] = 50
            h[3] = 136
            h[4] = 201
        elseif 206 == id then
            h[2] = 50
            h[3] = 130
            h[4] = 200
        elseif 301 == id then
            h[2] = 0
            h[3] = 256
            h[4] = 2
        elseif 701 == id then
            h[4] = 2
        elseif 702 == id then
            h[4] = 2
        elseif 703 == id then
            h[4] = 2
        elseif 704 == id then
            h[4] = 2
        elseif 705 == id then
            h[4] = 2
        elseif 706 == id then
            h[4] = 2
        elseif 707 == id then
            h[4] = 2
        elseif 708 == id then
            h[4] = 2
        elseif 709 == id then
            h[4] = 2
        elseif 710 == id then
            h[4] = 2
        elseif 711 == id then
            h[4] = 2
        elseif 712 == id then
            h[4] = 2
        elseif 713 == id then
            h[4] = 2
        elseif 714 == id then
            h[4] = 2
        elseif 715 == id then
            h[4] = 2
        elseif 716 == id then
            h[4] = 2
        elseif 717 == id then
            h[4] = 2
        elseif 718 == id then
            h[4] = 2
        elseif 719 == id then
            h[4] = 2
        elseif 720 == id then
            h[4] = 2
        elseif 721 == id then
            h[4] = 2
        elseif 722 == id then
            h[4] = 2
        elseif 722 == id then
            h[4] = 2
        elseif 103 == id then
            h[2] = 100
            h[3] = 256
            h[4] = 2
        end
        local ret = {}
        for i = 1, num do --分段数(部位)
            ret[i] = { a = h[i], b = h[i + 1] }
            n, pos = string.unpack('<I4', data, pos)
            for j = 1, n do --方案数
                ret[i][j] = {}

                for N = 1, 9 do
                    n, pos = string.unpack('<I4', data, pos)
                    ret[i][j][N] = n
                end
            end
        end
        return ret
    end
end

return 配置
