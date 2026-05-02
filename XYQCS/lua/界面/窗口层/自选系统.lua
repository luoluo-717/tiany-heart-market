local 自选系统 = 多开数据[多开数据.当前].__UI界面["窗口层"]["创建我的窗口"](多开数据[多开数据.当前].__UI界面["窗口层"], "自选系统", 80+67 + abbr.py.x, 20+52 + abbr.py.y, 562+20, 391+40+13)

-- 多开数据[多开数据.当前].__UI弹出.自选系统 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("自选系统", 80+67 + abbr.py.x, 20+52 + abbr.py.y, 562+20, 391+40+13)
-- local 自选系统 = 多开数据[多开数据.当前].__UI弹出.自选系统
local 当前 = 多开数据.当前

function 自选系统:初始化()
  local nsf = require("SDL.图像")(562+20, 391+40+13)
  if nsf["渲染开始"](nsf) then
    置窗口背景("自选系统", 0, 12, 562,391+25+13, true):显示(0, 0)
    字体18:置颜色(__取颜色("白色"))
    字体18:取图像("你想要下面哪种类型的道具呢？"):显示(20,79-34)
  end
  self:置精灵(nsf["到精灵"](nsf))
end

function 自选系统:打开(标题,附加)
  self.标题=标题
  self.附加=附加
  self.选中=0
  self:加载物品()
  self:置可见(true)
end
function 自选系统:加载物品()
	self.物品组={}
	if self.标题=="150书铁礼包" or self.标题=="自选书铁" then
		local 书铁范围 = {"天龙破城","碧血干戚","霜冷九州","紫电青霜","揽月摘星","忘川三途","浩气长舒","丝萝乔木","狂澜碎岳","牧云清歌","无关风月","业火三灾","碧海潮生","九霄风雷","云雷万里","百辟镇魂","夭桃秾李","浮生归梦","紫金磐龙冠","金珰紫焰冠","紫金碧玺佩","五彩凤翅衣","紫金磐龙甲","磐龙凤翔带","金丝逐日履"}
		local mc={"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼","头盔","发钗","项链","女衣","男衣","腰带","鞋子"}
		for i=1,#书铁范围 do
			self.物品组[i]={}
			self.物品组[i].名称=书铁范围[i]
		end


    elseif self.标题=="160自选礼包" then
		local 书铁范围 = {"弑皇","裂天","擒龙","浮犀","九霄","离钩","星瀚","醍醐","碎寂","霜陨","朝夕","鸣鸿","弦月","若木","赤明","长息","荒尘","晴雪","浑天玄火盔","乾元鸣凤冕","落霞陨星坠","鎏金浣月衣","混元一气甲","紫霄云芒带","辟尘分光履"}
		local mc={"弑皇","裂天","擒龙","浮犀","九霄","离钩","星瀚","醍醐","碎寂","霜陨","朝夕","鸣鸿","弦月","若木","赤明","长息","荒尘","晴雪","浑天玄火盔","乾元鸣凤冕","落霞陨星坠","鎏金浣月衣","混元一气甲","紫霄云芒带","辟尘分光履"}
		for i=1,#书铁范围 do
			self.物品组[i]={}
			self.物品组[i].名称=书铁范围[i]
		end


	elseif self.标题=="自选特殊兽决" or self.标题=="自选超级兽决" or self.标题=="自选钟灵石"  or self.标题=="稀有特殊兽决"or self.标题=="稀有高兽决" then
		for i=1,#self.附加 do
      self.物品组[i]={}
			self.物品组[i].名称=self.附加[i]
		end
  elseif self.标题=="高级宝石礼包" then
		for i=1,#self.附加 do
      self.物品组[i]={}
			self.物品组[i].名称=self.附加[i]
		end
  elseif self.标题=="宠物铠甲自选礼包" then
		for i=1,#self.附加 do
      self.物品组[i]={}
			self.物品组[i].名称=self.附加[i]
		end 
  elseif self.标题=="宠物项圈自选礼包" then
		for i=1,#self.附加 do
      self.物品组[i]={}
			self.物品组[i].名称=self.附加[i]
		end  
  elseif self.标题=="宠物护腕自选礼包" then
		for i=1,#self.附加 do
      self.物品组[i]={}
			self.物品组[i].名称=self.附加[i]
		end 
  elseif self.标题=="珍兽元" then
		for i=1,#self.附加 do
      self.物品组[i]={}
			self.物品组[i].名称=self.附加[i]
		end
	end
  自选系统.youcewangge:置数据()
end

local youcewangge= 自选系统["创建网格"](自选系统, "youcewangge", 92-80, 63+20, 546, 301)
function youcewangge:初始化()
  -- self:创建格子(378, 73, 0, 0, 1, 1)
end

function youcewangge:左键弹起(x, y, a, b, msg)
  if 自选系统.标题=="150书铁礼包" or 自选系统.标题=="自选书铁" or  自选系统.标题=="160自选礼包"  then 
    if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
      if 自选系统["选中"] and self.子控件[自选系统["选中"]]  and self.子控件[自选系统["选中"]]._spr then
        self.子控件[自选系统["选中"]]._spr["确定"] = nil
      end
      自选系统["选中"] = a
      self.子控件[a]._spr["确定"] = true
      local w, h = self.子控件[a]["取宽高"](self.子控件[a])
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, x, 86, w, h, "大师傅地方", a)
    end
  elseif 自选系统.标题=="自选特殊兽决" or 自选系统.标题=="自选超级兽决" or 自选系统.标题=="自选钟灵石" or 自选系统.标题=="稀有特殊兽决"or 自选系统.标题=="稀有高兽决" then 
    if self.子控件[a]._spr and self.子控件[a]._spr.数据 then
      if 自选系统["选中"] and self.子控件[自选系统["选中"]]  and self.子控件[自选系统["选中"]]._spr then
        self.子控件[自选系统["选中"]]._spr["确定"] = nil
      end
      自选系统["选中"] = a
      self.子控件[a]._spr["确定"] = true
      self.子控件[a]._spr:详情打开(x, y)
    end
  elseif 自选系统.标题=="珍兽元" then 
    if self.子控件[a]._spr and self.子控件[a]._spr.数据 then
      if 自选系统["选中"] and self.子控件[自选系统["选中"]]  and self.子控件[自选系统["选中"]]._spr then
        self.子控件[自选系统["选中"]]._spr["确定小"] = nil
      end
      自选系统["选中"] = a
      self.子控件[a]._spr["确定小"] = true
      -- self.子控件[a]._spr:详情打开(x, y)
    end
  elseif 自选系统.标题=="宠物铠甲自选礼包" then 
    if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
      if 自选系统["选中"] and self.子控件[自选系统["选中"]]  and self.子控件[自选系统["选中"]]._spr then
        self.子控件[自选系统["选中"]]._spr["确定"] = nil
      end
      自选系统["选中"] = a
      self.子控件[a]._spr["确定"] = true
      local w, h = self.子控件[a]["取宽高"](self.子控件[a])
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, x, 86, w, h, "大师傅地方", a)
    end
  elseif 自选系统.标题=="宠物护腕自选礼包" then 
    if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
      if 自选系统["选中"] and self.子控件[自选系统["选中"]]  and self.子控件[自选系统["选中"]]._spr then
        self.子控件[自选系统["选中"]]._spr["确定"] = nil
      end
      自选系统["选中"] = a
      self.子控件[a]._spr["确定"] = true
      local w, h = self.子控件[a]["取宽高"](self.子控件[a])
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, x, 86, w, h, "大师傅地方", a)
    end
  elseif 自选系统.标题=="宠物项圈自选礼包" then 
    if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
      if 自选系统["选中"] and self.子控件[自选系统["选中"]]  and self.子控件[自选系统["选中"]]._spr then
        self.子控件[自选系统["选中"]]._spr["确定"] = nil
      end
      自选系统["选中"] = a
      self.子控件[a]._spr["确定"] = true
      local w, h = self.子控件[a]["取宽高"](self.子控件[a])
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, x, 86, w, h, "大师傅地方", a)
    end
  elseif 自选系统.标题=="高级宝石礼包" then 
    if self.子控件[a]._spr and self.子控件[a]._spr["物品"] then
      if 自选系统["选中"] and self.子控件[自选系统["选中"]]  and self.子控件[自选系统["选中"]]._spr then
        self.子控件[自选系统["选中"]]._spr["确定"] = nil
      end
      自选系统["选中"] = a
      self.子控件[a]._spr["确定"] = true
      local w, h = self.子控件[a]["取宽高"](self.子控件[a])
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, x, 86, w, h, "大师傅地方", a)
    end
  end
end

function youcewangge:置数据()
  self:创建格子(55, 55, 25, 25, math.ceil(#自选系统.物品组), 7, true)
  -- table.print(自选系统.lijkg[自选系统.状态])
  for i = 1, #self["子控件"] do
    if 自选系统.标题=="150书铁礼包" or 自选系统.标题=="自选书铁" or 自选系统.标题=="160自选礼包" then 
      if 自选系统.物品组[i] then
        local lssj = __物品格子.创建(当前)
        -- print(自选系统.物品组[i].名称)
        lssj:置物品(自选系统.物品组[i], "白格子","无需显示数量11")
        self["子控件"][i]["置精灵"](self["子控件"][i], lssj)
      end
    elseif 自选系统.标题=="自选特殊兽决" or 自选系统.标题=="自选超级兽决" or 自选系统.标题=="自选钟灵石" or 自选系统.标题=="稀有特殊兽决"or 自选系统.标题=="稀有高兽决" then  
      if 自选系统.物品组[i] then
        local lssj = __小技能格子.创建(当前)
        -- print(自选系统.物品组[i].名称)
        lssj:置数据(自选系统.物品组[i], 55,55)
        self["子控件"][i]["置精灵"](self["子控件"][i], lssj)
      end
    elseif 自选系统.标题=="珍兽元" then 
      if 自选系统.物品组[i] then
        local lssj = __头像格子["创建"](当前)
        local fsdkfs={模型=自选系统.物品组[i].名称}
        lssj["置头像"](lssj, fsdkfs, "自选")

        -- local lssj = __小技能格子.创建()
        -- -- print(自选系统.物品组[i].名称)
        -- lssj:置数据(自选系统.物品组[i], 55,55)
        self["子控件"][i]["置精灵"](self["子控件"][i], lssj)
      end
    elseif 自选系统.标题=="高级宝石礼包" then 
      if 自选系统.物品组[i] then
        local lssj = __物品格子.创建(当前)
        -- print(自选系统.物品组[i].名称)
        lssj:置物品(自选系统.物品组[i], "白格子","无需显示数量11")
        self["子控件"][i]["置精灵"](self["子控件"][i], lssj)
      end
    end
  end
end
local 确定按钮 = 自选系统["创建我的按钮"](自选系统, __res:getPNGCC(3, 2, 507, 124, 41):拉伸(123, 37), "确定按钮", 219, 374+8, "确 定")
function 确定按钮:左键弹起(x, y, msg)
  if 自选系统.选中~=0 and 自选系统.物品组[自选系统.选中] and 自选系统.物品组[自选系统.选中].名称 then
    local mc={"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼","头盔","发钗","项链","女衣","男衣","腰带","鞋子"}
    local 名称=自选系统.物品组[自选系统.选中].名称
    if 自选系统.标题=="150书铁礼包" or 自选系统.标题=="自选书铁" then
      名称=mc[自选系统.选中]
    end
    发送数据(当前,3789,{道具名称=自选系统.标题,选中=自选系统.选中,名称=名称})
    自选系统["置可见"](自选系统, false)
  end
end

local 关闭 = 自选系统["创建我的按钮"](自选系统, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 500+29, 0)
function 关闭:左键弹起(x, y, msg)
  自选系统["置可见"](自选系统, false)
end