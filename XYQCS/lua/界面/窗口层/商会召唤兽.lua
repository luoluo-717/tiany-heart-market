--[[
    @Author       : GGELUA
    @Date         : 2022-04-28 10:50:48
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:09:49
--]]
local 商会召唤兽 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("商会召唤兽",0,0,424,519)
local 当前 = 多开数据.当前
function 商会召唤兽:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(424,519)
    if nsf:渲染开始() then
        置窗口背景("商会召唤兽",0,12,417,505,true):显示(0,0)
        取灰色背景(0, 0, 375, 350, true):显示(22,50)
        字体18:置颜色(__取颜色('白色'))
        local lssj = 取输入背景(0,0,135,23)
        字体18:取图像('单价'):显示(18,424)
        字体18:取图像('现金'):显示(214,424)
        lssj:显示(70,422)
        lssj:显示(264,422)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 商会召唤兽:打开(data)

    self:置可见(true)
    self.数据 = data.宠物
    self:重置(self.数据)
    self:刷新()
    local nsf = require('SDL.图像')(424,92)
    if nsf:渲染开始() then

        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    
end

function 商会召唤兽:重置(数据)
    self.数据 = 数据
    self.道具网格:置物品(self.数据)
    self.选中 = nil
    self:刷新()
end

function 商会召唤兽:刷新()
    local nsf = require('SDL.图像')(424,130)
    if nsf:渲染开始() then
        if 商会召唤兽.选中 then
            字体18:置颜色(__取银子颜色(商会召唤兽.数据[商会召唤兽.选中].价格))
            字体18:取图像(商会召唤兽.数据[商会召唤兽.选中].价格):显示(80,50)
        end
        字体18:置颜色(__取银子颜色(多开数据[当前 or self and self.当前].角色信息.银子))
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.银子):显示(272,50)
        nsf:渲染结束()
    end
    商会召唤兽.图像2 = nsf:到精灵()
    商会召唤兽.图像2:置中心(0,-378)
end

local 关闭 = 商会召唤兽:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",374,0)
function 关闭:左键弹起(x,y,msg)
    商会召唤兽:置可见(false)
end

local 道具网格 = 商会召唤兽:创建网格("道具网格",33,60,353,350)

function 道具网格:初始化()
    
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        if 商会召唤兽.选中 then
            if 商会召唤兽.选中 == a then
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(商会召唤兽.数据[商会召唤兽.选中])
            else
                self.子控件[商会召唤兽.选中]._spr.确定 = nil
            end
        end
        商会召唤兽.选中 = a
        self.子控件[商会召唤兽.选中]._spr.确定 = true
        商会召唤兽:刷新()
    end
end

function 道具网格:置物品(data)
    self:创建格子(173,65,8,7,math.ceil(#data/2),2,math.ceil(#data/5) > 4)
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

for i, v in ipairs {
    {name = '购买', x = 62 ,y = 458 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(140,41) , font = '购  买'},
    {name = '维护', x = 262 ,y = 458 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(140,41) , font = '刷  新'},
} do
    local 临时函数 = 商会召唤兽:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '购买' then
            if 商会召唤兽.选中 then
                发送数据(当前 or self and self.当前,42,{名称=商会召唤兽.选中})
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#请选中一个召唤兽')
            end
        elseif v.name == "维护" then
            发送数据(当前 or self and self.当前,43)
        end
    end
end