--[[
    @Author       : GGELUA
    @Date         : 2022-10-31 22:57:27
    @Last Modified by: GGELUA
    @Last Modified time: 2022-11-01 20:35:39
--]]
local 商城锦衣格子 = class("商城锦衣格子")
local ggf = require("GGE.函数")
function 商城锦衣格子:初始化(当前)
  self.py = {x = 70, y = 130}
  self.xuanzhong=__res:getPNGCC(2, 892, 179, 143, 209)["到精灵"]((__res:getPNGCC(2, 892, 179, 143, 209)))
  self.当前=当前

end
function 商城锦衣格子:置物品(数据, lx)
  self.数据 = nil
  self.图像 = nil
  self.动画 = {}
  self.确定格子=__res:getPNGCC(4, 674, 429, 121, 121):拉伸(154,180):到精灵()
  local 加入数据 = ggf.insert(self.动画)
  local nsf = require("SDL.图像")(154, 180)
  if 数据 then
    if nsf:渲染开始() then
      __res:getPNGCC(4, 807, 427, 154, 180):显示(0, 0)
      字体14["置颜色"](字体14, __取颜色("白色"))
        local tsf = 字体14["取图像"](字体14, 数据["名称"])
        tsf["显示"](tsf, (125 - tsf["宽度"]) // 2+55-58+17, 102+61)
        字体14["置颜色"](字体14, __取颜色("绿色"))
        tsf = 字体14["取图像"](字体14, 数据["价格"])
        tsf["显示"](tsf, (125 - tsf["宽度"]) // 2+55-58+18, 0)
      nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    local 方向 = 5
    if 数据.名称 then
      if lx=="战锦商品" then
      local lssj =取祥瑞模型(多开数据[多开数据.当前].角色信息.模型,数据.名称)
        加入数据(__res:取动画(__res:取地址('shape/mx/zj/',lssj[1])):取动画(1):置当前帧(1):播放(true))
      
      elseif lx=="锦衣商品" then
        local  ziyuan = 取普通锦衣模型(数据.名称, 多开数据[多开数据.当前].角色信息.模型)
        加入数据(__res:取动画(__res:取地址("shape/mx/zj/", ziyuan[1])):取动画(1):置当前帧(1):播放(true))
      elseif lx=="武器装扮" then
          local  ziyuan
          if 数据.名称=="恶魔棘刺" then
              ziyuan = 取战斗武器装扮(数据.名称,多开数据[多开数据.当前].角色信息.模型)
          else
              if 多开数据[多开数据.当前].角色信息.装备 and 多开数据[多开数据.当前].角色信息.装备[3] then
                  ziyuan = 取战斗武器装扮(数据.名称,多开数据[多开数据.当前].角色信息.模型,多开数据[多开数据.当前].角色信息.装备[3].子类)
              else
                  ziyuan = 取战斗武器装扮(数据.名称,"剑侠客")
              end
          end
          加入数据(__res:取动画(__res:取地址("shape/mx/zj3/", ziyuan[6])):取动画(1):置当前帧(1):播放(true))

      elseif lx=="足迹商品" then
        local ziyuan=取足迹(数据.名称)
        加入数据(__res:取动画(__res:取地址("shape/mx/zj2/", ziyuan[1])):取动画(1):置当前帧(1):播放(true))

      elseif 坐骑文件完整 and lx=="祥瑞商品" then
        加入数据(__res:取动画(__res:取地址("shape/zuoqi/", 一体坐骑表[数据.名称][多开数据[多开数据.当前].角色信息.模型].站)):取动画(1):置当前帧(1):播放(true))
      elseif lx=="光环商品" then
        local ziyuan = 取光环(数据.名称)
        加入数据(__res:取动画(__res:取地址("shape/mx/", ziyuan[1])):取动画(方向):置当前帧(1):播放(true))
      elseif lx=="施法特效" then
        local sf= 取施法特效(数据.名称)
        加入数据(__res:取动画(__res:取地址("shape/tx/sf/",sf[1])):取动画(方向):置当前帧(1):播放(true))
      elseif lx=="攻击特效" then
        local sf= 取攻击特效(数据.名称)
        加入数据(__res:取动画(__res:取地址("shape/tx/sf/",sf[1])):取动画(方向):置当前帧(1):播放(true))

      end
    end
    self.数据 = 数据
    self.图像 = nsf:到精灵()
  end
end
function 商城锦衣格子:更新(dt)
  for k, v in pairs(self.动画) do
    v:更新(dt)
  end
end
function 商城锦衣格子:显示(x, y)
  self.图像:显示(x, y)
  if self.数据 then
    多开数据[self.当前].__主显.影子:显示(x + self.py.x, y + self.py.y)
  end
  for k, v in pairs(self.动画) do
    v:显示(x + self.py.x, y + self.py.y)
  end
  -- if self.确定 then
  --   多开数据[self.当前].__主控.商城jy选中:显示(x, y)
  -- end
  if self.数据 and self.数据.确定 then
    self.确定格子:显示(x , y )
    -- 多开数据[self.当前].__主控.商城jy选中:显示(x, y)
  end

end
return 商城锦衣格子
