--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:27:40
--]]
多开数据[多开数据.当前].__UI弹出.成就弹窗 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("成就弹窗",0,0,380,120)
local 成就弹窗 = 多开数据[多开数据.当前].__UI弹出.成就弹窗
local 当前 =  多开数据.当前
function 成就弹窗:初始化()
    self:置坐标((引擎.宽度 - 380)/2, 引擎.高度 - 140)
    self.外框= __res:取动画(__res:取地址("shape/ui/xz/", 0x00000009)):取动画(1):播放(true)
    self.烟花= __res:取动画(__res:取地址("shape/ui/xz/", 0x00000007)):取动画(1):播放(true)
end

function 成就弹窗:打开(内容,类型)
    self:置可见(true)
    self:置动画(内容,类型)
    self.提示文本:清空()
    local txt
    if 类型=="普通" then
        txt="恭喜你本次抽奖喜得 "..内容.名称
    elseif 类型=="宠物" then
        txt="恭喜你合出"..内容[2].."技能召唤兽！"
    elseif 类型=="装备" then
        txt="鉴定出“无级别特效” "
    end
    self.提示文本:置文本(txt)
end

function 成就弹窗:置动画(内容,类型)
    local zy
    local lj
    local 名称
    if 类型=="普通" then
        zy=取物品(内容.名称)[12] or 0x00000010
        lj=取物品(内容.名称)[12] and "shape/dj/" or "shape/ui/xz/"
        名称=内容.名称
    elseif 类型=="宠物" then
        zy=取头像(内容[1])[1] or 0x00000010
        lj=取头像(内容[1])[1] and "shape/tx/" or "shape/ui/xz/"
        名称=内容[1]
    elseif 类型=="装备" then
        zy=取物品(内容[1])[12] or 0x00000010
        lj=取物品(内容[1])[12] and "shape/dj/" or "shape/ui/xz/"
        名称=内容[1]
    end
    local nsf = require('SDL.图像')(380,120)
    if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/xz/", 0x00000006)):显示(0,0)
        __res:取图像(__res:取地址("shape/ui/xz/", 0x00000008)):显示(40,35)
        __res:取图像(__res:取地址(lj, zy)):显示(40,35)
        
        字体18:取图像(名称):显示(100,35)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 成就弹窗:更新(dt)
    self.外框:更新(dt)
    self.烟花:更新(dt)
end

function 成就弹窗:显示(x,y)
    self.外框:显示(x,y)
    self.烟花:显示(x,y)
end

local 提示文本 = 成就弹窗:创建文本("提示文本",100,60,358,75)
function 提示文本:初始化()

end

