-- @Author: baidwwy
-- @Date:   2025-06-06 22:35:31
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-06-07 22:48:04
local 门派奇袭法术={
    女儿村= {莲步轻舞=1,如花解语=1,似玉生香=1,娉婷袅娜=1},
    神木林= {尘土刃=1,荆棘舞=1,冰川怒=1},
    大唐官府= {翩鸿一击=1,杀气诀=1,反间之计=1},
    化生寺= {金刚护法=1,韦陀护法=1,金刚护体=1,一苇渡江=1,我佛慈悲=1,推拿=1,活血=1,佛法无边=1},
    方寸山= {催眠符=1,失心符=1,落魄符=1,失忆符=1,追魂符=1,离魂符=1,失魂符=1,定身符=1,碎甲符=1,分身术=1,凝神术=1},
    盘丝洞= {魔音摄魂=1,含情脉脉=1,瘴气=1},
    无底洞= {移魂化骨=1,明光宝烛=1,金身舍利=1},
    狮驼岭= {变身=1,威慑=1,狮搏=1,魔息术=1},
    魔王寨= {牛劲=1,三昧真火=1,火甲术=1,飞星坠落=1},
    阴曹地府= {幽冥鬼眼=1,尸腐毒=1,还阳术=1,魂飞魄散=1},
    普陀山= {普渡众生=1,杨柳甘露=1,颠倒五行=1,灵动九天=1,自在心法=1},
    天宫= {天神护体=1,知己知彼=1,天神护法=1,镇妖=1,错乱=1,百万神兵=1,金刚镯=1,掌心雷=1,五雷轰顶=1},
    凌波城= {碎星诀=1,镇魂诀=1,裂石=1,断岳势=1,腾雷=1},
    五庄观= {炼气化神=1,生命之泉=1,三花聚顶=1,日月乾坤=1},
    龙宫= {龙腾=1,神龙摆尾=1,龙战于野=1},
    花果山= {八戒上身=1,移星换斗=1,威震灵霄=1,气慑天军=1,大圣驾临=1},
    九黎城= {枫影二刃=1,一斧开天=1,铁风撼盾=1}
} --可用的技能
local 加血道具={驱赶烟花=4,金创药=5,小还丹=5,千年保心丹=5,金香玉=5,五龙丹=5,翡翠豆腐=5,佛跳墙=5,蛇蝎美人=5,风水混元丹=5,定神香=5,十香返生丸=5,佛光舍利子=5,
    九转回魂丹=5,珍露酒=5,虎骨酒=5,女儿红=5,蛇胆酒=5,醉生梦死=5,梅花酒=5,百味酒=5,天不老=5,紫石英=5,血色茶花=5,熊胆=5,鹿茸=5,六道轮回=5,凤凰尾=5,
    硫磺草=5,龙之心屑=5,火凤之睛=5,四叶花=5,天青地白=5,七叶莲=5,丁香水=5,月星子=5,仙狐涎=5,地狱灵芝=5,麝香=5,血珊瑚=5,餐风饮露=5,白露为霜=5,天龙水=5,
    孔雀红=5,紫丹罗=5,佛手=5,旋复花=5,龙须草=5,百色花=5,香叶=5,白玉骨头=5,鬼切草=5,灵脂=5,曼陀罗花=5,乾坤袋=4,逍遥镜=2}
    
local 取可用道具 = function(名称)
  if 加血道具[名称] then
    return 加血道具[名称]
  end
  return 0
end
local GGF = require("GGE.函数")
local SDL = require("SDL")
local 界面宽高 = {
  [1] = {370,406},
  [2] = {370,406},
  [3] = {365,406},
}
local 界面坐标 = {
  [1] = {250+abbr.py.x,0},
  [2] = {250+abbr.py.x,0+abbr.py.y},
  [3] = {250+abbr.py.x,0+abbr.py.y},
}
local 奇袭界面 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("奇袭界面", 130 + abbr.py.x, 20 + abbr.py.y, 549, 404)
local 当前=多开数据.当前
function 奇袭界面:初始化()
end

function 奇袭界面:打开(sj技能组,界面类型,x门派,道具data,s助战)
  self:置可见(true)
  self.x门派 = x门派
  self.选中道具 = nil
  self.介绍文本:清空()
  self.愤怒文本:清空()

  self.s助战 = s助战
  if 界面类型 == "法术" then
    self.背景 = 1
    self.使用按钮:置可见(false)
    self.技能网格:置可见(true)
    self.道具网格:置可见(false)
    self.技能网格:置技能(sj技能组)
  elseif 界面类型 == "特技" then
    self.背景 = 2
    self.使用按钮:置可见(false)
    self.技能网格:置可见(true)
    self.道具网格:置可见(false)
    local function 奇袭技能有(shuju,mc)
      for k,v in ipairs(shuju) do
        if v == mc then
          return true
        end
      end
      return false
    end
    local 技能组 = GGF.复制表(sj技能组)
    local 技能组2 = {}
    local data = {}
    for k,v in pairs(技能组[1]) do
      local bh = #技能组2 + 1
      技能组2[bh] = GGF.复制表(v)
      if 奇袭技能有(技能组[2],v.名称) then
        技能组2[bh].s禁止 = false
        技能组2[bh].px = 99
        table.insert(data,v.名称)
      else
        技能组2[bh].s禁止 = true
        技能组2[bh].px = 1
      end
    end
    table.sort(技能组2,function(a,b) return a.px>b.px end)
    self.技能网格:置技能(技能组2)
    local xxx = ""
    if #data > 0 then
      xxx = table.concat(data,"、")
      self.介绍文本:置文本("可用奇袭特技：" ..xxx)
      self.操作对象愤怒=多开数据[当前].__UI界面.界面层.战斗界面.参战单位[ 多开数据[当前].__UI界面.界面层.战斗界面.单位编号[ 多开数据[当前].__UI界面.界面层.战斗界面.操作对象]].愤怒
      self.愤怒文本:置文本("当前愤怒" ..self.操作对象愤怒)
    end
  elseif 界面类型 == "道具" then
    self.背景 = 3
    self.使用按钮:置可见(true)
    self.道具网格:置可见(true)
    self.技能网格:置可见(false)
    self.物品 = {}
    self.奇袭道具 = (sj技能组 ~= nil and type(sj技能组)=="table") and sj技能组 or {}
    for n=1,20 do
      local daoju = (道具data ~= nil and type(道具data)=="table") and 道具data or {}
      if 道具data[n] then
        self.物品[n] = GGF.复制表(道具data[n])
        if self:是可用奇袭道具(self.物品[n].名称) then
          self.物品[n].s禁止 = false
        else
          self.物品[n].s禁止 = true
        end
      end
    end
    self.道具网格:置物品()
    local xxx = ""
    if #self.奇袭道具 > 0 then
      xxx = table.concat(self.奇袭道具,"、")
      self.介绍文本:置文本("可用奇袭道具：" ..xxx)
      
    end
  end
  self:界面重置()
end

function 奇袭界面:界面重置()
  self.介绍文本:置坐标(10,界面宽高[self.背景][2]-75)
  self.愤怒文本:置坐标(140,60)

  self:置宽高(界面宽高[self.背景][1],界面宽高[self.背景][2])
  self:置坐标(界面坐标[self.背景][1],界面坐标[self.背景][2])
  local nsf = require("SDL.图像")(界面宽高[self.背景][1],界面宽高[self.背景][2])
  if nsf:渲染开始(0, 0, 0, 0) then
    字体20:置颜色(255, 255, 255)
    if self.背景 == 1 or self.背景 == 2 then
      __res:getPNGCC(2, 0, 63, 354, 396):显示(0,12)
      local xxx = "奇袭法术"
      if self.背景 == 2 then
        xxx = "奇袭特技"
      end
      local 宽度 = 字体20:取宽度(xxx)
      字体20:取图像(xxx):显示(177.0 - 宽度 / 2, 25)
    else
      __res:getPNGCC(2, 0, 63, 354, 396):显示(0,12)
      local 宽度 = 字体20:取宽度("奇袭道具")
      字体20:取图像("奇袭道具"):显示(177.0 - 宽度 / 2, 25)
    end
    nsf:渲染结束()
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.关闭:置坐标(界面宽高[self.背景][1]-50,0)
end

--=====================================================================技能网格
local 技能网格 = 奇袭界面:创建网格("技能网格", 18, 65, 340, 320)
function 技能网格:初始化()
  self:创建格子(100, 100, 15, 12, 9, 3, true)
end

-- 修改左键弹起事件，实现双击效果
function 技能网格:左键弹起(x, y, a, b, msg)
  if 奇袭界面.背景 == 1 or 奇袭界面.背景 == 2 then
    if self.子控件[a]._spr and not self.子控件[a].技能信息.剩余冷却回合 and not self.子控件[a].技能信息.s禁止 then
      -- 使用类似战斗法术界面的双击逻辑
      if not 奇袭界面.选中 or 奇袭界面.选中 ~= a then
        -- 第一次点击，只选中不高亮
        奇袭界面.选中 = a
        -- 可以在这里添加选中效果，比如更新技能图标显示选中状态
      else
        -- 第二次点击（双击），执行技能使用
        if 奇袭界面.s助战 then
          奇袭界面.选中 = a
          奇袭界面:置可见(false)
          多开数据[当前].__UI界面.窗口层.助战法术:置可见(false)
          多开数据[当前].__UI界面.界面层.助战操作界面:设置奇袭法术(self.子控件[a].技能信息,"法术")
        else
          奇袭界面.选中 = a
          奇袭界面:置可见(false)
          多开数据[当前].__UI界面.界面层.战斗界面:置可见(true)
          多开数据[当前].__UI界面.界面层.战斗界面:设置奇袭法术(self.子控件[a].技能信息,"法术",true)
        end
      end
    end
  end
end

function 技能网格:置技能(data)
  self.技能数据 = data
  for i = 1, #技能网格.子控件 do
    if self.技能数据[i] then
      local nsf = require("SDL.图像")(100, 100)
      local lssc = 取技能信息(self.技能数据[i].名称, "人物")
      if nsf:渲染开始() then
        nsf:渲染清除(0, 0, 0, 255)
        if 奇袭界面.背景 == 1 then
          self.技能数据[i].s禁止 = 奇袭界面:奇袭技能禁止(奇袭界面.x门派,self.技能数据[i].名称)
        end
        
        -- 添加选中效果
        if 奇袭界面.选中 == i then
          -- 选中状态显示
          __res:取图像(__res:取地址("shape/ui/zhs/", 0x414C4F06)):拉伸(100, 100):显示(0, 0)
        end
        
        __res:取图像(__res:取地址("shape/jn/", lssc[7])):拉伸(55, 55):显示(20, 20)
        if self.技能数据[i].剩余冷却回合 or self.技能数据[i].s禁止 then
          __res:取图像(__res:取地址("shape/ui/zhs/", 1094234215)):拉伸(44, 44):显示(25, 25)
        end
        
        多开数据[当前].__主控.公用蒙版2:显示(-4, -3)
        local 宽度 = 字体20:取宽度(self.技能数据[i].名称)
        字体18:置颜色(255, 255, 255)
        字体18:取图像(self.技能数据[i].名称):显示(50.0 - 宽度 / 2, 80)
        nsf:渲染结束()
      end
      local sc = nsf:到精灵()
      技能网格.子控件[i]:置精灵(sc)
      技能网格.子控件[i].技能信息 = self.技能数据[i]
      技能网格.子控件[i].技能信息.s禁止 = self.技能数据[i].s禁止
    else
      技能网格.子控件[i]:置精灵(nil)
    end
  end
end
--=====================================================================道具网格
local 道具网格 = 奇袭界面:创建网格("道具网格", 17, 65, 339, 272)
function 道具网格:初始化(data)
  self:创建格子(67, 67, 0, 0, 4, 5)
end



function 道具网格:置物品(data)
  for i = 1, #self.子控件 do
    if 奇袭界面.物品[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj,奇袭界面.物品[i], "白格子", "战斗道具")
      if 奇袭界面.物品[i].s禁止 then
        lssj:置禁止(true)
      end
      self.子控件[i]:置精灵(lssj)
      local keyong = 取可用道具(奇袭界面.物品[i].名称)
      if keyong == 0 then
        self.子控件[i]._spr.物品禁止 = true
      else
        self.子控件[i]._spr.命令附加 = keyong
      end
    else
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj,nil, "白格子", "战斗道具")
      self.子控件[i]:置精灵(lssj)
    end
  end
end

-- function 道具网格:左键弹起(x, y, a, b, msg)
--   if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品禁止"] then
--     local x, y = self.子控件[a]["取坐标"](self.子控件[a])
--     local w, h = self.子控件[a]["取宽高"](self.子控件[a])
--     if 镶嵌道具选择["选中道具"] and self.子控件[镶嵌道具选择["选中道具"]]._spr["物品"] then
--       self.子控件[镶嵌道具选择["选中道具"]]._spr["确定"] = nil
--     end
--     镶嵌道具选择["选中道具"] = a
--     self.子控件[a]._spr["确定"] = true
--     self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170-95, 86, w, h, "选择", a)
--   end
-- end

function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品禁止"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    -- if 奇袭界面.选中道具 and self.子控件[奇袭界面.选中道具] and self.子控件[奇袭界面.选中道具]._spr then
    --   self.子控件[奇袭界面.选中道具]._spr.确定 = nil
    -- end
    if 奇袭界面["选中道具"] and self.子控件[奇袭界面["选中道具"]]._spr["物品"] and self.子控件[奇袭界面.选中道具]._spr then
      self.子控件[奇袭界面["选中道具"]]._spr["确定"] = nil
    end
    奇袭界面["选中道具"] = a
    self.子控件[a]._spr["确定"] = true
    -- self.子控件[a]._spr:详情打开(190, 86, w, h)
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 190, 86, w, h)
  end
end
function 奇袭界面:是可用奇袭道具(xxx)
  for k,v in pairs(奇袭界面.奇袭道具) do
    if v == xxx then
      return true
    end
  end
  return false
end
--=====================================================================
function 奇袭界面:奇袭技能禁止(x门派,jn)
  if x门派 and 门派奇袭法术[x门派] and 门派奇袭法术[x门派][jn] then
    return false
  end
  return true
end

local 使用按钮 = 奇袭界面:创建我的按钮(__res:getPNGCC(2, 493, 765, 118, 35, true), "使用按钮", 210, 340, "使用")
function 使用按钮:左键弹起(x, y, msg)
  if 奇袭界面.选中道具 and 奇袭界面.道具网格.子控件[奇袭界面.选中道具] and 奇袭界面.道具网格.子控件[奇袭界面.选中道具]._spr then
    if 奇袭界面.s助战 then
      多开数据[当前].__UI界面.界面层.助战操作界面:设置奇袭道具(奇袭界面.选中道具,奇袭界面.道具网格.子控件[奇袭界面.选中道具]._spr.命令附加)
    else
      多开数据[当前].__UI界面.界面层.战斗界面:设置奇袭道具(奇袭界面.选中道具,奇袭界面.道具网格.子控件[奇袭界面.选中道具]._spr.命令附加)
    end
    奇袭界面:置可见(false)
  end
end

local 关闭 = 奇袭界面:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 350, 0)
function 关闭:左键弹起(x, y, msg)
  奇袭界面:置可见(false)
end


local 介绍文本 = 奇袭界面:创建文本("介绍文本", 10, 0, 330, 70)
function 介绍文本:初始化()
end

local 愤怒文本 = 奇袭界面:创建文本("愤怒文本", 10, 0, 330, 70)
function 愤怒文本:初始化()
end