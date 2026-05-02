-- @Author: baidwwy
-- @Date:   2025-06-06 13:11:28
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-06-06 17:11:11
local s窗宽,s窗高 =820,581
local 巅峰赛界面 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("巅峰赛界面", 50 + abbr.py.x, 0 + abbr.py.y,820,581)
local 当前 = 多开数据.当前

local format = string.format
local 介绍文本 = 巅峰赛界面:创建文本("介绍文本", 170, 89, 230, 253)
function 介绍文本:初始化()
end

function 巅峰赛界面:初始化()
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
    
    __res:取图片("shape/pic/fss1.png"):显示(0, 0)
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
 
end
function 巅峰赛界面:挑战成功刷新(数据)
  self:置可见(false)
  end

function 巅峰赛界面:刷新次数(数据)
 if 数据 then
    self.可挑战次数=数据.次数
 end
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
    
    __res:取图片("shape/pic/fss1.png"):显示(0, 0)
    字体16:置颜色(39, 53, 81)
    字体16:取图像(self.我的排名):显示(100+75, 490+3)
    字体16:取图像(self.可挑战次数):显示(150+85+90, 490+3)
     

    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
 
end
function 巅峰赛界面:打开(数据)
  self:置可见(true)
  self.我的排名="无"
    if 数据.次数排名.排名~=0 then
    self.我的排名=数据.次数排名.排名
    end
    self.可挑战次数=数据.次数排名.次数
    self:加载人物显示数据(数据.排名数据)
    self.队员网格:置可见(true)
    self:刷新次数()
end
function 巅峰赛界面:加载人物显示数据(数据)
  self.人物数据={}

  for n=1,10 do
    if 数据[n]~=nil then
    self.人物数据[#self.人物数据+1]=数据[n]
  
    else
 

      self.人物数据[#self.人物数据+1]=数据.临时数据

    end
  end
 
  self.队员网格:置数据(self.人物数据)
end
local 队员网格 = 巅峰赛界面:创建网格("队员网格",17+48+25,25,740,490)

function 队员网格:初始化()
    self:创建格子(125,210,0,10,2,5)
end

function 队员网格:左键弹起(x, y, a, b, msg)
 
end

function 队员网格:置数据(数据)
    for i = 1,#队员网格.子控件 do
        local lssj = __队伍格子.创建(当前)
        lssj:置数据(数据[i],i,'巅峰赛界面')
        队员网格.子控件[i]:置精灵(lssj)
    end
end
  local xx=0
 local yy=0
for i=1,10 do
  

  local 临时函数 = 巅峰赛界面:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 30), "挑战"..i, 50+135*xx+50+30, 200+210*yy+45, "挑战")
  xx=xx+1
  if xx==5 then
    xx=0
    yy=1
  end
  function 临时函数:左键弹起(x, y)
    local pm=tonumber(i)
    if 巅峰赛界面.我的排名~="无"   then
       if 巅峰赛界面.我的排名<=pm then
      多开数据[当前].__UI弹出.提示框:打开("#Y/无法挑战自己或者比自己排位低的玩家")
       return
       end
    end

    发送数据(当前,255,{挑战排名=pm,被挑战人物数据=巅峰赛界面.人物数据[pm]})

end
     
end


for i, v in ipairs {
 
  { name = '领取奖励', x = 560,y =490 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(85, 33), font = "领取奖励" },
  { name = '赛前备战', x = 660, y =490 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(85, 33), font = "赛前备战" },
 
} do
  local 临时函数 = 巅峰赛界面:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
  function 临时函数:左键弹起(x, y)
      if v.name == '领取奖励' then
        
          if 巅峰赛界面.我的排名=="无"   then
            多开数据[当前].__UI弹出.提示框:打开("#Y/请先上榜才能领取")
            return
            else
              发送数据(当前 or self and 当前,264,{我的排名=巅峰赛界面.我的排名})
 
            end
      elseif v.name == '赛前备战' then    
        if 巅峰赛界面.我的排名=="无"   then
          多开数据[当前].__UI弹出.提示框:打开("#Y/请先上榜才能领取")
            return
          else
            发送数据(当前 or self and 当前,256,{我的排名=巅峰赛界面.我的排名})
          end
      end
    end
  end
local 关闭 = 巅峰赛界面:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", s窗宽-37, 0)
function 关闭:左键弹起(x, y, msg)
  巅峰赛界面:置可见(false)
end
  
