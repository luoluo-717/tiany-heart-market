--[[
    @Author       : GGELUA
    @Date         : 2022-02-13 21:48:48
Last Modified by: GGELUA
Last Modified time: 2023-10-25 17:15:19
--]]
local 动作 = require('对象/基类/动作')
local 控制 = require('对象/基类/控制')
local 状态 = require('对象/基类/状态')
local 主角 = class('主角', 动作, 控制, 状态)

function 主角:初始化(t,当前)
    self.pid = 0
    self.当前=当前
    self[动作]:Set当前(当前)
    self[控制]:Set当前(当前)
    self.中间={x=0,y=0} --武神二爷轮盘移动

end

function 主角:更新(dt)
    ----------------------C改
    local ydsd=1
    if self.是否移动 then
        ydsd=1.5
    end
    ----------------------C改
    self[动作]:更新(dt*ydsd)
    self[控制]:更新(dt)
    self[状态]:更新(dt)
    if not 多开数据[self.当前].__主控.战斗中 and not 多开数据[self.当前].__UI界面.界面层.返回.是否可见 and 多开数据[self.当前].__全局自动走路开关 and 多开数据[self.当前].__全局自动走路秒 > 10 and not self.是否移动 and not self.是否摆摊 and not self.是否收购 then
        多开数据[self.当前].__全局自动走路秒 = 0
        local xxQ,yyQ,mmxQ,mmyQ
        mmxQ,mmyQ = math.floor(多开数据[self.当前].__主显.地图.宽度),math.floor(多开数据[self.当前].__主显.地图.高度)
        xxQ = math.random(3,mmxQ)
        yyQ = math.random(3,mmyQ)
        local xy = require('GGE.坐标')(xxQ,yyQ)
        local route = 多开数据[self.当前].__主显.地图:寻路(self.xy, xy)
        if #route > 0 then
            发送数据(当前 or self and self.当前,1001,{x=math.floor(xy.x/20),y=math.floor(xy.y/20),距离=0})
            self.移动目标 = xy
            self:路径移动(route)
        end
    end
end

function 主角:显示(pys)
    local p = self.xy+pys
    self.中间=p
    if 主角飞行 then
        if self.飞行高度>-110 then
            self.飞行高度=self.飞行高度-2
        end
        多开数据[self.当前].__主显.影子:显示(p)
    else
        if self.飞行高度~=0 then
            self.飞行高度=self.飞行高度+2
        end
        if self.飞行高度>0 then
            self.飞行高度=0
        end
    end
    p.y=p.y+self.飞行高度

    self[状态]:显示底层(p)
    self[动作]:显示(p,主角飞行)
    self[状态]:显示(p)
    self[状态]:显示顶层(p)
end
function 主角:置飞行(逻辑)
    主角飞行=逻辑
end
function 主角:设置路径(xy)
    if not 多开数据[self.当前].__主控.战斗中 and not  self.是否摆摊 then
        if 多开数据[当前 or self and self.当前].__全局自动走路开关 then
            多开数据[当前 or self and self.当前].__全局自动走路开关 = false
            多开数据[self.当前].__全局自动走路秒 = 0
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y自动挂机已关闭！')
        end
        -- local route = 多开数据[self.当前].__主显.地图:寻路(self.xy, xy,self.飞行)
        ---------------------------------------------------------------C改飞行
        local route={}
        if 主角飞行 then
            route = {{x = math.floor(xy.x / 20), y = math.floor(xy.y / 20)}}
        else
            route = 多开数据[当前 or self and self.当前].__主显.地图:寻路(self.xy, xy)
        end
        ---------------------------------------------------------------C改飞行

        if #route > 0 then
            发送数据(当前 or self and self.当前,1001,{x=math.floor(xy.x/20),y=math.floor(xy.y/20),距离=0})
            self.移动目标 = xy
            self:路径移动(route)
        end
    end
end

function 主角:开始移动(xy)
    -- if not self.是否移动 then
        -- 引擎:定时(
        --     600,
        --     function(ms)
        --         print(4534534534)
                if 多开数据[self.当前] and not 多开数据[self.当前].__主控.战斗中 then
                    if self.是否移动 then
                        if (not self.是否组队 or self.是否队长) then
                            发送数据(当前 or self and self.当前,1002,{x=self.xy.x,y=self.xy.y,方向=self.方向-1,类型="行走"})
                        end
                    end
                end
                    -- else
        --                 发送数据(当前 or self and self.当前,1002,{x=self.xy.x,y=self.xy.y,方向=self.方向-1,类型="停止"})
        --                 return
        --             end
        --         end
        --         return ms
        --     end
        -- )
    -- end
    self[控制]:开始移动(xy)
end

return 主角