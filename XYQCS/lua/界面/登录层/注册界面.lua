--[[
Author: GGELUA
Date: 2023-12-19 16:21:32
Last Modified by: GGELUA
Last Modified time: 2024-04-04 23:30:46
--]]
--[[
Author: GGELUA
Date: 2023-12-19 16:21:32
Last Modified by: GGELUA
Last Modified time: 2024-03-15 11:54:11
--]]
--[[
Author: GGELUA
Date: 2023-12-19 16:21:32
Last Modified by: GGELUA
Last Modified time: 2024-03-15 11:29:58
--]]
--[[
Author: GGELUA
Date: 2023-11-28 22:52:03
Last Modified by: GGELUA
Last Modified time: 2023-12-17 13:59:43
--]]

local 注册账号 = 多开数据[多开数据.当前].__UI界面.登录层:创建控件("注册账号",300+abbr.py2.x,50+abbr.py2.y,659,384)
local 当前 = 多开数据.当前
function 注册账号:初始化()
    -- __置窗口坐标(self)
    -- self:置精灵(__res:取精灵('shape/ui/1000256.was'))
    local nsf = require('SDL.图像')(500,519)
    if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/",0x1000256)):显示(0, 0)
        __res:取图像(__res:取地址("shape/ui/",0x1000257)):显示(110, 85)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 注册账号:清空()
    self.账号输入:置文本("")
    self.密码输入:置文本("")
    self.确认密码:置文本("")
    self.邀请码:置文本("")
end

local 账号输入 = 注册账号:创建输入("账号输入",130,94,145,16)
function 账号输入:初始化()
    self:取光标精灵()
    self:置限制字数(20)
    self:置颜色(255,255,255,255)
end

local 密码输入 = 注册账号:创建输入("密码输入",130,141,145,16)
function 密码输入:初始化()
    self:取光标精灵()
    self:置限制字数(20)
    self:置颜色(255,255,255,255)
end

local 确认密码 = 注册账号:创建输入("确认密码",130,188,145,16)
function 确认密码:初始化()
    self:取光标精灵()
    self:置限制字数(20)
    self:置颜色(255,255,255,255)
end

local 邀请码 = 注册账号:创建输入("邀请码",130,237,145,16)
function 邀请码:初始化()
    self:取光标精灵()
    self:置限制字数(20)
    self:置颜色(255,255,255,255)
    
end

function 注册账号:检查账号格式(账号)
    if not 账号 or 账号 == "" then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y账号不能为空')
        return false
    end
    local 长度 = #账号
    if 长度 < 6 or 长度 > 12 then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y账号长度需在6-20位之间')
        return false
    end

    if not string.match(账号, "^[A-Za-z0-9]+$") then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y账号只能包含英文字母和数字')
        return false
    end
    
    return true, "账号格式正确"
end


local 注册 = 注册账号:创建我的was按钮('shape/ui/1000255.was',"注册",80,277)
function 注册:左键弹起(x,y,msg)
    if 账号输入:取文本() == "" or 密码输入:取文本() == "" or 确认密码:取文本() == "" then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请输入账号、密码')
    elseif 密码输入:取文本() ~= 确认密码:取文本() then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y两次输入的密码不一致，请重新输入')
    end
    if not 注册账号:检查账号格式(账号输入:取文本()) then
        return
    end
        if 邀请码:取文本() == ""  and self.验证提示 == nil   then
            self.验证提示 = 1
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y/尚未输入推荐码')
        else
            if 邀请码:取文本() == 账号输入:取文本() then
                多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y账号与邀请码不可以相同')
                return
            end
            发送数据(当前 or self and self.当前,1.1,"1.1".."*-*"..账号输入:取文本().."*-*"..密码输入:取文本().."*-*"..邀请码:取文本())
            self.验证提示 = nil
        end
end

local 登录 = 注册账号:创建我的was按钮('shape/ui/1000254.was', "登录", 210, 277)

function 登录:左键弹起(x, y, msg)
    多开数据[当前].__UI界面.登录层.注册账号:置可见(false)
    多开数据[当前].__UI界面.登录层.登录游戏:置可见(true, true)
    注册账号:清空()
    注册账号.注册.验证提示=nil
end


