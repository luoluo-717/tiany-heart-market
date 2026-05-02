local 基类 = require("界面/控件层/基类/物品基类")
local 商店格子 = class("商店格子", 基类)
function 商店格子:初始化(当前)
  self.py = { x = 0, y = 0 }
  self.当前 = 当前
end

function 商店格子:置物品(数据, lx, tm, 类型)
  self.模型 = nil
  self.物品 = nil
  if "商城道具" == lx then
    local nsf = require("SDL.图像")(125, 125)
    if 数据 and 数据.价格 then
      self:取数据(数据)
      local 返回值 = 取同名物品(self.物品.名称, self.物品.子类, self.物品.类型, self.物品.等级)
      if not 判断是否为空表(返回值) then
        self.物品.资源 = 返回值[5] or 返回值[1]
        self.物品.小模型资源 = 返回值[2]
        if 返回值[5] then
          self.物品.url = 返回值[1]
          self.物品.小模型资源 = 返回值[4]
        end
        self.物品.大模型资源 = 返回值[3]
        if 返回值[6] then
          self.物品.pyz = 返回值[6] --动态
        end
      end
      if nsf:渲染开始() then
       
        -- __res:getPNGCC(6, 129, 514, 145, 170):拉伸(145, 165):显示(0, 0)
        require("SDL.图像")("assets/shape/pic/wupinbj.png"):拉伸(125, 131):显示(0, 0)
        if 类型 == "宝宝" then
          local lssj = 取头像(数据.名称)
          __res:取图像(__res:取地址("shape/mx/", lssj[1])):拉伸(50, 50):显示(38, 28)
          字体16:置颜色(__取颜色("黑色"))
          local tsf = 字体16:取图像(数据.名称)
          tsf:显示((125 - tsf.宽度) // 2, 82)
          字体16:置颜色(__取颜色("黑色"))
          tsf = 字体16:取图像(数据.价格)
          tsf:显示((135 - tsf.宽度) // 2, 104)
        else
          __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(38, 28)
          字体16:置颜色(__取颜色("黑色"))
          local tsf = 字体16:取图像(数据.名称)
          tsf:显示((125 - tsf.宽度) // 2+2, 82)
          字体16:置颜色(__取颜色("黑色"))
          tsf = 字体16:取图像(数据.价格)
          tsf:显示((135 - tsf.宽度) // 2, 104)
        end
        -------------------------------------------------------------------------
        if self.物品.名称=="强化符"  then
          字体14:置颜色(__取颜色("白色"))
          if self.物品.技能== "嗜血" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("体力符"):显示(82-字体14:取宽度("体力符"), 68)
          end
          if self.物品.技能== "轻如鸿毛" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("魔法符"):显示(82-字体14:取宽度("魔法符"), 68)
          end
          if self.物品.技能== "拈花妙指" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("速度符"):显示(82-字体14:取宽度("速度符"), 68)
          end
          if self.物品.技能== "一气化三清" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("魔力符"):显示(82-字体14:取宽度("魔力符"), 68)
          end
          if self.物品.技能== "龙附" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("伤害符"):显示(82-字体14:取宽度("伤害符"), 68)
          end
          if self.物品.技能== "盘丝舞" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("防御符"):显示(82-字体14:取宽度("防御符"), 68)
          end
          if self.物品.技能== "魔王护持" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("气血符"):显示(82-字体14:取宽度("气血符"), 68)
          end
          if self.物品.技能== "浩然正气" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("法防符"):显示(82-字体14:取宽度("法防符"), 68)
          end
          if self.物品.技能== "莲华妙法" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("法伤符"):显示(82-字体14:取宽度("法伤符"), 68)
          end
          if self.物品.技能== "神力无穷" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("愤怒符"):显示(82-字体14:取宽度("愤怒符"), 68)
          end
          if self.物品.技能== "尸气漫天" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("耐力符"):显示(82-字体14:取宽度("耐力符"), 68)
          end
          if self.物品.技能== "担山赶月" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("力量符"):显示(82-字体14:取宽度("力量符"), 68)
          end
          if self.物品.技能== "神木呓语" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("法伤结果"):显示(88-字体14:取宽度("法伤结果"), 68)
          end
          if self.物品.技能== "元阳护体" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("气血回复"):显示(88-字体14:取宽度("气血回复"), 68)
          end
          if self.物品.技能== "穿云破空" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("伤害结果"):显示(88-字体14:取宽度("伤害结果"), 68)
          end
          if self.物品.技能== "神兵护法" then
            __res:getPNGCC(4, 716, 322, 55, 19):显示(32, 66)
            字体14:取图像("命中符"):显示(82-字体14:取宽度("命中符"), 68)
          end
      end
-------------------------------------------------------------------------
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵(nsf)
      self.格子类型 = lx
    end
  elseif "战令网格" == lx then
    local nsf = require("SDL.图像")(332, 67)
    self:取数据(数据)
    if nsf:渲染开始() then
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(400, 65):显示(0, 0)
      __res:getPNGCC(3, 757, 291, 57, 56):显示(9, 8)
      __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
      字体18:置颜色(__取颜色("浅黑"))
      字体18:取图像(数据.名称):显示(86, 14)
      -- 字体18["取图像"](字体18, "等级：" .. 数据["等级"])["显示"](字体18["取图像"](字体18, "等级：" .. 数据["等级"]), 86, 37)
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "NPC商店" == lx or "宝箱抽奖" == lx then
    local nsf = require("SDL.图像")(55, 55)
    if 数据 then
      self:取数据(数据)
      self.格子类型 = lx
      self.物品.价格 = 数据.价格
      self.物品.原始商品 = 数据.原始商品
      self.物品.数量 = 数据.数量
      if 数据.子类 then
        self.物品.子类 = 数据.子类 + 0
        self.取重复名物品(self)
      end
      if nsf:渲染开始() then
        __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
        __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
        
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    else
      if nsf:渲染开始() then
        __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    end
  elseif lx == "转盘抽奖" then
    local nsf = require("SDL.图像")(55, 55)
    if 数据 then
      self:取数据(数据)
      self.格子类型 = lx
      if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
        if 数据.数量 then
          字体14:置颜色(__取颜色("白色"))
          字体14:取描边图像(数据.数量):显示(0, 0)
        end
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    else
      if nsf:渲染开始() then
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    end
  elseif lx == "嘉年华转盘抽奖" then
    local nsf = require("SDL.图像")(55, 55)
    if 数据 then
      self:取数据(数据)
      self.格子类型 = lx
      if nsf:渲染开始() then
          __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)

        __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
        if 数据.数量 then
          字体14:置颜色(__取颜色("白色"))
          字体14:取描边图像(数据.数量):显示(0, 0)
        end
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    else
      if nsf:渲染开始() then
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    end

  elseif lx == "充值系统二" then
    local nsf = require("SDL.图像")(55, 55)
    if 数据 then
      self:取数据(数据)
      self.格子类型 = lx
      if nsf:渲染开始() then
        if not tm then
          -- __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
          __res:取图像(__res:取地址("shape/ui/", 0x1f73d092)):显示(0, 0)
        end
        -- __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
          __res:取图像(__res:取地址("shape/ui/", 0x1f73d092)):显示(0, 0)
        if 数据.模型 and 数据.成长 then
          local lssj = 取头像(数据.模型)
          self.召唤兽数据=数据
          __res:取图像(__res:取地址("shape/mx/", lssj[1])):拉伸(50, 50):显示(0,0)
        else
          __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
        end
        if 数据.数量 then
          字体14:置颜色(__取颜色("白色"))
          字体14:取描边图像(数据.数量):显示(0, -5)
        end
        
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    end
  elseif lx == "充值系统" then
    local nsf = require("SDL.图像")(55, 55)
    if 数据 then
      self:取数据(数据)
      self.格子类型 = lx
      if nsf:渲染开始() then
        if not tm then
          -- __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
          __res:取图像(__res:取地址("shape/ui/", 0x1f73d092)):显示(0, 0)
        end
        -- __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
          __res:取图像(__res:取地址("shape/ui/", 0x1f73d092)):显示(0, 0)

        if 数据.模型 and 数据.成长 then
          local lssj = 取头像(数据.模型)
          self.召唤兽数据=数据
          __res:取图像(__res:取地址("shape/mx/", lssj[1])):拉伸(50, 50):显示(0,0)
        else
          if 数据.名称=="装备词条石" or 数据.名称=="词条属性石"  then
          __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(5, 5)
          else
          __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
          end
        end
        if 数据.数量 then
          字体14:置颜色(__取颜色("白色"))
          字体14:取描边图像(数据.数量):显示(0, -5)
        end
        
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    
    else
      if nsf:渲染开始() then
        if not tm then
          __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
        end
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    end
  else
    local nsf = require("SDL.图像")(55, 55)
    if 数据 then
      self:取数据(数据)
      self.格子类型 = lx
      if nsf:渲染开始() then
        if not tm then
          __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
        end
        if 数据.模型 and 数据.成长 then
          local lssj = 取头像(数据.模型)
          self.召唤兽数据=数据
          __res:取图像(__res:取地址("shape/mx/", lssj[1])):拉伸(50, 50):显示(0,0)
        else
          __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
        end
        if 数据.数量 then
          字体14:置颜色(__取颜色("白色"))
          字体14:取描边图像(数据.数量):显示(0, -5)
        end
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    else
      if nsf:渲染开始() then
        if not tm then
          __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
        end
        nsf:渲染结束()
      end
      self.精灵 = nsf:到精灵()
    end
  end
  self.数据 = 数据
end

function 商店格子:详情打开(x, y, w, h, lx, bh)
  local Button, Button2, Button3, Button4
  多开数据[当前 or self and self.当前].__UI弹出.道具详情:置可见(true, true)
  多开数据[当前 or self and self.当前].__UI弹出.道具详情.道具文本:清空()
  if self.格子类型 == "宝箱抽奖" then
    self.物品.介绍 = self.数据.说明
  end
  if self.召唤兽数据 then
    多开数据[当前 or self and self.当前].__UI界面.窗口层.召唤兽查看:打开(self.召唤兽数据)
  else
    多开数据[当前 or self and self.当前].__UI弹出.道具详情:打开(self.物品, x, y, 360, 360, Button, Button2, Button3, Button4, bh, lx)
  end
  
end

function 商店格子:更新(dt)
end

function 商店格子:置py(x,y)
  self.py.x,self.py.y=x,y
end

function 商店格子:显示(x, y)
  if self.精灵 then
    self.精灵["显示"](self.精灵, x + self.py.x, y + self.py.y)
  end
  if self.确定 and (self.格子类型 == "NPC商店"  or self.格子类型 == "奖励网格" or self.格子类型 == "法宝选择" or self.格子类型 == "附魔宝珠"  or self.格子类型 == "藏宝阁出售" or self.格子类型 == "强化给予" or self.格子类型 == "功能给予" or self.格子类型 == "道具出售") then
    多开数据[self.当前].__主控.道具选中小:显示(x, y)
  elseif self.确定 and self.格子类型 == "商城道具" then
    多开数据[self.当前].__主控.道具选中小:显示(x + 36, y + 22)
  end
end

return 商店格子
