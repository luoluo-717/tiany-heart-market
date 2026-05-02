local 宝宝赐福 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("宝宝赐福", 80+67+30 + abbr.py.x, 42-25 + abbr.py.y, 665-40-90, 470+18+18)
local 当前 = 多开数据.当前
function 宝宝赐福:初始化()
  local nsf = require("SDL.图像")(665-90, 470+18+18)
  if nsf:渲染开始() then
    置窗口背景("赐 福", 0, 12, 605-40-90, 420+18+18, true):显示(0, 0)
   取白色背景(0, 0, 178, 153+18, true):置透明(235):显示(7, 50)
   取白色背景(0, 0, 178, 232, true):置透明(235):显示(7, 215-44+37+18)
  __res:getPNGCC(3, 694, 4, 338, 272):拉伸(277,225):显示(190,215-44+37+18)
   __res:getPNGCC(8, 0, 208, 53, 53):拉伸(45,45):显示(339,140-5)
    字体14:置颜色(__取颜色("白色"))
  end
  self:置精灵(nsf:到精灵())
  self.赐福= __res:取动画2('shape/ui/xz/AABB0311.was'):置循环(true)
  self.赐福:置首帧()
  self:按钮逻辑()
end


function 宝宝赐福:打开(内容)
  self.宝宝列表=多开数据[当前 or self and self.当前].角色信息.宝宝列表 or {}
  for i=1,#内容.道具.道具 do
    if 内容.道具 and 内容.道具.道具 and 内容.道具.道具[i] then
      多开数据[当前 or self and self.当前].__主控.道具列表[i] = 内容.道具.道具[i]
    else
      多开数据[当前 or self and self.当前].__主控.道具列表[i] = nil
    end
  end
  self.新赐福=false
  self.锁定技能={}
  self.头像组 = {}
  self.加入 = 0
  self.拽拖对象=0
  self.宝宝动画={}
  self.操作宝宝编号=0
  self.模型格子 = __UI模型格子.创建(当前)
  self:置可见(true)
  self.赐福技能控件.丸子网格:置物品(nil)
  self.道具网格:置物品(多开数据[当前 or self and self.当前].__主控.道具列表)
  self.bb列表:重置头像()
  self:按钮逻辑()
  self:锁定按钮初始化()
  self:隐藏所有按钮(false)
end
function 宝宝赐福:按钮逻辑()
  self.赐福按钮:置可见(not self.新赐福)
  self.保存技能:置可见(self.新赐福)
  self.再次赐福:置可见(self.新赐福)
end
function 宝宝赐福:更新(dt)
  self.模型格子:更新(dt)
  if self.赐福动画 then
    self.赐福:更新(dt)
    if not self.按钮已隐藏 then
      self:隐藏所有按钮(true)
      self.按钮已隐藏 = true
    end

    if self.赐福:取当前帧() >= self.赐福:取帧数() then
      if 宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号] and 宝宝赐福.道具选中 then
        发送数据(当前 or self and self.当前,3902,{认证码=宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号].认证码,锁定=宝宝赐福.锁定技能,材料=宝宝赐福.道具选中, bb = 宝宝赐福.操作宝宝编号})
      else
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y/请选择要操作的宝宝和需要材料！')
      end
      self.赐福:置首帧()
      self.赐福动画 = nil
      self:隐藏所有按钮(false)
      self.按钮已隐藏 = false
      self:按钮逻辑()
    end
  end
end
function 宝宝赐福:隐藏所有按钮(隐藏)
  -- 赐福相关按钮
  if self.赐福按钮 then
    self.赐福按钮:置可见(not 隐藏)
  end
  if self.保存技能 then
    self.保存技能:置可见(not 隐藏)
  end
  if self.再次赐福 then
    self.再次赐福:置可见(not 隐藏)
  end
  for i = 1, 4 do
    if self["锁定按钮"..i] then
      self["锁定按钮"..i]:置可见(not 隐藏)
    end
  end
  if self.技能列表按钮 then
    self.技能列表按钮:置可见(not 隐藏)
  end
end
function 宝宝赐福:显示(x, y)
  self.模型格子:显示(x, y)
  self.赐福:显示(x+190,y+50)
end

local 赐福技能控件 = 宝宝赐福:创建控件("赐福技能控件", 190, 50, 336, 153+16)

local 丸子网格 = 赐福技能控件:创建网格("丸子网格", 11+135-40, 11+81+18, 46, 46)
function 丸子网格:初始化()
  self:创建格子(51, 51, 0, 0, 1, 1)
end
function 丸子网格:置物品(数据)
  for i = 1, #self.子控件 do
    if 数据  then
      local lssj = __物品格子.创建(当前)
      lssj:置物品(数据, nil, "宝宝赐福")
      self.子控件[i]:置精灵(lssj)
    else
      self.子控件[i]:置精灵()
    end
  end
end

function 丸子网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("1、赐福消耗#G1个仙露丸子#W。 2、锁定1个技能，#G5个仙露丸子#W。 " )
  end
end

local 赐福技能网格 = 赐福技能控件:创建网格("赐福技能网格", 19, 20, 320, 45)
function 赐福技能网格:初始化()
  self:创建格子(42, 42, 15, 19, 1, 4)
end

function 赐福技能网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr.数据 then
    self.子控件[a]._spr:详情打开(x, y+109)
  end
end

function 赐福技能网格:置技能对象(yiyou,linshi,技能)
  for n = 1, #赐福技能网格.子控件 do
    local lssj = __召唤兽技能格子.创建(当前)
    -- if 宝宝赐福.新赐福 then
      if linshi  and  linshi[n] then
        local 是否灰度=true
        for i=1,# 技能 do
          if 技能[i]==linshi[n] then
            是否灰度=false
            break
          end
        end
        lssj:置数据(linshi[n], 40, 40, nil, nil, yiyou[n], 是否灰度) 
      end
    -- else --显示老的赐福技能
    --   if yiyou  and  yiyou[n] then
    --     local 是否灰度=true
    --     for i=1,# 技能 do
    --       if 技能[i]==yiyou[n] then
    --         是否灰度=false
    --         break
    --       end
    --     end
    --     lssj:置数据(yiyou[n], 40, 40, nil, nil, nil, 是否灰度) 
    --   end
    -- end
    赐福技能网格.子控件[n]:置精灵(lssj)
  end
end

local 道具网格 = 宝宝赐福:创建网格("道具网格", 373-180, 132+100, 339, 272)
function 道具网格:初始化()
  self:创建格子(55, 55, 0, 0, 4, 5)
end
function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr.物品 then
    if 宝宝赐福.道具选中 and self.子控件[宝宝赐福.道具选中] and self.子控件[宝宝赐福.道具选中]._spr then
      self.子控件[宝宝赐福.道具选中]._spr.确定 = nil
    end
    self.子控件[a]._spr:详情打开(120, 86, w, h, "", a)
    宝宝赐福.道具选中 = a
    宝宝赐福.赐福技能控件.丸子网格:置物品(self.子控件[a]._spr.物品)
    self.子控件[a]._spr.确定 = true
    -- end
  end
end
function 道具网格:置物品(数据)
  for i = 1, #self.子控件 do
    if 数据[i] then
      local lssj = __物品格子.创建(当前)
      lssj:置物品(数据[i], nil, "宝宝赐福")
      lssj:置偏移(0, 0)
      self.子控件[i]:置精灵(lssj)
    else
      self.子控件[i]:置精灵()
    end
  end
end

--:到灰度()

local bb列表 = 宝宝赐福:创建列表("bb列表", 8, 239, 178, 220)
function bb列表:初始化()
  self:置文字(字体20)
  self.行高度 = 50
  self.行间距 = 0
end
function bb列表:重置头像()
  self:清空()
  for _, v in ipairs(宝宝赐福.宝宝列表) do
    local nsf = require("SDL.图像")(292, 50)
    if nsf:渲染开始() then
      if v.名称 and v.等级 then
        local lssj = 取头像(v.模型)
        if 0 == lssj[2] then
          lssj[2] = lssj[1]
        end
        --print(_)
        if 宝宝赐福.操作宝宝编号==_ then
          __res:getPNGCC(3, 1091, 374, 50, 50):拉伸(43,43):显示(3, 2)
          __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(35, 35):显示(8, 6)
          字体16:置颜色(__取颜色("红色"))
          字体16:取图像(v.名称):显示(75-21, 4)
          字体16:取图像(v.等级.. "级"):显示(75-21, 25)
          __res.UI素材[1]:复制区域(750, 275, 30, 30):拉伸(22,22):显示(32, 26)
        else
          __res:getPNGCC(3, 1091, 374, 50, 50):拉伸(43,43):到灰度():显示(3, 2)
          __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(35, 35):到灰度():显示(8, 6)
          字体16:置颜色(__取颜色("黑色"))
          字体16:取图像(v.名称):显示(75-21, 4)
          字体16:取图像(v.等级.. "级"):显示(75-21, 25)
        end
      end
      nsf:渲染结束()
    end
    local r = self:添加()
    r:置精灵(nsf:到精灵())
  end
end

function bb列表:左键弹起(x, y, i, item, msg)
  if 宝宝赐福.新赐福 then
    if 宝宝赐福.操作宝宝编号~=0 and 宝宝赐福.操作宝宝编号 ~= i then
      local 事件 = function()
        if 宝宝赐福.宝宝列表[i] then
          宝宝赐福.操作宝宝编号 = i
          self:重置头像()
          宝宝赐福.模型格子:置数据(宝宝赐福.宝宝列表[i], "召唤兽", 150-28, 225-37)
          宝宝赐福.新赐福=false
          宝宝赐福:加载赐福技能()
          宝宝赐福:按钮逻辑()
          宝宝赐福:锁定按钮初始化()
        end
      end
      local wb = "本次赐福效果尚未保存，是否放弃本次赐福结果？"
      多开数据[当前 or self and self.当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
    end
  else
    if 宝宝赐福.宝宝列表[i] then
      宝宝赐福.操作宝宝编号 = i
      self:重置头像()
      宝宝赐福.模型格子:置数据(宝宝赐福.宝宝列表[i], "召唤兽", 150-28, 225-37)
      宝宝赐福.新赐福=false
      宝宝赐福:加载赐福技能()
      宝宝赐福:按钮逻辑()
      宝宝赐福:锁定按钮初始化()
    end
  end
end

local function 取技能是否有高级(bb,jn)
	if bb==nil or jn==nil then return end
	local ssy=false
	for kn,vn in pairs(bb.技能) do
		local gjjn = "高级" ..jn
		if vn == jn or vn.名称 == jn then
			ssy=true
		end
		if vn == gjjn or vn.名称 == gjjn then
			ssy=true
			return gjjn,ssy
		end
	end
	return jn,ssy
end

function 宝宝赐福:加载赐福技能(内容)

	self.新赐福=false
  local 已有技能 = {}
  local 临时技能 = {}
  local bb = self.宝宝列表[self.操作宝宝编号]
  if bb and 内容 then
    self.丸子技能 = 内容.丸子赐福
    self.道具 = 内容.道具.道具
    for _, skill in pairs(self.丸子技能.技能) do
      local jn,cz = 取技能是否有高级(bb,skill)
      self.丸子技能.技能[_] = jn
    end
    self.新赐福=true
    self:按钮逻辑()

		self.赐福技能控件.赐福技能网格:置技能对象(已有技能,self.丸子技能.技能,self.宝宝列表[self.操作宝宝编号].技能)
    self.道具网格:置物品(self.道具)
    if self.道具网格.子控件[self.道具选中] and self.道具网格.子控件[self.道具选中]._spr  and self.道具网格.子控件[self.道具选中]._spr.物品 then
      self.赐福技能控件.丸子网格:置物品(self.道具网格.子控件[self.道具选中]._spr.物品)
    else
      self.赐福技能控件.丸子网格:置物品()
    end
	end
end


function 宝宝赐福:保存赐福(内容)
	-- local 已有技能 = {}
  -- local 临时技能 = {}
	-- local bb=self.宝宝列表[self.操作宝宝编号]
	-- if bb and 内容 then
  --   self.丸子技能 = 内容.丸子赐福
  --   for _, skill in pairs(self.丸子技能.技能) do
  --     local found = false
  --     for _, v in pairs(bb.技能) do
  --       if skill == v then
  --         found = true
  --         break
  --       end
  --     end
  --     if found then
  --       table.insert(已有技能, skill)
  --     else
  --       table.insert(临时技能, skill)
  --     end
  --   end
  --   self.新赐福=false
  --   self:按钮逻辑()
	-- 	self.赐福技能控件.赐福技能网格:置技能对象(已有技能,临时技能,self.宝宝列表[self.操作宝宝编号].技能)
  --   -- self.赐福技能控件.丸子网格:置物品(self.道具网格.子控件[self.道具选中]._spr.物品)
	-- end
end


local 赐福按钮 = 宝宝赐福:创建我的按钮(__res:getPNGCC(5, 905, 276, 56, 30):拉伸(70, 35), "赐福按钮", 190+41+130,132+45, "赐 福")
function 赐福按钮:左键弹起(x, y, msg)
  if 宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号] and 宝宝赐福.道具选中 then
    if not 宝宝赐福.赐福动画 then
      宝宝赐福.赐福动画 = true
      宝宝赐福.赐福:置首帧()
    end
  else
    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y/请选择要操作的宝宝和需要材料！')
  end
end

local 保存技能 = 宝宝赐福:创建我的按钮(__res:getPNGCC(5, 905, 276, 56, 30):拉伸(90, 35), "保存技能", 110+41+130-58-18,132+45, "保存技能")
function 保存技能:左键弹起(x, y, msg)
  if 宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号] and 宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号].认证码 == 宝宝赐福.丸子技能.认证码 then
    多开数据[当前 or self and self.当前].__UI弹出.赐福保存:打开({bb = 宝宝赐福.操作宝宝编号,认证码=宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号].认证码,锁定=宝宝赐福.锁定技能,技能=宝宝赐福.丸子技能.技能})
  else
    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y/选择的BB已变更，禁止作操')
  end
end

local 再次赐福 = 宝宝赐福:创建我的按钮(__res:getPNGCC(5, 905, 276, 56, 30):拉伸(90, 35), "再次赐福", 130+41+130+70-18,132+45, "再次赐福")
function 再次赐福:左键弹起(x, y, msg)
  if 宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号] and 宝宝赐福.道具选中 then
    if not 宝宝赐福.赐福动画 then
      宝宝赐福.赐福动画 = true
      宝宝赐福.赐福:置首帧()
    end
  else
    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y/请选择要操作的宝宝和需要材料！')
  end
end
-------------------------------------------------------C改锁定
for i=1,4 do
  local 临时函数 = 宝宝赐福:创建我的按钮(__res:getPNGCC(5, 905, 276, 56, 30):拉伸(50, 32), "锁定按钮"..i, 210-192+(i-1)*61+190,44+5+70, "锁定")
  function 临时函数:左键按下(消息, x, y)
    if 赐福技能网格.子控件[i]._spr then
      local 当前锁定数 = 0
      for k,v in pairs(宝宝赐福.锁定技能) do
        if v ~= nil then
          当前锁定数 = 当前锁定数 + 1
        end
      end
      if 宝宝赐福.锁定技能[i] == nil then
        if 当前锁定数 >= 2 then
          多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y/最多只能锁定2个技能！')
          return  
        end
        宝宝赐福.锁定技能[i] = {名称=赐福技能网格.子控件[i]._spr.数据.名称}
        self:我的按钮置文字(宝宝赐福["锁定按钮"..i],__res:getPNGCC(5, 905, 276, 56, 30):拉伸(50, 32), "解锁")
      else
        宝宝赐福.锁定技能[i] = nil
        self:我的按钮置文字(宝宝赐福["锁定按钮"..i],__res:getPNGCC(5, 905, 276, 56, 30):拉伸(50, 32), "锁定")
      end
    end
  end
end
-------------------------------------------------------C改锁定


function 宝宝赐福:锁定按钮初始化()
  self.锁定技能={}
  for i=1,4 do
    self["锁定按钮"..i]:我的按钮置文字(宝宝赐福["锁定按钮"..i],__res:getPNGCC(5, 905, 276, 56, 30):拉伸(50, 32), "锁定")
  end

end

local 技能列表按钮 = 宝宝赐福:创建我的按钮(__res:取图像(__res:取地址("shape/ui/", 0x91000001)), "技能列表按钮", 63+17, 424+5-369)
function 技能列表按钮:左键弹起(x, y, msg)
  if 宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号] then
    多开数据[当前 or self and self.当前].__UI弹出.召唤兽技能弹出:打开(宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号].技能,宝宝赐福.宝宝列表[宝宝赐福.操作宝宝编号].丸子技能)
  end
end

local 关闭 = 宝宝赐福:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 605-40-48-87, 0)
function 关闭:左键弹起(x, y, msg)
  宝宝赐福:置可见(false)
end