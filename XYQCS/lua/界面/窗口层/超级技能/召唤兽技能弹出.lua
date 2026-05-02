-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2024-07-11 20:49:28
-- @Last Modified time  : 2024-07-11 21:54:23
多开数据[多开数据.当前].__UI弹出.召唤兽技能弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("召唤兽技能弹出", 194+43-64 + abbr.py.x, 174-48+26 + abbr.py.y, 704, 205)
local 召唤兽技能弹出 = 多开数据[多开数据.当前].__UI弹出.召唤兽技能弹出
local 仓库选择 = 多开数据[多开数据.当前].__UI弹出.仓库选择
local 当前 = 多开数据.当前
function 召唤兽技能弹出:初始化()
  local nsf = require("SDL.图像")(704, 205)
  if nsf:渲染开始() then
    取黑色背景(0, 0, 678, 205, true):置透明(220):显示(0, 0)
    local gezi=__res:getPNGCC(3, 1091, 374, 50, 50)
    字体18:置颜色(__取颜色("白色"))
    字体18:取图像("可赐福技能"):显示(37+21,12)
    字体18:取图像("不可赐福技能"):显示(291,12)
    字体18:取图像("当前赐福技能"):显示(291+230,12)
    __res:getPNGCC(1, 1056, 50, 3, 198):置颜色(4,255,255):显示(448/2,2)--线
    __res:getPNGCC(1, 1056, 50, 3, 198):置颜色(4,255,255):显示(458,2)--线
    local aa,bb=1,1
    for i=1,12 do
      gezi:显示(200+(aa-1)*50-178-12,18+(bb-1)*50+20)
      gezi:显示(200+(aa-1)*50-178-12+230,18+(bb-1)*50+20)
      gezi:显示(200+(aa-1)*50-178-12+460,18+(bb-1)*50+20)
      aa=aa+1
      if aa>=5 then
        aa=1
        bb=bb+1
      end
    end
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
end

function 召唤兽技能弹出:打开(data,丸子技能)
  self:置可见(true)
  self.技能表=data or {}
  self.丸子技能=丸子技能 or {}
  self.kecifu:加载可赐福技能()
  self.bukecifu:加载不可赐福技能()
  self.yicifu:加载赐福技能()
  --self[self.状态]:置选中(true)
 -- self:重置()
  -- table.print(data)
end
local kecifu = 召唤兽技能弹出:创建网格("kecifu", 22-12, 38, 206, 154)
function kecifu:初始化()
end
function kecifu:左键弹起(x, y, a, b, msg)
  if not self.子控件[a] or not self.子控件[a]._spr or not self.子控件[a]._spr.模型 then
    return
  end
  self.子控件[a]._spr:详情打开(x, 86, w, h, "", a)
end
function kecifu:加载可赐福技能()
  local  jn000={}
  for i=1,#召唤兽技能弹出.技能表 do
		if 超级技能转换表[召唤兽技能弹出.技能表[i]] then
			jn000[#jn000+1]=召唤兽技能弹出.技能表[i]
    end
  end
  self:创建格子(50, 50, 0, 0, 6, 4)
  local jn={}
  for i = 1, #jn000 do
    jn[i]={名称=jn000[i]}
  end
  for i = 1, #jn do
    if jn[i] then
      local lssj = __40格子.创建(当前)
      -- print(坐骑技能栏.物品组[i].名称)
      lssj:置数据(jn[i], 40,40 )
      self.子控件[i]:置精灵(lssj)
    else
      local lssj = __40格子.创建(当前)
      -- print(坐骑技能栏.物品组[i].名称)
      lssj:置数据(sdw[i], 40,40)
      self.子控件[i]:置精灵(lssj)
    end
  end
end

local bukecifu = 召唤兽技能弹出:创建网格("bukecifu", 22-12+231, 38, 206, 154)
function bukecifu:初始化()
end
function bukecifu:左键弹起(x, y, a, b, msg)
  if not self.子控件[a] or not self.子控件[a]._spr or not self.子控件[a]._spr.模型 then
    return
  end
  self.子控件[a]._spr:详情打开(x, 86, w, h, "", a)
end
function bukecifu:加载不可赐福技能()
  local  jn000={}
  for i=1,#召唤兽技能弹出.技能表 do
		if 召唤兽技能弹出.技能表[i] and not 超级技能转换表[召唤兽技能弹出.技能表[i]] then
			jn000[#jn000+1]=召唤兽技能弹出.技能表[i]
    end
  end
  self:创建格子(50, 50, 0, 0, 6, 4)
  local jn={}
  for i = 1, #jn000 do
    jn[i]={名称=jn000[i]}
  end
  for i = 1, #jn do
    if self.子控件[i] then
      if jn[i] then
        local lssj = __40格子.创建(当前)
        -- print(坐骑技能栏.物品组[i].名称)
        lssj:置数据(jn[i], 40,40 )
        self.子控件[i]:置精灵(lssj)
      else
        local lssj = __40格子.创建(当前)
        -- print(坐骑技能栏.物品组[i].名称)
        lssj:置数据(sdw[i], 40,40)
        self.子控件[i]:置精灵(lssj)
      end
    end
  end
end

local yicifu = 召唤兽技能弹出:创建网格("yicifu", 22-12+231+230, 38, 206, 154)
function yicifu:初始化()
end

function yicifu:左键弹起(x, y, a, b, msg)
  if not self.子控件[a] or not self.子控件[a]._spr or not self.子控件[a]._spr.模型 then
    return
  end
  self.子控件[a]._spr:详情打开(x, 86, w, h, "", a)
end

function yicifu:加载赐福技能()
  self:创建格子(50, 50, 0, 0, 1, 4)
  for i = 1, #召唤兽技能弹出.丸子技能 do
    if 召唤兽技能弹出.丸子技能[i] then
      local lssj = __40格子.创建(当前)
      -- print(坐骑技能栏.物品组[i].名称)
      lssj:置数据(召唤兽技能弹出.丸子技能[i], 40,40 )
      self.子控件[i]:置精灵(lssj)
    end
  end
end
