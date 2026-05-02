--[[
    @Author       : GGELUA
    @Date         : 2022-06-15 11:15:58
Last Modified by: GGELUA
Last Modified time: 2023-11-08 14:07:23
--]]
local 在线查询 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("在线查询",0,0,775,485)
local 当前 = 多开数据.当前
function 在线查询:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(775,485)
    if nsf:渲染开始() then
        置窗口背景("在线查询",0,12,767,473,true):显示(0,0)
        取白色背景(0,0,534,277,true):显示(212,148)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('搜索玩家'):显示(437,66)
        字体18:取图像('昵称'):显示(219,114)
        字体18:取图像('数字ID'):显示(457,114)
        local lssj = __res:getPNGCC(3,736,1155,199,37,true):拉伸(151,36)
        lssj:显示(264,105)
        lssj:显示(523,105)
    end
    self:置精灵(nsf:到精灵())
    self.允许移动 = true
end

function 在线查询:打开(data)
    self:置可见(true)
    self.昵称输入:清空()
    self.ID输入:清空()
end

local 关闭 = 在线查询:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",725,0)

function 关闭:左键弹起(x,y,msg)
    在线查询:置可见(false)
end

for i, v in ipairs {
    {name = '搜索玩家', x = 20 ,y = 66 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(160,55) , tcp2 = __res:getPNGCC(3,876,289,86,36,true):拉伸(160,55) , font = '搜索玩家'},
    {name = '搜索队伍', x = 20 ,y = 130 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(160,55) , tcp2 = __res:getPNGCC(3,876,289,86,36,true):拉伸(160,55) , font = '搜索队伍'},
} do
    local 临时函数 = 在线查询:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)

    end
end

for i, v in ipairs {
    {name = '搜', x = 687 ,y = 103 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(55,41) , font = '搜'},
    {name = '加为好友', x = 216 ,y = 429 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(122,41),  font = '加为好友'},
    {name = '临时好友', x = 351 ,y = 429 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(122,41),  font = '临时好友'},
    {name = '设为私聊', x = 487 ,y = 429 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(122,41),  font = '设为私聊'},
    {name = '黑名单', x = 623 ,y = 429 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(122,41),  font = '黑名单'},
    
} do
    local 临时函数 = 在线查询:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '搜' then
            发送数据(当前 or self and self.当前,6957,{名称=在线查询.昵称输入:取文本(),id=在线查询.ID输入:取数值()})
        elseif v.name == '加为好友' then
            发送数据(当前 or self and self.当前,6958,{名称=在线查询.昵称输入:取文本(),id=在线查询.ID输入:取数值(),类型=1})
        elseif v.name == '临时好友' then
            发送数据(当前 or self and self.当前,6958,{名称=在线查询.昵称输入:取文本(),id=在线查询.ID输入:取数值(),类型=2})
        elseif v.name == '黑名单' then
            发送数据(当前 or self and self.当前,6958,{名称=在线查询.昵称输入:取文本(),id=在线查询.ID输入:取数值(),类型=3})
        end
    end
end

local 昵称输入 = 在线查询:创建我的输入('昵称输入',273,112,133,18,nil,10,'黑色')
local ID输入 = 在线查询:创建我的输入('ID输入',530,112,133,18,2,10,'黑色')

local 文本 = 在线查询:创建我的文本("文本",229,162,500,245)

function 文本:重置(data)
    local lsb = {'昵称：','I D：','等级：','门派：'}
    self:清空()
    for i, v in ipairs(data) do
        self:置文本(lsb[i]..(v or '无门派'))
    end
end
