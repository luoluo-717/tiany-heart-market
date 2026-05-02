local 收听红包传音 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("收听红包传音",0,0,150,100)
local 当前 = 多开数据.当前
--67603D4A 发红包的动态was
function 收听红包传音:初始化()
    self:置坐标(0, (引擎.高度 - 100) / 2)
    local nsf = require('SDL.图像')(150,100)
    if nsf:渲染开始() then
        取灰色背景(0,0,70,80,true):置透明(100):显示(10,60)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 收听红包传音:打开(data)
    self.动画 = __res:取动画2(__res:取地址('shape/ui/xz/',0xAA1ECA36)):置循环(true)
    self:置可见(true)
    self.红包编号=data.编号
end

function 收听红包传音:更新(dt)
    self.动画:更新(dt)
end

function 收听红包传音:显示(x,y)
    self.动画:显示(x+10,y+50)
end


function 收听红包传音:左键弹起(x, y)
    发送数据(当前,107.7,{编号=收听红包传音.红包编号})
    self:置可见(false)
end
