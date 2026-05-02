--[[
    @Author       : GGELUA
    @Date         : 2022-04-19 10:51:47
Last Modified by: GGELUA
Last Modified time: 2023-08-10 21:29:28
--]]
local 任务提示 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("任务提示",0,0,726,485)
local 当前 = 多开数据.当前
function 任务提示:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(726,485)
    if nsf:渲染开始() then
        置窗口背景("任务提示",0,12,718,470,true):显示(0,0)
        取白色背景(0,0,485,368,true):显示(217,55)
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像('任务说明'):显示(240,78)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 任务提示:打开(data)
    if self.是否可见 then
        return
    else
        self:置可见(true)
        if 多开数据[当前].角色信息.剧情 ~= nil then
            data[#data + 1] = 多开数据[当前].__主控:取剧情描述(多开数据[当前].角色信息.剧情.主线, 多开数据[当前].角色信息.剧情.进度)
            data[#data].类型 = "剧情"
        end
        if 0 ~= 多开数据[当前].角色信息.国庆活动 or 18 ~= 多开数据[当前].角色信息.国庆活动 then
            data[#data + 1] = 多开数据[当前].__主控:取活动描述(1, 多开数据[当前].角色信息.国庆活动)
            data[#data].类型 = "活动"
        end
        if 0 ~= 多开数据[当前].角色信息.中秋活动 or 18 ~= 多开数据[当前].角色信息.中秋活动 then
            data[#data + 1] = 多开数据[当前].__主控:取活动描述(2, 多开数据[当前].角色信息.中秋活动)
            data[#data].类型 = "活动"
        end
        self.任务列表:重置(data)
    end
end

local 关闭 = 任务提示:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",676,0)

function 关闭:左键弹起(x,y,msg)
    任务提示:置可见(false)
end






local 任务列表 = 任务提示:创建列表("任务列表",20,54,171,360)

function 任务列表:初始化()
    self:置文字(字体18)
    self.行高度 = 56
    self.行间距 = 5
end

function 任务列表:重置(data)
    self:清空()
    for i,v in ipairs(data) do
        self:添加()
        local nsf = require('SDL.图像')(224,67)
        if nsf:渲染开始() then
            __res:getPNGCC(2,230,964,402,51):拉伸(171,56):显示(0,0)
            local tsf = 字体18:置颜色(255,255,255):取图像(data[i][1])
            tsf:显示((171 - tsf.宽度) // 2, (56 - tsf.高度) // 2)
            nsf:渲染结束()
        end
        self.子控件[i]:置精灵(nsf:到精灵())
        self.子控件[i]._spr.数据 = data[i]
    end
end

function 任务列表:左键弹起(x, y, i, item, msg)
    任务提示.任务文本:添加文本('#K'..self.子控件[i]._spr.数据[1])
    任务提示.任务文本:置文本(self.子控件[i]._spr.数据[2])
    任务提示.任务文本:置文本('#K'..'任务奖励')
    if self.子控件[i]._spr.数据[3] then
        任务提示.任务文本:置文本('#R'..self.子控件[i]._spr.数据[3])
    end
end

local 任务文本 = 任务提示:创建我的文本("任务文本",240,103,435,280,true)

function 任务文本:添加文本(文本)
    self:清空()
    self:置文本(文本)
end
