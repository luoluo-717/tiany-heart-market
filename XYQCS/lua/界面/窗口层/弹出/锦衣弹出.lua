多开数据[多开数据.当前].__UI弹出.锦衣弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("锦衣弹出", 引擎.宽度-850, 50 + abbr.py.y, 769, 406)

local 锦衣弹出 = 多开数据[多开数据.当前].__UI弹出.锦衣弹出
local 当前 = 多开数据.当前
local 方向 = 5
local 抓取物品20格子计算=0

function 锦衣弹出:初始化()
    local nsf = require('SDL.图像')(769,406)
    if nsf:渲染开始() then
        置窗口背景("锦衣", 0, 0, 718,370, true):显示(0, 0)
        __res:getPNGCC(3, 523, 393, 144, 161):显示(110, 128)
        __res:getPNGCC(3, 694, 4, 338, 273):显示(359, 37)
        __res:取图像(__res:取地址("shape/pic/", 0xCF000005)):显示(10, 40)

        for i = 1, 6 do
            __res:getPNGCC(3,132,506,55,55):显示(35+((i-1)%2)*237, 120+math.floor((i-1)/2)*77)
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.允许移动=true
    self.模型格子 = __UI模型格子.创建(当前)
end

function 锦衣弹出:打开(data)
    self:置可见(true)
    self.道具网格:置物品(多开数据[当前].角色信息.锦衣)
    self.锦衣背包数据 = data.锦衣 or {}
    self.分页状态 = self.分页状态 or 1 
    self.抓取物品ID = nil
    self.移动1 = false
    self.锦衣背包网格:置物品(self.锦衣背包数据)
    self.锦衣背包分页控件:置可见(true)
    for i=1,4 do
        if self.锦衣背包分页控件["分页"..i] then
            if i == self.分页状态 then
                self.锦衣背包分页控件["分页"..i]:置选中(true)
            else
                self.锦衣背包分页控件["分页"..i]:置选中(false)
            end
        end
    end
    
    self:重置模型()
end

function 锦衣弹出:重置模型()
    self.模型格子:置数据(多开数据[当前].角色信息, "角色", 175, 250,nil,方向)
end

local 道具网格 = 锦衣弹出:创建网格("道具网格",35,120,300,214)

function 道具网格:初始化()
    self:创建格子(67,67,10,170,3,2)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(300,86,w,h,"锦衣",a)
    end
end

function 道具网格:置物品(data)
    for i = 1,#self.子控件 do
        if data and data[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],nil,"装备")
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

function 锦衣弹出:重置抓取()
    if 抓取物品20格子计算 and self.锦衣背包网格.子控件[抓取物品20格子计算] and self.锦衣背包网格.子控件[抓取物品20格子计算]._spr then
        self.锦衣背包网格.子控件[抓取物品20格子计算]._spr.确定 = nil
    end
    
    self.抓取类型 = nil
    self.抓取物品ID = nil
    抓取物品20格子计算 = nil
    self.移动1 = false
end

local 锦衣背包网格 = 锦衣弹出:创建网格("锦衣背包网格",360,40,339,272)

function 锦衣背包网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end
function 锦衣背包网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        if self.子控件[a]._spr.物品 then
            local x, y = self.子控件[a]:取坐标()
            local w, h = self.子控件[a]:取宽高()
            if not 锦衣弹出.移动1 then
                锦衣弹出:重置抓取()
                self.子控件[a]._spr:详情打开(50, 86, w, h, "锦衣背包", a + (锦衣弹出.分页状态 - 1) * 20)
                锦衣弹出.抓取类型 = "锦衣背包"
                锦衣弹出.抓取物品ID = a + (锦衣弹出.分页状态 - 1) * 20
                抓取物品20格子计算 = a
                self.子控件[a]._spr.确定 = true
            else
                发送数据(当前, 3701, {
                    抓取id = 锦衣弹出.抓取物品ID, 
                    放置id = a + (锦衣弹出.分页状态 - 1) * 20,          
                    放置类型 = "锦衣背包",
                    抓取类型 = 锦衣弹出.抓取类型
                })
                锦衣弹出:重置抓取()
            end
        else
            if 锦衣弹出.移动1 then
                发送数据(当前, 3701, {
                    抓取id = 锦衣弹出.抓取物品ID,
                    放置id = a + (锦衣弹出.分页状态 - 1) * 20,           
                    放置类型 = "锦衣背包",
                    抓取类型 = 锦衣弹出.抓取类型
                })
                锦衣弹出:重置抓取()
            else
                锦衣弹出:重置抓取()
            end
        end
    elseif 锦衣弹出.移动1 then
        发送数据(当前, 3701, {
            抓取id = 锦衣弹出.抓取物品ID,
            放置id = a + (锦衣弹出.分页状态 - 1) * 20,
            放置类型 = "锦衣背包",
            抓取类型 = 锦衣弹出.抓取类型
        })
        锦衣弹出:重置抓取()
    else
        锦衣弹出:重置抓取()
    end
end

function 锦衣背包网格:置物品(data)
    if not data then data = {} end
    
    for i = 1, #锦衣背包网格.子控件 do
        if data[i + (锦衣弹出.分页状态 - 1) * 20] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i + (锦衣弹出.分页状态 - 1) * 20], nil, "锦衣背包")
            lssj:置偏移(10, 10)
            锦衣背包网格.子控件[i].真实id = i + (锦衣弹出.分页状态 - 1) * 20
            锦衣背包网格.子控件[i]:置精灵(lssj)
            if 锦衣弹出.移动1 and 锦衣弹出.抓取物品ID == i + (锦衣弹出.分页状态 - 1) * 20 then
                lssj.确定 = true
                抓取物品20格子计算 = i
            end
        else
            锦衣背包网格.子控件[i].真实id = i + (锦衣弹出.分页状态 - 1) * 20
            锦衣背包网格.子控件[i]:置精灵()
        end
    end
end

local 锦衣背包分页控件 = 锦衣弹出:创建我的控件("锦衣背包分页控件", 357, 316, 363, 40)
for i = 1, 4 do
    local 临时函数 = 锦衣背包分页控件:创建我的单选按钮(
        __res:getPNGCC(5, 0, 408, 87, 39, true):拉伸(85,37), 
        __res:getPNGCC(5, 0, 370, 87, 38, true):拉伸(85,37), 
        "分页"..i, 
        (i-1)*87, 
        0, 
        ""..i
    )
    function 临时函数:左键弹起(x, y)
        锦衣弹出.分页状态 = i
        if 锦衣弹出.锦衣背包数据 then
            锦衣弹出.锦衣背包网格:置物品(锦衣弹出.锦衣背包数据)
        end
        if 锦衣弹出.移动1 and 锦衣弹出.抓取物品ID then
            local 当前页 = math.floor((锦衣弹出.抓取物品ID - 1) / 20) + 1
            if 当前页 == i then  
                local 格子位置 = 锦衣弹出.抓取物品ID - (当前页 - 1) * 20
                if 锦衣弹出.锦衣背包网格.子控件[格子位置] 
                   and 锦衣弹出.锦衣背包网格.子控件[格子位置]._spr then
                    锦衣弹出.锦衣背包网格.子控件[格子位置]._spr.确定 = true
                    抓取物品20格子计算 = 格子位置
                end
            end
        end
    end
end

function 锦衣弹出:刷新(数据)
    if not self.是否可见 then
        return
    end
    self.道具网格:置物品(多开数据[当前].角色信息.锦衣)
    if 数据.锦衣 then
        self.抓取物品ID = nil
        self.移动1 = false
        self.锦衣背包数据 = 数据.锦衣
        self.锦衣背包网格:置物品(self.锦衣背包数据)
    end
    self:重置抓取()
    for i=1,4 do
        if self.锦衣背包分页控件["分页"..i] then
            if i == self.分页状态 then
                self.锦衣背包分页控件["分页"..i]:置选中(true)
            else
                self.锦衣背包分页控件["分页"..i]:置选中(false)
            end
        end
    end
end


local 道具 = 锦衣弹出:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(80,35), "道具", 185, 295, "道具")

function 道具:左键弹起(x, y, msg)
    if 锦衣弹出.移动1 and 锦衣弹出.抓取物品ID then
        发送数据(当前, 3746, {
            序列 = 锦衣弹出.抓取物品ID,
            放置类型 = "道具", -- 移动到道具背包
            抓取类型 = "锦衣背包"
        })
        -- 锦衣弹出:置可见(false)
        锦衣弹出:重置抓取()
    else
        多开数据[当前].__UI弹出.提示框:打开("#Y请先在锦衣背包中点击物品，然后在详情中选择移动")
    end
end

local 关闭 = 锦衣弹出:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 718 - 40, 0)
function 关闭:左键弹起(x, y, msg)
    锦衣弹出:重置抓取()
    锦衣弹出:置可见(false)
end

local 转身 = 锦衣弹出:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(80,35), "转身", 100, 295, "转身")
function 转身:左键弹起(x, y, msg)
    方向 = 方向 + 1
    if 方向 > 8 then 方向 = 1 end
    锦衣弹出.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",170,250,nil,方向)
end

function 锦衣弹出:更新(dt)
    self.模型格子:更新(dt)
end

function 锦衣弹出:显示(x, y)
    if self.数据 then
        self.数据:显示(x, y)
    end
    self.模型格子:显示(x+10, y-10)
end