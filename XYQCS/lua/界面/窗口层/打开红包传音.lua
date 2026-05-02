local 打开红包传音 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("打开红包传音",0,0,250,300)
local 当前 = 多开数据.当前
--67603D4A 发红包的动态was
function 打开红包传音:初始化()
    字体28 = require("SDl.文字")("assets/hkyt.ttf", 28, true):置颜色(__取颜色("红色"))
    __置窗口坐标(self,'中')
    self.动画 = __res:取动画2(__res:取地址('shape/ui/xz/',0x1D5461ED))
    local nsf = require('SDL.图像')(250,300)
    if nsf:渲染开始() then
        取灰色背景(0,0,235,60,true):置透明(100):显示(15,85)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 打开红包传音:打开(data)
    self.显示银子 = nil
    for i,v in pairs(data.红包.领取记录) do
        if v.id == 多开数据[当前].角色信息.数字id then
            self.数额=v.金额
        end
    end
    self:置可见(true)
    -- self.数额=data.红包.金额
end


function 打开红包传音:更新(dt)
    if self.动画:取当前帧() >= self.动画:取帧数() then
        self.显示银子 = 字体28:取精灵(self.数额)
    end
    if self.显示银子 == nil then
        self.动画:更新(dt)
    end
end

function 打开红包传音:显示(x,y)
    self.动画:显示(x+10,y+50)
    if self.显示银子 then
        self.显示银子:显示(x+80,y+110)
    end
end


function 打开红包传音:左键弹起(x, y)
    self.显示银子 = nil
    self:置可见(false)
end
