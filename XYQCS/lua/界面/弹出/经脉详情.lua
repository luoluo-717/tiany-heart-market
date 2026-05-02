--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-10-16 20:46:48
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-10-16 20:48:19
FilePath: \XYQCS\lua\界面\弹出\经脉详情.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
多开数据[多开数据.当前].__UI弹出["经脉详情"] = 多开数据[多开数据.当前].__UI界面["创建弹出窗口"](多开数据[多开数据.当前].__UI界面, "经脉详情", 0, 0, 240, 300)
local 经脉详情 = 多开数据[多开数据.当前].__UI弹出["经脉详情"]
local 当前 = 多开数据.当前

function 经脉详情:初始化()
end
function 经脉详情:左键弹起()
  self:置可见(false)
end
function 经脉详情:打开(数据, x, y, w, h, mx,可选,menpai,助战编号)
  self.数据 = 数据
  self:置坐标(x, y)
  self:置宽高(w, h)
  self.助战编号=助战编号
  if self.数据 then
    local nsf = require("SDL.图像")(w, h)
    if nsf["渲染开始"](nsf) then
      __res:getPNGCC(3, 213, 927, 30, 30)["显示"](__res:getPNGCC(3, 213, 927, 30, 30), 0, 0)
      __res:getPNGCC(3, 213, 957, 30, 141)["平铺"](__res:getPNGCC(3, 213, 957, 30, 141), 30, h - 60)["显示"](__res:getPNGCC(3, 213, 957, 30, 141)["平铺"](__res:getPNGCC(3, 213, 957, 30, 141), 30, h - 60), 0, 30)
      __res:getPNGCC(3, 213, 1098, 30, 31)["显示"](__res:getPNGCC(3, 213, 1098, 30, 31), 0, h - 30)
      __res:getPNGCC(3, 243, 927, 140, 30)["平铺"](__res:getPNGCC(3, 243, 927, 140, 30), w - 60, 30)["显示"](__res:getPNGCC(3, 243, 927, 140, 30)["平铺"](__res:getPNGCC(3, 243, 927, 140, 30), w - 60, 30), 30, 0)
      __res:getPNGCC(3, 243, 957, 155, 141)["平铺"](__res:getPNGCC(3, 243, 957, 155, 141), w - 60, h - 60)["显示"](__res:getPNGCC(3, 243, 957, 155, 141)["平铺"](__res:getPNGCC(3, 243, 957, 155, 141), w - 60, h - 60), 30, 30)
      __res:getPNGCC(3, 243, 1098, 155, 31)["平铺"](__res:getPNGCC(3, 243, 1098, 155, 31), w - 60, 30)["显示"](__res:getPNGCC(3, 243, 1098, 155, 31)["平铺"](__res:getPNGCC(3, 243, 1098, 155, 31), w - 60, 30), 30, h - 30)
      __res:getPNGCC(3, 398, 927, 30, 30)["显示"](__res:getPNGCC(3, 398, 927, 30, 30), w - 30, 0)
      __res:getPNGCC(3, 398, 957, 30, 141)["平铺"](__res:getPNGCC(3, 398, 957, 30, 141), 30, h - 60)["显示"](__res:getPNGCC(3, 398, 957, 30, 141)["平铺"](__res:getPNGCC(3, 398, 957, 30, 141), 30, h - 60), w - 30, 30)
      __res:getPNGCC(3, 398, 1098, 30, 31)["显示"](__res:getPNGCC(3, 398, 1098, 30, 31), w - 30, h - 30)
      if mx then
        mx["显示"](mx, 20, 15)
      end
      -- table.print(数据)
      if 数据["名称"] then
        字体18["置颜色"](字体18, 252, 252, 8)
        字体18["取图像"](字体18, 数据["名称"])["显示"](字体18["取图像"](字体18, 数据["名称"]), 80, 20)
      end
      -- __res:取图像(__res:取地址("shape/jn/", 取技能(数据["名称"])[7])):拉伸(45, 45):显示(20,20)
      if 数据.流派 then
        local sucai=取经脉(数据.流派,数据["名称"])
        if sucai and sucai[10] then
          local tux = require("SDL.图像")
          local mp=menpai or 多开数据[当前].角色信息.门派
          tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[mp].."/"..__jingmaimiaoshu[数据["名称"]]..".jpg"):拉伸(45, 45):显示(20,20)
        else
          __res:取图像(__res:取地址("shape/jn/", sucai[7])):拉伸(45, 45):显示(20,20)
        end
      else
        __res:取图像(__res:取地址("shape/jn/", 取技能信息(数据["名称"])[7])):拉伸(45, 45):显示(50,20)
      end
      取经脉(流派,技能)
      nsf["渲染结束"](nsf)
    end
    self:置精灵(nsf["到精灵"](nsf))
    -- table.print(self.数据)
    if self.数据[1] then
      经脉详情["技能文本"]["置文本"](经脉详情["技能文本"], self.数据[1])
    end
    if 可选 then
      经脉详情.确定:置可见(true)
    else
      经脉详情.确定:置可见(false)
    end


  else
    local nsf = require("SDL.图像")(w, h)
    if nsf["渲染开始"](nsf) then
      __res:getPNGCC(3, 213, 927, 30, 30)["显示"](__res:getPNGCC(3, 213, 927, 30, 30), 0, 0)
      __res:getPNGCC(3, 213, 957, 30, 141)["平铺"](__res:getPNGCC(3, 213, 957, 30, 141), 30, h - 60)["显示"](__res:getPNGCC(3, 213, 957, 30, 141)["平铺"](__res:getPNGCC(3, 213, 957, 30, 141), 30, h - 60), 0, 30)
      __res:getPNGCC(3, 213, 1098, 30, 31)["显示"](__res:getPNGCC(3, 213, 1098, 30, 31), 0, h - 30)
      __res:getPNGCC(3, 243, 927, 140, 30)["平铺"](__res:getPNGCC(3, 243, 927, 140, 30), w - 60, 30)["显示"](__res:getPNGCC(3, 243, 927, 140, 30)["平铺"](__res:getPNGCC(3, 243, 927, 140, 30), w - 60, 30), 30, 0)
      __res:getPNGCC(3, 243, 957, 155, 141)["平铺"](__res:getPNGCC(3, 243, 957, 155, 141), w - 60, h - 60)["显示"](__res:getPNGCC(3, 243, 957, 155, 141)["平铺"](__res:getPNGCC(3, 243, 957, 155, 141), w - 60, h - 60), 30, 30)
      __res:getPNGCC(3, 243, 1098, 155, 31)["平铺"](__res:getPNGCC(3, 243, 1098, 155, 31), w - 60, 30)["显示"](__res:getPNGCC(3, 243, 1098, 155, 31)["平铺"](__res:getPNGCC(3, 243, 1098, 155, 31), w - 60, 30), 30, h - 30)
      __res:getPNGCC(3, 398, 927, 30, 30)["显示"](__res:getPNGCC(3, 398, 927, 30, 30), w - 30, 0)
      __res:getPNGCC(3, 398, 957, 30, 141)["平铺"](__res:getPNGCC(3, 398, 957, 30, 141), 30, h - 60)["显示"](__res:getPNGCC(3, 398, 957, 30, 141)["平铺"](__res:getPNGCC(3, 398, 957, 30, 141), 30, h - 60), w - 30, 30)
      __res:getPNGCC(3, 398, 1098, 30, 31)["显示"](__res:getPNGCC(3, 398, 1098, 30, 31), w - 30, h - 30)
      nsf["渲染结束"](nsf)
    end
    self:置精灵(nsf["到精灵"](nsf))
  end
end
local 确定 = 经脉详情:创建我的按钮(__res:getPNGCC(3, 126, 563, 111, 36, true), "确定", 85, 246, "确定"):置可见(false)
function 确定:左键弹起(x, y, msg)
  if 经脉详情.助战编号 then
    if 多开数据[当前].__UI界面["窗口层"]["助战经脉"]["是否可见"] then
      多开数据[当前].__UI界面["窗口层"]["助战经脉"]:学习经脉1()
    end
  else
    if 多开数据[当前].__UI界面["窗口层"]["经脉流派"]["是否可见"] then
      多开数据[当前].__UI界面["窗口层"]["经脉流派"]:学习经脉1()
    end
  end
  经脉详情["置可见"](经脉详情, false)
end


local 技能文本 = 经脉详情["创建文本"](经脉详情, "技能文本", 20, 80, 230, 200)
function 技能文本:初始化()
end
