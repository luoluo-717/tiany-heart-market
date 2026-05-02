--[[
    @Author       : GGELUA
    @Date         : 2022-04-28 10:50:21
Last Modified by: GGELUA
Last Modified time: 2023-08-06 20:34:06
--]]
local 商会物品 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("商会物品",0,0,424,519)
local 当前 = 多开数据.当前
function 商会物品:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(424,519)
    if nsf:渲染开始() then
        置窗口背景("商店详情",0,12,417,505,true):显示(0,0)
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
        取输入背景(0,0,104,23):显示(64,465)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 商会物品:打开(data)
    self:置可见(true)
    self.数据 = data
    self.页数 = 1
    self:重置()
    self.数量输入:置数值(1)
    self:刷新()
    local nsf = require('SDL.图像')(424,92)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像(self.数据.名称):显示(20,57)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    
end

function 商会物品:重置()
    self.道具网格:置物品(self.数据.道具)
    self.选中 = nil
end

function 商会物品:刷新()
    local nsf = require('SDL.图像')(424,130)
    if nsf:渲染开始() then
        if 商会物品.选中 then
            字体18:置颜色(__取银子颜色(商会物品.数据.道具[商会物品.选中].价格))
            字体18:取图像(商会物品.数据.道具[商会物品.选中].价格):显示(80,20)
            if 商会物品.数量输入:取数值() then
                字体18:置颜色(__取银子颜色(商会物品.数据.道具[商会物品.选中].价格*商会物品.数量输入:取数值()))
                字体18:取图像(商会物品.数据.道具[商会物品.选中].价格*商会物品.数量输入:取数值()):显示(80,50)
            end
        end
        字体18:置颜色(__取银子颜色(多开数据[当前 or self and self.当前].角色信息.银子))
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.银子):显示(272,50)
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像(self.页数..' / 10'):显示(98,90)
        nsf:渲染结束()
    end
    商会物品.图像2 = nsf:到精灵()
    商会物品.图像2:置中心(0,-378)
end

local 关闭 = 商会物品:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",374,0)
function 关闭:左键弹起(x,y,msg)
    商会物品:置可见(false)
end

local 道具网格 = 商会物品:创建网格("道具网格",45,115,328,256)

function 道具网格:初始化()
    self:创建格子(55,55,13,13,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        if 商会物品.选中 then
            self.子控件[商会物品.选中]._spr.确定 = nil
        end
        商会物品.选中 = a
        self.子控件[商会物品.选中]._spr.确定 = true
        self.子控件[a]._spr:详情打开(430,86,w,h,"选择",a)
        商会物品:刷新()
    end
end

function 道具网格:置物品(data,bh)
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],"白格子","战斗道具")
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __物品格子.创建(当前)
        lssj:置物品(data,"白格子","战斗道具")
        self.子控件[bh]:置精灵(lssj)
    end
end

local 数量输入 = 商会物品:创建我的输入("数量输入",310,392,44,18,2,2,'黑色')

for i, v in ipairs {
    {name = '上一页', x = 16 ,y = 457 , tcp = __res:getPNGCC(4,970,6,44,44,true)},
    {name = '下一页', x = 180 ,y = 457 , tcp = __res:getPNGCC(4,1018,5,44,44,true)},
    {name = '购买', x = 262 ,y = 458 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(140,41) , font = '购 买'},
} do
    local 临时函数 = 商会物品:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '上一页' and 商会物品.页数 > 1 then
            发送数据(当前 or self and self.当前,6109,{编号=商会物品.数据.编号,店主id=商会物品.数据.店主id,页数=商会物品.页数-1})
        elseif v.name == '下一页' and 商会物品.页数 < 10 then
            发送数据(当前 or self and self.当前,6110,{编号=商会物品.数据.编号,店主id=商会物品.数据.店主id,页数=商会物品.页数+1})
        elseif v.name == '购买' then
            if 商会物品.选中 then
                if 商会物品.数量输入:取数值() then
                    发送数据(当前 or self and self.当前,6111,{数量=商会物品.数量输入:取数值(),序列=商会物品.选中,编号=商会物品.数据.编号,店主id=商会物品.数据.店主id,页数=商会物品.页数})
                end
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#请选中一个物品')
            end
        end
    end
end