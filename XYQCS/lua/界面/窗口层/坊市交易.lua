--[[
    @Author       : GGELUA
    @Date         : 2022-04-22 15:14:08
Last Modified by: GGELUA
Last Modified time: 2023-07-22 21:35:34
--]]
local 坊市交易 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("坊市交易",0,0,960,534)
local 当前 = 多开数据.当前
local 菜单 = {'召唤兽培养','低级兽诀','高级兽诀','特殊兽诀','低级内丹','高级内丹','药品','阵法','宝石','其他'}
function 坊市交易:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(960,534)
    if nsf:渲染开始() then
        置窗口背景("坊市",0,12,952,523,true):显示(0,0)
        取白色背景(0,0,723,456,true):显示(214,57)
        local lssj = 取输入背景(0,0,130,23)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('银子'):显示(30,370)
        lssj:显示(70,368)
        字体18:取图像('储备金'):显示(30,395)
        lssj:显示(70,393)
        字体18:取图像('数量'):显示(30,443)
        取输入背景(0,0,60,23):显示(70,445)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 坊市交易:打开(data)
    self:置可见(true)
    self.银子 = data.银子
    self.储备金 = data.储备金 or 0
    self.组号 = data.组号
    if self.分类 then
        self.坊市交易网格.子控件[self.分类]._spr.确定 = nil
    end
    self.分类 = 1
    self.坊市交易网格.子控件[self.分类]._spr.确定 = true
    self.道具网格:置物品(多开数据[当前].__主控.坊市数据[菜单[self.分类]])
    self.数量输入:置数值(1)
    self:重置()
end

function 坊市交易:重置()
    local nsf = require('SDL.图像')(130,75)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('浅黑'))
        字体18:取图像(self.银子):显示(0,3)
        字体18:取图像(self.储备金):显示(0,29)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.图像:置中心(-75,-368)
end

local 关闭 = 坊市交易:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",910,0)

function 关闭:左键弹起(x,y,msg)
    坊市交易:置可见(false)
    self.选中 = nil
end

local 坊市交易网格 = 坊市交易:创建网格("坊市交易网格",15,53,184,315)

function 坊市交易网格:初始化()
    self:创建格子(184,55,9,0,10,1,true)
    self:置数据(菜单)
end

function 坊市交易网格:左键弹起(x, y, a, b, msg)
    if 坊市交易.分类 then
        self.子控件[坊市交易.分类]._spr.确定 = nil
    end
    坊市交易.分类 = a
    self.子控件[a]._spr.确定 = true
    if a <= 10 then
        坊市交易.图像2 = nil
        if 菜单[坊市交易.分类] == '仙玉充值' then
            坊市交易.道具网格:置物品({})
            --坊市交易:收款码()
            local SDL = require('SDL')
            if __标题 == '西游2' then
                SDL.OpenURL('http://49.235.65.67')
            else
                SDL.OpenURL('http://192.168.3.76')
            end
        elseif 菜单[坊市交易.分类] == '翻一番' then
            坊市交易.道具网格:置物品({})
        else
            坊市交易.道具网格:置物品(多开数据[当前].__主控.坊市数据[菜单[坊市交易.分类]])
        end
    end
end

function 坊市交易网格:置数据(数据)
    for i = 1,#self.子控件 do
        local lssj = __阵型格子.创建(当前)
        lssj:置数据(数据[i])
        self.子控件[i]:置精灵(lssj)
    end
end

local 道具网格 = 坊市交易:创建网格("道具网格",223,71,704,430)

function 道具网格:初始化()

end

function 道具网格:左键弹起(x, y, a, b, msg)
    if 坊市交易.选中 and self.子控件[坊市交易.选中] and self.子控件[坊市交易.选中]._spr and self.子控件[坊市交易.选中]._spr.确定 then
        self.子控件[坊市交易.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        坊市交易.选中 = a
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(0,86,w,h,"选择",a)
    end
end

function 道具网格:置物品(数据)
    local lssj = 1
    if #数据 > 5 then
        lssj = #数据//5+1
    end
    self:创建格子(125,125,20,20,lssj,5,true)
    for i = 1,#self.子控件 do
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据[i],"商城道具")
        if lssj.数据 then
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵(nil)
        end
    end
end

local 数量输入 = 坊市交易:创建我的输入("数量输入",90,445,50,24,2,2,'黑色')

local 购买 = 坊市交易:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(80,41),"购买",10,473,"购买")
function 购买:左键弹起(x,y,msg)
    if 坊市交易.选中 and 菜单[坊市交易.分类] and 坊市交易.数量输入:取数值() then
        发送数据(当前 or self and self.当前,39.1,{
            编号 = 坊市交易.选中,
            数量 = 坊市交易.数量输入:取数值(),
            组号 = 18,
            分类 = 菜单[坊市交易.分类],
            叠加 = 坊市交易.道具网格.子控件[坊市交易.选中]._spr.物品.可叠加
        })
    end
end
local 出售 = 坊市交易:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(80,41),"出售",100,473,"出售")

function 出售:左键弹起(x,y,msg)
    发送数据(当前 or self and self.当前,126)
end
