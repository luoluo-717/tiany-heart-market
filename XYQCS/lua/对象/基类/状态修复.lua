--[[
    @Author       : GGELUA
    @Date         : 2022-10-30 07:58:19
Last Modified by: GGELUA
Last Modified time: 2023-11-07 17:40:18
--]]
--[[
    @Author       : GGELUA
    @Date         : 2022-10-30 05:21:12
Last Modified by: GGELUA
Last Modified time: 2023-11-07 18:30:06
--]]
local 状态 = class('状态')
local SDL = require 'SDL'
function 状态:初始化(t)
    self.名称 = t.名称
    self.历劫 = t.历劫
    self:置名称(t.名称)
    self:置称谓(t.当前称谓 or t.称谓)
    self._addon = {}
    self:置队长(t.队长)
    self:置战斗(t.战斗开关)
    self:置摆摊(t.摊位名称)
end

function 状态:置名称(v)
    if v then
        名字18:置颜色(多开数据[self.当前].__主控:取名称颜色(v, self.历劫, ggetype(self)))
        self._name = 名字18:取我的投影精灵(v, 29, 36, 15, 160)
        self._name:置中心(self._name.宽度 // 2, -13)
    end
end

function 状态:置称谓(v)
    if v and v ~= '无' and v ~= '' then
        名字18:置颜色(多开数据[self.当前].__主控:取称谓颜色(v, ggetype(self)))
        self._title = 名字18:取我的投影精灵(v, 0, 0, 0, 150)
        self._title:置中心(self._title.宽度 // 2, -13)
        self._name:置中心(self._name.宽度 // 2, -35)
    end
end

function 状态:置状态(k, v)
    if v then
        self._addon[k] = 多开数据[self.当前].__主控[k]
        self._addon[k]:置中心(0, 100)
    else
        self._addon[k] = nil
    end
end

function 状态:置队长(v)
    self.是否队长 = v
    self:置状态('队长令牌', v)
end

function 状态:置战斗(v)
    self.是否战斗 = v
    self:置状态('战斗令牌', v)
end

function 状态:置任务(v)
    self.是否任务 = v
    self:置状态('任务令牌', v)
end

function 状态:置任战(v)
    self.是否任战 = v
    self:置状态('任战令牌', v)
end

function 状态:置摆摊(v)
    self.是否摆摊 = v
    if not v then
        self.store = nil
    else
        local nsf = require('SDL.图像')(108, 24)
        if nsf:渲染开始() then
            多开数据[self.当前].__主显.摊位:显示(0, 0)
            local 宽度 = 字体16:取宽度(v)
            字体16:置颜色(8, 108, 240)
            字体16:取图像(v):显示(math.floor(54 - 宽度 / 2, 3))
            nsf:渲染结束()
        end
        self.store = nsf:到精灵()
        self.store:置中心(54.0, 120)
    end
end

function 状态:更新(dt)
    for k, v in pairs(self._addon) do
        v:更新(dt)
    end
end

function 状态:显示底层(xy)

end

function 状态:显示(xy)
    if self._title then
        self._title:显示(xy)
    end
    if self._name then
        self._name:显示(xy)
    end
    for k, v in pairs(self._addon) do
        v:显示(xy)
    end
end

function 状态:显示顶层(xy)
    if self.store then --摆摊
        self.store:显示(xy)
    end
    if self._shout then
        self._shout:显示(xy) --喊话
    end
end

function 状态:消息事件(t)
    if self.是否摆摊 then
        for _, v in ipairs(t.鼠标) do
            if v.type == SDL.MOUSE_UP and v.button == SDL.BUTTON_LEFT and self.store:检查点(v.x, v.y) then
                v.type = nil
                self.store:置高亮(true)
                t.摆摊 = self
            end
        end
    end
end

return 状态
