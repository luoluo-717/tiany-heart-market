--[[
    @Author       : GGELUA
    @Date         : 2022-06-16 08:54:55
Last Modified by: GGELUA
Last Modified time: 2023-11-13 15:54:42
--]]
local 宝箱抽奖 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("宝箱抽奖", 0, 0, 520, 480)
local 当前 = 多开数据.当前

function 宝箱抽奖:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(520, 480)
    if nsf:渲染开始() then
        置窗口背景('单点出奇迹',0,14,510,460,true):显示(0,0)
        self.宝箱中奖框框 = __res:取动画(__res:取地址('shape/ui/',0x070155B1)):取动画(1):播放(true)
    end
    self:置精灵(nsf:到精灵())
end

function 宝箱抽奖:打开(data)
    self:置可见(true)
    self.道具网格:置物品(data.道具)
    self.宝箱进程=0
    self.宝箱位置=0
    self.宝箱间隔=0
    self.循环次数=0
    self.宝箱起始=os.clock()*1000
    self.宝箱速度=151
    self.数据 = data
    self.类型 = data.类型
    self.宝箱中奖=data.道具.中奖
    self:提示显示()
    
end


function 宝箱抽奖:更新(dt)
    宝箱抽奖.宝箱中奖框框:更新(dt)
    if type(self.宝箱中奖) == "table" then
        if self.宝箱进程~=0 and os.clock()*1000  > self.宝箱起始 + self.宝箱速度 then
            self.宝箱起始 = os.clock()*1000
            self.宝箱位置=self.宝箱位置+1
            if self.宝箱进程==1 and self.宝箱位置 == self.宝箱中奖[1] or self.循环次数 >= 2 then
                if self.类型 == "仙玉" then
                    发送数据(当前 or self and self.当前, 95,{序号= 宝箱抽奖.宝箱中奖})
                else
                    发送数据(当前 or self and self.当前, 96,{序号= 宝箱抽奖.宝箱中奖,宝箱类型=self.类型})
                end
                self:置可见(false)
                return
            elseif self.宝箱位置 >= 24 then
                self.宝箱进程=1
                self.宝箱位置=1
                self.循环次数 = self.循环次数 + 1
            end
        end
    else
        if self.宝箱进程~=0 and os.clock()*1000  > self.宝箱起始 + self.宝箱速度 then
            self.宝箱起始 = os.clock()*1000
            self.宝箱位置=self.宝箱位置+1
            if self.宝箱进程==1 and self.宝箱位置 == self.宝箱中奖 or self.循环次数 >= 2 then
                if self.类型 == "仙玉" then
                    发送数据(当前 or self and self.当前, 95,{序号= 宝箱抽奖.宝箱中奖})
                else
                    发送数据(当前 or self and self.当前, 96,{序号= 宝箱抽奖.宝箱中奖,宝箱类型=self.类型})
                end
                self:置可见(false)
                return
            elseif self.宝箱位置 >= 24 then
                self.宝箱进程=1
                self.宝箱位置=1
                self.循环次数 = self.循环次数 + 1
            end
        end
    end
end

function 宝箱抽奖:提示显示()
    local nsf = require('SDL.图像')(520, 480)
    if nsf:渲染开始() then
        置窗口背景(self.类型,0,14,510,460,true):显示(0,0)
        -- 字体20:置颜色(__取颜色('黄色')):取图像("搏一搏，一夜暴富不是梦"):显示(20, 70)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 宝箱抽奖:显示(x,y)
    if self.宝箱位置 ~= 0 then
        local xx,yy = x + 28+6,y + 57+50
        local xx1,yy1 = 1,1
        if 1 <= self.宝箱位置 and self.宝箱位置 <= 6 then
            xx1 = self.宝箱位置
        elseif 7 <= self.宝箱位置 and self.宝箱位置 <= 12 then
            xx1 = self.宝箱位置 - 6
            yy1 = 2
        elseif 13 <= self.宝箱位置 and self.宝箱位置 <= 18 then
            xx1 = self.宝箱位置 - 12
            yy1 = 3
        elseif 19 <= self.宝箱位置 and self.宝箱位置 <= 24 then
            xx1 = self.宝箱位置 - 18
            yy1 = 4
        end
        宝箱抽奖.宝箱中奖框框:显示(xx + 78 * (xx1 - 1),yy + 74 * (yy1 - 1))
    end
end

-- local 关闭 = 宝箱抽奖:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",480,0)

-- function 关闭:左键弹起(x,y,msg)
--     宝箱抽奖:置可见(false)
-- end

local 道具网格 = 宝箱抽奖:创建网格("道具网格",35,110,480,420)

function 道具网格:初始化()
    self:创建格子(55,55,20,23,4,6)
end

function 道具网格:置物品(data)
    for i = 1,#self.子控件 do
        local lssj = __商店格子.创建(当前 or self and self.当前)
        lssj:置物品(data[i],"宝箱抽奖")
        self.子控件[i]:置精灵(lssj)
    end
    for n = 1,#data do
        if self.子控件 and self.子控件[n] and self.子控件[n]._spr then
            self.子控件[n]._spr.确认 = true
        end
    end
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        self.子控件[a]._spr:详情打开(350,110)
    end
end

for i, v in ipairs {
    { name = '开始', x = 170, y = 415, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(114, 41), font = '开始' },
   -- { name = '抽奖十次', x = 265, y = 415, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(114, 41), font = '抽奖十次' },
} do
    local 临时函数 = 宝箱抽奖:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if 宝箱抽奖.宝箱进程 == 0 then
            宝箱抽奖.宝箱位置 =  1
            宝箱抽奖.宝箱进程 = 2
        end
    end
end