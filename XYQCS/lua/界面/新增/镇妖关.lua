local 镇妖关 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("镇妖关", 138 + abbr.py.x, 17 + abbr.py.y, 630, 465)
local 当前 = 多开数据.当前

function 镇妖关:初始化()
    self.背景1=__res:取图像(__res:取地址('shape/pic/', 0xA1105230))
    self.背景2=__res:取图像(__res:取地址('shape/pic/', 0xA1105231))
    self.背景3=__res:取图像(__res:取地址('shape/pic/', 0xA1105232))
    local nsf = require("SDL.图像")(695, 420)
    if nsf["渲染开始"](nsf) then
        置窗口背景("镇妖关",0,10,680,410,"镇妖关"):显示(0,0)
      nsf["渲染结束"](nsf)
    end
    self:置精灵(nsf["到精灵"](nsf))
    self.允许移动=true
end
function 镇妖关:打开(内容)
    self:置可见(true)
    if 内容 then
        self.分类 = 内容.镇妖关分类 or 1
    else
        self.分类 = self.分类 or 1
    end
    self.镇妖关积分=内容.镇妖关积分
    self.镇妖关积分A=内容.镇妖关积分A
    self.镇妖关积分B=内容.镇妖关积分B
    self.镇妖关积分C=内容.镇妖关积分C
    self.镇妖关积分D=内容.镇妖关积分D
    self.镇妖关积分E=内容.镇妖关积分E
    self.镇妖关积分F=内容.镇妖关积分F
    self.一级:置选中(true)
    self:刷新界面()
end

function 镇妖关:刷新界面()
    local nsf = require("SDL.图像")(630, 465)
    if nsf["渲染开始"](nsf) then
        置窗口背景("镇妖关",0,10,613,455,"镇妖关"):显示(0,0)
        字体16:置颜色(__取颜色("白色"))
        字体16:取图像("镇妖积分："..self.镇妖关积分.."点"):显示(470, 58)
          字体15:置颜色(__取颜色("黑色"))
        if self.分类 == 1 then
          self.背景1:显示(10, 90)
          字体15:取图像(self.镇妖关积分A.."层"):显示(70, 375)
          字体15:取图像(self.镇妖关积分B.."层"):显示(70+146, 375)
          字体15:取图像(self.镇妖关积分C.."层"):显示(70+146*2, 375)
          字体15:取图像(self.镇妖关积分D.."层"):显示(70+146*3, 375)
        elseif self.分类 == 2 then
          self.背景2:显示(10, 90)
          字体15:取图像(self.镇妖关积分E.."层"):显示(288, 375)
        elseif self.分类 == 3 then
          self.背景3:显示(10, 90)
          字体15:取图像(self.镇妖关积分F.."层"):显示(288, 375)
        end
        nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
    self:置精灵(self.图像)
    self:更新按钮()
end

function 镇妖关:更新按钮()
    self.挑战按钮1:置可见(false)
    self.挑战按钮2:置可见(false)
    self.挑战按钮3:置可见(false)
    self.挑战按钮4:置可见(false)
    self.挑战按钮5:置可见(false)
    self.挑战按钮6:置可见(false)
    if self.分类 == 1 then
        self.挑战按钮1:置可见(true)
        self.挑战按钮2:置可见(true)
        self.挑战按钮3:置可见(true)
        self.挑战按钮4:置可见(true)
    elseif self.分类 == 2 then
        self.挑战按钮5:置可见(true)
    elseif self.分类 == 3 then
        self.挑战按钮6:置可见(true)
    end
end

function 镇妖关:刷新()
    self:刷新界面()
end

-----------------------------------------------------------------
local 关闭 = 镇妖关["创建我的按钮"](镇妖关, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 575, 0)
function 关闭:左键弹起(x, y, msg)
    镇妖关["置可见"](镇妖关, false)
end

-----------------------------------------------------------------------
for i, v in ipairs {
    {name = '一级',fl=1, x = 10 ,y = 49 ,tcp=__res:getPNGCC(1,401,65,175,43,true):拉伸(130,35),tcp2=__res:getPNGCC(1,963,495,175,43,true):拉伸(130,35), font = '英雄级'},
    {name = '二级',fl=2, x = 140 ,y = 49 ,tcp=__res:getPNGCC(1,401,65,175,43,true):拉伸(130,35),tcp2=__res:getPNGCC(1,963,495,175,43,true):拉伸(130,35), font = '传说级'},
    {name = '三级',fl=3, x = 270 ,y = 49 ,tcp=__res:getPNGCC(1,401,65,175,43,true):拉伸(130,35),tcp2=__res:getPNGCC(1,963,495,175,43,true):拉伸(130,35), font = '灾变级'},
} do
    local 临时函数 = 镇妖关:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        镇妖关.分类 = v.fl
        镇妖关:刷新界面()
    end
end

-- 预先创建所有挑战按钮
local 挑战按钮1 = 镇妖关:创建我的was按钮('shape/pic/A1105233.was',"挑战按钮1",38,398)
function 挑战按钮1:左键弹起(x, y, msg)
    发送数据(当前,221,{编号=1})
    镇妖关["置可见"](镇妖关, false)
end

local 挑战按钮2 = 镇妖关:创建我的was按钮('shape/pic/A1105233.was',"挑战按钮2",38+147,398)
function 挑战按钮2:左键弹起(x, y, msg)
    发送数据(当前,221,{编号=2})
    镇妖关["置可见"](镇妖关, false)
end

local 挑战按钮3 = 镇妖关:创建我的was按钮('shape/pic/A1105233.was',"挑战按钮3",38+147*2,398)
function 挑战按钮3:左键弹起(x, y, msg)
    发送数据(当前,221,{编号=3})
    镇妖关["置可见"](镇妖关, false)
end

local 挑战按钮4 = 镇妖关:创建我的was按钮('shape/pic/A1105233.was',"挑战按钮4",38+147*3,398)
function 挑战按钮4:左键弹起(x, y, msg)
    发送数据(当前,221,{编号=4})
    镇妖关["置可见"](镇妖关, false)
end

local 挑战按钮5 = 镇妖关:创建我的was按钮('shape/pic/A1105233.was',"挑战按钮5",258,400)
function 挑战按钮5:左键弹起(x, y, msg)
    发送数据(当前,221,{编号=5})
    镇妖关["置可见"](镇妖关, false)
end

local 挑战按钮6 = 镇妖关:创建我的was按钮('shape/pic/A1105233.was',"挑战按钮6",258,400)
function 挑战按钮6:左键弹起(x, y, msg)
    发送数据(当前,221,{编号=6})
    镇妖关["置可见"](镇妖关, false)
end