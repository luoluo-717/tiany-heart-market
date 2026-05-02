--[[
    @Author       : GGELUA
    @Date         : 2022-02-15 11:13:31
Last Modified by: GGELUA
Last Modified time: 2024-04-27 11:38:30
--]]
function xiao置窗口背景(name,x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    local num=588
    if nsf:渲染开始() then
            __res:getPNGCC(4,0,0+num,30,30):显示(0,0+y)
            __res:getPNGCC(4,0,30+num,30,140):平铺(30,h-60):显示(0,30+y)
            __res:getPNGCC(4,0,170+num,30,30):显示(0,h-30+y)

            __res:getPNGCC(4,30,0+num,140,30):平铺(w-60,30):显示(30,0+y)
            __res:getPNGCC(4,30,30+num,140,140):平铺(w-60,h-60):显示(30,30+y)
            __res:getPNGCC(4,30,170+num,140,30):平铺(w-60,30):显示(30,h-30+y)

            __res:getPNGCC(4,170,0+num,30,30):显示(w-30,0+y)
            __res:getPNGCC(4,170,30+num,30,140):平铺(30,h-60):显示(w-30,30+y)
            __res:getPNGCC(4,170,170+num,30,30):显示(w-30,h-30+y)

            __res:getPNGCC(4,205,num,229,31):显示(math.floor(w/2)-111,0+y) --横幅
            if name then
                if name ~= "无" then
                    local 宽度 = 字体20:取宽度(name)
                    字体20:置颜色(255,255,255)
                    字体20:取图像(name):显示(w/2-宽度/2,y+3)
                end
            end
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

function huang置窗口背景(name,x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    local num=0
    if nsf:渲染开始() then
            __res:getPNGCC(7,0,0+num,30,30):显示(0,0+y)
            __res:getPNGCC(7,0,30+num,30,140):平铺(30,h-60):显示(0,30+y)
            __res:getPNGCC(7,0,170+num,30,30):显示(0,h-30+y)

            __res:getPNGCC(7,30,0+num,140,30):平铺(w-60,30):显示(30,0+y)
            __res:getPNGCC(7,30,30+num,140,140):平铺(w-60,h-60):显示(30,30+y)
            __res:getPNGCC(7,30,170+num,140,30):平铺(w-60,30):显示(30,h-30+y)

            __res:getPNGCC(7,170,0+num,30,30):显示(w-30,0+y)
            __res:getPNGCC(7,170,30+num,30,140):平铺(30,h-60):显示(w-30,30+y)
            __res:getPNGCC(7,170,170+num,30,30):显示(w-30,h-30+y)

            --__res:getPNGCC(7,0,202,193,25):显示(math.floor(w/2)-111,0+y) --横幅
            if name then
                if name ~= "无" then
                    local 宽度 = 字体20:取宽度(name)
                    字体18:置颜色(__取颜色("黑色"))
                    字体18:取图像(name):显示(w/2-宽度/2,y+3)
                end
            end
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

function 置窗口背景(name,x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    if nsf:渲染开始() then
            __res:getPNGCC(1,0,0,30,30):显示(0,0+y)
            __res:getPNGCC(1,0,30,30,140):平铺(30,h-60):显示(0,30+y)
            __res:getPNGCC(1,0,170,30,30):显示(0,h-30+y)

            __res:getPNGCC(1,30,0,140,30):平铺(w-60,30):显示(30,0+y)
            __res:getPNGCC(1,30,30,140,140):平铺(w-60,h-60):显示(30,30+y)
            __res:getPNGCC(1,30,170,140,30):平铺(w-60,30):显示(30,h-30+y)

            __res:getPNGCC(1,170,0,30,30):显示(w-30,0+y)
            __res:getPNGCC(1,170,30,30,140):平铺(30,h-60):显示(w-30,30+y)
            __res:getPNGCC(1,170,170,30,30):显示(w-30,h-30+y)
            if name then
                __res:getPNGCC(1,448,0,20,28):显示(math.floor(w/3),0+y)
                __res:getPNGCC(1,20+448,0,45,28):平铺(math.floor(w/3)-40,28):显示(20+math.floor(w/3),0+y)
                __res:getPNGCC(1,81+448,0,20,28):显示(math.floor(w/3)-20+math.floor(w/3),0+y)
                if name ~= "无" then
                    local 宽度 = 字体20:取宽度(name)
                    字体20:置颜色(255,255,255)
                    字体20:取图像(name):显示(w/2-宽度/2,y+3)
                end
            end
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

function 置窗口背景2(name,x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h+y)
    local num=588
    if nsf:渲染开始() then
            __res:getPNGCC(4,0,0+num,30,30):显示(0,0+y)
            __res:getPNGCC(4,0,30+num,30,140):平铺(30,h-60):显示(0,30+y)
            __res:getPNGCC(4,0,170+num,30,30):显示(0,h-30+y)

            __res:getPNGCC(4,30,0+num,140,30):平铺(w-60,30):显示(30,0+y)
            __res:getPNGCC(4,30,30+num,140,140):平铺(w-60,h-60):显示(30,30+y)
            __res:getPNGCC(4,30,170+num,140,30):平铺(w-60,30):显示(30,h-30+y)

            __res:getPNGCC(4,170,0+num,30,30):显示(w-30,0+y)
            __res:getPNGCC(4,170,30+num,30,140):平铺(30,h-60):显示(w-30,30+y)
            __res:getPNGCC(4,170,170+num,30,30):显示(w-30,h-30+y)

            __res:getPNGCC(4,205,num,229,31):显示(math.floor(w/2)-111,0+y) --横幅
            if name then
                if name ~= "无" then
                    local 宽度 = 字体20:取宽度(name)
                    字体20:置颜色(255,255,255)
                    字体20:取图像(name):显示(w/2-宽度/2,y+3)
                end
            end
        nsf:渲染结束()
    end
    if lx then
        return nsf
    else
        return nsf:到精灵()
    end
end

