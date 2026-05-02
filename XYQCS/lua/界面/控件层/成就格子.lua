--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2024-01-28 17:12:18
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2024-03-20 11:36:58
FilePath: \XYQCS\lua\界面\控件层\成就格子.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
local 成就格子 = class("成就格子")
function 成就格子:初始化()
end
function 成就格子:置数据(数据,状态)
  self.图像=nil
  if 数据 then
    -- table.print(数据)
    local nsf = require("SDL.图像")(378, 73)
    if nsf["渲染开始"](nsf) then
      __res:getPNGCC(4, 208, 623, 378, 73):显示(0,0)
      __res:取图像(__res:取地址(数据.图标[1], 数据.图标[2])):显示(10,12)
      字体18:置颜色(__取颜色("白色"))
      字体18:取图像(数据["名称"]):显示(79+60,6)
      字体16:置颜色(__取颜色("浅黑"))
      
     
      if 状态~="七日签到" then
        字体16:取图像("剩余名额："):显示(78+203,50)
        字体16:取图像("储备："):显示(78+84,50)
      else
        字体16:取图像("储备："):显示(78,53)
        
        if 数据.银子~=0 then
          字体16:取图像("银子："):显示(78,53-20)
        end
      end
      字体16:置颜色(255,1,255)
      
      
      if 状态~="七日签到" then
        字体16:取图像("仙玉："):显示(78,50)
        字体16:取图像(数据.仙玉):显示(80+38,50)
        字体16:取图像(数据.总名额):显示(80+203+68,50)
        字体16:取图像(数据.储备金):显示(80+84+38,50)
      else
        if 数据.银子~=0 then
          字体16:取图像(数据.银子):显示(80+38,53-20)
        end
        字体16:取图像(数据.储备金):显示(80+38,53)
        
      end
      字体16:置颜色(__取颜色("黄色"))
      local 宽度 = 字体16:取宽度(数据.完成情况.进度)
      字体16:取图像(数据.完成情况.进度):显示(294+54-38 - 宽度 / 2, 5)
      if 数据.完成情况.是否完成 then
        __res["取图像"](__res, "shape/C3544D90.was"):显示(211,-3) 
      end
      nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
  end
 
end
function 成就格子:显示(x, y)
  if self.图像  then
    self.图像["显示"](self.图像, x, y)
  end
end
return 成就格子
