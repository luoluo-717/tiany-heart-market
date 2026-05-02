
--控制各方向的动画
local 动画类 = class("动画类")

function 动画类:动画类(tcp)
    self._tcp = tcp
    self.宽度 = tcp.width
    self.高度 = tcp.height
    self.x    = tcp.x
    self.y    = tcp.y
    self._ani = {}
    for i=1,tcp.group do
        self._ani[i] = tcp:取动画(i):播放()
    end
    self:置方向(1)
end

function 动画类:更新(dt)
    self._cur:更新(dt)
end

function 动画类:显示(x,y)
    --math.floor(x,y)
    self._cur:显示(x,y)
end

function 动画类:调色(pp,p)
    self._tcp:调色(pp,p)
    for i=1,self._tcp.group do
        self._ani[i]:清空()
        self._ani[i].资源.p = p
    end
end

function 动画类:炫彩调色(pp, p, data, rsid)
    self._tcp["炫彩调色"](self._tcp, pp, p, data, rsid)
    for i = 1, self._tcp.group do
        self._ani[i]["清空"](self._ani[i])
        self._ani[i]["资源"].p = tonumber(p + rsid)
    end
end

function 动画类:置方向(i)
    if i>self._tcp.group then
        i = i%self._tcp.group
        if i==0 then
            i=self._tcp.group
        end
    end
    if self._ani[i] then
        --self.方向 = i
        self._cur = self._ani[i]
    end
    return self
end

function 动画类:取精灵(i)
    return self._cur:取精灵(i)
end

function 动画类:取当前帧()
    return self._cur.当前帧
end
function 动画类:取结束帧()
    return self._cur.结束帧
end

function 动画类:取帧数()
    return self._cur.帧数
end

function 动画类:检查点(x,y)
    return self._cur:检查点(x,y)
end

function 动画类:检查透明(x,y)
    return self._cur:检查透明(x,y)
end

function 动画类:停止()
    self._cur:停止()
    return self
end

function 动画类:播放()
    self._cur:播放()
    return self
end

function 动画类:恢复()
    self._cur:恢复()
    return self
end

function 动画类:置首帧()
    for i,v in ipairs(self._ani) do
        v:置首帧()
    end
    return self
end

function 动画类:置尾帧()
    for i,v in ipairs(self._ani) do
        v:置尾帧()
    end
    return self
end

function 动画类:置往返(...)
    for i,v in ipairs(self._ani) do
        v:置往返(...)
    end
    return self
end


function 动画类:置循环(...)
    for i,v in ipairs(self._ani) do
        v:置循环(...)
    end
    return self
end

function 动画类:置提速(tx)
    for i,v in ipairs(self._ani) do
        v:置帧率(v.帧率/tx)
    end
end

function 动画类:置帧率(...)
    for i,v in ipairs(self._ani) do
        v:置帧率(...)
    end
    return self
end

function 动画类:置帧事件(...)
    for i,v in ipairs(self._ani) do
        v.帧事件 = ...
    end
    return self
end

function 动画类:置停止事件(...)
    for i,v in ipairs(self._ani) do
        v.停止事件 = ...
    end
    return self
end

function 动画类:置高亮(...)
    for i,v in ipairs(self._ani) do
        v:置高亮(...)
    end
    return self
end

function 动画类:取高亮()
    for i,v in ipairs(self._ani) do
        v:置高亮()
    end
    return self
end

function 动画类:置颜色(...)
    for i,v in ipairs(self._ani) do
        v:置颜色(...)
    end
    return self
end

function 动画类:是否播放()
   return self._cur.是否播放
end

return 动画类