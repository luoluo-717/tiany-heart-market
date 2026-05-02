--[[
Author: GGELUA
Date: 2024-06-10 12:07:04
Last Modified by: GGELUA
Last Modified time: 2024-06-12 21:07:16
--]]
local 七日排行 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("七日排行",0,0,665,525)
local 当前 = 多开数据.当前
function 七日排行:初始化()
end

function 七日排行:打开(数据)
    self.数据=数据
    self:重置()
	self:置窗口()
	self:置可见(true)
    self["第1日"]:置选中(true)
	for i=2,7 do
		self["第"..i.."日"]:置选中(false)
	end
    
end

function 七日排行:置窗口()
	__置窗口坐标(self)
    local nsf = require('SDL.图像')(665,525)
    if nsf:渲染开始() then
        置窗口背景("七日排行",0,12,659,493,true):显示(0,0)
        取白色背景(0,0,510,360,true):显示(125,50)
        取白色背景(0,0,610,85,true):显示(25,415)
        字体18:置颜色(__取颜色("黑色"))
        字体18:取图像("第"..self.数据[1].."日"):显示(30,420)
        字体18:取图像("我的排名："..(self.我的数据.排行 or "无")):显示(30,445)
        字体18:取图像("金额："..(self.我的数据.金额 or "0")):显示(30,470)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end
function 七日排行:刷新(数据)
    self.数据=数据
    self:重置()
	self:置窗口()
end
    
function 七日排行:重置()
    local dayOfYear = self.数据[1]+self.数据[4] - 1
    local year = os.date("%Y")
    self.date = os.date("%Y-%m-%d", os.time{year=year, month=1, day=1} + (dayOfYear-1)*24*60*60)

    self.人员数据 = {}
    self.我的数据 = {}
    for i,v in pairs(self.数据[2]) do
        self.人员数据[v.排名] = v
        if v.id == 多开数据[当前].角色信息.数字id then
            self.我的数据.金额 = v.金额
            self.我的数据.排行 = v.排名
        end
    end
    self.奖励物品 = {}
    for i=1,11 do
        self.奖励物品[i] = {}
        for n=1,6 do
            if self.数据[3][i]["物品"..n] then
                self.奖励物品[i][n]=self.数据[3][i]["物品"..n] 
            end
        end
    end
    self.数据网格:置物品()
    self.我的奖励:置物品()
end

local 数据网格 = 七日排行:创建网格("数据网格",135,70,505,325)
function 数据网格:初始化()
end

function 数据网格:置物品() 
    self:创建格子(630,65,0,0,#七日排行.人员数据,1,true,12)
    for i = 1,#self.子控件 do
        local nsf = require('SDL.图像')(505,60)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色("黑色"))
            字体16:取图像(七日排行.人员数据[i].名称):显示(65,5)
            字体16:取图像("金额："..七日排行.人员数据[i].金额):显示(65,25)
            __res:getPNGCC(3, 132, 506, 55, 55):显示(5, 0)
            local lssj = 取头像(七日排行.人员数据[i].模型)
            if lssj[2] == 0 then lssj[2] = lssj[1] end
            __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(50, 50):显示(6, 1)
            nsf:渲染结束()
        end
        self.子控件[i]:置精灵(nsf:到精灵())
        local 子网格 = self.子控件[i]:创建网格("子网格"..i,160,5,340,60)
        子网格:创建格子(55, 55, 10, 1, #七日排行.奖励物品[i] or #七日排行.奖励物品[11], 10)
        for x=1,#子网格.子控件 do
            if 七日排行.奖励物品[i][x] then
                local lssj = __商店格子.创建(当前)
                lssj:置物品(七日排行.奖励物品[i][x],"充值系统",true)
                子网格.子控件[x]:置精灵(lssj)
            else
                子网格.子控件[x]:置精灵(nil)
            end
        end 
        子网格:置可见(true,true)  
        function 子网格:左键弹起(x, y, a, b, msg)
            if 子网格.子控件[a] and 子网格.子控件[a]._spr and 子网格.子控件[a]._spr.物品 then
                local x,y = 子网格.子控件[a]:取坐标()
                local w,h = 子网格.子控件[a]:取宽高()
                子网格.子控件[a]._spr.确定 = true
                子网格.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
            end
        end 
    end
end

local 我的奖励 = 七日排行:创建网格("我的奖励",160,425,350,65)
function 我的奖励:置物品()
    self:创建格子(55, 55, 10, 1, 1, 10)
    local ph = 七日排行.我的数据.排行
    local 奖励组 = 七日排行.奖励物品[ph] or 七日排行.奖励物品[11]
    for x=1,10 do
        if 奖励组[x] then
            local lssj = __商店格子.创建(当前)
            lssj:置物品(奖励组[x],"充值系统",true)
            self.子控件[x]:置精灵(lssj)
        else
            self.子控件[x]:置精灵(nil)
        end
    end 
end

function 我的奖励:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
    end
end        
        
       

local 关闭 = 七日排行:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",615,0)
function 关闭:左键弹起(x,y)
    七日排行:置可见(false)
end

for i, v in ipairs {
    {name = '第1日', x = 20 ,y = 70 , tcp =__res:getPNGCC(1,401,65,175,43,true):置拉伸(90,35), tcp2 = __res:getPNGCC(1,401+562,65+431,175,43,true):置拉伸(90,35) , font = '第一日'},
    {name = '第2日', x = 20 ,y = 70 + 50 , tcp =__res:getPNGCC(1,401,65,175,43,true):置拉伸(90,35), tcp2 = __res:getPNGCC(1,401+562,65+431,175,43,true):置拉伸(90,35) , font = '第二日'},
    {name = '第3日', x = 20 ,y = 70 + 50*2, tcp =__res:getPNGCC(1,401,65,175,43,true):置拉伸(90,35), tcp2 = __res:getPNGCC(1,401+562,65+431,175,43,true):置拉伸(90,35) , font = '第三日'},
    {name = '第4日', x = 20 ,y = 70 + 50*3, tcp =__res:getPNGCC(1,401,65,175,43,true):置拉伸(90,35), tcp2 = __res:getPNGCC(1,401+562,65+431,175,43,true):置拉伸(90,35) , font = '第四日'},
	{name = '第5日', x = 20 ,y = 70 + 50*4, tcp =__res:getPNGCC(1,401,65,175,43,true):置拉伸(90,35), tcp2 = __res:getPNGCC(1,401+562,65+431,175,43,true):置拉伸(90,35) , font = '第五日'},
	{name = '第6日', x = 20 ,y = 70 + 50*5, tcp =__res:getPNGCC(1,401,65,175,43,true):置拉伸(90,35), tcp2 = __res:getPNGCC(1,401+562,65+431,175,43,true):置拉伸(90,35) , font = '第六日'},
	{name = '第7日', x = 20 ,y = 70 + 50*6, tcp =__res:getPNGCC(1,401,65,175,43,true):置拉伸(90,35), tcp2 = __res:getPNGCC(1,401+562,65+431,175,43,true):置拉伸(90,35) , font = '第七日'},
} do
    local  临时函数 = 七日排行:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
		发送数据(当前,108.1,{dr = i})
    end
end


local 领取 = 七日排行:创建我的按钮(__res:getPNGCC(3,511,11,117,43,true):拉伸(100,30),"领取",520,440,'领取奖励')
function 领取:左键弹起(x, y)
    发送数据(当前,108.2,{dr=七日排行.数据[1]})
end