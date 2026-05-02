--[[
    @Author       : GGELUA
    @Date         : 2022-10-31 22:57:27
Last Modified by: GGELUA
Last Modified time: 2023-07-03 11:14:28
--]]
local AI队伍格子 = class("AI队伍格子")
local ggf = require("GGE.函数")
function AI队伍格子:初始化(当前)
  self.当前=当前
  -- self.py = {x = 70, y = 120}
end
function AI队伍格子:置数据(数据,是否拥有,bh)
  self.数据 = nil
  self.图像 = nil
  self.动画 = {}
  local 加入数据 = ggf.insert(self.动画)
  local nsf = require("SDL.图像")(143, 180)
  if 数据 then
    if nsf:渲染开始() then
      __res:getPNGCC(2, 636, 573, 143, 210):拉伸(143,180):显示(0, 0)
      字体16:置颜色(39, 53, 81)
      local 宽度 = 字体16:取宽度(数据.名称)
      字体16:置颜色(__取颜色("红色"))
      字体16:取图像(数据.名称.."("..数据.门派..")"):显示(50 - 宽度 / 2, 4)
      if 是否拥有[bh] then
        字体16:置颜色(__取颜色("黄色"))
        宽度 = 字体16:取宽度("已招募")
        字体16:取图像("已招募"):显示(70 - 宽度 / 2, 150)
      end
      nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    local 方向 = 5
    if 数据.锦衣 and 数据.锦衣[2] then
      local 锦衣名称 = 数据.锦衣[2].名称
      if type(数据.锦衣[2]) == "string" then
        锦衣名称 = 数据.锦衣[2]
      end
      lssj = 取光环(锦衣名称)
    end 
    if lssj and lssj[1] then
      加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
    end
    if not 数据.变身数据 then
      local lssj
      if 数据.锦衣 and 数据.锦衣[1] then
        local 锦衣名称 = 数据.锦衣[1].名称
        if type(数据.锦衣[1]) == "string" then
          锦衣名称 = 数据.锦衣[1]
        end
        local 武器类型 = nil
        if 数据.装备 then 武器类型 = 多开数据[self.当前].__主控:取武器子类(数据.装备.子类) end
        lssj = 取模型(数据.模型, nil, nil, 锦衣名称,武器类型)
      end
      if lssj and lssj[1] then
        if 数据.装备 and 数据.装备.名称 ~= "" then
          local m = 多开数据[self.当前].__主控:取武器子类(数据.装备.子类)
          if 数据.锦衣 and 数据.锦衣[1] then
            tcp = __res:取动画2(__res:取地址('shape/mx/zj/', lssj[1])):置方向(5):置循环(true)
          else
            lssj = 取模型(数据.模型, m)
            tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
            if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil and 数据.染色组[1] ~= 0 and 数据.染色组[2] ~= 0 and 数据.染色组[3] ~= 0 then
              __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2], 数据.染色组[3])
            end
          end
          加入数据(tcp)
          local m = 多开数据[self.当前].__主控:取武器附加名称(数据.装备.子类, 数据.装备.等级, 数据.装备.名称)
          lssj = 取模型(m .. "_" .. 数据.模型)
          tcp1 = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
          if 数据.装备.染色组 and 数据.装备.染色方案 and 数据.装备.染色方案 ~= 0 and 数据.装备.染色组[1] ~= nil and 数据.装备.染色组[1] ~= 0 and 数据.装备.染色组[2] ~= 0 then
            __res:置染色(tcp1, 数据.装备.染色方案, 数据.装备.染色组[1], 数据.装备.染色组[2])
          end
          加入数据(tcp1)
        else
          if 数据.锦衣 and 数据.锦衣[1] then
            tcp = __res:取动画2(__res:取地址('shape/mx/zj/', lssj[1])):置方向(5):置循环(true)
          else
            lssj = 取模型(数据.模型)
            tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
            if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil and 数据.染色组[1] ~= 0 and 数据.染色组[2] ~= 0 and 数据.染色组[3] ~= 0 then
                __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2], 数据.染色组[3])
            end
          end
          加入数据(tcp)
        end
      elseif 数据.装备 and 数据.装备[3] then
        local m = 多开数据[self.当前].__主控:取武器子类(数据.装备[3].子类)
        local lssj = 取模型(数据.模型, m)
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
        local m = 多开数据[self.当前].__主控:取武器附加名称(数据.装备[3].子类, 数据.装备[3].等级, 数据.装备[3].名称)
        local lssj = 取模型(m .. "_" .. 数据.模型)
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
      else
        local lssj = 取模型(数据.模型)
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
      end
      
    else
      local lssj = 取模型(数据.变身数据)
      加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
    end
    self.数据 = 数据
  else
    if nsf:渲染开始() then
      __res:getPNGCC(2, 636, 573, 143, 210):拉伸(143,180):显示(0, 0)
      nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
  end
end
function AI队伍格子:更新(dt)
  for k, v in pairs(self.动画) do
    v:更新(dt)
  end
end
function AI队伍格子:显示(x, y)
  self.图像:显示(x, y)
  if self.数据 then
    多开数据[self.当前].__主控.影子:显示(x + 70, y + 120)
  end
  for k, v in pairs(self.动画) do
    v:显示(x + 70, y + 120)
  end
  if self.确定 then
    多开数据[self.当前].__主控.队伍选中小:显示(x, y)
  end
end
return AI队伍格子
