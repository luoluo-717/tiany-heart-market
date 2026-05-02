--[[
    @Author       : GGELUA
    @Date         : 2022-04-07 09:43:23
Last Modified by: GGELUA
Last Modified time: 2023-06-13 08:21:59
--]]
local 召唤兽合宠 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("召唤兽合宠",0,0,738,520)
local 当前 = 多开数据.当前
local lsb = {"攻击资质","体力资质","速度资质","寿  命","五  行","防御资质","法术资质","闪躲资质","成  长"}
local lsb2 = {"攻击资质","体力资质","速度资质","寿命","五行","防御资质","法力资质","躲闪资质","成长"}
function 召唤兽合宠:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(730,520)
    if nsf:渲染开始() then
        置窗口背景("合宠",0,12,730,506,true):显示(0,0)
        local lssc = 取白色背景(0,0,308,188,true)
        lssc:显示(18,50)
        lssc:显示(399,50)
        字体18:置颜色(39,53,81)
        local pyx = 0
        local pyy = 0
        for i=1,#lsb do
            if i > 5 then
                pyx = 142
                pyy = -120
            end
            字体18:取图像(lsb[i]):显示(39+pyx,116+((i-1)*24)+pyy)
        end
        local pyx = 0
        local pyy = 0
        for i=1,#lsb do
            if i > 5 then
                pyx = 142
                pyy = -120
            end
            字体18:取图像(lsb[i]):显示(420+pyx,116+((i-1)*24)+pyy)
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中召唤兽 = nil
    self.选中召唤兽2 = nil
end

function 召唤兽合宠:打开(数据)
    self:置可见(true)
    self:刷新()
end

function 召唤兽合宠:刷新()
    self.选中召唤兽 = nil
    self.选中召唤兽2 = nil
    self.图像 = nil
    self.图像2 = nil
    self.头像网格:置头像(nil)
    self.头像网格2:置头像(nil)
    self.材料网格:置物品(nil)
    self.技能控件:置可见(false)
    self.技能控件2:置可见(false)
end

function 召唤兽合宠:重置(数据,lx)
    if lx == "合宠" then
        self.选中召唤兽 = 数据
        local nsf = require('SDL.图像')(730,240)
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('红色'))
            local pyx = 0
            local pyy = 0
            for i=1,#lsb2 do
                if i > 5 then
                    pyx = 142
                    pyy = -120
                end
                字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽][lsb2[i]]):显示(126+pyx,116+((i-1)*24)+pyy)
            end
            字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽].名称):显示(100,60)
            字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽].等级.." 级"):显示(100,80)
        end
        self.图像= nsf:到精灵()
        self.头像网格:置头像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽])
        self.技能控件:置可见(true)
        self.技能控件.技能按钮:置选中(true)
        self.技能控件.技能:重置()
    elseif lx == "合宠2" then
        self.选中召唤兽2 = 数据
        local nsf = require('SDL.图像')(730,240)
        if nsf:渲染开始() then
            字体18:置颜色(39,53,81)
            local pyx = 0
            local pyy = 0
            for i=1,#lsb2 do
                if i > 5 then
                    pyx = 142
                    pyy = -120
                end
                字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽2][lsb2[i]]):显示(508+pyx,116+((i-1)*24)+pyy)
            end
            字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽2].名称):显示(480,60)
            字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽2].等级.." 级"):显示(480,80)
        end
        self.图像2= nsf:到精灵()
        self.头像网格2:置头像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.选中召唤兽2])
        self.技能控件2:置可见(true)
        self.技能控件2.技能按钮:置选中(true)
        self.技能控件2.技能:重置()
    end
end

local 关闭 = 召唤兽合宠:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",688,0)

function 关闭:左键弹起(x,y,msg)
    召唤兽合宠:置可见(false)
end

local 头像网格 = 召唤兽合宠:创建网格("头像网格",39,55,50,50)

function 头像网格:初始化()
    self:创建格子(50,50,0,0,1,1)
end

function 头像网格:左键弹起(x, y, a, b, msg)
   多开数据[当前 or self and self.当前].__UI弹出.召唤兽选择:打开(151,133,"合宠")
end

function 头像网格:置头像(数据)
    local lssj = __头像选择格子.创建(当前)
    lssj:置头像(数据)
    if 头像网格.子控件 and 头像网格.子控件[1] then
        头像网格.子控件[1]:置精灵(lssj)
    end
end

local 头像网格2 = 召唤兽合宠:创建网格("头像网格2",420,55,50,50)

function 头像网格2:初始化()
    self:创建格子(50,50,0,0,1,1)
end

function 头像网格2:左键弹起(x, y, a, b, msg)
   多开数据[当前 or self and self.当前].__UI弹出.召唤兽选择:打开(510,133,"合宠2")
end

function 头像网格2:置头像(数据)
    local lssj = __头像选择格子.创建(当前)
    lssj:置头像(数据)
    if 头像网格2.子控件 and 头像网格2.子控件[1] then
        头像网格2.子控件[1]:置精灵(lssj)
    end
end

local 技能控件 = 召唤兽合宠:创建控件("技能控件",16,245,310,265)
local jcx = 0
local jcy = 0
local lsb3 = {"技能","内丹","进阶"}
for i=1,#lsb3 do 
    local 临时函数 = 技能控件:创建我的单选按钮(__res:getPNGCC(3,880,331,86,37,true),__res:getPNGCC(3,876,289,85,36,true),lsb3[i].."按钮",jcx+((i-1)*105),jcy,lsb3[i])

    function 临时函数:左键按下(消息,x,y)
        技能控件[lsb3[i]]:重置()
    end
    local 临时函数2 = 技能控件:创建控件(lsb3[i],jcx,jcy+45,310,220)
    function 临时函数2:初始化()
        if lsb3[i] == "技能" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                取灰色背景(0,0,308,220,true):显示(0,0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",22,12,273,202)
            function 临时函数3:初始化()
                self:创建格子(55,55,18,18,9,4,true)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,认证)
                for i = 1,#临时函数3.子控件 do
                    local lssj = __召唤兽技能格子.创建(当前)
                    if 认证 and i == 认证 then
                        认证 = 数据[i]
                    end
                    lssj:置数据(数据[i],55,55,nil,认证)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        elseif lsb3[i] == "内丹" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                __res:getPNGCC(3,653,931,315,218):显示(0,0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",0,0,315,218)
            function 临时函数3:初始化()
                self:创建格子(55,55,8,8,1,6)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,zjcz,bb,nsgz)
                local 坐标 = {{129,7},{195,47},{195,120},{129,157},{63,120},{63,47}}
                for i = 1,#临时函数3.子控件 do
                    local lssj = __内丹格子.创建(当前)
                    lssj:置数据(数据[i],zjcz,bb,nsgz,i,55,55)
                    临时函数3.子控件[i]:置精灵(lssj)
                    临时函数3.子控件[i]:置坐标(坐标[i][1],坐标[i][2])
                end
            end
        elseif lsb3[i] == "进阶" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                取灰色背景(0,0,308,220,true):显示(0,0)
                __res:取图像(__res:取地址('shape/ui/zhs/',0x1094AD16)):拉伸(98*2,105*2):显示(55,7)
                __res:取图像(__res:取地址('shape/ui/zhs/',0xF7EBF987)):拉伸(100*2,106*2):显示(55,7)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",76,52,126,102)
            function 临时函数3:初始化()
                self:创建格子(126,102,0,0,1,1)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,zjcz,bb,nsgz)
                for i = 1,#临时函数3.子控件 do
                    local lssj = __特性格子.创建(当前)
                    lssj:置数据(数据,126,102)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        end
        self:置可见(false)
    end
    function 临时函数2:显示(x,y)
        if self.数据 then
            self.数据:显示(x,y)
        end
    end
    function 临时函数2:重置()
        if lsb3[i] == "技能" then
            技能控件.技能:置可见(true)
            技能控件.内丹:置可见(false)
            技能控件.进阶:置可见(false)
            self.数据 = nil
            if 召唤兽合宠.选中召唤兽 then
                临时函数2.技能网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].技能,多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].法术认证)
            else
                临时函数2.技能网格:置数据({})
            end
        elseif lsb3[i] == "内丹" then
            技能控件.技能:置可见(false)
            技能控件.内丹:置可见(true)
            技能控件.进阶:置可见(false)
            self.数据 = nil
            local zjcz = 0
            if 召唤兽合宠.选中召唤兽 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].内丹数据 then
                临时函数2.内丹网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].内丹数据,zjcz,多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽],#多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].内丹数据)
            else
                临时函数2.内丹网格:置数据({})
            end
        elseif lsb3[i] == "进阶" then
            技能控件.技能:置可见(false)
            技能控件.内丹:置可见(false)
            技能控件.进阶:置可见(true)
            self.数据 = nil
            if 召唤兽合宠.选中召唤兽 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性 then
                local nsf = require('SDL.图像')(310,220)
                if nsf:渲染开始() then
                    if 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>0 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 10 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x4536A03D)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>10 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 20 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x714C3706)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>20 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 30 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xD60014B8)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>30 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 40 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xF7EBF987)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>40 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 50 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x11963488)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>50 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 60 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x9A4F1961)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>60 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 70 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x1E7ABB94)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>70 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 80 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xA6C9A76A)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>80 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 90 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x2982E3F7)):拉伸(100*2,106*2):显示(155,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>90 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 91 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x1D0717D7)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>91 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 93 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xC44F0602)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>93 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性<= 97 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x9765D0B3)):拉伸(100*2,106*2):显示(155,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性>=98  then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x36A2C1A6)):拉伸(100*2,106*2):显示(55,7)
                    end
                    字体18:置颜色(255,255,255)
                    字体18:取图像("灵性："..多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽].灵性):显示(15,7)
                    nsf:渲染结束()
                end
                self.数据 = nsf:到精灵()
                临时函数2.进阶网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽])
            else
                临时函数2.进阶网格:置数据({})
            end
        end
    end
end

local 技能控件2 = 召唤兽合宠:创建控件("技能控件2",399,245,310,265)
local jcx = 0
local jcy = 0
local lsb3 = {"技能","内丹","进阶"}
for i=1,#lsb3 do
    local 临时函数 = 技能控件2:创建我的单选按钮(__res:getPNGCC(3,880,331,86,37,true),__res:getPNGCC(3,876,289,85,36,true),lsb3[i].."按钮",jcx+((i-1)*105),jcy,lsb3[i])

    function 临时函数:左键按下(消息,x,y)
        技能控件2[lsb3[i]]:重置()
    end
    local 临时函数2 = 技能控件2:创建控件(lsb3[i],jcx,jcy+45,310,220)
    function 临时函数2:初始化()
        if lsb3[i] == "技能" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                取灰色背景(0,0,308,220,true):显示(0,0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",22,12,273,202)
            function 临时函数3:初始化()
                self:创建格子(55,55,18,18,9,4,true)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,认证)
                for i = 1,#临时函数3.子控件 do
                    local lssj = __召唤兽技能格子.创建(当前)
                    if 认证 and i == 认证 then
                        认证 = 数据[i]
                    end
                    lssj:置数据(数据[i],55,55,nil,认证)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        elseif lsb3[i] == "内丹" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                __res:getPNGCC(3,653,931,315,218):显示(0,0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",0,0,315,218)
            function 临时函数3:初始化()
                self:创建格子(55,55,8,8,1,6)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,zjcz,bb,nsgz)
                local 坐标 = {{129,7},{195,47},{195,120},{129,157},{63,120},{63,47}}
                for i = 1,#临时函数3.子控件 do
                    local lssj = __内丹格子.创建(当前)
                    lssj:置数据(数据[i],zjcz,bb,nsgz,i,55,55)
                    临时函数3.子控件[i]:置精灵(lssj)
                    临时函数3.子控件[i]:置坐标(坐标[i][1],坐标[i][2])
                end
            end
        elseif lsb3[i] == "进阶" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                取灰色背景(0,0,308,220,true):显示(0,0)
                __res:取图像(__res:取地址('shape/ui/zhs/',0x1094AD16)):拉伸(98*2,105*2):显示(55,7)
                __res:取图像(__res:取地址('shape/ui/zhs/',0xF7EBF987)):拉伸(100*2,106*2):显示(55,7)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",76,52,126,102)
            function 临时函数3:初始化()
                self:创建格子(126,102,0,0,1,1)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,zjcz,bb,nsgz)
                for i = 1,#临时函数3.子控件 do
                    local lssj = __特性格子.创建(当前)
                    lssj:置数据(数据,126,102)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        end
        self:置可见(false)
    end
    function 临时函数2:显示(x,y)
        if self.数据 then
            self.数据:显示(x,y)
        end
    end
    function 临时函数2:重置()
        if lsb3[i] == "技能" then
            技能控件2.技能:置可见(true)
            技能控件2.内丹:置可见(false)
            技能控件2.进阶:置可见(false)
            self.数据 = nil
            if 召唤兽合宠.选中召唤兽2 then
                临时函数2.技能网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].技能,多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].法术认证)
            else
                临时函数2.技能网格:置数据({})
            end
        elseif lsb3[i] == "内丹" then
            技能控件2.技能:置可见(false)
            技能控件2.内丹:置可见(true)
            技能控件2.进阶:置可见(false)
            self.数据 = nil
            local zjcz = 0
            if 召唤兽合宠.选中召唤兽2 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].内丹数据 then
                临时函数2.内丹网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].内丹数据,zjcz,多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2],#多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].内丹数据)
            else
                临时函数2.内丹网格:置数据({})
            end
        elseif lsb3[i] == "进阶" then
            技能控件2.技能:置可见(false)
            技能控件2.内丹:置可见(false)
            技能控件2.进阶:置可见(true)
            self.数据 = nil
            if 召唤兽合宠.选中召唤兽2 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性 then
                local nsf = require('SDL.图像')(310,220)
                if nsf:渲染开始() then
                    if 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>0 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 10 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x4536A03D)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>10 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 20 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x714C3706)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>20 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 30 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xD60014B8)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>30 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 40 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xF7EBF987)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>40 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 50 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x11963488)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>50 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 60 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x9A4F1961)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>60 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 70 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x1E7ABB94)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>70 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 80 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xA6C9A76A)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>80 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 90 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x2982E3F7)):拉伸(100*2,106*2):显示(155,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>90 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 91 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x1D0717D7)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>91 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 93 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xC44F0602)):拉伸(100*2,106*2):显示(55,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>93 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性<= 97 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x9765D0B3)):拉伸(100*2,106*2):显示(155,7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性>=98  then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x36A2C1A6)):拉伸(100*2,106*2):显示(55,7)
                    end
                    字体18:置颜色(255,255,255)
                    字体18:取图像("灵性："..多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2].灵性):显示(15,7)
                    nsf:渲染结束()
                end
                self.数据 = nsf:到精灵()
                临时函数2.进阶网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽合宠.选中召唤兽2])
            else
                临时函数2.进阶网格:置数据({})
            end
        end
    end
end

local 合成按钮 = 召唤兽合宠:创建我的按钮(__res:getPNGCC(3,1075,257,107,107),"合成按钮",308,199)

function 合成按钮:左键弹起(x,y,msg)
    if 召唤兽合宠.选中召唤兽 and 召唤兽合宠.选中召唤兽2 then
        发送数据(当前 or self and self.当前,5009,{序列=召唤兽合宠.选中召唤兽,序列1=召唤兽合宠.选中召唤兽2})
    end
end

local 材料网格 = 召唤兽合宠:创建网格("材料网格",335,386,55,55)

function 材料网格:初始化()
    self:创建格子(55,55,0,0,1,1)
end

function 材料网格:左键弹起(x, y, a, b, msg)
    --__UI弹出.道具选择:打开(召唤兽洗炼.道具,235,58,"合宠")
end

function 材料网格:置物品(数据)
    local lssj = __材料格子.创建(当前)
    lssj:置物品(数据)
    if 材料网格.子控件 and 材料网格.子控件[1] then
        材料网格.子控件[1]:置精灵(lssj)
    end
end