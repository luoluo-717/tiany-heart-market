--[[
Author: GGELUA
Date: 2024-06-09 20:35:23
Last Modified by: GGELUA
Last Modified time: 2024-06-09 21:17:40
--]]
local 自动回收 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("自动回收",0,0,725,485)
local 当前 = 多开数据.当前
function 自动回收:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(725,485)
    if nsf:渲染开始() then
        置窗口背景("自动回收",0,12,719,473,true):显示(0,0)
        字体18:置颜色(__取颜色("白色"))
		字体18:取图像("自动回收"):显示(280,438)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 自动回收:打开(数据)
    self:置可见(true)
    self.数据=数据
    self:重置()
end

function 自动回收:重置()
    self.按钮数据 = {}
    for i,v in pairs(self.数据[2]) do
        self.按钮数据[v[2]] = {i}
        if self.数据[1][i] then
            self.按钮数据[v[2]][2] = true
        end
    end  
    if self.数据[1].自动回收 then
        self.回收开关按钮:置选中(true)
    else
        self.回收开关按钮:置选中(false)
    end
    self.活动网格:置物品(self.按钮数据)
end

local 活动网格 = 自动回收:创建网格("活动网格",30,60,680,360)
function 活动网格:初始化()
end

function 活动网格:置物品(按钮数据)
	self:创建格子(130, 30, 0, 0, math.ceil(#按钮数据 / 5), 5, true)
    for i = 1,#self.子控件 do
        if 按钮数据[i] then
			local nsf = require('SDL.图像')(130,30)
			if nsf:渲染开始() then
				字体16:置颜色(__取颜色("白色"))
				字体16:取图像(按钮数据[i][1]):显示(35,0)
				nsf:渲染结束()
			end
			self.子控件[i]:置精灵(nsf:到精灵())
            local 按钮 = self.子控件[i]:创建我的多选按钮(__res:getPNGCC(2,1172,107,26,26,true),__res:getPNGCC(2,1171,75,26,26,true),按钮数据[i][1].."按钮",0,0)
            按钮:置可见(true,true)
            if 按钮数据[i][2] then
                按钮:置选中(true)
            else
                按钮:置选中(false)
            end
        else
            self.子控件[i]:置精灵(nil)
        end
    end
end



local 关闭 = 自动回收:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",675,0)

function 关闭:左键弹起(x,y,msg)
    自动回收:置可见(false)
end

function 自动回收:取自动回收数据()
	local 回收数据 = {自动回收=self.回收开关按钮.是否选中}
	for i = 1,#自动回收.活动网格.子控件 do
        if self.按钮数据[i] then
            if 自动回收.活动网格.子控件[i][self.按钮数据[i][1].."按钮"].是否选中 then
                回收数据[self.按钮数据[i][1]] = true
            end
        end
	end
	return 回收数据
end


local 回收开关 = 自动回收:创建我的多选按钮(__res:getPNGCC(2,1172,107,26,26,true),__res:getPNGCC(2,1171,75,26,26,true),"回收开关按钮",250,434)

for i, v in ipairs {
    -- {name = '手动回收', x = 573 ,y = 424 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '手动回收'},
    {name = '保存配置' , x = 437 ,y = 424, tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '保存配置'},
} do
    local 临时函数 = 自动回收:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '手动回收' then
            local 事件 = function()
				发送数据(当前 or self and self.当前, 111)
			end
            local wb = "该操作会将道具栏内满足条件的道具统一回收，回收后无法找回，你确定要进行此操作么？"
			多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
        elseif v.name == '保存配置' then
            local 事件 = function()
				发送数据(当前 or self and self.当前, 110,{回收数据=自动回收:取自动回收数据()})
			end
            local wb = "#Y/该操作会在每次战斗后将道具栏内满足条件的道具统一回收，回收后无法找回！"
			多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
        end
    end
end