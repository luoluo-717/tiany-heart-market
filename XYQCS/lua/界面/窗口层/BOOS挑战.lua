--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-09-02 12:39:41
FilePath: \XYQCS\lua\界面\窗口层\BOOS挑战.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
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
local BOOS挑战 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("BOOS挑战",0,0,660,500)
local 当前 = 多开数据.当前
function BOOS挑战:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(660,500)
    if nsf:渲染开始() then
        -- __res:取图像(__res:取地址("shape/ui/xz/", 0xaa10025)):显示(0,0)
        置窗口背景("世界挑战",0,12,640,460,true):显示(0,0)
        取白色背景(0,0,370,360,true):显示(175+80,53)
        取白色背景(0,0,240,360,true):显示(10,53)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function BOOS挑战:打开(data)
    self:置可见(true)
    self.数据 = data
    self.模型:重置()
    self:重置()
end

local 模型 = BOOS挑战:创建控件("模型",0,0,640,460)

function 模型:重置()
    self.BOOS模型 = __res:取动画2(__res:取地址("shape/mx/", 0xf207f1a0)):置方向(3):置循环(true)
end

function 模型:更新(dt)
    self.BOOS模型:更新(dt)
end

function 模型:显示(x,y)
    self.BOOS模型:显示(x+160,y+300)
end


local 关闭 = BOOS挑战:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",607,0)

function 关闭:左键弹起(x,y,msg)
    BOOS挑战:置可见(false)
end

function BOOS挑战:重置()
    local nsf = require('SDL.图像')(660,500)
    if nsf:渲染开始() then
        -- __res:取图像(__res:取地址("shape/ui/xz/", 0xaa10025)):显示(0,0)
        置窗口背景("世界挑战",0,12,640,460,true):显示(0,0)
        取白色背景(0,0,370,360,true):显示(175+80,53)
        取白色背景(0,0,240,360,true):显示(10,53)

        if self.数据.开启 then
            字体18:置颜色(__取颜色("红色"))
            字体18:取图像("当前BOOS气血："..self.数据.气血.当前.."/"..self.数据.气血.上限):显示(20,388)
        else
            字体18:置颜色(__取颜色("黑色"))
            字体18:取图像("已结束"):显示(20,388)
        end
        字体15:置颜色(__取颜色("黑色"))
        字体15:取图像("排行"):显示(270,70) 
        字体15:取图像("玩家名称"):显示(330,70) 
        字体15:取图像("玩家伤害"):显示(470,70) 

         if self.数据.排行.最终一击 then
                字体17:置颜色(__取颜色("红色"))
                字体17:取图像("最终一击："..self.数据.排行.最终一击.名称):显示(20,330) 
                字体17:取图像("最终一击伤害："..self.数据.排行.最终一击.伤害):显示(20,360) 

        else
            字体17:置颜色(__取颜色("黑色"))
            字体17:取图像("最终一击：尚未产生"):显示(20,360) 
        end

        
       if self.数据.排行 ~= nil then
            local xxx=0
            local yyy=0
            for i=1,10 do
                if i == 1 then
                    字体16:置颜色(__取颜色("红色"))
                elseif i == 2 then
                    字体16:置颜色(__取颜色("蓝色"))
                elseif i == 3 then
                    字体16:置颜色(__取颜色("绿色"))
                else
                    字体16:置颜色(__取颜色("黑色"))
                end
                if self.数据.排行[i] ~= nli then
                字体16:取图像(i):显示(270+xxx*190,100+yyy*34) 

                字体16:取图像(""..self.数据.排行[i].名称):显示(330+xxx*190,100+yyy*34) 
                -- 字体16:取图像(""..self.数据.排行[i].等级):显示(340+xxx*190,153+yyy*77) 
                -- 字体16:取图像(""..self.数据.排行[i].门派):显示(400+xxx*190,153+yyy*77) 
                字体16:取图像(""..self.数据.排行[i].伤害):显示(470+xxx*190,100+yyy*34) 
                end
                yyy = yyy+1
                -- if yyy >= 5 then
                --     yyy = 0
                    xxx = xxx
                -- end
            end
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end


for i, v in ipairs {
    {name = '最后一击', x = 30 ,y = 425 , tcp = __res:getPNGCC(3,511,11,117,43,true):置拉伸(110,33), font = '最终一击'},
    {name = '领取奖励', x = 30+120 ,y = 425 , tcp = __res:getPNGCC(3,511,11,117,43,true):置拉伸(110,33) , font = '领取奖励'},
    {name = '一键附魔', x = 330 ,y = 425 , tcp = __res:getPNGCC(3,511,11,117,43,true):置拉伸(110,33) , font = '一键附魔'},
    {name = '发起挑战', x = 330+120 ,y = 425 , tcp = __res:getPNGCC(3,511,11,117,43,true):置拉伸(110,33) , font = '发起挑战'},


} do
    local 临时函数 = BOOS挑战:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '最后一击' then
            发送数据(当前 or self and self.当前,101.3)
        elseif v.name == "领取奖励" then
            发送数据(当前 or self and self.当前,101.2)
        elseif v.name == "一键附魔" then
            local 事件 = function()
            发送数据(当前,3738.1)
            end
            local wb = "一键附魔需要消耗5000W,强化符等级均为186级,确定要附魔吗？"
            多开数据[多开数据.当前].__UI界面.窗口层.文本栏.打开(多开数据[多开数据.当前].__UI界面.窗口层.文本栏, wb, 285, 155, 390, 200, 事件)

        elseif v.name == "发起挑战" then
            local 事件 = function()
            发送数据(当前,101.1)
            end
            local wb = "准备好迎接挑战了吗？"
            多开数据[多开数据.当前].__UI界面.窗口层.文本栏.打开(多开数据[多开数据.当前].__UI界面.窗口层.文本栏, wb, 285, 155, 390, 200, 事件)

        end
    end
end