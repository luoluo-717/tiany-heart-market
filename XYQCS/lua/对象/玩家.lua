--[[
    @Author       : GGELUA
    @Date         : 2022-02-21 12:41:48
Last Modified by: GGELUA
Last Modified time: 2023-11-07 17:41:19
--]]
local 动作 = require('对象/基类/动作')
local 控制 = require('对象/基类/控制')
local 状态 = require('对象/基类/状态')
local 玩家 = class('玩家', 动作, 控制, 状态)
local SDL = require 'SDL'
function 玩家:初始化(数据,当前)
    --table.print(数据)
    self.玩家ID = 数据.id
    self.组合 = 数据.组合
	self.等级 = 数据.等级
	self.性别 = 数据.性别
	self.种族 = 数据.种族
	self.帮派 = 数据.帮派
	self.门派 = 数据.门派
    self.pid = 数据.pid
    self.当前=当前
    self.战斗开关=数据.战斗开关
    self.名称 = 数据.名称
    self:置飞行(数据.飞行中)

    self[动作]:Set当前(当前)
    self[控制]:Set当前(当前)
end

function 玩家:更新(dt)
    ----------------------C改
    local ydsd=1
    if self.是否移动 then
        ydsd=1.5
    end
    ----------------------C改
    self[动作]:更新(dt*ydsd)
    self[控制]:更新(dt)
    self[状态]:更新(dt)

end
function 玩家:置飞行(逻辑)
    self.飞行中=逻辑
end
function 玩家:显示(pys)
    local p = self.xy+pys
    if self.飞行中 then
        if self.飞行高度>-110 then
            self.飞行高度=self.飞行高度-2
        end
        多开数据[self.当前].__主显["影子"]:显示(p)
    else
        if self.飞行高度~=0 then
            self.飞行高度=self.飞行高度+2
        end
        if self.飞行高度>0 then
            self.飞行高度=0
        end
    end
    --table.print(x)
    p.y=p.y+self.飞行高度


    if __res.配置.屏蔽玩家 ~= 1 then
        self[状态]:显示底层(p)
        self[动作]:显示(p)
    end
    self[状态]:显示(p)
    if __res.配置.屏蔽摊位 ~= 1 then
        self[状态]:显示顶层(p)
    else
        self[状态]:显示底层(p)
    end
end

function 玩家:设置路径(数据)
    if not 多开数据[self.当前].__主控.战斗中 then
        if self.dest and self.dest.x == 数据.x and self.dest.y == 数据.y then  return end
        self.dest = 数据
        local xy = require('GGE.坐标')(数据.x*20,数据.y*20)
        -- local route = 多开数据[self.当前].__主显.地图:寻路(self.xy, xy)
        ---------------------------------------------------------------C改飞行
        local route={}
        if self.飞行中 then
            route = {{x = math.floor(xy.x / 20), y = math.floor(xy.y / 20)}}--__主显.地图:寻路无障碍(self.xy, xy)
        else
            route =  多开数据[self.当前].__主显.地图:寻路(self.xy, xy)
        end
        ---------------------------------------------------------------C改飞行

        if #route > 0 then
            self:路径移动(route)
        end
    else
        self.xy:pack(数据.x*20,数据.y*20)
    end
end

function 玩家:鼠标选中(x,y,pys,lx)
    -- if self.精灵._spr then self.精灵._spr:置坐标(self.xy+pys) end
    -- if self.精灵:检查点(x,y) then
    --     print("鼠标选中玩家了")
    --     if lx == "给予" then
    --         发送数据(当前 or self and self.当前,3716,{id=self.玩家ID})
    --     elseif lx == "攻击" then
    --         if 多开数据[当前 or self and self.当前].角色信息.地图数据.编号~=1001 and 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 ~= 1197 then
    --             多开数据[self.当前].__UI弹出.提示框:打开("#Y请到长安城 擂台PK!.....")
    --             return
    --         elseif  (self.xy.x>398*20 and self.xy.x<439*20 and self.xy.y>164*20 and self.xy.y<183*20) and 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 ~= 1197 then
    --             多开数据[self.当前].__UI弹出.提示框:打开("#Y你发起了对"..self.名称.." #RPK #Y请稍后.....")
    --             发送数据(当前 or self and self.当前,33.1,{序列=self.玩家ID})
    --         elseif 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 1197 then
    --             多开数据[self.当前].__UI弹出.提示框:打开("#Y你发起了对"..self.名称.." #RPK #Y请稍后.....")
    --             发送数据(当前 or self and self.当前,33,{序列=self.玩家ID})
    --         end
    --     end 
    --     return true
    -- end
end
local 可PK地图={}
可PK地图[1001]=1
可PK地图[1070]=1
可PK地图[1092]=1
可PK地图[1040]=1
可PK地图[1197]=1
可PK地图[2009]=1
可PK地图[2010]=1
可PK地图[2011]=1
可PK地图[2012]=1
可PK地图[1511]=1
function 玩家:消息事件(t)
    self[状态]:消息事件(t)
    for _, v in ipairs(t.鼠标) do
        if v.type == SDL.MOUSE_UP and self:检查透明(v.x, v.y) then
            if v.button == SDL.BUTTON_LEFT then
                v.type = nil
                if 多开数据[self.当前].__UI界面.界面层.类型 then
                    if 多开数据[self.当前].__UI界面.界面层.类型 == '组队' then
                        发送数据(当前 or self and self.当前,4002,{id=self.玩家ID})
                        多开数据[self.当前].__UI界面.界面层:重置()
                    elseif 多开数据[self.当前].__UI界面.界面层.类型 == '好友' then
                        -- 鼠标层:正常形状()
                        -- 窗口层:加为好友(self.id)
                    elseif 多开数据[self.当前].__UI界面.界面层.类型 == '交易' then
                          发送数据(3718,{id=self.玩家ID})
                        多开数据[self.当前].__UI界面.界面层:重置()
                    elseif 多开数据[self.当前].__UI界面.界面层.类型 == '给予' then
                        发送数据(当前 or self and self.当前,3716,{id=self.玩家ID})
                        多开数据[self.当前].__UI界面.界面层:重置()
                    elseif 多开数据[self.当前].__UI界面.界面层.类型 == '攻击' then
                        if self.战斗开关 then --观战
                                local 确认 = "是否要观战玩家："..self.名称.." ？"
                                local 事件 = function()
							        发送数据(当前 or self and self.当前,6565,{序列=self.玩家ID})
                                end
                                多开数据[self.当前].__UI界面.窗口层.文本栏:打开(确认,285,155,390,200,事件)
                        else
                                local dity=多开数据[当前 or self and self.当前].角色信息.地图数据.编号
                                local xy = require("GGE.坐标")(x, y) - 多开数据[self.当前].__主显.屏幕坐标
                                -- if 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 1001 then
                                if (dity==1001 and xy.x>398*20 and xy.x<439*20 and xy.y>164*20 and xy.y<183*20) or dity == 2009 then
                                    PK选中玩家 = self.玩家ID
                                    多开数据[self.当前].__UI界面.窗口层.对话栏:打开({
                                        模型 = "",
                                        名称 = "",
                                        对话 = "少侠，你选择的对手刚好也是独自一人。你想向他发起切磋还是“单挑”呢",
                                        选项 = { "切磋", "单挑" },
                                        回调处理 = nil,
                                    })

                                else
                                    多开数据[self.当前].__UI弹出.提示框:打开("#Y请到长安城 擂台PK!.....")

                                end
                            end
                                if 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==1197 then
                                    多开数据[self.当前].__UI弹出.提示框:打开("#Y比武等待区不允许发生战斗！")


                                elseif 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5136 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5137 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5138 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5139 then
                                    发送数据(self.当前,6566,{序列=self.玩家ID,PK地图=多开数据[当前 or self and self.当前].角色信息.地图数据.编号})
                                elseif 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 2010 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 2011 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 2012 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 1511 then
                                    发送数据(self.当前,6552,{序列=self.玩家ID})--帮战
                                end
                                多开数据[self.当前].__UI界面.界面层:重置()
                        end
                else
                    多开数据[self.当前].__UI弹出.玩家信息弹出:打开(self)
                end
            end
        end
    end
    if t.摆摊 == self then
        发送数据(当前 or self and self.当前,3725,{id=self.玩家ID})
        --窗口层:打开摆摊买家(self)
    elseif t.收购 == self then
        发送数据(当前 or self and self.当前,3720.6,{id=self.玩家ID})
    end
end

return 玩家