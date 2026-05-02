local 翻一番 = 多开数据[多开数据.当前].__UI界面["窗口层"]["创建我的窗口"](多开数据[多开数据.当前].__UI界面["窗口层"], "翻一番", 80+67 + abbr.py.x, 42-25 + abbr.py.y, 665-40, 470+18)

local 当前 = 多开数据.当前

function 翻一番:初始化()
  local nsf = require("SDL.图像")(665, 470+18)
  if nsf["渲染开始"](nsf) then
    置窗口背景("翻一番", 0, 12, 665-40, 460+18, true):显示(0, 0)
    __res:getPNGCC(8, 838, 56, 282, 399+18):显示(352+15+15-40, 53)
    取灰色背景(0, 0, 366-40, 399+18, true):置透明(130):显示(15, 53)
    字体14:置颜色(__取颜色("白色"))
    字体14:取图像("倍率说明"):显示(359,115+61+24)
    字体14:置颜色(__取颜色("黄色"))
    字体14:取图像("遇到倍率卡牌后"):显示(359,115+61+26+24)
    字体14:取图像("将获得倍率卡牌的倍数的物品奖励。"):显示(359,115+61+26+20*1+24)
    -- 字体14:取图像("翻倍仅在下张牌为物品牌时生效，"):显示(359,115+61+26+20*2+24)
    字体14:取图像("以遇到物品牌前翻出的数字为准。"):显示(359,115+61+26+20*2+24)
    字体20:置颜色(__取颜色("红色"))
    字体20:取图像("    关闭页面视为放弃奖励"):显示(359,115+61+26+20*8+24)

  end
  self:置精灵(nsf["到精灵"](nsf))
end
local function 递增函数(n)
	if n==0 then
	    return 0
	end
	return qz(60 * 2^(n-1))
end

function 翻一番:打开(内容)
  self.物品组={}
  self.lswp={}
  self.开始游戏=false
  self.预览看牌=false
  self.倍率=1
  self.sss=9
  self.进行次数=0
  self.剩余次数=内容.剩余次数
  self.临时编号=0
  self.选中编号={}
  self.lswp编号={}
  self:置可见(true)
 
  -- self.牌组网格:置数据()
  self.开始按钮:置可见(true)
  self.看牌按钮:置可见(false)
  self.领取按钮:置可见(false)
  self:chongzhi()
end

function 翻一番:游戏开始(数据)
	-- table.print(数据)
	self.lswp={}
	for i=1,9 do
		self.lswp[i]={}
		self.lswp[i].名称=数据[1][i]
	end
	self.sss=9
	self.时间=os.time()
	self.预览看牌=false
	self.开始游戏=true
  self.开始按钮:置可见(false)
  self.看牌按钮:置可见(true)
  self.领取按钮:置可见(true)
  self:chongzhi()
end

function 翻一番:结束游戏()
	self.物品组={}
	self.lswp={}
	self.开始游戏=false
	self.预览看牌=false
	self.倍率=1
	self.sss=9
	self.进行次数=0
	self.临时编号=0
	self.选中编号={}
	self.lswp编号={}
  self:chongzhi()
  翻一番.道具网格:置物品()
  self.开始按钮:置可见(true)
  self.看牌按钮:置可见(false)
  self.领取按钮:置可见(false)
end


function 翻一番:翻牌请求(数据)
	local 编号=数据.物品编号
	self.物品组[编号]={}
	self.物品组[编号].名称=数据.物品
	self.选中编号[编号]=true
	self.倍率=数据.倍率
	self.进行次数=数据.进行次数
	self.剩余次数=数据.剩余次数
  self:chongzhi()
  翻一番.道具网格:置物品()
  --table.print(数据)
end

function 翻一番:chongzhi()
  local nsf = require("SDL.图像")(456, 450)
  local 牌1=__res["UI素材"][8]:复制区域(668, 381, 96, 117):置透明(180)
  local 牌2=__res:getPNGCC(8, 668, 499, 96, 117)
  local 牌3=__res["UI素材"][8]:复制区域(668, 381, 96, 117)
  if nsf["渲染开始"](nsf) then
    字体16:置颜色(__取颜色("绿色"))
    字体16:取图像(self.倍率.."倍"):显示(428,115+24)
    local xxx,yyy=1,1
    if not 翻一番.开始游戏 then
      for i=1,9 do
        牌1:显示(15+13-5+(xxx-1)*107, 53+13-5+(yyy-1)*122)
        xxx=xxx+1
				if xxx>3 then
				    xxx=1
				    yyy=yyy+1
				end
      end
    else
      if self.预览看牌 then
        for i=1,9 do
          牌2:显示(15+13-5+(xxx-1)*107, 53+13-5+(yyy-1)*122)
          xxx=xxx+1
          if xxx>3 then
              xxx=1
              yyy=yyy+1
          end
        end
      else
        for i=1,9 do
          if self.选中编号[i] then
            牌2:显示(15+13-5+(xxx-1)*107, 53+13-5+(yyy-1)*122)
          else
            牌3:显示(15+13-5+(xxx-1)*107, 53+13-5+(yyy-1)*122)
          end
          xxx=xxx+1
          if xxx>3 then
              xxx=1
              yyy=yyy+1
          end
        end
      end
    end
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf:到精灵()
end

local 道具网格 = 翻一番["创建网格"](翻一番, "道具网格", 15+13-5+25, 53+13-5+38, 280,304)
function 道具网格:初始化()
  self:创建格子(67, 67, 55, 40, 3, 3)
end
-- function 道具网格:左键弹起(x, y, a, b, msg)
--   if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
--     self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 40+326, 86, w, h, "道12具", a)
--   end
-- end
function 道具网格:置物品()
  for i = 1, #道具网格["子控件"] do
    if 翻一番.预览看牌 then
      if 翻一番.lswp[i] then
        local lssj = __物品格子["创建"](当前)
        lssj["置物品"](lssj, 翻一番.lswp[i], nil, "翻一番")
        -- lssj["置偏移"](lssj, 10, 10)
        道具网格["子控件"][i]["置精灵"](道具网格["子控件"][i], lssj)
      else
        道具网格["子控件"][i]["置精灵"](道具网格["子控件"][i])
      end
    else
      if 翻一番.物品组[i] and 翻一番.选中编号[i] then
        local lssj = __物品格子["创建"](当前)
        lssj["置物品"](lssj, 翻一番.物品组[i], nil, "翻一番")
        -- lssj["置偏移"](lssj, 10, 10)
        道具网格["子控件"][i]["置精灵"](道具网格["子控件"][i], lssj)
      else
        道具网格["子控件"][i]["置精灵"](道具网格["子控件"][i])
      end
    end
  end
end


-- local paizukongjian=翻一番["创建控件"](翻一番, "paizukongjian", 15+13-5, 53+13-5, 357, 387)
local 牌组网格 = 翻一番["创建网格"](翻一番, "牌组网格", 15+13-5, 53+13-5, 357, 387)
function 牌组网格:初始化()
  self:创建格子(96, 117, 5, 11, 3, 3)  --96+11=107  117+5=122
end

function 牌组网格:左键弹起(x, y, a, b, msg)
  if 翻一番.开始游戏 then
    if not 翻一番.预览看牌 then 
      if not 翻一番.物品组[a] then
        翻一番.临时编号=a
        local xxx={"开启（花费"..(递增函数(翻一番.进行次数)).."仙玉）","我再想想"}
          多开数据[当前].__UI界面.窗口层.对话栏:打开({ 模型 = "", 名称 = "翻一番", 对话 = "你即将开启翻一番，将消耗1次新春翻一番次数。#Y(当前剩余次数："..翻一番.剩余次数..")#W，如果翻一番次数≤0，则会消耗#Y60点仙玉#W。",选项=xxx})
      elseif 翻一番.道具网格.子控件[a] and 翻一番.道具网格.子控件[a]._spr and 翻一番.道具网格.子控件[a]._spr["物品"] then
        翻一番.道具网格.子控件[a]._spr["详情打开"](翻一番.道具网格.子控件[a]._spr, 40+326, 86, w, h, "道12具", a)
      end
    elseif 翻一番.道具网格.子控件[a] and 翻一番.道具网格.子控件[a]._spr and 翻一番.道具网格.子控件[a]._spr["物品"] then
      翻一番.道具网格.子控件[a]._spr["详情打开"](翻一番.道具网格.子控件[a]._spr, 40+326, 86, w, h, "道12具", a)
    end
  end
end

local 看牌按钮 = 翻一番["创建我的按钮"](翻一番,  __res:getPNGCC(7, 0, 209, 118, 28):拉伸(95, 32), "看牌按钮", 63, 424+5, "看牌")
function 看牌按钮:左键弹起(x, y, msg)
  翻一番.预览看牌=not 翻一番.预览看牌
  翻一番:chongzhi()
  翻一番.道具网格:置物品()
end
local 领取按钮 = 翻一番["创建我的按钮"](翻一番,  __res:getPNGCC(1, 626, 28, 58, 34, true):拉伸(95, 32), "领取按钮", 63+144, 424+5, "领取")
function 领取按钮:左键弹起(x, y, msg)
  if not 判断是否为空表(翻一番.物品组) then
    多开数据[多开数据.当前].__UI界面["窗口层"]["对话栏"]:打开({模型 = "",名称 = "翻一番",对话 = "你确定放弃本轮游戏么？放弃后游戏将会结束，翻出的卡牌会兑换成奖励发放，剩余未翻出的卡牌奖励将无法获得噢",选项 = {"确定领取","取消"}})
  end
end

local 开始按钮 = 翻一番["创建我的按钮"](翻一番,  __res:getPNGCC(7, 0, 209, 118, 28):拉伸(135, 32), "开始按钮", 152-36, 208, "点击开始游戏")
function 开始按钮:左键弹起(x, y, msg)
  多开数据[当前].__UI界面.窗口层.对话栏:打开({ 模型 = "", 名称 = "翻一番", 对话 = "你即将开启翻一番，将消耗1次新春翻一番次数。#Y(当前剩余次数："..翻一番.剩余次数..")#W，如果翻一番次数≤0，则会消耗#Y60点仙玉#W。",选项={"打开翻一番","手滑了"}})
end

local 关闭 = 翻一番["创建我的按钮"](翻一番, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 665-40-48, 0)
function 关闭:左键弹起(x, y, msg)
  翻一番["置可见"](翻一番, false)
  翻一番:结束游戏()
end