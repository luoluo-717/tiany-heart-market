local 成就系统 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("成就系统",80+67 + abbr.py.x, 20+5 + abbr.py.y, 555+29, 440+30+30)

local 当前 = 多开数据.当前
function 成就系统:初始化()
  local nsf = require("SDL.图像")(555+29, 440+30+30)
  if nsf["渲染开始"](nsf) then
    -- __res:getPNGCC(5, 0, 0, 683, 450):显示(0,5)
    -- 字体20:置颜色(__取颜色("浅黑"))
    -- 字体20:取图像("伙 伴"):显示(683/2-20,9)
    置窗口背景2("功成名就", 0, 12, 497+60,440+30, true):显示(0, 0)
    取灰色背景(0, 0,406,410, true):显示(134, 38+18)
    self.kuangkk=__res:getPNGCC(4, 208, 623, 378, 73):到精灵()
    -- 字体18:置颜色(__取颜色("白色"))
    -- 字体18:取图像("20级"):显示(20,79)
    --取白色背景(0, 0, 440, 300, true)["显示"](取白色背景(0, 0, 440, 300, true), 20, 56)
  end
  self:置精灵(nsf["到精灵"](nsf))
end

function 成就系统:打开(内容,状态)
  self:置可见(true)
  self.chengjiu=内容.成就
  self.wancheng=内容.完成
  self.lijkg={}
	self.物品={}
  for k,v in pairs(内容.成就) do
    -- print(k)
    -- table.print(v)
    self.lijkg[k]={}
    for a,b in pairs(v) do
			self.lijkg[k][b.排序]=b
			self.lijkg[k][b.排序].名称=a
      
      if b.物品 then
        self.lijkg[k][b.排序].图标={"shape/dj/",取物品("青龙石")[12]}
      else
        local dizhi="shape/dj/"
        if b.图标[1]=="" then
          dizhi="shape/mx/"
        end
        self.lijkg[k][b.排序].图标={dizhi,b.图标[2]}
      end
      
      local 是否完成=false
			local  完成 = b.总进度
			if self.wancheng[k][b.名称] then
				完成=self.wancheng[k][b.名称]
			else
				是否完成=true
			end
			if 完成>=self.lijkg[k][b.排序].总进度 then
			    完成=self.lijkg[k][b.排序].总进度
			end
			local wad=完成.."/"..self.lijkg[k][b.排序].总进度
      self.lijkg[k][b.排序].完成情况={是否完成=是否完成,进度=wad}
		end
  end
  self.状态=状态 or"升级比赛"
  -- print(#self.lijkg[self.状态])
  self[self.状态]:置选中(true)
  self.youcewangge:置数据()
end
function 成就系统:刷新数据(内容)
	self.wancheng=内容.完成
  self.lijkg={}
  for k,v in pairs(self.chengjiu) do
    -- print(k)
    -- table.print(v)
    self.lijkg[k]={}
    for a,b in pairs(v) do
			self.lijkg[k][b.排序]=b
			self.lijkg[k][b.排序].名称=a
      if b.物品 then
        self.lijkg[k][b.排序].图标={"shape/dj/",取物品("青龙石")[12]}
      else
        local dizhi="shape/dj/"
        if b.图标[1]=="" then
          dizhi="shape/mx/"
        end
        self.lijkg[k][b.排序].图标={dizhi,b.图标[2]}
      end
      
      local 是否完成=false
			local  完成 = b.总进度
			if self.wancheng[k][b.名称] then
				完成=self.wancheng[k][b.名称]
			else
				是否完成=true
			end
			if 完成>=self.lijkg[k][b.排序].总进度 then
			    完成=self.lijkg[k][b.排序].总进度
			end
			local wad=完成.."/"..self.lijkg[k][b.排序].总进度
      self.lijkg[k][b.排序].完成情况={是否完成=是否完成,进度=wad}
		end
  end
  self.youcewangge:置数据()
end
local youcewangge= 成就系统["创建网格"](成就系统, "youcewangge", 124+23, 50+14, 393, 393)
function youcewangge:初始化()
  -- self:创建格子(378, 73, 0, 0, 1, 1)
end

function youcewangge:置数据()
  self:创建格子(378, 73, 0, 0, #成就系统.lijkg[成就系统.状态], 1, true)
  -- table.print(成就系统.lijkg[成就系统.状态])
  for i = 1, #self["子控件"] do
    local lssj = __成就格子["创建"]()
    lssj["置数据"](lssj, 成就系统.lijkg[成就系统.状态][i],成就系统.状态)
    self["子控件"][i]["置精灵"](self["子控件"][i], lssj)
    if 成就系统.状态=="七日签到" and not 成就系统.lijkg[成就系统.状态][i].完成情况.是否完成 then
      local 按钮 = self.子控件[i]["创建我的按钮"](self.子控件[i], __res:getPNGCC(2, 0, 961, 227, 60):拉伸(84, 30), "按1钮" .. i, 266, 35,"签到") 
      按钮:置可见(true,true)
      function  按钮:左键单击(x, y, msg)
        发送数据(当前,6309,{成就系统.lijkg[成就系统.状态][i].名称})
      end
    end
  end
end


    -- tcp = __res:getPNGCC(1, 449, 28, 174, 35, true):拉伸(114,31),
    -- tcp2 = __res:getPNGCC(1, 964, 459, 173, 35, true):拉伸(114,31),
    -- tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
    -- tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
for i, v in ipairs({
  {
    name = "升级比赛",
    x = 11,
    y = 56+(1-1)*46,
    tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
    tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
    font = "升级比赛"
  },
  -- {
  --   name = "日常任务",
  --   x = 11,
  --   y = 56+(2-1)*46,
  --   tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
  --   tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
  --   font = "日常任务"
  -- },
  {
    name = "梦幻剧情",
    x = 11,
    y = 56+(2-1)*46,
    tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
    tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
    font = "梦幻剧情"
  },
  {
    name = "副本首通",
    x = 11,
    y = 56+(3-1)*46,
    tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
    tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
    font = "副本首通"
  },
  -- {
  --   name = "首杀通关",
  --   x = 11,
  --   y = 56+(5-1)*46,
  --   tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
  --   tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
  --   font = "首杀通关"
  -- },
  -- {
  --   name = "限时活动",
  --   x = 11,
  --   y = 56+(6-1)*46,
  --   tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
  --   tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
  --   font = "限时活动"
  -- },
  {
    name = "打造成就",
    x = 11,
    y = 56+(4-1)*46,
    tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
    tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
    font = "打造成就"
  },
  {
    name = "炼妖成就",
    x = 11,
    y = 56+(5-1)*46,
    tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
    tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
    font = "炼妖成就"
  },
  {
    name = "七日签到",
    x = 11,
    y = 56+(6-1)*46,
    tcp = __res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(114,31),
    tcp2 = __res:getPNGCC(1, 963, 495, 175, 43, true):拉伸(114,31),
    font = "七日签到"
  },
}) do
  local 临时函数 = 成就系统["创建我的单选按钮"](成就系统, v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
  function  临时函数:左键弹起(x, y)
    成就系统.状态=v.name
    成就系统.youcewangge:置数据()
  end
end


local 关闭 = 成就系统["创建我的按钮"](成就系统, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 500+29, 0)
function 关闭:左键弹起(x, y, msg)
  成就系统["置可见"](成就系统, false)
end