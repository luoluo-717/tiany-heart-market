--[[
    @Author       : GGELUA
    @Date         : 2022-02-13 22:00:36
Last Modified by: GGELUA
Last Modified time: 2023-06-13 22:16:38
--]]
local 主显层 = class('主显层')
function 主显层:初始化(当前)
    self.屏幕坐标 = 生成XY()
    self.显示表 = {}
    self.传送表 = {}
    self.当前 = 当前
    self.影子 = __res:取精灵(__res:取地址('shape/mx/', 0xdce4b562))
    self.摊位 = __res:取图像(__res:取地址('shape/gy/', 0x74786102))
    self.收购 = __res:取图像(__res:取地址('shape/gy/', 0x10000006))
    

end

function 主显层:加载(id)
    self.显示表 = {}
    if not self.地图 then
        self.地图 = require('地图/地图')(取地图id(id), self.当前)
    else
        self.地图:加载(取地图id(id), self.当前)
    end
    if 多开数据.当前 == self.当前 then
        多开数据[self.当前].__主控:播放地图音乐(取地图id(id))
    end
    if not self.主角 then
        self.主角 = require("对象.主角")(多开数据[当前 or self and self.当前].角色信息, self.当前)
    end
    self.屏幕坐标 = 多开数据[当前 or self and self.当前].角色信息.坐标:取地图偏移(self.地图.宽度, self.地图.高度)
    self.地图:添加对象(self.主角)
    for i, v in pairs(场景取假人表(id)) do
        v.pid = i
        v.type = 2
        self.地图:添加对象(v)
    end
    for i, v in pairs(场景取传送表(id)) do
        v.pid = i + 300000
        v.id = i
        v.type = 3
        self.地图:添加对象(v)
    end
    self:更新假人头顶图标()
    --引擎:__gc()
    --collectgarbage("collect")
    --collectgarbage("incremental")
    -- if 多开数据[当前 or self and self.当前].角色信息.剧情 ~= nil and 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 多开数据[当前 or self and self.当前].角色信息.剧情.地图 and 多开数据[当前 or self and self.当前].角色信息.剧情.附加.战斗 == nil then
    --     for k, v in pairs(self.地图.对象) do
    --         if ggetype(v) == 'NPC' then
    --             if v.pid == 多开数据[当前 or self and self.当前].角色信息.剧情.编号 then
    --                 v:置任务(true)
    --             else
    --                 v:置任务(false)
    --             end
    --         end
    --     end
    -- elseif 多开数据[当前 or self and self.当前].角色信息.剧情 ~= nil and 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 多开数据[当前 or self and self.当前].角色信息.剧情.地图 and 多开数据[当前 or self and self.当前].角色信息.剧情.附加.战斗 ~= nil then
    --     for k, v in pairs(self.地图.对象) do
    --         if ggetype(v) == 'NPC' then
    --             if v.pid == 多开数据[当前 or self and self.当前].角色信息.剧情.编号 then
    --                 v:置任战(true)
    --             else
    --                 v:置任战(false)
    --             end
    --         end
    --     end
    -- end
    local 地图等级 = {}
    地图等级[1], 地图等级[2] = 取场景等级(多开数据[当前 or self and self.当前].角色信息.地图数据.编号)
    if 地图等级[1] and 地图等级[2] then
        self.场景最低等级 = 地图等级[1]
        self.场景最高等级 = 地图等级[2]
        多开数据[self.当前].__UI弹出.提示框:打开("#Y本场景等级为" .. 地图等级[1] .. "-" .. 地图等级[2] .. "级", "xt")
    else
        self.场景最低等级 = nil
        self.场景最高等级 = nil
    end
    多开数据[self.当前].__UI界面.界面层.左上角.时辰按钮:重置()
    collectgarbage()
end

function 主显层:设置传送(内容)
    self.传送表 = 内容
    for i, v in pairs(内容) do
        v.pid = i + 10000
        v.id = i
        v.type = 3
        self.地图:添加对象(v)
    end
end

function 主显层:更新(dt, x, y)
    self.显示表 = {}
    if not 多开数据[self.当前].__主控.战斗中 then
        self.地图:更新(dt, self.主角.xy:取地图位置(self.地图.块宽度, self.地图.块高度), self.显示表)
    else
        多开数据[self.当前].__战斗主控:更新(dt, x, y)
        self:更新战斗特效(dt)

    end
end
function 主显层:更新战斗特效(dt)
    for i=1,3 do
		多开数据[self.当前].__主控.战意特效[i]:更新(dt*2)
        多开数据[self.当前].__主控.超级战意特效[i]:更新(dt*2)
        多开数据[self.当前].__主控.人参果特效[i]:更新(dt)
        多开数据[self.当前].__主控.骤雨特效[i]:更新(dt)
	end
    多开数据[self.当前].__主控.法宝特效:更新(dt)
	-- 多开数据[self.当前].__主控.减防御:更新(dt)
	-- 多开数据[self.当前].__主控.减法防:更新(dt)
	-- 多开数据[self.当前].__主控.减双抗:更新(dt)
	多开数据[self.当前].__主控.共生特效:更新(dt)
	多开数据[self.当前].__主控.如意神通特效:更新(dt)

	for i=1,6 do
		多开数据[self.当前].__主控.五行珠特效[i]:更新(dt)
	end
end
function 主显层:显示(x, y)
    if 多开数据 and 多开数据.当前 == self.当前 then
        self.地图:显示(self.屏幕坐标)
    end
    if 多开数据[self.当前].__主控.战斗中 then
        多开数据[self.当前].__战斗主控:显示(x, y)
    end
end

function 主显层:更新假人头顶图标()
    if 多开数据[self.当前].角色信息.剧情 and 多开数据[self.当前].角色信息.地图数据.编号 == 多开数据[self.当前].角色信息.剧情.地图 and 多开数据[self.当前].角色信息.剧情.附加.战斗 == nil then
        for k, v in pairs(self.地图.对象) do
            if ggetype(v) == "NPC" then
                if v.pid == 多开数据[self.当前].角色信息.剧情.编号 then
                    v:置任务(true)
                else
                    v:置任务(false)
                end
            end
        end
    elseif 多开数据[self.当前].角色信息.剧情 and 多开数据[self.当前].角色信息.地图数据.编号 == 多开数据[self.当前].角色信息.剧情.地图 and 多开数据[self.当前].角色信息.剧情.附加.战斗 ~= nil then
        for k, v in pairs(self.地图.对象) do
            if ggetype(v) == "NPC" then
                if v.pid == 多开数据[self.当前].角色信息.剧情.编号 then
                    v:置任战(true)
                else
                    v:置任战(false)
                end
            end
        end
    end
end

return 主显层
