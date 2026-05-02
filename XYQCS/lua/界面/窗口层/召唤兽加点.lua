local 召唤兽加点 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("召唤兽加点",0,0,737,480)
local 当前=多开数据.当前
local lsb = {"体质","魔力","力量","耐力","敏捷"}
local lsb2 = {"气血","魔法","伤害","防御","速度","灵力"}
local lssx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0,潜能=0}
function 召唤兽加点:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(730,480)
    if nsf:渲染开始() then
        置窗口背景("加点",0,12,730,465,true):显示(0,0)
        取属性背景(0,0,225,300,true):显示(15,75)
        local lssj = 取输入背景(0,0,138,23)
        字体18:置颜色(255,255,255)
        for i=1,#lsb2 do
            lssj:显示(88,100+((i-1)*44))
            字体18:取图像(lsb2[i]):显示(33,100+((i-1)*44))
        end
        lssj = __res:getPNGCC(1,239,339,252,17)
        for i=1,#lsb do
            lssj:显示(353,80+((i-1)*68))
            字体18:取图像(lsb[i]):显示(264,78+((i-1)*68))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 召唤兽加点:显示(x,y)
    字体18:置颜色(255,255,255)
    for i=1,#lsb do
        if lssx[lsb[i]] ~= 0 then
            字体18:显示(x+644,y+81+((i-1)*68),召唤兽加点.数据[lsb[i]].."+"..lssx[lsb[i]])
        else
            字体18:显示(x+644,y+81+((i-1)*68),召唤兽加点.数据[lsb[i]])
        end
    end
    字体18:显示(x+363,y+430,"潜能 "..召唤兽加点.数据.潜力)
    if self.图像 then
        self.图像:显示(x,y)
    end
    -- if self.连点开始 and os.time() - self.连点开始[1] > 1 and 召唤兽加点.数据.潜力-lssx.潜能 > 0 then
    --     local i = self.连点开始[2]
    --     lssx[lsb[i]] = lssx[lsb[i]] + 1
    --     lssx.潜能 = lssx.潜能 +1
    --     self[lsb[i].."条"]:置位置(math.floor(召唤兽加点.数据[lsb[i]]/1200*100))
    -- end
end

function 召唤兽加点:重置()
    for i=1,#lsb do
        召唤兽加点[lsb[i].."条"]:置位置(math.floor(召唤兽加点.数据[lsb[i]]/1200*100))
    end
    lssx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0,潜能=0}
    local nsf = require('SDL.图像')(240,340)
    if nsf:渲染开始() then
        for i=1,#lsb2 do
            字体18:置颜色(39,53,81)
            if lsb2[i] == "气血" then
                字体18:取图像(召唤兽加点.数据[lsb2[i]].."/"..召唤兽加点.数据.最大气血):显示(100,104+((i-1)*44))
            elseif lsb2[i] == "魔法" then
                字体18:取图像(召唤兽加点.数据[lsb2[i]].."/"..召唤兽加点.数据.最大魔法):显示(100,104+((i-1)*44))
            else
                字体18:取图像(召唤兽加点.数据[lsb2[i]]):显示(100,104+((i-1)*44))
            end
        end
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

function 召唤兽加点:打开(数据)
    self:置可见(true)
    self.数据 = zdloadstring(zdtostring(数据))
    self:重置位置()
    self:重置最大值()
    召唤兽加点:重置()
    lssx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0,潜能=0}
end

local 关闭 = 召唤兽加点:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",690,0)

function 关闭:左键弹起(x,y,msg)
    召唤兽加点:置可见(false)
end

for i=1,#lsb do
    local 临时函数 = 召唤兽加点:创建进度(lsb[i].."条",354,81+((i-1)*68),250,16)
    local lssj = __res:getPNGCC(1,401,145,305,16):拉伸(250,16):到精灵()
    function 临时函数:初始化()
        self:置精灵(lssj)
    end
    local 临时函数2 = 召唤兽加点:创建我的按钮(__res:getPNGCC(1,641,320,29,29),lsb[i].."加",612,74+((i-1)*68))

    function 临时函数2:左键弹起(x,y,msg)
        if 召唤兽加点.数据.潜力 > 0 then
            lssx[lsb[i]] = lssx[lsb[i]] + 1
            lssx.潜能 = lssx.潜能 +1
            召唤兽加点.数据.潜力 = 召唤兽加点.数据.潜力 - 1
            召唤兽加点[lsb[i].."条"]:置位置(math.floor(召唤兽加点.数据[lsb[i]]/1200*100))
            召唤兽加点[lsb[i].."滑块"]:置位置(lssx[lsb[i]])
            召唤兽加点[lsb[i].."滑块"].上次位置 = 召唤兽加点[lsb[i].."滑块"].位置
            召唤兽加点:重置限制最大值()
        end
    end

    function 临时函数2:左键按下(x,y,msg)
        -- 召唤兽加点.连点开始 = {os.time(),i}
    end

    local 临时函数3 = 召唤兽加点:创建我的按钮(__res:getPNGCC(1,601,319,29,29),lsb[i].."减",320,74+((i-1)*68))

    function 临时函数3:左键弹起(x,y,msg)
        if lssx[lsb[i]] > 0 then
            lssx[lsb[i]] = lssx[lsb[i]] - 1
            lssx.潜能 = lssx.潜能 - 1
            召唤兽加点.数据.潜力 = 召唤兽加点.数据.潜力 + 1
            召唤兽加点[lsb[i].."条"]:置位置(math.floor(召唤兽加点.数据[lsb[i]]/1200*100))
            召唤兽加点[lsb[i].."滑块"]:置位置(lssx[lsb[i]])
            召唤兽加点[lsb[i].."滑块"].上次位置 = 召唤兽加点[lsb[i].."滑块"].位置
            召唤兽加点:重置限制最大值()
        end
    end
end

local 确认加点 = 召唤兽加点:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true),"确认加点",590,420,"确认加点")

function 确认加点:左键弹起(x,y,msg)
    lssx.序列=召唤兽加点.数据.认证码
	发送数据(当前 or self and self.当前,5004,lssx)
    召唤兽加点:置可见(false)
end

function 召唤兽加点:重置位置(v)
    for x,_ in ipairs(lsb) do
        召唤兽加点[_.."滑块"]:置位置(0)
        召唤兽加点[_.."滑块"].上次位置 = 0
        召唤兽加点[_.."滑块"].限制最大值 = 0
    end
end

function 召唤兽加点:重置最大值(v)
    for x,_ in ipairs(lsb) do
        召唤兽加点[_.."滑块"]:置最大值(召唤兽加点.数据.潜力)
    end
end

function 召唤兽加点:重置限制最大值(v)
    for x,_ in ipairs(lsb) do
        if _  ~= v then
            self[_.."滑块"].限制最大值 =  召唤兽加点.数据.潜力 + 召唤兽加点[_.."滑块"].位置
        end
    end
end

for i,v in ipairs(lsb) do
    local 临时滑块 = 召唤兽加点:创建水平滚动条(v.."滑块",350,35+i*67,250,30)
    function 临时滑块:初始化()
        self.上次位置 = 0
        self.限制最大值 = 0
    end
    function 临时滑块:滚动事件(x, y, x)
        if self.上次位置 > x  then
            lssx[lsb[i]] = lssx[lsb[i]] - (self.上次位置-x)
            lssx.潜能 = lssx.潜能 -(self.上次位置-x)
            召唤兽加点.数据.潜力 = 召唤兽加点.数据.潜力 + (self.上次位置-x)
        elseif self.上次位置 < x  then
            lssx[lsb[i]] = lssx[lsb[i]] + (x - self.上次位置)
            lssx.潜能 = lssx.潜能 + (x - self.上次位置)
            召唤兽加点.数据.潜力 = 召唤兽加点.数据.潜力 - (x - self.上次位置)
        end
        self.上次位置 = x
        召唤兽加点:重置限制最大值(v)
    end
end