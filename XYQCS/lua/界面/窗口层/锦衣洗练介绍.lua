--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-05-13 15:27:21
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-05-13 15:31:45
FilePath: \XYQCS\lua\界面\窗口层\锦衣洗练介绍.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-04-27 08:42:29
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-04-27 09:08:10
FilePath: \XYQCS\lua\界面\窗口层\锦衣洗练介绍.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2024-02-06 18:29:22
Last Modified by: GGELUA
Last Modified time: 2024-02-07 00:01:29
--]]
local 锦衣洗练介绍 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("锦衣洗练介绍",0,0,376,450)
local 当前 =  多开数据.当前

function 锦衣洗练介绍:初始化()
    __置窗口坐标(self,'中')
    local nsf = require('SDL.图像')(376,450)
    if nsf:渲染开始() then
        置窗口背景("技能介绍",0,12,368,440,true):显示(0,0)
        置轮廓文字(字体20,"手到擒来：法暴击率+15%\n神谋魔道：法连几率+30\n言出法随：增加法伤\n撼海狂龙：增加龙魂效果\n涤瑕蹈隙：增加伤害\n八攻八克：增加嗜血追击效果\n避实击虚：物理暴击+20%\n力大无穷：增加强力效果\n半济而击：增加吸血效果\n自在逍遥：增加神迹效果\n月明如昼：增加夜战效果\n自我疗愈：增加再生效果\n兵贵神速：速度+20%\n护体如磐：增加凝光炼彩效果\n以牙还牙：增加反击效果\n洞察一切：增加感知效果\n坚如磐石：增加防御效果\n除邪惩恶：增加驱鬼效果\n鸿运当头：增加幸运效果" or 0,"黑色","白色",20, 50)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 锦衣洗练介绍:打开(data)
    self:置可见(true)
    self.选中=0
    self.数据=data
    锦衣洗练介绍:初始化()
end


local 关闭 = 锦衣洗练介绍:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",326,0)

function 关闭:左键弹起(x,y,msg)
    锦衣洗练介绍:置可见(false)
end
