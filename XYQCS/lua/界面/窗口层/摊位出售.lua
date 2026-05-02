--[[
    @Author       : GGELUA
    @Date         : 2022-04-25 16:28:46
Last Modified by: GGELUA
Last Modified time: 2023-06-11 09:15:13
--]]
local 摊位出售 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("摊位出售",0,0,773,488)
local 当前 = 多开数据.当前
local 师门表 = {龙附=true,嗜血=true,拈花妙指=true,轻如鸿毛=true,浩然正气=true,莲华妙法=true,一气化三清=true,尸气漫天=true,盘丝舞=true,魔王护持=true,神力无穷=true,元阳护体=true,神木呓语=true
,神兵护法=true,担山赶月=true,穿云破空=true}
 local 辅助表 ={打造技巧="打造",裁缝技巧="裁缝",炼金术="炼金"} --,熔炼技巧=true,淬灵之术=true
function 摊位出售:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(773,488)
    if nsf:渲染开始() then
        置窗口背景("摊位出售",0,12,766,476,true):显示(0,0)
        取白色背景(0, 0, 353, 313, true):显示(21,109)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('摊位招牌'):显示(19,71)
        字体18:取图像('出售单价'):显示(403,444)
        取输入背景(0,0,150,23):显示(481,442)
        取输入背景(0,0,160,23):显示(102,69)
    end
    self:置精灵(nsf:到精灵())
end

function 摊位出售:打开(data)
    self:置可见(true)
    self.物品类:置选中(true)
    self:刷新(data)
    self.单价输入:置数值(1)
end

function 摊位出售:刷新(data)
    self.数据 = data
    self.数据.物品表 = {}
    self.数据.召唤兽表 = {}
    for i, v in pairs(self.数据.物品) do
        table.insert( self.数据.物品表,{原始编号=i,价格=v})
    end
    for i, v in pairs(self.数据.bb) do
        table.insert( self.数据.召唤兽表,{原始编号=i,价格=v})
    end
    
    self.制造类技能= {}
    for i=1,#多开数据[当前 or self and self.当前].角色信息.师门技能 do
        for n=1,#多开数据[当前 or self and self.当前].角色信息.师门技能[i].包含技能 do
            if 师门表[多开数据[当前 or self and self.当前].角色信息.师门技能[i].包含技能[n].名称] then
                if 多开数据[当前 or self and self.当前].角色信息.师门技能[i].包含技能[n].等级 > 0 then
                    table.insert(self.制造类技能,{名称=多开数据[当前 or self and self.当前].角色信息.师门技能[i].包含技能[n].名称,类别="其他类",熟练度=0,等级=多开数据[当前 or self and self.当前].角色信息.师门技能[i].包含技能[n].等级})
                end
            end
        end
    end
    local 打造熟练度 = 0
    local 裁缝熟练度 = 0
    for i=1,#多开数据[当前 or self and self.当前].角色信息.辅助技能 do
        if 辅助表[多开数据[当前 or self and self.当前].角色信息.辅助技能[i].名称] then
            if 多开数据[当前 or self and self.当前].角色信息.辅助技能[i].等级 > 0 then
                table.insert(self.制造类技能,{名称=辅助表[多开数据[当前 or self and self.当前].角色信息.辅助技能[i].名称],类别="打造类",熟练度=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].熟练度 or 0,等级=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].等级})
                -- if 多开数据[当前 or self and self.当前].角色信息.辅助技能[i].名称 == "打造技巧" then
                --     table.insert(self.制造类技能,{名称="打造修理类",类别="修理类",熟练度=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].熟练度 or 0,等级=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].等级})
                -- elseif 多开数据[当前 or self and self.当前].角色信息.辅助技能[i].名称 == "裁缝技巧" then
                --     table.insert(self.制造类技能,{名称="裁缝修理类",类别="修理类",熟练度=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].熟练度 or 0,等级=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].等级})
                -- elseif 多开数据[当前 or self and self.当前].角色信息.辅助技能[i].名称 == "炼金术" then
                --     table.insert(self.制造类技能,{名称="炼金修理类",类别="修理类",熟练度=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].熟练度 or 0,等级=多开数据[当前 or self and self.当前].角色信息.辅助技能[i].等级})
                -- end
            end
        end
    end

    self.招牌输入:置文本(self.数据.名称)
    if  self.物品类.是否选中 then
        self.物品类:左键弹起()
    elseif self.召唤兽类.是否选中 then
        self.召唤兽类:左键弹起()
    elseif self.制造类.是否选中 then
        if 摊位出售.选中 and 摊位出售.制造类控件.制造列表.制造数据[摊位出售.选中] then
            摊位出售.可选制造={}
            if 摊位出售.制造类控件.制造列表.制造数据[摊位出售.选中].类别  == "打造类" or 摊位出售.制造类控件.制造列表.制造数据[摊位出售.选中].类别 == "打造修理类" then
                if 摊位出售.制造类控件.制造列表.制造数据[摊位出售.选中].等级 >= 120 then
                    local n = math.floor(摊位出售.制造类控件.制造列表.制造数据[摊位出售.选中].等级/10)
                    for x=1,n do
                        摊位出售.可选制造[x] = {名称=摊位出售.制造类控件.制造列表.制造数据[摊位出售.选中].名称,等级=x*10}
                    end
                end 
            else
                摊位出售.可选制造[1]=摊位出售.制造类控件.制造列表.制造数据[摊位出售.选中]
            end
        else
            摊位出售.选中 = nil
            摊位出售.可选制造 = nil
        end
        摊位出售.上架列表:重置(摊位出售.可选制造 or {},"制造类")
    end
end

local 关闭 = 摊位出售:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",723,0)
function 关闭:左键弹起(x,y,msg)
    摊位出售:置可见(false)
end

function 摊位出售:切换界面(界面)
    self.物品类控件:置可见(界面 == self.物品类控件, not self.物品类控件.是否实例)
    self.召唤兽类控件:置可见(界面 == self.召唤兽类控件, not self.召唤兽类控件.是否实例)
    self.制造类控件:置可见(界面 == self.制造类控件, not self.制造类控件.是否实例)
end

for i, v in ipairs {
    {name = '物品类', x = 395 ,y = 62 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(118,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(118,41) , font = '物品类'},
    {name = '召唤兽类', x = 517 ,y = 62 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(118,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(118,41) , font = '召唤兽类'},
    {name = '制造类', x = 639 ,y = 62 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(118,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(118,41) , font = '制造类'},
} do
    local 临时函数 = 摊位出售:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '物品类' then
            摊位出售:切换界面(摊位出售[v.name..'控件'])
            摊位出售.物品类控件:重置()
            摊位出售.物品类控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
            摊位出售.上架列表:重置(摊位出售.数据.物品表,v.name)
        elseif v.name == '召唤兽类' then
            摊位出售:切换界面(摊位出售[v.name..'控件'])
            摊位出售.召唤兽类控件:重置()
            摊位出售.召唤兽类控件.召唤兽网格:置物品(多开数据[当前 or self and self.当前].角色信息.宝宝列表)
            摊位出售.上架列表:重置(摊位出售.数据.召唤兽表,v.name)
        elseif v.name == '制造类' then
            摊位出售:切换界面(摊位出售[v.name..'控件'])
            摊位出售.制造类控件:重置()
            摊位出售.制造类控件.制造列表:重置(摊位出售.制造类技能)
            摊位出售.上架列表:重置({},"制造类")
        end
        摊位出售.选中 = nil
    end
end

for i, v in ipairs {
    {name = '改名', x = 267 ,y = 61 , tcp = __res:getPNGCC(3,126,563,111,36,true):拉伸(108,36) , font = '改名'},
    {name = '收摊', x = 20 ,y = 434 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41) , font = '收摊'},
    {name = '替身货郎', x = 140 ,y = 434 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41) , font = '替身货郎'},
    {name = '更多', x = 260 ,y = 434 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41) , font = '更多'},
    {name = '上架', x = 642 ,y = 434 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41) , font = '上架'},
} do
    local 临时函数 = 摊位出售:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '改名' then
            if 摊位出售.招牌输入:取文本() then --not 取特殊字符(
                发送数据(当前 or self and self.当前,3721,{名称=摊位出售.招牌输入:取文本()})
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('请输入招牌名称')
            end
        elseif v.name == '收摊' then
            发送数据(当前 or self and self.当前,3724)
        elseif v.name == '替身货郎' then
            local 事件 = function()
                发送数据(当前 or self and self.当前,3724.4)
            end
            local wb = "使用替身货郎后可以离线摆摊！"  
            多开数据[当前].__UI界面.窗口层.文本栏:打开(wb,285,155,390,200,事件)
        elseif v.name == '上架' then
            if 摊位出售.单价输入:取数值() and 摊位出售.单价输入:取数值() > 0 then
                if 摊位出售.选中 then
                    if  摊位出售.物品类.是否选中 then
                        发送数据(当前 or self and self.当前,3722,{道具=摊位出售.选中,价格=摊位出售.单价输入:取数值(),上架分类="道具"})
                    elseif 摊位出售.召唤兽类.是否选中 then
                        发送数据(当前 or self and self.当前,3722,{bb=摊位出售.选中,价格=摊位出售.单价输入:取数值()})
                    elseif 摊位出售.制造类.是否选中 then
                        if 摊位出售.上架选中 then
                            发送数据(当前 or self and self.当前,3722,{制造组=摊位出售.制造类技能,价格=摊位出售.单价输入:取数值(),制造={摊位出售.选中,摊位出售.上架选中}})
                        end
                    end
                end
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('请输入正确的单机')
            end
        end
    end
end

local 上架列表 = 摊位出售:创建列表("上架列表",22,143,350,274)

function 上架列表:初始化()
    self:置文字(字体18)
    self.行高度 = 69
    self.行间距 = 0
end

function 上架列表:左键弹起(x, y, i, item, msg)
    摊位出售.上架选中 = i
end
function 上架列表:重置(data,lx)
    self:清空()
    摊位出售.上架选中 = nil
    if lx == '物品类' then
        local nsf = require('SDL.图像')(398,144)
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('浅黑'))
            字体18:取图像('物品名        数量        单价'):显示(57,116)
            nsf:渲染结束()
        end
        摊位出售.图像2 = nsf:到精灵()
        for _, v in ipairs(data) do
            local nsf = require('SDL.图像')(350,69)
            if nsf:渲染开始() then
                字体18:置颜色(__取颜色('浅黑'))
                字体18:取图像(多开数据[当前].__主控.道具列表[v.原始编号].名称):显示(25,30)
                字体18:取图像(多开数据[当前].__主控.道具列表[v.原始编号].数量 or 1):显示(150,30)
                字体18:取图像(v.价格.价格):显示(205,30)
                nsf:渲染结束()
            end
            local r = self:添加()
            r:置精灵(nsf:到精灵())
            local 按钮 = r:创建我的按钮(__res:getPNGCC(4,926,10,37,36),'按钮'.._,288,18)
            function 按钮:左键弹起(x,y,msg)
                发送数据(当前 or self and self.当前,3723,{道具=v.原始编号,道具类型="道具"})
            end
            按钮:置可见(true,true)
        end
    elseif lx == '召唤兽类' then
        local nsf = require('SDL.图像')(398,144)
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('浅黑'))
            字体18:取图像('        召唤兽名        单价 '):显示(57,116)
            nsf:渲染结束()
        end
        摊位出售.图像2 = nsf:到精灵()
        for _, v in ipairs(data) do
            local nsf = require('SDL.图像')(350,69)
            if nsf:渲染开始() then
                local lssj = 取头像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[v.原始编号].模型)
                __res:getPNGCC(3,757,291,57,56):显示(14,13)
                __res:取图像(__res:取地址('shape/mx/',lssj[1])):拉伸(50,50):显示(16,15)
                字体18:置颜色(__取颜色('浅黑'))
                字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[v.原始编号].名称):显示(76,12)
                字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[v.原始编号].等级..'级'):显示(76,40)
                字体18:取图像(v.价格[1]):显示(205,30)
                nsf:渲染结束()
            end
            local r = self:添加()
            r:置精灵(nsf:到精灵())
            local 按钮 = r:创建我的按钮(__res:getPNGCC(4,926,10,37,36),'按钮'.._,288,18)
            function 按钮:左键弹起(x,y,msg)
                发送数据(当前 or self and self.当前,3723,{bb=v.原始编号})
            end
            按钮:置可见(true,true)
        end
    elseif lx == '制造类' then
        local nsf = require('SDL.图像')(398,144)
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('浅黑'))
            字体18:取图像('制造类别      等级     单价'):显示(57,116)
            nsf:渲染结束()
        end
        摊位出售.图像2 = nsf:到精灵()
        local bb = 0
        for _=#data,1,-1 do
            local v = data[_]
            local dj = data[_].等级
            local jg = "无"
            bb = bb + 1
            if 摊位出售.数据.制造 and 摊位出售.数据.制造[摊位出售.选中] and 摊位出售.数据.制造[摊位出售.选中][bb] then
                jg = 摊位出售.数据.制造[摊位出售.选中][bb].价格
            end
            local mc = data[_].名称
            if dj and jg then
                local nsf = require('SDL.图像')(350,69)
                if nsf:渲染开始() then
                    字体18:置颜色(__取颜色('浅黑'))
                    字体18:取图像(mc):显示(50,30)
                    字体18:取图像(dj):显示(160,30)
                    字体18:取图像(jg):显示(220,30)
                    if jg  ~= "无" then
                        字体16:置颜色(__取颜色("绿色"))
                        字体16:取图像("上架中"):显示(290,30)
                    end
                    nsf:渲染结束()
                end
                local r = self:添加()
                r:置精灵(nsf:到精灵())
                -- local 按钮 = r:创建我的按钮(__res:getPNGCC(4,926,10,37,36),'按钮'.._,288,18)
                -- function 按钮:左键弹起(x,y,msg)
                --     发送数据(当前 or self and self.当前,3723,{类型=_,制造={{等级=dj}}})
                -- end
                -- 按钮:置可见(true,true)
            end
        end
    end
end

local 招牌输入 = 摊位出售:创建我的输入("招牌输入",105,71,110,18,nil,8,'黑色',字体18)

local 单价输入 = 摊位出售:创建我的输入("单价输入",497,444,120,18,2,10,'黑色')

local 物品类控件 = 摊位出售:创建控件('物品类控件',398,106,360, 375)

function 物品类控件:重置()
    local nsf = require('SDL.图像')(360,375)
    if nsf:渲染开始() then
        __res:getPNGCC(3,694,4,338,273):显示(0,0)
        nsf:渲染结束()
    end
    摊位出售.图像 = nsf:到精灵()
    摊位出售.图像:置中心(-398,-106)
end

local 道具网格 = 物品类控件:创建网格("道具网格",0,0,339,272)

function 道具网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if 摊位出售.选中 then
        self.子控件[摊位出售.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        摊位出售.选中 = a
        self.子控件[a]._spr.确定 = true
    end
end

function 道具网格:置物品(data,zl,fl)
    self:创建格子(67,67,0,0,20,5)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __摊位格子.创建(当前)
            lssj:置物品(data[i],"摊位出售物品")
            self.子控件[i]:置精灵(lssj)
            if 摊位出售.数据.物品[i] then
                self.子控件[i]._spr.已上架 = true
            end
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 召唤兽类控件 = 摊位出售:创建控件('召唤兽类控件',398,106,351, 320)

function 召唤兽类控件:重置()
    local nsf = require('SDL.图像')(351,320)
    if nsf:渲染开始() then
        取灰色背景(0, 0, 351, 314, true):显示(0,4)
        nsf:渲染结束()
    end
    摊位出售.图像 = nsf:到精灵()
    摊位出售.图像:置中心(-398,-106)
end

local 召唤兽网格 = 召唤兽类控件:创建网格("召唤兽网格",11,12,332,300)

function 召唤兽网格:左键弹起(x, y, a, b, msg)
    if 摊位出售.选中 then
        self.子控件[摊位出售.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        摊位出售.选中 = a
        self.子控件[a]._spr.确定 = true
    end
end

function 召唤兽网格:置物品(data)
    self:创建格子(332,67,10,10,#data,1,true)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __摊位格子.创建(当前)
            lssj:置物品(data[i],"摊位出售召唤兽")
            self.子控件[i]:置精灵(lssj)
            if 摊位出售.数据.bb[i] then
                self.子控件[i]._spr.已上架 = true
            end
            local 按钮 = self.子控件[i]:创建我的按钮(__res:getPNGCC(4,822,9,38,38),'按钮'..i,274,15)
            function 按钮:左键弹起(x,y,msg)
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(data[i])
            end
            按钮:置可见(true,true)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 制造类控件 = 摊位出售:创建控件('制造类控件',398,106,360, 320)

function 制造类控件:重置()
    local nsf = require('SDL.图像')(351,320)
    if nsf:渲染开始() then
        取白色背景(0, 0, 350, 314, true):显示(0,4)
        字体18:置颜色(__取颜色('浅黑'))
        字体18:取图像('制造类别     熟练度     技能等级'):显示(36,11)
        nsf:渲染结束()
    end
    摊位出售.图像 = nsf:到精灵()
    摊位出售.图像:置中心(-398,-106)
end

local 制造列表 = 制造类控件:创建列表("制造列表",0,38,350,274)

function 制造列表:初始化()
    self:置文字(字体18)
    self.行高度 = 69
    self.行间距 = 0
end

function 制造列表:左键弹起(x, y, i, item, msg)
    摊位出售.选中 = i
    摊位出售.可选制造 = {}
    if self.制造数据[i].类别  == "打造类" or self.制造数据[i].类别 == "打造修理类" then
        if self.制造数据[i].等级 >= 120 then
            local n = math.floor(self.制造数据[i].等级/10)
            for x=1,n do
                摊位出售.可选制造[x] = {名称=self.制造数据[i].名称,等级=x*10}
            end
        end 
    else
        摊位出售.可选制造[1]=self.制造数据[i]
    end

    摊位出售.上架列表:重置(摊位出售.可选制造,"制造类")
end

function 制造列表:重置(data)
    self:清空()
    self.制造数据 = data
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(350,69)
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('浅黑'))
            字体18:取图像(v.名称):显示(52,26)
            字体18:取图像(v.熟练度 or 0):显示(165,26)
            字体18:取图像(v.等级):显示(267,26)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

