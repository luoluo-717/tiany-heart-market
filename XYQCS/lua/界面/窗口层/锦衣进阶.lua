local 锦衣进阶 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("锦衣进阶",160 + abbr.py.x,50 + abbr.py.y,750,450)
local 当前 =  多开数据.当前
function 锦衣进阶:初始化()
  local nsf = require("SDL.图像")(750, 450)
  if nsf["渲染开始"](nsf) then
    置窗口背景("锦衣洗练",0,12,650,370,true):显示(0,0)
    取灰色背景(0, 0, 365, 275, true)["显示"](取灰色背景(0, 0, 365, 275, true), 24+240, 118-28)
    字体18["置颜色"](字体18, __取颜色("白色"))
    字体18["取图像"](字体18, "锦衣")["显示"](字体18["取图像"](字体18, "锦衣"), 124, 130)
  end
  self:置精灵(nsf["到精灵"](nsf))
end
function 锦衣进阶:打开(data)
  self:置可见(true)
  self.数据 = data
  self.重置(self)
end
function 锦衣进阶:重置()
  local nsf = require("SDL.图像")(409, 69)
  if nsf["渲染开始"](nsf) then
    nsf["渲染结束"](nsf)
  end
  锦衣进阶["图像"] = nsf["到精灵"](nsf)
  锦衣进阶["图像"]["置中心"](锦衣进阶["图像"], 0, -398)
  self.道具网格["置物品"](self.道具网格, 多开数据[多开数据.当前].__主控["道具列表"])
  self.材料网格["置物品"](self.材料网格, {})

end
function 锦衣进阶:刷新道具(data)
  self.道具网格:置物品(data, a)
end

local 关闭 = 锦衣进阶["创建我的按钮"](锦衣进阶, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 367+260, 0)
function 关闭:左键弹起(x, y, msg)
  锦衣进阶["置可见"](锦衣进阶, false)
end


local 道具网格 = 锦衣进阶["创建网格"](锦衣进阶, "道具网格", 43+246, 128-28, 318, 252)
function 道具网格:初始化()
  self:创建格子(55, 55, 10, 10, 4, 5)
end
function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr["物品"] then
    for i = 1, #锦衣进阶["材料网格"]["子控件"] do
      if not 锦衣进阶["材料网格"]["子控件"][i]._spr["物品"] then
        self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170, 86, w, h, "选择", a)
        锦衣进阶["材料网格"]["置物品"](锦衣进阶["材料网格"], self.子控件[a]._spr["物品"], i)
        锦衣进阶["材料网格"]["子控件"][i]._spr["物品"]["原始编号"] = a
        self:置物品(nil, a)
        break
      end
    end
  end
end
function 道具网格:置物品(data, bh)
  if not bh then
    for i = 1, #self.子控件 do
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], "白格子", "战斗道具")
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    end
  else
    local lssj = __物品格子["创建"](当前)
    lssj["置物品"](lssj, data, "白格子", "战斗道具")
    self.子控件[bh]["置精灵"](self.子控件[bh], lssj)
  end
end
local 材料网格 = 锦衣进阶["创建网格"](锦衣进阶, "材料网格", 180-65, 55+100, 155, 55)
function 材料网格:初始化()
  self:创建格子(55, 55, 0, 45, 1, 1)
end
function 材料网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr["物品"] then
    -- self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170, 86, w, h, "选择", a)
    锦衣进阶["道具网格"]["置物品"](锦衣进阶["道具网格"], self.子控件[a]._spr["物品"], self.子控件[a]._spr["物品"]["原始编号"])
    self:置物品(nil, a)
  end
end
function 材料网格:置物品(数据, bh)
  if not bh then
    for i = 1, #self.子控件 do
      local lssj = __商店格子["创建"](当前)
      lssj["置物品"](lssj, 数据[i], "制造")
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    end
  else
    local lssj = __商店格子["创建"](当前)
    lssj["置物品"](lssj, 数据, "制造")
    self.子控件[bh]["置精灵"](self.子控件[bh], lssj)
  end
end
for i, v in ipairs({
  {
    name = "洗练",
    x = 107,
    y = 250,
    tcp = __res:getPNGCC(3, 880, 331, 86, 37,true)["拉伸"](__res:getPNGCC(3, 880, 331, 86, 37,true), 70, 33),
    font = "洗练"
  },
}) do
  local 临时函数 = 锦衣进阶["创建我的按钮"](锦衣进阶, v.tcp, v.name, v.x, v.y, v.font)
 function  临时函数:左键弹起(x, y)
    if v.name == "洗练" then
          if 锦衣进阶["材料网格"]["子控件"][1]._spr["物品"] then
          发送数据(当前,3739.1, {
            ["格子"] = 锦衣进阶["材料网格"]["子控件"][1]._spr["物品"]["原始编号"]
          })
          -- 锦衣进阶:重置()
          -- 锦衣进阶["置可见"](锦衣进阶, false)
          else
            多开数据[多开数据.当前].__UI弹出["提示框"]["打开"](多开数据[多开数据.当前].__UI弹出["提示框"], "#Y请放入锦衣")
          end
    end
  end
end


local 介绍按钮 = 锦衣进阶:创建我的按钮(__res:getPNGCC(3, 880, 331, 86, 37,true):拉伸(80,29),"介绍按钮",10,42,"详情")
function 介绍按钮:左键弹起(x, y)
    多开数据[多开数据.当前].__UI界面.窗口层.锦衣洗练介绍:打开()

end
