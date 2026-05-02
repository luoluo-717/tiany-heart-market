local 附魔宝珠 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("附魔宝珠",0,0,374,510)
local 当前 = 多开数据.当前
function 附魔宝珠:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(374,510)
    if nsf:渲染开始() then
        置窗口背景("附魔宝珠",0,12,362,500,true):显示(0,0)
        取灰色背景(0,0,340,280,true):显示(15,50)
        字体16:取图像("变身术"):显示(60,348)
        字体16:取图像("变化咒"):显示(210,348)
        字体16:取图像("追加法术"):显示(60,388)
        字体16:取图像("附加状态"):显示(210,388)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())

end

function 附魔宝珠:打开(数据)
    self:置可见(true)
    self.数据=数据
    self:重置(数据)
end

function 附魔宝珠:重置(数据)
    self.消耗金钱 = nil
    self.材料数量 = nil
    self.消耗经验 = nil
    self.祈福值 = nil
    self.石头  = nil
    self.选择 = nil
    self.变身术:置选中(false)
    self.追加法术:置选中(false)
    self.附加状态:置选中(false)
    self.道具网格:置物品(多开数据[当前].__主控.道具列表)
end

for i,v in ipairs(
    {
        {"变身术",30,350-4},
        {"变化咒",180,350-4},
        {"追加法术",30,390-4},
        {"附加状态",180,390-4}
    }
) 
do
    local 临时函数 = 附魔宝珠:创建我的多选按钮(__res:getPNGCC(2,1172,107,26,26,true),__res:getPNGCC(2,1171,75,26,26,true),v[1],v[2],v[3])
    if v[1] == "变化咒" then
        临时函数:置禁止(true)
    end
    function 临时函数:左键弹起(x, y)
        if v[1]=="变身术" then
            附魔宝珠.追加法术:置选中(false)
            附魔宝珠.附加状态:置选中(false)
            附魔宝珠.选择  = i
        elseif v[1]=="追加法术" then
            附魔宝珠.变身术:置选中(false)
            附魔宝珠.附加状态:置选中(false)
            附魔宝珠.选择  = 2
        elseif v[1]=="附加状态" then
            附魔宝珠.变身术:置选中(false)
            附魔宝珠.追加法术:置选中(false)
            附魔宝珠.选择  = 4
        end
    end
end

function 附魔宝珠:显示(x,y)
    字体16:显示(x+20,y+425,"消耗经验："..(self.消耗经验 or ""))
    字体16:显示(x+170,y+425,"消耗金钱："..(self.消耗金钱 or ""))
    字体16:显示(x+20,y+450,"消耗"..(self.石头 or "")..":" ..(self.材料数量 or ""))
    字体16:显示(x+20,y+475,"祈福值："..(self.祈福值 or ""))
end

local function 消耗经验(等级)
	return 等级 * 3000
end

local function 消耗金钱(等级)
	return 等级 * 5000
end

local function 消耗石头(等级)
	return math.floor(等级/10)
end

local cl = {"青龙石","朱雀石","玄武石","白虎石"}

local 道具网格 = 附魔宝珠:创建网格("道具网格",20,60,326,260)
function 道具网格:初始化()
    self:创建格子(55,55,14,13,20,5,true)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if  附魔宝珠.选中 and  self.子控件[附魔宝珠.选中]._spr and  self.子控件[附魔宝珠.选中]._spr.物品 then
        self.子控件[附魔宝珠.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and self.子控件[a]._spr.物品.总类 == 2 and self.子控件[a]._spr.物品.分类 ~= 3 and self.子控件[a]._spr.物品.分类 <= 6 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(520,86,w,h)
        self.子控件[a]._spr.确定 = true

        附魔宝珠.选中 = a
        附魔宝珠.消耗金钱 = 消耗金钱(self.子控件[a]._spr.物品.等级)
        附魔宝珠.材料数量 = 消耗石头(self.子控件[a]._spr.物品.等级)
        附魔宝珠.消耗经验 = 消耗经验(self.子控件[a]._spr.物品.等级)
        附魔宝珠.祈福值 = self.子控件[a]._spr.物品.祈福值 or 0
        附魔宝珠.石头  = cl[self.子控件[a]._spr.物品.分类] or "玄武石"
    end
end

function 道具网格:置物品(数据,bh)
    if not bh then
        for i = 1,#道具网格.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i],"附魔宝珠")
            道具网格.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"附魔宝珠")
        道具网格.子控件[bh]:置精灵(lssj)
    end
end

local 关闭 = 附魔宝珠:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",320,0)

function 关闭:左键弹起(x,y,msg)
    附魔宝珠:置可见(false)
end


local 确定按钮 = 附魔宝珠:创建我的按钮(__res:getPNGCC(3,2,507,124,41):拉伸(100,35),"确定按钮",250,460,"确定")

function 确定按钮:左键弹起(x,y,msg)
    local item = ((附魔宝珠.道具网格.子控件[附魔宝珠.选中] or {})._spr or {}).物品
    if 附魔宝珠.选中 == nil or item == nil then
        多开数据[当前].__UI弹出.提示框:打开('#Y请先选中需要操作的物品')
        return
    end
    if item.总类 ~= 2 then
        多开数据[当前].__UI弹出.提示框:打开('#Y只可以给装备使用该道具')
        return 
    end
    if 附魔宝珠.选择 ==nil then
        多开数据[当前].__UI弹出.提示框:打开('#Y请选择正确的套装')
        return 
    end
    发送数据(当前,3763,{宝珠数据=附魔宝珠.数据.宝珠数据,装备=附魔宝珠.选中,套装=附魔宝珠.选择})
    附魔宝珠:置可见(false)
end

