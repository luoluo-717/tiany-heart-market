-- @Author: baidwwy
-- @Date:   2025-06-06 13:11:28
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-06-06 17:11:11
local s窗宽,s窗高 = 428,486
local 玉魄镶嵌 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("上古玉魄镶嵌", 50 + abbr.py.x, 22 + abbr.py.y, s窗宽+10,s窗高+10)
local 当前 = 多开数据.当前

local format = string.format
local 介绍文本 = 玉魄镶嵌:创建文本("介绍文本", 170, 89, 230, 253)
function 介绍文本:初始化()
end

function 玉魄镶嵌:初始化()
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
    置窗口背景("玉魄镶嵌", 0, 12, s窗宽,s窗高-12, true):显示(0,0)
    取灰色背景(0, 0, 395, 300, true):显示(15,50)
    for i=1,3 do
      local lssj = __res:getPNGCC(3, 132, 506, 55, 55)
      lssj:显示(75+(i-1)*102+1, 365+1)
    end
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
end

function 玉魄镶嵌:打开(数据)
  self:置可见(true)
  self.选中道具 = 0
  self.镶嵌道具 = {}
  self.玉魄名称 = 数据.名称
  self:刷新镶嵌玉魄(数据)
end

function 玉魄镶嵌:刷新镶嵌玉魄(data)
  for i=1,3 do
      if data.女娲符 and data.女娲符[i] then
          local shuju = {}
          shuju.名称 = data.女娲符[i].名称
          shuju.总类 = ItemData[shuju.名称].wp_2
          shuju.分类 = ItemData[shuju.名称].wp_3
          shuju.子类 = ItemData[shuju.名称].wp_4
          shuju.类型 = data.女娲符[i].类型
          shuju.数值 = data.女娲符[i].数值
          self.镶嵌道具[i] = shuju
      else
          self.镶嵌道具[i] = nil
      end
  end
  self.道具网格:置物品()
  self:添加文本(data)
  self:重置()
end

function 玉魄镶嵌:重置()
  if not self.玉魄名称 then self.玉魄名称 = "青龙石" end
  local nsf = require("SDL.图像")(s窗宽,s窗高)
  if nsf:渲染开始() then
    字体22:置颜色(__取颜色("黄色"))
    字体22:取图像(self.玉魄名称):显示(170, 60)
    __res:取图像(__res:取地址("shape/dj/", 取物品(self.玉魄名称)[13])):显示(20,50)
    nsf:渲染结束()
  end
  self.图像 = nsf:到精灵()
end

function 玉魄镶嵌:添加文本(item)
    self.介绍文本:清空()
    local data = ItemData[item.名称]
    local xxx = "#W" ..data.wp_1
    self.介绍文本:置文本(xxx)
    if item[1] then
        self.介绍文本:置文本(format("#Y/%s +%s",item[1].类型,item[1].数值))
    end
    if item.等级 then
        local sss = item.等级*0.5
        self.介绍文本:置文本(format("#Y/奇袭法术 +%s%%",sss))
    end
    if item.耐久 then
      self.介绍文本:置文本(format("#Y/耐久度 %s",item.耐久))
    end
    if item.等级 then
      self.介绍文本:置文本(format("#Y/灵尘等级 %s",item.等级))
    end
    for n=2,3 do
        local x宝石 = ""
        if item.宝石 and item.宝石[n-1] then
            x宝石 = "#F[+" ..item.宝石[n-1] .."]"
        end
        if item[n] then
            self.介绍文本:置文本(format("#G/%s +%s " ..x宝石,item[n].类型,item[n].数值))
        end
    end
    if item.特技 then
        for n=1,3 do
            if item.特技[n] then
                self.介绍文本:置文本(format("#S/奇袭特技:%s",item.特技[n]))
            end
        end
    end
    if item.三药 then
        for n=1,3 do
            if item.三药[n] then
                self.介绍文本:置文本(format("#S/奇袭道具:%s",item.三药[n]))
            end
        end
    end
    if item.特效 then
      self.介绍文本:置文本(format("#S/%s +%s%%",item.特效,item.特效值))
    end
end

local 道具网格 = 玉魄镶嵌:创建网格("道具网格", 75, 365, 300, 60)
function 道具网格:初始化()
  self:创建格子(57, 57, 0, 45, 1, 3)
end

function 道具网格:置物品()
  for i = 1, 3 do
    if 玉魄镶嵌.镶嵌道具[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, 玉魄镶嵌.镶嵌道具[i], nil, "道具")
      lssj["置偏移"](lssj, 5, 3)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end

function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品禁止"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    -- if 玉魄镶嵌["选中道具"] and self.子控件[玉魄镶嵌["选中道具"]]._spr["物品"] then
    --   self.子控件[玉魄镶嵌["选中道具"]]._spr["确定"] = nil
    -- end
    -- 玉魄镶嵌["选中道具"] = a
    -- self.子控件[a]._spr["确定"] = true
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170-95, 86, w, h, "卸下女娲符", a)
  else
    多开数据[当前].__UI弹出.镶嵌道具选择:打开(a,"上古玉魄镶嵌")
  end

end


local 关闭 = 玉魄镶嵌:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", s窗宽-37, 0)
function 关闭:左键弹起(x, y, msg)
  玉魄镶嵌:置可见(false)
end