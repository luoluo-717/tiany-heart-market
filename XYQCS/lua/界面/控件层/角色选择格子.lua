--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-10-07 11:44:34
FilePath: \XYQCS\lua\界面\控件层\角色选择格子.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]

local 角色选择格子 = class('角色选择格子')
local ggf = require('GGE.函数')
function 角色选择格子:初始化(当前)
    self.动画 = {}
    self.当前 = 当前
    self.x, self.y = 0, 0
end

function 角色选择格子:置数据(数据, x, y)
    self.动画 = {}
    local 加入数据 = ggf.insert(self.动画)
    self.x, self.y = 0, 0
    self.确定 = nil
    self.数据 = nil
    if 数据 then
        self.数据 = 数据
        local lssj
        local 允许武器=false
        if 数据.锦衣数据  then
            local 锦衣名称 = 数据.锦衣数据.名称
            if type(数据.锦衣数据) == "string" then
                锦衣名称 = 数据.锦衣数据
            end
            local 武器类型 = nil
            if 数据.武器数据 then 
                武器类型 = 多开数据[self.当前].__主控:取武器子类(数据.武器数据.子类) 
                lssj = 取普通锦衣模型(锦衣名称, 数据.造型, 数据.武器数据.子类)
            else
                lssj = 取普通锦衣模型(锦衣名称, 数据.造型)
            end
        end
        -----------------------------------------------------------------C改 副武器
        if 数据.副武器数据 and 数据.副武器数据.名称 ~= ""  then
            local m = 多开数据[self.当前].__主控:取武器子类(数据.副武器数据.子类)
            if 数据.锦衣数据  then
                local 锦衣名称=数据.锦衣数据.名称
                if 锦衣名称=="青花瓷月白" or 锦衣名称=="龙行玉泽" or 锦衣名称=="萌龙咆哮" or 锦衣名称=="胖胖龙" or 锦衣名称=="黑麒麟" or 锦衣名称=="锦鲤" or 锦衣名称=="青花瓷月黑" or 锦衣名称=="灼灼韶华" or 锦衣名称=="齐天大圣月白" or 锦衣名称=="齐天大圣月黑" then
                    lssj =取祥瑞模型(数据.造型,数据.锦衣数据.名称)
                    允许武器 = true
                end
                tcp3 = __res:取动画2(__res:取地址('shape/mx/zj/', lssj[1])):置方向(5):置循环(true)
            else
                lssj = 取模型(数据.造型, m)
                tcp3 = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
                if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil and 数据.染色组[1] ~= 0 and 数据.染色组[2] ~= 0 and 数据.染色组[3] ~= 0 then
                    __res:置染色(tcp3, 数据.染色方案, 数据.染色组[1], 数据.染色组[2], 数据.染色组[3])
                end
            end
                加入数据(tcp3)
            
        if 数据.副武器数据 and 数据.副武器数据.名称 and 数据.副武器数据.子类==911 and not 允许武器 then
            local m = 多开数据[self.当前].__主控:取武器附加名称(数据.副武器数据.子类, 数据.副武器数据.等级, 数据.副武器数据.名称)
            local lssj1 = 取模型(m .. "_" .. 数据.造型)
            local tcp5 = __res:取动画2(__res:取地址('shape/mx/', lssj1[1])):置方向(5):置循环(true)
            if 数据.副武器数据.染色组 and 数据.副武器数据.染色方案 and 数据.副武器数据.染色方案 ~= 0 and 数据.副武器数据.染色组[1] ~= nil and 数据.副武器数据.染色组[1] ~= 0 and 数据.副武器数据.染色组[2] ~= 0 then
                __res:置染色(tcp5, 数据.副武器数据.染色方案, 数据.副武器数据.染色组[1], 数据.副武器数据.染色组[2])
            end
            加入数据(tcp5)
          end
        end
        -----------------------------------------------------------------C改 副武器

        if 数据.武器数据 and 数据.武器数据.名称 ~= ""  then
            local m = 多开数据[self.当前].__主控:取武器子类(数据.武器数据.子类)
            if 数据.锦衣数据  then
                local 锦衣名称=数据.锦衣数据.名称
                if 锦衣名称=="青花瓷月白" or 锦衣名称=="龙行玉泽" or 锦衣名称=="萌龙咆哮" or 锦衣名称=="胖胖龙" or 锦衣名称=="黑麒麟" or 锦衣名称=="锦鲤" or 锦衣名称=="青花瓷月黑" or 锦衣名称=="灼灼韶华" or 锦衣名称=="齐天大圣月白" or 锦衣名称=="齐天大圣月黑" then
                    lssj =取祥瑞模型(数据.造型,数据.锦衣数据.名称)
                    允许武器 = true
                end
                tcp = __res:取动画2(__res:取地址('shape/mx/zj/', lssj[1])):置方向(5):置循环(true)
            else
                if not 允许武器 then
                    lssj = 取模型(数据.造型, m)
                    tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
                    if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil and 数据.染色组[1] ~= 0 and 数据.染色组[2] ~= 0 and 数据.染色组[3] ~= 0 then
                        __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2], 数据.染色组[3])
                    end
                end
            end
            加入数据(tcp)
            if  数据.武器数据.级别限制 then  数据.武器数据.等级 =  数据.武器数据.级别限制 end
            local m = 多开数据[self.当前].__主控:取武器附加名称(数据.武器数据.子类, 数据.武器数据.等级, 数据.武器数据.名称)
            if not 允许武器 then
                lssj = 取模型(m .. "_" .. 数据.造型)
                tcp1 = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
                if 数据.武器数据.染色组 and 数据.武器数据.染色方案 and 数据.武器数据.染色方案 ~= 0 and 数据.武器数据.染色组[1] ~= nil and 数据.武器数据.染色组[1] ~= 0 and 数据.武器数据.染色组[2] ~= 0 then
                    __res:置染色(tcp1, 数据.武器数据.染色方案, 数据.武器数据.染色组[1], 数据.武器数据.染色组[2])
                end
                加入数据(tcp1)
            end
        else
            if 数据.锦衣数据  then
                local 锦衣名称=数据.锦衣数据.名称
                if 锦衣名称=="青花瓷月白" or 锦衣名称=="龙行玉泽" or 锦衣名称=="萌龙咆哮" or 锦衣名称=="胖胖龙" or 锦衣名称=="黑麒麟" or 锦衣名称=="锦鲤" or 锦衣名称=="青花瓷月黑" or 锦衣名称=="灼灼韶华" or 锦衣名称=="齐天大圣月白" or 锦衣名称=="齐天大圣月黑" then
                    lssj =取祥瑞模型(数据.造型,数据.锦衣数据.名称)
                    允许武器 = true
                end
                tcp = __res:取动画2(__res:取地址('shape/mx/zj/', lssj[1])):置方向(5):置循环(true)
            else
                lssj = 取模型(数据.造型)
                tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
                if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil and 数据.染色组[1] ~= 0 and 数据.染色组[2] ~= 0 and 数据.染色组[3] ~= 0 then
                    __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2], 数据.染色组[3])
                end
            end
            加入数据(tcp)
        end
    end
    self.x, self.y = x, y
end

function 角色选择格子:清空()
    self.动画 = {}
end

function 角色选择格子:更新(dt)
    for k, v in pairs(self.动画) do
        v:更新(dt)
    end
end

function 角色选择格子:显示(x, y)
    if self.确定 then
        多开数据[self.当前].__主控.角色选择背景选中:显示(x, y)
    else
        多开数据[self.当前].__主控.角色选择背景:显示(x, y)
    end
    for k, v in pairs(self.动画) do
        v:显示(x + self.x, y + self.y)
    end
end

return 角色选择格子
