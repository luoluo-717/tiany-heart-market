--[[
    @Author       : GGELUA
    @Date         : 2022-03-05 19:48:37
    @Last Modified by: GGELUA
    @Last Modified time: 2022-04-23 17:31:47
--]]
function 取输入背景(x,y,w,h)
    local nsf = require('SDL.图像')(w,h)
    if nsf:渲染开始() then
        __res:getPNGCC(1,552,0,10,23):显示(0,0)
        __res:getPNGCC(1,562,0,81,23):平铺(w-20,23):显示(10,0)
        __res:getPNGCC(1,643,0,10,23):显示(w-10,0)
        nsf:渲染结束()
    end
    return nsf
end
huang取输入背景 = function(x, y, w, h)
  local nsf = require("SDL.图像")(w, h)
  if nsf["渲染开始"](nsf) then
    __res:getPNGCC(7, 241, 0, 10, 23):显示(0, 0)
    __res:getPNGCC(7, 283, 0, 81, 23):平铺(w - 20, 23):显示(10, 0)
    __res:getPNGCC(7, 370-10, 0, 10, 23):显示(w - 10, 0)
    nsf["渲染结束"](nsf)
  end
  return nsf
end
function 取灰黑背景(x,y,w,h,lx)
    local nsf = require('SDL.图像')(w,h)
    if nsf:渲染开始() then
        __res:getPNGCC(1,905,385,10,72):显示(0,0)
        __res:getPNGCC(1,915,385,210,72):平铺(w-20,72):显示(10,0)
        __res:getPNGCC(1,905+220,385,10,72):显示(w-10,0)
        nsf:渲染结束()
    end
    return nsf
end