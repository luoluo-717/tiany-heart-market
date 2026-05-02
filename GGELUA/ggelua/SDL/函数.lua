-- @Author              : GGELUA
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified by    : baidwwy
-- @Last Modified time  : 2024-05-31 21:35:17

local SDL = require('SDL')
local _ENV = setmetatable({}, { __index = _G })

local _pinfo = {
    '使用电池',
    '没有电池',
    '充电中',
    '已充满'
}
function 取电源信息()
    local s, secs, pct = SDL.GetPowerInfo()
    return _pinfo[s], pct
end

local Platform = SDL.GetPlatform()

local _ver = {
    [30] = '11',
    [29] = '10',
    [28] = '9',
    [27] = '8.1',
    [26] = '8.0',
    [25] = '7.1',
    [24] = '7.0',
    [23] = '6.0',
    [22] = '5.1',
    [21] = '5.0',
    [20] = '4.4W',
    [19] = '4.4',
    [18] = '4.3',
    [17] = '4.2',
    [16] = '4.1',
    [15] = '4.0.3',
    [14] = '4.0',
    [13] = '3.2',
    [12] = '3.1',
    [11] = '3.0',
    [10] = '2.3.3'
}
function 取安卓版本()
    if Platform == 'Android' then
        return _ver[SDL.GetAndroidSDKVersion()] or 'unknown'
    end
    return ''
end

function 是否安卓电视()
    if Platform == 'Android' then
        return SDL.IsAndroidTV()
    end
end

function 安卓触发返回()
    if Platform == 'Android' then
        return SDL.AndroidBackButton()
    end
end

--Android /data/data/com.GGELUA.game/files
--Windows .
function 取内部存储路径()
    if Platform == 'Android' then
        return SDL.AndroidGetInternalStoragePath()
    elseif Platform == 'iOS' then
        return SDL.GetPrefPath('GGELUA')
    end
    return '.'
end

--Android /storage/emulated/0/Android/data/com.GGELUA.game/files
--Windows .
function 取外部存储路径()
    if Platform == 'Android' then
        if SDL.AndroidGetExternalStorageState() & 2 == 2 then
            return SDL.AndroidGetExternalStoragePath()
        end
    elseif Platform == 'iOS' then
        return SDL.GetPrefPath('GGELUA')
    end
    return '.'
end

function 取存档路径(name)
    return SDL.GetPrefPath(name)
end

function 安卓申请权限(t)
    if Platform == 'Android' then
        return SDL.AndroidRequestPermission(t)
    end
end

local _复制中
function 导出assets(src, dst, cb)
    if Platform ~= 'Android' then
        return
    end
    assert(_复制中 == nil, '只能同时复制一个')
    local sf = SDL.RWFromFile(src, 'rb')

    if not sf then
        warn('assets文件不存在', src)
        if type(cb) == 'function' then --回调
            cb(-1, -1)
        end
        return
    end

    if sf:RWtype() ~= 3 then --SDL_RWOPS_JNIFILE
        sf:__close()
        warn('assets文件不存在', src)
        if type(cb) == 'function' then --回调
            cb(-1, -1)
        end
        return
    end

    require('GGE.函数').创建目录(dst)

    local df = SDL.RWFromFile(dst, 'wb')
    if df then
        local dsize, ssize = 0, nil
        ssize = sf:RWsize()
        local function copy()
            local data = sf:RWread(5242880) --5MB
            df:RWwrite(data)
            dsize = dsize + #data

            if dsize == ssize then
                sf:__close()
                df:__close()
                _复制中 = nil
                if cb then
                    cb(dsize, ssize, dsize / ssize)
                end
                return 0
            elseif cb and cb(dsize, ssize, dsize / ssize) == false then
                sf:__close()
                df:__close()
                _复制中 = nil
                return 0 --中断
            end
            return 1
        end

        if cb then
            _复制中 = 引擎:定时(1, copy) --异步
        else
            while copy() == 1 do

            end
        end
        return true
    else
        print('复制失败', sf, df)
    end
end

function 导出所有assets(cb)

end

return _ENV
