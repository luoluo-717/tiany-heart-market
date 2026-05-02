--[[
    @Author       : GGELUA
    @Date         : 2022-04-17 22:36:46
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:50:51
--]]
local 战斗召唤详情 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("战斗召唤详情",0,0,258,454)
local 当前 = 多开数据.当前
function 战斗召唤详情:初始化()
    
end

function 战斗召唤详情:打开(data)
    if not self.是否可见 then
        self:置可见(true)
    end
    self:重置(data)
    self.装备格子:重置(data.装备)
    self.技能格子:重置(data.技能)
end

local lsb = {'气血','魔法','寿命','灵力','伤害','防御','速度','忠诚'}
function 战斗召唤详情:重置(pet)
    local nsf = require('SDL.图像')(258,454)
    if nsf:渲染开始() then
        __res:getPNGCC(2,355,67,258,454):显示(0,0)
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像(pet.名称):显示(16,39)
        字体18:置颜色(__取颜色())
        字体18:取图像('Lv.'..pet.等级):显示(190,39)
        local pyx = 0
        local pyy = 0
        for i=1,#lsb do
            if i > 4 then
                pyx = 130
                pyy = -120
            end
            字体18:取图像(lsb[i]..' '..pet[lsb[i]]):显示(16+pyx,70+pyy+((i-1)*30))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

local 装备格子 = 战斗召唤详情:创建网格("装备格子",45,235,174,52)

function 装备格子:初始化()
    self:创建格子(50,50,0,11,1,3)
end

function 装备格子:重置(data)
    for i = 1,#self.子控件 do
        local lssj = __物品格子.创建(当前)
        lssj:置物品(data[i],"白格子","战斗召唤")
        self.子控件[i]:置精灵(lssj)
    end
end

local 技能格子 = 战斗召唤详情:创建网格("技能格子",40,324,183,100)

function 技能格子:初始化()
    self:创建格子(55,55,9,9,4,3,true)
end

function 技能格子:重置(data)
    for i = 1,#self.子控件 do
        local lssj = __召唤兽技能格子.创建(当前)
        lssj:置数据(data[i],55,55)
        self.子控件[i]:置精灵(lssj)
    end
end