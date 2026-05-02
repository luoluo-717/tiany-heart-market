--[[
    @Author       : GGELUA
    @Date         : 2022-04-27 10:43:55
Last Modified by: GGELUA
Last Modified time: 2023-07-28 09:02:08
--]]
local 符石合成 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("符石合成",0,0,417,519)
local 当前 = 多开数据.当前
function 符石合成:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(417,519)
    if nsf:渲染开始() then
        置窗口背景("符石合成",0,12,409,505,true):显示(0,0)
        取灰色背景(0, 0, 365, 275, true):显示(24,118)
        字体18:置颜色(__取颜色('白色'))
        local lssj = 取输入背景(0,0,92,23)
        字体18:取图像('所需现金'):显示(21,406)
        字体18:取图像('现有现金'):显示(214,406)
        字体18:取图像('所需体力'):显示(21,438)
        字体18:取图像('现有体力'):显示(214,438)
        lssj:显示(105,404)
        lssj:显示(298,404)
        lssj:显示(105,436)
        lssj:显示(298,436)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 符石合成:打开(data)
    self:置可见(true)
    self.数据 = 多开数据[当前].__主控.道具列表
    self:重置(多开数据[当前].__主控.道具列表)
end

function 符石合成:重置()
    local nsf = require('SDL.图像')(409,69)
    if nsf:渲染开始() then
        字体18:置颜色(__取银子颜色(多开数据[当前 or self and self.当前].角色信息.银子))
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.银子):显示(305,12)
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.体力):显示(305,44)
        字体18:取图像(100000):显示(112,12)
        字体18:取图像(30):显示(112,44)
        nsf:渲染结束()
    end
    符石合成.图像 = nsf:到精灵()
    符石合成.图像:置中心(0,-398)
    self.道具网格:置物品(多开数据[当前].__主控.道具列表)
    self.材料网格:置物品({})
end

function 符石合成:重置银子(a)
    local nsf = require('SDL.图像')(409,69)
    if nsf:渲染开始() then
        字体18:置颜色(__取银子颜色(多开数据[当前 or self and self.当前].角色信息.银子))
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.银子):显示(305,12)
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.体力):显示(305,44)

        字体18:取图像(100000):显示(112,12)
        字体18:取图像(30):显示(112,44)
        nsf:渲染结束()
    end
    符石合成.图像 = nsf:到精灵()
    符石合成.图像:置中心(0,-398)
end


local 关闭 = 符石合成:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",367,0)
function 关闭:左键弹起(x,y,msg)
    符石合成:置可见(false)
end

local 道具网格 = 符石合成:创建网格("道具网格",43,128,318,252)

function 道具网格:初始化()
    self:创建格子(55,55,10,10,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        for i=1,#符石合成.材料网格.子控件 do
            if not 符石合成.材料网格.子控件[i]._spr.物品 then
                self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
                符石合成.材料网格:置物品(self.子控件[a]._spr.物品,i)
                符石合成:重置银子(self.子控件[a]._spr.物品.等级 or 0)
                符石合成.材料网格.子控件[i]._spr.物品.原始编号 = a
                self:置物品(nil,a)
                break
            end
        end
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

local 材料网格 = 符石合成:创建网格("材料网格",80,55,280,55)

function 材料网格:初始化()
    self:创建格子(55,55,10,10,1,4)
end

function 材料网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
        符石合成.道具网格:置物品(self.子控件[a]._spr.物品,self.子控件[a]._spr.物品.原始编号)
        self:置物品(nil,a)
        符石合成:重置银子(0)
    end
end


function 材料网格:置物品(数据,bh)
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i],"制造")
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"制造")
        self.子控件[bh]:置精灵(lssj)
    end
end

for i, v in ipairs {
    {name = '合成', x = 146 ,y = 466 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(118,41) , font = '合成'},
} do
    local 临时函数 = 符石合成:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '合成' then
            if 符石合成.材料网格.子控件[1]._spr.物品 then
                local 材料 = {(符石合成.材料网格.子控件[1]._spr.物品 or {}).原始编号,(符石合成.材料网格.子控件[2]._spr.物品 or {}).原始编号,(符石合成.材料网格.子控件[3]._spr.物品 or {}).原始编号,(符石合成.材料网格.子控件[4]._spr.物品 or {}).原始编号}
                发送数据(当前 or self and self.当前,3803,{材料=材料})
                符石合成:置可见(false)
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请放入材料')
            end
        end
    end
end