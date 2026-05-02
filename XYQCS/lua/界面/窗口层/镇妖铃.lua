
local 镇妖铃 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("镇妖铃",0,0,360,170)
local 当前 = 多开数据.当前
function 镇妖铃:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(360,170)
    if nsf:渲染开始() then
        置窗口背景("镇妖铃",0,12,350,160,true):显示(0,0)
        字体16:置颜色(__取颜色('白色'))
        字体16:取图像('选择个数'):显示(21,50)
        字体16:取图像('请选择你最想要的一个物品作为奖励'):显示(21,140)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 镇妖铃:打开(data)
    self:置可见(true)
    self.选中 = 0
    self:重置(data or {})
end

function 镇妖铃:刷新(data)
    self:置可见(true)
    local 奖励 = {}
    for i=1,#data.物品数据 do
        奖励[#奖励+1] = data.物品数据[i][5]
    end
    self:重置(奖励)
end

function 镇妖铃:重置(data)
    local nsf = require('SDL.图像')(409,69)
    if nsf:渲染开始() then
        nsf:渲染结束()
    end
    self.奖励选中 = 0
    镇妖铃.图像 = nsf:到精灵()
    镇妖铃.图像:置中心(0,-398)
    self.奖励网格:置物品(data or {})
end


local 关闭 = 镇妖铃:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",310,0)
function 关闭:左键弹起(x,y,msg)
    镇妖铃:置可见(false)
end

local 奖励网格 = 镇妖铃:创建网格("奖励网格",20,75,330,55)

function 奖励网格:初始化()
    self:创建格子(55,55,0,10,1,5)
end

function 奖励网格:左键弹起(x, y, a, b, msg)
    if 镇妖铃.奖励选中 ~= 0 and self.子控件[镇妖铃.奖励选中]  then
        self.子控件[镇妖铃.奖励选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        镇妖铃.奖励选中 = a
        self.子控件[a]._spr.确定 = true
    end
end


function 奖励网格:置物品(数据)
    for i = 1,#self.子控件 do
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据[i],"奖励网格")
        self.子控件[i]:置精灵(lssj)
    end
end

for i, v in ipairs {
    {name = '按钮1', x = 90 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(30,25), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(30,25),font="1"},
    {name = '按钮2', x = 90+35 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(30,25), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(30,25),font="2"},
    {name = '按钮3', x = 90+70 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(30,25), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(30,25),font="3"},
    {name = '按钮4', x = 90+105 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(30,25), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(30,25),font="4"},
    {name = '按钮5', x = 90+140 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(30,25), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(30,25),font="5"},
} do
    local 临时函数 = 镇妖铃:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        for n=1,5 do
            镇妖铃["按钮"..n]:置选中(n == i)
            if n==i then
                镇妖铃.选中 = n
            end
        end
    end
end

for i, v in ipairs {
    {name = '炼化', x = 280 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(50,30) , font = '炼化'},
    {name = '确定', x = 285 ,y = 135 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(50,30) , font = '确定'},
} do
    local 临时函数 = 镇妖铃:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '确定' then
            if self.奖励选中 ~= 0 then
                发送数据(当前 or self and self.当前,3761,{奖励选择=镇妖铃.奖励选中})
                镇妖铃:重置(data)
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择奖励')
            end
        elseif v.name == '炼化' then
            if self.选中 ~= 0 then
                发送数据(当前 or self and self.当前,3760,{选择个数=镇妖铃.选中})
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择炼化数量')
            end
        end
    end
end