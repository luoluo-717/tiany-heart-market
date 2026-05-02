--[[
Author: GGELUA
Date: 2023-11-15 19:12:14
Last Modified by: GGELUA
Last Modified time: 2023-11-22 17:22:17
--]]

local 自动抓鬼 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("自动抓鬼", 0, 0, 250, 150)
local 当前 = 多开数据.当前
function 自动抓鬼:初始化()
    __置窗口坐标(self, '右')
    local nsf = require('SDL.图像')(250, 150)
    if nsf:渲染开始() then
        置窗口背景("自动抓鬼", 0, 12, 240, 140, true):显示(0, 0)
        字体14:取图像('鬼卡状态：'):显示(21, 50)
        字体14:取图像('剩余时间：'):显示(21, 80)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.允许移动 = true
end

function 自动抓鬼:打开(data)
    -- table.print(data)
    self:置可见(true)
    self.数据 = data
    self.状态 = 1
    self.加入 = 0
    self.时间 = 0
    self.进程 = self.数据.进程
    self.仙玉 = tonumber(self.数据.仙玉)
    self.事件 = self.数据.事件
    self.开启 = true
    self:重置()
end

function 自动抓鬼:刷新(data)
    self.数据 = data
    self.进程 = self.数据.进程
    self.仙玉 = tonumber(self.数据.仙玉)
    self.事件 = self.数据.事件
    self.开启 = true
    self:重置()
end

function 自动抓鬼:重置()
    local nsf = require('SDL.图像')(250, 150)
    if nsf:渲染开始() then
        置窗口背景(self.事件, 0, 12, 240, 140, true):显示(0, 0)
        字体14:取图像('每次消耗1次自动抓鬼'):显示(21, 50)
        字体14:取图像('当前自动抓鬼次数：0'):显示(21, 80)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 自动抓鬼:显示()
    self.时间 = self.时间 + 1
    if self.进程 == "第一进程" and self.时间 > 150 and self.开启 then
        发送数据(当前 or self and self.当前, 42, { 进程 = "第二进程" })
        self.时间 = 0
        self.开启 = false
    end
    if self.进程 == "第二进程" and self.时间 > 150 and self.开启 then
        发送数据(当前 or self and self.当前, 42, { 进程 = "第三进程" })
        self.时间 = 0
        self.开启 = false
    end
    if self.进程 == "第三进程" and self.时间 > 150 and self.开启 then
        发送数据(当前 or self and self.当前, 42, { 进程 = "第四进程" })
        self.时间 = 0
        self.开启 = false
    end
    if self.进程 == "第四进程" and self.时间 > 150 and self.开启 then
        发送数据(当前 or self and self.当前, 42, { 进程 = "第五进程" })
        self.时间 = 0
        self.开启 = false
    end
    if self.进程 == "第五进程" and self.时间 > 150 and self.开启 then
        发送数据(当前 or self and self.当前, 42, { 进程 = "第六进程" })
        self.时间 = 0
        self.开启 = false
    end
    if self.进程 == "第六进程" and self.时间 > 150 and self.开启 then
        发送数据(当前 or self and self.当前, 42, { 进程 = "第一进程" })
        self.时间 = 0
        self.开启 = false
    end
    if self.进程 == "关闭" and self.开启 then
        self.开启 = false
        自动抓鬼:置可见(false)
        发送数据(当前 or self and self.当前, 42, { 进程 = "关闭" })
    end
end

local 关闭 = 自动抓鬼:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46):置拉伸(30, 30), "关闭", 208, 12)
function 关闭:左键弹起(x, y, msg)
    self.开启 = false
    自动抓鬼:置可见(false)
    发送数据(当前 or self and self.当前, 42, { 进程 = "关闭" })
end
