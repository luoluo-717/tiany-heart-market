--[[
Author: GGELUA
Date: 2023-11-28 22:52:03
Last Modified by: GGELUA
Last Modified time: 2023-12-03 23:19:04
--]]

local 登录游戏 = 多开数据[多开数据.当前].__UI界面.登录层:创建控件("登录游戏",300+abbr.py2.x,157+abbr.py2.y,659,384)
local 当前 = 多开数据.当前
function 登录游戏:初始化()
    self:置精灵(__res:取精灵('shape/ui/1000260.was'))
end


local 账号输入 = 登录游戏:创建输入("账号输入",100,90,145,16)
function 账号输入:初始化()
    self:取光标精灵()
    self:置限制字数(20)
    self:置颜色(255,255,255,255)
    self:置文本(__res.配置.账号)
end

local 密码输入 = 登录游戏:创建输入("密码输入",100,133,145,16)
function 密码输入:初始化()
    self:取光标精灵()
    self:置限制字数(20)
    self:置模式(256)
    self:置颜色(255,255,255,255)
    self:置文本(__res.配置.密码)
end

local 登录 = 登录游戏:创建我的was按钮('shape/ui/1000254.was',"登录",460,231)

function 登录:左键弹起(x,y,msg)
    if 账号输入:取文本() ~= "" and 密码输入:取文本() ~= "" then
        __res.配置.账号 = 账号输入:取文本()
        __res.配置.密码 = 密码输入:取文本()
        __res:写出文件("configure.txt",zdtostring(__res.配置))
        发送数据(当前 or self and self.当前,1,"1".."*-*"..__res.配置.账号.."*-*"..__res.配置.密码.."*-*".."安卓")
    else

    end
end

local 退出游戏 = 登录游戏:创建我的was按钮('shape/ui/1000247.was',"退出游戏",460,291)

function 退出游戏:左键弹起(x,y,msg)
    -- 引擎:关闭()
    标签:关闭窗口()
end

local 注册 = 登录游戏:创建我的was按钮('shape/ui/1000255.was',"注册",460,170)

function 注册:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.登录层.登录游戏:置可见(false)
    多开数据[当前].__UI界面.登录层.注册账号:置可见(true,true)
end