--[[
    @Author       : GGELUA
    @Date         : 2022-10-31 22:57:27
    @Last Modified by: GGELUA
    @Last Modified time: 2022-11-01 20:35:39
--]]
local 助战模型格子 = class("助战模型格子")
local ggf = require("GGE.函数")
function 助战模型格子:初始化(当前)
  self.py = {x = 36+20+12, y = 87+23+11}
  self.当前=当前

end
function 助战模型格子:判断一体坐骑(数据)
  if  数据.变身数据 == nil and 数据.坐骑 and 数据.坐骑.模型 and 一体坐骑表[数据.坐骑.模型] then
    return true
  end
end
function 助战模型格子:置数据(数据)
  self.数据 = nil
  self.图像 = nil
  self.动画 = {}
  self.定位={}
  local 加入数据 = ggf.insert(self.动画)
  local nsf = require("SDL.图像")(335, 241)
  if 数据 then
    if nsf:渲染开始() then
      字体16:置颜色(__取颜色("浅黑"))
      字体16:取图像(数据.名称):显示(29, 135+6+10)
      字体16:取图像(数据.门派):显示(29, 135+6+10+24*1)
      字体16:取图像(数据.等级.."级"):显示(29, 135+6+10+24*2)
      字体16:取图像(数据.id):显示(29, 135+6+10+24*3)
      if 数据.在线 then
        字体15:置颜色(__取颜色("浅黑"))
        -- __res:getPNGCC(7, 819, 404, 75, 15):显示(18+12,0)
        字体15:取图像(数据.在线):显示(18+13, 6)
      end
      nsf:渲染结束()
    end
    
    self.图像 = nsf:到精灵()
    local 方向 = 5
    local 允许武器=false
    if not 数据.变身数据 then
      if self:判断一体坐骑(数据) then
        加入数据(__res:取动画(__res:取地址("shape/zuoqi/", 一体坐骑表[数据.坐骑.模型][数据.模型].站)):取动画(方向):置当前帧(1):播放(true))
        self.数据 = 数据
        return
      end
      if 数据.坐骑 and 数据.坐骑.模型 then
        方向 = 2
        local lssj = 坐骑库(数据.模型, 数据.坐骑.模型, 数据.坐骑.饰品 or "空", 数据.坐骑.饰品2 or "空")
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.坐骑站立)):取动画(方向):置当前帧(1):播放(true))
        if lssj.坐骑饰品站立 then
          加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.坐骑饰品站立)):取动画(方向):置当前帧(1):播放(true))
        end
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj.人物站立)):取动画(方向):置当前帧(1):播放(true))
      elseif 数据.装备 then
        local m = 多开数据[self.当前].__主控:取武器子类(数据.装备.子类)
        if 锦衣文件完整 and 数据.锦衣 and 数据.锦衣[1] then
          if 数据.锦衣[1]=="青花瓷月白" or 数据.锦衣[1]=="龙行玉泽" or 数据.锦衣[1]=="萌龙咆哮" or 数据.锦衣[1]=="胖胖龙" or 数据.锦衣[1]=="黑麒麟" or 数据.锦衣[1]=="锦鲤" or 数据.锦衣[1]=="青花瓷月黑" or 数据.锦衣[1]=="灼灼韶华"
						or 数据.锦衣[1]=="齐天大圣月白" or 数据.锦衣[1]=="齐天大圣月黑" then
              允许武器=true
          local lssj =取祥瑞模型(数据.模型,数据.锦衣[1])
          加入数据(__res:取动画(__res:取地址("shape/mx/zj/", lssj[1])):取动画(方向):置当前帧(1):播放(true))

          else
          local lssj = 取普通锦衣模型(数据.锦衣[1].名称 or 数据.锦衣[1], 数据.模型, 数据.装备.子类)
          加入数据(__res:取动画(__res:取地址("shape/mx/zj/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
          end
        else
          local lssj=取模型(数据["模型"], m)
          加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
        end
        if not 允许武器 then
        local m = 多开数据[self.当前].__主控:取武器附加名称(数据.装备.子类, 数据.装备.等级, 数据.装备.名称)
        local lssj = 取模型(m .. "_" .. 数据.模型)
        加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
        end
      else
        if 锦衣文件完整 and 数据.锦衣 and 数据.锦衣[1] then
          if 数据.锦衣[1]=="青花瓷月白" or 数据.锦衣[1]=="龙行玉泽" or 数据.锦衣[1]=="萌龙咆哮" or 数据.锦衣[1]=="胖胖龙" or 数据.锦衣[1]=="黑麒麟" or 数据.锦衣[1]=="锦鲤" or 数据.锦衣[1]=="青花瓷月黑" or 数据.锦衣[1]=="灼灼韶华"
						or 数据.锦衣[1]=="齐天大圣月白" or 数据.锦衣[1]=="齐天大圣月黑" then
              允许武器=true

            local lssj =取祥瑞模型(数据.模型,数据.锦衣[1])
            加入数据(__res:取动画(__res:取地址("shape/mx/zj/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
          else
            if 数据.装备 then
              lssj = 取普通锦衣模型(数据.锦衣[1].名称 or 数据.锦衣[1], 数据.模型, 数据.装备.子类)
            else
              lssj = 取普通锦衣模型(数据.锦衣[1].名称 or 数据.锦衣[1], 数据.模型)
            end
            加入数据(__res:取动画(__res:取地址("shape/mx/zj/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
          end
        else
          local lssj=取模型(数据["模型"], m)
          加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
        end
      end
    else
      local lssj = 取模型(数据.变身数据)
      加入数据(__res:取动画(__res:取地址("shape/mx/", lssj[1])):取动画(方向):置当前帧(1):播放(true))
    end
    self.数据 = 数据
  end
end
function 助战模型格子:更新(dt)
  for k, v in pairs(self.动画) do
    v:更新(dt)
  end
end
function 助战模型格子:显示(x, y)
  
  if self.数据 then
    self.图像:显示(x, y)
    多开数据[self.当前].__主控.影子:显示(x + self.py.x, y + self.py.y)
  end
  for k, v in pairs(self.动画) do
    v:显示(x + self.py.x, y + self.py.y)
  end
end
return 助战模型格子
