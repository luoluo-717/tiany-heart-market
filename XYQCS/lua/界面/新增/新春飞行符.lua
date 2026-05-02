-- local 新春飞行符 = __UI界面["窗口层"]["创建窗口"](__UI界面["窗口层"], "新春飞行符", 0,0, 100, 100)
local 新春飞行符 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("新春飞行符",0,0,660,310)
local 当前 = 多开数据.当前

function 新春飞行符:初始化()
  __置窗口坐标(self)
end
function 新春飞行符:显示(x, y)
  if self.图像 then
    self.图像["显示"](self.图像, x + 20, y + 74)
  end
end
function 新春飞行符:左键弹起(x, y)
  if self.图像["检查透明"](self.图像, x, y) then
    local xx, yy = self.图像["取坐标"](self.图像)
    -- x, y = x - xx, y - yy
    -- print(x,y)
    local 鼠标坐标 = 生成XY(math.floor((x - xx)/(self.图像.宽度/(self.大地图宽度/20))),math.floor((y - yy)/(self.图像.高度/(self.大地图高度/20))))
    -- table.print(鼠标坐标)
    发送数据(当前 or self and self.当前,3740.1,{地图=self.smap,zb={x=鼠标坐标.x,y=鼠标坐标.y}})
    新春飞行符["置可见"](新春飞行符, false)
  end
end
function 新春飞行符:打开(id)
  self:置可见(true)
  if self.smap and self.smap ~= id then
    self:重置(id)
  elseif not self.smap then
    self:重置(id)
  end
end
local 关闭 = 新春飞行符["创建我的按钮"](新春飞行符, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 0, 0)
function 关闭:左键弹起(x, y, msg)
  新春飞行符["置可见"](新春飞行符, false)
end
local 地图大小={
  [1092]={z=4480,y=3020},
  [1001]={z=11000,y=5600},
  [1501]={z=5760,y=2880},
  [1070]={z=3200,y=4200},
  [1208]={z=3840,y=2400},
  [1226]={z=3200,y=2400},
  [1040]={z=3280,y=2480},
  [1173]={z=12800,y=2400},
}
function 新春飞行符:重置(id)
  self.smap = id
  self.图像 = nil
  local Smap, Smapa = __小地图资源加载(id)
  if Smapa then
    self.图像 = __res["取精灵"](__res, __res["取地址"](__res, "shape/smap/", Smapa))
    local w, h = self.图像["宽度"] + 40 + 19, self.图像["高度"] + 132
    if w < 360 then
      w = 360
    end
    self.大地图宽度=地图大小[self.smap].z
		self.大地图高度=地图大小[self.smap].y
    self:置宽高(w, h)
    __置窗口坐标(self)
    self.关闭["置坐标"](self.关闭, w - 50, 5)
    local nsf = require("SDL.图像")(w, h)
    if nsf["渲染开始"](nsf) then
      取黑色背景(0, 0, w - 19, h - 17-42, true)["显示"](取黑色背景(0, 0, w - 19, h - 17-42, true), 0, 17)
      字体18["置颜色"](字体18, __取颜色("白色"))
      字体18:取图像("您希望到达哪个位置呢？"):显示(26,36)
      nsf["渲染结束"](nsf)
    end
    self:置精灵(nsf["到精灵"](nsf))
  else
    self:置可见(false)
  end
end