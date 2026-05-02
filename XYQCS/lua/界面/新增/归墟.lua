local 归墟 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("归墟",258+abbr.py2.x,140+abbr.py2.y,367+10,157+100+87)
local 当前 = 多开数据.当前

function 归墟:初始化()
  local nsf = require("SDL.图像")(367+10, 157+80+87)
  if nsf["渲染开始"](nsf) then
    xiao置窗口背景("轮回归墟", 0, 12, 367, 157+107, true):显示( 0, 0)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.选中头像 = nil
  self.准备状态 = {} -- 存储每个头像的准备状态
  self.标题精灵 = nil -- 用于存储标题的精灵
  self.准备状态精灵 = {} -- 用于存储准备状态精灵
  self.允许移动=true
end

function 归墟:打开(类型)
  self.副本类型 = 类型.副本类型 -- 保存副本类型
  self:置可见(true)
  self.准备状态 = {}
  if 类型 and 类型.head then
    归墟.头像网格:置头像(类型.head)
    for i = 1, #类型.head do
      self.准备状态[i] = false
    end
  end
  
  self:重置()
end

function 归墟:重置()
  local 标题nsf = require("SDL.图像")(367, 157+70)
  if 标题nsf["渲染开始"](标题nsf) then
    字体18:置颜色(255, 255, 255)
    if self.副本类型 == "共生" then
      字体18:取图像("轮回归墟·共生"):显示(124, 45)
    elseif self.副本类型 == "激战" then
      字体18:取图像("轮回归墟·激战"):显示(124, 45)
    elseif self.副本类型 == "悟空" then
      字体18:取图像("轮回归墟·悟空"):显示(124, 45)
    elseif self.副本类型 == "应变" then
      字体18:取图像("轮回归墟·应变"):显示(124, 45)
    end
    字体16:置颜色(255, 255, 255)
    if self.副本类型 == "共生" then
      字体16:取图像("难度：★★★"):显示(130, 65)
    elseif self.副本类型 == "激战" then
      字体16:取图像("难度：★★★★"):显示(127, 65)
    elseif self.副本类型 == "悟空" then
      字体16:取图像("难度：★★★★★"):显示(123, 65)
    elseif self.副本类型 == "应变" then
      字体16:取图像("难度：★★★★★★"):显示(120, 65)
    end
    
    标题nsf["渲染结束"](标题nsf)
  end
  self.标题精灵 = 标题nsf["到精灵"](标题nsf)
  self.准备状态精灵 = {}
  for i = 1, 5 do
    local 状态nsf = require("SDL.图像")(50, 20)
    if 状态nsf["渲染开始"](状态nsf) then
      if self.准备状态[i] == true then
        字体16:置颜色(0, 255, 0) -- 绿色
        字体16:取图像("已准备"):显示(0, 0)
      else
        字体16:置颜色(255, 0, 0) -- 红色
        字体16:取图像("未准备"):显示(0, 0)
      end
      状态nsf["渲染结束"](状态nsf)
    end
    self.准备状态精灵[i] = 状态nsf["到精灵"](状态nsf)
  end
end

local 关闭 = 归墟["创建我的按钮"](归墟, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 403-75, 0)
function 关闭:左键弹起(x, y, msg)
  归墟["置可见"](归墟, false)
end

local 确定 = 归墟["创建我的按钮"](归墟, __res:getPNGCC(3, 2, 507, 124, 41, true)["拉伸"](__res:getPNGCC(3, 2, 507, 124, 41, true), 123, 41), "确定", 153-26, 206, "确定")
function 确定:左键弹起(x, y, msg)
  local 全部准备 = true
  for i = 1, 5 do
    if 归墟.准备状态[i] == false then
      全部准备 = false
      break
    end
  end
  if 全部准备 then
    if 归墟.副本类型 == "共生" then
      发送数据(当前 or self and self.当前, 499, {Tip='Read'})
    elseif 归墟.副本类型 == "激战" then
      发送数据(当前 or self and self.当前, 500, {Tip='Read'})
    elseif 归墟.副本类型 == "悟空" then
      发送数据(当前 or self and self.当前, 501, {Tip='Read'})
    elseif 归墟.副本类型 == "应变" then
      发送数据(当前 or self and self.当前, 502, {Tip='Read'})
    end
    归墟["置可见"](归墟, false)
  else
    多开数据[多开数据.当前].__UI弹出.提示框:打开("#Y还有队员未准备")
  end
end

local 头像网格 = 归墟:创建网格("头像网格", 15, 100, 330, 100)

function 头像网格:初始化()
  self:创建格子(50, 50, 5, 20, 1, 5) -- 5列1行，总共5个头像
end

function 头像网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
    if 归墟.选中头像 then
      self.子控件[归墟.选中头像]._spr.确定1 = nil
    end
    归墟.选中头像 = a
    if 归墟.准备状态[a] ~= nil then
      归墟.准备状态[a] = not 归墟.准备状态[a]
      归墟:重置() -- 重新生成准备状态精灵
    end
    
    self.子控件[a]._spr.确定1 = true
  end
end

function 头像网格:显示(x, y)
  for i = 1, #self.子控件 do
    if self.子控件[i] and self.子控件[i]._spr then
      local 格子x = x + self.x + (i-1) * (50 + 20)
      local 格子y = y + self.y
      self.子控件[i]._spr:显示(格子x, 格子y)
    end
  end
end

function 头像网格:置头像(数据)
  for i = 1, #头像网格.子控件 do
    local lssj = __头像格子.创建(当前)
    
    if 数据[i] then
      local 头像数据 = {
        模型 = 数据[i]  -- 这里假设数据[i]就是模型ID
      }
      lssj:置头像(头像数据, "归墟")
    else
      lssj:置头像(nil, "归墟")
    end
    
    头像网格.子控件[i]:置精灵(lssj)
  end
end
function 归墟:显示(x, y)
  if self.标题精灵 then
    self.标题精灵:显示(x, y)
  end
  -- 头像网格:显示(x, y)
  for i = 1, #self.准备状态精灵 do
    if self.准备状态精灵[i] then
      local 状态x = x + 15 + (i-1) * (50 + 20) + 2  -- 与头像x坐标对齐
      local 状态y = y + 100 + 50 + 5  -- 在头像下方
      self.准备状态精灵[i]:显示(状态x, 状态y)
    end
  end
end