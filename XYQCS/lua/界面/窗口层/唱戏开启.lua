--[[
Author: GGELUA
Date: 2024-02-06 18:58:49
Last Modified by: GGELUA
Last Modified time: 2024-02-06 23:58:59
--]]
local 名称组 = {"一斛珠","五更寒","双城记"}
local 唱戏开启 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("唱戏开启",0,0,376,260)
local 当前 = 多开数据.当前
function 唱戏开启:初始化()
    __置窗口坐标(self,'中')
    local nsf = require('SDL.图像')(376,260)
    if nsf:渲染开始() then
        置窗口背景("戏票专营",0,12,368,440,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 唱戏开启:打开(data)
    self:置可见(true)
    self.选中=0
    self.数据=data
    self.次要控件:重置()
end



local 关闭 = 唱戏开启:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",326,0)

function 关闭:左键弹起(x,y,msg)
    唱戏开启:置可见(false)
end


local 确定 = 唱戏开启:创建我的按钮(__res:getPNGCC(1,401,65,175,43,true):拉伸(124,43),"确定",220,180,"开启")
function 确定:左键弹起(x,y,msg)
    if 唱戏开启.选中 ~= 0 then
        local function 回调处理(i,v)
            if v[i] == "确定" then
                发送数据(当前,99,{类型=名称组[唱戏开启.选中]})
            end
        end
        多开数据[当前].__UI界面.窗口层.对话栏:打开({模型="普陀_接引仙女",名称=多开数据[当前].角色信息.名称,对话="你确定要开启#R/"..名称组[唱戏开启.选中].."#W/嘛？",选项={"确定","取消"},回调处理=回调处理,选中名称=""})
        唱戏开启:置可见(false)
    else
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请选择你要购买的戏票！")
    end
end


local lsb = {"一斛珠","五更寒","双城记"}
for i=1,#lsb do
    local dz = __res:取地址('shape/ui/xz/',0x89B1BE35)
    local 临时函数 = 唱戏开启:创建我的was单选按钮(dz,lsb[i],i*100-70,60)
    function 临时函数:左键按下(消息,x,y)
        唱戏开启.选中 = i
    end
end

local 次要控件 = 唱戏开启:创建控件('次要控件',0,0,376,260)
function 次要控件:重置(禁止)
    local nsf = require('SDL.图像')(376,260)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像("一斛珠"):显示(50,90)
        字体18:取图像("五更寒"):显示(150,90)
        字体18:取图像("双城记"):显示(250,90)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end
