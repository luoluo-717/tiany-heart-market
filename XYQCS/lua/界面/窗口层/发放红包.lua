--[[
Author: GGELUA
Date: 2024-04-21 16:32:04
Last Modified by: GGELUA
Last Modified time: 2024-04-21 21:50:33
--]]
--[[
Author: GGELUA
Date: 2024-04-21 16:32:04
Last Modified by: GGELUA
Last Modified time: 2024-04-21 21:35:24
--]]
--[[
Author: GGELUA
Date: 2023-08-06 12:00:00
Last Modified by: GGELUA
Last Modified time: 2023-08-06 13:30:19
--]]
--[[
Author: GGELUA
Date: 2023-08-06 12:00:00
Last Modified by: GGELUA
Last Modified time: 2023-08-06 12:00:35
--]]
local 发放红包 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("发放红包",0,0,350,500)
local 当前 = 多开数据.当前
--67603D4A 发红包的动态was
function 发放红包:初始化()
    __置窗口坐标(self,'右')
    self.动画 = __res:取动画2(__res:取地址('shape/ui/xz/',0x67603D4A))
    local nsf = require('SDL.图像')(350,500)
    if nsf:渲染开始() then
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 发放红包:打开(data)
    self:置可见(true)
    self.数据=data or {}
    self.红包界面:重置()
end

function 发放红包:更新(dt)
    if self.开始执行 then
        self.动画:更新(dt)
        if self.动画:取当前帧() >= self.动画:取帧数() then
            发送数据(当前,107.4,{红包金额=tonumber(发放红包.红包界面.金额输入:取文本()),传音内容=发放红包.红包界面.内容输入:取文本(),数量=tonumber(发放红包.红包界面.数量输入:取文本())})
            self.开始执行 = nil
        end
    end
end

function 发放红包:显示(x,y)
    if self.开始执行 then
        self.动画:显示(x+170,y+150)
    end
end



local 红包界面 = 发放红包:创建控件("红包界面",0,0,350,500)
function 红包界面:重置()
    self:置可见(true)
    local nsf = require('SDL.图像')(640,460)
    if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/xz/", 0xB0000001)):显示(0,0)
        字体16:置颜色(__取颜色("白色"))
        字体16:取图像(发放红包.数据.银子 or 2000000):显示(320,405)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

local 金额输入 = 红包界面:创建输入("金额输入",120,125,145,16)
function 金额输入:初始化()
    self:取光标精灵()
    self:置限制字数(12)
    self:置颜色(255,255,255,255)
end

local 数量输入 = 红包界面:创建输入("数量输入",180,195,145,16)
function 数量输入:初始化()
    self:取光标精灵()
    self:置限制字数(2)
    self:置颜色(255,255,255,255)
end

local 内容输入 = 红包界面:创建输入("内容输入",120,250,165,60)
function 内容输入:初始化()
    self:取光标精灵()
    self:置限制字数(20)
    self:置颜色(255,255,255,255)
end


local 关闭 = 红包界面:创建我的按钮(__res:取图像(__res:取地址('shape/ui/xz/',0x20000227)),"关闭",283,73)

function 关闭:左键弹起(x,y,msg)
    红包界面:置可见(false)
end




for i, v in ipairs {
    {name = '发放红包', x = 115 ,y = 409 , tcp = __res:取地址('shape/ui/xz/',0X27900000) , font = ''},
} do
    local 临时函数 = 红包界面:创建我的was按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '发放红包' then
            if tonumber(发放红包.红包界面.金额输入:取文本()) == nil or tonumber(发放红包.红包界面.金额输入:取文本()) < 2000000 then
                多开数据[当前].__UI弹出.提示框:打开('#Y请输入正确的金额(>2000000)')
            elseif tonumber(发放红包.红包界面.数量输入:取文本()) == nil or tonumber(发放红包.红包界面.数量输入:取文本()) < 2  or tonumber(发放红包.红包界面.数量输入:取文本()) > 20 then
                多开数据[当前].__UI弹出.提示框:打开('#Y请输入正确的红包数量(>2且<20)')
            elseif 发放红包.红包界面.内容输入:取文本() == "" then
                多开数据[当前].__UI弹出.提示框:打开('#Y请输入传音内容')
            else
                发放红包.开始执行 = true
                发放红包.红包界面:置可见(false)
            end
        end
    end
end