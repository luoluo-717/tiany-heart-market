--[[
    @Author       : GGELUA
    @Date         : 2022-03-25 17:53:00
    @Last Modified by: GGELUA
    @Last Modified time: 2022-04-12 15:24:33
--]]
function 取白色背景(x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    if nsf:渲染开始() then
        __res:getPNGCC(3,442,0+931,20,20):显示(0,0+y)
        __res:getPNGCC(3,442,20+931,20,162):拉伸(20,h-40):显示(0,20+y)
        __res:getPNGCC(3,442,182+931,20,20):显示(0,h-20+y)

        __res:getPNGCC(3,20+442,0+931,160,20):拉伸(w-40,20):显示(20,0+y)
        __res:getPNGCC(3,20+442,20+931,160,162):拉伸(w-40,h-40):显示(20,20+y)
        __res:getPNGCC(3,30+442,182+931,160,20):拉伸(w-40,20):显示(20,h-20+y)

        __res:getPNGCC(3,180+442,0+931,20,20):显示(w-20,0+y)
        __res:getPNGCC(3,180+442,20+931,20,162):拉伸(20,h-40):显示(w-20,20+y)
        __res:getPNGCC(3,180+442,182+931,20,20):显示(w-20,h-20+y)
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

function 取灰色背景(x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    if nsf:渲染开始() then
        __res:getPNGCC(3,5,0+923,20,20):显示(0,0+y)
        __res:getPNGCC(3,5,20+923,20,161):拉伸(20,h-40):显示(0,20+y)
        __res:getPNGCC(3,5,180+923,20,20):显示(0,h-20+y)

        __res:getPNGCC(3,20+5,0+923,160,20):拉伸(w-40,20):显示(20,0+y)
        __res:getPNGCC(3,20+5,20+923,160,161):拉伸(w-40,h-40):显示(20,20+y)
        __res:getPNGCC(3,30+5,180+923,160,20):拉伸(w-40,20):显示(20,h-20+y)

        __res:getPNGCC(3,180+5,0+923,20,20):显示(w-20,0+y)
        __res:getPNGCC(3,180+5,20+923,20,161):拉伸(20,h-40):显示(w-20,20+y)
        __res:getPNGCC(3,180+5,180+923,20,20):显示(w-20,h-20+y)
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

function 取黑透明背景(x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    if nsf:渲染开始() then
        __res:getPNGCC(3,213,0+927,20,20):显示(0,0+y)
        __res:getPNGCC(3,213,20+927,20,161):拉伸(20,h-40):显示(0,20+y)
        __res:getPNGCC(3,213,181+927,20,20):显示(0,h-20+y)

        __res:getPNGCC(3,20+213,0+927,160,20):拉伸(w-40,20):显示(20,0+y)
        __res:getPNGCC(3,20+213,20+927,160,161):拉伸(w-40,h-40):显示(20,20+y)
        __res:getPNGCC(3,30+213,181+927,160,20):拉伸(w-40,20):显示(20,h-20+y)

        __res:getPNGCC(3,180+227,0+927,20,20):显示(w-20,0+y)
        __res:getPNGCC(3,180+227,20+927,20,161):拉伸(20,h-40):显示(w-20,20+y)
        __res:getPNGCC(3,180+227,181+927,20,20):显示(w-20,h-20+y)
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

function 取蓝黑色背景(x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    if nsf:渲染开始() then
        __res:getPNGCC(2,258,0+572,20,20):显示(0,0+y)
        __res:getPNGCC(2,258,20+572,20,281):拉伸(20,h-40):显示(0,20+y)
        __res:getPNGCC(2,258,301+572,20,20):显示(0,h-20+y)

        __res:getPNGCC(2,20+258,0+572,189,20):拉伸(w-40,20):显示(20,0+y)
        __res:getPNGCC(2,20+258,20+572,189,281):拉伸(w-40,h-40):显示(20,20+y)
        __res:getPNGCC(2,30+258,301+572,189,20):拉伸(w-40,20):显示(20,h-20+y)

        __res:getPNGCC(2,209+258,0+572,20,20):显示(w-20,0+y)
        __res:getPNGCC(2,209+258,20+572,20,281):拉伸(20,h-40):显示(w-20,20+y)
        __res:getPNGCC(2,209+258,301+572,20,20):显示(w-20,h-20+y)
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

function 取黑色背景(x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    if nsf:渲染开始() then
        __res:getPNGCC(2,487,0+571,20,20):显示(0,0+y)
        __res:getPNGCC(2,487,20+571,20,153):拉伸(20,h-40):显示(0,20+y)
        __res:getPNGCC(2,487,173+571,20,20):显示(0,h-20+y)

        __res:getPNGCC(2,20+487,0+571,108,20):拉伸(w-40,20):显示(20,0+y)
        __res:getPNGCC(2,20+487,20+571,108,153):拉伸(w-40,h-40):显示(20,20+y)
        __res:getPNGCC(2,30+487,173+571,108,20):拉伸(w-40,20):显示(20,h-20+y)

        __res:getPNGCC(2,128+487,0+571,20,20):显示(w-20,0+y)
        __res:getPNGCC(2,128+487,20+571,20,153):拉伸(20,h-40):显示(w-20,20+y)
        __res:getPNGCC(2,128+487,173+571,20,20):显示(w-20,h-20+y)
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end