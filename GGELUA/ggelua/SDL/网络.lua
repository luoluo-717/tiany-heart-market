-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-04-30 11:36:39
-- @Last Modified time  : 2023-05-31 06:40:24

local SDL = require('SDL')

local PackServer = class('SDL.网络.PackServer')

do
    function PackServer:初始化()
        self._reg = 引擎:注册事件(self)
    end

    function PackServer:PackServer()
        self._reg = 引擎:注册事件(self)
    end

    function PackServer:循环事件()
        if self._set and self._set:CheckSockets() > 0 then
            if self._sock:SocketReady() then
                local clt = self._sock:Accept()

                if clt then
                    self._set:TCP_AddSocket(clt)

                    local adds, port = clt:GetPeerAddress()
                    self._list[port] = {
                        ishead = true,
                        need = 4,
                        data = '',
                        port = port,
                        sock = clt
                    }
                    if self.连接事件 then
                        ggexpcall(self.连接事件, self, port, adds, port)
                    end
                end
            end

            local close = {}
            for i, v in pairs(self._list) do
                if v.sock:SocketReady() then
                    local data = v.sock:Recv(v.need)
                    if data then
                        v.data = v.data .. data
                        assert(#v.data <= v.need, 'message?, ...')
                        if #v.data == v.need then
                            if v.ishead then
                                local int = string.unpack('<I4', v.data)
                                -- local head = int >> 22
                                v.need = int & 0x3FFFFF
                            else
                                if self.接收事件 then
                                    ggexpcall(self.接收事件, self, v.port, v.data)
                                end
                                v.need = 4
                            end
                            v.ishead = not v.ishead
                            v.data = ''
                        else
                            v.need = v.need - #data
                        end
                    else
                        close[i] = true
                    end
                end
            end

            for i, v in pairs(close) do
                self:断开(i)
            end
        end
    end

    function PackServer:启动(ip, port, num)
        local NET = SDL.NET_Init()
        self._sock = NET.TCP_Open(nil, port)
        if self._sock then
            --self.sets = {}
            self._set = NET.AllocSocketSet(num or 1001) --1000连接数
            self._set:TCP_AddSocket(self._sock)
            self._list = {}
            return true
        end
    end

    function PackServer:断开(i)
        if self._list[i] then
            local v = self._list[i]
            self._set:TCP_DelSocket(v.sock)
            v.sock:Close()
            self._list[i] = nil

            if self.断开事件 then
                ggexpcall(self.断开事件, self, v.port)
            end
            return true
        end
    end

    function PackServer:发送(i, data)
        if self._list[i] then
            local v = self._list[i]
            local head = string.pack('<I4', (814 << 22) | #data)
            return v.sock:Send(head .. data)
        end
    end
end

--===========================================================================================================
--===========================================================================================================
--===========================================================================================================
local PackClient = class('SDL.网络.PackClient')

do
    function PackClient:初始化()
        self._reg = 引擎:注册事件(self)
    end

    function PackClient:PackClient()
        self._reg = 引擎:注册事件(self)
    end

    function PackClient:循环事件()
        if self._set and self._set:CheckSockets() > 0 then
            if self._sock:SocketReady() then
                local v = self._info
                local data = self._sock:Recv(v.need)
                if data then
                    v.data = v.data .. data
                    -- assert(#v.data <= v.need, 'message?, ...')
                    if #v.data == v.need then
                        if v.ishead then
                            local int = string.unpack('<I4', v.data)
                            -- local head = int >> 22
                            v.need = int & 0x3FFFFF
                        else
                            if self._接收事件 then
                                ggexpcall(self._接收事件, self, v.data)
                            elseif self.接收事件 then
                                ggexpcall(self.接收事件, self, v.data)
                            end
                            v.need = 4
                        end
                        v.ishead = not v.ishead
                        v.data = ''
                    else
                        v.need = v.need - #data
                    end
                else
                    self:断开()
                end
            end
        end
    end

    function PackClient:连接(ip, port)
        local NET = SDL.NET_Init()
        self._sock = NET.TCP_Open(ip, port)
        if self._sock then
            self._set = NET.AllocSocketSet(1)
            self._set:TCP_AddSocket(self._sock)
            self._info = {
                ishead = true,
                need = 4,
                data = ''
            }
            if self.连接事件 then
                ggexpcall(self.连接事件, self)
            end
            return true
        end
        return false
    end

    function PackClient:断开()
        if self._sock then
            self._set:TCP_DelSocket(self._sock)
            self._sock:Close()
            self._sock = nil
            self._set = nil
            if self.断开事件 then
                ggexpcall(self.断开事件, self)
            end
        end
    end

    function PackClient:发送(data)
        if self._sock then
            local head = string.pack('<I4', (814 << 22) | #data)
            return self._sock:Send(head .. data)
        end
    end
end

--===========================================================================================================
--===========================================================================================================
--===========================================================================================================
local PullClient = class('SDL.网络.PullClient')

do
    function PullClient:初始化()
        self._reg = 引擎:注册事件(self)
    end

    function PullClient:PullClient()
        self._reg = 引擎:注册事件(self)
    end

    function PullClient:循环事件()
        if self._set and self._set:CheckSockets() > 0 then
            if self._sock:SocketReady() then
                local data = self._sock:Recv(4096)
                if data then
                    self._data = self._data .. data
                    if self.接收事件 then
                        ggexpcall(self.接收事件, self, #data)
                    end
                else
                    self:断开()
                end
            end
        end
    end

    function PullClient:连接(ip, port)
        self._data = ''
        local NET = SDL.NET_Init()
        self._sock = NET.TCP_Open(ip, port)
        if self._sock then
            self._set = NET.AllocSocketSet(1)
            self._set:TCP_AddSocket(self._sock)
            if self.连接事件 then
                ggexpcall(self.连接事件, self)
            end
            return true
        end
        return false
    end

    function PullClient:断开()
        if self._sock then
            self._set:TCP_DelSocket(self._sock)
            self._sock:Close()
            self._sock = nil
            self._set = nil
            if self.断开事件 then
                ggexpcall(self.断开事件, self)
            end
        end
    end

    function PullClient:发送(data)
        if self._sock then
            return self._sock:Send(data)
        end
    end

    function PullClient:取数据(ptr, len)
        local data = self._data
        if type(ptr) == 'number' then
            len = ptr
            self._data = string.sub(data, len + 1)
            return string.sub(data, 1, len)
        elseif ggetype(ptr) == 'SDL_Memory' then
            if #data >= len then
                ptr:memcpy(data, len)
                self._data = string.sub(data, len + 1)
                return true
            end
            return false
        elseif ptr then
            return false
        end

        self._data = ''
        return data
    end
end
