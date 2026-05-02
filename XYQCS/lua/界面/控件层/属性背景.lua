--[[
    @Author       : GGELUA
    @Date         : 2022-02-15 11:13:31
    @Last Modified by: GGELUA
    @Last Modified time: 2022-04-12 09:07:26
--]]

function 取属性背景(x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    if nsf:渲染开始() then     
            __res:getPNGCC(1,0+200,0,20,20):显示(0,0+y)
            __res:getPNGCC(1,0+200,20,20,160):拉伸(20,h-40):显示(0,20+y)
            __res:getPNGCC(1,0+200,180,20,20):显示(0,h-20+y)
            
            __res:getPNGCC(1,20+200,0,160,20):拉伸(w-40,20):显示(20,0+y)
            __res:getPNGCC(1,20+200,20,60,160):拉伸(w-40,h-40):显示(20,20+y)
            __res:getPNGCC(1,30+200,170,140,30):拉伸(w-40,20):显示(20,h-20+y)

            __res:getPNGCC(1,180+200,0,20,20):显示(w-20,0+y)
            __res:getPNGCC(1,180+200,20,20,160):拉伸(20,h-40):显示(w-20,20+y)
            __res:getPNGCC(1,180+200,180,20,20):显示(w-20,h-20+y)
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end