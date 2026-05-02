--[[
    @Author       : GGELUA
    @Date         : 2022-04-03 22:04:08
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:55:44
--]]
local 宠物 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("宠物", 0, 0, 490, 380)
local 当前 = 多开数据.当前
local lsb = { "名称", "等级", "耐力", "经验" }
local lsb2 = { "洗炼", "炼化", "合宠", "打书", "内丹", "认证" }
function 宠物:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(482, 378)
    if nsf:渲染开始() then
        置窗口背景("宠物", 0, 12, 482, 363, true):显示(0, 0)
        __res:getPNGCC(3, 375, 388, 145, 149):显示(30, 72)
        local lssj = 取输入背景(0, 0, 152, 23)
        字体18:置颜色(255, 255, 255)
        for i = 1, #lsb do
            lssj:显示(242, 72 + ((i - 1) * 47))
            字体18:取图像(lsb[i]):显示(194, 74 + ((i - 1) * 47))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.模型格子 = __UI模型格子.创建(当前)
end

function 宠物:打开()
    self:置可见(true)
    local nsf = require('SDL.图像')(400, 240)
    if nsf:渲染开始() then
        for i = 1, #lsb do
            字体18:置颜色(39, 53, 81)
            if lsb[i] == "耐力" then
                字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宠物[lsb[i]] .. "/" .. 多开数据[当前 or self and self.当前].角色信息.宠物
                    .最大耐力):显示(252, 74 + ((i - 1) * 47))
            elseif lsb[i] == "经验" then
                字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宠物[lsb[i]] .. "/" .. 多开数据[当前 or self and self.当前].角色信息.宠物
                    .最大经验):显示(252, 74 + ((i - 1) * 47))
            else
                字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宠物[lsb[i]]):显示(252, 74 + ((i - 1) * 47))
            end
        end
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    宠物.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息.宠物.模型, "宠物", 100, 188)
end

local 关闭 = 宠物:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 440, 0)

function 关闭:左键弹起(x, y, msg)
    宠物:置可见(false)
end

local pyx = 0
local pyy = 0
for i = 1, #lsb2 do
    if i > 3 then
        pyx = -450
        pyy = 60
    end
    local 临时函数 = 宠物:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(123, 41), lsb2[i] .. "按钮", 30 + ((i - 1) * 150) +
        pyx, 255 + pyy, lsb2[i])
    function 临时函数:左键弹起(x, y, msg)
        if lsb2[i] == "洗炼" then
            发送数据(当前 or self and self.当前, 5007, { 类型 = "洗炼" })
        elseif lsb2[i] == "炼化" then
            发送数据(当前 or self and self.当前, 5007, { 类型 = "炼化" })
        elseif lsb2[i] == "打书" then
            发送数据(当前 or self and self.当前, 5007, { 类型 = "打书" })
        elseif lsb2[i] == "内丹" then
            发送数据(当前 or self and self.当前, 5007, { 类型 = "内丹" })
        elseif lsb2[i] == "认证" then
            发送数据(当前 or self and self.当前, 5007, { 类型 = "认证" })
        elseif lsb2[i] == "合宠" then
            发送数据(当前 or self and self.当前, 5007, { 类型 = "合宠" })
        end
    end
end
