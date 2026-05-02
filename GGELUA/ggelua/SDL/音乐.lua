-- @Author              : GGELUA
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified by    : baidwwy
-- @Last Modified time  : 2024-05-04 11:33:50

local SDL = require('SDL')
local ggetype = ggetype
local MIX = SDL.MIX_Init()

local SDL音乐 = class('SDL音乐')

function SDL音乐:SDL音乐(file)
    local tp = ggetype(file)
    if tp == 'string' then
        self._mus = MIX.LoadMUS(file)
    elseif tp == 'SDL读写' then
        self._rw = file
        self._mus = MIX.LoadMUS_RW(file:取对象())
    elseif tp == 'SDL_RWops' then
        self._rw = file
        self._mus = MIX.LoadMUS_RW(file)
    end

    if self._mus then
        SDL._mixs[self] = self._mus
    else
        print('播放失败')
        warn(SDL.GetError())
    end
end

function SDL音乐:播放(loop)
    if self._mus then
        loop = (type(loop) == 'number') and loop or (loop and -1 or 0)

        if self._mus.PlayMusicStream then
            self._mus:PlayMusicStream(loop)
        else
            self._mus:PlayMusic(loop)
        end
    end
    return self
end

function SDL音乐:停止()
    if self._mus.HaltMusicStream then
        self._mus:HaltMusicStream()
    else
        MIX.HaltMusic()
    end

    return self
end

function SDL音乐:暂停()
    if self._mus.PauseMusicStream then
        self._mus:PauseMusicStream()
    else
        MIX.PauseMusic()
    end

    return self
end

function SDL音乐:恢复()
    if self._mus.ResumeMusicStream then
        self._mus:ResumeMusicStream()
    else
        MIX.ResumeMusic()
    end

    return self
end

function SDL音乐:重置()
    if self._mus.RewindMusicStream then
        self._mus:RewindMusicStream()
    else
        MIX.RewindMusic()
    end

    return self
end

function SDL音乐:是否暂停()
    if self._mus.PausedMusicStream then
        return self._mus:PausedMusicStream()
    end
    return MIX.PausedMusic()
end

function SDL音乐:是否播放()
    if self._mus.PlayingMusicStream then
        return self._mus:PlayingMusicStream()
    end
    return MIX.PlayingMusic()
end

function SDL音乐:置音量(v)
    if self._mus.VolumeMusicStream then
        self._mus:VolumeMusicStream(v)
    else
        MIX.VolumeMusic(v)
    end

    return self
end

function SDL音乐:取音量()
    if self._mus.GetMusicVolume then
        return self._mus:GetMusicVolume()
    end
    return MIX.VolumeMusic(-1)
end

function SDL音乐:置位置(v)
    if self._mus.SetMusicPositionStream then
        self._mus:SetMusicPositionStream(v)
    else
        MIX.SetMusicPosition(v)
    end
    
    return self
end

return SDL音乐
