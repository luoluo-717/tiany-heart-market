--[[
    @Author       : GGELUA
    @Date         : 2022-04-28 22:24:18
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:13:08
--]]
local 系统商会 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("系统商会",0,0,424,519)
local 当前 = 多开数据.当前
function 系统商会:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(424,519)
    if nsf:渲染开始() then
        置窗口背景("系统商会",0,12,417,505,true):显示(0,0)
        取灰色背景(0, 0, 375, 285, true):显示(22,90)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('商业指数'):显示(213,57)
        local lssj = 取输入背景(0,0,135,23)
        字体18:取图像('单价'):显示(18,390)
        字体18:取图像('数量'):显示(214,390)
        字体18:取图像('总价'):显示(18,424)
        字体18:取图像('现金'):显示(214,424)
        lssj:显示(70,388)
        lssj:显示(264,388)
        lssj:显示(70,422)
        lssj:显示(264,422)
        取输入背景(0,0,104,23):显示(64,461)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.环装=false
    self.页数=1
    self.商店类型="物品店"
end

function 系统商会:打开(data)
    self:置可见(true)
    self.数据 = data.数据
    self.类型 = data.类型
    if self.类型=="环装店" then
        self.环装=true
    else
        self.环装=false
    end
    self.选中 = nil
    self.物品店:置选中(true)
    local nsf = require('SDL.图像')(424,92)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像('系统商会'):显示(20,57)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self:重置()
    self:刷新()
end

local 关闭 = 系统商会:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",374,0)
function 关闭:左键弹起(x,y,msg)
    系统商会:置可见(false)
end

function 系统商会:刷新数据(data)
    self.数据 = data.数据
    self.类型 = data.类型
    self.页数 = 1
    if self.类型=="环装店" then
        self.环装=true
    else
        self.环装=false
    end
    self.选中 = nil
    self:重置()
    self:刷新()
end

function 系统商会:重置()
    self.道具网格:置物品(self.数据)
    self.选中 = nil
end

function 系统商会:刷新()
    local nsf = require('SDL.图像')(424,130)
    if nsf:渲染开始() then
        if 系统商会.选中 then
            字体18:置颜色(__取银子颜色(系统商会.数据[系统商会.选中].价格))
            字体18:取图像(系统商会.数据[系统商会.选中].价格):显示(80,20)
            字体18:置颜色(__取银子颜色(系统商会.数据[系统商会.选中].价格))
            字体18:取图像(系统商会.数据[系统商会.选中].价格):显示(80,50)
        end
        字体18:置颜色(__取银子颜色(多开数据[当前 or self and self.当前].角色信息.银子))
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.银子):显示(272,50)
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像('1 / 1'):显示(98,90)
        nsf:渲染结束()
    end
    系统商会.图像2 = nsf:到精灵()
    系统商会.图像2:置中心(0,-376)
end

local 道具网格 = 系统商会:创建网格("道具网格",45,115,353,256)

function 道具网格:左键弹起(x, y, a, b, msg)
    if 系统商会.类型 == '物品店' or 系统商会.类型 == '环装店' then
        if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
            if 系统商会.选中 then
                self.子控件[系统商会.选中]._spr.确定 = nil
            end
            系统商会.选中 = a
            self.子控件[系统商会.选中]._spr.确定 = true
            self.子控件[a]._spr:详情打开(430,86,w,h,"选择",a)
            系统商会:刷新()
        end
    else
        if self.子控件[a] and self.子控件[a]._spr then
            if 系统商会.选中 then
                if 系统商会.选中 == a then
                    多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(系统商会.数据[系统商会.选中])
                else
                    self.子控件[系统商会.选中]._spr.确定 = nil
                end
            end
            系统商会.选中 = a
            self.子控件[系统商会.选中]._spr.确定 = true
            系统商会:刷新()
        end
    end
end

function 道具网格:置物品(data)
    if 系统商会.类型 == '物品店' or 系统商会.类型 == '环装店' then
        self:置坐标(45,115)
        self:创建格子(55,55,13,13,math.ceil(#data/5),5,math.ceil(#data/5) > 4)
        for i = 1,#self.子控件 do
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],"白格子","战斗道具")
            self.子控件[i]:置精灵(lssj)
        end
    else
        self:创建格子(173,64,8,7,math.ceil(#data/2),2,math.ceil(#data/5) > 4)
        self:置坐标(33,115)
        for i = 1,#self.子控件 do
            if data[i] then
                local lssj = __商会格子.创建(当前)
                lssj:置物品(data[i],"商会召唤兽")
                self.子控件[i]:置精灵(lssj)
            else
                self.子控件[i]:置精灵()
            end
        end
    end
end

for i, v in ipairs {
    {name = '物品店', x = 20 ,y = 51 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(80,35) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(80,35) , font = '物品店'},
    {name = '宠物店', x = 110 ,y = 51 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(80,35) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(80,35) , font = '宠物店'},
} do
    local 临时函数 = 系统商会:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '物品店' then
            系统商会.商店类型 = "物品店"
            发送数据(当前 or self and self.当前,80,{类型="物品店"})
        elseif v.name == '宠物店' then
            系统商会.商店类型 = "召唤兽店"
            发送数据(当前 or self and self.当前,80,{类型="召唤兽店"})
        end
    end
end

for i, v in ipairs {
    {name = '购买', x = 262 ,y = 458 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(140,41) , font = '购 买'},
} do
    local 临时函数 = 系统商会:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '购买' then
            if 系统商会.选中 then
                发送数据(当前 or self and self.当前,80,{类型="购买",数据={类型=系统商会.商店类型,页数=系统商会.页数-1,选中=系统商会.选中,环装=系统商会.环装,数量=1}})
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#请选中一个物品')
            end
        end
    end
end