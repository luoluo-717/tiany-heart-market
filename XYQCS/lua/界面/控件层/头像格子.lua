--[[
    @Author       : GGELUA
    @Date         : 2022-03-09 15:42:09
Last Modified by: GGELUA
Last Modified time: 2023-11-07 18:40:23
--]]
local 头像格子 = class('头像格子')

function 头像格子:初始化(当前)
    self.py = {x=0,y=0}
    self.文字 = false
    self.当前=当前
end

function 头像格子:置头像(数据,lx,x,y)
    local w,h = x,y
    if lx == "大" then
        w,h = 70,70
        self.文字 = true
    elseif lx == "右上角" then
    elseif lx == "充值系统头像" or lx == "归墟" then
        w,h = 50,50

    end
   
    if 数据 then
        if lx == "大" then
            local nsf = require('SDL.图像')(w,h)
            if nsf:渲染开始() then
                __res:getPNGCC(3,683,284,73,73):拉伸(70,70):显示(0,0)
                local lssj = 取头像(数据.模型)
                if lssj[2] == 0 then lssj[2] = lssj[1] end
                __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(w-6,h-6):显示(3,3)
                nsf:渲染结束()
            end
            self.模型 = nsf:到精灵()
        elseif lx == "小" then
            local nsf = require('SDL.图像')(w,h)
            if nsf:渲染开始() then
                __res:getPNGCC(3,683,284,73,73):拉伸(55,55):显示(0,0)
                local lssj = 取头像(数据.模型)
                __res:取图像(__res:取地址('shape/mx/',lssj[1])):拉伸(w-6,h-6):显示(3,3)
                nsf:渲染结束()
            end
            self.模型 = nsf:到精灵()
        elseif lx == "伙伴" then
            local nsf = require('SDL.图像')(55,55)
            if nsf:渲染开始() then
                __res:getPNGCC(3,683,284,73,73):拉伸(55,55):显示(0,0)
                local lssj = 取头像(数据.模型.."_助战")
                __res:取图像(__res:取地址('shape/mx/',lssj[1])):拉伸(48,48):显示(3,3)
                if 数据.参战 == 1 then
                    字体18:置颜色(__取颜色('红色'))
                    字体18:取描边图像('战'):显示(0,0)
                end
                nsf:渲染结束()
            end
            self.模型 = nsf:到精灵()
        elseif lx =="归墟" then
            local nsf = require('SDL.图像')(w,h)
            if nsf:渲染开始() then
                if  not 数据.模型 then
                    require("SDL.图像")("assets/shape/ui/pic/bb.png"):显示(2, 1)
                else
                __res:getPNGCC(3,683,284,73,73):拉伸(50,50):显示(0,0)
                local lssj = 取头像(数据.模型)
                if lssj[2] == 0 then lssj[2] = lssj[1] end
                __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(w-6,h-6):显示(3,3)
                end
                nsf:渲染结束()
            end
            self.模型 = nsf:到精灵()

        else
            local nsf = require('SDL.图像')(w,h)
            if nsf:渲染开始() then
                if  not 数据.模型 then
                require("SDL.图像")("assets/shape/ui/pic/bb.png"):显示(2, 1)
                else
                local lssj = 取头像(数据.模型)
                if lssj[2] == 0 then lssj[2] = lssj[1] end
                __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(w-6,h-6):显示(3,3)
                end
                nsf:渲染结束()
            end
            self.模型 = nsf:到精灵()
        end
    else
        if lx == "大" then
            self.模型 = __res:getPNGCC(3,683,284,73,73):拉伸(70,70):到精灵()
        elseif lx == "小" then
            self.模型 = __res:getPNGCC(3,683,284,73,73):拉伸(55,55):到精灵()
        end
    end
    self.数据 = 数据
end

function 头像格子:显示(x,y)
    self.模型:显示(x+self.py.x,y+self.py.y)
    if self.确定 then
        多开数据[self.当前].__主控.召唤兽选中大:显示(x,y)
    elseif self.确定1 then
        多开数据[self.当前].__主控.召唤兽选中小:显示(x,y)
    end
    if self.文字 and self.数据 and self.数据.参战信息 then
        多开数据[self.当前].__主控.参战:显示(x,y)
    end
end

return 头像格子