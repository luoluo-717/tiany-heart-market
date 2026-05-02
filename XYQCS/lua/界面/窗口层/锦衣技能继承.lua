local 锦衣技能继承 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("锦衣技能继承",160 + abbr.py.x,50 + abbr.py.y,750,450)
local 当前 =  多开数据.当前
function 锦衣技能继承:初始化()
  local nsf = require("SDL.图像")(750, 450)
  if nsf["渲染开始"](nsf) then
    置窗口背景("焕彩继承",0,12,650,370,true):显示(0,0)
    取灰色背景(0, 0, 365, 275, true)["显示"](取灰色背景(0, 0, 365, 275, true), 24+240, 118-28)
    字体18["置颜色"](字体18, __取颜色("白色"))
    字体18["取图像"](字体18, "锦衣")["显示"](字体18["取图像"](字体18, "锦衣"), 124, 130)
    __res:取图像(__res:取地址("shape/ui/", 0xfb4dd656)):显示(59, 245) 


  end
  self:置精灵(nsf["到精灵"](nsf))
end
function 锦衣技能继承:打开(data)
  self:置可见(true)
  self.数据 = data
  self.重置(self)
end
function 锦衣技能继承:重置()
  local nsf = require("SDL.图像")(409, 69)
  if nsf["渲染开始"](nsf) then
    nsf["渲染结束"](nsf)
  end
  锦衣技能继承["图像"] = nsf["到精灵"](nsf)
  锦衣技能继承["图像"]["置中心"](锦衣技能继承["图像"], 0, -398)
  self.道具网格["置物品"](self.道具网格, 多开数据[多开数据.当前].__主控["道具列表"])
  self.材料网格["置物品"](self.材料网格, {})
end
function 锦衣技能继承:刷新道具(data)
  self.道具网格:置物品(data, a)
end

local 关闭 = 锦衣技能继承["创建我的按钮"](锦衣技能继承, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 367+260, 0)
function 关闭:左键弹起(x, y, msg)
  锦衣技能继承["置可见"](锦衣技能继承, false)
end


local 道具网格 = 锦衣技能继承["创建网格"](锦衣技能继承, "道具网格", 43+246, 128-28, 318, 252)
function 道具网格:初始化()
  self:创建格子(55, 55, 10, 10, 4, 5)
end
function 道具网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr["物品"] then
    for i = 1, #锦衣技能继承["材料网格"]["子控件"] do
      if not 锦衣技能继承["材料网格"]["子控件"][i]._spr["物品"] then
        self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170, 86, w, h, "选择", a)
        锦衣技能继承["材料网格"]["置物品"](锦衣技能继承["材料网格"], self.子控件[a]._spr["物品"], i)
        锦衣技能继承["材料网格"]["子控件"][i]._spr["物品"]["原始编号"] = a
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


local 材料网格 = 锦衣技能继承["创建网格"](锦衣技能继承, "材料网格", 180-120, 130, 55, 180)
function 材料网格:初始化()
  self:创建格子(55, 55, 55, 1, 2, 1)
end
function 材料网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr["物品"] then
    -- self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 170, 86, w, h, "选择", a)
    锦衣技能继承["道具网格"]["置物品"](锦衣技能继承["道具网格"], self.子控件[a]._spr["物品"], self.子控件[a]._spr["物品"]["原始编号"])
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
    name = "继承",
    x = 130,
    y = 200,
    tcp = __res:getPNGCC(3, 880, 331, 86, 37,true)["拉伸"](__res:getPNGCC(3, 880, 331, 86, 37,true), 70, 33),
    font = "继承"
  },
}) do
  local 临时函数 = 锦衣技能继承["创建我的按钮"](锦衣技能继承, v.tcp, v.name, v.x, v.y, v.font)
 function  临时函数:左键弹起(x, y)
    if v.name == "继承" then
          if 锦衣技能继承["材料网格"]["子控件"][1]._spr["物品"] and 锦衣技能继承["材料网格"]["子控件"][2]._spr["物品"] then
          发送数据(当前,3739.3, {
            格子1 = 锦衣技能继承["材料网格"]["子控件"][1]._spr["物品"]["原始编号"],
            格子2 = 锦衣技能继承["材料网格"]["子控件"][2]._spr["物品"]["原始编号"]
            
          })
          锦衣技能继承:重置()
          -- 锦衣技能继承["置可见"](锦衣技能继承, false)
          else
            多开数据[多开数据.当前].__UI弹出["提示框"]["打开"](多开数据[多开数据.当前].__UI弹出["提示框"], "#Y请放入锦衣")
          end
    end
  end
end