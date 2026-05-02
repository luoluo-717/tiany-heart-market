-- @Author: baidwwy
-- @Date:   2025-06-06 13:11:28
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2026-04-19 23:20:43
local s窗宽,s窗高 =820,581
local 千变万化 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("千变万化", 50+20  + abbr.py.x, 0 + abbr.py.y,820,581)
local 当前 = 多开数据.当前

local format = string.format
local 介绍文本 = 千变万化:创建文本("介绍文本", 170, 89, 230, 253)
function 介绍文本:初始化()
end

function 千变万化:初始化()

 
end
function 千变万化:重置()
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
   
    字体16:置颜色(39, 53, 81)
 
    if self.界面=="狐祖" then
      __res:取图片("shape/pic/qbwh/A01.png"):显示(0, 0)
      if self.数据.狐祖==0 then
         字体16:取图像("当前等级: 未开启"):显示(482,213)
      elseif self.数据.狐祖==1 then
         字体16:取图像("当前等级: ★"):显示(482,213)
      elseif self.数据.狐祖==2 then
         字体16:取图像("当前等级: ★★"):显示(482,213)
      elseif self.数据.狐祖==3 then
         字体16:取图像("当前等级: ★★★"):显示(482,213)
      elseif self.数据.狐祖==4 then
         字体16:取图像("当前等级: ★★★★"):显示(482,213)
      elseif self.数据.狐祖==5 then
         字体16:取图像("当前等级: ★★★★★"):显示(482,213)
      end
elseif self.界面=="魔王" then
      __res:取图片("shape/pic/qbwh/A02.png"):显示(0, 0)
      if self.数据.魔王==0 then
         字体16:取图像("当前等级: 未开启"):显示(482,213)
      elseif self.数据.魔王==1 then
         字体16:取图像("当前等级: ★"):显示(482,213)
      elseif self.数据.魔王==2 then
         字体16:取图像("当前等级: ★★"):显示(482,213)
      elseif self.数据.魔王==3 then
         字体16:取图像("当前等级: ★★★"):显示(482,213)
      elseif self.数据.魔王==4 then
         字体16:取图像("当前等级: ★★★★"):显示(482,213)
      elseif self.数据.魔王==5 then
         字体16:取图像("当前等级: ★★★★★"):显示(482,213)
      end
elseif self.界面=="哪吒" then
      __res:取图片("shape/pic/qbwh/A03.png"):显示(0, 0)
      if self.数据.哪吒==0 then
         字体16:取图像("当前等级: 未开启"):显示(482,213)
      elseif self.数据.哪吒==1 then
         字体16:取图像("当前等级: ★"):显示(482,213)
      elseif self.数据.哪吒==2 then
         字体16:取图像("当前等级: ★★"):显示(482,213)
      elseif self.数据.哪吒==3 then
         字体16:取图像("当前等级: ★★★"):显示(482,213)
      elseif self.数据.哪吒==4 then
         字体16:取图像("当前等级: ★★★★"):显示(482,213)
      elseif self.数据.哪吒==5 then
         字体16:取图像("当前等级: ★★★★★"):显示(482,213)
      end
elseif self.界面=="飞廉" then
      __res:取图片("shape/pic/qbwh/A04.png"):显示(0, 0)
      if self.数据.飞廉==0 then
         字体16:取图像("当前等级: 未开启"):显示(482,213)
      elseif self.数据.飞廉==1 then
         字体16:取图像("当前等级: ★"):显示(482,213)
      elseif self.数据.飞廉==2 then
         字体16:取图像("当前等级: ★★"):显示(482,213)
      elseif self.数据.飞廉==3 then
         字体16:取图像("当前等级: ★★★"):显示(482,213)
      elseif self.数据.飞廉==4 then
         字体16:取图像("当前等级: ★★★★"):显示(482,213)
      elseif self.数据.飞廉==5 then
         字体16:取图像("当前等级: ★★★★★"):显示(482,213)
      end
elseif self.界面=="后羿" then
      __res:取图片("shape/pic/qbwh/A05.png"):显示(0, 0)
      if self.数据.后羿==0 then
         字体16:取图像("当前等级: 未开启"):显示(482,213)
      elseif self.数据.后羿==1 then
         字体16:取图像("当前等级: ★"):显示(482,213)
      elseif self.数据.后羿==2 then
         字体16:取图像("当前等级: ★★"):显示(482,213)
      elseif self.数据.后羿==3 then
         字体16:取图像("当前等级: ★★★"):显示(482,213)
      elseif self.数据.后羿==4 then
         字体16:取图像("当前等级: ★★★★"):显示(482,213)
      elseif self.数据.后羿==5 then
         字体16:取图像("当前等级: ★★★★★"):显示(482,213)
      end
end
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
  end
for i, v in ipairs {
  { name = '变形升级', x = 260+215+30,y =320-65 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(85, 33), font = "变形升级" },
  { name = '变形开始', x = 475+30,y =320+150 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(85, 33), font = "变形开始" },
--  { name = '赛前备战', x = 660, y =490 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "赛前备战" },
 
} do
  local 临时函数 = 千变万化:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
  function 临时函数:左键弹起(x, y)
      if v.name == '变形升级' then
        发送数据(当前,  265.1,{选项=千变万化.界面})
        elseif v.name == '变形开始' then
          发送数据(当前,  265.2,{选项=千变万化.界面})
      end
    end
  end
function 千变万化:打开(数据 )
  self:置可见(true)
  self.选中=0
  self.计次 = 0
  self.界面=数据.界面
  self.数据=数据.千变万化数据
 
    self:重置()
  end
 function 千变万化:刷新(内容)
  self.界面=数据.界面
  self.数据=数据.千变万化数据
        self:重置()
  
  end
local 关闭 = 千变万化:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", s窗宽-37-50, 30)
function 关闭:左键弹起(x, y, msg)
  千变万化:置可见(false)
end

