
-- local 经脉格子 = class("经脉格子")
-- function 经脉格子:初始化(当前)
--   self.当前=当前
-- end
-- function 经脉格子:置数据(数据, sj,mc)
--   local nsf = require("SDL.图像")(130, 45)
--   if 数据 then
--     if nsf:渲染开始() then
--       self.数据 = 取经脉(数据)
--       if self.数据[1] == nil then
--         self.数据 = 取技能信息(数据)
--       end
--       self.数据.名称 = 数据
--       if sj then
--         __res:取图像(__res:取地址("shape/jn/", self.数据[7])):显示(0, 0)
--       else
--         __res:取图像(__res:取地址("shape/jn/", self.数据[7])):到灰度():显示(0, 0)
--       end
--       if mc then
--         字体16:置颜色(0,0,0)
--         字体16:取图像(数据):显示(45, 12)
--       end
--       nsf:渲染结束()
--     end
--     self.精灵 = nsf:到精灵()
--   end
-- end
-- function 经脉格子:详情打开(x, y, w, h,txt)
--   多开数据[多开数据.当前].__UI弹出.技能详情:置可见( true, true)
--   多开数据[多开数据.当前].__UI弹出.技能详情.技能文本:清空(_)
--   if txt then self.数据[1] = txt end
--   多开数据[多开数据.当前].__UI弹出.技能详情:打开(self.数据, x - 240, y - 125, 240, 300, self.精灵)
-- end
-- function 经脉格子:更新(dt)
-- end
-- function 经脉格子:显示(x, y)
--   if self.精灵 then
--     self.精灵:显示(x, y)
--   end
-- end
-- return 经脉格子

--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-10-16 20:14:07
FilePath: \XYQCS\lua\界面\控件层\经脉格子.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
local 经脉格子 = class("经脉格子")
function 经脉格子:初始化(当前)
  self.当前=当前
end
-- function 经脉格子:置数据(数据, sj)
function 经脉格子:置数据(流派,技能,灰色,特色法术,助战门派,助战编号)
  local nsf = require("SDL.图像")(145, 57)
  local tux = require("SDL.图像")
  if 技能 then
    if nsf["渲染开始"](nsf) then
      local 门派=多开数据[多开数据.当前].角色信息.门派
      if 助战门派 then
          门派=助战门派
          self.助战编号=助战编号
      end
      self.门派=门派
      if 特色法术 then
        self.数据 = 取技能信息(技能)
        if self.数据 then
          self.数据.名称=技能
          if 灰色 then
            __res:取图像(__res:取地址("shape/jn/", self.数据[7])):到灰度():拉伸(45, 45):显示(3,3)
          else
            -- if self.数据[10] then
            --   tux("assets/shape/jingmai/jmk/"..__jingmaimiaoshu[多开数据[多开数据.当前].角色信息.门派].."/"..__jingmaimiaoshu[技能]..".jpg"):拉伸(45, 45):显示(0,0)
            -- else
            __res:取图像(__res:取地址("shape/jn/", self.数据[7])):拉伸(45, 45):显示(3,3)
            -- end
          end
          字体16:置颜色(__取颜色("浅黑"))
          字体16:取图像(技能):显示(60, 16)
        end
      else
        -- print(门派,技能,__jingmaimiaoshu[门派],__jingmaimiaoshu[技能])
        -- print(门派,"assets/wpal/20230/jingmai/jmk/"..__jingmaimiaoshu[门派].."/"..__jingmaimiaoshu[技能]..".jpg")
        self.数据 = 取经脉(流派,技能)
        if self.数据 then
          self.数据.流派=流派
          self.数据.名称=技能
          self.数据.经脉详情=true
          if 灰色 then
            if self.数据[10] then
              tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[门派].."/"..__jingmaimiaoshu[技能]..".jpg"):到灰度():拉伸(45, 45):显示(3,3)
            else
              __res:取图像(__res:取地址("shape/jn/", self.数据[7])):到灰度():拉伸(45, 45):显示(3,3)
            end
          else
            if self.数据[10] then
              -- print(技能)
              tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[门派].."/"..__jingmaimiaoshu[技能]..".jpg"):拉伸(45, 45):显示(3,3)
            else
              __res:取图像(__res:取地址("shape/jn/", self.数据[7])):拉伸(45, 45):显示(3,3)
            end
          end
        end
      end
      nsf["渲染结束"](nsf)
    end

    self.精灵 = nsf["到精灵"](nsf)
  end
end
function 经脉格子:详情打开(x, y,可选)
  多开数据[多开数据.当前].__UI弹出["经脉详情"]["置可见"](多开数据[多开数据.当前].__UI弹出["经脉详情"], true, true)
  多开数据[多开数据.当前].__UI弹出["经脉详情"]["技能文本"]["清空"](多开数据[多开数据.当前].__UI弹出["经脉详情"]["技能文本"])
  多开数据[多开数据.当前].__UI弹出["经脉详情"]["打开"](多开数据[多开数据.当前].__UI弹出["经脉详情"], self.数据, x - 240, y - 125, 280, 300, self.精灵,可选,self.门派,self.助战编号)
end

-- function 经脉格子:详情打开(x, y, w, h,txt)
--   多开数据[多开数据.当前].__UI弹出.技能详情:置可见( true, true)
--   多开数据[多开数据.当前].__UI弹出.技能详情.技能文本:清空(_)
--   if txt then self.数据[1] = txt end
--   多开数据[多开数据.当前].__UI弹出.技能详情:打开(self.数据, x - 240, y - 125, 240, 300, self.精灵)
-- end

function 经脉格子:更新(dt)
end
function 经脉格子:显示(x, y)
  if self.精灵 then
    self.精灵["显示"](self.精灵, x, y)
  end
  if self.可选 then
    多开数据[多开数据.当前].__主控["经脉可选"]["显示"](多开数据[多开数据.当前].__主控["经脉可选"], x-3, y-3)
  end
end
return 经脉格子
