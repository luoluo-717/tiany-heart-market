--[[
    @Author       : GGELUA
    @Date         : 2022-04-13 23:07:16
Last Modified by: GGELUA
Last Modified time: 2023-10-16 12:19:46
--]]
多开数据[多开数据.当前].__UI弹出.小地图寻路 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("小地图寻路",0,0,155,385)
local 小地图寻路 = 多开数据[多开数据.当前].__UI弹出.小地图寻路
local 当前 = 多开数据.当前
function 小地图寻路:初始化()
    self:置精灵(取黑色背景(0,0,155,385))
end

function 小地图寻路:打开(id,x,y)
    self:置可见(true)
    self:置中心(-x+140,-y)
    -- if self.smap and self.smap ~= id then
    --     self:重置(id)
    -- elseif not self.smap then
        self:重置(id)
    -- end
    self.选中 = nil
end

function 小地图寻路:重置(id)
    self.smap = id
    self.NPC列表:重置(id)
end

local NPC列表 = 小地图寻路:创建列表("NPC列表",9,15,137,315)

function NPC列表:初始化()
    self:置文字(字体18)
    -- self.选中精灵 = nil
    -- self.焦点精灵 = nil
    self.行间距 = 10
end

function NPC列表:重置(id)
    self:清空()
    self:置颜色(255,255,255)
    小地图寻路.假人表 = {}
    -- for k,v in pairs(场景取假人表(id) or {}) do
    --     table.insert(小地图寻路.假人表,v)
    --     self:添加(v.名称)
    -- end

    -- if 多开数据[当前 or self and self.当前].角色信息.地图数据.编号  >= 6000 and 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 <= 6032 then
        for i,v in pairs(多开数据[当前].__主显.地图.对象) do
            if v.type == 2 then
                table.insert(小地图寻路.假人表,v)
                self:添加(v.名称)
            end
        end
    -- end

end

function NPC列表:左键弹起(x, y, i, item, msg)
    小地图寻路.选中 = i
end

local 寻路按钮 = 小地图寻路:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(118,41),"寻路按钮",19,335,"寻路")

function 寻路按钮:左键弹起(x,y,msg)
    if 小地图寻路.选中 and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长)  then
        if 小地图寻路.假人表[小地图寻路.选中].X and 小地图寻路.假人表[小地图寻路.选中].Y then
            多开数据[当前].__UI界面.窗口层.小地图.终点 = require('GGE.坐标')(小地图寻路.假人表[小地图寻路.选中].X*20,小地图寻路.假人表[小地图寻路.选中].Y*20):floor()
        elseif 小地图寻路.假人表[小地图寻路.选中].x and 小地图寻路.假人表[小地图寻路.选中].y then
            多开数据[当前].__UI界面.窗口层.小地图.终点 = require('GGE.坐标')(小地图寻路.假人表[小地图寻路.选中].x*20,小地图寻路.假人表[小地图寻路.选中].y*20):floor()
        end
        多开数据[当前].__主显.主角:设置路径(多开数据[当前].__UI界面.窗口层.小地图.终点)
    end
end