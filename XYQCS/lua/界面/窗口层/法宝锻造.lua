--[[
    @Author       : GGELUA
    @Date         : 2022-08-07 18:54:43
Last Modified by: GGELUA
Last Modified time: 2023-07-28 14:06:19
--]]
local 法宝锻造 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("法宝锻造",0,0,410,464)
local 当前 = 多开数据.当前
function 法宝锻造:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(410,464)
    local lsb = {{x=60,y=70,font='内丹'},{x=293,y=71,font='材料1'},{x=180,y=147,font='材料2'},{x=60,y=214,font='法宝'},{x=293,y=214,font='天珠'}}
    if nsf:渲染开始() then
        置窗口背景("法宝锻造",0,12,410,454,true):显示(0,0)
        local lssj = 取输入背景(0,0,55,23)
        字体18:置颜色(__取颜色('白色'))
        for i, v in ipairs(lsb) do
            字体18:取图像(v.font):显示(v.x+10,v.y+60)
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 法宝锻造:打开()
    self:置可见(true)
    self.材料网格:置物品(nil)
    self.材料网格:重置()
end

local 关闭 = 法宝锻造:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",360,0)

function 关闭:左键弹起(x,y,msg)
    法宝锻造:置可见(false)
end

for i, v in ipairs {
    {name = '开始', x = 111 ,y = 345 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(175,41) , font = '开始'},
} do
    local 临时函数 = 法宝锻造:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '开始' then
            if 法宝锻造.材料网格.子控件[1]._spr.原始编号 and 法宝锻造.材料网格.子控件[2]._spr.原始编号 and 法宝锻造.材料网格.子控件[3]._spr.原始编号 then
                local 临时格子 = {}
                for i=1,5 do
                    if 法宝锻造.材料网格.子控件[i]._spr.原始编号 ~= nil then
                        临时格子[i] =法宝锻造.材料网格.子控件[i]._spr.原始编号
                    end
                end
                发送数据(当前 or self and self.当前,3715,{格子=临时格子,类型="道具"})
                法宝锻造.关闭:左键弹起()
            end
        end
    end
end

local 材料网格 = 法宝锻造:创建网格("材料网格",0,0,366,275)

function 材料网格:初始化()
    self:创建格子(55,55,0,0,1,5)
end

function 材料网格:重置()
    self.已加材料 = {}
end

function 材料网格:左键弹起(x, y, a, b, msg)
    local xx,yy = 50,50
    if a == 1 then
       多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(多开数据[当前].__主控.道具列表,xx,yy,'法宝合成',"法宝合成",5,a)
    elseif a == 4 then
       多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(多开数据[当前].__主控.道具列表,xx,yy,'法宝合成',"法宝合成",nil,a)
    elseif a == 5 then
       多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(多开数据[当前].__主控.道具列表,xx,yy,'法宝合成',"法宝合成",11,a)
    else
       多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(多开数据[当前].__主控.道具列表,xx,yy,'法宝合成',"法宝合成",nil,a)
    end
end

function 材料网格:置物品(data,bh,pid)
    local lsb = {{x=60,y=70},{x=293,y=71},{x=180,y=147},{x=60,y=214},{x=293,y=214}}
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __材料格子.创建(当前)
            lssj:置物品(data)
            self.子控件[i]:置精灵(lssj)
            self.子控件[i]:置坐标(lsb[i].x,lsb[i].y)
        end
    else
        if not self.已加材料[pid] then
            if self.子控件[bh]._spr.原始编号 then
                self.已加材料[self.子控件[bh]._spr.原始编号] = nil
            end
            local lssj = __材料格子.创建(当前)
            lssj:置物品(data)
            lssj.原始编号 = pid
            self.已加材料[pid] = bh
            self.子控件[bh]:置精灵(lssj)
            self.子控件[bh]:置坐标(lsb[bh].x,lsb[bh].y)
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y这个道具已经添加过无法在添加')
        end
    end
end