--[[
    @Author       : GGELUA
    @Date         : 2022-04-12 15:45:17
Last Modified by: GGELUA
Last Modified time: 2023-08-06 16:11:03
--]]
local 队伍列表 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("队伍列表",0,0,774,484)
local 当前 = 多开数据.当前
function 队伍列表:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(774,484)
    if nsf:渲染开始() then
        置窗口背景("队伍列表",0,12,766,473,true):显示(0,0)
        取灰色背景(0,0,753,300,true):显示(7,108)
        字体18:置颜色(255,255,255)
        字体18:取图像("令牌"):显示(17,62)
        字体18:取图像("等级"):显示(229,62)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 队伍列表:打开(数据)
    self:置可见(true)
    self.队伍数据 = 数据
    self.队员网格:置数据(数据)
    self.选中 = nil
end

function 队伍列表:重置(数据)
    self.队伍数据 = 数据
    self.队员网格:置数据(数据)
    队伍列表:我的按钮置文字(self.阵法按钮,__res:getPNGCC(2,493,765,118,35,true),数据.阵型)
end

local 关闭 = 队伍列表:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",724,0)

function 关闭:左键弹起(x,y,msg)
    队伍列表:置可见(false)
end

for i, v in ipairs {
    {name = '阵法按钮', font = '无阵法', x = 98 ,y = 54 , tcp = __res:getPNGCC(2,493,765,118,35,true)},
    {name = '等级按钮', font = '0-175级', x = 283 ,y = 54 , tcp = __res:getPNGCC(2,493,765,118,35,true)},
    {name = '请求列表按钮', font = '请求列表', x = 420 ,y = 54 , tcp = __res:getPNGCC(2,493,765,118,35,true)},
    {name = '招募队员按钮', font = '招募队员', x = 16 ,y = 428 , tcp = __res:getPNGCC(2,487,802,150,43,true)},
    {name = '离开队伍按钮', font = '离开队伍', x = 179 ,y = 428 , tcp = __res:getPNGCC(2,487,802,150,43,true)},
    {name = '踢出队伍按钮', font = '踢出队伍', x = 179+163 ,y = 428 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(100,43)},
    {name = '提升队长按钮', font = '提升队长', x = 229+113*2 ,y = 428 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(100,43)},
    {name = '查看按钮', font = '查看队伍', x = 229+113*3 ,y = 428 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(100,43)},
} do
    local  临时函数 = 队伍列表:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '阵法按钮' then
            发送数据(当前 or self and self.当前,4008)
        elseif v.name == '请求列表按钮' then
            发送数据(当前 or self and self.当前,4003)
        elseif v.name == '招募队员按钮' then
        --    多开数据[当前 or self and self.当前].__UI弹出.招募队员:打开(多开数据[当前].__主控.招募信息,true)
            发送数据(当前 or self and self.当前,2001)
        elseif v.name == '离开队伍按钮' then
            发送数据(当前 or self and self.当前,4006)
        elseif v.name == '踢出队伍按钮' then
            -- tp.窗口.文本栏:载入("#R/真的要踢出等级为"..tp.队伍数据[self.选中人物].等级.."的队员"..tp.队伍数据[self.选中人物].名称.."吗？","踢出人物",true)
            if 队伍列表.选中 then
                发送数据(当前 or self and self.当前,4007,{序列=队伍列表.选中})
            end
        elseif v.name == '提升队长按钮' then
            if 队伍列表.选中 then
                发送数据(当前 or self and self.当前,4010,{序列=队伍列表.选中})
                队伍列表:置可见(false)
            end
        elseif v.name == '查看按钮' then
            if 队伍列表.选中 then
                发送数据(当前 or self and self.当前,4011,{序列=队伍列表.选中})
            end
        end
    end
end

local 队员网格 = 队伍列表:创建网格("队员网格",17,114,740,290)

function 队员网格:初始化()
    self:创建格子(143,290,0,5,1,5)
end

function 队员网格:左键弹起(x, y, a, b, msg)
    if 队伍列表.选中 then
        if 队伍列表.选中 ~= a and a ~= 1 and self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
            self.子控件[队伍列表.选中]._spr.确定 = nil
            发送数据(当前 or self and self.当前,4013,{序列=队伍列表.选中,序列2=a})
        else
            self.子控件[队伍列表.选中]._spr.确定 = nil
        end
    else
        if a ~= 1 and self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
            队伍列表.选中 = a
            self.子控件[a]._spr.确定 = true
        end
    end
end

function 队员网格:置数据(数据)
    for i = 1,#队员网格.子控件 do
        local lssj = __队伍格子.创建(当前)
        lssj:置数据(数据[i],i,'队伍列表')
        队员网格.子控件[i]:置精灵(lssj)
    end
end