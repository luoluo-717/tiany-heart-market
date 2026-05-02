--[[
    @Author       : GGELUA
    @Date         : 2022-02-14 20:50:52
Last Modified by: GGELUA
Last Modified time: 2023-11-07 17:48:37
--]]
local 动作 = require('对象/基类/动作')
local 控制 = require('对象/基类/控制')
local 状态 = require('对象/基类/状态')
local NPC = class('NPC', 动作, 控制, 状态)
local SDL = require 'SDL'
function NPC:初始化(t,当前)

    self.pid = t.pid
    self.id = t.id
    self.类型 = true
    self.type = t.type
    -- if self.动作表[self.行为].frame == 1 then
    --     self.类型 = false
    -- end
    self.执行事件 = t.执行事件 or t.事件
    self.真实编号 = t.真实编号
    if t.X and t.Y then
        self.x=t.X
        self.y=t.Y
    elseif t.x and t.y then
        self.x=t.x
        self.y=t.y
    end
    if self.执行事件 == "明雷" or self.执行事件 == "明雷不移动" then
        local xy
        if t.X and t.Y then
            xy=require("GGE.坐标")(t.X*20,t.Y*20):floor()
            self.x=xy.x
            self.y=xy.y
        elseif t.x and t.y then
            xy=require("GGE.坐标")(t.x*20,t.y*20):floor()
            self.x=xy.x
            self.y=xy.y
        end
        self.矩形 = require('SDL.矩形')(xy.x,xy.y, 30, 60):置中心(15, 30)
        self.已发送 = true
    end
    self.当前=当前
    self[动作]:Set当前(当前)
    self[控制]:Set当前(当前)
end

function NPC:更改模型(t)
    self[动作]:更改模型(t)
end

function NPC:更新(dt)
    self[动作]:更新(dt)
    self[控制]:更新(dt)
    self[状态]:更新(dt)
    if self.执行事件 == "明雷" or self.执行事件 == "明雷不移动" then
        if self.矩形:检查点(多开数据[self.当前].__主显.主角.xy) then
            if not self.已发送 and (not 多开数据[self.当前].__主显.主角.是否组队 or 多开数据[self.当前].__主显.主角.是否队长) then
                多开数据[self.当前].__主显.主角:停止移动()
                self.已发送 = true
                发送数据(当前 or self and self.当前,1004,{地图=多开数据[当前 or self and self.当前].角色信息.地图数据.编号,编号=self.pid,序列=self.pid,标识=self.id})
            end
        elseif self.已发送 then
            self.已发送 = false
        end
    end
end

function NPC:显示(pys)
    local p = self.xy+pys
    self[状态]:显示底层(p)
    self[动作]:显示(p)
    self[状态]:显示(p)
    self[状态]:显示顶层(p)
end

function NPC:设置路径(数据)
    if not 多开数据[self.当前].__主控.战斗中 then
        local xy = require('GGE.坐标')(数据.坐标x*20,数据.坐标y*20)
        local route = 多开数据[self.当前].__主显.地图:寻路(self.xy, xy)
        if #route > 0 then
            self:路径移动(route)
        end
    else
        self.xy:pack(数据.坐标x*20,数据.坐标y*20)
    end
end

function NPC:事件处理(x,y)
    local 重叠数据 = 多开数据[self.当前].__主显.地图:取重叠数据(self.x,self.y,self.pid)
    if #重叠数据 > 1 then
        多开数据[当前 or self and self.当前].__UI弹出.重叠弹出:打开(重叠数据,x,y)
    else
        发送数据(当前 or self and self.当前,1501,{地图=多开数据[当前 or self and self.当前].角色信息.地图数据.编号,编号=self.pid,序列=self.pid,标识=self.id})
    end
end

function NPC:消息事件(t)
    self[状态]:消息事件(t)
    for _, v in ipairs(t.鼠标) do
        if v.type == SDL.MOUSE_UP and self:检查透明(v.x, v.y) then
            if v.button == SDL.BUTTON_LEFT then
                v.type = nil
                if 多开数据[self.当前].__UI界面.界面层.类型 then
                    if 多开数据[self.当前].__UI界面.界面层.类型 == '给予' then
                        发送数据(当前 or self and self.当前,3748,{地图=多开数据[当前 or self and self.当前].角色信息.地图数据.编号,编号=self.pid,序列=self.pid,标识=self.id,名称=self.名称,模型=self.模型})
                        多开数据[self.当前].__UI界面.界面层:重置()
                    elseif 多开数据[self.当前].__UI界面.界面层.类型 == '攻击' then
                        发送数据(当前 or self and self.当前,1501,{地图=多开数据[当前 or self and self.当前].角色信息.地图数据.编号,编号=self.pid,序列=self.pid,标识=self.id})
                        多开数据[self.当前].__UI界面.界面层:重置()
                    end
                else
                    self:事件处理(v.x,v.y)
                end
            end
        end
    end
end

return NPC