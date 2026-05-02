local 宝宝进阶 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("宝宝进阶", 80 + abbr.py.x, 20+42 + abbr.py.y, 720, 430)
local 当前 = 多开数据.当前
function 宝宝进阶:初始化()
  local nsf = require("SDL.图像")(720, 430)
  if nsf:渲染开始() then
    -- __res:getPNGCC(5, 0, 0, 683, 450):显示(0,5)
    -- 字体20:置颜色(__取颜色("浅黑"))
    -- 字体20:取图像("伙 伴"):显示(683/2-20,9)
    置窗口背景("召唤兽进阶", 0, 12, 639+73,415, true):显示(0, 0)
    __res:getPNGCC(3, 694, 4, 336, 273):显示(13, 44+3)
    字体18:置颜色(__取颜色("白色"))
    字体18:取图像("只要在对应五行之位放入清灵仙露，至于"):显示(17,238+98)
    字体18:取图像("能获多大提升冥冥之中自有定数。"):显示(17,238+1*20+98)
    字体18:取图像("（如果不满意新的成长结果，可以选择保"):显示(17,238+2*20+98)
    字体18:取图像("留旧的属性）"):显示(17,238+3*20+98)
    字体18:取图像("木"):显示(372+12,121)
    字体18:取图像("火"):显示(372+1*68+12,121)
    字体18:取图像("金"):显示(372+12+2*68,121)
    字体18:取图像("土"):显示(372+12+3*68,121)
    字体18:取图像("水"):显示(372+12+4*68,121)
    取灰色背景(0, 0, 330, 204, true):显示(370, 155+47)
    取白色背景(0, 0, 110, 137, true):显示(368+11, 213)
    字体18:取图像("体质"):显示(368+133,215)
    字体18:取图像("法力"):显示(368+133,215+1*30)
    字体18:取图像("力量"):显示(368+133,215+2*30)
    字体18:取图像("耐力"):显示(368+133,215+3*30)
    字体18:取图像("敏捷"):显示(368+133,215+4*30)
    local asdw=__res:getPNGCC(3, 132, 506, 55, 55)
    local lssj = 取输入背景(0, 0, 71, 23)
    for i=1,5 do
      asdw:显示(365+(i-1)*68,44+5)
      lssj:显示(365+136+42,215-2+(i-1)*30)
      lssj:显示(365+136+42+79,215-2+(i-1)*30)
    end
  end
  self:置精灵(nsf:到精灵())
  self.模型格子 = __UI模型格子.创建(当前)
end

function 宝宝进阶:更新(dt)
  self.模型格子:更新(dt)
end
function 宝宝进阶:显示(x, y)
  self.模型格子:显示(x, y)
  if self.图像2 then
    self.图像2:显示(x, y)
  end
end
function 宝宝进阶:打开(内容)
  self.bb = 内容.宝宝
  -- table.print(self.bb)
  self.镶嵌满 = false
  self.已使用 = false
  self.选中物品 = 0
  self.发送={}
  self.道具=多开数据[当前].__主控.道具列表
  self.道具网格:指导局(self.道具)
  self.右侧物品 = {}
  self.youcedaoju:置道具()
  self:置可见(true)
  self.模型格子:置数据(self.bb, "召唤兽", 150+282, 225+102)
  self.已使用=false
  if self.bb then
    self:宝宝属性显示()
  end
end


function 宝宝进阶:刷新进阶(数据)
	self.bb = 数据
	self.已使用 = false
  self:宝宝属性显示()
end

function 宝宝进阶:刷新(数据)
	self.bb = 数据.宝宝
  self.道具=多开数据[当前].__主控.道具列表
  self.道具网格:指导局(self.道具)
  self.右侧物品 = {}
  self.youcedaoju:置道具()
	self.已使用 = true
  self:宝宝属性显示()
end

function 宝宝进阶:宝宝属性显示()
  self.图像2=nil
  local nsf = require("SDL.图像")(204, 155)
  if nsf:渲染开始() then
    字体18:置颜色(__取颜色("黑色"))
    字体18:取图像(self.bb.体质):置混合(0):显示(0,0)
    字体18:取图像(self.bb.魔力):置混合(0):显示(0,30*1)
    字体18:取图像(self.bb.力量):置混合(0):显示(0,30*2)
    字体18:取图像(self.bb.耐力):置混合(0):显示(0,30*3)
    字体18:取图像(self.bb.敏捷):置混合(0):显示(0,30*4)
    if self.bb.进阶属性 and self.bb.进阶属性.力量>0 then
      字体18:置颜色(__取颜色("紫色"))
      字体18:取图像("+"..self.bb.进阶属性.体质):置混合(0):显示(0+(#tostring(self.bb.体质)*9)+5,0)
      字体18:取图像("+"..self.bb.进阶属性.魔力):置混合(0):显示(0+(#tostring(self.bb.魔力)*9)+5,30*1)
      字体18:取图像("+"..self.bb.进阶属性.力量):置混合(0):显示(0+(#tostring(self.bb.力量)*9)+5,30*2)
      字体18:取图像("+"..self.bb.进阶属性.耐力):置混合(0):显示(0+(#tostring(self.bb.耐力)*9)+5,30*3)
      字体18:取图像("+"..self.bb.进阶属性.敏捷):置混合(0):显示(0+(#tostring(self.bb.敏捷)*9)+5,30*4)
    end
    if self.已使用 then
      字体18:置颜色(__取颜色("黑色"))
      字体18:取图像(self.bb.体质):置混合(0):显示(77,0)
      字体18:取图像(self.bb.魔力):置混合(0):显示(77,30*1)
      字体18:取图像(self.bb.力量):置混合(0):显示(77,30*2)
      字体18:取图像(self.bb.耐力):置混合(0):显示(77,30*3)
      字体18:取图像(self.bb.敏捷):置混合(0):显示(77,30*4)
      if self.bb.临时进阶 and self.bb.临时进阶.力量>0 then
        字体18:置颜色(__取颜色("紫色"))
        字体18:取图像("+"..self.bb.临时进阶.体质):置混合(0):显示(77+(#tostring(self.bb.体质)*9)+5,0)
        字体18:取图像("+"..self.bb.临时进阶.魔力):置混合(0):显示(77+(#tostring(self.bb.魔力)*9)+5,30*1)
        字体18:取图像("+"..self.bb.临时进阶.力量):置混合(0):显示(77+(#tostring(self.bb.力量)*9)+5,30*2)
        字体18:取图像("+"..self.bb.临时进阶.耐力):置混合(0):显示(77+(#tostring(self.bb.耐力)*9)+5,30*3)
        字体18:取图像("+"..self.bb.临时进阶.敏捷):置混合(0):显示(77+(#tostring(self.bb.敏捷)*9)+5,30*4)
      end
    end
    nsf:渲染结束()
  end
  self.图像2 = nsf:到精灵()
  self.图像2:置中心(-542-6,-200-16)
  self.保留旧的:置禁止(self.已使用==false)
  self.保留新的:置禁止(self.已使用==false)
  local fasong={}
  for i = 1, 5 do
    if 宝宝进阶.右侧物品[i] and 宝宝进阶.右侧物品[i][2] then
      fasong[i]=宝宝进阶.右侧物品[i][2]
    end
  end
  self.使用按钮:置禁止(#fasong<5)
end



local 道具网格 = 宝宝进阶:创建网格("道具网格", 18-5, 47+4, 339, 272)
function 道具网格:左键弹起(x, y, a, b, msg)
  if 宝宝进阶.材料位置 and self.子控件[宝宝进阶.材料位置] then
    self.子控件[宝宝进阶.材料位置]._spr.确定 = nil
  end
  if self.子控件[a]._spr and self.子控件[a]._spr.物品 then
    local w, h = self.子控件[a]:取宽高()
    宝宝进阶.材料位置 = a
    -- 宝宝进阶.zhuangb:zhuzhuangb(self.子控件[a]._spr["物品"])
    self.子控件[a]._spr.确定 = true
    self.子控件[a]._spr:详情打开(170+255-129, 86, w, h, "宝宝进阶1", a)
  end
end

function 道具网格:指导局()
  宝宝进阶.材料位置 = nil
  self:创建格子(67, 67, 0, 0, 4, 5)
  for i = 1, #self.子控件 do
    if 宝宝进阶.道具[i] then
      local lssj = __物品格子.创建(当前)
      lssj:置物品( 宝宝进阶.道具[i], nil, "宝宝进阶")
      lssj:置偏移( 10, 10)
      -- lssj["总类禁止111"](lssj, 2)
      self.子控件[i]:置精灵(lssj)
    else
      self.子控件[i]:置精灵()
    end
  end
end

function 宝宝进阶:取下右侧道具(dj)
  if 宝宝进阶.右侧物品[dj] and 宝宝进阶.右侧物品[dj][2] then 
    local yuanweizhi=宝宝进阶.右侧物品[dj][2]
    宝宝进阶:左侧道具逻辑(yuanweizhi,"加")
    宝宝进阶.右侧物品[dj]=nil
    宝宝进阶.youcedaoju:置道具()
  end
end



function 宝宝进阶:左侧道具逻辑(djweiz,lx)
  if 宝宝进阶.道具[djweiz] and 宝宝进阶.道具[djweiz].数量 then 
    if lx=="加" then
      宝宝进阶.道具[djweiz].数量=宝宝进阶.道具[djweiz].数量+1
    elseif lx=="减" then
      宝宝进阶.道具[djweiz].数量=宝宝进阶.道具[djweiz].数量-1
    end
    宝宝进阶.道具网格:指导局()
  end
  
end

local youcedaoju = 宝宝进阶:创建网格("youcedaoju", 360, 43, 343, 62)
function youcedaoju:初始化()
  self:创建格子(67, 67, 0, 0, 1, 5)
end
function youcedaoju:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr.物品 then
    local w, h = self.子控件[a]:取宽高()
    -- 宝宝进阶["材料位置"] = a
    -- 宝宝进阶.zhuangb:zhuzhuangb(self.子控件[a]._spr["物品"])
    -- self.子控件[a]._spr["确定"] = true
    self.子控件[a]._spr:详情打开(170+255-129-297, 86, w, h, "宝宝进阶2", a)
  end
end
function youcedaoju:置道具(djid,youceid)
  if djid and youceid then
    if 宝宝进阶.道具[djid] and 宝宝进阶.道具[djid].数量 and 宝宝进阶.道具[djid].数量>0 then 
      宝宝进阶.右侧物品[youceid]={宝宝进阶.道具[djid],djid}
      宝宝进阶:左侧道具逻辑(djid,"减")
    else
      return
    end
  end
  local go=true
  for i = 1, #self.子控件 do
    if 宝宝进阶.右侧物品[i] and 宝宝进阶.右侧物品[i][1] then
      local lssj = __物品格子.创建(当前)
      lssj:置物品(宝宝进阶.右侧物品[i][1], nil, "无需显示数量")
      lssj:置偏移(10, 10)
      -- lssj["总类禁止111"](lssj, 2)
      self.子控件[i]:置精灵(lssj)
    else
      go=false
      self.子控件[i]:置精灵()
    end
  end
  if go then
    宝宝进阶.使用按钮:置禁止(false)
  end
end
local 保留旧的 = 宝宝进阶:创建我的按钮( __res:getPNGCC(3, 2, 507, 124, 41, true)["拉伸"](__res:getPNGCC(3, 2, 507, 124, 41, true), 106, 35), "保留旧的", 467, 155+210, "保留旧的")
function 保留旧的:左键弹起(x, y, msg)
  发送数据(当前,5016,{保留="旧",认证码=宝宝进阶.bb.认证码})
end
local 保留新的 = 宝宝进阶:创建我的按钮( __res:getPNGCC(3, 2, 507, 124, 41, true)["拉伸"](__res:getPNGCC(3, 2, 507, 124, 41, true), 106, 35), "保留新的", 467+120, 155+210, "保留新的")
function 保留新的:左键弹起(x, y, msg)
  发送数据(当前,5016,{保留="新",认证码=宝宝进阶.bb.认证码})
end

local 使用按钮 = 宝宝进阶:创建我的按钮( __res:getPNGCC(3, 2, 507, 124, 41, true)["拉伸"](__res:getPNGCC(3, 2, 507, 124, 41, true), 129, 35), "使用按钮", 464, 155, "使 用")
function 使用按钮:左键弹起(x, y, msg)
  local fasong={}
  for i = 1, 5 do
    if 宝宝进阶.右侧物品[i] and 宝宝进阶.右侧物品[i][2] then
      fasong[i]=宝宝进阶.右侧物品[i][2]
    end
  end
  if #fasong>=5 then
    发送数据(当前,3762,{位置=fasong})
  end
end

local 关闭 = 宝宝进阶:创建我的按钮( __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 500+29+141, 0)
function 关闭:左键弹起(x, y, msg)
  宝宝进阶:置可见(false)
end