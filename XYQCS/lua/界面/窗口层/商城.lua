local 商城菜单={外观商城={"锦衣商品","战锦商品","武器装扮","光环商品","足迹商品","祥瑞商品","攻击特效","施法特效"},仙玉商店={"仙玉商城","特殊商城","礼包商品"},杂货商城={"银子商城","强化符","锻造商品"},炼妖商城={"宝宝"},法宝商城={"法宝"},积分商城={"天罡积分","地煞积分","神器积分"},灵宝商城={"灵宝"}}
local 商城 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("商城", 0, 0, 830, 534)
local 当前 = 多开数据.当前
local 菜单排序 = {"杂货商城","仙玉商店", "积分商城", "灵宝商城","法宝商城", "炼妖商城", "外观商城"}
local 显示名称 = {
    ["光环商品"] = "光环",
    ["祥瑞商品"] = "祥瑞", 
    ["足迹商品"] = "足迹",
    ["锦衣商品"] = "锦衣",
    ["施法特效"] = "施法",
    ["攻击特效"] = "攻击",
    ["战锦商品"] = "战锦",
    ["武器装扮"] = "武器",
}

function 商城:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(830, 534)
    if nsf:渲染开始() then
        -- __res:取图片("shape/ui/pic/sc/scbj1.png"):显示(0, 0)
        __res:取图像(__res:取地址("shape/ui/pic/sc/", 0xacac0001)):显示(0, 0) 
        -- 字体18:置颜色(__取颜色('白色'))        
        -- 字体18:取图像('数量'):显示(10, 443)
        -- 取输入背景(0, 0, 60, 23):显示(60, 445)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.菜单={}
    -- self.允许移动 = true
end

function 商城:加载数据(data)
    self.菜单={}
    self.数据 = data
    for key, value in pairs(data) do
        if key ~='仙玉' and key ~='累充' and key ~='点卡' and key ~='银子' and key ~='积分数' then
        table.insert(self.菜单, key)
        end
    end
    
    if not self.是否可见 then
        self:打开()
    else
        self:置可见(false)
    end
end
function 商城:刷新分类()
    if self.道具网格 and self.道具网格.子控件 then
        for _, 格子 in ipairs(self.道具网格.子控件) do
            if 格子._spr then
                if 格子._spr.数据 and 格子._spr.数据.确定 then
                    格子._spr.数据.确定 = nil  -- 清除外观商城的选中标记
                end
                if 格子._spr.确定 then
                    格子._spr.确定 = nil  -- 清除其他商城的选中标记
                end
            end
        end
    end
    self.选中 = 0
    for _, 分类名 in ipairs(菜单排序) do
        if self[分类名] then
            self[分类名]:置选中(分类名 == self.类型)
        end
    end
    for 主类名, 子类列表 in pairs(商城菜单) do
        for _, 子类名 in ipairs(子类列表) do
            if self[子类名] then
                self[子类名]:置可见(主类名 == self.类型)
                if 主类名 == self.类型 then
                    self[子类名]:置选中(子类名 == self.分类)
                end
            end
        end
    end
    if self.数据 and self.数据[self.分类] then
        self.道具网格:置物品(self.数据[self.分类])
    end
    self:重置()
end

function 商城:打开()
    self:置可见(true)
    self.类型 = '杂货商城'
    self.分类 = '银子商城'
    self:刷新分类()
    self.数量输入:置数值(1)
    self:重置()
end

function 商城:更新总价显示()
    local 数量 = self.数量输入 and self.数量输入:取数值() or 1
    local 总价 = 0
    if self.选中 and self.选中 > 0 and self.道具网格 and self.道具网格.子控件 then
        local 选中格子 = self.道具网格.子控件[self.选中]
        if 选中格子 and 选中格子._spr then
            if self.分类 == "光环商品" or self.分类 == "祥瑞商品" or self.分类 == "战锦商品" or
               self.分类 == "锦衣商品" or self.分类 == "施法特效" or self.分类 == "足迹商品" or self.分类 == "攻击特效" then
                if 选中格子._spr.数据 and 选中格子._spr.数据.价格 then
                    总价 = 选中格子._spr.数据.价格 * 数量
                end
            else
                if 选中格子._spr.物品 and 选中格子._spr.物品.价格 then
                    总价 = 选中格子._spr.物品.价格 * 数量
                end
            end
        end
    end
    
    return 总价
end

function 商城:重置()
local nsf = require('SDL.图像')(830, 534)
    if nsf:渲染开始() then
        -- __res:取图片("shape/ui/pic/sc/scbj1.png"):显示(0, 0) 
        __res:取图像(__res:取地址("shape/ui/pic/sc/", 0xacac0001)):显示(0, 0) 
        -- 字体18:置颜色(__取颜色('白色'))        
        -- 字体18:取图像('数量'):显示(10, 443)
        -- 取输入背景(0, 0, 60, 23):显示(60, 441)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像(多开数据[当前].角色信息.仙玉):显示(162, 18)
        字体18:取图像(多开数据[当前].角色信息.银子):显示(165+122, 18)
        -- 字体18:取图像(多开数据[当前].角色信息.点卡):显示(165+122, 18)
        local 显示积分 = 0
        if self.分类 == "天罡积分" then
            显示积分 = 多开数据[当前].角色信息.天罡积分 or 0
        elseif self.分类 == "地煞积分" then
            显示积分 = 多开数据[当前].角色信息.地煞积分 or 0
        elseif self.分类 == "神器积分" then
            显示积分 = 多开数据[当前].角色信息.神器积分 or 0
        else
            显示积分 = 0
        end
        字体18:取图像(显示积分):显示(165+125+112, 18)
        local 总价 = self:更新总价显示()
        字体18:取图像(总价):显示(180, 505)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

    local 数量s=0              
    for _, key in ipairs(菜单排序) do 
    local value = 商城菜单[key]
    数量s=数量s+1
    local 数量s1=0
    local tcp=取图像指定帧(__res:取地址("shape/ui/pic/", 0x10000052), 1)
    local tcp1=取图像指定帧(__res:取地址("shape/ui/pic/", 0x10000052), 3)
    local 临时函数 = 商城:创建我的单选按钮(tcp, tcp1, key,1, 24+37*数量s, key)          
    function 临时函数:左键弹起(x, y, msg)
        商城.类型 = key
        商城.分类 = 商城菜单[key][1]
        商城:刷新分类()
    end
  
    for index2, value2 in pairs(value) do
        数量s1=数量s1+1
        local 宽=80
        local 坐标=67+85*数量s1
        if key == "外观商城" then
            宽=60
            坐标=82+62*数量s1
        end
        local tcp=取图像指定帧(__res:取地址("shape/ui/pic/", 0x10000047), 1):拉伸(宽, 37)
        local tcp1=取图像指定帧(__res:取地址("shape/ui/pic/", 0x10000047), 2):拉伸(宽, 37)
        local 子类显示名称 = 显示名称[value2] or value2
        local 临时函数1 = 商城:创建我的单选按钮(tcp, tcp1, value2, 坐标, 63,子类显示名称)       
        function 临时函数1:左键弹起(x, y, msg)
            商城.分类 = value2
            商城:刷新分类()
        end        
    end 
   
end    
local 道具网格 = 商城:创建网格("道具网格", 223-70, 91+20, 640, 365)
    function 道具网格:初始化()

    end
    function 道具网格:左键弹起(x, y, a, b, msg)
        if 商城.分类 == "武器装扮" or 商城.分类 == "战锦商品" or 商城.分类 == "光环商品"  or 商城.分类 == "祥瑞商品" or 商城.分类 == "施法特效"  or 商城.分类 == "锦衣商品" or 商城.分类 == "足迹商品" or 商城.分类 == "攻击特效" then
            if self.子控件[商城.选中] and self.子控件[商城.选中]._spr   and self.子控件[商城.选中]._spr.数据 then
            self.子控件[商城.选中]._spr.数据.确定 = nil
            end
            -- if self.子控件[a]._spr.数据 then
            if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
                商城.选中 = a
                self.子控件[a]._spr.数据.确定 = true
            end
        elseif 商城.分类 == "宝宝" then
            if 商城.选中 and self.子控件[商城.选中] then
                if 商城.选中 == a and 商城.数据[商城.分类][a] then
                    多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(商城.数据[商城.分类][a])
                else
                    self.子控件[商城.选中]._spr.确定 = nil
                    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
                        商城.选中 = a
                        self.子控件[a]._spr.确定 = true
                    end
                end
            else
                if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
                    商城.选中 = a
                    self.子控件[a]._spr.确定 = true
                end
            end
        else
            if 商城.选中 and self.子控件[商城.选中] and self.子控件[商城.选中]._spr and self.子控件[商城.选中]._spr.确定 then
                self.子控件[商城.选中]._spr.确定 = nil
            end
            if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
                商城.选中 = a
                local w, h = self.子控件[a]:取宽高()
                self.子控件[a]._spr.确定 = true
                self.子控件[a]._spr:详情打开(0, 86, w, h, "选择", a)
            end
        end
        商城:重置()
    end
    function 道具网格:置物品(数据)
        local lssj = 1
        if 数据 and 取表数量(数据) > 4 then
            lssj = 取表数量(数据) // 4 + 1
        end
        if  商城.分类=="武器装扮" or 商城.分类=="光环商品" or  商城.分类=="祥瑞商品" or 商城.分类=="战锦商品"  or 商城.分类=="锦衣商品" or 商城.分类=="施法特效"  or 商城.分类=="足迹商品"  or 商城.分类=="攻击特效" then
            self:创建格子(154, 180, 2, 2, lssj, 4, true)
            for i = 1, #self.子控件 do                
                if 数据 and 数据[i] then
                    local lssj = __商城锦衣格子.创建(多开数据.当前)
                    -- lssj:置数据(数据[i], 商城.分类, 100,150)
                    lssj["置物品"](lssj, 数据[i], 商城.分类)
                    self.子控件[i]:置精灵(lssj)
                end
            end
        else
            self:创建格子(120, 120, 5, 5, lssj, 5, true)
            for i = 1, #self.子控件 do
                local lssj = __商店格子.创建(当前)
                if 数据 and 数据[i] then
                    if 商城.分类 == "宝宝" then
                        lssj:置物品(数据[i], "商城道具", nil, "宝宝")
                    else
                        lssj:置物品(数据[i], "商城道具", nil,商城.类型)
                    end
                    if lssj.数据 then
                        self.子控件[i]:置精灵(lssj)
                    else
                        self.子控件[i]:置精灵(nil)
                    end
                end
            end
        end
    end


local 关闭 = 商城:创建我的按钮(__res:取图片("shape/ui/pic/sc/gb.png"), "关闭", 780-15, 15)

function 关闭:左键弹起(x, y, msg)
    商城:置可见(false)
    self.选中 = nil
    
end
local 翻一番按钮 = 商城:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):置拉伸(110, 33), "翻一番按钮", 10, 380, "翻一番")
function 翻一番按钮:左键弹起(x, y, msg)
    if not 多开数据[当前].__UI界面["窗口层"]["翻一番"].是否可见 then
    发送数据(当前 or self and self.当前,6601)
    商城:置可见(false)
    self.选中 = nil
    end
end
local 数量输入 = 商城:创建我的输入("数量输入", 370, 507, 50, 24, 2, 2, '白色')

local 购买 = 商城:创建我的按钮(__res:getPNGCC(1, 449, 28, 174, 35, true):置拉伸(110, 30), "购买", 490, 500, "购买")
function 购买:左键弹起(x, y, msg)
    if not 商城.选中 or 商城.选中==0 then
        多开数据[当前].__UI弹出.提示框:打开("#r请先选择一件商品")                       
    elseif 商城.选中 and 商城.分类 and 商城.数量输入:取数值() then
        local 发送信息 = {
            编号 = 商城.选中,
            位置 = 商城.选中,
            数量 = 商城.数量输入:取数值(),
            组号 = 18,
            分类 = 商城.分类,
           
        }
        if 商城.分类=="武器装扮" or 商城.分类=="光环商品" or  商城.分类=="祥瑞商品" or 商城.分类=="战锦商品"  or 商城.分类=="锦衣商品" or 商城.分类=="施法特效" or 商城.分类=="足迹商品" or 商城.分类=="攻击特效" then
            发送信息.名称 = 商城.道具网格.子控件[商城.选中]._spr.数据.名称   
        else
            发送信息.名称 = 商城.道具网格.子控件[商城.选中]._spr.物品.名称   
        end
        发送数据(当前 or self and self.当前, 30, 发送信息)
    end
end
