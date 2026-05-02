-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-07-28 06:47:56
-- @Last Modified time  : 2024-06-01 01:15:37


local GGF = require('GGE.函数')
local HPS = require('HPSocket.HPSocket')

local HPDownload = class('HPDownload')

function HPDownload:HPDownload(url)
    self._url = url
    if 引擎 then
        引擎:注册事件(self, self)
    -- else
    --     warn('找不到引擎')
    end
end

function HPDownload:循环事件()
    if self._co then
        local a, b, c = self._hp:GetState()
        coroutine.xpcall(function()
            if c < 0 then
                if self._cb then
                    self._cb(0, c, c)
                end
                coroutine.xpcall(self._co)
                self._co = nil
                self._cb = nil
            elseif a > 0 then
                if self._cb and a ~= b then
                    self._cb(a, b, c)
                end
                if c == 88 then
                    if self._cb then self._cb(a, b, c) end
                    coroutine.xpcall(self._co)
                    self._co = nil
                    self._cb = nil
                end
            end
        end)
    elseif self._cb then
        local a, b, c = self._hp:GetState()
        if c < 0 then
            if self._cb then
                self._cb(0, c, c)
            end
            self._cb = nil
        elseif a > 0 then
            if self._cb and a ~= b then
                self._cb(a, b, c)
            end
            if c == 88 then
                if self._cb then self._cb(a, b, c) end
                self._cb = nil
            end
        end
    end
end

-- local err = {
--     [-1] = '连接失败',
--     [-2] = '连接断开',
--     [-3] = '请求失败',
--     [-4] = '解析失败',
-- }
-- function HPDownload:取错误()

-- end

function HPDownload:到文件(path, cb, range)
    GGF.创建目录(path)
    self._hp = require 'ghpsocket.download' (self._url, path, range)
    self._cb = cb
end

function HPDownload:到内存(cb)
    if coroutine.isyieldable() then
        self._hp = require 'ghpsocket.download' (self._url)
        self._co = coroutine.running()
        self._cb = cb
        coroutine.yield()
        return self._hp:GetData()
    end
end

function HPDownload:取MD5()
    return self._hp:GetMD5()
end

return HPDownload
