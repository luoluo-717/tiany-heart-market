--[[
    @Author       : GGELUA
    @Date         : 2022-04-03 16:41:00
Last Modified by: GGELUA
Last Modified time: 2023-07-10 14:13:47
--]]
local 坐骑加点 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("坐骑加点",0,0,517,480)
local 当前 = 多开数据.当前
local lsb = {"体质","魔力","力量","耐力","敏捷"}

local lssx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0,潜能=0}
function 坐骑加点:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(510,480)
    if nsf:渲染开始() then
        置窗口背景("加点",0,12,510,465,true):显示(0,0)
        local lssj = 取输入背景(0,0,138,23)
        字体18:置颜色(255,255,255)
        lssj = __res:getPNGCC(1,239,339,252,17)
        for i=1,#lsb do
            lssj:显示(133,80+((i-1)*68))
            字体18:取图像(lsb[i]):显示(44,78+((i-1)*68))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 坐骑加点:显示(x,y)
    for i=1,#lsb do
        if lssx[lsb[i]] ~= 0 then
            字体18:显示(x+424,y+81+((i-1)*68),坐骑加点.数据[lsb[i]].."+"..lssx[lsb[i]])
        else
            字体18:显示(x+424,y+81+((i-1)*68),坐骑加点.数据[lsb[i]])
        end
    end
    字体18:显示(x+143,y+430,"拥有潜能："..坐骑加点.数据.潜力)
    if self.图像 then
        self.图像:显示(x,y)
    end
end

function 坐骑加点:重置()
    for i=1,#lsb do
        坐骑加点[lsb[i].."条"]:置位置(math.floor(坐骑加点.数据[lsb[i]]/1200*100))
    end
    lssx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0,潜能=0}
   
end

function 坐骑加点:打开(数据,编号)
    self:置可见(true)
    self.数据 = 数据
    self.编号= 编号
    坐骑加点:重置()
end

local 关闭 = 坐骑加点:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",470,0)

function 关闭:左键弹起(x,y,msg)
    坐骑加点:置可见(false)
end

for i=1,#lsb do
    local 临时函数 = 坐骑加点:创建进度(lsb[i].."条",134,81+((i-1)*68),250,16)
    local lssj = __res:getPNGCC(1,401,145,305,16):拉伸(250,16):到精灵()
    function 临时函数:初始化()
        self:置精灵(lssj)
    end

    local 临时函数2 = 坐骑加点:创建我的按钮(__res:getPNGCC(1,641,320,29,29),lsb[i].."加",392,74+((i-1)*68))
    function 临时函数2:左键弹起(x,y,msg)
        if 坐骑加点.数据.潜力-lssx.潜能 > 0 then
            lssx[lsb[i]] = lssx[lsb[i]] + 1
            lssx.潜能 = lssx.潜能 +1
            坐骑加点[lsb[i].."条"]:置位置(math.floor(坐骑加点.数据[lsb[i]]/1200*100))
        end
    end

    local 临时函数3 = 坐骑加点:创建我的按钮(__res:getPNGCC(1,601,319,29,29),lsb[i].."减",100,74+((i-1)*68))
    function 临时函数3:左键弹起(x,y,msg)
        if lssx[lsb[i]] > 0 then
            lssx[lsb[i]] = lssx[lsb[i]] - 1
            lssx.潜能 = lssx.潜能 - 1
            坐骑加点[lsb[i].."条"]:置位置(math.floor(坐骑加点.数据[lsb[i]]/1200*100))
        end
    end
end

local 确认加点 = 坐骑加点:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true),"确认加点",370,420,"确认加点")

function 确认加点:左键弹起(x,y,msg)
	发送数据(当前 or self and self.当前,77,{编号=坐骑加点.编号,加点=lssx})
    坐骑加点:置可见(false)
end