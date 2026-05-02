-- local 剑会匹配 = __UI界面["窗口层"]["创建我的窗口"](__UI界面["窗口层"], "剑会匹配", 0, 0, 引擎.宽度, 引擎.高度)
local 剑会匹配 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("剑会匹配",0,0,引擎.宽度, 引擎.高度)

local rxzy = {"1A23FA19","1A23FA20","1A23FA21","1A23FA22","1A23FA23","1A23FA24","1A23FA25","1A23FA26","1A23FA27","1A23FA28","1A23FA29","1A23FA30","1A23FA31","1A23FA32","1A23FA33","1A23FA34","1A23FA35","1A23FA36"}
local rx = {
	飞燕女 = 1,
	骨精灵 = 2,
	鬼潇潇 = 3,
	狐美人 = 4,
	虎头怪 = 5,
	剑侠客 = 6,
	巨魔王 = 7,
	龙太子 = 8,
	杀破狼 = 9,
	神天兵 = 10,
	巫蛮儿 = 11,
	舞天姬 = 12,
	逍遥生 = 13,
	玄彩娥 = 14,
	偃无师 = 15,
	英女侠 = 16,
	羽灵神 = 17,
	桃夭夭 = 18,
	影精灵 = 2,

}
function 剑会匹配:初始化()
  local nsf = require("SDL.图像")(引擎.宽度, 引擎.高度)
  if nsf["渲染开始"](nsf) then
    nsf["渲染清除"](nsf, 3, 0, 0, 200)
    -- __res:getPNGCC(5, 0, 0, 683, 450):显示(0,5)
    --__res:getPNGCC(5, 0, 581, 328, 175) 单挑
    --__res:getPNGCC(5, 331, 581, 329, 162) 选择模式
     --__res:getPNGCC(5, 663, 581, 203, 81) 排行榜
      --__res:getPNGCC(5, 869, 581, 203, 80) 玩法介绍
  end
  self:置精灵(nsf["到精灵"](nsf))
end

function 剑会匹配:打开(nr)
  self.人数 = nr.人数
  self.模式 = nr.模式
  self.时间 = 0
  self.sss=0
  self.fen=0
  self.jishi=0
  self.chongfu=0
  self:置可见(true)
  self:重置信息()
  __UI界面["窗口层"].剑会天下:置可见(false)
end

function 剑会匹配:显示(x, y)
  --self.背景["显示"](self.背景, 0, 0)
  if self.图像 then
    self.图像["显示"](self.图像, 0, 0)
  end
  if os.time()~=self.sss then
    self.sss=os.time()
    self.jishi=self.jishi+1
  end
  local msdw=self.fen..":00"
  if self.jishi<10 then
      msdw=self.fen..":0"..self.jishi
  elseif self.jishi<60 then
      msdw=self.fen..":"..self.jishi
  else
    self.jishi=0
    self.fen=self.fen+1
  end
  if self.fen<10 then
    字体25:显示(引擎.宽度/2+50+45,引擎.高度/2+145, "0"..msdw)
  else
    字体25:显示(引擎.宽度/2+50+45,引擎.高度/2+145, msdw)
  end
  if self.fen>=1 and self.chongfu~=self.fen then
		self.chongfu=self.fen
		发送数据(6582,{模式=self.模式})
	end
end
function 剑会匹配:重置信息()
  local nsf = require("SDL.图像")(引擎.宽度, 引擎.高度)
  if nsf["渲染开始"](nsf) then
   -- nsf["渲染清除"](nsf, 3, 0, 0, 150)
    -- 字体16["置颜色"](字体16, __取颜色("黄色"))
    -- 字体16:取图像("系统正在帮您寻找合适的对手"):置混合(1):显示(引擎.宽度/2-65,引擎.高度/2+110)
    置轮廓文字(字体18,"系统正在帮您寻找合适的对手","黑色","黄色",引擎.宽度/2-65,引擎.高度/2+110)
    -- 字体18["置颜色"](字体18, __取颜色("白色"))
    -- 字体18:取图像("正在匹配中："):显示(引擎.宽度/2-50,引擎.高度/2+140)
    置轮廓文字(字体25,"正在匹配中：","黑色","白色",引擎.宽度/2-50,引擎.高度/2+140)
    __res["取图像"](__res, "shape/mewas/"..rxzy[rx[角色信息.模型]]..".was"):显示(引擎.宽度/2-45, 引擎.高度/2-200)
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf["到精灵"](nsf)
end
local 匹配中 = 剑会匹配["创建我的按钮"](剑会匹配, __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(117, 33), "匹配中", 引擎.宽度/2-135,引擎.高度/2+70,"匹配中…")

local 取消匹配 = 剑会匹配["创建我的按钮"](剑会匹配, __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(117, 33), "取消匹配", 引擎.宽度/2+100,引擎.高度/2+70,"取消匹配")
function 取消匹配:左键弹起(x, y, msg)
  发送数据(6581,{模式=剑会匹配.模式})
  剑会匹配["置可见"](剑会匹配, false)
  __UI界面["窗口层"].剑会天下:重载()
end