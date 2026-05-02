local 首冲奖励 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("首冲奖励",80+67 + abbr.py.x, 20 + abbr.py.y,696, 492)
local 当前=多开数据.当前

-- 新增：当前选择的宠物类型
首冲奖励.当前类型 = "法宠"  -- 默认选择法术型

function 首冲奖励:初始化()
  local nsf = require("SDL.图像")(696, 492)
  if nsf["渲染开始"](nsf) then
      __res:取图像(__res:取地址("shape/pic/", 0xCF000003)):显示(0,0)
      字体16:置颜色(__取颜色("白色"))
  end
  self.允许移动 = true
  self:置精灵(nsf["到精灵"](nsf))
end
function 首冲奖励:获取当前宠物()
  if not self.数据 or not self.数据.宠物 then return nil end
  
  if self.当前类型 == "攻宠" then
    return self.数据.宠物.攻宠
  else
    return self.数据.宠物.法宠
  end
end

function 首冲奖励:切换类型(类型)
  if self.当前类型 ~= 类型 then
    self.当前类型 = 类型
    self:更新宠物显示()
  end
end

function 首冲奖励:更新宠物显示()
  local 当前宠物 = self:获取当前宠物()
  if 当前宠物 then
    self.模型:重置(当前宠物.模型)
    if 当前宠物.技能 then
      self.技能网格:置数据(当前宠物.技能)
    end
    self:重置资质()
  end
end

function 首冲奖励:打开(内容)
  self:置可见(true)
  self.数据 = 内容
  self.当前类型 = "法宠"
  self.道具网格:置物品(self.数据.奖励)
  self.法术型:置选中(true)

  self:更新宠物显示()
end

function 首冲奖励:重置资质()
  local nsf = require("SDL.图像")(700, 500)
  if nsf["渲染开始"](nsf) then
      字体15:置颜色(__取颜色("浅黑"))
      
      -- 获取当前宠物数据
      local 当前宠物 = self:获取当前宠物()
      if not 当前宠物 then return end
      
      local 资质名称 = {"攻资", "防资", "体资", "法资", "速资"}
      local xx = 445 
      local yy = 260
      local yyyy = 25
      local xxxx = 95  
       
      for i = 1, #资质名称 do
        local 名称 = 资质名称[i]
        local 行 = math.floor((i - 1) / 2) 
        local 列 = (i - 1) % 2 
        
        -- 从当前宠物数据中获取资质
        local 资质值
        if 当前宠物.资质 and type(当前宠物.资质) == "table" then
          资质值 = 当前宠物.资质[i] or 当前宠物.资质[名称]
        end
        
        local 显示x = xx + (列 * xxxx)
        local 显示y = yy + (行 * yyyy)
        
        if 资质值 then
          local 显示文本 = 名称 .. "：" .. 资质值
          字体15:取图像(显示文本):显示(显示x, 显示y)
        end
      end
      
      if 当前宠物.成长 then
        字体15:取图像("成长：" .. 当前宠物.成长):显示(xx + 95, yy + 50)
      end
      local 大头像 = 取头像(当前宠物.模型)
      if 大头像 and 大头像[4] then
        __res:取图像(__res:取地址("shape/mx/", 大头像[4])):显示(135,140) 
      end

    nsf["渲染结束"](nsf)
  end
  首冲奖励.模型.资质图像 = nsf:到精灵()
end

local 模型 = 首冲奖励:创建控件("模型",0,0,640,460)
function 模型:重置(模型)
    local lss = 取战斗模型(模型)
    local lss1 = 取战斗模型(模型.."_装饰")
    self.召唤兽模型 = __res:取动画2(__res:取地址("shape/mx/", lss[6])):置方向(0):置循环(true)
    if lss1[6] then
      self.召唤兽模型装饰 = __res:取动画2(__res:取地址("shape/mx/", lss1[6])):置方向(0):置循环(true)
    end
end

function 模型:更新(dt)
    self.召唤兽模型:更新(dt)
    if self.召唤兽模型装饰 then
      self.召唤兽模型装饰:更新(dt)
    end
end

function 模型:显示(x,y)
    self.召唤兽模型:显示(x+535,y+230)
    if self.召唤兽模型装饰 then
      self.召唤兽模型装饰:显示(x+535,y+230)
    end
    if self.资质图像 then
        self.资质图像:显示(x, y)  -- 注意坐标，可能需要调整
    end
end

local 技能网格 = 首冲奖励:创建网格("技能网格", 450, 330, 273, 202)
function 技能网格:初始化()
    self:创建格子(35, 35, 1, 1, 2, 4, true)
end

function 技能网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        self.子控件[a]._spr:详情打开(x, y)
    end
end

function 技能网格:置数据(数据, 认证)
    for i = 1, #self.子控件 do
        local lssj = __召唤兽技能格子.创建(当前)
        if 认证 and i == 认证 then
            认证 = 数据[i]
        end
        lssj:置数据(数据[i], 35, 35, nil, 认证, nil, nil, true)
        self.子控件[i]:置精灵(lssj)
    end
end

local 道具网格 = 首冲奖励["创建网格"](首冲奖励, "道具网格", 65, 360, 350, 200)
function 道具网格:左键弹起(x, y, a, b, msg)
  if 首冲奖励["材料位置"] and self.子控件[首冲奖励["材料位置"]] then
    self.子控件[首冲奖励["材料位置"]]._spr["确定"] = nil
  end
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
   self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", a)
  end
end

function 道具网格:置物品(data)
  首冲奖励["材料位置"] = nil
  self:创建格子(65, 85, 0, 0,6, 6)
  for i = 1, #self.子控件 do
    if data[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], nil, "首冲奖励")
      lssj["置偏移"](lssj, 5, 5)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end

local 物理型 = 首冲奖励:创建我的单选按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(80,30), __res:getPNGCC(1, 963, 495, 175, 43, true):置拉伸(80,30),"物理型", 420+128, 120, "物理型")
function 物理型:左键弹起(消息,x,y)
    首冲奖励:切换类型("攻宠")
end
local 法术型 = 首冲奖励:创建我的单选按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(80,30), __res:getPNGCC(1, 963, 495, 175, 43, true):置拉伸(80,30),"法术型", 420, 120, "法术型")
function 法术型:左键弹起(消息,x,y)
    首冲奖励:切换类型("法宠")
end

local 关闭 = 首冲奖励:创建我的按钮(__res:取图像(__res:取地址("shape/pic/", 0xCF000002)), "关闭", 530, 50)

function 关闭:左键弹起(x, y, msg)
  首冲奖励["置可见"](首冲奖励, false)
end