
local 长安保卫战 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("长安保卫战",0,0,500,400)
local 当前 = 多开数据.当前
function 长安保卫战:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(500,400)
    if nsf:渲染开始() then
        置窗口背景("长安保卫战",0,12,480,380,true):显示(0,0)
        取白色背景(0,0,440,300,true):显示(20,56)
    end
    self:置精灵(nsf:到精灵())
end

local 关闭 = 长安保卫战:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",430,0)

function 关闭:左键弹起(x,y,msg)
    长安保卫战:置可见(false)
end

function 长安保卫战:打开(data)
    self:置可见(true)
    self.文本:清空()
    self.刷怪记录=data.刷怪记录
    self.积分=data.积分
    for k,v in pairs(self.刷怪记录) do
        self.文本:置文本(v)
    end
    self.先锋=""
    self.头目=""
    self.大王=""
    for k,v in pairs(data.先锋) do
        if v>10 then
            self.先锋=self.先锋..取地图名称(k).."、"
        end
    end
    for k,v in pairs(data.头目) do
        if v>5 then
            self.头目=self.头目..取地图名称(k).."、"
        end
    end
    for k,v in pairs(data.大王) do
        if v>=2 then
            self.大王=self.大王..取地图名称(k).."、"
        end
    end
    self.文本:置文本("当前剩余怪物最多的场景：\n")
    self.文本:置文本("#G/先锋：#Y"..self.先锋)
    self.文本:置文本("#G头目：#Y"..self.头目)
    self.文本:置文本("#G大王：#Y"..self.大王.."\n")
    self.文本:置文本("#G当前个人积分：#R"..self.积分)
end

local 文本 = 长安保卫战:创建我的文本("文本",30,70,420,280)