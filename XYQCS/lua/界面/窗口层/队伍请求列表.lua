--[[
    @Author       : GGELUA
    @Date         : 2022-04-12 15:45:43
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:24:21
--]]
local 队伍请求列表 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("队伍请求列表",0,0,774,484)
local 当前 = 多开数据.当前
function 队伍请求列表:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(774,484)
    if nsf:渲染开始() then
        置窗口背景("请求列表",0,12,766,473,true):显示(0,0)
        取灰色背景(0,0,753,350,true):显示(7,80)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 队伍请求列表:打开(数据)
    self:置可见(true)
    self:重置(数据)
end

function 队伍请求列表:重置(数据)
    self.选中 = nil
    self.队员网格:置数据(数据)
end

local 关闭 = 队伍请求列表:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",724,0)

function 关闭:左键弹起(x,y,msg)
    队伍请求列表:置可见(false)
end

local 队员网格 = 队伍请求列表:创建网格("队员网格",17,85,740,290)

function 队员网格:初始化()
    self:创建格子(143,290,0,5,1,5)
end

function 队员网格:左键弹起(x, y, a, b, msg)
    if 队伍请求列表.选中 then
        self.子控件[队伍请求列表.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        队伍请求列表.选中 = a
        self.子控件[a]._spr.确定 = true
    end
end

function 队员网格:置数据(数据)
    for i = 1,#队员网格.子控件 do
        local lssj = __队伍格子.创建(当前)
        lssj:置数据(数据[i],i,'请求列表')
        队员网格.子控件[i]:置精灵(lssj)
    end
end

for i, v in ipairs {

    {name = '同意按钮', font = '同意', x = 366 ,y = 435 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(116,37)},
    {name = '拒绝按钮', font = '拒绝', x = 496 ,y = 435 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(116,37)},
    {name = '清空按钮', font = '清空', x = 626 ,y = 435 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(116,37)},
} do
    local  临时函数 = 队伍请求列表:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '同意按钮' then
            if 队伍请求列表.选中 and 队员网格.子控件[队伍请求列表.选中]._spr.数据 then
                发送数据(当前 or self and self.当前,4004,{序列=队伍请求列表.选中})
            end
        elseif v.name == '拒绝按钮' then
            if 队伍请求列表.选中 and 队员网格.子控件[队伍请求列表.选中]._spr.数据 then
                发送数据(当前 or self and self.当前,4005,{序列=队伍请求列表.选中})
            end
        elseif v.name == '清空按钮' then
        end
    end
end