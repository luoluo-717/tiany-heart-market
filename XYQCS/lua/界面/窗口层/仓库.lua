--[[
    @Author       : GGELUA
    @Date         : 2022-04-22 19:06:23
Last Modified by: GGELUA
Last Modified time: 2023-08-05 20:21:05
--]]
local 仓库 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("仓库", 0, 0, 777, 488)
local 当前 = 多开数据.当前
function 仓库:初始化()
    self:置精灵(置窗口背景("仓库", 0, 12, 723, 476))
end

function 仓库:打开(data, total)
    __置窗口坐标(self)
    self:置可见(true)
    self.格子类型.道具:置选中(true)
    self.扩展格子["包裹1"]:置选中(true)
    self.总页 = total
    self.包裹类型 = "道具"
    self.页 = 1
    for i = 1, 4 do
        仓库.扩展格子["包裹" .. i]:置可见(true)
    end
    self.物品控件:重置(total)
    self.物品控件.仓库网格:置物品(data, 1)
    self.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
    self.物品:置选中(true)
end

local 关闭 = 仓库:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 690, 0)

function 关闭:左键弹起(x, y, msg)
    仓库:置可见(false)
end

for i, v in ipairs {
    { name = '物品', x = 720, y = 71, tcp = __res:getPNGCC(1, 686, 0, 48, 98, true), tcp2 = __res:getPNGCC(1, 737, 0, 54, 99, true), font = '物\n品' },
} do
    local 临时函数 = 仓库:创建我的单选按钮(v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '物品' then
            仓库.物品控件:重置()
            仓库.物品控件.仓库网格:置物品(仓库.数据, 仓库.页数)
            仓库.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
        end
    end
end

local 物品控件 = 仓库:创建控件("物品控件", 0, 0, 777, 488)

function 物品控件:重置()
    仓库.仓库选中 = nil
    self:置可见(true)
    local nsf = require('SDL.图像')(777, 488)
    if nsf:渲染开始() then
        __res:getPNGCC(3, 694, 4, 338, 273):显示(12, 132)
        __res:getPNGCC(3, 694, 4, 338, 273):显示(372, 132)
        字体18:置颜色(__取颜色("白色"))
        字体18:取图像("双击道具可快速移动"):置混合(0):显示(505, 460)
        __res:getPNGCC(2, 795, 885, 373, 115):拉伸(80, 35):显示(69, 429)
        nsf:渲染结束()
    end
    仓库.图像 = nsf:到精灵()
end

function 物品控件:刷新()
    local nsf = require('SDL.图像')(80, 30)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像(仓库.页数 .. "/" .. 仓库.总页):置混合(0):显示(6, 2)
        nsf:渲染结束()
    end
    仓库.图像2 = nsf:到精灵()
    仓库.图像2:置中心(-82, -436)
end

local 仓库网格 = 物品控件:创建网格("仓库网格", 12, 132, 339, 272)

function 仓库网格:初始化()
    self:创建格子(67, 67, 0, 0, 4, 5)
end

function 仓库网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        if 仓库.仓库选中 then
            if 仓库.仓库选中 == a then
                发送数据(当前 or self and self.当前, 6703, { 页数 = 仓库.页数, 物品 = 仓库.仓库选中, 类型 = 仓库.包裹类型 })
                仓库.仓库选中 = nil
            else
                self.子控件[仓库.仓库选中]._spr.确定 = nil
                self.子控件[a]._spr:详情打开(470, 86, w, h, "选择", a)
                仓库.仓库选中 = a
                self.子控件[a]._spr.确定 = true
            end
        else
            self.子控件[a]._spr:详情打开(470, 86, w, h, "选择", a)
            仓库.仓库选中 = a
            self.子控件[a]._spr.确定 = true
        end
    end
end

function 仓库网格:置物品(数据, 页数)
    仓库.数据 = 数据
    仓库.页数 = 页数 or 仓库.页数
    仓库.物品控件:刷新()
    仓库.仓库选中 = nil
    for i = 1, #self.子控件 do
        if 数据[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(数据[i], nil, "道具仓库")
            lssj:置偏移(10, 10)
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 道具网格 = 物品控件:创建网格("道具网格", 373, 132, 339, 272)

function 道具网格:初始化()
    self:创建格子(67, 67, 0, 0, 4, 5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        if 仓库.道具选中 then
            if self.子控件[a]._spr.确定 then
                发送数据(当前 or self and self.当前, 6702, { 页数 = 仓库.页数, 物品 = 仓库.道具选中, 类型 = 仓库.包裹类型 })
                仓库.道具选中 = nil
                self.子控件[a]._spr.确定 = nil
            else
                self.子控件[仓库.之前]._spr.确定 = nil
                self.子控件[a]._spr:详情打开(120, 86, w, h, "选择", self.子控件[a].真实编号 or a)
                仓库.道具选中 = self.子控件[a].真实编号
                仓库.之前 = a
                self.子控件[a]._spr.确定 = true
            end
        else
            self.子控件[a]._spr:详情打开(120, 86, w, h, "选择", self.子控件[a].真实编号 or a)
            仓库.道具选中 = self.子控件[a].真实编号
            仓库.之前 = a
            self.子控件[a]._spr.确定 = true
        end
    end
end

function 道具网格:置物品(数据)
    仓库.道具选中 = nil
    仓库.之前 = nil
    for i = 1, #self.子控件 do
        if 仓库.包裹类型 == "道具" then
            if 数据[i + 仓库.页 * 20 - 20] then
                local lssj = __物品格子.创建(当前)
                lssj:置物品(数据[i + 仓库.页 * 20 - 20], nil, "道具仓库")
                lssj:置偏移(10, 10)
                self.子控件[i].真实编号 = i + 仓库.页 * 20 - 20
                self.子控件[i]:置精灵(lssj)
            else
                self.子控件[i].真实编号 = nil
                self.子控件[i]:置精灵()
            end
        else
            if 数据[i] then
                local lssj = __物品格子.创建(当前)
                lssj:置物品(数据[i], nil, "道具仓库")
                lssj:置偏移(10, 10)
                self.子控件[i].真实编号 = i
                self.子控件[i]:置精灵(lssj)
            else
                self.子控件[i].真实编号 = nil
                self.子控件[i]:置精灵()
            end
        end
    end
end

for i, v in ipairs {
    { name = '增加', x = 230, y = 424, tcp = __res:getPNGCC(3, 244, 563, 78, 34, true):拉伸(46, 46), font = '+' },
    { name = '左翻', x = 16, y = 424, tcp = __res:getPNGCC(3, 335, 561, 96, 35):拉伸(46, 46) },
    { name = '右翻', x = 155, y = 424, tcp = __res:getPNGCC(3, 436, 561, 96, 34):拉伸(46, 46) },
    { name = '整理', x = 280, y = 424, tcp = __res:getPNGCC(3, 244, 563, 78, 34, true):拉伸(56, 46), font = '整理' },
    { name = '选择仓库', x =70, y = 62, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true), font = "选择仓库" },
} do
    local 临时函数 = 物品控件:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '左翻' and 仓库.页数 > 1 then
            发送数据(当前 or self and self.当前, 6705, { 序列 = 仓库.页数 - 1 })
        elseif v.name == '右翻' and 仓库.页数 < 仓库.总页 then
            发送数据(当前 or self and self.当前, 6705, { 序列 = 仓库.页数 + 1 })
        elseif v.name == "增加" then
            发送数据(当前 or self and self.当前, 6704)
        elseif v.name == "整理" then
            发送数据(当前 or self and self.当前, 6707, { 总页数 = 仓库.总页 , 类型 = "道具"})
        elseif v.name == '选择仓库' then
            if 多开数据[当前].__UI弹出.仓库选择.是否可见 then
                多开数据[当前].__UI弹出.仓库选择:置可见(false)
            else
                多开数据[当前].__UI弹出.仓库选择:打开(仓库.总页)
            end
        end
    end
end

local 格子类型 = 仓库:创建控件("格子类型", 0, 62, 650, 45)
for i, v in ipairs {
    { name = '道具', x = 375, y = 0, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true), font = "道 具" },
    { name = '行囊', x = 501, y = 0, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true), font = "行 囊" },
    { name = '召唤兽仓库', x = 188, y = 0, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true), font = "召唤兽仓库" },
} do
    local 临时函数 = 格子类型:创建我的单选按钮(v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '道具' then
            发送数据(当前 or self and self.当前, 3780, { 道具类型 = "道具" })
            仓库.包裹类型 = "道具"
            for i = 1, 4 do
                仓库.扩展格子["包裹" .. i]:置可见(true)
            end
        elseif v.name == '行囊' then
            发送数据(当前 or self and self.当前, 3780, { 道具类型 = "行囊" })
            仓库.包裹类型 = "行囊"
            for i = 1, 4 do
                仓库.扩展格子["包裹" .. i]:置可见(false)
            end
        elseif v.name == '召唤兽仓库' then
            发送数据(当前 or self and self.当前, 6801)
            仓库.关闭:左键弹起()
        end
    end
end

local 扩展格子 = 仓库:创建控件("扩展格子", 370, 400, 260, 50)

for i, v in ipairs {
    { name = '包裹1', x = 5, y = 10, tcp = __res:getPNGCC(1, 449, 28, 174, 35, true):置拉伸(50, 35), tcp1 = __res:getPNGCC(1, 964, 459, 173, 35, true):置拉伸(50, 35), font = "1" },
    { name = '包裹2', x = 65, y = 10, tcp = __res:getPNGCC(1, 449, 28, 174, 35, true):置拉伸(50, 35), tcp1 = __res:getPNGCC(1, 964, 459, 173, 35, true):置拉伸(50, 35), font = "2" },
    { name = '包裹3', x = 125, y = 10, tcp = __res:getPNGCC(1, 449, 28, 174, 35, true):置拉伸(50, 35), tcp1 = __res:getPNGCC(1, 964, 459, 173, 35, true):置拉伸(50, 35), font = "3" },
    { name = '包裹4', x = 185, y = 10, tcp = __res:getPNGCC(1, 449, 28, 174, 35, true):置拉伸(50, 35), tcp1 = __res:getPNGCC(1, 964, 459, 173, 35, true):置拉伸(50, 35), font = "4" },
} do
    local 临时函数 = 扩展格子:创建我的单选按钮(v.tcp, v.tcp1, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '包裹1' then
            仓库.页 = 1
            仓库.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹2' then
            仓库.页 = 2
            仓库.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹3' then
            仓库.页 = 3
            仓库.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹4' then
            仓库.页 = 4
            仓库.物品控件.道具网格:置物品(多开数据[当前].__主控.道具列表)
        end
    end
end
