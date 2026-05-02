-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-02-24 08:41:24
-- @Last Modified time  : 2023-10-06 21:23:54

local Common = class('HPCommon')

function Common:Common()
    引擎:注册事件(self, self)
end

function Common:循环事件()
    if not self._hp then
        return
    end
    local r = { self._hp:GetMsg() }
    local tp = table.remove(r, 1)

    if tp == 0 then
        self:OnPrepareConnect(table.unpack(r))
    elseif tp == 1 then
        self:OnConnect(table.unpack(r))
    elseif tp == 2 or tp == 3 or tp == 20 then
        self:OnReceive(table.unpack(r))
    elseif tp == 4 or tp == 19 then
        self:OnSend(table.unpack(r))
    elseif tp == 5 then
        self:OnClose(table.unpack(r))
    elseif tp == 6 then
        self:OnShutdown(table.unpack(r))
    elseif tp == 7 then
        self:OnPrepareListen(table.unpack(r))
    elseif tp == 8 then
        self:OnAccept(table.unpack(r))
    elseif tp == 9 then
        self:OnMessageBegin(table.unpack(r))
    elseif tp == 10 then
        self:OnStatusLine(table.unpack(r))
    elseif tp == 11 then
        self:OnHeader(table.unpack(r))
    elseif tp == 12 then
        self:OnHeadersComplete(table.unpack(r))
    elseif tp == 13 then
        self:OnBody(table.unpack(r))
    elseif tp == 14 then
        self:OnChunkHeader(table.unpack(r))
    elseif tp == 15 then
        self:OnChunkComplete(table.unpack(r))
    elseif tp == 16 then
        self:OnMessageComplete(table.unpack(r))
    elseif tp == 17 then
        self:OnUpgrade(table.unpack(r))
    elseif tp == 18 then
        self:OnParseError(table.unpack(r))
    elseif tp == 21 then
        self:OnError(table.unpack(r))
    elseif tp == 22 then
        self:OnWSMessageHeader(table.unpack(r))
    elseif tp == 23 then
        self:OnWSMessageBody(table.unpack(r))
    elseif tp == 24 then
        self:OnWSMessageComplete(table.unpack(r))
    elseif tp == 25 then
        self:OnHandShake(table.unpack(r))
    end
end

return Common
