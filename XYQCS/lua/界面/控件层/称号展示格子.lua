--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-06-27 06:51:06
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-19 11:25:18
FilePath: \XYQCS\lua\界面\控件层\称号展示格子.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
--[[
Author: GGELUA
Date: 2024-12-01 15:56:20
Last Modified by: GGELUA
Last Modified time: 2024-12-04 00:52:39
--]]
--[[
Author: GGELUA
Date: 2024-10-27 04:16:06
Last Modified by: GGELUA
Last Modified time: 2024-10-27 04:22:00
--]]

local 称号展示格子 = class("称号展示格子")
local 当前=多开数据.当前
function 称号展示格子:初始化()
  self.py = {x = 0, y = 0}
  self.文字 = false
end
function 称号展示格子:置头像(数据,位置)
  local nsf = require("SDL.图像")(198, 57)
  self.模型 = nil
  self.数据 = nil
  if 数据 then
    if nsf["渲染开始"](nsf) then
      __res:getPNGCC(3, 851, 539, 198, 57)["显示"](__res:getPNGCC(3, 851, 539, 198, 57), 0, 0)
    --  __res:getPNGCC(3, 1091, 374, 49, 49)["显示"](__res:getPNGCC(3, 1091, 374, 49, 49), 16, 4)
      local cwmx={
        [1]="10000043",[2]="10000044",[3]="10000045",[4]="10000046",[5]="10000047"
          ,[6]="10000048",[7]="10000049",[8]="10000050",[9]="10000051",[10]="10000052"
        -- [1]="0683C101",[2]="0683C102",[3]="0683C103",[4]="0683C104",[5]="0683C105"
        -- ,[6]="0683C106",[7]="0683C107",[8]="0683C108",[9]="0683C109",[10]="0683C110"
        -- [1]="ABBBAC01",[2]="ABBBAC02",[3]="ABBBAC03",[4]="ABBBAC04",[5]="ABBBAC05"
        -- ,[6]="ABBBAC06",[7]="ABBBAC07",[8]="ABBBAC08",[9]="ABBBAC09",[10]="ABBBAC10"
      }
      -- __res["取图像"](__res, __res["取地址"](__res, "shape/jn/", cwmx[位置]))["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/jn/", cwmx[位置])), 100, 30)["显示"](__res["取图像"](__res, __res["取地址"](__res, "shape/jn/", cwmx[位置]))["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/jn/", cwmx[位置])), 100, 30), 49, 12)
      __res["取图像"](__res, __res["取地址"](__res, "shape/ui/xz/", cwmx[位置]))
      ["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/ui/xz/", cwmx[位置])), 100, 80)
      ["显示"](__res["取图像"](__res, __res["取地址"](__res, "shape/ui/xz/", cwmx[位置]))
      ["拉伸"](__res["取图像"](__res, __res["取地址"](__res, "shape/ui/xz/", cwmx[位置])), 100, 80), 49, -10)
      
      字体18["置颜色"](字体18, 255, 255, 255)
      -- 字体18["取图像"](字体18, 数据)["显示"](字体18["取图像"](字体18, 数据), 75, 7)
      nsf["渲染结束"](nsf)
    end
    self.模型 = nsf["到精灵"](nsf)
    self.数据 = 数据
  end
end
-- function 称号展示格子:更新(dt)
--   if self.模型 then
--     self.模型["更新"](self.模型, dt)
--   end
-- end
function 称号展示格子:显示(x, y)
  if self.模型 then
    self.模型["显示"](self.模型, x + self.py.x, y + self.py.y)
  end
end
return 称号展示格子
