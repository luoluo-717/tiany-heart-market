--[[
    @Author       : GGELUA
    @Date         : 2022-04-12 21:26:57
Last Modified by: GGELUA
Last Modified time: 2023-11-07 17:32:46
--]]
local 控制 = class('控制')

function 控制:初始化(t,当前)
    self.当前=当前
    if ggetype(self) == 'NPC' then
        if t.X and t.Y then
            self.xy=require("GGE.坐标")(t.X*20,t.Y*20):floor()
        elseif t.x and t.y then
            self.xy=require("GGE.坐标")(t.x*20,t.y*20):floor()
        end
    elseif ggetype(self) == '玩家' then
        self.xy=require("GGE.坐标")(t.x,t.y):floor()
    elseif ggetype(self) == '主角' then
        self.xy=require("GGE.坐标")(t.坐标.x,t.坐标.y):floor()
    end
    self._txy = {}
    self._co = {}
    if ggetype(self) == 'NPC' then
        self.移动速度 = 80
    else
        self.移动速度 = 175
    end
end

function 控制:Set当前(当前)
    self.当前 = 当前
end

function 控制:更新(dt)
    if self.是否移动 then
        local 移动速度 = self.移动速度 * dt
        if self._txy and self.xy:取距离(self._txy) > 移动速度 then
            self.xy:移动(移动速度, self._txy)
            if ggetype(self) == '主角' then
                多开数据[self.当前].__主显.屏幕坐标 = self.xy:取地图偏移(多开数据[self.当前].__主显.地图.宽度, 多开数据[self.当前].__主显.地图.高度)
                多开数据[当前 or self and self.当前].角色信息.坐标 = self.xy:复制():floor()
            end
        elseif self._route and self:下一点(true) > 0 then 
            self:开始移动(self:下一点())
        elseif self._txy and not self._wait then
            self.xy = self._txy:复制():floor()
            self._txy = nil
            self._route = nil
            self.dest = nil
            self.是否移动 = false
            if self._next then
                self:置动作(self._next)
                self._next = nil
            end
            local co = self._co
            self._co = {}
            --调用的时候可能会添加，所以先清空
            for k, v in pairs(co) do
                coroutine.xpcall(v)
            end
        else
            self.是否移动 = false
        end
    end
end

function 控制:下一点(rej)
    if not rej then
        return require("GGE.坐标")(self._route[1].x*20,self._route[1].y*20):floor()
    else
        table.remove(self._route,1)
    end
    return #self._route
end

function 控制:置坐标(x, y)
    if ggetype(x) == 'GGE坐标' then
        self.xy = x:复制():floor()
    else
        self.xy:pack(x, y)
    end
    self:停止移动()
    self.是否移动 = true
end

function 控制:开始移动(txy) --被继承
    self._txy = txy
    local 角度 = self.xy:取角度(txy)
    if ggetype(self) == 'NPC' or self.变身数据 then
        self:置方向(direction4(角度))
    else
        self:置方向(direction8(角度))
    end
    if self.动作 ~= '行走' then
        self:置动作('行走')
    end
    self.是否移动 = true
    self._next = '静立'
end

function 控制:停止移动()
    if self.动作 ~= '静立' then
        self:置动作('静立')
    end
    self.是否移动 = false
    self._route = nil
    self._next = nil
    self._txy = nil
    self._co = {}
end

function 控制:路径移动(route) --寻路
    self._route = route
    self:开始移动(self:下一点())
end

return 控制