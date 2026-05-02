-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-03-07 18:52:00
-- @Last Modified time  : 2023-11-14 17:33:29

---@diagnostic disable
local HPS = require('HPSocket.HPSocket')
local BaseAgent = require('HPSocket.BaseAgent')

local HttpAgent = class('HttpAgent', BaseAgent)

function HttpAgent:HttpAgent()
    self:Common()
    self._data = {}
    self._isws = {}
end

function HttpAgent:OnHandShake(dwConnID)
    -- print('OnHandShake', dwConnID)
    if self._握手事件 then
        ggexpcall(self._握手事件, self, dwConnID)
    elseif self.握手事件 then
        ggexpcall(self.握手事件, self, dwConnID)
    end
    if self._isws[dwConnID] then
        self:升级WS(dwConnID, self._isws[dwConnID])
    end
    return 0
end

--已发送数据通知
function HttpAgent:OnSend(dwConnID, iLength)
    -- print('OnSend', dwConnID, iLength)
    if self._发送事件 then
        ggexpcall(self._发送事件, self, dwConnID, iLength)
    elseif self.发送事件 then
        ggexpcall(self.发送事件, self, dwConnID, iLength)
    end
    return 1
end

function HttpAgent:OnReceive(dwConnID, pData) --数据到达
    -- print('OnReceive', dwConnID)
    if self._接收事件 then
        ggexpcall(self._接收事件, self, dwConnID, pData)
    elseif self.接收事件 then
        ggexpcall(self.接收事件, self, dwConnID, pData)
    end
    return 0
end

function HttpAgent:OnClose(dwConnID, enOperation, iErrorCode)
    -- print('OnClose', dwConnID, enOperation, iErrorCode)
    if self._断开事件 then
        ggexpcall(self._断开事件, self, dwConnID, HPS[enOperation], iErrorCode)
    elseif self.断开事件 then
        ggexpcall(self.断开事件, self, dwConnID, HPS[enOperation], iErrorCode)
    end
    return 0
end

--准备连接
function HttpAgent:OnPrepareConnect(dwConnID, socket)
    if self._准备事件 then
        ggexpcall(self._准备事件, self, dwConnID, socket)
    elseif self.准备事件 then
        ggexpcall(self.准备事件, self, dwConnID, socket)
    end
    return 0
end

--连接完成通知
function HttpAgent:OnConnect(dwConnID)
    -- print('OnConnect', dwConnID)
    if self._连接事件 then
        ggexpcall(self._连接事件, self, dwConnID)
    elseif self.连接事件 then
        ggexpcall(self.连接事件, self, dwConnID)
    end
    return 0
end

--关闭服务
function HttpAgent:OnShutdown(dwConnID)
    if self._关闭事件 then
        ggexpcall(self._关闭事件, self, dwConnID)
    elseif self.关闭事件 then
        ggexpcall(self.关闭事件, self, dwConnID)
    end
    return 0
end

--开始解析 HTTP 报文时，向监听器发送该通知
function HttpAgent:OnMessageBegin(dwConnID)
    -- print('OnMessageBegin', dwConnID)
    if self.开始事件 then
        ggexpcall(self.开始事件, self, dwConnID)
    end
    return 0
end

--状态行解析完成后，向监听器发送该通知
function HttpAgent:OnStatusLine(dwConnID, usStatusCode, lpszDesc)
    -- print('OnStatusLine', dwConnID, usStatusCode, lpszDesc)
    if self.状态事件 then
        ggexpcall(self.状态事件, self, dwConnID, usStatusCode, lpszDesc)
    end
    return 0
end

--每当解析完成一个请求头后，向监听器发送该通知
function HttpAgent:OnHeader(dwConnID, lpszName, lpszValue)
    -- print('OnHeader', dwConnID, lpszName, lpszValue)
    if self._isws[dwConnID] and lpszName == 'Sec-Websocket-Accept' then --sha1

    elseif self.报头事件 then
        ggexpcall(self.报头事件, self, dwConnID, lpszName, lpszValue)
    end
    return 0
end

--解析完成所有请求头后，向监听器发送该通知
function HttpAgent:OnHeadersComplete(dwConnID)
    -- print('OnHeadersComplete', dwConnID)
    self._data[dwConnID] = ''

    if self.报头事件 then
        ggexpcall(self.报头事件, self, dwConnID)
    end
    return 0
end

--每当接收到 HTTP BODY 报文，向监听器发送该通知
function HttpAgent:OnBody(dwConnID, pData)
    -- print('OnBody', dwConnID, #pData)
    self._data[dwConnID] = self._data[dwConnID] .. pData
    return 0
end

--每当解析出一个 Chunked 报文头，向监听器发送该通知
function HttpAgent:OnChunkHeader(dwConnID, iLength)
    -- print('OnChunkHeader', dwConnID, iLength)
    return 0
end

--每当解析完一个 Chunked 报文，向监听器发送该通知
function HttpAgent:OnChunkComplete(dwConnID)
    -- print('OnChunkComplete', dwConnID)
    return 0
end

--每当解析完成一个完整 HTTP 报文，向监听器发送该通知
function HttpAgent:OnMessageComplete(dwConnID)
    -- print('OnMessageComplete', self._data[dwConnID] and #self._data[dwConnID])
    if self.报文事件 then
        ggexpcall(self.报文事件, self, dwConnID, self._data[dwConnID])
    end
    return 0
end

--当解析 HTTP 报文错误时，向监听器发送该通知
function HttpAgent:OnParseError(dwConnID, iErrorCode, lpszErrorDesc)
    -- print('OnParseError', dwConnID, iErrorCode, lpszErrorDesc)
    if self.错误事件 then
        ggexpcall(self.错误事件, self, dwConnID, iErrorCode, lpszErrorDesc)
    end
    return 0
end

function HttpAgent:OnUpgrade(dwConnID, enUpgradeType)
    -- print('OnUpgrade', enUpgradeType)
    if enUpgradeType == 'HUT_WEB_SOCKET' then
        -- body
    end
    return 0
end

function HttpAgent:OnWSMessageHeader(dwConnID, bFinal, iReserved, iOperationCode, lpszMask, ullBodyLen)
    -- print('OnWSMessageHeader', dwConnID, bFinal, iReserved, iOperationCode, lpszMask, ullBodyLen)
    self._data[dwConnID] = ''
end

function HttpAgent:OnWSMessageBody(dwConnID, pData)
    -- print('OnWSMessageBody', dwConnID, #pData, pData)
    self._data[dwConnID] = self._data[dwConnID] .. pData
end

function HttpAgent:OnWSMessageComplete(dwConnID)
    -- print('OnWSMessageComplete', dwConnID)

    local st = self._hp:GetWSMessageState(dwConnID)

    if st.OperationCode == 0x9 then --Ping Frame
        self._hp:SendWSMessage(dwConnID, true, 0, 0xA, '0000', '')
    else
        if self._接收事件 then
            ggexpcall(self._接收事件, self, dwConnID, self._data[dwConnID])
        elseif self.接收事件 then
            ggexpcall(self.接收事件, self, dwConnID, self._data[dwConnID])
        end
    end
end

function HttpAgent:启动(ip, async, ssl)
    self._ssl = ssl == true
    self._hp = require 'ghpsocket.httpagent' (ssl)
    return self._hp:Start(ip, async)
end

function HttpAgent:连接(addr, port)
    if port then
        return self._hp:Connect(addr, port)
    end
    if addr:sub(1, 2) == 'ws' then
        local scheme, host, port, path = addr:match('^(wss?)://([^:/]+):?(%d*)(.*)$')
        if scheme == 'wss' then
            if port == '' then
                port = 443
            end
        else
            if port == '' then
                port = 80
            end
        end
        assert(host and host ~= '', '地址错误')
        port = tonumber(port)
        assert(self._ssl == (scheme == 'wss'), 'SSL错误')

        local r, id = self._hp:Connect(host, port)
        self._isws[id] = path
        return r, id
    else
        local scheme, host, port = addr:match('(https?)://([^:/]+):?(%d*)')
        if scheme == 'https' then
            if port == '' then
                port = 443
            end
        else
            if port == '' then
                port = 80
            end
        end
        assert(host and host ~= '', '地址错误')
        port = tonumber(port)
        assert(self._ssl == (scheme == 'https'), 'SSL错误')

        return self._hp:Connect(host, port)
    end
end

function HttpAgent:断开(id, bForce)
    if self._hp:IsUpgrade(id) then
        self._hp:SendWSMessage(id, true, 0, 0x8, '0000', '')
    end
    return self._hp:Disconnect(id, bForce)
end

function HttpAgent:发送(id, data, len)
    if len then
        return self._hp:SendWSMessage(id, true, 0, 0x2, '0000', data)
    end
    return self._hp:SendWSMessage(id, true, 0, 0x1, '0000', data)
end

--====================================================================================
function HttpAgent:请求(id, lpszMethod, lpszPath, lpHeaders, pBody)
    return self._hp:SendRequest(id, lpszMethod, lpszPath, lpHeaders, pBody)
end

function HttpAgent:POST(id, lpszPath, lpHeaders, pBody)
    return self._hp:SendRequest(id, 'POST', lpszPath, lpHeaders, pBody)
end

function HttpAgent:PUT(id, lpszPath, lpHeaders, pBody)
    return self._hp:SendRequest(id, 'PUT', lpszPath, lpHeaders, pBody)
end

function HttpAgent:PATCH(id, lpszPath, lpHeaders, pBody)
    return self._hp:SendRequest(id, 'PATCH', lpszPath, lpHeaders, pBody)
end

function HttpAgent:GET(id, lpszPath, lpHeaders)
    if self._hp:SendRequest(id, 'GET', lpszPath, lpHeaders) then
        -- print('GET', self._hp:GetLastErrorDesc())
        return true
    end
    return false
end

function HttpAgent:DELETE(id, lpszPath, lpHeaders)
    return self._hp:SendRequest(id, 'DELETE', lpszPath, lpHeaders)
end

function HttpAgent:HEAD(id, lpszPath, lpHeaders)
    return self._hp:SendRequest(id, 'HEAD', lpszPath, lpHeaders)
end

function HttpAgent:TRACE(id, lpszPath, lpHeaders)
    return self._hp:SendRequest(id, 'TRACE', lpszPath, lpHeaders)
end

--SendLocalFile

function HttpAgent:OPTIONS(id, lpszPath, lpHeaders)
    return self._hp:SendRequest(id, 'OPTIONS', lpszPath, lpHeaders)
end

function HttpAgent:CONNECT(id, lpszPath, lpHeaders)
    return self._hp:SendRequest(id, 'CONNECT', lpszPath, lpHeaders)
end

local function GetSWK()
    local base64 = require("base64") -- 需要使用 Base64 编码的库
    -- 生成随机的16字节值
    local randomBytes = {}
    for i = 1, 16 do
        randomBytes[i] = string.char(math.random(0, 255))
    end
    local randomValue = table.concat(randomBytes)

    -- Base64 编码随机值
    return base64.encode(randomValue)
end

function HttpAgent:升级WS(id, path)
    self._hp:SendRequest(id, 'GET', path or '', {
        ['Upgrade']               = 'websocket',
        ['Connection']            = 'Upgrade',
        ['Sec-WebSocket-Key']     = GetSWK(),
        ['Sec-WebSocket-Version'] = '13',
    })
end

--/* 获取 HTTP 状态码 */
function HttpAgent:取状态码(id)
    return self._hp:GetStatusCode(id)
end

--/* 设置是否使用 Cookie（默认：TRUE） */
function HttpAgent:置Cookie(bUseCookie)
    self._hp:SetUseCookie(bUseCookie)
end

--/* 检查是否使用 Cookie */
function HttpAgent:是否使用Cookie(lpszPath, lpHeaders)
    return self._hp:IsUseCookie()
end

--====================================================================================
function HttpAgent:启动HTTP(id)
    return self._hp:StartHttp(id)
end

--SendChunkData
--/* 设置本地协议版本 */
function HttpAgent:置本地协议版本()
    self._hp:SetLocalVersion()
end

--/* 获取本地协议版本 */
function HttpAgent:取本地协议版本()
    return self._hp:GetLocalVersion()
end

--/* 检查是否升级协议 */
function HttpAgent:是否升级协议(id)
    return self._hp:IsUpgrade(id)
end

--/* 检查是否有 Keep-Alive 标识 */
function HttpAgent:是否KeepAlive(id)
    return self._hp:IsKeepAlive(id)
end

--/* 获取协议版本 */
function HttpAgent:取协议版本(id)
    return self._hp:GetVersion(id)
end

--/* 获取内容长度 */
function HttpAgent:取内容长度(id)
    return self._hp:GetContentLength(id)
end

--/* 获取内容类型 */
function HttpAgent:取内容类型(id)
    return self._hp:GetContentType(id)
end

--/* 获取内容编码 */
function HttpAgent:取内容编码(id)
    return self._hp:GetContentEncoding(id)
end

--/* 获取传输编码 */
function HttpAgent:取传输编码(id)
    return self._hp:GetTransferEncoding(id)
end

--/* 获取协议升级类型 */
function HttpAgent:取协议升级类型(id)
    return self._hp:GetUpgradeType(id)
end

--/* 获取解析错误代码 */
function HttpAgent:取解析错误码(id)
    return self._hp:GetParseErrorCode(id)
end

--====================================================================================
--/* 获取某个请求头（单值） */
function HttpAgent:取报头(id, lpszName)
    --GetHeaders
    return self._hp:GetHeader(id, lpszName)
end

--/* 获取所有请求头 */
function HttpAgent:取所有报头(id)
    return self._hp:GetAllHeaders(id)
end

--/* 获取所有请求头名称 */
function HttpAgent:取所有报头名称(id)
    return self._hp:GetAllHeaderNames(id)
end

--/* 获取 Cookie */
function HttpAgent:取Cookie(id, lpszName)
    return self._hp:GetCookie(id, lpszName)
end

--/* 获取所有 Cookie */
function HttpAgent:取所有Cookie(id)
    return self._hp:GetAllCookies(id)
end

--/* 获取当前 WebSocket 消息状态，传入 nullptr 则不获取相应字段 */
function HttpAgent:取WS消息状态(id)
    return self._hp:GetWSMessageState(id)
end

--/* 设置 HTTP 启动方式（默认：TRUE，自动启动） */
function HttpAgent:置自动启动()
    self._hp:SetHttpAutoStart()
end

--/* 获取 HTTP 启动方式 */
function HttpAgent:是否自动启动()
    return self._hp:IsHttpAutoStart()
end

return HttpAgent
