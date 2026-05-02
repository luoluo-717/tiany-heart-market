local 助战修炼学习 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("助战修炼学习", 55+65 + abbr.py.x, 22 + abbr.py.y, 773, 483)
local 当前 =  多开数据.当前

function 助战修炼学习:初始化()
  local nsf = require("SDL.图像")(773, 480)
  if nsf:渲染开始() then
    置窗口背景("助战修炼学习", 0, 12, 720, 470, true):置透明(230):显示(0, 0)
    __res:getPNGCC(3, 973, 713, 43, 323)["显示"](__res:getPNGCC(3, 973, 713, 43, 323), 15, 116)
    __res:getPNGCC(3, 1028, 714, 40, 255)["显示"](__res:getPNGCC(3, 1028, 714, 40, 255), 375, 116)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
end

function 助战修炼学习:打开(助战)
  self.角色=助战
  self.助战编号=助战.助战编号
  self.角色.助战编号=self.助战编号
  self.助战id=助战.助战id
  self:置可见(true)
  self.修炼选中1 = 0
  self.修炼选中2 = 0
  self.人物修 = nil
  self.bb修 = nil
 -- table.print(助战修炼学习.角色技能)
  self:chongzhi()
  -- table.print(bpjn)
  self.选中技能 = nil
end

function 助战修炼学习:chongzhi()
  self.自身修炼列表:重置()
  self.召唤兽控制列表:重置()
  self:刷新显示()
end

function 助战修炼学习:刷新修炼(内容)
  助战修炼学习.角色["修炼"]=内容.人物
  助战修炼学习.角色["bb修炼"]=内容.bb
  -- print(助战修炼学习.角色["修炼"]["当前"])
  -- print(助战修炼学习.角色["bb修炼"]["当前"])
  self.自身修炼列表:重置()
    self.召唤兽控制列表:重置()
  self:刷新显示()
end

function 助战修炼学习:刷新显示()
  local nsf = require("SDL.图像")(700, 51)
  if nsf:渲染开始() then
    字体18:置颜色(__取颜色("白色"))
    字体18:取图像("伙伴自身修炼  当前：" .. 助战修炼学习.角色["修炼"]["当前"]):置混合(0):显示(50,0)
    字体18:取图像("伙伴宝宝修炼  当前：" .. 助战修炼学习.角色["bb修炼"]["当前"]):置混合(0):显示(410,0)
    nsf:渲染结束()
  end
  -- print(123123)
  self.图像 = nsf:到精灵()
  self.图像:置中心(0, -63)
end


local 自身修炼列表 = 助战修炼学习["创建列表"](助战修炼学习, "自身修炼列表", 58, 117+29, 295, 335)
function 自身修炼列表:初始化()
  self:置文字(字体18)
  self.行高度 = 40
  self.行间距 = 31
  self.选中精灵 = require('SDL.精灵')(0, 0, 0, self.宽度, 0):置颜色(255, 0, 240, 128)
  self.焦点精灵 = nil
end

function 自身修炼列表:重置()
  self.清空(self)
  local sxxx = {
    "攻击修炼",
    "防御修炼",
    "法术修炼",
    "抗法修炼",
    "猎术修炼"
  }
  self:置颜色(255, 255, 255)
  local lssj3 = __res:getPNGCC(1, 400, 127, 305, 18)["拉伸"](__res:getPNGCC(1, 400, 127, 305, 18), 290, 18)
  local lssj4 = __res:getPNGCC(1, 401, 145, 305, 16)["拉伸"](__res:getPNGCC(1, 401, 145, 305, 16), 288, 16)
  for i = 1, #sxxx do
    self.添加(self)
    local nsf = require("SDL.图像")(295, 40)
    if nsf["渲染开始"](nsf) then
      local lssj = 计算修炼等级经验(助战修炼学习.角色["修炼"][sxxx[i]][1], 助战修炼学习.角色["修炼"][sxxx[i]][3])
      local lssj2 = 助战修炼学习.角色["修炼"][sxxx[i]][2] / lssj
      if lssj2 > 1 then
        lssj2 = 1
      end
      lssj3["显示"](lssj3, 0, 22)
      lssj4["平铺"](lssj4, math.floor(288 * lssj2), 16)["显示"](lssj4["平铺"](lssj4, math.floor(288 * lssj2), 16), 1, 23)
      字体18["置颜色"](字体18, 255, 255, 255)
      字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["修炼"][sxxx[i]][1], 助战修炼学习.角色["修炼"][sxxx[i]][3]))["置混合"](字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["修炼"][sxxx[i]][1], 助战修炼学习.角色["修炼"][sxxx[i]][3])), 0)["显示"](字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["修炼"][sxxx[i]][1], 助战修炼学习.角色["修炼"][sxxx[i]][3]))["置混合"](字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["修炼"][sxxx[i]][1], 助战修炼学习.角色["修炼"][sxxx[i]][3])), 0), 0, 0)
      字体18["置颜色"](字体18, 39, 53, 81)
      字体18["取图像"](字体18, string.format("%s/%s", 助战修炼学习.角色["修炼"][sxxx[i]][2], lssj))["显示"](字体18["取图像"](字体18, string.format("%s/%s", 助战修炼学习.角色["修炼"][sxxx[i]][2], lssj)), 124, 22)
      nsf["渲染结束"](nsf)
    end
    self.子控件[i]["置精灵"](self.子控件[i], nsf["到精灵"](nsf))
  end
end

function 自身修炼列表:左键弹起(x, y, i, item, msg)
  local sxxx = {
    "攻击修炼",
    "防御修炼",
    "法术修炼",
    "抗法修炼",
    "猎术修炼"
  }
  助战修炼学习["人物修"] = sxxx[i]
end









local 召唤兽控制列表 = 助战修炼学习["创建列表"](助战修炼学习, "召唤兽控制列表", 417, 117+29, 295, 335)
function 召唤兽控制列表:初始化()
  self:置文字(字体18)
  self.行高度 = 40
  self.行间距 = 31
  self.选中精灵 = require('SDL.精灵')(0, 0, 0, self.宽度, 0):置颜色(1,255,1, 128)
  self.焦点精灵 = nil
end
function 召唤兽控制列表:重置()
  self.清空(self)
  local sxxx = {
    "攻击控制力",
    "防御控制力",
    "法术控制力",
    "抗法控制力"
  }
  self:置颜色(255, 255, 255)
  local lssj3 = __res:getPNGCC(1, 400, 127, 305, 18)["拉伸"](__res:getPNGCC(1, 400, 127, 305, 18), 290, 18)
  local lssj4 = __res:getPNGCC(1, 401, 145, 305, 16)["拉伸"](__res:getPNGCC(1, 401, 145, 305, 16), 288, 16)
  for i = 1, #sxxx do
    self.添加(self)
    local nsf = require("SDL.图像")(295, 40)
    if nsf["渲染开始"](nsf) then
      local lssj = 计算修炼等级经验(助战修炼学习.角色["bb修炼"][sxxx[i]][1], 助战修炼学习.角色["bb修炼"][sxxx[i]][3])
      local lssj2 = 助战修炼学习.角色["bb修炼"][sxxx[i]][2] / lssj
      if lssj2 > 1 then
        lssj2 = 1
      end
      lssj3["显示"](lssj3, 0, 22)
      lssj4["平铺"](lssj4, math.floor(288 * lssj2), 16)["显示"](lssj4["平铺"](lssj4, math.floor(288 * lssj2), 16), 1, 23)
      字体18["置颜色"](字体18, 255, 255, 255)
      字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["bb修炼"][sxxx[i]][1], 助战修炼学习.角色["bb修炼"][sxxx[i]][3]))["置混合"](字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["bb修炼"][sxxx[i]][1], 助战修炼学习.角色["bb修炼"][sxxx[i]][3])), 0)["显示"](字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["bb修炼"][sxxx[i]][1], 助战修炼学习.角色["bb修炼"][sxxx[i]][3]))["置混合"](字体18["取图像"](字体18, string.format("%s %s/%s", sxxx[i], 助战修炼学习.角色["bb修炼"][sxxx[i]][1], 助战修炼学习.角色["bb修炼"][sxxx[i]][3])), 0), 0, 0)
      字体18["置颜色"](字体18, 39, 53, 81)
      字体18["取图像"](字体18, string.format("%s/%s", 助战修炼学习.角色["bb修炼"][sxxx[i]][2], lssj))["显示"](字体18["取图像"](字体18, string.format("%s/%s", 助战修炼学习.角色["bb修炼"][sxxx[i]][2], lssj)), 124, 22)
      nsf["渲染结束"](nsf)
    end
    self.子控件[i]["置精灵"](self.子控件[i], nsf["到精灵"](nsf))
  end
end
function 召唤兽控制列表:左键弹起(x, y, i, item, msg)
  local sxxx = {
    "攻击控制力",
    "防御控制力",
    "法术控制力",
    "抗法控制力"
  }
  助战修炼学习["bb修"] = sxxx[i]
end
local 设为当前 = 助战修炼学习["创建我的按钮"](助战修炼学习, __res:getPNGCC(3, 2, 507, 124, 41, true), "设为当前", 390, 400+30, "设为当前")
function 设为当前:左键弹起(x, y, msg)
  发送数据(当前,2017,{人物=助战修炼学习["人物修"],bb=助战修炼学习["bb修"],助战编号=助战修炼学习.助战编号})
end






local 人物学习 = 助战修炼学习:创建我的按钮(__res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(115, 37), "人物学习", 100, 97,"角色学习")
function 人物学习:左键弹起(x, y, msg)
  if 助战修炼学习["人物修"] then
    发送数据(当前,2018,{人物=true,助战编号=助战修炼学习.助战编号})
  end
end

local bb学习 = 助战修炼学习:创建我的按钮(__res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(115, 37), "bb学习", 480, 97,"宝宝学习")
function bb学习:左键弹起(x, y, msg)
  if 助战修炼学习["bb修"] then
    发送数据(当前,2018,{bb=true,助战编号=助战修炼学习.助战编号})
  end
end



local 关闭 = 助战修炼学习:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 680, 0)
function 关闭:左键弹起(x, y, msg)
  助战修炼学习:置可见(false)
end
