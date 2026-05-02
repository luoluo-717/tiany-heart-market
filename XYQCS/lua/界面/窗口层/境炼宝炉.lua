--[[
    @Author       : GGELUA
    @Date         : 2023-03-28 10:54:12
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:30:19
--]]
local 境炼宝炉 = __UI界面.窗口层:创建我的窗口("境炼宝炉",0,0,727,484)

function 境炼宝炉:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(727,484)
    if nsf:渲染开始() then
        置窗口背景("境炼宝炉",0,12,720,473,true):显示(0,0)
        __res:getPNGCC(3,694,4,338,273):显示(30,72)
        local lssj = 取输入背景(0,0,55,23)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('体活消耗：'):显示(30,370)
        lssj:显示(115,368)
        字体18:取图像('总价值：'):显示(195,370)
        lssj:显示(305,368)
        字体18:取图像('银两消耗：'):显示(30,420)
        lssj:显示(115,418)
    end
    self:置精灵(nsf:到精灵())
end

function 境炼宝炉:打开()
    self:置可见(true)
    self.道具网格:置物品(多开数据[当前].__主控["道具列表"],{2,300})
    self.材料网格:置物品(nil)
	self.总价值 = 0
    self:刷新()
end

function 境炼宝炉:刷新(data)
    if data then
        self.道具网格:置物品(data,{2,300})
        self.材料网格:置物品(nil)
		self.总价值 = 0
    end
    local nsf = require('SDL.图像')(727,484)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像(40):显示(130,370)
        字体18:取图像(self.总价值):显示(320,370)
        字体18:取图像(200000):显示(130,420)
    end   
    self.图像 = nsf:到精灵()
end

local 关闭 = 境炼宝炉:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",677,0)

function 关闭:左键弹起(x,y,msg)
    境炼宝炉:置可见(false)
end

for i, v in ipairs {
    {name = '确定', x = 591 ,y = 409 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(103,41),  font = '确定'},
} do
    local 临时函数 = 境炼宝炉:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        local lsb = {材料={}}
		for i,v in ipairs(境炼宝炉.材料网格.子控件) do
            if v._spr and v._spr.物品 and v._spr.物品.原始编号 then
				if i == 1 then
					lsb.装备格子 = v._spr.物品.原始编号
				elseif i == 2 then
					lsb.宝石格子 = v._spr.物品.原始编号
				else
					table.insert(lsb.材料,{编号=v._spr.物品.原始编号,识别码=v._spr.物品.识别码})
				end
			end
		end
		if lsb.装备格子 and lsb.宝石格子 then
			发送数据(当前 or self and self.当前,4503,lsb)
		else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y公式不正确请重新放入')
		end
    end
end

local 道具网格 = 境炼宝炉:创建网格("道具网格",30,72,339,272)

function 道具网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and not self.子控件[a]._spr.物品禁止 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        if self.子控件[a]._spr.确定 then
            for i, v in ipairs(境炼宝炉.材料网格.子控件) do
                if v._spr and not v._spr.物品 then
                    if  i == 1 and self.子控件[a]._spr.物品.总类 == 2 and self.子控件[a]._spr.物品.分类 <= 6 and self.子控件[a]._spr.物品.等级 >=100 then
                        境炼宝炉.材料网格:置物品(多开数据[当前].__主控["道具列表"][a],i,a)
                        self:置物品(nil,nil,a)
                        break
                    elseif i == 2 and self.子控件[a]._spr.物品.总类 == 300 then
                        境炼宝炉.材料网格:置物品(多开数据[当前].__主控["道具列表"][a],i,a)
                        self:置物品(nil,nil,a)
                        break
                    elseif i > 2 and self.子控件[a]._spr.物品.总类 == 2 and self.子控件[a]._spr.物品.分类 <= 13  then
                        境炼宝炉.材料网格:置物品(多开数据[当前].__主控["道具列表"][a],i,a)
                        self:置物品(nil,nil,a)
                        break
                    else

                    end
                end
            end
            境炼宝炉:刷新()
        else
            self.子控件[a]._spr:详情打开(370,86,w,h,"选择",a)
            for i, v in ipairs(self.子控件) do
                if v._spr and v._spr.物品 then
                    if v._spr.确定 and i ~= a then
                        v._spr.确定 = nil
                    end
                end
            end
            self.子控件[a]._spr.确定 = true
        end
    end
end

function 道具网格:置物品(data,zl,bh)
    if not bh then
        for i = 1,#self.子控件 do
            if data[i] then
                local lssj = __物品格子.创建(当前)
                lssj:置物品(data[i],nil,"道具选择")
                lssj:置总类禁止(zl)
                lssj:置偏移(10,10)
                self.子控件[i]:置精灵(lssj)
            else
                self.子控件[i]:置精灵()
            end
        end
    else
        if data then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data,nil,"道具选择")
            lssj:置总类禁止(zl)
            lssj:置等级禁止(100,'小')
            lssj:置偏移(10,10)
            self.子控件[bh]:置精灵(lssj)
        else
            self.子控件[bh]:置精灵()
        end
    end
end

local 材料网格 = 境炼宝炉:创建网格("材料网格",380,60,325,325)
function 材料网格:初始化()
    local 格子坐标 = {{x=133,y=130},{x=133,y=0},{x=232,y=33},{x=265,y=133},{x=232,y=233},{x=133,y=263},{x=33,y=233},{x=0,y=132},{x=33,y=33}}
    self:创建格子(55,55,0,0,3,3)
    for i,v in ipairs(self.子控件) do
        v:置坐标(格子坐标[i].x,格子坐标[i].y)
    end
end

function 材料网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        境炼宝炉.道具网格:置物品(多开数据[当前].__主控["道具列表"][self.子控件[a]._spr.物品.原始编号],{2,300},self.子控件[a]._spr.物品.原始编号)
        self:置物品(nil,a)
    end
end

function 材料网格:置物品(data,bh,pid)
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __材料格子.创建(当前)
            lssj:置物品(data)
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __材料格子.创建(当前)
        lssj:置物品(data)
        if data then
            lssj.物品.原始编号 = pid
        end
        self.子控件[bh]:置精灵(lssj)
    end
end