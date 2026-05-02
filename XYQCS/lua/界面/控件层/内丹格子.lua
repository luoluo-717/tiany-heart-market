--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-08-21 20:34:31
FilePath: \XYQCS\lua\界面\控件层\内丹格子.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]

local 内丹格子 = class("内丹格子")
function 内丹格子:初始化(当前)
  self.py = { x = 0, y = 0 }
  self.文字 = false
  self.当前 = 当前
end

function 内丹格子:置数据(数据, zjcz, bb, nsgz, i, w, h)
  self.数据 = nil
  self.模型 = nil
  self.图像 = nil
  if nsgz then
    if i <= nsgz then
      if 数据 and 数据.技能 then
        self.数据 = 取内丹数据(数据.技能, 数据.等级, bb.等级, bb.体质, bb.魔力, bb.力量)
        self.数据.名称 = 数据.技能
        self.数据.等级 = 数据.等级
        self.数据.类型 = "召唤兽内丹"
		    self.数据.可学习=true

        self.图像 = __res:取图像(__res:取地址("shape/jn/", self.数据.模型)):拉伸(w, h)
        local nsf = require("SDL.图像")(w, h)
        if nsf:渲染开始() then
          self.图像:显示(0, -2)
          nsf:渲染结束()
        end
        self.模型 = nsf:到精灵()
      end
    else
      self.数据 = {}
      self.数据.名称 = "不可使用的内丹技能格"
      self.数据[1] = "召唤兽可用内丹数量与其参战等级相关"
      self.图像 = __res:getPNGCC(3, 817, 292, 56, 54)
      local nsf = require("SDL.图像")(w, h)
      if nsf:渲染开始() then
        self.图像:显示(0, 0)
        nsf:渲染结束()
      end
      self.模型 = nsf:到精灵()
    end
  end
end

function 内丹格子:详情打开(x, y, w, h,学习按钮)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情:置可见(true, true)
  多开数据[当前 or self and self.当前].__UI弹出.技能详情.技能文本:清空(_)

  local yyyy=y - 125
  if yyyy>540-300 then
	yyyy=240
  end
  多开数据[当前 or self and self.当前].__UI弹出.技能详情:打开(self.数据, x - 240, yyyy, 240, 300, self.图像,学习按钮)
end

function 内丹格子:更新(dt)
end

function 内丹格子:显示(x, y)
  if self.模型 then
    self.模型:显示(x + self.py.x, y + self.py.y)
  end
end

return 内丹格子
