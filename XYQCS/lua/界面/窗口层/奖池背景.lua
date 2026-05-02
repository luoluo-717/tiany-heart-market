local 奖池背景 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("奖池背景",80+67 + abbr.py.x, 20 + abbr.py.y,696, 492)
local 当前=多开数据.当前

function 奖池背景:初始化()
  local nsf = require("SDL.图像")(696, 380)
  if nsf["渲染开始"](nsf) then
      self.背景图=  __res:取图像(__res:取地址('shape/pic/', 0xA9000004))
      self.背景图:显示(0, 0)  -- 显示背景
      self.浅蓝=  __res:取图像(__res:取地址('shape/pic/', 0xA9000002))
      self.黄色=  __res:取图像(__res:取地址('shape/pic/', 0xA9000001))
      self.紫色=  __res:取图像(__res:取地址('shape/pic/', 0xA9000003))
  end
  self:置精灵(nsf["到精灵"](nsf))
end
function 奖池背景:打开()
  self:置可见(true)
  self.抽中物品列表 = 多开数据[当前].抽中物品列表 or {}
  self.道具 = self.抽中物品列表
  self.道具网格:置物品(self.道具)
  self:重置数据()  -- 渲染物品名称、品质框等
end

function 奖池背景:重置数据()
  local nsf = require("SDL.图像")(700, 380)
  if nsf["渲染开始"](nsf) then
      self.背景图:显示(0, 0)

      local 白格子背景=__res:getPNGCC(3, 132, 506, 50, 50)
      local 物品数量 = #self.抽中物品列表
      local is = 0
      local 横,竖
      if 物品数量 == 10 then
          横,竖=5,2
      else
          横,竖=1,1
      end
      for h=1,竖 do
        for l=1,横 do
          is = is + 1
          白格子背景:显示((l-1)* 60 + 180,(h-1) * 70 + 175)
        end
      end

      if #self.抽中物品列表 > 0 then
          local 列数 = 5  -- 每行5个，适配十连抽
          local 间距X = 60  -- 水平间距（避免物品重叠）
          local 间距Y = 70  -- 垂直间距（区分2行）
          for 索引, 物品 in ipairs(self.抽中物品列表) do
              -- 计算物品坐标（按索引分行列）
              local 行 = math.floor((索引 - 1) / 列数)  -- 0=第1行，1=第2行
              local 列 = (索引 - 1) % 列数             -- 0-4=第1-5列
              local x = 180 + 列 * 间距X  -- 左偏移80，避免贴边
              local y = 175 + 行 * 间距Y -- 上偏移100，避开标题
              if 物品.是否稀有 == 3 then
                  self.紫色:显示(x, y)  -- 稀有=紫色
              elseif 物品.是否稀有 == 2 then
                  self.黄色:显示(x, y)  -- 优秀=黄色
              else
                  self.浅蓝:显示(x, y)  -- 普通=浅蓝
              end
             
          end
      end
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf["到精灵"](nsf)
  self:置精灵(self.图像)
end
function 奖池背景:刷新()
  self.抽中物品列表 = 多开数据[当前].抽中物品列表 or {}
  self.道具 = self.抽中物品列表  -- 同步更新道具
  self.道具网格:置物品(self.道具)  -- 道具网格刷新
  self:重置数据()
end
local 道具网格 = 奖池背景["创建网格"](奖池背景, "道具网格", 175, 175, 400, 400)
function 道具网格:左键弹起(x, y, a, b, msg)
  if 奖池背景["材料位置"] and self.子控件[奖池背景["材料位置"]] then
    self.子控件[奖池背景["材料位置"]]._spr["确定"] = nil
  end
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
   self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", a)
  end
end
function 道具网格:置物品(data)
  奖池背景["材料位置"] = nil
  self:创建格子(60, 65, 0, 0,2, 5)
  for i = 1, #self.子控件 do
    if data[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], nil, "奖池背景")
      lssj["置偏移"](lssj, 5, 5)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end
local zhuangb = 奖池背景["创建网格"](奖池背景, "zhuangb", 360,400, 67, 67)
function zhuangb:初始化()
  self:创建格子(67, 67, 0, 0, 6, 6, true)
end
function zhuangb:zhuzhuangb(zb)
  for i = 1, #self.子控件 do
    if zb then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, zb, nil, "奖池背景")
      lssj["置偏移"](lssj, 10, 10)
      lssj["总类禁止111"](lssj, 2)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end
local 确定按钮 = 奖池背景:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(110, 35), "确定", 270, 310, "确定")
function 确定按钮:左键弹起(x, y)
  奖池背景:置可见(false)
  多开数据[当前].抽中物品列表 = {}
end