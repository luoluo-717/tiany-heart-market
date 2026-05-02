-- @Author              : GGELUA
-- @Last Modified by    : GGELUA2
-- @Date                : 2024-09-20 01:27:24
-- @Last Modified time  : 2024-10-30 18:11:56


local zhcangku = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("zhcangku", 100, 0, 777+180, 488+60)
local 当前 = 多开数据.当前
function zhcangku:初始化()
  self:置精灵(置窗口背景("共享仓库", 0, 1, 777+180, 488+60))
  self.数量框=__res:getPNGCC(2, 795, 885, 373, 115)["拉伸"](__res:getPNGCC(2, 795, 885, 373, 115), 80, 35)
  self.允许移动 = true
end
function zhcangku:打开(数据)
  self:置可见(true)
  self.道具仓库总数 = 数据.道具仓库总数
  self.召唤兽仓库总数 = 数据.召唤兽仓库总数
  self.ck数据=数据.道具.道具
  zhcangku["仓库页数"]=1
  zhcangku["道具页数"]=1
  zhcangku["bb仓库页数"]=1
  self.道具类型 = "道具"
  self.仓库类型 = "宝石"
  self.仓库分类类型 = "宝石"
  self.界面 = "道具"
  self.物品控件["重置"](self.物品控件, 1)
  self.物品控件["仓库网格"]["置物品"](self.物品控件["仓库网格"], 数据.道具.宝石, 1)
  self.物品控件["道具网格"]["置物品"](self.物品控件["道具网格"], 多开数据[当前].__主控["道具列表"])
  --self.物品["置选中"](self.物品, true)
  self.召唤兽控件["置可见"](self.召唤兽控件, false)
  -- self.宝石仓库:置选中(true)
end
function zhcangku:刷新道具仓库总数(道具,总数)
  self.道具仓库总数 = 总数
  zhcangku["物品控件"]["重置"](zhcangku["物品控件"], zhcangku["仓库页数"])
  zhcangku["物品控件"]["仓库网格"]["置物品"](zhcangku["物品控件"]["仓库网格"], 道具, zhcangku["仓库页数"])
  zhcangku["物品控件"]["道具网格"]["置物品"](zhcangku["物品控件"]["道具网格"], 多开数据[当前].__主控["道具列表"])
  zhcangku["召唤兽控件"]["置可见"](zhcangku["召唤兽控件"], false)
--  zhcangku["物品控件"].道具按钮:置选中(true)
end
function zhcangku:刷新仓库(道具,页数,仓库总数,刷新)
 
  if 仓库总数~=nil then
    self.道具仓库总数 = 仓库总数
 end
 if 刷新 then 
  self.仓库类型=刷新 self.仓库页数=页数 
  zhcangku.仓库分类类型=刷新
  zhcangku.仓库页数=页数
end
  zhcangku.ck道具=道具
  local fdfere={}
  local cksj={}
  for n=(self.道具页数-1)*56+1,(self.道具页数-1)*56+56 do
    if 多开数据[当前].__主控["道具列表"][n] then
      fdfere[n-(self.道具页数-1)*56]=多开数据[当前].__主控["道具列表"][n]
    end
  end
 
  for n=(self.仓库页数-1)*56+1,(self.仓库页数-1)*56+56 do
    if 道具[n] then
      cksj[n-(self.仓库页数-1)*56]=道具[n]
    end
  end
  self.物品控件["仓库网格"]["置物品"](self.物品控件["仓库网格"],  cksj, 页数)
  self.物品控件["道具网格"]["置物品"](self.物品控件["道具网格"], fdfere)
end
function zhcangku:刷新道具(类型,数据)
  self.道具类型 = 类型
  zhcangku["道具选中"] = nil
  zhcangku["仓库选中"] = nil

  local fdfere={}
  for n=(self.道具页数-1)*56+1,(self.道具页数-1)*56+56 do
    if 多开数据[当前].__主控["道具列表"][n] then
      fdfere[n-(self.道具页数-1)*56]=数据.道具[n]
    end
  end
  zhcangku["物品控件"]["道具网格"]["置物品"](zhcangku["物品控件"]["道具网格"], fdfere)
end
function zhcangku:刷新召唤兽仓库(数据,页数)
  self.召唤兽仓库数据=数据
   self.bb仓库页数=页数

   self.召唤兽控件.左侧bb列表:重置(数据)
   self.召唤兽控件.右侧bb列表:重置()
   self.召唤兽控件:重置(数据)
end

function zhcangku:刷新召唤兽仓库总数(总数,仓库数据)
  self.仓库类型="召唤兽"
  self.bb仓库页数=1
  zhcangku["道具选中"] = nil
  zhcangku["仓库选中"] = nil
  zhcangku["右侧bb选中"] = nil
  zhcangku["左侧bb选中"] = nil
 	self.召唤兽仓库总数 = 总数
  self.召唤兽仓库数据 = 仓库数据
  self.召唤兽控件:重置(仓库数据)
end
function zhcangku:刷新仓库bb(数据,页数)
  self.bb仓库页数=页数
  zhcangku["右侧bb选中"] = nil
  zhcangku["左侧bb选中"] = nil
  zhcangku.召唤兽控件:重置(数据)
end

local 物品控件 = zhcangku["创建控件"](zhcangku, "物品控件", 0, 0, 777+180, 488+60)

local 道具按钮 = zhcangku["创建我的单选按钮"](zhcangku, __res:getPNGCC(3, 511, 11, 117, 43, true), __res:getPNGCC(3, 390, 12, 118, 43, true), "道具按钮", 671+10, 430+70-7, "道具")
function 道具按钮:左键按下(消息, x, y)
  zhcangku["兽决仓库"]["置可见"](zhcangku["兽决仓库"], true)
  zhcangku["宝石仓库"]["置可见"](zhcangku["宝石仓库"], true)
  zhcangku["内丹仓库"]["置可见"](zhcangku["内丹仓库"], true)
  zhcangku["装备仓库"]["置可见"](zhcangku["装备仓库"], true)
  zhcangku["卡片仓库"]["置可见"](zhcangku["卡片仓库"], true)
  zhcangku["其他仓库"]["置可见"](zhcangku["其他仓库"], true)
  zhcangku["炼妖仓库"]["置可见"](zhcangku["炼妖仓库"], true)
  zhcangku["书铁仓库"]["置可见"](zhcangku["书铁仓库"], true)
  zhcangku["物品控件"]["置可见"](zhcangku["物品控件"], true)
  zhcangku["召唤兽控件"]["置可见"](zhcangku["召唤兽控件"], false)
  -- 发送数据(当前 or self and self.当前,8005,{序列=1,界面="宝石"})
    发送数据(当前 or self and self.当前,8000,{仓库类型="宝石"})

  zhcangku.物品控件:重置(zhcangku.仓库页数)
end
local 行囊按钮 = zhcangku["创建我的单选按钮"](zhcangku, __res:getPNGCC(3, 511, 11, 117, 43, true), __res:getPNGCC(3, 390, 12, 118, 43, true), "行囊按钮", 671+120+10, 430+70-7, "召唤兽")
function 行囊按钮:左键按下(消息, x, y)
  zhcangku["兽决仓库"]["置可见"](zhcangku["兽决仓库"], false)
  zhcangku["宝石仓库"]["置可见"](zhcangku["宝石仓库"], false)
  zhcangku["卡片仓库"]["置可见"](zhcangku["卡片仓库"], false)

  zhcangku["内丹仓库"]["置可见"](zhcangku["内丹仓库"], false)
  zhcangku["装备仓库"]["置可见"](zhcangku["装备仓库"], false)
  zhcangku["其他仓库"]["置可见"](zhcangku["其他仓库"], false)
  zhcangku["炼妖仓库"]["置可见"](zhcangku["炼妖仓库"], false)
  zhcangku["书铁仓库"]["置可见"](zhcangku["书铁仓库"], false)

  zhcangku.界面="召唤兽" 
  发送数据(当前 or self and self.当前,8011)
  zhcangku["物品控件"]["置可见"](zhcangku["物品控件"], false)
  zhcangku["召唤兽控件"]["置可见"](zhcangku["召唤兽控件"], true)
end

local 回收按钮 = 物品控件["创建我的按钮"](物品控件, __res:getPNGCC(3, 511, 11, 117, 43, true), "回收按钮", 225+192, 400, "自动回收")
function 回收按钮:左键按下(消息, x, y)
  发送数据(当前,109)
end
local 手动回收 = 物品控件["创建我的按钮"](物品控件, __res:getPNGCC(3, 511, 11, 117, 43, true), "手动回收", 225+192, 350, "手动回收")
function 手动回收:左键按下(消息, x, y)
    发送数据(当前,179.1,{数据序列=15})
end

local 整理按钮 = 物品控件["创建我的按钮"](物品控件, __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(80,43), "整理按钮", 220, 426+70, "整理")
function 整理按钮:左键按下(消息, x, y)
  发送数据(当前 or self and self.当前,8006,{道具类型="全部仓库",页数=zhcangku.仓库页数,类型=zhcangku.道具类型,界面=zhcangku.界面})
end

local 一键存放 = 物品控件["创建我的按钮"](物品控件, __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(110,43), "一键存放", 225+95, 426+70, "一键存放")
function 一键存放:左键按下(消息, x, y)
  发送数据(当前 or self and self.当前,8003.1)
end

local 存放设置 = 物品控件["创建我的按钮"](物品控件, __res:getPNGCC(3, 511, 11, 117, 43, true), "存放设置", 225+192, 300, "存放设置")
function 存放设置:左键按下(消息, x, y)
  发送数据(当前 or self and self.当前,8003.4)
end


function 物品控件:重置(total)
  zhcangku["仓库选中"] = nil
  self:置可见(true)
  local nsf = require("SDL.图像")(777+180, 488+60)
  if nsf["渲染开始"](nsf) then
		__res:取图像(__res:取地址("shape/ui/", 0xAAA12345)):拉伸(390,440):显示(17,40)
		__res:取图像(__res:取地址("shape/ui/", 0xAAA12345)):拉伸(390,440):显示(373+170,40)
    zhcangku.数量框:显示(69, 429+70)
    zhcangku.数量框:显示(69+470, 429+70)
    字体18["置颜色"](字体18, __取颜色("黑色"))
    字体18["取图像"](字体18, zhcangku["仓库页数"] .. "/" .. zhcangku["道具仓库总数"]):显示(93,433+4+70)
    字体18["取图像"](字体18, zhcangku["道具页数"] .. "/" .. "2"):显示(93+470,433+4+70)
    字体17["取图像"](字体17, "   双击存取"):显示(93+330,200+4+250)

    字体17["置颜色"](字体17, __取颜色("绿色"))

    字体18["置颜色"](字体18, __取颜色("白色"))
    字体18["取图像"](字体18, "仓库：" .. total)["置混合"](字体18["取图像"](字体18, "仓库：" .. total), 0)["显示"](字体18["取图像"](字体18, "仓库：" .. total)["置混合"](字体18["取图像"](字体18, "仓库：" .. total), 0), 10+360+75, 75)
    nsf["渲染结束"](nsf)
  end
  zhcangku["图像"] = nsf["到精灵"](nsf)
end

local 仓库网格 = 物品控件["创建网格"](物品控件, "仓库网格", 22-5, 132-67+20-40-5, 57*7, 57*8)
function 仓库网格:初始化()
  self:创建格子(55, 55, 0, 1, 8, 7)
end
function 仓库网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
    if zhcangku["仓库选中"] then
      if zhcangku["仓库选中"] == a then
      
        发送数据(当前 or self and self.当前,8003,{仓库类型=zhcangku.仓库分类类型,页数=zhcangku.仓库页数,物品=zhcangku["仓库选中"]+(zhcangku.仓库页数-1)*56,界面=zhcangku.界面,类型=zhcangku.道具类型}) --取
        zhcangku["仓库选中"] = nil
      else
        self.子控件[zhcangku["仓库选中"]]._spr["确定"] = nil
        self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 470, 86, w, h, "取出", a)
        zhcangku["仓库选中"] = a
        self.子控件[a]._spr["确定"] = true
      end
    else
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 470, 86, w, h, "取出", a)
      zhcangku["仓库选中"] = a
      self.子控件[a]._spr["确定"] = true
    end
  end
end
function 仓库网格:置物品(数据, 页数)
  zhcangku["ck数据"] = 数据
  zhcangku["仓库页数"] = 页数
  zhcangku.物品控件:重置(页数)
  zhcangku["仓库选中"] = nil
  for i = 1, #self.子控件 do
    if 数据[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, 数据[i], nil, "账号仓库")
   --   lssj["置偏移"](lssj, 10, 10)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
  zhcangku["ck数据"] = nil
end
local 道具网格 = 物品控件["创建网格"](物品控件, "道具网格", 373+180-5-5, 132-107+20-5, 57*7,57*8)
function 道具网格:初始化()
  self:创建格子(55, 55, 0, 1, 8, 7)
end

function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
    if zhcangku["道具选中"] then
      if zhcangku["道具选中"] == a then
        发送数据(当前 or self and self.当前,8002,{仓库类型=zhcangku.仓库分类类型,页数=zhcangku.仓库页数,物品=(zhcangku.道具页数-1)*56 + zhcangku["道具选中"],界面=zhcangku.界面,类型=zhcangku.道具类型}) --存放
        zhcangku["道具选中"] = nil
      else
        self.子控件[zhcangku["道具选中"]]._spr["确定"] = nil
        self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 120, 86, w, h, "存入", a)
        zhcangku["道具选中"] = a
       self.子控件[a]._spr["确定"] = true
      end
    else
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 120, 86, w, h, "存入", a)
      zhcangku["道具选中"] = a
     self.子控件[a]._spr["确定"] = true
    end
  end
end
function 道具网格:置物品(数据)
  zhcangku["道具选中"] = nil
  for i = 1, #self.子控件 do
    if 数据[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, 数据[i], nil, "账号仓库")
    --  lssj["置偏移"](lssj, 10, 10)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end
for i, v in ipairs({
  {
    name = "增加",
    x = 82+360,
    y = 63+9+360+70,
    tcp = __res:getPNGCC(1, 641, 320, 29, 29),
  },
  {
    name = "左翻",
    x = 16,
    y = 424+70,
    tcp = __res:getPNGCC(4, 969, 4, 46, 46)
  },
  {
    name = "右翻",
    x = 155,
    y = 424+70,
    tcp = __res:getPNGCC(4, 1016, 4, 46, 46)
  },

  {
    name = "左翻1",
    x = 16+470,
    y = 424+70,
    tcp = __res:getPNGCC(4, 969, 4, 46, 46)
  },
  {
    name = "右翻1",
    x = 155+470,
    y = 424+70,
    tcp = __res:getPNGCC(4, 1016, 4, 46, 46)
  }
}) do
  local 临时函数 = 物品控件["创建我的按钮"](物品控件, v.tcp, v.name, v.x, v.y, v.font)
 function  临时函数:左键弹起(x, y)
    if v.name == "左翻" and zhcangku["仓库页数"] > 1 then
      发送数据(当前 or self and self.当前,8005,{序列=zhcangku.仓库页数- 1,界面=zhcangku.界面})
    elseif v.name == "右翻" and zhcangku["仓库页数"] < zhcangku["道具仓库总数"] then
      发送数据(当前 or self and self.当前,8005,{序列=zhcangku.仓库页数+ 1,界面=zhcangku.界面})
    elseif v.name == "增加" then
      if zhcangku.道具仓库总数 <=10 then
        多开数据[当前].__UI界面.窗口层.对话栏:打开({模型=多开数据[当前].角色信息.模型,名称=多开数据[当前].角色信息.名称,对话="本次租借需要消耗#R"..(2000000).."#W两银子，你是否需要进行购买仓库操作？",选项={"购买共享仓库","让我再想想"}})

      else
        多开数据[当前].__UI界面["窗口层"]["对话栏"]:打开("","","本次租借需要消耗#R"..((zhcangku.道具仓库总数-1)*100+400).."#W仙玉，你是否需要进行购买仓库操作？",{"购买共享仓库","让我再想想"})
   
      end
    elseif v.name == "左翻1" then
      zhcangku["道具页数"]=1
      zhcangku.物品控件["道具网格"]:置物品( 多开数据[当前].__主控["道具列表"])
      zhcangku.物品控件:重置(zhcangku.仓库页数)
    elseif v.name == "右翻1" then
      zhcangku["道具页数"]=2
      local fdfere={}
      for n=56,80 do
        if 多开数据[当前].__主控["道具列表"][n] then
          fdfere[n-56]=多开数据[当前].__主控["道具列表"][n]
        end
      end
      zhcangku.物品控件["道具网格"]:置物品(fdfere)
   
      zhcangku.物品控件:重置(zhcangku.仓库页数)
    end
  end
end

local 召唤兽控件 = zhcangku["创建控件"](zhcangku, "召唤兽控件", 0, 0, 777, 488+60)
function 召唤兽控件:重置(data2)
  self:置可见(true)
  zhcangku["图像"] = nil
  zhcangku["图像2"] = nil
  local nsf = require("SDL.图像")(777, 488+60)["置像素"](require("SDL.图像")(777, 488+60), 20, 20, 0, 0, 0, 255)
  if nsf["渲染开始"](nsf) then
    local lssj = 取白色背景(0, 0, 306, 450, true)
    lssj["显示"](lssj, 17, 40)
    lssj["显示"](lssj, 400, 40)
    zhcangku.数量框:显示(69, 429+70)

    字体18["置颜色"](字体18, __取颜色("黑色"))
    字体18["取图像"](字体18, zhcangku["bb仓库页数"] .. "/" .. zhcangku["召唤兽仓库总数"]):显示(93,433+4+70)
    local 左1=41
    __res:getPNGCC(4, 719, 281, 左1, 35):显示(17, 40)
    local 中间=306-左1-左1
    __res:getPNGCC(4, 719+左1, 281, 中间, 35):显示(17+左1, 40)
    __res:getPNGCC(4, 719+(351-左1), 281, 左1, 35):显示(17+左1+中间, 40)

    __res:getPNGCC(4, 719, 281, 左1, 35):显示(400, 40)
    __res:getPNGCC(4, 719+左1, 281, 中间, 35):显示(400+左1, 40)
    __res:getPNGCC(4, 719+(351-左1), 281, 左1, 35):显示(400+左1+中间, 40)
    local shu=__res:getPNGCC(4,1085, 281, 3, 35)
    shu:显示(17+149, 40)
    shu:显示(400+149, 40)
    字体18["置颜色"](字体18, __取颜色("浅黑"))
    字体18["取图像"](字体18, "名字")["显示"](字体18["取图像"](字体18, "名字"), 58, 48)
    字体18["取图像"](字体18, "等级")["显示"](字体18["取图像"](字体18, "等级"), 225, 48)
    字体18["取图像"](字体18, "名字")["显示"](字体18["取图像"](字体18, "名字"), 441, 48)
    字体18["取图像"](字体18, "等级")["显示"](字体18["取图像"](字体18, "等级"), 608, 48)
    nsf["渲染结束"](nsf)
  end
  zhcangku["图像"] = nsf["到精灵"](nsf)
  zhcangku["召唤兽仓库数据"] = data2
  self.右侧bb列表["重置"](self.右侧bb列表, zhcangku["召唤兽数据"])
  self.左侧bb列表["重置"](self.左侧bb列表, zhcangku["召唤兽仓库数据"])
end

local 右侧bb列表 = 召唤兽控件["创建列表"](召唤兽控件, "右侧bb列表", 404, 78, 298, 400)
function 右侧bb列表:初始化()
  self:置文字(字体20)
  self.行高度 = 25
  self.行间距 = 0
end
function 右侧bb列表:重置()
  zhcangku["右侧bb选中"] = nil
  self.清空(self)
 
  for _, v in ipairs(多开数据[当前].角色信息.宝宝列表) do
    local nsf = require("SDL.图像")(298, 50)
    if nsf["渲染开始"](nsf) then
      if 1 == _ % 2 then
      end
     
      字体16["置颜色"](字体16, __取颜色("浅黑"))
      字体16["取图像"](字体16, v["名称"])["显示"](字体16["取图像"](字体16, v["名称"]), 11,3)
      字体16["取图像"](字体16, v["等级"])["显示"](字体16["取图像"](字体16, v["等级"]), 205,3)
      nsf["渲染结束"](nsf)
    end
    local r = self.添加(self)
    r["置精灵"](r, nsf["到精灵"](nsf))
  end
end
function 右侧bb列表:左键弹起(x, y, i, item, msg)
  zhcangku["右侧bb选中"] = i
end
local 左侧bb列表 = 召唤兽控件["创建列表"](召唤兽控件, "左侧bb列表", 17, 78, 298, 400)
function 左侧bb列表:初始化()
  self:置文字(字体20)
  self.行高度 = 25
  self.行间距 = 0
end
function 左侧bb列表:重置(data)
  zhcangku["左侧bb选中"] = nil
  self.清空(self)
  for _, v in ipairs(data) do
    local nsf = require("SDL.图像")(298, 50)
    if nsf["渲染开始"](nsf) then
      if 1 == _ % 2 then
      end
      字体16["置颜色"](字体16, __取颜色("浅黑"))
      字体16["取图像"](字体16, v["名称"])["显示"](字体16["取图像"](字体16, v["名称"]), 17, 3)
      字体16["取图像"](字体16, v["等级"])["显示"](字体16["取图像"](字体16, v["等级"]), 205, 3)
      nsf["渲染结束"](nsf)
    end
    local r = self.添加(self)
    r["置精灵"](r, nsf["到精灵"](nsf))
  end
end
function 左侧bb列表:左键弹起(x, y, i, item, msg)
  zhcangku["左侧bb选中"] = i
end

for i, v in ipairs({
  {
    name = "存入",
    x = 335,
    y = 160,
    tcp = __res:getPNGCC(4, 969, 4, 46, 46)
  },
  {
    name = "取出",
    x = 335,
    y = 335,
    tcp =  __res:getPNGCC(4, 1016, 4, 46, 46)
  },
      {
    name = "查看1",
    x = 210,
    y = 63+360+70,
    tcp = __res:getPNGCC(3,511,11,117,43,true),
    -- tcp2 = __res:getPNGCC(3,511,11,117,43,true),
    font = "查 看"
  },
      {
    name = "查看2",
    x = 550,
    y = 63+360+70,
    tcp = __res:getPNGCC(3,511,11,117,43,true),
    -- tcp2 = __res:getPNGCC(3,511,11,117,43,true),
    font = "查 看"
  }
}) do
  local 临时函数 = 召唤兽控件["创建我的按钮"](召唤兽控件, v.tcp, v.name, v.x, v.y,v.font)
 function  临时函数:左键弹起(x, y)
    if v.name == "存入" and zhcangku["右侧bb选中"] and 多开数据[当前].角色信息.宝宝列表[zhcangku["右侧bb选中"]] then
      if 多开数据[当前].角色信息.宝宝列表[zhcangku["右侧bb选中"]].参战信息~=nil then
        多开数据[当前].__UI弹出.提示框:打开("Y/参战的召唤兽无法存入仓库。")
      else
        发送数据(当前 or self and self.当前,8013,{类型="存",认证码=多开数据[当前].角色信息.宝宝列表[zhcangku["右侧bb选中"]]["认证码"],页数= zhcangku.bb仓库页数,界面=zhcangku.仓库类型})
      end
    elseif v.name == "取出" and zhcangku["左侧bb选中"] and zhcangku["召唤兽仓库数据"][zhcangku["左侧bb选中"]] then
      发送数据(当前 or self and self.当前,8013,{类型="取",认证码=zhcangku["召唤兽仓库数据"][zhcangku["左侧bb选中"]].认证码,页数=zhcangku.bb仓库页数,界面=zhcangku.仓库类型})
     elseif v.name == '查看1' then
             if zhcangku["左侧bb选中"] and 多开数据[当前].角色信息.宝宝列表[zhcangku["左侧bb选中"]]  then
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(zhcangku["召唤兽仓库数据"][zhcangku["左侧bb选中"]])
            else
               多开数据[当前].__UI弹出.提示框:打开("#Y请选择你要查看的仓库内的召唤兽")
            end
    elseif v.name == '查看2'  then
      if 多开数据[当前].角色信息.宝宝列表[zhcangku["右侧bb选中"]]~=nil then
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(多开数据[当前].角色信息.宝宝列表[zhcangku["右侧bb选中"]])
            else
               多开数据[当前].__UI弹出.提示框:打开("#Y请选择你要查看的随身召唤兽")
            end
    end
  end
end
local 关闭 = zhcangku["创建我的按钮"](zhcangku, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 910, 0)
function 关闭:左键弹起(x, y, msg)
  zhcangku["置可见"](zhcangku, false)
end

for i, v in ipairs({
 {
    name = "宝石仓库",
    x = 410,
    y = 120,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "宝石"
  },

  {
    name = "内丹仓库",
    x = 410+66,
    y = 120,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "内丹"
  },
  {
    name = "兽决仓库",
    x = 410,
    y = 120+43,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "兽决"
  },
  {
    name = "炼妖仓库",
    x = 410+66,
    y = 120+43,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "炼妖"
  },
  {
    name = "书铁仓库",
    x = 410,
    y = 120+43*2,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "书铁"
  },
  {
    name = "装备仓库",
    x = 410+66,
    y = 120+43*2,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "装备"
  },
  {
    name = "其他仓库",
    x = 410,
    y = 120+43*3,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "其他"
  },
   {
    name = "卡片仓库",
    x = 410+66,
    y = 120+43*3,
    tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(63, 30),
    tcp2 = __res:getPNGCC(3, 876, 289, 85, 36, true):拉伸(63, 30),
    font = "卡片"
  },

}) do
  local 临时函数 = zhcangku["创建我的单选按钮"](zhcangku, v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
 function  临时函数:左键弹起(x, y)
 
  zhcangku.界面="道具"
    if v.name == "宝石仓库"  then
      zhcangku.仓库分类类型="宝石"
      zhcangku.仓库页数=1
      发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型}) 
    elseif v.name == "装备仓库"  then
      zhcangku.仓库分类类型="装备"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型}) 
    elseif v.name == "道具仓库"  then
        zhcangku.仓库分类类型="道具"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型})  
    elseif v.name == "卡片仓库"  then
        zhcangku.仓库分类类型="卡片"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型}) 
    elseif v.name == "内丹仓库"  then
    
        zhcangku.仓库分类类型="内丹"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型})  
   elseif v.name == "其他仓库"  then
    
        zhcangku.仓库分类类型="其他"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型})        
      elseif v.name == "炼妖仓库"  then
    
        zhcangku.仓库分类类型="炼妖"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型})        
    
   elseif v.name == "书铁仓库"  then
    
        zhcangku.仓库分类类型="书铁"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型})        
      elseif v.name == "兽决仓库"  then
        zhcangku.仓库分类类型="兽决"
        self.仓库页数=1
        发送数据(当前 or self and self.当前,8005,{序列=1,界面= zhcangku.界面,仓库类型=zhcangku.仓库分类类型})            
    end
  end
end


for i, v in ipairs({
  {
    name = "增加1",
    x = 82+360,
    y = 63+9+360+70,
    tcp = __res:getPNGCC(1, 641, 320, 29, 29),
  },
  {
    name = "左翻1",
    x = 16,
    y = 424+70,
    tcp = __res:getPNGCC(4, 969, 4, 46, 46)
  },
  {
    name = "右翻1",
    x = 155,
    y = 424+70,
    tcp = __res:getPNGCC(4, 1016, 4, 46, 46)
  },

}) do
  local 临时函数 = 召唤兽控件["创建我的按钮"](召唤兽控件, v.tcp, v.name, v.x, v.y, v.font)
 function  临时函数:左键弹起(x, y)
  
    if v.name == "左翻1" and zhcangku["bb仓库页数"] > 1 then
      local bb页数=zhcangku["bb仓库页数"]-1
      zhcangku["bb仓库页数"]=bb页数
      发送数据(当前 or self and self.当前,8012,{序列=bb页数,界面=zhcangku.界面})
    
    elseif v.name == "右翻1" and zhcangku["bb仓库页数"] < zhcangku["召唤兽仓库总数"] then
      local bb页数=zhcangku["bb仓库页数"]+1
      zhcangku["bb仓库页数"]=bb页数
      发送数据(当前 or self and self.当前,8012,{序列=bb页数,界面=zhcangku.界面})
     -- --print(zhcangku.仓库页数)
    elseif v.name == "增加1" then
      if zhcangku.道具仓库总数 <=5 then
      多开数据[当前].__UI界面["窗口层"]["对话栏"]:打开("","","本次租借需要消耗#R"..((zhcangku.召唤兽仓库总数-1)*1000000+1000000).."#W两银子，你是否需要进行购买仓库操作？",{"购买召唤兽共享仓库","让我再想想"})
	
      end
   
    end
  end
end
