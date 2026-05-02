local 助战加点 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("助战加点", 40 + abbr.py.x, 22 + abbr.py.y, 737, 480)
local 当前 =  多开数据.当前

local lsb = {
  "体质",
  "魔力",
  "力量",
  "耐力",
  "敏捷"
}
local lsb2 = {
  "命中",
  "伤害",
  "防御",
  "速度",
  "法伤",
  "法防"
}
local lssx = {
  ["体质"] = 0,
  ["魔力"] = 0,
  ["力量"] = 0,
  ["耐力"] = 0,
  ["敏捷"] = 0,
  
}
function 助战加点:初始化()
  local nsf = require("SDL.图像")(730, 480)
  if nsf["渲染开始"](nsf) then
    置窗口背景("助战加点", 0, 12, 730, 445, true):置透明(230):显示(0, 0)
    取属性背景(0, 0, 225, 300, true)["显示"](取属性背景(0, 0, 225, 300, true), 15, 75)
    local lssj = 取输入背景(0, 0, 138, 23)
    字体18["置颜色"](字体18, 255, 255, 255)
    for i = 1, #lsb2 do
      lssj["显示"](lssj, 88, 100 + (i - 1) * 44)
      字体18["取图像"](字体18, lsb2[i])["显示"](字体18["取图像"](字体18, lsb2[i]), 33, 100 + (i - 1) * 44)
    end
    lssj = __res:getPNGCC(1, 239, 339, 252, 17)
    for i = 1, #lsb do
      lssj["显示"](lssj, 353, 80 + (i - 1) * 68)
      字体18["取图像"](字体18, lsb[i])["显示"](字体18["取图像"](字体18, lsb[i]), 264, 78 + (i - 1) * 68)
    end
    字体18:取图像("1点1次"):显示(29+40+ (1 - 1) * 165, 406)
    字体18:取图像("50点1次"):显示(29+40+ (2 - 1) * 165, 406)
    字体18:取图像("潜能"):显示(29+80+126+ (2 - 1) * 165, 406)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
end
function 助战加点:显示(x, y)
    字体18["置颜色"](字体18, 255, 255, 255)
  for i = 1, #lsb do
    if 0 ~= lssx[lsb[i]] then
      字体18["显示"](字体18, x + 644, y + 81 + (i - 1) * 68, 助战加点.主角[lsb[i]] .. "+" .. lssx[lsb[i]])
    else
      字体18["显示"](字体18, x + 644, y + 81 + (i - 1) * 68, 助战加点.主角[lsb[i]])
    end
  end
  字体18["显示"](字体18, x + 445, y + 406, 助战加点.主角["潜力"])
  if self.数据 then
    self.数据["显示"](self.数据, x, y)
  end
end
function 助战加点:重置()
  for i = 1, #lsb do
    self[lsb[i] .. "条"]["置位置"](self[lsb[i] .. "条"], math.floor(self.主角[lsb[i]] / 1200 * 100))
  end
  lssx = {
    ["体质"] = 0,
    ["魔力"] = 0,
    ["力量"] = 0,
    ["耐力"] = 0,
    ["敏捷"] = 0,
    
  }
  local nsf = require("SDL.图像")(240, 340)
  if nsf["渲染开始"](nsf) then
    for i = 1, #lsb2 do
      字体18["置颜色"](字体18, 39, 53, 81)
      字体18["取图像"](字体18, self.主角[lsb2[i]])["显示"](字体18["取图像"](字体18, self.主角[lsb2[i]]), 100, 104 + (i - 1) * 44)
    end
    nsf["渲染结束"](nsf)
  end
  self.剩余潜力=self.主角["潜力"]
  self.数据 = nsf["到精灵"](nsf)
end
function 助战加点:打开(助战)
  self:置可见(true)
  self.主角=助战
  self.一点一次按钮:置选中(true)
  self.加点模式=1
  助战加点["重置"](助战加点)
end


local sdsawe={"一点一次","十点一次"}
for i = 1, #sdsawe do
  local 临时函数 = 助战加点["创建我的单选按钮"](助战加点, __res:getPNGCC(2, 1172, 106, 27, 27, true), __res:getPNGCC(2, 1171, 74, 27, 27, true), sdsawe[i] .. "按钮", 31+ (i - 1) * 165, 401 )
  function  临时函数:左键弹起(x, y)
    if sdsawe[i] == "一点一次" then
      助战加点.加点模式=1
    elseif sdsawe[i] == "十点一次" then
      助战加点.加点模式=50
    end
  end
end


local 关闭 = 助战加点["创建我的按钮"](助战加点, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 690, 0)
function 关闭:左键弹起(x, y, msg)
  助战加点["置可见"](助战加点, false)
end
for i = 1, #lsb do
  local 临时函数 = 助战加点["创建进度"](助战加点, lsb[i] .. "条", 354, 81 + (i - 1) * 68, 250, 16)
  local lssj = __res:getPNGCC(1, 401, 145, 305, 16)["拉伸"](__res:getPNGCC(1, 401, 145, 305, 16), 250, 16)["到精灵"]((__res:getPNGCC(1, 401, 145, 305, 16)["拉伸"](__res:getPNGCC(1, 401, 145, 305, 16), 250, 16)))
 function  临时函数:初始化()
    self:置精灵(lssj)
  end
  local 临时函数2 = 助战加点["创建我的按钮"](助战加点, __res:getPNGCC(1, 641, 320, 29, 29), lsb[i] .. "加", 612, 74 + (i - 1) * 68)
 function  临时函数2:左键弹起(x, y, msg)
    -- if 助战加点.主角["潜力"] - lssx["潜能"] > 0 then
    --   lssx[lsb[i]] = lssx[lsb[i]] + 1
    --   lssx["潜能"] = lssx["潜能"] + 1
    --   -- 助战加点[lsb[i] .. "条"]["置位置"](助战加点[lsb[i] .. "条"], math.floor(助战加点.主角[lsb[i]] / 1200 * 100))
    -- end
    if 助战加点.剩余潜力 > 0 then
      local 取剩余=助战加点.剩余潜力-助战加点.加点模式
      if 取剩余<=0 then
        取剩余=助战加点.剩余潜力
      else 
        取剩余=助战加点.加点模式
      end
      -- print(取剩余)
      lssx[lsb[i]] = lssx[lsb[i]] + 取剩余
      助战加点.剩余潜力 = 助战加点.剩余潜力 - 取剩余
      -- 助战加点[lsb[i] .. "条"]["置位置"](助战加点[lsb[i] .. "条"], math.floor(角色信息[lsb[i]] / 1200 * 100))
    end
  end
  local 临时函数3 = 助战加点["创建我的按钮"](助战加点, __res:getPNGCC(1, 601, 319, 29, 29), lsb[i] .. "减", 320, 74 + (i - 1) * 68)
 function  临时函数3:左键弹起(x, y, msg)
    -- if lssx[lsb[i]] > 0 then
    --   lssx[lsb[i]] = lssx[lsb[i]] - 1
    --   lssx["潜能"] = lssx["潜能"] - 1
    --   -- 助战加点[lsb[i] .. "条"]["置位置"](助战加点[lsb[i] .. "条"], math.floor(助战加点.主角[lsb[i]] / 1200 * 100))
    -- end
    if lssx[lsb[i]] > 0 then
      local 取剩余=lssx[lsb[i]]-助战加点.加点模式
      if 取剩余<=0 then
        取剩余=lssx[lsb[i]]
      else 
        取剩余=助战加点.加点模式
      end
      lssx[lsb[i]] = lssx[lsb[i]] - 取剩余
      助战加点.剩余潜力 = 助战加点.剩余潜力 + 取剩余
      -- 助战加点[lsb[i] .. "条"]["置位置"](助战加点[lsb[i] .. "条"], math.floor(角色信息[lsb[i]] / 1200 * 100))
    end
  end
end
local 确认加点 = 助战加点["创建我的按钮"](助战加点, __res:getPNGCC(3, 2, 507, 124, 41, true), "确认加点", 590, 400, "确认加点")
function 确认加点:左键弹起(x, y, msg)
  发送数据(当前,2008,{加点=lssx,助战编号=助战加点.主角.助战编号})
  助战加点["置可见"](助战加点, false)
end
