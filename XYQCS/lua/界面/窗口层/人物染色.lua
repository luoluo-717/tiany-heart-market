--[[
Author: GGELUA
Date: 2023-11-09 09:15:26
Last Modified by: GGELUA
Last Modified time: 2023-11-16 10:55:21
--]]
--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:22:58
--]]
--[[
Author: GGELUA
Date: 2023-11-01 12:30:35
Last Modified by: GGELUA
Last Modified time: 2023-11-01 15:37:15
--]]

local 人物染色 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("人物染色",0,0,270,260)
local 当前 = 多开数据.当前
local 方向 = 5
function 人物染色:初始化()
    __置窗口坐标(self)
    self.图像 = nil
    local nsf = require('SDL.图像')(270,260)
    if nsf:渲染开始() then
        置窗口背景("人物染色",0,0,270,260,true):显示(0,0)
        __res:getPNGCC(3,761,370,308,163):拉伸(165,180):显示(100,30) --模型背景
        取输入背景(0,0,60,23):显示(130,225) -- 所需彩果
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('所需彩果'):显示(50,225)
        nsf:渲染结束()
    end
    self.所需彩果= 0
    self.图像 = nsf:到精灵()
    self.模型格子 = __UI模型格子.创建(当前)
    self.初始染色组 = 多开数据[当前 or self and self.当前].角色信息.染色组
    多开数据[当前 or self and self.当前].角色信息.染色组 = {[1]=0,[2]=0,[3]=0}
    self.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30)
end

for i, v in ipairs {
    {name = '1', x = 10 ,y = 35 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '1'},
    {name = '2', x = 10 ,y = 80 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '2'},
    {name = '3', x = 10 ,y = 125 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '3'},
    {name = '转身', x = 10 ,y = 180 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '转身'},
    {name = '确定', x = 190 ,y = 220 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(75,35) , font = '确定'},
    
} do
    local 临时函数 = 人物染色:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        self.wpal = __res:dewpal(多开数据[当前 or self and self.当前].角色信息.染色方案)
        if v.name == '确定' then
            发送数据(当前 or self and self.当前,3710,{染色组 = 多开数据[当前 or self and self.当前].角色信息.染色组})
        elseif v.name == "1" then
            多开数据[当前 or self and self.当前].角色信息.染色组[1] = 多开数据[当前 or self and self.当前].角色信息.染色组[1] + 1
            if 多开数据[当前 or self and self.当前].角色信息.染色组[1] > #self.wpal[1] then 多开数据[当前 or self and self.当前].角色信息.染色组[1] = 0 end
            人物染色.所需彩果 = 0
            for i = 1, 3, 1 do
                人物染色.所需彩果 = 人物染色.所需彩果 + 多开数据[当前 or self and self.当前].角色信息.染色组[i]
            end
        elseif v.name == "2" then
            多开数据[当前 or self and self.当前].角色信息.染色组[2] = 多开数据[当前 or self and self.当前].角色信息.染色组[2] + 1
            if 多开数据[当前 or self and self.当前].角色信息.染色组[2] > #self.wpal[2] then 多开数据[当前 or self and self.当前].角色信息.染色组[2] = 0 end
            人物染色.所需彩果 = 0
            for i = 1, 3, 1 do
                人物染色.所需彩果 = 人物染色.所需彩果 + 多开数据[当前 or self and self.当前].角色信息.染色组[i]
            end
        elseif v.name == "3" then
            多开数据[当前 or self and self.当前].角色信息.染色组[3] = 多开数据[当前 or self and self.当前].角色信息.染色组[3] + 1
            if 多开数据[当前 or self and self.当前].角色信息.染色组[3] > #self.wpal[3] then 多开数据[当前 or self and self.当前].角色信息.染色组[3] = 0 end
            人物染色.所需彩果 = 0
            for i = 1, 3, 1 do
                人物染色.所需彩果 = 人物染色.所需彩果 + 多开数据[当前 or self and self.当前].角色信息.染色组[i]
            end
        elseif v.name == '转身' then
            方向 = 方向 + 1
            if 方向 > 8 then 方向 = 1 end
        end
        人物染色.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30,nil,方向)
    end
end

function 人物染色:打开(data)
    self:置可见(true)
    多开数据[当前 or self and self.当前].角色信息.染色组 = {[1]=0,[2]=0,[3]=0}
    self:重置(data)
end

function 人物染色:显示(x, y)
    self.图像:显示(x, y)
    self.模型格子:显示(x+80, y+145)
    字体16:置颜色(__取颜色('黑色')):显示(x+140,y+230,self.所需彩果)
end


local 关闭 = 人物染色:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",225,0)
function 关闭:左键弹起(x,y,msg)
    人物染色:置可见(false)
    多开数据[当前 or self and self.当前].角色信息.染色组 = 人物染色.初始染色组
end
