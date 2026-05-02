local 基类 = require("界面/控件层/基类/物品基类")
local 摊位格子 = class("摊位格子", 基类)
function 摊位格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.当前 = 当前
end
function 摊位格子:置物品(数据, lx, 背景,zlx)
  self.精灵 = nil
  self.物品 = nil
  if "摊位物品" == lx then
    local nsf = require("SDL.图像")(244, 67)
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
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(244, 67):显示(0, 0)
      __res:getPNGCC(3, 132, 506, 55, 55):显示(9, 6)
      __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(9, 6)
      取输入背景(0, 0, 118, 23)["显示"](取输入背景(0, 0, 118, 23), 116, 38)
      字体18:置颜色(__取颜色("白色"))
      if self.物品.数量 then
        字体18:取描边图像(self.物品.数量):显示(37, 6)
      end
      字体18:置颜色(__取颜色("浅黑"))
      字体18:取图像(self.物品.名称):显示(74, 9)
      字体18:取图像("单价"):显示(74, 40)
      字体18:置颜色(__取银子颜色(self.物品.价格))
      字体18:取图像(self.物品.价格):显示(124, 40)
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "摊位召唤兽" == lx then
    local nsf = require("SDL.图像")(350, 67)
    self:取数据(数据)
    if nsf:渲染开始() then
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(350, 67):显示(0,0)
      __res:getPNGCC(3, 132, 506, 55, 55):显示(9, 8)
      local lssj = 取头像(数据.模型)
      __res:取图像(__res:取地址("shape/mx/", lssj[1])):拉伸(50, 50):显示(9, 9)
      取输入背景(0, 0, 118, 23):显示(114, 38)
      字体18:置颜色(__取颜色("浅黑"))
      字体18:取图像(数据.模型):显示(74, 9)
      字体18:取图像("等级：" .. 数据.等级):显示(195, 9)
      字体18:取图像("单价"):显示(74, 40)
      字体18:置颜色(__取银子颜色(self.物品.价格))
      字体18:取图像(self.物品.价格):显示(124, 40)
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "摊位出售物品" == lx then
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
    local nsf = require("SDL.图像")(55, 55)
    if nsf:渲染开始() then
      if "白格子" == 背景 then
        __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
      end
      __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(10, 10)
      if self.物品.数量 then
        字体18:置颜色(__取颜色("白色"))
        字体18:取描边图像(self.物品.数量):显示(35, 2)
      end
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "摊位出售召唤兽" == lx then
    local nsf = require("SDL.图像")(332, 67)
    self:取数据(数据)
    if nsf:渲染开始() then
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(332, 67):显示(0, 0)
      __res:getPNGCC(3, 757, 291, 57, 56):显示(9, 8)
      local lssj = 取头像(数据.模型)
      __res:取图像(__res:取地址("shape/mx/", lssj[1])):拉伸(50, 50):显示(12, 11)
      字体18:置颜色(__取颜色("浅黑"))
      字体18:取图像(数据.名称):显示(86, 14)
      字体18:取图像("等级：" .. 数据.等级):显示(86, 37)
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "交易召唤兽" == lx then
    local nsf = require("SDL.图像")(317, 64)
    self:取数据(数据)
    if nsf:渲染开始() then
      __res:getPNGCC(3, 851, 539, 198, 57):拉伸(317, 64):显示(0, 0)
      __res:getPNGCC(3, 757, 291, 57, 56):显示(9, 4)
      local lssj = 取头像(数据.模型)
      __res:取图像(__res:取地址("shape/mx/", lssj[1])):拉伸(50, 50):显示(12, 7)
      字体18:置颜色(__取颜色("白色"))
      字体18:取图像(数据.名称):显示(86, 14)
      字体18:取图像("等级：" .. 数据.等级):显示(86, 37)
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "活动指引" == lx then
    local nsf = require("SDL.图像")(332, 67)
    if nsf:渲染开始() then
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(332, 67):显示(0, 0)
      __res:getPNGCC(3, 757, 291, 57, 56):显示(9, 8)
      local lssj = 数据[2]
      lssj.指引名称 = 数据[2].名称
      lssj.名称 = 数据[2].显示
      self:取数据(lssj)
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
      __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(12, 11)
      字体18:置颜色(__取颜色("浅黑"))
      字体18:取图像(数据[1]):显示(86, 14)      
      local 任务要求 = 数据[4]
      if 任务要求[2] and 数据[3][任务要求[5]] then
        字体14:置颜色(__取颜色("绿色"))
        字体14:取图像(数据[3][任务要求[5]].."/"..任务要求[2]):显示(186, 44)   
        if tonumber(任务要求[2]) == tonumber(数据[任务要求[5]]) then
          __res:取图像(__res:取地址("shape/ui/", "0xC3544D90")):显示(160,5)
        end
      end
      if 任务要求[3] then
        字体14:置颜色(__取颜色("白色"))
        字体14:取图像("活跃："..任务要求[3]):显示(86, 44)   
      end
      nsf:渲染结束()
    end
    self.指引名称 = 数据[1]
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  elseif "藏宝阁" == lx then
    local nsf = require("SDL.图像")(690, 67)
    if nsf:渲染开始() then
      __res:getPNGCC(3, 997, 1047, 178, 64):拉伸(690, 67):显示(0, 0)
      __res:getPNGCC(3, 757, 291, 57, 56):显示(9, 4)
      self.子类型=zlx
      local lssj = 数据.物品
      if zlx =="宝宝商城" then
        lssj = 数据.召唤兽
      elseif zlx == "角色商城" then
        lssj = 数据.角色信息
      elseif zlx == "银两商城" then
        lssj = 数据
      end
      self:取数据(lssj)
      if zlx =="宝宝商城" then
        local sj = 取头像(lssj.名称)
        __res:取图像(__res:取地址("shape/mx/", sj[1])):拉伸(50, 50):显示(12, 7)
      elseif zlx =="角色商城" then
        local sj = 取头像(lssj.模型)
        __res:取图像(__res:取地址("shape/mx/", sj[1])):拉伸(50, 50):显示(12, 7)
      else
        __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(12, 7)
      end
      字体16:置颜色(__取颜色("浅黑"))
      if zlx ~= "银两商城" then
        字体16:取图像(lssj.名称):显示(70, 24) 
        if zlx =="装备商城" or zlx =="灵饰商城" then
          字体16:取图像(lssj.等级):显示(210, 24)  
          if zlx == "装备商城" then
            字体16:取图像(多开数据[多开数据.当前].__主控:取武器子类(lssj.子类)):显示(350, 24)  
          else
            if lssj.子类==1 then
              字体16:取图像("耳饰"):显示(350, 24)  
            elseif lssj.子类==2 then
              字体16:取图像("配饰"):显示(350, 24)  
            elseif lssj.子类==3 then
              字体16:取图像("戒指"):显示(350, 24)  
            elseif lssj.子类==4 then
              字体16:取图像("手镯"):显示(350, 24)  
            end
          end
        elseif  zlx =="宝宝商城" then
          字体16:取图像(lssj.等级):显示(210, 24)  
          local 类型 = lssj.种类
          if 类型 then
            字体16:取图像(类型):显示(350, 24)   
          end
        elseif  zlx =="角色商城" then
          字体16:取图像(lssj.等级):显示(210, 24)  
          local 类型 = lssj.模型
          if 类型 then
            字体16:取图像(类型):显示(350, 24)   
          end
        else
          local 数量 = 数据.数量
          if 数量 then
            字体16:取图像(数量):显示(210, 24)   
          end
        end
      else
        字体16:取图像(lssj.名称 or "银子"):显示(70, 24) 
        字体16:取图像(lssj.数额):显示(210, 24)  
      end
  
      local 价格 = 数据.价格
      if 价格 then
        字体16:取图像(价格):显示(485, 24)   
      end
      if self.物品.数量 then
        字体18:置颜色(__取颜色("白色"))
        字体18:取图像(self.物品.数量):显示(35, 2)
      end
      if 数据.结束时间 then
        local 时间 = math.ceil((数据.结束时间-os.time())/86400).."天"
        if 时间 then
          字体16:取图像(时间):显示(625, 24)   
        end
      end
      nsf:渲染结束()
    end
    self.指引名称 = 数据[1]
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx  
  elseif "藏宝阁出售寄存" == lx or lx == "藏宝阁购买寄存" then
    self:取数据(数据)
    local nsf = require("SDL.图像")(55, 55)
    if nsf:渲染开始() then
      if "白格子" == 背景 then
        __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
      end
      __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(5, 5)
      if self.物品.数量 then
        字体18:置颜色(__取颜色("白色"))
        字体18:取描边图像(self.物品.数量):显示(35, 2)
      end
      nsf:渲染结束()
    end
    self.精灵 = nsf:到精灵()
    self.格子类型 = lx
  end
  self.数据 = 数据
end
function 摊位格子:详情打开(x, y, w, h, lx, bh)
  if self.格子类型 == "摊位物品" then
    local Button, Button2, Button3, Button4
    多开数据[当前 or self and self.当前].__UI弹出.道具详情:置可见(true, true)
    多开数据[当前 or self and self.当前].__UI弹出.道具详情.道具文本:清空()
    多开数据[当前 or self and self.当前].__UI弹出.道具详情:打开(self.物品, x, y, 360, 360, Button, Button2, Button3, Button4, bh, lx)
  elseif self.格子类型 == "藏宝阁" or self.格子类型 == "藏宝阁出售寄存" or self.格子类型 == "藏宝阁购买寄存" then
    local Button, Button2, Button3, Button4
    多开数据[当前 or self and self.当前].__UI弹出.道具详情:置可见(true, true)
    多开数据[当前 or self and self.当前].__UI弹出.道具详情.道具文本:清空()
    多开数据[当前 or self and self.当前].__UI弹出.道具详情:打开(dj or self.物品, x, y, 360, 360, Button, Button2, Button3, Button4, bh, lx)
  elseif self.格子类型 == "活动指引" then
    多开数据[当前 or self and self.当前].__UI弹出.提示弹出:打开('确认#R销毁#Y'..道具详情.数据.名称..'#W?',3702,{物品=道具详情.pid,类型=__UI界面.窗口层.道具行囊.包裹类型})
  end
end
function 摊位格子:更新(dt)
end
function 摊位格子:显示(x, y)
  if self.精灵 then
    self.精灵:显示(x + self.py.x, y + self.py.y)
  end
  if self.确定 and self.格子类型 == "摊位物品" then
    多开数据[self.当前].__主控.摊位物品选中:显示(x, y)
  elseif self.确定 and self.格子类型 == "摊位召唤兽" then
    多开数据[self.当前].__主控.摊位召唤兽选中:显示(x, y)
  end
  if self.格子类型 == "摊位出售物品" then
    if self.确定 then
      多开数据[self.当前].__主控.道具选中大:显示(x, y)
    end
    if self.已上架 then
      多开数据[self.当前].__主控.已上架:显示(x + 21, y + 4)
    end
  elseif self.格子类型 == "摊位出售召唤兽" then
    if self.确定 then
      多开数据[self.当前].__主控.摊位召唤兽出售选中:显示(x, y)
    end
    if self.已上架 then
      多开数据[self.当前].__主控.已上架:显示(x + 284, y)
    end
  elseif self.格子类型 == "藏宝阁出售寄存" or self.格子类型 == "藏宝阁购买寄存" then
    if self.确定 then
      多开数据[self.当前].__主控.道具选中小:显示(x, y)
    end
    if self.物品.上架 then
      多开数据[self.当前].__主控.已上架:显示(x + 21, y + 4)
    end
  elseif self.格子类型 == "藏宝阁" then
    if self.确定 then
      多开数据[self.当前].__主控.藏宝阁选中:显示(x+1, y)
    end
  end
end

function 摊位格子:取图标(内容)
  local 资源 = 3971456754
  if 内容.总类=="日常任务" then
    if 内容.分类==1 then
        资源=3971456754
    elseif 内容.分类==2 then
      资源=1387446262
     elseif 内容.分类==3 then
      资源=0x45BDA0CD
    elseif 内容.分类==4 then
      资源=4271545734
    elseif 内容.分类==5 then
      资源=4271545734
    elseif 内容.分类==6 then
      资源=1153796395
    elseif 内容.分类==7 then
      资源=211127435
    elseif 内容.分类==8 then
      资源=1102456535
    elseif 内容.分类==9 then
      资源=0x97C77FD8
    elseif 内容.分类==10 then
      资源=0x97C77FD8
    elseif 内容.分类==11 then
      资源=211127435
    elseif 内容.分类==12 then
      资源=1572601177
    elseif 内容.分类==13 then
      资源=567106113
    elseif 内容.分类==14 then
      资源=1387446262
    elseif 内容.分类==15 then
      资源=1102456535
    elseif 内容.分类==16 then
      资源=211127435
    end
elseif 内容.总类=="限时活动" then
    if 内容.分类==1 then
        资源=0x5A0E9307
    elseif 内容.分类==2 then
      资源=1241924823
     elseif 内容.分类==3 then
      资源=0x517A3AFF
    elseif 内容.分类==4 then
      资源=0x016F4E03
    elseif 内容.分类==5 then
      资源=0xA8BB247D
    elseif 内容.分类==6 then
      资源=0x6CAD36E8
    elseif 内容.分类==7 then
      资源=0xAEB5E00E
    elseif 内容.分类==8 then
      资源=0x8FF330C0
    elseif 内容.分类==9 then
      资源=0xD2DFDC4D
    elseif 内容.分类==10 then
      资源=94724302
    elseif 内容.分类==11 then
      资源=0x9F6993FA
    elseif 内容.分类==12 then
      资源=0xB39A2CAB
    elseif 内容.分类==13 then
      资源=0x02A776DE
    elseif 内容.分类==14 then
      资源=0x6CAD36E8
    elseif 内容.分类==15 then
      资源=0x6CAD36E8
    end
elseif 内容.总类=="节日活动" then
    if 内容.分类==1 then
        资源=0xD9BBCB07
    elseif 内容.分类==2 then
      资源=0x60523FF1
     elseif 内容.分类==3 then
      资源=0x8E40DEC2
    elseif 内容.分类==4 then
      资源=0x454120AE
    elseif 内容.分类==5 then
      资源=0x5F338146
    elseif 内容.分类==6 then
      资源=0xF5601CC2
    end
elseif 内容.总类=="副本任务" then
    if 内容.分类==1 then
        资源=0x002A5EAF
    elseif 内容.分类==2 then
      资源=0x25492E36
    elseif 内容.分类==3 then
        资源=0x002A5EAF
    elseif 内容.分类==4 then
      资源=0x25492E36
    end
end
  return 资源
end


return 摊位格子
