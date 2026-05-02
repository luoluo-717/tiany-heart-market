--[[
Author: GGELUA
Date: 2024-05-21 19:48:08
Last Modified by: GGELUA
Last Modified time: 2024-05-21 19:49:35
--]]
--[[
Author: GGELUA
Date: 2023-11-15 19:12:14
Last Modified by: GGELUA
Last Modified time: 2023-11-22 15:29:41
--]]
local 按钮组 = {
    { name = '精锐组', x = 10, y = 20, tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(110, 38), tcp2 = __res:getPNGCC(1, 401 + 562, 65 + 431, 175, 43, true):置拉伸(110, 38), font = '精 锐 组' },
    { name = '神威组', x = 10, y = 20, tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(110, 38), tcp2 = __res:getPNGCC(1, 401 + 562, 65 + 431, 175, 43, true):置拉伸(110, 38), font = '神 威 组' },
    { name = '天科组', x = 10, y = 20, tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(110, 38), tcp2 = __res:getPNGCC(1, 401 + 562, 65 + 431, 175, 43, true):置拉伸(110, 38), font = '天 科 组' },
    { name = '天元组', x = 10, y = 20, tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(110, 38), tcp2 = __res:getPNGCC(1, 401 + 562, 65 + 431, 175, 43, true):置拉伸(110, 38), font = '天 元 组' },
}
local 排行类型 = {"精锐组","神威组","天科组","天元组"}
local 比武排行榜 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("比武排行榜",0,0,650,450)
local 当前 = 多开数据.当前
function 比武排行榜:初始化()
end

function 比武排行榜:打开(数据)
    self.数据=数据
    self.类型 = 1
	self:置窗口()
    self.精锐组:置选中(true)
	self.数据列表:重置(1)
    self:置可见(true)
end

function 比武排行榜:刷新(数据)
	self.数据=数据
	self.数据列表:重置(self.类型)
end

function 比武排行榜:置窗口()
	__置窗口坐标(self)
    local nsf = require('SDL.图像')(650,450)
    if nsf:渲染开始() then
        置窗口背景("比武排行榜",0,12,600,430,true):显示(0,0)
        取白色背景(0,0,435,355,true):显示(125,50)
        字体18:取图像("排名               玩家                     积分"):显示(150, 55)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

local 数据列表 = 比武排行榜:创建列表("数据列表",130,85,425,340)

function 数据列表:初始化()
    self:置文字(字体16)
    self.行高度 = 32
    self.行间距 = 0
end

function 数据列表:重置(i)
    self:清空()
	self.行高度 = 32
    for _, v in ipairs(比武排行榜.数据[排行类型[比武排行榜.类型]]) do
        local nsf = require('SDL.图像')(425,350)
        if nsf:渲染开始() then
            -- if _%2 == 1 then
            --     nsf:填充颜色(167,164,199,255)
            -- end
            字体16:置颜色(__取颜色('浅黑'))
			字体16:取图像("第".._.."名"):显示(20,5)
            字体16:取图像(v.名称):显示(147,5)
            字体16:取图像(v.积分):显示(310,5)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 数据列表:左键弹起(x,y,a)

end

    
for i, v in ipairs (按钮组) do
    local  临时函数 = 比武排行榜:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y+i*45,v.font)
    function 临时函数:左键弹起(x, y)
		比武排行榜.类型 = i
        比武排行榜.数据列表:重置(i)
        比武排行榜:置窗口()
    end
end

local 关闭 = 比武排行榜:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",560,0)
function 关闭:左键弹起(x,y)
    比武排行榜:置可见(false)
end

