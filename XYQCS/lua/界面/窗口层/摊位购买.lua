--[[
    @Author       : GGELUA
    @Date         : 2022-04-24 17:52:56
Last Modified by: GGELUA
Last Modified time: 2023-06-11 09:20:39
--]]
local 摊位购买 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("摊位购买",0,0,776,485)
local 当前 = 多开数据.当前
local 取子类 = function (n)
	if n == "炼金术" then
		return {"打造","炼金"}
	elseif n == "打造技巧" then
		return {"打造","打造"}
	elseif n == "裁缝技巧" then
		return {"打造","裁缝"}
	elseif n == "淬灵之术" then
		return {"打造","淬灵"}
	elseif n == "打造类修理" or n == "裁缝类修理" or n == "炼金类修理" then
		return {"修理",n}
	else
		return {"其他",n}
	end
end
function 摊位购买:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(776,485)
    if nsf:渲染开始() then
        置窗口背景("摊位购买",0,12,769,472,true):显示(0,0)
        local lssj = 取输入背景(0,0,205,23)
        lssj:显示(70,408)
        lssj:显示(70,447)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('摊主'):显示(24,410)
        字体18:取图像('ID'):显示(45,449)
        lssj = 取输入背景(0,0,152,23)
        lssj:显示(373,408)
        lssj:显示(373,447)
        字体18:取图像('总价'):显示(332,410)
        字体18:取图像('现金'):显示(332,449)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 摊位购买:打开(data)
    self:置可见(true)
    self.物品类:置选中(true)
    self:刷新(data)

end

function 摊位购买:重置()
    local nsf = require('SDL.图像')(768,95)
    if nsf:渲染开始() then
        取灰色背景(0, 0, 524, 288, true):显示(19,110)
        取灰色背景(0, 0, 200, 245, true):显示(548,110)
        字体18:置颜色(__取颜色('浅黑'))
        字体18:取图像( self.数据.摊主名称):显示(78,19)
        字体18:取图像( self.数据.id):显示(78,57)
        字体18:置颜色(__取银子颜色(多开数据[当前 or self and self.当前].角色信息.银子))
        字体18:取图像( 多开数据[当前 or self and self.当前].角色信息.银子):显示(381,57)
        nsf:渲染结束()
    end
    摊位购买.图像2 = nsf:到精灵()
    摊位购买.图像2:置中心(0,-394)
end

local function 取等级价格(data)
    for i,v in pairs(data) do
        return i,v
    end
end


function 摊位购买:刷新(data)
    self.数据 = data
    self.数据.物品表 = {}
    self.数据.召唤兽表 = {}
    self.数据.装备制造表 = {}
    self.数据.修理表 = {}
    self.数据.其他制造表 = {}
    for i, v in pairs(self.数据.物品) do
        v.原始编号 = i
        table.insert( self.数据.物品表,v )
    end
    for i, v in pairs(self.数据.bb) do
        v.原始编号 = i
        table.insert( self.数据.召唤兽表,v )
    end
    if self.数据.制造.制造组 then
        for i,v in ipairs(self.数据.制造.制造组) do
            if self.数据.制造[i] then
                local 排序组 = {}
				for k,v in pairs(self.数据.制造[i]) do
				    table.insert(排序组,k)
				    table.sort(排序组,function(a,b) return a < b end)
				end
                for h,j in pairs(排序组) do
				    if self.数据.制造.制造组[i].类别=="打造类" then
				    	table.insert(self.数据.装备制造表,{名称=self.数据.制造.制造组[i].名称,类别=self.数据.制造.制造组[i].类别,序号=self.数据.制造[i][j].序号,等级=math.floor(self.数据.制造.制造组[i].等级/10)*10 - (j-1)*10,价格=self.数据.制造[i][j].价格})
				    elseif self.数据.制造.制造组[i].类别=="修理类" then
				    	table.insert(self.数据.修理表,{名称=self.数据.制造.制造组[i].名称,类别=self.数据.制造.制造组[i].类别,序号=self.数据.制造[i][j].序号,等级=math.floor(self.数据.制造.制造组[i].等级/10)*10 - (j-1)*10,价格=self.数据.制造[i][j].价格})
				    elseif self.数据.制造.制造组[i].类别=="其他类" then
				    	table.insert(self.数据.其他制造表,{名称=self.数据.制造.制造组[i].名称,类别=self.数据.制造.制造组[i].类别,序号=self.数据.制造[i][j].序号,等级=self.数据.制造.制造组[i].等级,价格=self.数据.制造[i][j].价格})
				    end
				end
            end
        end
    end

    self:重置()
    if  self.物品类.是否选中 then
        self.物品类:左键弹起()
    elseif self.召唤兽类.是否选中 then
        self.召唤兽类:左键弹起()
    elseif self.制造类.是否选中 then
        self.制造类:左键弹起()
    end
end

function 摊位购买:切换界面(界面)
    self.物品类控件:置可见(界面 == self.物品类控件, not self.物品类控件.是否实例)
    self.召唤兽类控件:置可见(界面 == self.召唤兽类控件, not self.召唤兽类控件.是否实例)
    self.制造类控件:置可见(界面 == self.制造类控件, not self.制造类控件.是否实例)
end

local 关闭 = 摊位购买:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",726,0)
function 关闭:左键弹起(x,y,msg)
    摊位购买:置可见(false)
end

local 购买 = 摊位购买:创建我的按钮(__res:getPNGCC(3,511,11,117,43,true):拉伸(138,41),'购买',586,422,'购买')
function 购买:左键弹起(x, y)
    if 摊位购买.选中 then
        if  摊位购买.物品类.是否选中 then
            if 摊位购买.物品类控件.道具输入:取数值() > 0 then
                if 摊位购买.数据.物品表[摊位购买.选中].数量 and 摊位购买.数据.物品表[摊位购买.选中].数量 < 摊位购买.物品类控件.道具输入:取数值() then
                   多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请重新输入数量')
                    
                else
                    发送数据(当前 or self and self.当前,3726,{道具=摊位购买.数据.物品表[摊位购买.选中].原始编号,数量=摊位购买.物品类控件.道具输入:取数值(),背包类型="道具"})
                end
                
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请重新输入数量')
            end
        elseif 摊位购买.召唤兽类.是否选中 then
            发送数据(当前 or self and self.当前,3726,{bb=摊位购买.数据.召唤兽表[摊位购买.选中].原始编号})
        elseif 摊位购买.制造类.是否选中 then
            if 摊位购买.制造类控件.装备制造列表:取选中() then
                if 摊位购买.制造类控件.普通打造.是否选中 then
                    发送数据(当前 or self and self.当前,3726.1,{制造=摊位购买.数据.制造,打造模式=1,制造类别=摊位购买.数据.装备制造表[摊位购买.选中].类别,等级=摊位购买.数据.装备制造表[摊位购买.选中].等级,技能名称 = 摊位购买.数据.装备制造表[摊位购买.选中].名称,选中序号=摊位购买.数据.装备制造表[摊位购买.选中].序号,价格=摊位购买.数据.装备制造表[摊位购买.选中].价格,摊主id=摊位购买.数据.id}) 
                elseif 摊位购买.制造类控件.强化打造.是否选中 then
                    发送数据(当前 or self and self.当前,3726.1,{制造=摊位购买.数据.制造,打造模式=2,制造类别=摊位购买.数据.装备制造表[摊位购买.选中].类别,等级=摊位购买.数据.装备制造表[摊位购买.选中].等级,技能名称 = 摊位购买.数据.装备制造表[摊位购买.选中].名称,选中序号=摊位购买.数据.装备制造表[摊位购买.选中].序号,价格=摊位购买.数据.装备制造表[摊位购买.选中].价格,摊主id=摊位购买.数据.id}) 
                else
                   多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择打造方式')
                end
            elseif 摊位购买.制造类控件.其他制造列表:取选中() then
                发送数据(当前 or self and self.当前,3726.1,{制造=摊位购买.数据.制造,制造类别=摊位购买.数据.其他制造表[摊位购买.选中].类别,等级=摊位购买.数据.其他制造表[摊位购买.选中].等级,技能名称 = 摊位购买.数据.其他制造表[摊位购买.选中].名称,选中序号=摊位购买.数据.其他制造表[摊位购买.选中].序号,价格=摊位购买.数据.其他制造表[摊位购买.选中].价格,摊主id=摊位购买.数据.id}) 
            end
        end
        
    end
end

for i, v in ipairs {
    {name = '物品类', x = 19 ,y = 57 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(118,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(118,41) , font = '物品类'},
    {name = '召唤兽类', x = 149 ,y = 57 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(118,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(118,41) , font = '召唤兽类'},
    {name = '制造类', x = 277 ,y = 57 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(118,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(118,41) , font = '制造类'},
} do
    local 临时函数 = 摊位购买:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '物品类' then
            摊位购买:切换界面(摊位购买[v.name..'控件'])
            摊位购买.物品类控件:重置()
            摊位购买.物品类控件.道具网格:置物品(摊位购买.数据.物品表)
            摊位购买.物品类控件.道具输入:置数值(1)
        elseif v.name == '召唤兽类' then
            摊位购买:切换界面(摊位购买[v.name..'控件'])
            摊位购买.召唤兽类控件:重置()
            摊位购买.召唤兽类控件.召唤兽网格:置物品(摊位购买.数据.召唤兽表)
        elseif v.name == '制造类' then
            摊位购买:切换界面(摊位购买[v.name..'控件'])
            摊位购买.制造类控件:重置(摊位购买.数据.制造类)
            摊位购买.制造类控件.装备制造列表:重置(摊位购买.数据.装备制造表)
            摊位购买.制造类控件.装备修理列表:重置(摊位购买.数据.修理表)
            摊位购买.制造类控件.其他制造列表:重置(摊位购买.数据.其他制造表)
        end
        摊位购买.选中 = nil
    end
end

local 物品类控件 = 摊位购买:创建控件('物品类控件',0,110,768, 290)

function 物品类控件:重置()
    local nsf = require('SDL.图像')(768,485)
    if nsf:渲染开始() then
        取灰色背景(0, 0, 524, 288, true):显示(19,110)
        取灰色背景(0, 0, 200, 245, true):显示(548,110)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('数量'):显示(554,370)
        取输入背景(0,0,124,23):显示(614,368)
        nsf:渲染结束()
    end
    摊位购买.图像 = nsf:到精灵()
end

local 道具网格 = 物品类控件:创建网格("道具网格",32,11,498,272)

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a]._spr and 摊位购买.选中 ~= a then
        if 摊位购买.选中 then
            self.子控件[摊位购买.选中]._spr.确定 = nil
        end
        摊位购买.选中 = a
        self.子控件[摊位购买.选中]._spr.确定 = true
        物品类控件.道具文本:清空()
        __道具提示(self.子控件[摊位购买.选中]._spr.物品,物品类控件.道具文本)
    end
end

function 道具网格:置物品(data)
    self:创建格子(244,67,10,10,math.ceil(#data/2),2,true)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __摊位格子.创建(当前)
            lssj:置物品(data[i],"摊位物品")
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 道具文本 = 物品类控件:创建文本("道具文本",552,7,190,230)

local 道具输入 = 物品类控件:创建我的输入("道具输入",670,262,44,18,2,2,'黑色')

local 数量减 = 物品类控件:创建我的按钮(__res:getPNGCC(1,601,319,29,29),"数量减",598,255)
function 数量减:左键弹起(x,y,msg)
    if 道具输入:取数值() > 1 then
        道具输入:置数值(道具输入:取数值()-1)
    end 
end

local 数量加 = 物品类控件:创建我的按钮(__res:getPNGCC(1,641,320,29,29),"数量加",721,255)
function 数量加:左键弹起(x,y,msg)
    if 道具输入:取数值() < 99 then
        道具输入:置数值(道具输入:取数值()+1)
    end 
end



local 召唤兽类控件 = 摊位购买:创建控件('召唤兽类控件',0,111,768, 290)

function 召唤兽类控件:重置()
    local nsf = require('SDL.图像')(768,485)
    if nsf:渲染开始() then
        取灰色背景(0, 0, 733, 288, true):显示(19,110)
        nsf:渲染结束()
    end
    摊位购买.图像 = nsf:到精灵()
end

local 召唤兽网格 = 召唤兽类控件:创建网格("召唤兽网格",30,10,711,272)

function 召唤兽网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a]._spr and 摊位购买.选中 ~= a then
        if 摊位购买.选中 then
            self.子控件[摊位购买.选中]._spr.确定 = nil
        end
        摊位购买.选中 = a
        self.子控件[摊位购买.选中]._spr.确定 = true
    end
end

function 召唤兽网格:置物品(data)
    self:创建格子(350,67,10,10,math.ceil(#data/2),2,true)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __摊位格子.创建(当前)
            lssj:置物品(data[i],"摊位召唤兽")
            self.子控件[i]:置精灵(lssj)
            local 按钮 = self.子控件[i]:创建我的按钮(__res:getPNGCC(4,822,9,38,38),'按钮'..i,296,15)
            function 按钮:左键弹起(x,y,msg)
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(data[i])
            end
            按钮:置可见(true,true)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 制造类控件 = 摊位购买:创建控件('制造类控件',0,95,766, 295)

function 制造类控件:重置()
    local nsf = require('SDL.图像')(766,485)
    if nsf:渲染开始() then
        local lssj = 取白色背景(0, 0, 240, 256, true)
        lssj:显示(18,38+95)
        lssj:显示(266,38+95)
        lssj:显示(512,38+95)
        字体20:置颜色(__取颜色('白色'))
        字体20:取图像('装备制造'):显示(102,10+95)
        字体20:取图像('装备修理'):显示(350,10+95)
        字体20:取图像('其他制造'):显示(595,10+95)
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像('类型    等级    价格'):显示(50,46+95)
        字体18:取图像('类型    等级    价格'):显示(297,46+95)
        字体18:取图像('类型    等级    价格'):显示(545,46+95)
        字体18:取图像('普通打造'):显示(56,273+95)
        字体18:取图像('强化打造'):显示(172,273+95)
        nsf:渲染结束()
    end
    摊位购买.图像 = nsf:到精灵()
end

local 装备制造列表 = 制造类控件:创建列表("装备制造列表",20,72,238,200)
function 装备制造列表:初始化()
    self:置文字(字体18)
    self.行高度 = 44
    self.行间距 = 0
end

function 装备制造列表:重置(data)
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(238,50)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('深蓝'))
            字体16:取图像(v.名称):显示(27,12)
            字体16:取图像(v.等级):显示(107,12)
            字体16:取图像(v.价格):显示(167,12)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 装备制造列表:左键弹起(x, y, i, item, msg)
    制造类控件.其他制造列表:置选中(0)
    制造类控件.装备修理列表:置选中(0)
    摊位购买.选中 = i
end

local 装备修理列表 = 制造类控件:创建列表("装备修理列表",266,72,238,200)
function 装备修理列表:初始化()
    self:置文字(字体18)
    self.行高度 = 44
    self.行间距 = 0
end

function 装备修理列表:重置(data)
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(238,50)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('深蓝'))
            字体16:取图像(v.名称):显示(27,12)
            字体16:取图像(v.等级):显示(107,12)
            字体16:取图像(v.价格):显示(167,12)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 装备修理列表:左键弹起(x, y, i, item, msg)
    制造类控件.其他制造列表:置选中(0)
    制造类控件.装备制造列表:置选中(0)
    摊位购买.选中 = i
end

local 其他制造列表 = 制造类控件:创建列表("其他制造列表",513,72,238,200)

function 其他制造列表:初始化()
    self:置文字(字体18)
    self.行高度 = 44
    self.行间距 = 0
end

function 其他制造列表:重置(data)
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(238,50)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('深蓝'))
            字体16:取图像(v.名称):显示(18,12)
            字体16:取图像(v.等级):显示(108,12)
            字体16:取图像(v.价格):显示(166,12)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 其他制造列表:左键弹起(x, y, i, item, msg)
    制造类控件.装备制造列表:置选中(0)
    制造类控件.装备修理列表:置选中(0)
    摊位购买.选中 = i
end

for i, v in ipairs {
    {name = '普通打造', x = 27 ,y = 271 , tcp = __res:getPNGCC(2,1172,107,26,26,true),tcp2 = __res:getPNGCC(2,1171,73,26,26,true)},
    {name = '强化打造', x = 145 ,y = 271 , tcp = __res:getPNGCC(2,1172,107,26,26,true),tcp2 = __res:getPNGCC(2,1171,73,26,26,true)},
} do
    local  临时函数 = 制造类控件:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y)
    function 临时函数:左键弹起(x, y)
 
    end
end