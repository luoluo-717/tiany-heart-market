--[[
    @Author       : GGELUA
    @Date         : 2022-04-18 23:20:29
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:35:51
--]]
local 消息综合 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("消息综合",10,273,940,265)
local 当前 = 多开数据.当前
function 消息综合:初始化()
    local nsf = require('SDL.图像')(940,265)
    if nsf:渲染开始() then
        取黑透明背景(0,0,940,265,true):显示(0,0)
        取灰色背景(0,0,704,247,true):显示(176,9)
        字体18:置颜色(255,255,255)
        字体18:取图像('表情'):显示(16,68)
        字体18:取图像('道具'):显示(71,68)
        字体18:取图像('宠物'):显示(129,68)
        字体18:取图像('颜色'):显示(16,166)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 消息综合:打开(窗口)
    self.窗口 = 窗口
    if self.是否可见 then
        self:置可见(false)
    else
        self:置可见(true)
    end
    self:切换界面(self.表情网格)
    self.点击类型 = nil
end

function 消息综合:切换界面(界面)
    self.表情网格:置可见(界面 == self.表情网格, not self.表情网格.是否实例)
    self.道具控件:置可见(界面 == self.道具控件, not self.道具控件.是否实例)
    self.宠物控件:置可见(界面 == self.宠物控件, not self.宠物控件.是否实例)
    self.颜色控件:置可见(界面 == self.颜色控件, not self.颜色控件.是否实例)
end

local 关闭 = 消息综合:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",900,0)

function 关闭:左键弹起(x,y,msg)
    消息综合:置可见(false)
end

local 表情网格 = 消息综合:创建网格("表情网格",207,20,704,215)

function 表情网格:初始化()
    self:创建格子(55,55,0,0,10,12,true)
    for i = 1,#self.子控件 do
        self.子控件[i]:置精灵(多开数据[当前].__主控.表情[i]:复制():置中心(0, -多开数据[当前].__主控.表情[i].高度))
    end
end


function 表情网格:左键弹起(x, y, a, b, msg)
    消息综合.窗口.消息输入:插入文本('#'..a)
end


local 道具控件 = 消息综合:创建控件("道具控件",176,9,704,247)

for i, v in ipairs {
    {name = '装备', x = 9 ,y = 6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(109,36),font = '装备'},
    {name = '道具', x = 124 ,y = 6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(109,36),font = '道具'},
    {name = '行囊', x = 237 ,y = 6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(109,36),font = '行囊'},
    {name = '法宝', x = 351 ,y = 6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(109,36),font = '法宝'},
} do
    local  临时函数 = 道具控件:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '装备' then
            消息综合.道具控件.道具网格:置物品(多开数据[当前 or self and self.当前].角色信息.装备,0)
            消息综合.道具控件.道具网格:置物品(多开数据[当前 or self and self.当前].角色信息.灵饰,6)
        elseif v.name == '道具' then
            消息综合.道具控件.道具网格:置物品(多开数据[当前].__主控.道具列表,0)
        elseif v.name == '行囊' then
            消息综合.道具控件.道具网格:置物品(多开数据[当前].__主控.行囊列表,0)
        elseif v.name == '法宝' then
            消息综合.道具控件.道具网格:置物品({},0)
        end
        消息综合.点击类型 = v.name
    end
end


local 道具网格 = 道具控件:创建网格("道具网格",20,47,838,184)

function 道具网格:初始化()
    self:创建格子(57,57,18,18,3,8)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and (消息综合.点击类型 == '道具' or 消息综合.点击类型 == '行囊') then
        if #消息综合.窗口.附加数据 == 0 then
            消息综合.窗口.消息输入:插入文本("["..self.子控件[a]._spr.物品.名称.."]")
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据+1] = {}
            消息综合.窗口.发送方式=2
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].类型 = "道具"
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].类型1 = 消息综合.点击类型
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].类型2= self.子控件[a]._spr.物品.名称
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].编号= a
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y道具只能发送一个')
        end
    end
end

function 道具网格:置物品(数据,bh)
    for i = 1+bh,#self.子控件 do
        local lssj = __物品格子.创建(当前)
        lssj:置物品(数据[i-bh],nil,"消息道具")
        self.子控件[i]:置精灵(lssj)
    end
end

local 宠物控件 = 消息综合:创建控件("宠物控件",176,9,704,247)

for i, v in ipairs {
    {name = '召唤兽', x = 9 ,y = 6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(109,36),font = '召唤兽'},
    {name = '子女', x = 124 ,y = 6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(109,36),font = '子女'},
    {name = '坐骑', x = 237 ,y = 6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(109,36),font = '坐骑'},
} do
    local  临时函数 = 宠物控件:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '召唤兽' then
            消息综合.宠物控件.头像网格:置头像(多开数据[当前 or self and self.当前].角色信息.宝宝列表)
        elseif v.name == '子女' then
            消息综合.宠物控件.头像网格:置头像({})
        elseif v.name == '坐骑' then
            消息综合.宠物控件.头像网格:置头像({})
        end
    end
end

local 头像网格 = 宠物控件:创建网格("头像网格",20,47,838,184)

function 头像网格:初始化()
    self:创建格子(198,57,10,0,5,3,true)
end


function 头像网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        if #消息综合.窗口.附加数据 == 0 then
            消息综合.窗口.消息输入:插入文本("[".. self.子控件[a]._spr.数据.名称.."]")
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据+1] = {}
            消息综合.窗口.发送方式=2
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].类型 = "召唤兽"
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].类型1 = "召唤兽"
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].类型2= self.子控件[a]._spr.数据.名称
            消息综合.窗口.附加数据[#消息综合.窗口.附加数据].编号= self.子控件[a]._spr.数据.认证码
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y召唤兽只能发送一个')
        end
    end
end

function 头像网格:置头像(数据)
    for i = 1,#头像网格.子控件 do
        local lssj = __头像格子2.创建(当前)
        lssj:置头像(数据[i])
        头像网格.子控件[i]:置精灵(lssj)
    end
end

local 颜色控件 = 消息综合:创建控件("颜色控件",176,9,704,247)

local 颜色网格 = 颜色控件:创建网格("颜色网格",20,47,838,184)
local ysb = {
    { 颜色 = '红色' , 字符 = '#R'},
    { 颜色 = '橙色' , 字符 = '#C'},
    { 颜色 = '黄色' , 字符 = '#Y'},
    { 颜色 = '绿色' , 字符 = '#G'},
    { 颜色 = '青色' , 字符 = '#P'},
    { 颜色 = '蓝色' , 字符 = '#B'},
    { 颜色 = '紫色' , 字符 = '#F'},
    { 颜色 = '白色' , 字符 = '#W'},
    { 颜色 = '灰色' , 字符 = '#H'}
}
function 颜色网格:初始化()
    self:创建格子(80,80,12,40,2,4,true)
    for i = 1,#self.子控件 do
        self.子控件[i]:置精灵(require("SDL.精灵")(0,0,0,80,80):置颜色(__取颜色(ysb[i].颜色)))
    end
end


function 颜色网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr then
        消息综合.窗口.消息输入:插入文本(ysb[a].字符)
    end
end

for i, v in ipairs {
    {name = '表情', x = 12 ,y = 12 , tcp = __res:getPNGCC(4,588,2,44,46)},
    {name = '道具', x = 66 ,y = 12 , tcp = __res:getPNGCC(4,679,2,44,46)},
    {name = '宠物', x = 125 ,y = 12 , tcp = __res:getPNGCC(4,722,2,45,45)},
    {name = '颜色', x = 12 ,y = 102 , tcp = __res:getPNGCC(4,766,2,44,45)},
} do
    local 临时函数 = 消息综合:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if  v.name == '表情' then
            消息综合:切换界面(消息综合.表情网格)
        elseif v.name == '道具' then
            消息综合:切换界面(消息综合.道具控件)
            消息综合.道具控件.装备:置选中(true)
            消息综合.道具控件.道具网格:置物品(多开数据[当前 or self and self.当前].角色信息.装备,0)
            消息综合.道具控件.道具网格:置物品(多开数据[当前 or self and self.当前].角色信息.灵饰,6)
        elseif v.name == '宠物' then
            消息综合:切换界面(消息综合.宠物控件)
            消息综合.宠物控件.头像网格:置头像(多开数据[当前 or self and self.当前].角色信息.宝宝列表)
        elseif v.name == '颜色' then
            消息综合:切换界面(消息综合.颜色控件)
        end
    end
end