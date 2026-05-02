
多开数据[多开数据.当前].__UI弹出.快捷技能选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("快捷技能选择",0,0,525,447)
local 快捷技能选择 = 多开数据[多开数据.当前].__UI弹出.快捷技能选择
local 当前 = 多开数据.当前
local function 取回门派技能(名称)
    if 名称=="千里神行" or 名称=="乙木仙遁" or 名称=="故壤归心"or 名称=="筋斗云" or 名称=="佛门普渡" or 名称=="水遁" or 名称=="坐莲" or 名称=="振翅千里" or 名称=="牛屎遁" or 名称=="天蚕丝" or 名称=="杳无音讯" or 名称=="遁地术" or 名称=="移形换影" or 名称=="腾云驾雾" or 名称=="斗转星移" or 名称=="叶隐" or 名称=="遁地术" or 名称=="纵地金光" then
        return true
    else
        return false
    end
end
  
local   function 取临时符技能(名称)
    if 名称=="龙附" or 名称=="兵器谱" or 名称=="堪察令" or 名称=="担山赶月" or 名称=="飞行符" or 名称=="嗜血" or 名称=="拈花妙指" or 名称=="轻如鸿毛" or 名称=="浩然正气" or 名称=="一气化三清" or 名称=="莲华妙法" or 名称=="尸气漫天" or 名称=="盘丝舞" or 名称=="神兵护法" or 名称=="魔王护持" or 名称=="神力无穷" or 名称=="神木呓语" or 名称=="元阳护体" or 名称=="穿云破空" then
        return true
    else
        return false
    end
end

local function 取角色主动技能(role)
    local 技能 = {}
    local 门派技能 = {}
    if role.门派~=nil then
        for i=1,#role.师门技能 do
            for s=1,#role.师门技能[i].包含技能 do
                if role.师门技能[i].包含技能[s].学会 then
                    local 名称=role.师门技能[i].包含技能[s].名称
                    if 取回门派技能(名称) or 取临时符技能(名称) then
                        技能[#技能+1]={名称=名称}
                    end
                end
            end
        end
    end
    return 技能
end
function 快捷技能选择:初始化()
    local nsf = require('SDL.图像')(525,447)
    if nsf:渲染开始() then
        取黑色背景(0,0,525,447,true):显示(0,0)
        取灰色背景(0,0,415,425,true):显示(100,10)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 快捷技能选择:打开(i)
    self:置可见(true)
    self.师门:置选中(true)
    self.师门:左键弹起()
    self.序号 = i
end

for i, v in ipairs {
    --{name = '全部', x = 12 ,y = 12 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(82,62),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(82,62),font = '全部'},
    {name = '师门', x = 12 ,y = 12 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(82,62),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(82,62),font = '师门'},
    {name = '生活', x = 12 ,y = 12+66 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(82,62), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(82,62),font = '生活'},
    {name = '剧情', x = 12 ,y = 12+66*2 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(82,62), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(82,62),font = '剧情'},
    --{name = '其他', x = 12 ,y = 12+66*4 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(82,62), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(82,62),font = '其他'},
} do
    local  临时函数 = 快捷技能选择:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '全部' then

        elseif v.name == '师门' then
            local lssj = 取角色主动技能(多开数据[当前 or self and self.当前].角色信息)
            for i=1,#lssj do
                lssj[i].类型 =1
            end
            快捷技能选择.技能网格:重置(lssj)
        elseif v.name == '生活' then
            local lssj = {}
            for i, v in ipairs(多开数据[当前 or self and self.当前].角色信息.辅助技能) do
                if v.名称 == "中药医理" or v.名称=="烹饪技巧" or v.名称=="熔炼之术" then
                    table.insert(lssj,v)
                    lssj[#lssj].类型 = 2
                end
            end
            快捷技能选择.技能网格:重置(lssj)
        elseif v.name == '剧情' then
            local lssj = {}
            for i, v in ipairs(多开数据[当前 or self and self.当前].角色信息.剧情技能) do
                if  v.名称 == "仙灵酒店" or v.名称 == "仙灵店铺" or v.名称=="调息" or v.名称=="打坐" then
                    table.insert( lssj, v)
                    lssj[#lssj].类型 = 3
                end
            end
            快捷技能选择.技能网格:重置(lssj)
        end
    end
end




local 技能网格 = 快捷技能选择:创建网格('技能网格',105,15,404,414)

function 技能网格:左键弹起(x, y, a, b, msg)
    local sl = 0
    for i,v in pairs(多开数据[当前 or self and self.当前].角色信息.快捷技能) do
        sl = sl + 1
    end
    if sl < 8 and self.子控件[a] and self.子控件[a]._spr then
        发送数据(当前 or self and self.当前,11,{位置=快捷技能选择.序号,名称=self.数据[a].名称,类型=self.数据[a].类型})
        快捷技能选择:置可见(false)
    end
end

function 技能网格:重置(data)
    self:创建格子(198,64,8,8,math.ceil(#data/2),2,true)
    self.数据 = {}
    for _,v in ipairs(self.子控件) do
        if data[_] then
            local nsf = require('SDL.图像')(198,64)
            if nsf:渲染开始() then
                if data[_].类型 == 1 then
                    self.数据[_] = 取技能信息(data[_].名称)
                elseif data[_].类型 == 2 then
                    self.数据[_] = 取技能信息(data[_].名称)    
                elseif data[_].类型 == 3 then
                    self.数据[_] = 取技能信息(data[_].名称)
                end
                self.数据[_].类型 = data[_].类型
                self.数据[_].名称 = data[_].名称
                __res:getPNGCC(3,997,1047,178,64):拉伸(198,64):显示(0,0)
                __res:取图像(__res:取地址('shape/jn/',self.数据[_][7])):拉伸(40,40):显示(11,10)
                字体16:置颜色(__取颜色('浅黑'))
                字体16:取图像(data[_].名称):显示(63,24)
                nsf:渲染结束()
            end
            v:置精灵(nsf:到精灵())
        else
            v:置精灵()
        end
    end
end

local 关闭 = 快捷技能选择:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",480,8)
function 关闭:左键弹起(x,y)
    快捷技能选择:置可见(false)
end
