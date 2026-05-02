--[[
    @Author       : GGELUA
    @Date         : 2022-04-24 16:16:31
Last Modified by: GGELUA
Last Modified time: 2023-07-08 11:43:40
--]]
local 召唤兽查看 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("召唤兽查看",0,0,744,520)
local 当前 = 多开数据.当前
function 召唤兽查看:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(744,520)
    if nsf:渲染开始() then
        xiao置窗口背景("召唤兽查看", 0, 12, 737, 506, true):显示( 0, 0)
        __res:getPNGCC(3,761,370,308,163):拉伸(217,162):显示(20,92) --模型背景
        __res:getPNGCC(3,132,506,55,55):显示(250,94) -- 装备
        __res:getPNGCC(3,132,506,55,55):显示(250,163) -- 装备
        __res:getPNGCC(3,132,506,55,55):显示(250,229) -- 装备
        取输入背景(0,0,183,23):显示(23,263) -- 名称
        取输入背景(0,0,105,23):显示(99,292) -- 参战等级
        取输入背景(0,0,55,23):显示(253,292) -- 等级
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('参战等级'):显示(20,296)
        字体18:取图像('等级'):显示(212,296)
        local lssj = 取输入背景(0,0,93,23)
        for _, v in ipairs{
            {name = '气血' , x = 22 , y = 327 , pyx = 40},{name = '体质' , x = 175 , y = 327 , pyx = 40},
            {name = '魔法' , x = 22 , y = 327 + 30 * 1 , pyx = 40},{name = '法力' , x = 175 , y = 327 + 30 * 1 , pyx = 40},
            {name = '攻击' , x = 22 , y = 327 + 30 * 2 , pyx = 40},{name = '力量' , x = 175 , y = 327 + 30 * 2 , pyx = 40},
            {name = '防御' , x = 22 , y = 327 + 30 * 3 , pyx = 40},{name = '耐力' , x = 175 , y = 327 + 30 * 3 , pyx = 40},
            {name = '速度' , x = 22 , y = 327 + 30 * 4 , pyx = 40},{name = '敏捷' , x = 175 , y = 327 + 30 * 4 , pyx = 40},
            {name = '灵力' , x = 22 , y = 327 + 30 * 5 , pyx = 40},{name = '潜能' , x = 175 , y = 327 + 30 * 5 , pyx = 40},
            {name = '攻击资质' , x = 330 , y = 69 + 30 * 1 , pyx = 80},{name = '防御资质' , x = 526 , y = 69 + 30 * 1 , pyx = 80},
            {name = '体力资质' , x = 330 , y = 69 + 30 * 2 , pyx = 80},{name = '法力资质' , x = 526 , y = 69 + 30 * 2 , pyx = 80},
            {name = '速度资质' , x = 330 , y = 69 + 30 * 3 , pyx = 80},{name = '躲闪资质' , x = 526 , y = 69 + 30 * 3 , pyx = 80},
            {name = '寿  命' , x = 330 , y = 69 + 30 * 4 , pyx = 80},{name = '成  长' , x =  526, y = 69 + 30 * 4 , pyx = 80},
            {name = '五  行' , x = 330 , y = 69 + 30 * 5 , pyx = 80},
        } do
            字体18:取图像(v.name):显示(v.x,v.y)
            lssj:显示(v.x+v.pyx,v.y-2)
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.模型格子 = __UI模型格子.创建(当前)
end

function 召唤兽查看:打开(data)
    self:置可见(true)
    self:重置(data)
    self:检查五行按钮可见性()
end

function 召唤兽查看:重置(data)
    self.数据 = data
    self.模型格子:清空()
    local nsf = require('SDL.图像')(744,520)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黑色'))
        for _, v in ipairs{
            {name = '气血' , x = 22 , y = 327 , pyx = 50},{name = '体质' , x = 175 , y = 327 , pyx = 50},
            {name = '魔法' , x = 22 , y = 327 + 30 * 1 , pyx = 50},{name = '魔力' , x = 175 , y = 327 + 30 * 1 , pyx = 50},
            {name = '伤害' , x = 22 , y = 327 + 30 * 2 , pyx = 50},{name = '力量' , x = 175 , y = 327 + 30 * 2 , pyx = 50},
            {name = '防御' , x = 22 , y = 327 + 30 * 3 , pyx = 50},{name = '耐力' , x = 175 , y = 327 + 30 * 3 , pyx = 50},
            {name = '速度' , x = 22 , y = 327 + 30 * 4 , pyx = 50},{name = '敏捷' , x = 175 , y = 327 + 30 * 4 , pyx = 50},
            {name = '灵力' , x = 22 , y = 327 + 30 * 5 , pyx = 50},{name = '潜力' , x = 175 , y = 327 + 30 * 5 , pyx = 50},
            {name = '攻击资质' , x = 330 , y = 69 + 30 * 1 , pyx = 90},{name = '防御资质' , x = 526 , y = 69 + 30 * 1 , pyx = 90},
            {name = '体力资质' , x = 330 , y = 69 + 30 * 2 , pyx = 90},{name = '法力资质' , x = 526 , y = 69 + 30 * 2 , pyx = 90},
            {name = '速度资质' , x = 330 , y = 69 + 30 * 3 , pyx = 90},{name = '躲闪资质' , x = 526 , y = 69 + 30 * 3 , pyx = 90},
            {name = '寿命' , x = 330 , y = 69 + 30 * 4 , pyx = 90},{name = '成长' , x =  526, y = 69 + 30 * 4 , pyx = 90},
            {name = '五行' , x = 330 , y = 69 + 30 * 5 , pyx = 90},
        } do
            字体18:取图像(data[v.name] or 0):显示(v.x+v.pyx,v.y)
        end

        if data.饰品资质 ~= 0 and data.饰品 ~= nil then
            字体18:置颜色(__取颜色("紫色"))
            local 攻击 = data.饰品资质.攻击资质 or 0
            local 防御 = data.饰品资质.防御资质 or 0
            local 体力 = data.饰品资质.体力资质 or 0
            local 法力 = data.饰品资质.法力资质 or 0
            local 速度 = data.饰品资质.速度资质 or 0
            local 躲闪 = data.饰品资质.躲闪资质 or 0
            字体18:取图像("+"..攻击):显示(92+370, 99 + (1 - 1) * 30)  -- 攻击资质附加
            字体18:取图像("+"..体力):显示(92+370, 99 + (2 - 1) * 30)  -- 体力资质附加
            字体18:取图像("+"..速度):显示(92+370, 99 + (3 - 1) * 30)  -- 速度资质附加
            字体18:取图像("+"..防御):显示(92+565, 99 + (1 - 1) * 30)  -- 防御资质附加
            字体18:取图像("+"..法力):显示(92+565, 99 + (2 - 1) * 30)  -- 法力资质附加
            字体18:取图像("+"..躲闪):显示(92+565, 99 + (3 - 1) * 30)  -- 躲闪资质附加
        end

        字体18:置颜色(__取颜色('白色'))
        字体18:取图像(data.模型):显示(22,66)
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像(data.名称):显示(30,265)
        字体18:取图像(data.参战等级 or 0):显示(110,297)
        字体18:取图像(data.等级 or 0):显示(262,297)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.模型格子:置数据(data,"召唤兽",126,203)
    self.装备网格:置物品(data.装备)
    self.技能控件["技能"]:重置()
end

local 关闭 = 召唤兽查看:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",694,0)

function 关闭:左键弹起(x,y,msg)
    召唤兽查看:置可见(false)
end



------------------------------------------------------------C改
local 词条属性列表 = {"词条气血", "词条伤害", "词条灵力", "词条防御", "词条速度"}
local 词条五行映射 = {
    ["词条气血"] = "木",
    ["词条伤害"] = "金",
    ["词条灵力"] = "火",
    ["词条防御"] = "土",
    ["词条速度"] = "水"
}
local 五行属性 = 召唤兽查看:创建我的was按钮(__res:取地址('shape/ui/', 0x6b4f596f),"五行属性",203, 218)
function 五行属性:左键弹起(x, y, msg)
    local 当前召唤兽数据 = 召唤兽查看.数据
    if not 当前召唤兽数据 then
        多开数据[当前].__UI弹出.提示框:打开("#Y/未获取到召唤兽数据")
        return
    end
    local 有效词条 = {}
    for _, 词条名 in ipairs(词条属性列表) do
        local 词条数值 = 当前召唤兽数据[词条名]
        if 词条数值 ~= nil and 词条数值 ~= 0 then
            table.insert(有效词条, {
                五行 = 词条五行映射[词条名] or "未知",  -- 匹配五行
                数值 = 词条数值                         -- 记录词条具体数值
            })
        end
    end
    local 提示内容 = ""
    if #有效词条 == 0 then
        提示内容 = "#Y/该召唤兽无五行属性词条"  -- 无有效词条时的提示
    else
        for i, 词条 in ipairs(有效词条) do
            local 符号 = 词条.数值 > 0 and "+" or ""  -- 正数加“+”号，负数不加
            提示内容 = 提示内容 .. "#Y/五行属性：#G" .. 词条.五行 .. 符号 .. 词条.数值 .. "%"
            if i ~= #有效词条 then  -- 非最后一条时换行
                提示内容 = 提示内容 .. "\n"
            end
        end
    end
    多开数据[当前].__UI弹出.提示框:打开(提示内容)
end
function 召唤兽查看:检查五行按钮可见性()
    local 当前召唤兽数据 = self.数据
    if not 当前召唤兽数据 then
        self.五行属性:置可见(false)
        return
    end
    local 有有效词条 = false
    for _, 词条名 in ipairs(词条属性列表) do
        local 词条数值 = 当前召唤兽数据[词条名]
        if 词条数值 ~= nil and 词条数值 ~= 0 then
            有有效词条 = true
            break  -- 找到一个有效词条即可，无需继续遍历
        end
    end
    self.五行属性:置可见(有有效词条)
end
------------------------------------------------------------C改
local 装备网格 = 召唤兽查看:创建网格("装备网格",250,94,55,190)

function 装备网格:初始化()
    
end

function 装备网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(520,86,w,h,nil,a)
    end
end

function 装备网格:置物品(data)
    if data == nil then return end
    self:创建格子(55,55,15,0,#data,1)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],"白格子","装备")
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 技能控件 = 召唤兽查看:创建控件("技能控件",330,212,360,265)
local jcx = 0
local jcy = 0
local lsb3 = {"技能","内丹","进阶"}
local lsb4 = {"技\n能","内\n丹","进\n阶"}
for i=1,#lsb3 do
    local 临时函数 = 技能控件:创建我的单选按钮(__res:getPNGCC(1,686,0,48,98,true):拉伸(48,68),__res:getPNGCC(1, 1132, 0, 54, 99, true):拉伸(48,68),lsb3[i].."按钮",306,50+((i-1)*70),lsb4[i])
    function 临时函数:左键按下(消息,x,y)
        技能控件[lsb3[i]]:重置()
    end
    local 临时函数2 = 技能控件:创建控件(lsb3[i],jcx,jcy+45,310,220)
    function 临时函数2:初始化()
        if lsb3[i] == "技能" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                取灰色背景(0,0,308,220,true):显示(0,0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",22,12,273,202)
            function 临时函数3:初始化()
                self:创建格子(55,55,18,18,9,4,true)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,认证)
                for i = 1,#临时函数3.子控件 do
                    local lssj = __召唤兽技能格子.创建(当前)
                    if 认证 and i == 认证 then
                        认证 = 数据[i]
                    end
                    lssj:置数据(数据[i],55,55,nil,认证)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        elseif lsb3[i] == "内丹" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                __res:getPNGCC(3,653,931,315,218):显示(0,0)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",0,0,315,218)
            function 临时函数3:初始化()
                self:创建格子(55,55,8,8,1,6)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,zjcz,bb,nsgz)
                local 坐标 = {{129,7},{195,47},{195,120},{129,157},{63,120},{63,47}}
                for i = 1,#临时函数3.子控件 do
                    local lssj = __内丹格子.创建(当前)
                    lssj:置数据(数据[i],zjcz,bb,nsgz,i,55,55)
                    临时函数3.子控件[i]:置精灵(lssj)
                    临时函数3.子控件[i]:置坐标(坐标[i][1],坐标[i][2])
                end
            end
        elseif lsb3[i] == "进阶" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                取灰色背景(0,0,308,220,true):显示(0,0)
                __res:取图像(__res:取地址('shape/ui/zhs/',0x1094AD16)):拉伸(98*2,105*2):显示(55,7)
                __res:取图像(__res:取地址('shape/ui/zhs/',0xF7EBF987)):拉伸(100*2,106*2):显示(55,7)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb3[i].."网格",76,52,126,102)
            function 临时函数3:初始化()
                self:创建格子(126,102,0,0,1,1)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                end
            end
            function 临时函数3:置数据(数据,zjcz,bb,nsgz)
                for i = 1,#临时函数3.子控件 do
                    local lssj = __特性格子.创建(当前)
                    lssj:置数据(数据,126,102)
                    临时函数3.子控件[i]:置精灵(lssj)
                end
            end
        end
        self:置可见(false)
    end
    function 临时函数2:显示(x,y)
        if self.数据 then
            self.数据:显示(x,y)
        end
    end

    function 临时函数2:重置()
        if lsb3[i] == "技能" then
            技能控件.技能:置可见(true)
            技能控件.内丹:置可见(false)
            技能控件.进阶:置可见(false)
            self.数据 = nil
            临时函数2.技能网格:置数据(召唤兽查看.数据.技能,召唤兽查看.数据.法术认证)
        elseif lsb3[i] == "内丹" then
            技能控件.技能:置可见(false)
            技能控件.内丹:置可见(true)
            技能控件.进阶:置可见(false)
            self.数据 = nil
            local zjcz = 0
            if 召唤兽查看.数据.内丹数据 then
                -- for n = 1,#多开数据[当前 or self and self.当前].角色信息.坐骑列表 do
                --     if 多开数据[当前 or self and self.当前].角色信息.坐骑列表[n].统御召唤兽[1] == 召唤兽查看.数据.认证码 or 多开数据[当前 or self and self.当前].角色信息.坐骑列表[n].统御召唤兽[2] == 召唤兽查看.数据.认证码 then
                --         zjcz = 多开数据[当前 or self and self.当前].角色信息.坐骑列表[n].成长-1
                --     end
                -- end
                临时函数2.内丹网格:置数据(召唤兽查看.数据.内丹数据,zjcz,召唤兽查看.数据,#召唤兽查看.数据.内丹数据)
            else
                临时函数2.内丹网格:置数据({})
            end
        elseif lsb3[i] == "进阶" then
            技能控件.技能:置可见(false)
            技能控件.内丹:置可见(false)
            技能控件.进阶:置可见(true)
            self.数据 = nil
            if  召唤兽查看.数据.灵性 then
                local nsf = require('SDL.图像')(310,220)
                if nsf:渲染开始() then
                    if 召唤兽查看.数据.灵性>0 and 召唤兽查看.数据.灵性<= 10 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x4536A03D)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>10 and 召唤兽查看.数据.灵性<= 20 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x714C3706)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>20 and 召唤兽查看.数据.灵性<= 30 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xD60014B8)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>30 and 召唤兽查看.数据.灵性<= 40 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xF7EBF987)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>40 and 召唤兽查看.数据.灵性<= 50 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x11963488)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>50 and 召唤兽查看.数据.灵性<= 60 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x9A4F1961)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>60 and 召唤兽查看.数据.灵性<= 70 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x1E7ABB94)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>70 and 召唤兽查看.数据.灵性<= 80 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xA6C9A76A)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>80 and 召唤兽查看.数据.灵性<= 90 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x2982E3F7)):拉伸(100*2,106*2):显示(155,7)
                    elseif 召唤兽查看.数据.灵性>90 and 召唤兽查看.数据.灵性<= 91 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x1D0717D7)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>91 and 召唤兽查看.数据.灵性<= 93 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0xC44F0602)):拉伸(100*2,106*2):显示(55,7)
                    elseif 召唤兽查看.数据.灵性>93 and 召唤兽查看.数据.灵性<= 97 then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x9765D0B3)):拉伸(100*2,106*2):显示(155,7)
                    elseif 召唤兽查看.数据.灵性>=98  then
                        __res:取图像(__res:取地址('shape/ui/zhs/',0x36A2C1A6)):拉伸(100*2,106*2):显示(55,7)
                    end
                    字体18:置颜色(255,255,255)
                    字体18:取图像("灵性："..召唤兽查看.数据.灵性):显示(15,7)
                    nsf:渲染结束()
                end
                self.数据 = nsf:到精灵()
                临时函数2.进阶网格:置数据(召唤兽查看.数据)
            else
                临时函数2.进阶网格:置数据({})
            end
        end
    end
end
