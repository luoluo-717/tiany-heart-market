--[[
    @Author       : GGELUA
    @Date         : 2022-04-18 09:35:42
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:51:17
--]]
local 战斗灵宝 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("战斗灵宝",0,0,494,327)
local 当前 = 多开数据.当前
local function 取可用道具(名称)
	if 名称=="风舞心经" or 名称=="寒霜盾戟"  or 名称=="战神宝典" then
		return 2
	elseif 名称=="噬魔神壶" or  名称=="断穹巨剑" or 名称=="相思寒针" or 名称=="锢魂命谱" or 名称=="青狮獠牙"  or 名称=="冥火炼炉" or 名称=="缚仙蛛丝" or 名称=="煞魂冥灯" or 名称=="九霄龙锥" or 名称=="化怨清莲"
		or 名称=="天雷音鼓" or 名称=="乾坤金卷" or 名称=="乾坤木卷" or 名称=="乾坤水卷" or 名称=="乾坤火卷" or 名称=="乾坤土卷" then
		return 4
	elseif 名称=="静心禅珠" or 名称=="宁心道符" or 名称=="真阳令旗" or 名称=="护体灵盾" or 名称=="惊兽云尺" or 名称=="赤炎战笛" then
		return 3
	end
	return 0
end

function 战斗灵宝:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(494,327)
    if nsf:渲染开始() then
        置窗口背景("选择灵宝",0,12,494,317,true):显示(0,0)
        取白色背景(0,0,220,243,true):显示(18,67)
        取白色背景(0,0,220,243,true):显示(255,67)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 战斗灵宝:打开(data)
    self:置可见(true)
    多开数据[当前].__UI界面.界面层.战斗界面:置可见(false)
    self.灵宝网格:置物品(data.灵宝佩戴)
    self:重置(data)
end

function 战斗灵宝:重置(data)
    local nsf = require('SDL.图像')(494,327)
    if nsf:渲染开始() then
        字体20:置颜色(__取颜色('黄色'))
        字体20:取图像("当前剩余灵元"..data.灵元.数值..'('..data.灵元.回合..'回合后增加1点)'):显示(132,42)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

local 关闭 = 战斗灵宝:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",444,0)

function 关闭:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.战斗灵宝:置可见(false)
    多开数据[当前].__UI界面.界面层.战斗界面:重置()
    多开数据[当前].__UI界面.界面层.战斗界面:置可见(true)
end

local 灵宝网格 = 战斗灵宝:创建网格("灵宝网格",99,85,270,55)

function 灵宝网格:初始化()
    self:创建格子(55,55,0,164,1,2)
end

function 灵宝网格:置物品(data)
    战斗灵宝.灵宝介绍1:清空()
    战斗灵宝.灵宝介绍2:清空()
    for i=1,#self.子控件 do
        local lssj = __物品格子.创建(当前)
        lssj:置物品(data[i],"白格子","战斗灵宝")
        self.子控件[i]:置精灵(lssj)
        if  self.子控件[i]._spr.物品 then
            战斗灵宝['灵宝介绍'..i]:置文本(self.子控件[i]._spr.物品.介绍)
        end
    end
end

local 灵宝介绍1 = 战斗灵宝:创建文本("灵宝介绍1",30,147,200,120)

local 灵宝介绍2 = 战斗灵宝:创建文本("灵宝介绍2",267,147,200,120)

for i, v in ipairs {
    {name = '使用灵宝1', x = 70 ,y = 250 , tcp = __res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),font = '使用'},
    {name = '使用灵宝2', x = 304 ,y = 250 , tcp = __res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),font = '使用'},
} do
    local  临时函数 = 战斗灵宝:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '使用灵宝1' then
            if  战斗灵宝.灵宝网格.子控件[1]._spr.物品 then
                多开数据[当前].__UI界面.界面层.战斗界面:设置灵宝参数(1,取可用道具(战斗灵宝.灵宝网格.子控件[1]._spr.物品.名称))
            end
        elseif v.name == '使用灵宝2' then
            if  战斗灵宝.灵宝网格.子控件[2]._spr.物品 then
                多开数据[当前].__UI界面.界面层.战斗界面:设置灵宝参数(2,取可用道具(战斗灵宝.灵宝网格.子控件[2]._spr.物品.名称))
            end
        end
    end
end