--[[
Author: GGELUA
Date: 2023-11-01 12:30:35
Last Modified by: GGELUA
Last Modified time: 2023-11-01 16:14:43
--]]
--[[
Author: GGELUA
Date: 2023-05-23 20:33:27
Last Modified by: GGELUA
Last Modified time: 2023-06-11 12:53:05
--]]
local UI模型格子 = class("UI模型格子")
local ggf = require("GGE.函数")
function UI模型格子:初始化(当前)
  self.动画 = {}
  self.x, self.y = 0, 0
  self.当前=当前
end
function UI模型格子:置数据(数据, 类型, x, y, 附加,方向)
  self.动画 = {}
  self.数据=数据
  local 加入数据 = ggf.insert(self.动画)
  if not 数据 then
    self.x, self.y = 0, 0
    return
  end
  if 方向 == nil then 方向 = 1 end
  if 数据.商城类型  then
    self.确定格子=取白色背景(0,0,410,172,true):拉伸(200,200):到精灵()
    if "战锦商品" == 类型 then
      local nsf = require('SDL.图像')(200,200)
            if nsf:渲染开始() then
             取灰色背景(0,0,410,172,true):拉伸(200,200):显示(0,0)
             字体18:置颜色(__取颜色('白色'))
             字体18:取图像(数据.名称):显示(80,165)
             字体18:取图像(数据.价格):显示(80,180)
                nsf:渲染结束()
            end
       self.模型 = nsf:到精灵()
      local lssj =取祥瑞模型(多开数据[多开数据.当前].角色信息.模型,数据.名称)
       tcp = __res:取动画2(__res:取地址('shape/mx/zj/',lssj[1])):置方向(方向):置循环(true)
       加入数据(tcp)
    end
   elseif "角色" == 类型 then
    local lssj
    local 允许武器=true
    local 修正武器子类=false
    if 数据.锦衣 and 数据.锦衣[2] and 数据.装备 and 数据.装备[3] and 数据.装备[3].子类==910 then
        数据.装备[3].子类=8
        修正武器子类=true
    end
    if 数据.锦衣 and 数据.锦衣[2] and 数据.装备 and 数据.装备[4] and 数据.装备[4].子类==911 then
        修正武器子类=true
    end
    -- 1. 处理锦衣
    if 数据.锦衣 and 数据.锦衣[1] then
      local 锦衣名称 = 数据.锦衣[1].名称
      if type(数据.锦衣[1]) == "string" then
        锦衣名称 = 数据.锦衣[1]
      end
      
      -- 特殊锦衣处理
      if 锦衣名称=="青花瓷月白" or 锦衣名称=="龙行玉泽" or 锦衣名称=="萌龙咆哮" or 锦衣名称=="胖胖龙" or 锦衣名称=="黑麒麟" or 锦衣名称=="锦鲤" or 锦衣名称=="青花瓷月黑" or 锦衣名称=="灼灼韶华" or 锦衣名称=="齐天大圣月白" or 锦衣名称=="齐天大圣月黑" then
        允许武器 = false
        lssj =取祥瑞模型(数据.模型,锦衣名称)
      else
        local 武器类型 = nil
        if 数据.装备 and 数据.装备[3] then 
          武器类型 = 多开数据[self.当前].__主控.取武器子类(数据.装备[3].子类) 
          lssj = 取普通锦衣模型(锦衣名称, 数据.模型, 数据.装备[3].子类)
        else
          lssj = 取普通锦衣模型(锦衣名称, 数据.模型)
          武器类型 = nil
        end
        -- lssj = 取模型(数据.模型,nil,nil,锦衣名称,武器类型)
      end
    end
    
    -- 2. 处理光环
    if 数据.锦衣 and 数据.锦衣[3] then
      local n = 取光环(数据.锦衣[3].名称)
      加入数据(__res:取动画(__res:取地址("shape/mx/", n[1])):取动画(方向):置当前帧(1):播放(true))
    end
    local 主体模型创建 = false
    if 数据.装备 and 数据.装备[3] then
      local m = 多开数据[self.当前].__主控.取武器子类(数据.装备[3].子类)
      if 数据.锦衣 and 数据.锦衣[1] then
        tcp = __res:取动画2(__res:取地址('shape/mx/zj/',lssj[1])):置方向(方向):置循环(true)
      else
        lssj = 取模型(数据.模型, m)
        tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(方向):置循环(true)
        if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil then
          __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2],数据.染色组[3])
        end
      end
      加入数据(tcp)
      主体模型创建 = true
      -- 4. 处理主武器模型
      if 允许武器 then
        local 资源='shape/mx/'
        if 数据.装备[3].级别限制 then 数据.装备[3].等级 = 数据.装备[3].级别限制 end
        local m = 多开数据[self.当前].__主控:取武器附加名称(数据.装备[3].子类, 数据.装备[3].等级, 数据.装备[3].名称)
        lssj = 取模型(m .. "_" .. 数据.模型)

        if 数据.锦衣 and 数据.锦衣[2] then
          if 数据.锦衣[2].名称=="恶魔棘刺" then
            lssj = 取普通武器装扮(数据.锦衣[2].名称,数据.模型)
          else
            lssj = 取普通武器装扮(数据.锦衣[2].名称,数据.模型,数据.装备[3].子类)
          end
          资源='shape/mx/zj3/'
        end

        tcp1 = __res:取动画2(__res:取地址(资源, lssj[1])):置方向(方向):置循环(true)
        if 数据.装备[3].染色组 and 数据.装备[3].染色方案 and 数据.装备[3].染色方案 ~= 0 and 数据.装备[3].染色组[1] ~= nil then
          __res:置染色(tcp1, 数据.装备[3].染色方案, 数据.装备[3].染色组[1], 数据.装备[3].染色组[2])
        end
        加入数据(tcp1)
      end
    end
    
    -- 5. 如果没有主武器，创建基础主体模型
    if not 主体模型创建 then
      if 数据.锦衣 and 数据.锦衣[1] then
        tcp = __res:取动画2(__res:取地址('shape/mx/zj/',lssj[1])):置方向(方向):置循环(true)
      else
        lssj = 取模型(数据.模型)
        tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(方向):置循环(true)
        if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil then
          __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2],数据.染色组[3])
        end
      end
      加入数据(tcp)
    end
    if not 修正武器子类 and 允许武器 and 数据.装备 and 数据.装备[4] and 数据.装备[4].名称 and 数据.装备[4].子类==911 then
      if 数据.装备[4].级别限制 then 
        数据.装备[4].等级 = 数据.装备[4].级别限制 
      end
      local m = 多开数据[self.当前].__主控:取武器附加名称(数据.装备[4].子类, 数据.装备[4].等级, 数据.装备[4].名称)
      local 副武器模型 = 取模型(m .. "_" .. 数据.模型)
      if 副武器模型 and 副武器模型[1] then
        local 副武器动画 = __res:取动画2(__res:取地址('shape/mx/', 副武器模型[1])):置方向(方向):置循环(true)
        if 数据.装备[4].染色组 and 数据.装备[4].染色方案 and 数据.装备[4].染色方案 ~= 0 and 数据.装备[4].染色组[1] ~= nil then
          __res:置染色(副武器动画, 数据.装备[4].染色方案, 数据.装备[4].染色组[1], 数据.装备[4].染色组[2])
        end
        加入数据(副武器动画)
      end
    end

  elseif "召唤兽" == 类型 or "子女" == 类型 then
    local 模型 = 数据.模型
    local lssj = 取战斗模型(模型)
    if 数据.进阶 and 取可否进阶(模型) then
      模型 = "进阶"..模型
      lssj = 取战斗模型(模型)
    end
    tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[6])):置方向(方向):置循环(true)
    if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil then
      __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2])
    elseif 数据.变异 and 染色信息[模型] then
      __res:置染色(tcp, 染色信息[模型].id, 染色信息[模型].方案[1], 染色信息[模型].方案[2], 染色信息[模型].方案[3])

    end
    加入数据(tcp)
    lssj = 取战斗模型(模型 .. "_身体")
    if lssj[6] then
      加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[6])):取动画(1):置当前帧(1):播放(true))
    end
    if 数据.饰品 then
      lssj = 取战斗模型(模型 .. "_饰品")
      if lssj[6] then
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[6])):取动画(1):置当前帧(1):播放(true))
      end
    else
      lssj = 取战斗模型(模型 .. "_装饰")
      if lssj[6] then
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[6])):取动画(1):置当前帧(1):播放(true))
      end
    end
  elseif "坐骑" == 类型 then
    方向 = 1
    if 一体坐骑表[数据.模型] then
      加入数据(__res:取动画(__res:取地址("shape/zuoqi/", 一体坐骑表[数据.模型][多开数据[多开数据.当前].角色信息.模型].站)):取动画(方向):置当前帧(1):播放(true))
      self.x, self.y = x, y
      return
    end
    local lssj = 坐骑库(附加, 数据.模型, 数据.饰品 or "空", 数据.饰品2 or "空")
    if lssj then
      加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.坐骑站立)):取动画(1):置当前帧(1):播放(true))
      if 数据.饰品 then
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.坐骑饰品站立)):取动画(1):置当前帧(1):播放(true))
      end
    else
      local lssj = 取站立坐骑(数据.模型)
      加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(1):置当前帧(1):播放(true))
    end
  elseif "宠物" == 类型 then
    local lssj = 取模型(数据)
    加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(5):置当前帧(1):播放(true))
  end
  self.x, self.y = x, y
end
function UI模型格子:清空()
  self.动画 = {}
end
function UI模型格子:更新(dt)
  for k, v in pairs(self.动画) do
    v:更新(dt)
  end
end
function UI模型格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x , y )
  end
  if self.数据 and self.数据.确定 then
    self.确定格子:显示(x , y )
  end
  多开数据[self.当前].__主控.影子:显示(x + self.x, y + self.y)
  for k, v in pairs(self.动画) do
    v:显示(x + self.x, y + self.y)
  end
end
return UI模型格子
