-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-02-24 12:02:08

---@diagnostic disable
local HPS = require('HPSocket.HPSocket')
local BaseServer = require('HPSocket.BaseServer')
local PullServer = class('PullServer', BaseServer)
PullServer._hp = false
PullServer._准备事件 = false
PullServer._连接事件 = false
PullServer._发送事件 = false
PullServer._断开事件 = false
PullServer._停止事件 = false
PullServer._接收事件 = false
PullServer.准备事件 = false
PullServer.连接事件 = false
PullServer.发送事件 = false
PullServer.断开事件 = false
PullServer.停止事件 = false
PullServer.接收事件 = false

function PullServer:PullServer()
    self:Common()
    self._hp = require 'ghpsocket.pullserver' ()
    self._data = {}
end

--准备监听通知
function PullServer:OnPrepareListen(soListen)
    if self._准备事件 then
        ggexpcall(self._准备事件, self, soListen)
    elseif self.准备事件 then
        ggexpcall(self.准备事件, self, soListen)
    end
    return 0
end

--接收连接通知
function PullServer:OnAccept(dwConnID, soClient) --连接进入
    self._data[dwConnID] = ''
    local ip, port = self._hp:GetRemoteAddress(dwConnID)
    if self._连接事件 then
        ggexpcall(self._连接事件, self, dwConnID, ip, port)
    elseif self.连接事件 then
        ggexpcall(self.连接事件, self, dwConnID, ip, port)
    end
    return 0
end

--已发送数据通知
function PullServer:OnSend(dwConnID, iLength) --发送事件
    if self._发送事件 then
        ggexpcall(self._发送事件, self, iLength)
    elseif self.发送事件 then
        ggexpcall(self.发送事件, self, iLength)
    end
    return 1
end

function PullServer:OnClose(dwConnID, enOperation, iErrorCode) --连接退出
    if self._断开事件 then
        ggexpcall(self._断开事件, self, dwConnID, HPS[enOperation], iErrorCode)
    elseif self.断开事件 then
        ggexpcall(self.断开事件, self, dwConnID, HPS[enOperation], iErrorCode)
    end
    return 0
end

--关闭通信组件通知
function PullServer:OnShutdown()
    if self._停止事件 then
        ggexpcall(self._停止事件, self)
    elseif self.停止事件 then
        ggexpcall(self.停止事件, self)
    end
    return 0
end

function PullServer:OnReceive(dwConnID, pData) --数据到达
    self._data[dwConnID] = self._data[dwConnID] .. pData

    if self._接收事件 then
        ggexpcall(self._接收事件, self, dwConnID, #self._data[dwConnID])
    elseif self.接收事件 then
        ggexpcall(self.接收事件, self, dwConnID, #self._data[dwConnID])
    end
    return 0
end

--====================================================================================
function PullServer:取数据(id, ptr, len)
    local data = self._data[id]
    if type(ptr) == 'number' then
        len = ptr
        self._data[id] = string.sub(data, len + 1)
        return string.sub(data, 1, len)
    elseif ggetype(ptr) == "SDL_Memory" then
        if #data >= len then
            ptr:memcpy(data, len)
            self._data[id] = string.sub(data, len + 1)
            return true
        end
        return false
    elseif ptr then
        return false
    end

    self._data[id] = ''
    return data
end

return PullServer
