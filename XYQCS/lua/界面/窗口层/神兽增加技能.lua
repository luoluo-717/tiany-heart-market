local 神兽增加技能 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("神兽增加技能",0,0,730,520)
local 当前=多开数据.当前
local lsb = {"攻击资质","体力资质","速度资质","寿  命","五  行","防御资质","法术资质","闪躲资质","成  长"}
local lsb2 = {"攻击资质","体力资质","速度资质","寿命","五行","防御资质","法力资质","躲闪资质","成长"}
function 神兽增加技能:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(723,520)
    if nsf:渲染开始() then
        置窗口背景("无",0,12,722,507,true):显示(0,0)
        __res:getPNGCC(3,761,370,308,163):显示(22,75)
        取灰色背景(0,0,340,237,true):显示(360,265)
        local lssj = 取输入背景(0,0,93,23)
        字体18:置颜色(255,255,255)
        local pyx = 0
        local pyy = 0
        for i=1,#lsb do
            if i > 5 then
                pyx = 181
                pyy = -160
            end
            lssj:显示(432+pyx,60+((i-1)*32)+pyy)
            字体18:取图像(lsb[i]):显示(355+pyx,62+((i-1)*32)+pyy)
        end
        字体18:取图像("请放入材料"):显示(485,298)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中召唤兽 = nil
    self.模型格子 = __UI模型格子.创建(当前)
    self.标题宽度 = 字体20:取宽度("增加")
    self.标题 = "增加"
    self.选中技能 = nil
    self.选中技能名称 = nil
end

function 神兽增加技能:更新(dt)
    self.模型格子:更新(dt)
end

function 神兽增加技能:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
    self.模型格子:显示(x,y)
    字体20:显示(x+(722/2)-(self.标题宽度/2),y+15,self.标题)
end

function 神兽增加技能:打开(数据,lx)
    self:置可见(true)
    self.选中召唤兽 = nil
    self.选中技能 = nil
    self.选中技能名称 = nil
    self.图像 = nil
    self.模型格子:清空()
    self[lx.."按钮"]:置选中(true)
    self.标题宽度 = 字体20:取宽度(lx)
    self.标题 = lx
    local lsb = {"增加","替换"}
    for i=1,#lsb do
        if lsb[i] == lx then
            self[lsb[i].."确定按钮"]:置可见(true)
        else
            self[lsb[i].."确定按钮"]:置可见(false)
        end
    end
    if lx == "增加" then
        self.增加按钮:置可见(true)
        self.替换按钮:置可见(false)
    elseif lx == "替换" then
        self.增加按钮:置可见(false)
        self.替换按钮:置可见(true)
    end
    self.材料网格:置物品(nil)
    self.道具 = 数据
    self.技能控件:置可见(false)
    self:我的按钮置文字(self.选择召唤兽按钮,__res:getPNGCC(3,1040,201,149,37,true):拉伸(173,37),'选择召唤兽')
end

function 神兽增加技能:重置(数据)
    self.选中召唤兽 = 数据
    if 多开数据[当前 or self and self.当前].角色信息.宝宝列表[神兽增加技能.选中召唤兽].种类 ~= "神兽" then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y该操作只可以针对神兽')
        return
    end
    local nsf = require('SDL.图像')(730,520)
    if nsf:渲染开始() then
        字体18:置颜色(39,53,81)
        local pyx = 0
        local pyy = 0
        for i=1,#lsb2 do
            if i > 5 then
                pyx = 181
                pyy = -160
            end
            字体18:取图像(多开数据[当前 or self and self.当前].角色信息.宝宝列表[神兽增加技能.选中召唤兽][lsb2[i]]):显示(440+pyx,62+((i-1)*32)+pyy)
        end
        local 神兜兜数量 = 100
        if self.标题 == "替换" then 神兜兜数量 = 10 end
        字体18:置颜色(255, 255, 0)
        字体18:取图像("神兜兜 * "..神兜兜数量):显示(380,335)
        字体18:取图像("银子 * 888W"):显示(380, 360)
    end
    self.图像= nsf:到精灵()
    self.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[神兽增加技能.选中召唤兽],"召唤兽",180,195)
    self:我的按钮置文字(self.选择召唤兽按钮,__res:getPNGCC(3,1040,201,149,37,true):拉伸(173,37),多开数据[当前 or self and self.当前].角色信息.宝宝列表[神兽增加技能.选中召唤兽].名称)
    self.技能控件:置可见(true)
    self.技能控件.技能按钮:置选中(true)
    self.技能控件.技能:重置()
end

local 关闭 = 神兽增加技能:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",680,0)

function 关闭:左键弹起(x,y,msg)
    神兽增加技能:置可见(false)
end

local 选择召唤兽按钮 = 神兽增加技能:创建我的按钮(__res:getPNGCC(3,1040,201,149,37,true):拉伸(173,37),"选择召唤兽按钮",23,38,"选择召唤兽")

function 选择召唤兽按钮:左键弹起(x,y,msg)
   多开数据[当前 or self and self.当前].__UI弹出.召唤兽选择:打开(151,133,"增加")
end

local 技能控件 = 神兽增加技能:创建控件("技能控件",20,240,310,265)
local jcx = 0
local jcy = 0
local lsb = {"技能"}
for i=1,#lsb do
    local 临时函数 = 技能控件:创建我的单选按钮(__res:getPNGCC(3,880,331,86,37,true),__res:getPNGCC(3,876,289,85,36,true),lsb[i].."按钮",jcx+((i-1)*105),jcy,lsb[i])

    function 临时函数:左键按下(消息,x,y)
        技能控件[lsb[i]]:重置()
    end
    local 临时函数2 = 技能控件:创建控件(lsb[i],jcx,jcy+45,310,220)
    function 临时函数2:初始化()
        if lsb[i] == "技能" then
            local nsf = require('SDL.图像')(310,220)
            if nsf:渲染开始() then
                取灰色背景(0,0,308,220,true):显示(0,0)
                self.技能选中框框 = __res:取动画(__res:取地址('shape/ui/', 0x070155B1)):取动画(1):播放(true)
                nsf:渲染结束()
            end
            self:置精灵(nsf:到精灵())
            local 临时函数3 = 临时函数2:创建网格(lsb[i].."网格",22,12,273,202)
            function 临时函数3:初始化()
                self:创建格子(55,55,18,18,9,4,true)
            end
            function 临时函数3:左键弹起(x, y, a, b, msg)
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                    self.子控件[a]._spr:详情打开(x,y)
                    if 神兽增加技能.标题 == "替换" then
                        神兽增加技能.选中技能 = a
                        神兽增加技能.选中技能名称 = self.子控件[a]._spr.数据.名称
                    end
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
        end
    end
    function 临时函数2:更新(dt)
        self.技能选中框框:更新(dt)
    end

    function 临时函数2:显示(x,y)
        if self.数据 then
            self.数据:显示(x,y)
        end
        if 神兽增加技能.选中技能 then
            local xx,yy = 1,1
            if 1 <= 神兽增加技能.选中技能 and 神兽增加技能.选中技能 <= 4 then
                xx = 神兽增加技能.选中技能
            elseif 5 <= 神兽增加技能.选中技能 and 神兽增加技能.选中技能 <= 8 then
                xx = 神兽增加技能.选中技能 - 4
                yy = 2
            elseif 9 <= 神兽增加技能.选中技能 and 神兽增加技能.选中技能 <= 12 then
                xx = 神兽增加技能.选中技能 -8
                yy = 3
            end
            self.技能选中框框:显示(x + 20 + 73 * (xx -1) , y + 8 + 73 * (yy - 1))
        end
    end
    function 临时函数2:重置()
        if lsb[i] == "技能" then
            技能控件.技能:置可见(true)
            self.数据 = nil
            if 神兽增加技能.选中召唤兽 then
                临时函数2.技能网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[神兽增加技能.选中召唤兽].技能,多开数据[当前 or self and self.当前].角色信息.宝宝列表[神兽增加技能.选中召唤兽].法术认证)
            else
                临时函数2.技能网格:置数据({})
            end
        end
    end
end

local lsb4 = {"增加","替换"}
for i=1,#lsb4 do
    local 临时函数 = 神兽增加技能:创建我的单选按钮(__res:getPNGCC(3,1040,201,149,37,true):拉伸(110,37),__res:getPNGCC(3,1039,160,148,36,true) :拉伸(110,36),lsb4[i].."按钮",360+((i-1)*120),224,lsb4[i])

    function 临时函数:左键按下(消息,x,y)
        if lsb4[i] == "增加" then
            神兽增加技能.增加确定按钮:置可见(true)
            神兽增加技能.替换确定按钮:置可见(false)
        elseif lsb4[i] == "替换" then
            神兽增加技能.增加确定按钮:置可见(false)
            神兽增加技能.替换确定按钮:置可见(true)
        end
        神兽增加技能.标题宽度 = 字体20:取宽度(lsb4[i])
        神兽增加技能.标题 = lsb4[i]
    end
    local 临时函数2 = 神兽增加技能:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),lsb4[i].."确定按钮",477,420,lsb4[i])

    function 临时函数2:左键弹起(x,y,msg)
        if lsb4[i] == "增加" then
            if 神兽增加技能.选中召唤兽 and 神兽增加技能.材料网格.子控件[1]._spr and 神兽增加技能.材料网格.子控件[1]._spr.物品 then
                多开数据[当前 or self and self.当前].__UI弹出.提示弹出:打开("你确定要为该召唤兽学习此兽决么？", 5019, 
                { 
                    序列 = 神兽增加技能.材料网格.子控件[1]._spr.原始编号,
                    序列1 = 神兽增加技能.选中召唤兽
                })
            end
        elseif lsb4[i] == "替换" then
            if 神兽增加技能.选中召唤兽 and 神兽增加技能.材料网格.子控件[1]._spr and 神兽增加技能.材料网格.子控件[1]._spr.物品 then
                多开数据[当前 or self and self.当前].__UI弹出.提示弹出:打开("你确定要为该召唤兽学习此兽决么？", 5020,
                    {
                        序列 = 神兽增加技能.材料网格.子控件[1]._spr.原始编号,
                        序列1 = 神兽增加技能.选中召唤兽,
                        编号 = 神兽增加技能.选中技能名称
                    })
            end    
        end
    end
end

local 材料网格 = 神兽增加技能:创建网格("材料网格",510,338,55,55)

function 材料网格:初始化()
    self:创建格子(55,55,0,0,1,1)
end

function 材料网格:左键弹起(x, y, a, b, msg)
    if 神兽增加技能.标题 ~= "认证" then
       多开数据[当前 or self and self.当前].__UI弹出.道具选择:打开(神兽增加技能.道具,235,58,神兽增加技能.标题)
    end
end

function 材料网格:置物品(数据,bh)
    local lssj = __材料格子.创建(当前)
    lssj:置物品(数据)
    self.物品bh = bh
    材料网格.子控件[1]:置精灵(lssj)
    材料网格.子控件[1]._spr.原始编号 = bh
end

function 材料网格:刷新物品()
    if 神兽增加技能.道具[self.物品bh] == nil then
        self:置物品(nil)
    else
        self:置物品(神兽增加技能.道具[self.物品bh],self.物品bh)
    end
end