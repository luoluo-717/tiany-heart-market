--[[
    @Author       : GGELUA
    @Date         : 2022-04-04 10:23:05
Last Modified by: GGELUA
Last Modified time: 2023-06-13 08:53:15
--]]
local 召唤兽洗炼 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("召唤兽洗炼", 0, 0, 730, 520)
local 当前 = 多开数据.当前
local lsb = { "攻击资质", "体力资质", "速度资质", "寿  命", "五  行", "防御资质", "法术资质", "闪躲资质", "成  长" }
local lsb2 = { "攻击资质", "体力资质", "速度资质", "寿命", "五行", "防御资质", "法力资质", "躲闪资质", "成长" }
function 召唤兽洗炼:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(723, 520)
    if nsf:渲染开始() then
        置窗口背景("无", 0, 12, 722, 507, true):显示(0, 0)
        __res:getPNGCC(3, 761, 370, 308, 163):显示(22, 75)
        取灰色背景(0, 0, 340, 237, true):显示(360, 265)
        local lssj = 取输入背景(0, 0, 93, 23)
        字体18:置颜色(255, 255, 255)
        local pyx = 0
        local pyy = 0
        for i = 1, #lsb do
            if i > 5 then
                pyx = 181
                pyy = -160
            end
            lssj:显示(432 + pyx, 60 + ((i - 1) * 32) + pyy)
            字体18:取图像(lsb[i]):显示(355 + pyx, 62 + ((i - 1) * 32) + pyy)
        end
        字体18:取图像("请放入材料"):显示(477, 298)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中召唤兽 = nil
    self.模型格子 = __UI模型格子.创建(当前)
    self.标题宽度 = 字体20:取宽度("洗炼")
    self.标题 = "洗炼"
end

function 召唤兽洗炼:更新(dt)
    self.模型格子:更新(dt)
end

function 召唤兽洗炼:显示(x, y)
    if self.图像 then
        self.图像:显示(x, y)
    end
    self.模型格子:显示(x, y)
    字体20:显示(x + (722 / 2) - (self.标题宽度 / 2), y + 15, self.标题)
end

function 召唤兽洗炼:打开(数据, lx)
    self:置可见(true)
    self.选中召唤兽 = nil
    self.图像 = nil
    self.模型格子:清空()
    self[lx .. "按钮"]:置选中(true)
    self.标题宽度 = 字体20:取宽度(lx)
    self.标题 = lx
    local lsb = { "洗炼", "炼化", "认证", "打书", "内丹", "其他" }
    for i = 1, #lsb do
        if lsb[i] == lx then
            self[lsb[i] .. "确定按钮"]:置可见(true)
        else
            self[lsb[i] .. "确定按钮"]:置可见(false)
        end
    end
    if lx == "洗炼" or lx == "炼化" or lx == "认证" then
        self.洗炼按钮:置可见(true)
        self.炼化按钮:置可见(true)
        self.认证按钮:置可见(true)
        self.打书按钮:置可见(false)
        self.内丹按钮:置可见(false)
        self.其他按钮:置可见(false)
    elseif lx == "打书" or lx == "内丹" or lx == "其他" then
        self.洗炼按钮:置可见(false)
        self.炼化按钮:置可见(false)
        self.认证按钮:置可见(false)
        self.打书按钮:置可见(true)
        self.内丹按钮:置可见(true)
        self.其他按钮:置可见(true)
    end
    self.材料网格:置物品(nil)
    self.道具 = 数据
    self.技能控件:置可见(false)
    self:我的按钮置文字(self.选择召唤兽按钮, __res:getPNGCC(3, 1040, 201, 149, 37, true):拉伸(173, 37), '选择召唤兽')
end

function 召唤兽洗炼:重置(数据)
    self.选中召唤兽 = 数据
    local nsf = require('SDL.图像')(730, 520)
    if nsf:渲染开始() then
        字体18:置颜色(39, 53, 81)
        local pyx = 0
        local pyy = 0
        for i = 1, #lsb2 do
            if i > 5 then
                pyx = 181
                pyy = -160
            end
            字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽][lsb2[i]]):显示(440 + pyx, 62 + ((i - 1) * 32) +
            pyy)
        end
    end
    self.图像 = nsf:到精灵()
    self.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽], "召唤兽", 180, 195)
    self:我的按钮置文字(self.选择召唤兽按钮, __res:getPNGCC(3, 1040, 201, 149, 37, true):拉伸(173, 37),
        多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].名称)
    self.技能控件:置可见(true)
    self.技能控件.技能按钮:置选中(true)
    self.技能控件.技能:重置()
end

local 关闭 = 召唤兽洗炼:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 680, 0)

function 关闭:左键弹起(x, y, msg)
    召唤兽洗炼:置可见(false)
end

local 选择召唤兽按钮 = 召唤兽洗炼:创建我的按钮(__res:getPNGCC(3, 1040, 201, 149, 37, true):拉伸(173, 37), "选择召唤兽按钮", 23, 38, "选择召唤兽")

function 选择召唤兽按钮:左键弹起(x, y, msg)
    多开数据[当前 or self and self.当前].__UI弹出.召唤兽选择:打开(151, 133, "洗炼")
end

local 技能控件 = 召唤兽洗炼:创建控件("技能控件", 20, 240, 310, 265)
local jcx = 0
local jcy = 0
local lsb3 = { "技能", "内丹", "进阶" }
for i = 1, #lsb3 do
    local 临时函数 = 技能控件:创建我的单选按钮(__res:getPNGCC(3, 880, 331, 86, 37, true), __res:getPNGCC(3, 876, 289, 85, 36, true),
        lsb3[i] .. "按钮", jcx + ((i - 1) * 105), jcy, lsb3[i])

    function 临时函数:左键按下(消息, x, y)
        技能控件[lsb3[i]]:重置()
    end

    local 临时函数2 = 技能控件:创建控件(lsb3[i], jcx, jcy + 45, 310, 220)
    function 临时函数2:初始化()
        if lsb3[i] == "技能" then
            local nsf = require('SDL.图像')(310, 220)
            if nsf:渲染开始() then
                取灰色背景(0, 0, 308, 220, true):显示(0, 0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i] .. "网格", 22, 12, 273, 202)
            function 临时函数3:初始化()
                self:创建格子(55, 55, 18, 18, 9, 4, true)
            end

            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x, y)
                end
            end

            function 临时函数3:置数据(数据, 认证)
                for i = 1, #临时函数3.子控件 do
                    local lssj = __召唤兽技能格子.创建(当前)
                    if 认证 and i == 认证 then
                        认证 = 数据[i]
                    end
                    lssj:置数据(数据[i], 55, 55, nil, 认证)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        elseif lsb3[i] == "内丹" then
            local nsf = require('SDL.图像')(310, 220)
            if nsf:渲染开始() then
                __res:getPNGCC(3, 653, 931, 315, 218):显示(0, 0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i] .. "网格", 0, 0, 315, 218)
            function 临时函数3:初始化()
                self:创建格子(55, 55, 8, 8, 1, 6)
            end

            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x, y)
                end
            end

            function 临时函数3:置数据(数据, zjcz, bb, nsgz)
                local 坐标 = { { 129, 7 }, { 195, 47 }, { 195, 120 }, { 129, 157 }, { 63, 120 }, { 63, 47 } }
                for i = 1, #临时函数3.子控件 do
                    local lssj = __内丹格子.创建(当前)
                    lssj:置数据(数据[i], zjcz, bb, nsgz, i, 55, 55)
                    临时函数3.子控件[i]:置精灵(lssj)
                    临时函数3.子控件[i]:置坐标(坐标[i][1], 坐标[i][2])
                end
            end
        elseif lsb3[i] == "进阶" then
            local nsf = require('SDL.图像')(310, 220)
            if nsf:渲染开始() then
                取灰色背景(0, 0, 308, 220, true):显示(0, 0)
                __res:取图像(__res:取地址('shape/ui/zhs/', 0x1094AD16)):拉伸(98 * 2, 105 * 2):显示(55, 7)
                __res:取图像(__res:取地址('shape/ui/zhs/', 0xF7EBF987)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i] .. "网格", 76, 52, 126, 102)
            function 临时函数3:初始化()
                self:创建格子(126, 102, 0, 0, 1, 1)
            end

            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x, y)
                end
            end

            function 临时函数3:置数据(数据, zjcz, bb, nsgz)
                for i = 1, #临时函数3.子控件 do
                    local lssj = __特性格子.创建()
                    lssj:置数据(数据, 126, 102)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        end
        self:置可见(false)
    end

    function 临时函数2:显示(x, y)
        if self.数据 then
            self.数据:显示(x, y)
        end
    end

    function 临时函数2:重置()
        if lsb3[i] == "技能" then
            技能控件.技能:置可见(true)
            技能控件.内丹:置可见(false)
            技能控件.进阶:置可见(false)
            self.数据 = nil
            if 召唤兽洗炼.选中召唤兽 then
                临时函数2.技能网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].技能,
                    多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].法术认证)
            else
                临时函数2.技能网格:置数据({})
            end
        elseif lsb3[i] == "内丹" then
            技能控件.技能:置可见(false)
            技能控件.内丹:置可见(true)
            技能控件.进阶:置可见(false)
            self.数据 = nil
            local zjcz = 0
            if 召唤兽洗炼.选中召唤兽 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].内丹 and 召唤兽洗炼.选中召唤兽 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].内丹.格子 then
                临时函数2.内丹网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].内丹.格子, zjcz,
                    多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽],
                    多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].内丹.内丹上限)
            else
                临时函数2.内丹网格:置数据({})
            end
        elseif lsb3[i] == "进阶" then
            技能控件.技能:置可见(false)
            技能控件.内丹:置可见(false)
            技能控件.进阶:置可见(true)
            self.数据 = nil
            if 召唤兽洗炼.选中召唤兽 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 then
                local nsf = require('SDL.图像')(310, 220)
                if nsf:渲染开始() then
                    if 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 0 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 10 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x4536A03D)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 10 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 20 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x714C3706)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 20 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 30 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0xD60014B8)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 30 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 40 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0xF7EBF987)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 40 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 50 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x11963488)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 50 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 60 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x9A4F1961)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 60 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 70 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x1E7ABB94)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 70 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 80 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0xA6C9A76A)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 80 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 90 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x2982E3F7)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 90 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 91 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x1D0717D7)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 91 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 93 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0xC44F0602)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 > 93 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 <= 97 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x9765D0B3)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    elseif 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性 >= 98 then
                        __res:取图像(__res:取地址('shape/ui/zhs/', 0x36A2C1A6)):拉伸(100 * 2, 106 * 2):显示(55, 7)
                    end
                    字体18:置颜色(255, 255, 255)
                    字体18:取图像("灵性：" .. 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽].灵性):显示(15, 7)
                    nsf:渲染结束()
                end
                self.数据 = nsf:到精灵()
                临时函数2.进阶网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽])
            else
                临时函数2.进阶网格:置数据({})
            end
        end
    end
end

local lsb4 = { "洗炼", "炼化", "认证" }
for i = 1, #lsb4 do
    local 临时函数 = 召唤兽洗炼:创建我的单选按钮(__res:getPNGCC(3, 1040, 201, 149, 37, true):拉伸(110, 37),
        __res:getPNGCC(3, 1039, 160, 148, 36, true):拉伸(110, 36), lsb4[i] .. "按钮", 360 + ((i - 1) * 120), 224, lsb4[i])

    function 临时函数:左键按下(消息, x, y)
        if lsb4[i] == "洗炼" then
            召唤兽洗炼.洗炼确定按钮:置可见(true)
            召唤兽洗炼.炼化确定按钮:置可见(false)
            召唤兽洗炼.认证确定按钮:置可见(false)
        elseif lsb4[i] == "炼化" then
            召唤兽洗炼.洗炼确定按钮:置可见(false)
            召唤兽洗炼.认证确定按钮:置可见(false)
            召唤兽洗炼.炼化确定按钮:置可见(true)
        elseif lsb4[i] == "认证" then
            召唤兽洗炼.洗炼确定按钮:置可见(false)
            召唤兽洗炼.认证确定按钮:置可见(true)
            召唤兽洗炼.炼化确定按钮:置可见(false)
        end
        召唤兽洗炼.标题宽度 = 字体20:取宽度(lsb4[i])
        召唤兽洗炼.标题 = lsb4[i]
    end

    local 临时函数2 = 召唤兽洗炼:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(123, 41), lsb4[i] .. "确定按钮", 477, 420, lsb4
    [i])

    function 临时函数2:左键弹起(x, y, msg)
        if lsb4[i] == "洗炼" then
            if 召唤兽洗炼.选中召唤兽 and 召唤兽洗炼.材料网格.子控件[1]._spr and 召唤兽洗炼.材料网格.子控件[1]._spr.物品 then
                发送数据(当前 or self and self.当前, 5008, { 序列 = 召唤兽洗炼.材料网格.子控件[1]._spr.原始编号, 序列1 = 召唤兽洗炼.选中召唤兽 })
            end
        elseif lsb4[i] == "炼化" then
            if 召唤兽洗炼.选中召唤兽 and 召唤兽洗炼.材料网格.子控件[1]._spr and 召唤兽洗炼.材料网格.子控件[1]._spr.物品 then
                发送数据(当前 or self and self.当前, 5010, { 序列 = 召唤兽洗炼.材料网格.子控件[1]._spr.原始编号, 序列1 = 召唤兽洗炼.选中召唤兽 })
                召唤兽洗炼.关闭:左键弹起()
            end
        elseif lsb4[i] == "认证" then
            if 召唤兽洗炼.选中召唤兽 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽洗炼.选中召唤兽] then
                多开数据[当前 or self and self.当前].__UI弹出.技能选择:打开(召唤兽洗炼.选中召唤兽, 235, 58)
            end
        end
    end
end

local lsb4 = { "打书", "内丹", "其他" }
for i = 1, #lsb4 do
    local 临时函数 = 召唤兽洗炼:创建我的单选按钮(__res:getPNGCC(3, 1040, 201, 149, 37, true):拉伸(110, 37),
        __res:getPNGCC(3, 1039, 160, 148, 36, true):拉伸(110, 36), lsb4[i] .. "按钮", 360 + ((i - 1) * 120), 224, lsb4[i])

    function 临时函数:左键按下(消息, x, y)
        if lsb4[i] == "打书" then
            召唤兽洗炼.打书确定按钮:置可见(true)
            召唤兽洗炼.内丹确定按钮:置可见(false)
            召唤兽洗炼.其他确定按钮:置可见(false)
        elseif lsb4[i] == "内丹" then
            召唤兽洗炼.打书确定按钮:置可见(false)
            召唤兽洗炼.其他确定按钮:置可见(false)
            召唤兽洗炼.内丹确定按钮:置可见(true)
        elseif lsb4[i] == "其他" then
            召唤兽洗炼.打书确定按钮:置可见(false)
            召唤兽洗炼.其他确定按钮:置可见(true)
            召唤兽洗炼.内丹确定按钮:置可见(false)
        end
        召唤兽洗炼.标题宽度 = 字体20:取宽度(lsb4[i])
        召唤兽洗炼.标题 = lsb4[i]
    end

    local 临时函数2 = 召唤兽洗炼:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(123, 41), lsb4[i] .. "确定按钮", 477, 420, lsb4
    [i])

    function 临时函数2:左键弹起(x, y, msg)
        if lsb4[i] == "打书" then
            if 召唤兽洗炼.选中召唤兽 and 召唤兽洗炼.材料网格.子控件[1]._spr and 召唤兽洗炼.材料网格.子控件[1]._spr.物品 then
                发送数据(当前 or self and self.当前, 5008, { 序列 = 召唤兽洗炼.材料网格.子控件[1]._spr.原始编号, 序列1 = 召唤兽洗炼.选中召唤兽 })
            end
        elseif lsb4[i] == "内丹" then
            if 召唤兽洗炼.选中召唤兽 and 召唤兽洗炼.材料网格.子控件[1]._spr and 召唤兽洗炼.材料网格.子控件[1]._spr.物品 then
                发送数据(当前 or self and self.当前, 5011, { 序列 = 召唤兽洗炼.材料网格.子控件[1]._spr.原始编号, 序列1 = 召唤兽洗炼.选中召唤兽 })
            end
        elseif lsb4[i] == "其他" then

        end
    end
end

local 材料网格 = 召唤兽洗炼:创建网格("材料网格", 521, 338, 55, 55)

function 材料网格:初始化()
    self:创建格子(55, 55, 0, 0, 1, 1)
end

function 材料网格:左键弹起(x, y, a, b, msg)
    if 召唤兽洗炼.标题 ~= "认证" then
        多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(召唤兽洗炼.道具, 235, 58, 召唤兽洗炼.标题)
    end
end

function 材料网格:置物品(数据, bh)
    local lssj = __材料格子.创建(当前)
    lssj:置物品(数据)
    self.物品bh = bh
    材料网格.子控件[1]:置精灵(lssj)
    材料网格.子控件[1]._spr.原始编号 = bh
end

function 材料网格:刷新物品()
    if 召唤兽洗炼.道具[self.物品bh] == nil then
        self:置物品(nil)
    else
        self:置物品(召唤兽洗炼.道具[self.物品bh], self.物品bh)
    end
end
