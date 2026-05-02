-- @Author: baidwwy
-- @Date:   2025-06-06 13:11:28
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2026-04-19 23:20:43
local s窗宽,s窗高 =820,581
local 千变万化主界面 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("千变万化主界面", 50+20  + abbr.py.x, 110 + abbr.py.y,820,581)
local 当前 = 多开数据.当前

local format = string.format
local 介绍文本 = 千变万化主界面:创建文本("介绍文本", 170, 89, 230, 253)
function 介绍文本:初始化()
end

function 千变万化主界面:初始化()
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then

    __res:取图片("shape/pic/qbwh/bj.png"):显示(0, 0)
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
  self.赛前技能={}
end
 

for i, v in ipairs {
  { name = '狐祖', x = 160,y =60 , tcp = __res:取图片("shape/pic/qbwh/01.png"), font = " " }, 
  { name = '魔王', x = 160+120,y =60 , tcp =__res:取图片("shape/pic/qbwh/02.png"), font = " " },
  { name = '哪吒', x = 160+120*2,y =60 , tcp = __res:取图片("shape/pic/qbwh/03.png"), font = " " }, 
  { name = '飞廉', x = 160+120*3,y =60, tcp = __res:取图片("shape/pic/qbwh/04.png"), font = " " },
  { name = '后羿', x =160+120*4,y =60 , tcp = __res:取图片("shape/pic/qbwh/05.png"), font = " " }, 
 
 
} do
  local 临时函数 = 千变万化主界面:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
  function 临时函数:左键弹起(x, y)
    发送数据(当前,265,{选项=v.name})
    end
  end
function 千变万化主界面:打开(数据 )
  self:置可见(true)
       
 
   
  end
 
local 关闭 = 千变万化主界面:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", s窗宽-37-50, 0)
function 关闭:左键弹起(x, y, msg)
  千变万化主界面:置可见(false)
end

