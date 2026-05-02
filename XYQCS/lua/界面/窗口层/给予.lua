--[[
    @Author       : GGELUA
    @Date         : 2022-04-08 10:57:22
Last Modified by: GGELUA
Last Modified time: 2023-08-06 18:54:56
--]]
local 给予 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("给予",0,0,654,408)
local 当前 = 多开数据.当前
local lsb = {"现有现金","给予银两"}
function 给予:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(654,408)
    if nsf:渲染开始() then
        置窗口背景("向玩家给予专用界面",0,12,642,395,true):显示(0,0)
        取灰色背景(0,0,340,280,true):显示(278,106)
        字体18:置颜色(255,255,255)
        local lssj = 取输入背景(0,0,120,23)
        for i=1,#lsb do
            lssj:显示(109,262+((i-1)*37))
            字体18:取图像(lsb[i]):显示(10,262+((i-1)*37))
        end
        lssj = 取输入背景(0,0,55,23)
        for i=1,3 do
            lssj:显示(33+((i-1)*80),215)
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 给予:打开(数据,mc,lx,dj)
    self:置可见(true)
    self.扩展格子["包裹1"]:置选中(true)
    self.页 = 1
    for i = 1, 4 do
        给予.扩展格子["包裹" .. i]:置可见(true)
    end
    self:重置(数据,mc,lx,dj)
end

function 给予:重置(数据,mc,lx,dj)
    local nsf = require('SDL.图像')(654,408)
    if nsf:渲染开始() then
        字体18:置颜色(255,255,255)
        字体18:取图像("名称:"..mc):显示(12,55)
        字体18:取图像("等级:"..dj):显示(12,85)
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像(多开数据[当前 or self and self.当前].角色信息.银子):显示(120,267)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.道具网格:置物品(多开数据[当前].__主控.道具列表)
    self.给予网格:置物品({})
    -- self.道具按钮:置选中(true)
    self.道具数量1:置数值(1)
    self.道具数量2:置数值(1)
    self.道具数量3:置数值(1)
    self.银两输入:置数值(0)
    self.选中类型 = "道具"
end



local 道具网格 = 给予:创建网格("道具网格",283,118,326,260)

function 道具网格:初始化()
    self:创建格子(55,55,14,13,16,5,true)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        for i=1,#给予.给予网格.子控件 do
            if not 给予.给予网格.子控件[i]._spr.物品 then
                -- self.子控件[a]._spr:详情打开(170,86,w,h,"选择",self.子控件[a].真实编号 or a)
                local 全局编号 = self.子控件[a].真实编号 or (a + 给予.页 * 20 - 20)
                self.子控件[a]._spr:详情打开(170,86,w,h,"选择",全局编号)----C改
                给予.给予网格:置物品(self.子控件[a]._spr.物品,i)
                给予.给予网格.子控件[i]._spr.物品.原始编号 = self.子控件[a].真实编号 or a
                self:置物品(nil,a)
                break
            end
        end
    end
end

function 道具网格:置物品(数据,bh)
    if not bh then
        for i = 1,#道具网格.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i+ 给予.页 * 20 - 20],"给予")
            self.子控件[i].真实编号 = i + 给予.页 * 20 - 20
            道具网格.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"给予")
        -- 新增：计算当前页下该格子的全局真实编号（核心修复）
        self.子控件[bh].真实编号 = bh + 给予.页 * 20 - 20
        道具网格.子控件[bh]:置精灵(lssj)
    end
end

local 给予网格 = 给予:创建网格("给予网格",34,150,214,55)

function 给予网格:初始化()
    self:创建格子(55,55,0,25,1,3)
end
function 给予网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        local 物品 = self.子控件[a]._spr.物品
        local 原始编号 = 物品.原始编号
        if 原始编号 and 原始编号 > 0 then
            local 原始页 = math.ceil(原始编号 / 20)
            原始页 = math.max(1, math.min(4, 原始页))
            给予.页 = 原始页
            for i=1,4 do
                给予.扩展格子["包裹" .. i]:置选中(i == 原始页)
            end
            local 本地索引 = 原始编号 - (原始页 - 1) * 20
            if 本地索引 >= 1 and 本地索引 <= 20 then
                -- 关键修改：删掉全量刷新！
                给予.道具网格:置物品(物品, 本地索引)
            else
                for i=1,#给予.道具网格.子控件 do
                    if not 给予.道具网格.子控件[i]._spr.物品 then
                        给予.道具网格:置物品(物品, i)
                        break
                    end
                end
            end
        end
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",原始编号)
        self:置物品(nil,a)
    end
end

function 给予网格:置物品(数据,bh)
    if not bh then
        for i = 1,#给予网格.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i],"给予")
            给予网格.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"给予")
        给予网格.子控件[bh]:置精灵(lssj)
    end
end


local 关闭 = 给予:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",604,0)

function 关闭:左键弹起(x,y,msg)
    给予:置可见(false)
end



for i, v in ipairs {
    {name = '道具数量1', x = 50 ,y = 216,w = 35,h = 18},
    {name = '道具数量2', x = 130 ,y = 216,w = 35,h = 18},
    {name = '道具数量3', x = 210 ,y = 216,w = 35,h = 18},
    {name = '银两输入', x = 120 ,y = 302,w = 105,h = 18},
} do
    local  临时函数 = 给予:创建输入(v.name,v.x,v.y,v.w,v.h)
    function 临时函数:初始化()
        self:取光标精灵()
        if v.name ~= '银两输入' then
            self:置限制字数(2)
        else
            self:置限制字数(10)
        end
        self:置颜色(39,53,81,255)
        self:置模式(2)
    end
end

local 确定按钮 = 给予:创建我的按钮(__res:getPNGCC(3,2,507,124,41):拉伸(123,41),"确定按钮",65,350,"确定")

function 确定按钮:左键弹起(x,y,msg)
    local lsgz = {}
    local lssl = {}
    for i, v in ipairs(给予.给予网格.子控件) do
        if v._spr.物品 then
            table.insert(lsgz,v._spr.物品.原始编号)
            table.insert(lssl,给予['道具数量'..i]:取数值())
        end
    end
    发送数据(当前 or self and self.当前,3715,{格子=lsgz,银子=给予.银两输入:取数值(),数量=lssl,类型=给予.选中类型})
    给予:置可见(false)
end

local 扩展格子 = 给予:创建控件("扩展格子", 280, 60, 300, 50)

for i, v in ipairs {
    { name = '包裹1', x = 5, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "1" },
    { name = '包裹2', x = 65+15, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "2" },
    { name = '包裹3', x = 125+30, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "3" },
    { name = '包裹4', x = 185+45, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "4" },
} do
    local 临时函数 = 扩展格子:创建我的单选按钮(v.tcp, v.tcp1, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '包裹1' then
            给予.页 = 1
            给予.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹2' then
            给予.页 = 2
            给予.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹3' then
            给予.页 = 3
            给予.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹4' then
            给予.页 = 4
            给予.道具网格:置物品(多开数据[当前].__主控.道具列表)
        end
    end
end