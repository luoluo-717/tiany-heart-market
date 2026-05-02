-- @Author: baidwwy
-- @Date:   2025-06-06 13:11:28
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-06-06 17:11:11
local s窗宽,s窗高 =820,581
local 巅峰赛赛前备战界面 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("巅峰赛赛前备战界面", 50 + abbr.py.x, 0 + abbr.py.y,820,581)
local 当前 = 多开数据.当前

local format = string.format
local 介绍文本 = 巅峰赛赛前备战界面:创建文本("介绍文本", 170, 89, 230, 253)
function 介绍文本:初始化()
end

function 巅峰赛赛前备战界面:初始化()
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
    
    __res:取图片("shape/pic/fss2.png"):显示(0, 0)
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
  self.赛前技能={}
  self.判断主宠=1
  self.设置人物技能数据={}
  self.设置技能id=nil
end

function 巅峰赛赛前备战界面:打开(数据)
  self:置可见(true)
  self.界面=1
 

   self:加载人物显示数据(数据)
   self:加载宠物显示数据(数据)

   self:重置()
 
end
function 巅峰赛赛前备战界面:重置()
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
    if self.界面==1 then
      self.队员网格:置可见(true)
      self.宠物网格:置可见(true)
      self.备战控件:置可见(true)
      self.技能控件:置可见(false)
      self. 宠物控件:置可见(false)
     
    __res:取图片("shape/pic/fss2.png"):显示(0, 0)
    elseif self.界面==2 then
      self.队员网格:置可见(false)
      self.宠物网格:置可见(false)
      self.备战控件:置可见(false)
      self.技能控件:置可见(false)
      self. 宠物控件:置可见(true)
    __res:取图片("shape/pic/fss3.png"):显示(0, 0)
     elseif self.界面==3 then
      self.队员网格:置可见(false)
      self.宠物网格:置可见(false)
      self.备战控件:置可见(false)
      self.技能控件:置可见(true)
      self. 宠物控件:置可见(false)
      self.人物技能横顺序=0
      self.人物技能纵顺序=0
    
    __res:取图片("shape/pic/fss4.png"):显示(0, 0)
    for n=1,5 do
 
      字体16:置颜色(39, 53, 81)
 
      if self.赛前技能[n][1] ~=1  then
        字体16:取图像(self.赛前技能[n][1]):显示(242-3, 100+65*(n-1)+55)
      
      else
        字体16:取图像("未设置技能"):显示(242-3, 100+65*(n-1)+55)
   
      end
       
      if self.赛前技能[n][2]~=1  then
        字体16:取图像(self.赛前技能[n][2]):显示(510-3, 100+65*(n-1)+55)
     
      else
        字体16:取图像("未设置技能"):显示(510-3, 100+65*(n-1)+55)
      end
 
       
      end
    end
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
 
end
function 巅峰赛赛前备战界面:人物技能设置(数据)
  self.界面=3
  self.判断主宠=1
  for n=1,5 do
  self.赛前技能[n]={[1]=1,[2]=1}
  end
  if 数据.赛前技能~=nil then
  self.赛前技能=数据.赛前技能
  end
  self.设置人物技能数据=数据.巅峰赛主动技能
  self:重置()
end
function 巅峰赛赛前备战界面:宠物技能设置(数据)
  self.界面=3
  self.判断主宠=2
  for n=1,5 do
  self.赛前技能[n]={[1]=1,[2]=1}
  end
  if 数据.参战宝宝.赛前技能~=nil then
  self.赛前技能=数据.参战宝宝.赛前技能
  end
  self.设置人物技能数据=数据.参战宝宝.巅峰赛主动技能
  self:重置()
end
 
  function 巅峰赛赛前备战界面:加载人物显示数据(数据)
    self.人物数据={}
 
    for n=1,#数据 do
 
    self.人物数据[n]=数据[n]
    end
 
 
  self.队员网格:置数据( self.人物数据)
end
function 巅峰赛赛前备战界面:更换宠物(数据)
  self.界面=2
  self.宠物数据={}
  self.宠物显示 = {}
   for n=1,#数据 do
 
   self.宠物数据[n]=数据[n]
   end
   self.宠物控件.宠物网格:置数据(self.宠物数据)
   self:重置()
   for i=1,10 do
    if #self.宠物数据>=i then
    self.宠物控件["上阵"..i]:置可见(true)
    else
      self.宠物控件["上阵"..i]:置可见(false)
      end
   end
  end
function 巅峰赛赛前备战界面:更换宠物刷新(数据)
  self.界面=1
    self:加载人物显示数据(数据)
    self:加载宠物显示数据(数据)

    self:重置()

end
function 巅峰赛赛前备战界面:加载宠物显示数据(数据)
  self.宠物数据={}
  self.宠物显示 = {}
  for n=1,#数据 do
  if not 判断是否为空表(数据[n].参战宝宝) then
 
  self.宠物数据[n]=数据[n].参战宝宝
  end
  end
  self.宠物网格:置数据(self.宠物数据)
end
local 队员网格 = 巅峰赛赛前备战界面:创建网格("队员网格",17+48+25,25,740,490)

function 队员网格:初始化()
    self:创建格子(125,220,0,10,1,5)
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
local 宠物网格 = 巅峰赛赛前备战界面:创建网格("宠物网格",17+48+25,25+220,740,490)

function 宠物网格:初始化()
    self:创建格子(125,220,0,10,1,5)
end

 

function 宠物网格:置数据(数据)
    for i = 1,#宠物网格.子控件 do
        local lssj = __队伍格子.创建(当前)
        lssj:置数据(数据[i],i,'巅峰赛宠物')
        宠物网格.子控件[i]:置精灵(lssj)
    end
end
local 宠物控件 = 巅峰赛赛前备战界面:创建控件("宠物控件",0,0,810,510)
local 宠物网格 = 宠物控件:创建网格("宠物网格",17+48+25,25,740,490)

function 宠物网格:初始化()
    self:创建格子(125,220,0,10,2,5)
end

 

function 宠物网格:置数据(数据)
    for i = 1,#宠物网格.子控件 do
        local lssj = __队伍格子.创建(当前)
        lssj:置数据(数据[i],i,'巅峰赛宠物')
        宠物网格.子控件[i]:置精灵(lssj)
    end
end
local xx=0
local yy=0
for i=1,10 do
  

  local 临时函数 = 宠物控件:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(75, 33), "上阵"..i, 50+135*xx+50+25, 200+200*yy+55, "上阵")
  xx=xx+1
  if xx==5 then
    xx=0
    yy=1
  end
  function 临时函数:左键弹起(x, y)
    发送数据(当前,258,{人物id=巅峰赛赛前备战界面.宠物更换人物id,宠物id=i,队长id=巅峰赛赛前备战界面.人物数据[1].id})
     

  end
     
end

local 备战控件 = 巅峰赛赛前备战界面:创建控件("备战控件",0,0,810,510)
  local xx=0
 local yy=0
for i=1,5 do
  

  local 临时函数 =备战控件:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(75, 33), "备战"..i, 50+135*xx+50+25, 200+200*yy+55, "备战")
  xx=xx+1
   
  function 临时函数:左键弹起(x, y)
    巅峰赛赛前备战界面.人物技能设置id=巅峰赛赛前备战界面.人物数据[i].id
    发送数据(当前,259,{人物id=巅峰赛赛前备战界面.人物数据[i].id})
  end
     
end


for i, v in ipairs {
 
  { name = '换宠1', x = 60+43,y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "换宠" },
  { name = '宠物备战1', x = 165, y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "备战" },
  { name = '换宠2', x = 60+43+135,y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "换宠" },
  { name = '宠物备战2', x = 165+135, y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "备战" },
  { name = '换宠3', x = 60+43+135*2,y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "换宠" },
  { name = '宠物备战3', x = 165+135*2, y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "备战" },
 
  { name = '换宠4', x = 60+43+135*3,y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "换宠" },
  { name = '宠物备战4', x = 165+135*3, y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "备战" },
 
  { name = '换宠5', x = 60+43+135*4,y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "换宠" },
  { name = '宠物备战5', x = 165+135*4, y =440 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(55, 33), font = "备战" },
 

} do
  local 临时函数 = 备战控件:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
  function 临时函数:左键弹起(x, y)
      if v.name == '换宠1' then
        巅峰赛赛前备战界面.宠物更换人物id=巅峰赛赛前备战界面.人物数据[1].id
        发送数据(当前,257,{人物id=巅峰赛赛前备战界面.人物数据[1].id})

      elseif v.name == '换宠2' then
          巅峰赛赛前备战界面.宠物更换人物id=巅峰赛赛前备战界面.人物数据[2].id
          发送数据(当前,257,{人物id=巅峰赛赛前备战界面.人物数据[2].id})
  
        elseif v.name == '换宠3' then
          巅峰赛赛前备战界面.宠物更换人物id=巅峰赛赛前备战界面.人物数据[3].id
          发送数据(当前,257,{人物id=巅峰赛赛前备战界面.人物数据[3].id})
  
        elseif v.name == '换宠4' then
          巅峰赛赛前备战界面.宠物更换人物id=巅峰赛赛前备战界面.人物数据[4].id
          发送数据(当前,257,{人物id=巅峰赛赛前备战界面.人物数据[4].id})
  
        elseif v.name == '换宠5' then
          巅峰赛赛前备战界面.宠物更换人物id=巅峰赛赛前备战界面.人物数据[5].id
          发送数据(当前,257,{人物id=巅峰赛赛前备战界面.人物数据[5].id})
  

      elseif v.name == '宠物备战1' then    
        巅峰赛赛前备战界面.人物技能设置id= 巅峰赛赛前备战界面.人物数据[1].id
        发送数据(当前,261,{人物id= 巅峰赛赛前备战界面.人物数据[1].id})
 elseif v.name == '宠物备战2' then    
        巅峰赛赛前备战界面.人物技能设置id= 巅峰赛赛前备战界面.人物数据[2].id
        发送数据(当前,261,{人物id= 巅峰赛赛前备战界面.人物数据[2].id})

      elseif v.name == '宠物备战3' then    
        巅峰赛赛前备战界面.人物技能设置id= 巅峰赛赛前备战界面.人物数据[3].id
        发送数据(当前,261,{人物id= 巅峰赛赛前备战界面.人物数据[3].id})
      elseif v.name == '宠物备战4' then    
        巅峰赛赛前备战界面.人物技能设置id= 巅峰赛赛前备战界面.人物数据[4].id
        发送数据(当前,261,{人物id= 巅峰赛赛前备战界面.人物数据[4].id})
      elseif v.name == '宠物备战5' then    
        巅峰赛赛前备战界面.人物技能设置id= 巅峰赛赛前备战界面.人物数据[5].id
        发送数据(当前,261,{人物id= 巅峰赛赛前备战界面.人物数据[5].id})

      end
    end
  end

  local 技能控件 = 巅峰赛赛前备战界面:创建控件("技能控件",0,0,810,510)

  local xx=0
  local yy=0
for i=1,10 do
  

  local 临时函数 =技能控件:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(75, 33), "设置"..i, 50+280*xx+50+2+240, 100+65*yy+50, "设置")
  xx=xx+1
   if xx==2 then
 xx=0
 yy=yy+1
   end
  function 临时函数:左键弹起(x, y)
 
    多开数据[当前].__UI界面.窗口层.巅峰赛技能栏:打开(巅峰赛赛前备战界面.设置人物技能数据,i)
  end
     
end

for i, v in ipairs {
 
  { name = '保存设置', x = 633,y =470 , tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(85, 33), font = "保存设置" },
  

} do
  local 临时函数 = 技能控件:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
  function 临时函数:左键弹起(x, y)
      if v.name == '保存设置' then

        if 巅峰赛赛前备战界面.判断主宠==1 then


          发送数据(当前,260,{人物id=巅峰赛赛前备战界面.人物技能设置id,技能数据=巅峰赛赛前备战界面.赛前技能,队长id=巅峰赛赛前备战界面.人物数据[1].id})
          elseif  巅峰赛赛前备战界面.判断主宠==2 then
     
          发送数据(当前,262,{人物id=巅峰赛赛前备战界面.人物技能设置id,技能数据=巅峰赛赛前备战界面.赛前技能,队长id=巅峰赛赛前备战界面.人物数据[1].id})
          end

      end

    end

  end

  
local 关闭 = 巅峰赛赛前备战界面:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", s窗宽-37, 0)
function 关闭:左键弹起(x, y, msg)
  巅峰赛赛前备战界面:置可见(false)
end
  
