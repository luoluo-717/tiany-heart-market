local 补差坐标y=72
local 助战道具栏 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("助战道具栏",引擎.宽度/2-300,0,769,486-95+补差坐标y)
local 当前 =  多开数据.当前
function 助战道具栏:初始化(当前)
  self:置精灵(置窗口背景("助战道具栏", 0, 12, 718, 474-95+补差坐标y):置透明(240))
  self.格子背景 = __res:getPNGCC(3, 694, 4, 338, 273)["到精灵"]((__res:getPNGCC(3, 694, 4, 338, 273)))
  self.上横=取黑色背景(0, 0, 661, 72):置透明(60)
end

function 助战道具栏:显示(x, y)
  self.格子背景["显示"](self.格子背景, x + 350, y + 108-47+补差坐标y)
  self.上横:显示(x + 31, y + 50)
end
local 抓取物品20格子计算=0
function 助战道具栏:打开(助战信息,装备,灵饰,锦衣)
  self:置可见(true)
  self.主角=助战信息
  self.助战编号=助战信息.助战编号
  self.道具分页控件:置可见(true)
  self.道具分页控件.分页1:置选中(true)
  self.分页状态=1
  抓取物品20格子计算=0
  self.包裹类型 = "道具"
  self.抓取类型 = nil
  self.抓取物品ID = nil
  self.选中召唤兽 = nil
  self.选中坐骑 = nil
  self.选中子女 = nil
  self.移动 = false
  self:刷新道具(ss,装备,灵饰,锦衣)
  self:重置("人物", self.人物界面)
  self.人物界面:重载模型()
end

function 助战道具栏:刷新道具(ss,装备,灵饰,锦衣)
  助战道具栏:重置道具() 
	if 装备 then
	    self:刷新装备(装备)
	end
	if 灵饰 then
	    self:刷新灵饰(灵饰)
	end
	if 锦衣 then
	    self:刷新锦衣(锦衣)
	end
end
function 助战道具栏:刷新装备(装备)
	--self.人物装备={}
	self.zbxx=装备
  self.人物界面["装备网格"]["置物品"](self.人物界面["装备网格"], self.zbxx)
  self.人物界面:重载模型()
  if 多开数据[多开数据.当前].__UI界面["窗口层"].助战详情.是否可见 and 多开数据[多开数据.当前].__UI界面["窗口层"].助战详情.助战编号==self.助战编号 then
		多开数据[多开数据.当前].__UI界面["窗口层"].助战详情:刷新装备(装备)
	end
end
function 助战道具栏:刷新灵饰(灵饰)
	self.lsxx=灵饰
	self.人物界面["灵饰网格"]["置物品"](self.人物界面["灵饰网格"], self.lsxx)
  if 多开数据[多开数据.当前].__UI界面["窗口层"].助战详情.是否可见 and 多开数据[多开数据.当前].__UI界面["窗口层"].助战详情.助战编号==self.助战编号 then
		多开数据[多开数据.当前].__UI界面["窗口层"].助战详情:刷新灵饰(灵饰)
	end
end
function 助战道具栏:刷新锦衣(锦衣)
	self.jyxx=锦衣
	self.人物界面["锦衣网格"]["置物品"](self.人物界面["锦衣网格"], self.jyxx)
  self.人物界面:重载模型()
end

function 助战道具栏:cz抓取()
  if self.抓取物品ID  and 助战道具栏["道具网格"]["子控件"][抓取物品20格子计算] and 助战道具栏["道具网格"]["子控件"][抓取物品20格子计算]._spr then
    助战道具栏["道具网格"]["子控件"][抓取物品20格子计算]._spr["确定"] = nil
  end
  if 多开数据[多开数据.当前].__UI弹出["道具详情"]["是否可见"] then
    多开数据[多开数据.当前].__UI弹出["道具详情"]["置可见"](多开数据[多开数据.当前].__UI弹出["道具详情"], false)
  end
  self.抓取物品 = nil
  self.抓取物品ID = nil
  抓取物品20格子计算=0
  self.移动 = false
end
function 助战道具栏:重置(类型, 控件)
  if 控件 then
    self.人物界面["置可见"](self.人物界面, 控件 == self.人物界面, not self.人物界面["是否实例"])
    -- self.召唤兽界面["置可见"](self.召唤兽界面, 控件 == self.召唤兽界面, not self.召唤兽界面["是否实例"])
    -- self.坐骑界面["置可见"](self.坐骑界面, 控件 == self.坐骑界面, not self.坐骑界面["是否实例"])
    -- self.子女界面["置可见"](self.子女界面, 控件 == self.子女界面, not self.子女界面["是否实例"])
  end
  if "人物" == 类型 then
    self.清空(self)
    self.人物界面["重置"](self.人物界面)
    self.人物界面["灵饰网格"]["置物品"](self.人物界面["灵饰网格"], self.lsxx)
    self.人物界面["装备网格"]["置物品"](self.人物界面["装备网格"], self.zbxx)
    self.人物界面["锦衣网格"]["置物品"](self.人物界面["锦衣网格"], self.jyxx)
  end
  self.cz抓取(self)
end
function 助战道具栏:清空()
end
function 助战道具栏:重置道具() 
  local fdfere={}
  for n=(self.分页状态-1)*20+1,(self.分页状态-1)*20+20 do
    if __助战道具[n] then
      fdfere[n-(self.分页状态-1)*20]=__助战道具[n]
    end
  end
  助战道具栏["道具网格"]["置物品"](助战道具栏["道具网格"], fdfere)
end

-- local 锦衣 = 助战道具栏:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true), "锦衣", 160, 50, "锦 衣")
-- function 锦衣:左键弹起(x, y, msg)
--   发送数据(当前, 3732.1)
-- end
local 关闭 = 助战道具栏["创建我的按钮"](助战道具栏, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 678, 0)
function 关闭:左键弹起(x, y, msg)
  助战道具栏["cz抓取"](助战道具栏)
  助战道具栏["清空"](助战道具栏)
  多开数据[多开数据.当前].__UI界面["窗口层"]["助战道具栏"]["置可见"](多开数据[多开数据.当前].__UI界面["窗口层"]["助战道具栏"], false)
end

local 道具网格 = 助战道具栏["创建网格"](助战道具栏, "道具网格", 350, 110-47+补差坐标y, 339, 272)
function 道具网格:初始化()
  self:创建格子(67, 67, 0, 0, 4, 5)
end
function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    if not 助战道具栏["移动"] then
      助战道具栏["cz抓取"](助战道具栏)
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 239, 86, w, h, "道具", a)
      助战道具栏["抓取类型"] = 助战道具栏["包裹类型"]
      助战道具栏["抓取物品ID"] = a+(助战道具栏.分页状态-1)*20
      抓取物品20格子计算=a
      self.子控件[a]._spr["确定"] = true
    end
  else
    助战道具栏["cz抓取"](助战道具栏)
  end
end

function 道具网格:置物品(数据)
  for i = 1, #道具网格["子控件"] do
    if 数据[i] then
      local lssj = __物品助战格子["创建"](当前)
      lssj["置物品"](lssj, 数据[i], nil, "助战道具栏")
      lssj["置偏移"](lssj, 10, 10)
      道具网格["子控件"][i]["置精灵"](道具网格["子控件"][i], lssj)
    else
      道具网格["子控件"][i]["置精灵"](道具网格["子控件"][i])
    end
  end
end

if sadad then
  local 道具分页控件 = 助战道具栏["创建我的控件"](助战道具栏, "道具分页控件", 347, 386-47+补差坐标y, 363, 40) 
  for i = 1, 4 do
    local 临时函数 = 道具分页控件["创建我的单选按钮"](道具分页控件, __res:getPNGCC(3, 1069, 1156, 60, 37, true):拉伸(85,37), __res:getPNGCC(3, 1069, 1116, 60, 37, true):拉伸(85,37), "分页"..i, (i-1)*87, 0, ""..i)
    function  临时函数:左键弹起(x, y)
      助战道具栏.分页状态=i
      local fdfere={}
      for n=(i-1)*20+1,(i-1)*20+20 do
        if __助战道具[n] then
          fdfere[n-(i-1)*20]=__助战道具[n]
        end
      end
      助战道具栏["道具网格"]:置物品(fdfere)
    end
  end
else
  local 道具分页控件 = 助战道具栏["创建我的控件"](助战道具栏, "道具分页控件", 347, 386-47+补差坐标y, 363, 40)
  for i = 1, 4 do
    local 临时函数 = 道具分页控件["创建我的单选按钮"](道具分页控件, __res:getPNGCC(5, 0, 408, 87, 39, true):拉伸(85,37), __res:getPNGCC(5, 0, 370, 87, 38, true):拉伸(85,37), "分页"..i, (i-1)*87, 0, ""..i)
    function  临时函数:左键弹起(x, y)
      助战道具栏.分页状态=i
      local fdfere={}
      for n=(i-1)*20+1,(i-1)*20+20 do
        if __助战道具[n] then
          fdfere[n-(i-1)*20]=__助战道具[n]
        end
      end
      助战道具栏["道具网格"]:置物品(fdfere)
    end
  end
end

local 人物界面 = 助战道具栏["创建我的控件"](助战道具栏, "人物界面", 0, -16+补差坐标y, 333+356, 486)
function 人物界面:初始化()
  local nsf = require("SDL.图像")(33+3563, 486)
  local jyz=__res:getPNGCC(3, 132, 506, 55, 55)
  if nsf["渲染开始"](nsf) then
    __res:getPNGCC(3, 383, 64, 294, 275)["显示"](__res:getPNGCC(3, 383, 64, 294, 275), 29, 63+16)
    __res:getPNGCC(3,757,291,57,57):显示(38, 2) --touxbj
    __res:getPNGCC(3, 523, 393, 144, 161)["显示"](__res:getPNGCC(3, 523, 393, 144, 161), 103, 131+19)
    for i=1,4 do
      jyz:显示(29+266+i*80, 2)
    end
    字体18["置颜色"](字体18, __取颜色("白色"))
    字体18:取图像("I  D"):置混合(0):显示(44+70, 8)
    字体18:取图像("门派"):置混合(0):显示(44+70, 40)
    字体18["置颜色"](字体18, __取颜色("绿色"))
    字体18:取图像("锦衣："):置混合(0):显示(44+70+207, 8+11)
    local lssj = 取输入背景(0, 0, 138, 23)
    lssj:显示(162, 8-3)
    lssj:显示(162, 40-3)
    nsf["渲染结束"](nsf)
  end
  self.模型格子 = __UI模型格子["创建"](当前)
  self:置精灵(nsf["到精灵"](nsf))
  self.动画 = {}
end
function 人物界面:重载模型()
  local mxsj={
    模型=助战道具栏.主角.模型,
    装备=助战道具栏.zbxx or {},
    锦衣=助战道具栏.jyxx or {},
  }
  -- table.print(mxsj)
  self.模型格子:置数据(mxsj, "角色", 175-20+23, 250+119-85,nil,5)
end
function 人物界面:重置()
  local nsf = require("SDL.图像")(662, 121)
  if nsf["渲染开始"](nsf) then
    字体18["置颜色"](字体18, __取颜色("浅黑"))
    字体18:取图像(助战道具栏.主角.id):置混合(0):显示(162+20, 8)
    字体18:取图像(助战道具栏.主角.门派):置混合(0):显示(162+20, 40)
    local lssj = 取头像(助战道具栏.主角.模型)
    __res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2])):显示(38+7, 2+7)
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf["到精灵"](nsf)
end

local 灵饰网格 = 人物界面["创建网格"](人物界面, "灵饰网格", 30, 63+16, 297, 57)
function 灵饰网格:初始化()
  self:创建格子(57, 57, 0, 22, 1, 4)
end
function 灵饰网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 580, 86, w, h, "灵饰", a)
  end
end

function 灵饰网格:置物品(数据)
  for i = 1, #灵饰网格["子控件"] do
    if 数据[i] then
      local lssj = __物品助战格子["创建"](当前)
      lssj["置物品"](lssj, 数据[i], nil, "装备")
      灵饰网格["子控件"][i]["置精灵"](灵饰网格["子控件"][i], lssj)
    else
      灵饰网格["子控件"][i]["置精灵"](灵饰网格["子控件"][i])
    end
  end
end
local 装备网格 = 人物界面["创建网格"](人物界面, "装备网格", 30, 135+16, 296, 203)
function 装备网格:初始化()
  self:创建格子(57, 57, 16, 181, 3, 2)
end
function 装备网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 580, 86, w, h, "装备", a)
  end
end
function 装备网格:置物品(数据)
  for i = 1, #装备网格["子控件"] do
    if 数据[i] then
      local lssj = __物品助战格子["创建"](当前)
      lssj["置物品"](lssj, 数据[i], nil, "装备")
      装备网格["子控件"][i]["置精灵"](装备网格["子控件"][i], lssj)
    else
      装备网格["子控件"][i]["置精灵"](装备网格["子控件"][i])
    end
  end
end

local 锦衣网格 = 人物界面["创建网格"](人物界面, "锦衣网格", 29+266+1*80, 2, 297, 57)
function 锦衣网格:初始化()
  self:创建格子(57, 57, 0, 23, 1, 4)
end
function 锦衣网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 520, 86, w, h, "锦衣", a)
  end
end

function 锦衣网格:置物品(数据)
  for i = 1, #锦衣网格["子控件"] do
    if 数据[i] then
      local lssj = __物品助战格子["创建"](当前)
      lssj["置物品"](lssj, 数据[i], nil, "装备")
      锦衣网格["子控件"][i]["置精灵"](锦衣网格["子控件"][i], lssj)
    else
      锦衣网格["子控件"][i]["置精灵"](锦衣网格["子控件"][i])
    end
  end
end

