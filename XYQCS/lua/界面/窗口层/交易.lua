--[[
    @Author       : GGELUA
    @Date         : 2022-04-08 10:58:05
Last Modified by: GGELUA
Last Modified time: 2023-08-17 09:53:35
--]]
local 交易 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("交易",0,0,655,453)
local 当前 = 多开数据.当前
local lsb = {"现有现金","给予银两"}
function 交易:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(655,453)
    if nsf:渲染开始() then
        置窗口背景("交易",0,12,644,438,true):显示(0,0)
        字体18:置颜色(__取颜色('白色'))
        local lssj = 取输入背景(0,0,145,23)
        字体18:取图像('已方支付银两'):显示(15,66)
        __res:getPNGCC(3,736,1155,199,37,true):拉伸(145,36):显示(138,57)
        字体18:取图像('你正在和'):显示(15,219)
        字体18:取图像('交易'):显示(225,219)
        字体18:取图像('等级'):显示(15,256)
        字体18:取图像('关系'):显示(125,256)
        字体18:取图像('对方支付银两'):显示(15,294)
        lssj:显示(138,292)
        字体18:取图像('确认'):显示(229,155)
        字体18:取图像('确认'):显示(229,384)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 交易:打开(data)
    self:置可见(true)
    self.物品:左键弹起()
    self:重置(data)
    self.物品控件.给予网格:置物品({})
    self.物品控件.对方给予网格:置物品({})
    self.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
    self.召唤兽控件.召唤兽网格:置物品(多开数据[当前 or self and self.当前].角色信息.宝宝列表)
    self.召唤兽控件.名称网格:置数据({})
    self.确定:置选中(false)
    self.对方确定:置选中(false)
    self.格子 = {}
    self.bb = {}
    self.发送缓存 = false
end

function 交易:切换(data)
    self.物品:左键弹起()
    self:重置(data)
    self.物品控件.给予网格:置物品({})
    self.物品控件.对方给予网格:置物品({})
    self.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
    self.召唤兽控件.召唤兽网格:置物品(多开数据[当前 or self and self.当前].角色信息.宝宝列表)
    self.召唤兽控件.名称网格:置数据({})
    self.召唤兽控件.对方名称网格:置数据({})
    self.确定:置选中(false)
    self.对方确定:置选中(false)
    self.格子 = {}
    self.bb = {}
    self.发送缓存 = false
end

function 交易:重置(data)
    local nsf = require('SDL.图像')(290,453)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黄色'))
        local lssj = 取输入背景(0,0,145,23)
        字体18:取图像(data.名称):显示(101,219)
        字体18:取图像(data.等级):显示(65,256)
        字体18:取图像('陌生人'):显示(171,256)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.银两输入:置数值(0)
    self.对方银两输入:置数值(0)
    self.物品控件:重置()
end

function 交易:对方重置(data)
    self.物品控件.对方给予网格:置物品(data.道具)
    self.银两输入:置数值(data.银子+0)
    self.召唤兽控件.对方名称网格:置数据(data.bb)
end

function 交易:我方重置(data)
    local 道具 = {}
    for i=1,3 do
        if data.道具[i] and 多开数据[当前].__主控.道具列表[data.道具[i]] then
            道具[#道具+1] = 多开数据[当前].__主控.道具列表[data.道具[i]]
        end
    end
    self.物品控件.给予网格:置物品(道具)
    self.对方银两输入:置数值(data.银子+0)
    self.召唤兽控件.名称网格:置数据(data.bb)
end

local 关闭 = 交易:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",605,0)

function 关闭:左键弹起(x,y,msg)
    交易:置可见(false)
    发送数据(当前 or self and self.当前,3719)
end

local  银两输入 = 交易:创建我的输入('银两输入',147,64,130,18,2,10,'浅黑')

local  对方银两输入 = 交易:创建我的输入('对方银两输入',147,295,130,18,2,10,'浅黑')

local 物品控件 = 交易:创建我的控件("物品控件",0,0,655,453)

function 物品控件:初始化()
    local nsf = require('SDL.图像')(655,453)
    if nsf:渲染开始() then
        __res:getPNGCC(3,694,4,338,273):显示(294,108)
        local lssj = 取输入背景(0,0,56,23)
        lssj:显示(16,173)
        lssj:显示(90,173)
        lssj:显示(165,173)
        lssj:显示(16,401)
        lssj:显示(90,401)
        lssj:显示(165,401)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 物品控件:重置()
    self.道具数量1:置数值(1)
    self.道具数量2:置数值(1)
    self.道具数量3:置数值(1)
end

local 给予网格 = 物品控件:创建网格("给予网格",17,109,214,55)

function 给予网格:初始化()
    self:创建格子(55,55,0,19,1,3)
end

function 给予网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        物品控件.道具网格:置物品(self.子控件[a]._spr.物品,self.子控件[a]._spr.物品.原始编号)
        self:置物品(nil,a)
        交易.格子[a] = nil
    end
end

function 给予网格:置物品(数据,bh)
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i],"给予")
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"给予")
        self.子控件[bh]:置精灵(lssj)
    end
end

local 对方给予网格 = 物品控件:创建网格("对方给予网格",17,338,214,55)

function 对方给予网格:初始化()
    self:创建格子(55,55,0,19,1,3)
end

function 对方给予网格:置物品(数据,bh)
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i],"给予")
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"给予")
        self.子控件[bh]:置精灵(lssj)
    end
end

local 道具网格 = 物品控件:创建网格("道具网格",295,111,326,260)

function 道具网格:初始化()
    self:创建格子(55,55,14,13,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        for i=1,#物品控件.给予网格.子控件 do
            if not 物品控件.给予网格.子控件[i]._spr.物品 and not 交易.确定.是否选中 then
                self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
                物品控件.给予网格:置物品(self.子控件[a]._spr.物品,i)
                物品控件.给予网格.子控件[i]._spr.物品.原始编号 = a
                交易.格子[i] = a
                self:置物品(nil,a)
                break
            end
        end
    end
end

function 道具网格:置物品(数据,bh)
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __物品格子.创建(当前)
            lssj:置物品(数据[i],"道具选择")
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __物品格子.创建(当前)
        lssj:置物品(数据,"给予")
        self.子控件[bh]:置精灵(lssj)
    end
end

for i, v in ipairs {
    {name = '道具数量1', x = 30 ,y = 175 , font = '道具数量1'},
    {name = '道具数量2', x = 105 ,y = 175 , font = '道具数量2'},
    {name = '道具数量3', x = 180 ,y = 175 , font = '道具数量3'},
    -- {name = '对方道具数量1', x = 30 ,y = 403 , font = '对方道具数量1'},
    -- {name = '对方道具数量2', x = 105 ,y = 403 , font = '对方道具数量2'},
    -- {name = '对方道具数量3', x = 180 ,y = 403 , font = '对方道具数量3'},
} do
    local  临时函数 = 物品控件:创建我的输入(v.name,v.x,v.y,20,18,2,2,'浅黑')
end

local 召唤兽控件 = 交易:创建我的控件("召唤兽控件",0,0,655,453)

function 召唤兽控件:初始化()
    local nsf = require('SDL.图像')(655,453)
    if nsf:渲染开始() then
        local lssj = 取输入背景(0,0,203,23)
        lssj:显示(15,107)
        lssj:显示(15,146)
        lssj:显示(15,184)
        lssj:显示(15,329)
        lssj:显示(15,367)
        lssj:显示(15,406)
        取灰色背景(0,0,335,277,true):显示(296,106)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

local 召唤兽网格 = 召唤兽控件:创建网格("召唤兽网格",307,114,317,270)

function 召唤兽网格:左键弹起(x, y, a, b, msg)
    local lsb = {}
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        for i, v in ipairs(召唤兽控件.名称网格.子控件) do
            if not v._spr then
                table.insert( lsb,i)
            else
               if v._spr.原始编号 == a then
                    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y不可以选中重复的召唤兽')
                    return 
               end
            end
        end
    end
    if lsb[1] and not 交易.确定.是否选中 then
        召唤兽控件.名称网格:置数据(self.子控件[a]._spr.数据,lsb[1],a)
        交易.bb[lsb[1]] = a
    end
end

function 召唤兽网格:置物品(data)
    self:创建格子(317,64,10,10,#data,1,true)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __摊位格子.创建(当前)
            lssj:置物品(data[i],"交易召唤兽")
            self.子控件[i]:置精灵(lssj)
            local 按钮 = self.子控件[i]:创建我的按钮(__res:getPNGCC(4,822,9,38,38),'按钮'..i,256,15)
            function 按钮:左键弹起(x,y,msg)
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(data[i])
            end
            按钮:置可见(true,true)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 名称网格 = 召唤兽控件:创建网格("名称网格",36,101,190,115)

function 名称网格:初始化()
    self:创建格子(185,33,7,0,3,1)
end

function 名称网格:置数据(data,bh,ysbh)
    if bh then
        local nsf = require('SDL.图像')(155,33)
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('黑色'))
            字体18:取图像(data.名称):显示(0,8)
            nsf:渲染结束()
        end
        self.子控件[bh]:置精灵(nsf:到精灵())
        self.子控件[bh]._spr.原始编号 = ysbh
        if not self.子控件[bh]['按钮'..bh] then
            local 按钮 = self.子控件[bh]:创建我的按钮(__res:getPNGCC(2,1122,419,49,48):拉伸(33,33),'按钮'..bh,155,0)
            function 按钮:左键弹起(x,y,msg)
                名称网格.子控件[bh]:置精灵()
                按钮:置可见(false)
                交易.bb[bh] = nil
            end
        end
        self.子控件[bh]['按钮'..bh]:置可见(true,true)
    else
        for i = 1,#self.子控件 do
            self.子控件[i]:置精灵()
        end
    end
end

local 对方名称网格 = 召唤兽控件:创建网格("对方名称网格",36,323,190,115)

function 对方名称网格:初始化()
    self:创建格子(185,33,7,0,3,1)
end

function 对方名称网格:置数据(data)
        for i = 1,#self.子控件 do
            if data[i] then
                local nsf = require('SDL.图像')(150,33)
                if nsf:渲染开始() then
                    字体18:置颜色(__取颜色('黑色'))
                    字体18:取图像(data[i].名称):显示(0,8)
                    nsf:渲染结束()
                end
                self.子控件[i]:置精灵(nsf:到精灵())
                if not self.子控件[i]['按钮'..i] then
                    local 按钮 = self.子控件[i]:创建我的按钮(__res:getPNGCC(4,822,9,38,38):拉伸(33,33),'按钮'..i,155,0)
                    function 按钮:左键弹起(x,y,msg)
                        多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(data[i])
                    end
                end
                self.子控件[i]['按钮'..i]:置可见(true,true)
            end
        end
end

for i, v in ipairs {
    {name = '物品', x = 296 ,y = 56 , tcp = __res:getPNGCC(3,511,11,117,43,true), tcp2 = __res:getPNGCC(3,390,12,118,43,true) , font = '物品'},
    {name = '召唤兽', x = 505 ,y = 56 , tcp = __res:getPNGCC(3,511,11,117,43,true), tcp2 = __res:getPNGCC(3,390,12,118,43,true) , font = '召唤兽'},
} do
    local  临时函数 = 交易:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '物品' then
            交易.召唤兽控件:置可见(false)
            交易.物品控件:置可见(true)
            交易.物品:置选中(true)
        elseif v.name == '召唤兽' then
            交易.召唤兽控件:置可见(true)
            交易.物品控件:置可见(false)
            交易.召唤兽:置选中(true)
        end
    end
end

for i, v in ipairs {
    {name = '确定', x = 234 ,y = 119 , tcp = __res:getPNGCC(2,1172,107,26,26,true), tcp2 = __res:getPNGCC(2,1171,75,26,26,true)},
    {name = '对方确定', x = 234 ,y = 346 , tcp = __res:getPNGCC(2,1172,107,26,26,true), tcp2 = __res:getPNGCC(2,1171,75,26,26,true)},
} do 
    local 临时函数 = 交易:创建我的多选按钮(v.tcp,v.tcp2,v.name,v.x,v.y)
    function 临时函数:左键弹起(x, y)
        if v.name == "确定" and not 交易.确定.是否选中 then
            if not 交易.发送缓存 then
                交易.发送缓存 = {银子=交易.银两输入:取数值(),道具=交易.格子,bb=交易.bb}
            end
            发送数据(当前 or self and self.当前,3717,交易.发送缓存) 
        end
    end
end

for i, v in ipairs {
    {name = '取消', x = 293 ,y = 396 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,41) , font = '取消'},
    {name = '交易', x = 505 ,y = 396 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,41),  font = '交易'},
} do
    local 临时函数 = 交易:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '取消' then
            发送数据(当前 or self and self.当前,3719)
            交易.关闭:左键弹起()
        elseif v.name == '交易' then
            if not 交易.发送缓存 then
                交易.发送缓存 = {银子=交易.银两输入:取数值(),道具=交易.格子,bb=交易.bb}
            end
            发送数据(当前 or self and self.当前,3717.1,交易.发送缓存) 
        end
    end
end