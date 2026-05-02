--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-06-27 06:51:06
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-10 11:44:13
FilePath: \XYQCS\lua\界面\窗口层\剑会匹配.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2023-11-22 16:22:09
Last Modified by: GGELUA
Last Modified time: 2023-11-22 20:39:53
--]]
local 剑会匹配 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("剑会匹配",0,0,840,400)
local 当前 = 多开数据.当前
local rx = {
	飞燕女 = 0xFFFFFF20,
	骨精灵 = 0xFFFFFF21,
	鬼潇潇 = 0xFFFFFF22,
	狐美人 = 0xFFFFFF23,
	虎头怪 = 0xFFFFFF24,
	剑侠客 = 0xFFFFFF25,
	巨魔王 = 0xFFFFFF26,
	龙太子 = 0xFFFFFF27,
	杀破狼 = 0xFFFFFF28,
	神天兵 = 0xFFFFFF29,
	巫蛮儿 = 0xFFFFFF30,
	舞天姬 = 0xFFFFFF31,
	逍遥生 = 0xFFFFFF32,
	玄彩娥 = 0xFFFFFF33,
	偃无师 = 0xFFFFFF34,
	英女侠 = 0xFFFFFF35,
	羽灵神 = 0xFFFFFF36,
	桃夭夭 = 0xFFFFFF37,
}
function 剑会匹配:初始化()
    local nsf = require('SDL.图像')(840,400)
    if nsf:渲染开始() then
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 剑会匹配:打开(data)
    __置窗口坐标(self)
    self:置可见(true)
    self.人数=data.人数
    self.模式=data.模式
    local nsf = require('SDL.图像')(840,400)
    if nsf:渲染开始() then
        if 多开数据[当前].__主显.主角.是否组队 then
            if self.人数 == 1 then
                取黑色背景(0,0,150,295,true):显示(引擎.宽度/2 - 110,引擎.高度/2 -210)
                __res:取图像(__res:取地址("shape/ui/jh/",rx[多开数据[当前 or self and self.当前].角色信息.模型])):显示(引擎.宽度/2 - 100,引擎.高度/2 -200)
            elseif self.人数 == 3 then
                for i=1,#多开数据[当前].__UI界面.窗口层.队伍列表.队伍数据 do
                    -- 取黑色背景(0,0,150*3,295,true):显示(引擎.宽度/2 - 138+(i-1)*138,引擎.高度/2 -210)
                    __res:取图像(__res:取地址("shape/ui/jh/",rx[多开数据[当前].__UI界面.窗口层.队伍列表.队伍数据[i].模型])):显示(引擎.宽度/2 - 185+(i-1)*138,引擎.高度/2 -200)
                end
            elseif self.人数 == 5 then
                for i=1,#多开数据[当前].__UI界面.窗口层.队伍列表.队伍数据 do
                    -- 取黑色背景(0,0,150*5,295,true):显示(引擎.宽度/2 - 138+(i-1)*138,引擎.高度/2 -210)
                    __res:取图像(__res:取地址("shape/ui/jh/",rx[多开数据[当前].__UI界面.窗口层.队伍列表.队伍数据[i].模型])):显示(引擎.宽度/2 - 340+(i-1)*138,引擎.高度/2 -200)
                end
            end
        else
            取黑色背景(0,0,150,295,true):显示(引擎.宽度/2 - 110,引擎.高度/2 -210)
            __res:取图像(__res:取地址("shape/ui/jh/",rx[多开数据[当前 or self and self.当前].角色信息.模型])):显示(引擎.宽度/2 - 100,引擎.高度/2 -200)
        end
        字体16:置颜色(__取颜色("黑色"))
        字体16:取图像("当前匹配模式："..self.模式):显示(引擎.宽度/2 + 45,引擎.高度/2 +60)
    end
    self:置精灵(nsf:到精灵())
end

local 关闭 = 剑会匹配:创建我的按钮(__res:getPNGCC(1,626,28,58,34,true):拉伸(90,24),"剑会匹配",400,325,"取消匹配",nil,3)

function 关闭:左键弹起()
    发送数据(当前 or self and self.当前,52.3,{模式=self.模式})
    剑会匹配:置可见(false)
end

