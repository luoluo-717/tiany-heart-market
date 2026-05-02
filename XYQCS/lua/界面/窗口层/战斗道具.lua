--[[
    @Author       : GGELUA
    @Date         : 2022-03-04 16:35:13
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:36:21
--]]
local SDL = require('SDL')
local 加血道具={驱赶烟花=4,金创药=5,小还丹=5,千年保心丹=5,金香玉=5,五龙丹=5,翡翠豆腐=5,佛跳墙=5,蛇蝎美人=5,风水混元丹=5,定神香=5,十香返生丸=5,佛光舍利子=5,
    九转回魂丹=5,珍露酒=5,虎骨酒=5,女儿红=5,蛇胆酒=5,醉生梦死=5,梅花酒=5,百味酒=5,天不老=5,紫石英=5,血色茶花=5,熊胆=5,鹿茸=5,六道轮回=5,凤凰尾=5,
    硫磺草=5,龙之心屑=5,火凤之睛=5,四叶花=5,天青地白=5,七叶莲=5,丁香水=5,月星子=5,仙狐涎=5,地狱灵芝=5,麝香=5,血珊瑚=5,餐风饮露=5,白露为霜=5,天龙水=5,
    孔雀红=5,紫丹罗=5,佛手=5,旋复花=5,龙须草=5,百色花=5,香叶=5,白玉骨头=5,鬼切草=5,灵脂=5,曼陀罗花=5,乾坤袋=4,逍遥镜=2}
local 法宝道具 = {
    乾坤玄火塔=2,混元伞=2,五彩娃娃=2,万鬼幡=2,聚妖铃=2,苍白纸人=2,干将莫邪=2,罗汉珠=2,分水=2,赤焰=2,天煞=2,神木宝鼎=2,金蟾=2,九梵清莲=2,苍灵雪羽=2,
    璞玉灵钵=2,烽火狼烟=2,惊魂铃=4,鬼泣=4,发瘟匣=4,断线木偶=4,摄魂=4,无魂傀儡=4,无尘扇=4,缚妖索=4,捆仙绳=4,缚龙索=4,现形符=4,番天印=4,落雨金钱=4,
    照妖镜=4,落宝金钱=4,无字经=4,舞雪冰蝶=4,紫火如意=4,清心咒=5
}
local function 取可用道具(名称)
    if 加血道具[名称] then 
        return 加血道具[名称]
    end
    return 0
end
   
local function 取可用法宝(名称)
    if 法宝道具[名称] then 
        return 法宝道具[名称]
    end
    return 0
end

local function 可用门派(名称,门派)
    if 名称=="罗汉珠" and 门派~="化生寺" then
        return false
    elseif 名称=="分水" and 门派~="龙宫" then
        return false
    elseif 名称=="赤焰" and 门派~="魔王寨" then
        return false
    elseif 名称=="天煞" and 门派~="凌波城" then
        return false
    elseif 名称=="神木宝鼎" and 门派~="神木林" then
        return false
    elseif 名称=="干将莫邪" and 门派~="大唐官府" then
        return false
    elseif 名称=="金蟾" and 门派~="无底洞" then
        return false
    end
    return true
end

local 战斗道具 =  多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("战斗道具",0,0,365,404)
local 当前 = 多开数据.当前
function 战斗道具:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(354,406)
    if nsf:渲染开始(0,0,0,0) then
        __res:getPNGCC(2,0,63,354,396):显示(0,10)
        local 宽度 = 字体20:取宽度("道具")
        字体20:置颜色(255,255,255)
        字体20:取图像("道具"):显示(354/2-宽度/2,0+16)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 战斗道具:打开(data,lx)
    self:置可见(true)
     多开数据[当前].__UI界面.界面层.战斗界面:置可见(false)
    for i = 1,#self.道具网格.子控件 do
        local lssj = __物品格子.创建(当前)
        lssj:置物品(data[i],"白格子","战斗道具")
        self.道具网格.子控件[i]:置精灵(lssj)
        if lx =='道具' then
            if data[i] then 
                if 取可用道具(data[i].名称) == 0 then
                    self.道具网格.子控件[i]._spr.物品禁止 = true
                else
                    self.道具网格.子控件[i]._spr.命令附加 = 取可用道具(data[i].名称)
                end
            end
        elseif lx =='法宝' then
            if data[i] then 
                if(取可用法宝(data[i].名称) == 0 or not 可用门派(data[i].名称, 多开数据[当前].__UI界面.界面层.战斗界面.参战单位[ 多开数据[当前].__UI界面.界面层.战斗界面.单位编号[ 多开数据[当前].__UI界面.界面层.战斗界面.操作对象]].门派))  then
                    self.道具网格.子控件[i]._spr.物品禁止 = true
                else
                    self.道具网格.子控件[i]._spr.命令附加 = 取可用法宝(data[i].名称)
                end
            end
        end
    end
    self.选中 = nil
end
local 关闭 = 战斗道具:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",318,0)

function 关闭:左键弹起(x,y,msg)
     多开数据[当前].__UI界面.窗口层.战斗道具:置可见(false)
     多开数据[当前].__UI界面.界面层.战斗界面:重置()
     多开数据[当前].__UI界面.界面层.战斗界面:置可见(true)
end

local 道具网格 = 战斗道具:创建网格("道具网格",20,72,318,252)

function 道具网格:初始化()
    self:创建格子(55,55,10,10,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if 战斗道具.选中 then
        self.子控件[战斗道具.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and not self.子控件[a]._spr.物品禁止 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(190,86,w,h)
        self.子控件[a]._spr.确定 = true
        战斗道具.选中 = a
    end
end

local 使用按钮 = 战斗道具:创建我的按钮(__res:getPNGCC(2,493,765,118,35,true),"使用按钮",210,330,"使用")

function 使用按钮:左键弹起(x,y,msg)
    if 战斗道具.选中 and 战斗道具.道具网格.子控件[战斗道具.选中]._spr.命令附加 ~= 0 then
         多开数据[当前].__UI界面.界面层.战斗界面:设置道具参数(战斗道具.选中,战斗道具.道具网格.子控件[战斗道具.选中]._spr.命令附加)
    end
end