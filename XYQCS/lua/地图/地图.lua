-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2023-09-04 16:00:16
-- @Last Modified time  : 2024-06-27 20:06:05

local GGF = require("GGE.函数")
local SDL = require("SDL")
local 地图寻路 = require("地图/寻路")
local 地图类 = class("地图", 地图寻路)
local 排序 = function(a, b)
    return a.xy.y < b.xy.y
end
function 地图类:初始化(id,当前)
    local map = assert(__res:取地图("scene/" .. id .. ".map"), "地图不存在")
    self.map = map
    self.id = id
    self.当前=当前
    self.宽度 = map.width
    self.高度 = map.height
    self.列数 = map.colnum
    self.行数 = map.rownum
    self.块宽度 = 320
    self.块高度 = 240
    self.置宽高(self)
    self.info = {}
    local n = 0
    for y = 1, self.行数 do
        self.info[y] = {}
        for x = 1, self.列数 do
            self.info[y][x] = {
                xy = require("GGE.坐标")((x - 1) * self.块宽度, (y - 1) * self.块高度),
                id = n
            }
            n = n + 1
        end
    end

    地图寻路.地图寻路(self, self.列数 * 16, self.行数 * 12, map:取障碍())
    self.云 = __res:取动画(__res:取地址("shape/", 0xc8697349)):取动画(1):置当前帧(1):播放(true)
    self.云1 = __res:取动画(__res:取地址("shape/", 0xf12d26bf)):取动画(1):置当前帧(1):播放(true)
    self.对象 = {}
    self.a = require("GGE.坐标")(1, 1)
    self.b = require("GGE.坐标")(1, 1)
end

function 地图类:清空()
    self.对象 = {}
end

function 地图类:置宽高(w, h)
    self.屏幕列数 = math.ceil(引擎["宽度"] / 320)
    self.屏幕列数2 = self.列数 - self.屏幕列数
    self.屏幕列数3 = math.ceil(self.屏幕列数 / 2)
    self.屏幕行数 = math.ceil(引擎["高度"] / 240)
    self.屏幕行数2 = self.行数 - self.屏幕行数
    self.屏幕行数3 = math.ceil(self.屏幕行数 / 2)
end

local _协程载入 = function(self, t)
    t.精灵, t.遮罩 = self.map:取精灵(t.id, __res.配置.关闭遮罩 ~= 1)
    t.load = nil
end

function 地图类:加载(id,当前)
    local map = assert(__res:取地图("scene/" .. id .. ".map"), "地图不存在")
    self.map = map
    self.id = id
    self.当前=当前
    self.宽度 = map.width
    self.高度 = map.height
    self.列数 = map.colnum
    self.行数 = map.rownum
    self.块宽度 = 320
    self.块高度 = 240
    self.置宽高(self)
    self.info = {}
    local n = 0
    for y = 1, self.行数 do
        self.info[y] = {}
        for x = 1, self.列数 do
            self.info[y][x] = {
                xy = require("GGE.坐标")((x - 1) * self.块宽度, (y - 1) * self.块高度),
                id = n
            }
            n = n + 1
        end
    end

    地图寻路.地图寻路(self, self.列数 * 16, self.行数 * 12, map:取障碍())
    self.对象 = {}
    self.a = require("GGE.坐标")(1, 1)
    self.b = require("GGE.坐标")(1, 1)
end


function 地图类:更新(dt, pos, obj)
     self.map:更新()
    if pos.x < self.屏幕列数 then
        self.a.x = 1
        self.b.x = self.屏幕列数 + 1
    elseif pos.x > self.屏幕列数2 then
        self.a.x = self.列数 - self.屏幕列数 - 1
        self.b.x = self.列数
    else
        self.a.x = pos.x - self.屏幕列数3
        self.b.x = pos.x + self.屏幕列数3
    end
    if pos.y < self.屏幕行数 then
        self.a.y = 1
        self.b.y = self.屏幕行数 + 1
    elseif pos.y > self.屏幕行数2 then
        self.a.y = self.行数 - self.屏幕行数 - 1
        self.b.y = self.行数
    else
        self.a.y = pos.y - self.屏幕行数3
        self.b.y = pos.y + self.屏幕行数3
    end
    local 重复遮罩 = {}
    for y = self.a.y, self.b.y do
        for x = self.a.x, self.b.x do
            local t = self.info[y] and self.info[y][x]
            if t then
                if not t.精灵 and not t.load then
                    t.load = true
                    coroutine.xpcall(_协程载入, self, t)
                end
                if  not 主角飞行 and  t.遮罩 and not 重复遮罩[t.id] and  __res.配置.关闭遮罩 ~= 1  then---C改飞行
                    for _, v in ipairs(t.遮罩) do
                        if v  then
                            重复遮罩[t.id] = true
                              table.insert(obj, v)
                        end
                    end
                end
            end
        end
    end
    for i, v in pairs(self.对象) do
        if not 多开数据[self.当前].__主控.战斗中 and (多开数据[self.当前].__主显.主角.xy:取距离(v.xy) < 550 or v.是否移动) then
            v:更新(dt)
            table.insert(obj, v)
        end
    end
    table.sort(多开数据[self.当前].__主显.显示表, 排序)
end

function 地图类:显示(xy)
    for y = self.a.y, self.b.y do
        for x = self.a.x, self.b.x do
            local t = self.info[y] and self.info[y][x]
            if t and t.精灵 then
                t.精灵:显示(t.xy + xy)
            end
        end
    end
    for i = 1, #多开数据[self.当前].__主显.显示表 do
        self:飞行处理(多开数据[self.当前].__主显.显示表[i])
        多开数据[self.当前].__主显.显示表[i]:显示(xy)
    end
    if 主角飞行 then
        self.云:更新(0.05)
        self.云1:更新(0.05)
        self.云:显示(750,150)
        self.云1:显示(50,250)
    end
end

function 地图类:飞行处理(t)
    if t.飞行 == 1 and  t.飞行高度.y < 60 then
        t.飞行高度.y = t.飞行高度.y + 2
    elseif t.飞行 == 2 and t.飞行高度.y > 0 then
        t.飞行高度.y = t.飞行高度.y - 2
        if t.飞行高度.y < 0 then t.飞行高度.y  = 0 end
    end
end


function 地图类:添加对象(t)
    if ggetype(t) == '主角' then
        self.对象[t.pid] = t
        return
    end
    if 0 == t.type then
        self.对象[t.pid] = require("对象/玩家")(t,self.当前)
    elseif 1 == t.type then
        self.对象[t.pid] = require("对象/召唤")(t,self.当前)
    elseif 2 == t.type then
        self.对象[t.pid] = require("对象/NPC")(t,self.当前)
    elseif 3 == t.type then
        self.对象[t.pid] = require("对象/跳转")(t,self.当前)
    elseif 4 == t.type then
        self.对象[t.pid] = require("对象/特效")(t,self.当前)
    elseif 5 == t.type then
        self.对象[t.pid] = require("对象/家具")(t,self.当前)
    elseif 6 == t.type then
        self.对象[t.pid] = require("对象/物品")(t,self.当前)
    end

    if self.对象[t.pid] then
        self.对象[t.pid].type = t.type
    end
end

function 地图类:取重叠数据(x,y,pid)
    local 重叠数据 = {}
    for i,v in pairs(self.对象) do
        if v.type == 2 then
            local xx,yy = v.x or v.X,v.y or v.Y
            if 取两点距离({x=x,y=y},{x=xx,y=yy}) < 2 then
                重叠数据[#重叠数据+1] = v
            end
        end
    end
    return 重叠数据
end

function 地图类:更改对象(t)
    if not self.对象[t.pid] then
        return
    end
    self.对象[t.pid] = nil
    self:添加对象(t)
end

function 地图类:更改模型(t)
    if not self.对象[t.pid] then
        return
    end
    self.对象[t.pid]:更改模型(t)
end

function 地图类:删除对象(id)
    self.对象[id] = nil
end

function 地图类:取对象(id)
    return id and self.对象[id]
end

function 地图类:遍历对象()
    return next, self.对象
end

return 地图类
