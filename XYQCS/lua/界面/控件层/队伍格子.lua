--[[
    @Author       : GGELUA
    @Date         : 2022-10-31 22:57:27
Last Modified by: GGELUA
Last Modified time: 2023-07-03 11:14:28
--]]
local 队伍格子 = class("队伍格子")
local ggf = require("GGE.函数")
function 队伍格子:初始化(当前)
  self.当前=当前
  self.py = {x = 70, y = 170}
end
function 队伍格子:置数据(数据, bh, lx)
  self.数据 = nil
  self.图像 = nil
  self.动画 = {}
  self.巅峰赛显示=false
  local 加入数据 = ggf.insert(self.动画)
  local nsf = require("SDL.图像")(143, 290)
  if 数据 then
    if nsf:渲染开始() then

      if "队伍列表" == lx then
        __res:getPNGCC(2, 636, 573, 143, 290):显示(0, 0)
        字体25:置颜色(255, 255, 255)
        字体25:置样式(2)
        字体25:取描边图像(bh, 0, 0, 0):显示(124, 35)
        if 1 == bh then
          字体25:取描边图像("指挥", 0, 0, 0):显示(10, 35)
        end
        字体25:置样式(0)
      
 

      end
    if "巅峰赛界面" == lx then
      self.巅峰赛显示=true
      允许武器=false
      字体16:置颜色(39, 53, 81)
      local 宽度 = 字体16:取宽度(数据.名称)
      字体16:取图像(数据.名称):显示(70 - 宽度 / 2, 21+40)
      宽度 = 字体16:取宽度(数据.门派)
      字体14:置颜色(39, 53, 81)
      字体14:取图像(数据.门派.."  Lv:"..数据.等级 .. ""):显示(15, 195)
    elseif "巅峰赛宠物" == lx then
      self.巅峰赛显示=true
    else
      字体18:置颜色(39, 53, 81)
      local 宽度 = 字体18:取宽度(数据.名称)
      字体18:取图像(数据.名称):显示(70 - 宽度 / 2, 214)
      宽度 = 字体18:取宽度(数据.门派)
      字体18:取图像(数据.门派):显示(70 - 宽度 / 2, 240)
      宽度 = 字体18:取宽度(数据.等级 .. "级")
      字体18:取图像(数据.等级 .. "级"):显示(70 - 宽度 / 2, 267)
    end
      nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    local 方向 = 5
    local 允许武器 = true
    if lssj and lssj[1] then
      加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
    end
 
   

    if not 数据.变身数据 then
      if self:判断一体坐骑(数据)  then
        加入数据(__res:取动画(__res:取地址("shape/zuoqi/", 一体坐骑表[数据.坐骑.模型][数据.模型].站)):取动画(方向):置当前帧(1):播放(true))
        self.数据 = 数据
        return
      end
      local lssj
      if 数据.锦衣 and 数据.锦衣[1] then
        local 锦衣名称 = 数据.锦衣[1].名称
        if type(数据.锦衣[1]) == "string" then
          锦衣名称 = 数据.锦衣[1]
        end
        if 锦衣名称=="青花瓷月白"   or 锦衣名称=="龙行玉泽" or 锦衣名称=="萌龙咆哮" or 锦衣名称=="胖胖龙" or 锦衣名称=="黑麒麟" or 锦衣名称=="锦鲤" or 锦衣名称=="青花瓷月黑" or 锦衣名称=="灼灼韶华"
				or 锦衣名称=="齐天大圣月白" or 锦衣名称=="齐天大圣月黑" then
          允许武器 = false
        lssj =取祥瑞模型(数据.模型,锦衣名称)
        else
        local 武器类型 = nil
        if 数据.装备 then 
          武器类型 = 多开数据[self.当前].__主控:取武器子类(数据.装备.子类)
          lssj = 取普通锦衣模型(锦衣名称, 数据.模型, 数据.装备.子类)
        else
          武器类型 =nil
          lssj = 取普通锦衣模型(锦衣名称, 数据.模型)
        end
      end
    end
    if 数据.锦衣 and 数据.锦衣[3]  then
            local n = 取光环(数据.锦衣[3])
            加入数据(__res:取动画(__res:取地址("shape/mx/", n[1])):取动画(方向):置当前帧(1):播放(true))
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
          if 允许武器 and self.巅峰赛显示 ==false then
            local 资源='shape/mx/'
      
            local m = 多开数据[self.当前].__主控:取武器附加名称(数据.装备.子类, 数据.装备.等级, 数据.装备.名称)
            lssj = 取模型(m .. "_" .. 数据.模型)
            ---------------------------C改
            if 数据.锦衣 and 数据.锦衣[2] then
                if 数据.锦衣[2].名称=="恶魔棘刺" then
                  lssj = 取普通武器装扮(数据.锦衣[2],数据.模型)
                else
                  lssj = 取普通武器装扮(数据.锦衣[2],数据.模型,数据.装备.子类)
                end
                资源='shape/mx/zj3/'
            end
            ---------------------------C改
            tcp1 = __res:取动画2(__res:取地址(资源, lssj[1])):置方向(5):置循环(true)
            if 数据.装备.染色组 and 数据.装备.染色方案 and 数据.装备.染色方案 ~= 0 and 数据.装备.染色组[1] ~= nil and 数据.装备.染色组[1] ~= 0 and 数据.装备.染色组[2] ~= 0 then
              __res:置染色(tcp1, 数据.装备.染色方案, 数据.装备.染色组[1], 数据.装备.染色组[2])
            end
            加入数据(tcp1)
            if 数据.副武器 and 数据.副武器 and 数据.副武器.名称 and 数据.副武器.子类==911 then--
              local m = 多开数据[self.当前].__主控:取武器附加名称(数据.副武器.子类, 数据.副武器.等级, 数据.副武器.名称)
              lssj = 取模型(m .. "_" .. 数据.模型)
              tcp5 = __res:取动画2(__res:取地址(资源, lssj[1])):置方向(5):置循环(true)
              if 数据.副武器.名称.染色组 and 数据.副武器.名称.染色方案 and 数据.副武器.名称.染色方案 ~= 0 and 数据.副武器.名称.染色组[1] ~= nil and 数据.副武器.名称.染色组[1] ~= 0 and 数据.副武器.名称.染色组[2] ~= 0 then
                __res:置染色(tcp5, 数据.副武器.名称.染色方案, 数据.副武器.名称.染色组[1], 数据.副武器.名称.染色组[2])
              end
              加入数据(tcp5)
            end
          end
        else
          -- if 数据.锦衣 and 数据.锦衣[2]  then
            -- tcp = __res:取动画2(__res:取地址('shape/mx/zj/', lssj[1])):置方向(5):置循环(true)
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
      elseif 数据.坐骑 and 数据.坐骑.模型 and __res.配置.显示坐骑==1 and  self.巅峰赛显示 ==false  then
        方向 = 2
        local lssj = 坐骑库(数据.模型, 数据.坐骑.模型, 数据.坐骑.饰品 or "空", 数据.坐骑.饰品2 or "空")
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.坐骑站立)):取动画(方向):置当前帧(1):播放(true))
        if lssj.坐骑饰品站立 then
          加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.坐骑饰品站立)):取动画(方向):置当前帧(1):播放(true))
        end
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.人物站立)):取动画(方向):置当前帧(1):播放(true))
      elseif 数据.装备 and 数据.装备.名称 ~= ""and self.巅峰赛显示 ==false  then
        local m = 多开数据[self.当前].__主控:取武器子类(数据.装备.子类)
          lssj = 取模型(数据.模型, m)
          tcp = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
          if 数据.染色组 and 数据.染色方案 and 数据.染色方案 ~= 0 and 数据.染色组[1] ~= nil and 数据.染色组[1] ~= 0 and 数据.染色组[2] ~= 0 and 数据.染色组[3] ~= 0 then
            __res:置染色(tcp, 数据.染色方案, 数据.染色组[1], 数据.染色组[2], 数据.染色组[3])
          end
        加入数据(tcp)

      
        local m = 多开数据[self.当前].__主控:取武器附加名称(数据.装备.子类, 数据.装备.等级, 数据.装备.名称)
        lssj = 取模型(m .. "_" .. 数据.模型)
        tcp1 = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
        if 数据.装备.染色组 and 数据.装备.染色方案 and 数据.装备.染色方案 ~= 0 and 数据.装备.染色组[1] ~= nil and 数据.装备.染色组[1] ~= 0 and 数据.装备.染色组[2] ~= 0 then
          __res:置染色(tcp1, 数据.装备.染色方案, 数据.装备.染色组[1], 数据.装备.染色组[2])
        end
        加入数据(tcp1)
        if 数据.副武器 and 数据.副武器 and 数据.副武器.名称 and 数据.副武器.子类==911 then--
          local m = 多开数据[self.当前].__主控:取武器附加名称(数据.副武器.子类, 数据.副武器.等级, 数据.副武器.名称)
          lssj = 取模型(m .. "_" .. 数据.模型)
           tcp5 = __res:取动画2(__res:取地址('shape/mx/', lssj[1])):置方向(5):置循环(true)
           if 数据.副武器.名称.染色组 and 数据.副武器.名称.染色方案 and 数据.副武器.名称.染色方案 ~= 0 and 数据.副武器.名称.染色组[1] ~= nil and 数据.副武器.名称.染色组[1] ~= 0 and 数据.副武器.名称.染色组[2] ~= 0 then
             __res:置染色(tcp5, 数据.副武器.名称.染色方案, 数据.副武器.名称.染色组[1], 数据.副武器.名称.染色组[2])
           end
           加入数据(tcp5)
         end
         
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

      if "队伍列表" == lx then
        __res:getPNGCC(2, 636, 573, 143, 290):显示(0, 0)
        字体25:置颜色(255, 255, 255)
        字体25:置样式(2)
        字体25:取描边图像(bh, 0, 0, 0):显示(124, 35)
        字体25:置样式(0)
      end
      nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
  end
end
function 队伍格子:更新(dt)
  for k, v in pairs(self.动画) do
    v:更新(dt)
  end
end

function 队伍格子:判断一体坐骑(数据)
  if  数据.变身数据 == nil and 数据.坐骑 and 数据.坐骑.模型 and 一体坐骑表[数据.坐骑.模型] and __res.配置.显示坐骑==1 then
    return true
  end
end

function 队伍格子:显示(x, y)
  self.图像:显示(x, y)
  if self.数据 then
    多开数据[self.当前].__主控.影子:显示(x + self.py.x, y + self.py.y)
  end
  for k, v in pairs(self.动画) do
    v:显示(x + self.py.x, y + self.py.y)
  end
  if self.确定 then
    多开数据[self.当前].__主控.队伍选中:显示(x, y)
  end
end
return 队伍格子
