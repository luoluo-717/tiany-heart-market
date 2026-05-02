-- @Author: baidwwy
-- @Date:   2025-06-06 16:01:00
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-06-06 17:04:30
多开数据[多开数据.当前].__UI弹出.镶嵌道具选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("镶嵌道具选择",0,0,356,350)
local 镶嵌道具选择 = 多开数据[多开数据.当前].__UI弹出.镶嵌道具选择
local 当前=多开数据.当前
function 镶嵌道具选择:初始化()
  local nsf = require("SDL.图像")(356, 350)
  if nsf:渲染开始() then
    取黑透明背景(0, 0, 356, 350, true):显示(0,0)
    __res:getPNGCC(3, 694, 4, 338, 273):显示(10, 14)
    字体18:置颜色(__取颜色("黄色"))
    字体18:取图像("请选择一个需要添加的女娲符"):显示(10, 307)
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
  self.选中道具 = nil
end

function 镶嵌道具选择:打开(pid, jiemian)
  self:置可见(true)
  self.道具网格:置物品(多开数据[当前].__主控.道具列表)
  self:置坐标(497 + abbr.py2.x, 165 + abbr.py2.y)
  self.选中道具 = nil
  self.道具 = 多开数据[当前].__主控.道具列表
  self.pid = pid
  self.操作界面 = jiemian
end

local 道具网格 = 镶嵌道具选择:创建网格("道具网格", 10, 14, 339, 272)
function 道具网格:初始化()
  self:创建格子(67, 67, 0, 0, 4, 5)
end
function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品禁止"] then
    local x, y = self.子控件[a]["取坐标"](self.子控件[a])
    local w, h = self.子控件[a]["取宽高"](self.子控件[a])
    if 镶嵌道具选择["选中道具"] and self.子控件[镶嵌道具选择["选中道具"]]._spr["物品"] then
      self.子控件[镶嵌道具选择["选中道具"]]._spr["确定"] = nil
    end
    镶嵌道具选择["选中道具"] = a
    self.子控件[a]._spr["确定"] = true
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170-95, 86, w, h, "选择", a)
  end
end
function 道具网格:置物品(data, zl, fl)
  for i = 1, #self.子控件 do
    if data[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], nil, "道具选择")
      lssj["置偏移"](lssj, 10, 10)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end

local 添加 = 镶嵌道具选择:创建我的按钮( __res:getPNGCC(3, 126, 563, 111, 36, true), "添加", 229, 300, "添加")
function 添加:左键弹起(x, y, msg)
  local  xuanz=镶嵌道具选择.选中道具
  if xuanz and 镶嵌道具选择.选中道具 then
    if 镶嵌道具选择.操作界面 == "上古玉魄镶嵌" then
      发送数据(当前,3800.6,{x操作="镶嵌",背包类型="道具",物品id=镶嵌道具选择.选中道具,镶嵌孔=镶嵌道具选择.pid})
      镶嵌道具选择:置可见(false)
    end
  end
end



-- 多开数据[多开数据.当前].__UI弹出.镶嵌道具选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("镶嵌道具选择",0,0,356,350)
-- local 镶嵌道具选择 = 多开数据[多开数据.当前].__UI弹出.镶嵌道具选择
-- local 当前 = 多开数据.当前

-- function 镶嵌道具选择:初始化()
--   local nsf = require("SDL.图像")(356, 350)
--   if nsf["渲染开始"](nsf) then
--     取黑透明背景(0, 0, 356, 350, true)["显示"](取黑透明背景(0, 0, 356, 350, true), 0, 0)
--     __res:getPNGCC(3, 694, 4, 338, 273)["显示"](__res:getPNGCC(3, 694, 4, 338, 273), 10, 14)
--     字体18["置颜色"](字体18, __取颜色("黄色"))
--     字体18["取图像"](字体18, "请选择一个需要添加的符石")["显示"](字体18["取图像"](字体18, "请选择一个需要添加的符石"), 10, 307)
--     nsf["渲染结束"](nsf)
--   end
--   self:置精灵(nsf["到精灵"](nsf))
--   self.选中道具 = nil
-- end
-- function 镶嵌道具选择:打开(lx, pid)
--   self:置可见(true)
--   self.道具网格["置物品"](self.道具网格, 多开数据[多开数据.当前].__主控["道具列表"])
--   self:置坐标(497 + abbr.py2.x, 165 + abbr.py2.y) 
--   self.选中道具 = nil
--   self.道具 = 多开数据[多开数据.当前].__主控["道具列表"]
--   self.pid= lx
--   self.操作界面 = pid

-- end
-- local 道具网格 = 镶嵌道具选择["创建网格"](镶嵌道具选择, "道具网格", 10, 14, 339, 272)
-- function 道具网格:初始化()
--   self:创建格子(67, 67, 0, 0, 4, 5)
-- end

-- -- function 符石网格:左键弹起(x, y, a, b, msg)
-- --   if self.子控件[a]._spr then
-- --     if 符石镶嵌["选中符石"] then
-- --       self.子控件[符石镶嵌["选中符石"]]._spr["确定"] = nil
-- --     end
-- --     符石镶嵌["选中符石"] = a
-- --     self.子控件[a]._spr["确定"] = true
-- --     if self.子控件[a]._spr["物品"] then
-- --       self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 10, 0, w, h, "无操作", a)
-- --     end
-- --   end
-- --   if 符石镶嵌["选中星石"] and 符石镶嵌.星石网格.子控件[符石镶嵌["选中星石"]]._spr then
-- --     符石镶嵌.星石网格.子控件[符石镶嵌["选中星石"]]._spr["确定"] = nil
-- --   end
-- --   符石镶嵌["选中星石"]=nil
-- -- end

-- function 道具网格:左键弹起(x, y, a, b, msg)
--   if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品禁止"] then
--     local x, y = self.子控件[a]["取坐标"](self.子控件[a])
--     local w, h = self.子控件[a]["取宽高"](self.子控件[a])
--     if 镶嵌道具选择["选中道具"] and self.子控件[镶嵌道具选择["选中道具"]]._spr["物品"] then
--       self.子控件[镶嵌道具选择["选中道具"]]._spr["确定"] = nil
--     end
--     镶嵌道具选择["选中道具"] = a
--     self.子控件[a]._spr["确定"] = true
--     self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 10, 0, w, h, "选择", a)
--   end
-- end
-- function 道具网格:置物品(data, zl, fl)
--   for i = 1, #self.子控件 do
--     if data[i] then
--       local lssj = __物品格子["创建"](当前)
--       lssj["置物品"](lssj, data[i], nil, "道具选择")
--       lssj["置偏移"](lssj, 10, 10)
--       self.子控件[i]["置精灵"](self.子控件[i], lssj)
--     else
--       self.子控件[i]["置精灵"](self.子控件[i])
--     end
--   end
-- end
-- local 添加 = 镶嵌道具选择["创建我的按钮"](镶嵌道具选择, __res:getPNGCC(3, 126, 563, 111, 36, true), "添加", 229, 300, "添加")
-- function 添加:左键弹起(x, y, msg)
--   local  xuanz=镶嵌道具选择["选中道具"]
--   if xuanz and 镶嵌道具选择["道具"][xuanz] then
--     if 镶嵌道具选择.操作界面 == "上古玉魄镶嵌" then
--       发送数据(当前,3800.6,{x操作="镶嵌",背包类型="道具",物品id=镶嵌道具选择.选中道具,镶嵌孔=镶嵌道具选择.pid})
--       镶嵌道具选择:置可见(false)
--     end
--   end
-- end
