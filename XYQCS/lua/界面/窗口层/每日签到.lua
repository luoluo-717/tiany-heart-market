--[[
    @Author       : GGELUA
    @Date         : 2022-07-07 13:35:47
Last Modified by: GGELUA
Last Modified time: 2023-07-30 12:38:31
--]]
local 每日签到 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("每日签到",0,0,450,220)
local 当前 =  多开数据.当前
function 每日签到:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(450,220)
    if nsf:渲染开始() then
        置窗口背景("每日签到",0,12,440,210,true):显示(0,0)
        取白色背景(0,0,410,160,true):显示(15,50)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end
local function 时间转换(时间)
	return  os.date("%m", 时间).."月"..os.date("%d", 时间).."日 "
end
function 每日签到:打开(data)
    self:置可见(true)
    local nsf = require('SDL.图像')(450,220)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('红色'))
        if not data[data.几号] then
            字体18:取图像('今日未签到'):显示(50,70)
        else
            字体18:取图像('今日已签到'):显示(50,70)
        end
        字体18:取图像('已累计签到：'..data.累计签到..'天'):显示(50,130)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

function 每日签到:刷新(data)
    self:置可见(true)
    local nsf = require('SDL.图像')(695,496)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('红色'))
        if not data[data.几号] then
            字体18:取图像('今日未签到'):显示(50,70)
        else
            字体18:取图像('今日已签到'):显示(50,70)
        end
        字体18:取图像('已累计签到：'..data.累计签到..'天'):显示(50,130)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

local 关闭 = 每日签到:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",395,0)

function 关闭:左键弹起(x,y,msg)
    每日签到:置可见(false)
end

for i, v in ipairs {
    {name = '签到', x = 310 ,y = 150 , tcp = __res:getPNGCC(4,1098,59,76,51,true)},
} do
    local 临时函数 = 每日签到:创建我的按钮(v.tcp,v.name,v.x,v.y)
    function 临时函数:左键弹起(x, y)
       if v.name == '签到' then
            发送数据(当前 or self and self.当前,58.1,{月份=tonumber(os.date("%m", os.time())),几号=tonumber(os.date("%d", os.time()))})
        end
    end
end