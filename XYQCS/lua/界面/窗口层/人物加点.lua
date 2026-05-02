-- local 人物加点 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("人物加点",0,0,737,480)
-- local 当前 = 多开数据.当前
-- local lsb = {
--   "体质",
--   "魔力",
--   "力量",
--   "耐力",
--   "敏捷"
-- }
-- local lsb2 = {
--   "命中",
--   "伤害",
--   "防御",
--   "速度",
--   "法伤",
--   "法防"
-- }
-- local lssx = {
--   ["体质"] = 0,
--   ["魔力"] = 0,
--   ["力量"] = 0,
--   ["耐力"] = 0,
--   ["敏捷"] = 0,
-- }
-- function 人物加点:初始化()
--   local nsf = require("SDL.图像")(730, 480)
--   if nsf["渲染开始"](nsf) then
--     置窗口背景("人物加点", 0, 12, 730, 445, true):显示(0, 0)
--     取属性背景(0, 0, 225, 300, true)["显示"](取属性背景(0, 0, 225, 300, true), 15, 75)
--     local lssj = 取输入背景(0, 0, 138, 23)
--     字体18["置颜色"](字体18, 255, 255, 255)
--     for i = 1, #lsb2 do
--       lssj["显示"](lssj, 88, 100 + (i - 1) * 44)
--       字体18["取图像"](字体18, lsb2[i])["显示"](字体18["取图像"](字体18, lsb2[i]), 33, 100 + (i - 1) * 44)
--     end
--     lssj = __res:getPNGCC(1, 239, 339, 252, 17)
--     for i = 1, #lsb do
--       lssj["显示"](lssj, 353, 80 + (i - 1) * 68)
--       字体18["取图像"](字体18, lsb[i])["显示"](字体18["取图像"](字体18, lsb[i]), 264, 78 + (i - 1) * 68)
--     end
--     字体18:取图像("1点一次"):显示(29+40+ (1 - 1) * 165, 406)
--     字体18:取图像("50点一次"):显示(29+40+ (2 - 1) * 165, 406)
--     字体18:取图像("潜能"):显示(29+80+126+ (2 - 1) * 165, 406)
--     nsf["渲染结束"](nsf)
--   end
--   self:置精灵(nsf["到精灵"](nsf))
-- end
-- function 人物加点:显示(x, y)
--     字体18:置颜色(绿色)
--   for i = 1, #lsb do
--     if 0 ~= lssx[lsb[i]] then
--       字体18["显示"](字体18, x + 644, y + 81 + (i - 1) * 68, 多开数据[当前 or self and self.当前].角色信息[lsb[i]] .. "+" .. lssx[lsb[i]])
--     else
--       字体18["显示"](字体18, x + 644, y + 81 + (i - 1) * 68, 多开数据[当前 or self and self.当前].角色信息[lsb[i]])
--     end
--   end
  
--   字体18["显示"](字体18, x + 445, y + 406, 多开数据[当前 or self and self.当前].角色信息["潜力"])
--   if self.数据 then
--     self.数据["显示"](self.数据, x, y)
--   end
-- end
-- function 人物加点:重置()
--   for i = 1, #lsb do
--     人物加点[lsb[i] .. "条"]["置位置"](人物加点[lsb[i] .. "条"], math.floor(多开数据[当前 or self and self.当前].角色信息[lsb[i]] / 1200 * 100))
--   end
--   lssx = {
--     ["体质"] = 0,
--     ["魔力"] = 0,
--     ["力量"] = 0,
--     ["耐力"] = 0,
--     ["敏捷"] = 0,
--   }
--   local nsf = require("SDL.图像")(240, 340)
--   if nsf["渲染开始"](nsf) then
--     for i = 1, #lsb2 do
--       字体18["置颜色"](字体18, 39, 53, 81)
--       字体18["取图像"](字体18, 多开数据[当前 or self and self.当前].角色信息[lsb2[i]])["显示"](字体18["取图像"](字体18, 多开数据[当前 or self and self.当前].角色信息[lsb2[i]]), 100, 104 + (i - 1) * 44)
--     end
--     nsf["渲染结束"](nsf)
--   end
--   self.剩余潜力=多开数据[当前 or self and self.当前].角色信息["潜力"]
--   self.数据 = nsf["到精灵"](nsf)
-- end
-- function 人物加点:打开()
--   self:置可见(true)
--   self.一点一次按钮:置选中(true)
--   self.加点模式=1
--   人物加点["重置"](人物加点)
-- end



-- local sdsawe={"一点一次","五十点一次"}
-- for i = 1, #sdsawe do
--   local 临时函数 = 人物加点["创建我的单选按钮"](人物加点, __res:getPNGCC(2, 1172, 106, 27, 27, true), __res:getPNGCC(2, 1171, 74, 27, 27, true), sdsawe[i] .. "按钮", 31+ (i - 1) * 165, 401 )
--   function  临时函数:左键弹起(x, y)
--     if sdsawe[i] == "一点一次" then
--       人物加点.加点模式=1
--     elseif sdsawe[i] == "五十点一次" then
--       人物加点.加点模式=50
--     end
--   end
-- end




-- local 关闭 = 人物加点["创建我的按钮"](人物加点, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 690, 0)
-- function 关闭:左键弹起(x, y, msg)
--   人物加点["置可见"](人物加点, false)
-- end
-- for i = 1, #lsb do
--   local 临时函数 = 人物加点["创建进度"](人物加点, lsb[i] .. "条", 354, 81 + (i - 1) * 68, 250, 16)
--   local lssj = __res:getPNGCC(1, 401, 145, 305, 16)["拉伸"](__res:getPNGCC(1, 401, 145, 305, 16), 250, 16)["到精灵"]((__res:getPNGCC(1, 401, 145, 305, 16)["拉伸"](__res:getPNGCC(1, 401, 145, 305, 16), 250, 16)))
--   function  临时函数:初始化()
--     self:置精灵(lssj)
--   end
--   local 临时函数2 = 人物加点["创建我的按钮"](人物加点, __res:getPNGCC(1, 641, 320, 29, 29), lsb[i] .. "加", 612, 74 + (i - 1) * 68)
--   function  临时函数2:左键弹起(x, y, msg)
--     if 人物加点.剩余潜力 > 0 then
--       local 取剩余=人物加点.剩余潜力-人物加点.加点模式
--       if 取剩余<=0 then
--         取剩余=人物加点.剩余潜力
--       else 
--         取剩余=人物加点.加点模式
--       end
--       -- print(取剩余)
--       lssx[lsb[i]] = lssx[lsb[i]] + 取剩余
--       人物加点.剩余潜力 = 人物加点.剩余潜力 - 取剩余
--       -- 人物加点[lsb[i] .. "条"]["置位置"](人物加点[lsb[i] .. "条"], math.floor(角色信息[lsb[i]] / 1200 * 100))
--     end
--   end
--   local 临时函数3 = 人物加点["创建我的按钮"](人物加点, __res:getPNGCC(1, 601, 319, 29, 29), lsb[i] .. "减", 320, 74 + (i - 1) * 68)
--   function  临时函数3:左键弹起(x, y, msg)
--     if lssx[lsb[i]] > 0 then
--       local 取剩余=lssx[lsb[i]]-人物加点.加点模式
--       if 取剩余<=0 then
--         取剩余=lssx[lsb[i]]
--       else 
--         取剩余=人物加点.加点模式
--       end
--       lssx[lsb[i]] = lssx[lsb[i]] - 取剩余
--       人物加点.剩余潜力 = 人物加点.剩余潜力 + 取剩余
--       -- 人物加点[lsb[i] .. "条"]["置位置"](人物加点[lsb[i] .. "条"], math.floor(角色信息[lsb[i]] / 1200 * 100))
--     end
--   end
-- end
-- local 确认加点 = 人物加点["创建我的按钮"](人物加点, __res:getPNGCC(3, 2, 507, 124, 41, true), "确认加点", 590, 400, "确认加点")
-- function 确认加点:左键弹起(x, y, msg)
--   发送数据(当前,8, lssx)
--   人物加点["置可见"](人物加点, false)
-- end






















local 人物加点 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("人物加点",0,0,737,480)
local 当前 = 多开数据.当前
local lsb = {"体质","魔力","力量","耐力","敏捷"}
local lsb2 = {"命中","伤害","防御","速度","法伤","法防"}
local lssx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0,潜能=0}
local 原始属性 = {}
local 原始潜能 = 0

function 人物加点:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(730,480)
    if nsf:渲染开始() then
        置窗口背景("人物加点",0,12,730,465,true):显示(0,0)
        取属性背景(0,0,225,300,true):显示(15,75)
        local lssj = 取输入背景(0,0,138,23)
        字体18:置颜色(__取颜色(白色))
        for i=1,#lsb2 do
            lssj:显示(88,100+((i-1)*44))
            字体18:取图像(lsb2[i]):显示(33,100+((i-1)*44))
        end
        lssj = __res:getPNGCC(1,239,339,252,17)
        for i=1,#lsb do
            lssj:显示(353,80+((i-1)*68))
            字体18:取图像(lsb[i]):显示(264,78+((i-1)*68))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 人物加点:显示(x,y)
    字体18:置颜色(__取颜色(白色))
    for i=1,#lsb do
        if lssx[lsb[i]] ~= 0 then
            字体18:显示(x+644,y+81+((i-1)*68),多开数据[当前 or self and self.当前].角色信息[lsb[i]].."+"..lssx[lsb[i]])
        else
            字体18:显示(x+644,y+81+((i-1)*68),多开数据[当前 or self and self.当前].角色信息[lsb[i]])
        end
    end
    字体18:显示(x+363,y+430,"潜能 "..多开数据[当前 or self and self.当前].角色信息.潜力)
    if self.数据 then
        self.数据:显示(x,y)
    end
end

function 人物加点:重置()
    -- 保存原始数据
    for i=1,#lsb do
        原始属性[lsb[i]] = 多开数据[当前 or self and self.当前].角色信息[lsb[i]]
    end
    原始潜能 = 多开数据[当前 or self and self.当前].角色信息.潜力
    -- 重置临时加点数据
    lssx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0,潜能=0}
    -- 重置进度条位置
    for i=1,#lsb do
        人物加点[lsb[i].."条"]:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息[lsb[i]]/1200*100))
    end
    
    -- 重置滑块位置为0
    for i=1,#lsb do
        人物加点[lsb[i].."滑块"]:置位置(0)
        if 人物加点[lsb[i].."滑块"].上次位置 then
            人物加点[lsb[i].."滑块"].上次位置 = 0
        end
    end
    
    local nsf = require('SDL.图像')(240,340)
    if nsf:渲染开始() then
        for i=1,#lsb2 do
            字体18:置颜色(39,53,81)
            字体18:取图像(多开数据[当前 or self and self.当前].角色信息[lsb2[i]]):显示(100,104+((i-1)*44))
        end
        nsf:渲染结束()
    end
    self.数据 = nsf:到精灵()
end

function 人物加点:打开()
    self:置可见(true)
    self:重置最大值()
    人物加点:重置()
    
end

local 关闭 = 人物加点:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",690,0)


function 关闭:左键弹起(x,y,msg)
  for i=1,#lsb do
        多开数据[当前].角色信息[lsb[i]] = 原始属性[lsb[i]]
    end
    多开数据[当前].角色信息.潜力 = 原始潜能
    人物加点:重置() -- 重置数据
    人物加点:置可见(false)
end

for i=1,#lsb do
    local 临时函数 = 人物加点:创建进度(lsb[i].."条",354,81+((i-1)*68),250,16)
    local lssj = __res:getPNGCC(1,401,145,305,16):拉伸(250,16):到精灵()
    function 临时函数:初始化()
        self:置精灵(lssj)
    end
    local 临时函数2 = 人物加点:创建我的按钮(__res:getPNGCC(1,641,320,29,29),lsb[i].."加",612,74+((i-1)*68))

    function 临时函数2:左键弹起(x,y,msg)
        if 多开数据[当前 or self and self.当前].角色信息.潜力 > 0 then
            lssx[lsb[i]] = lssx[lsb[i]] + 1
            lssx.潜能 = lssx.潜能 +1
            多开数据[当前 or self and self.当前].角色信息.潜力 = 多开数据[当前 or self and self.当前].角色信息.潜力 - 1
            人物加点[lsb[i].."条"]:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息[lsb[i]]/1200*100))
            人物加点[lsb[i].."滑块"]:置位置(lssx[lsb[i]])
            人物加点[lsb[i].."滑块"].上次位置 = 人物加点[lsb[i].."滑块"].位置
            人物加点:重置限制最大值()
        end
        人物加点.连点开始 = nil
    end

    function 临时函数2:左键按下(x,y,msg)
        -- 人物加点.连点开始 = {os.time(),i}
    end

    local 临时函数3 = 人物加点:创建我的按钮(__res:getPNGCC(1,601,319,29,29),lsb[i].."减",320,74+((i-1)*68))
    function 临时函数3:左键弹起(x,y,msg)
        if lssx[lsb[i]] > 0 then
            lssx[lsb[i]] = lssx[lsb[i]] - 1
            lssx.潜能 = lssx.潜能 - 1
            多开数据[当前 or self and self.当前].角色信息.潜力 = 多开数据[当前 or self and self.当前].角色信息.潜力 + 1
            人物加点[lsb[i].."条"]:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息[lsb[i]]/1200*100))
            人物加点[lsb[i].."滑块"]:置位置(lssx[lsb[i]])
            人物加点[lsb[i].."滑块"].上次位置 = 人物加点[lsb[i].."滑块"].位置
            人物加点:重置限制最大值()
        end
    end
end

local 确认加点 = 人物加点:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true),"确认加点",590,420,"确认加点")

function 确认加点:左键弹起(x,y,msg)
    发送数据(当前 or self and self.当前,8,lssx)
    人物加点:重置() -- 重置数据
    人物加点:置可见(false)
end

function 人物加点:重置最大值(v)
    for x,_ in ipairs(lsb) do
        人物加点[_.."滑块"]:置最大值(多开数据[当前 or self and self.当前].角色信息.潜力)
    end
end

function 人物加点:重置限制最大值(v)
    for x,_ in ipairs(lsb) do
        if _  ~= v then
            self[_.."滑块"].限制最大值 =  多开数据[当前 or self and self.当前].角色信息.潜力 + 人物加点[_.."滑块"].位置
        end
    end
end

for i,v in ipairs(lsb) do
    local 临时滑块 = 人物加点:创建水平滚动条(v.."滑块",350,35+i*67,250,30)
    function 临时滑块:初始化()
        self.上次位置 = 0
        self.限制最大值 = 0
    end
    function 临时滑块:滚动事件(x, y, x)
        if self.上次位置 > x  then
            lssx[lsb[i]] = lssx[lsb[i]] - (self.上次位置-x)
            lssx.潜能 = lssx.潜能 -(self.上次位置-x)
            多开数据[当前 or self and self.当前].角色信息.潜力 = 多开数据[当前 or self and self.当前].角色信息.潜力 + (self.上次位置-x)
        elseif self.上次位置 < x  then
            lssx[lsb[i]] = lssx[lsb[i]] + (x - self.上次位置)
            lssx.潜能 = lssx.潜能 + (x - self.上次位置)
            多开数据[当前 or self and self.当前].角色信息.潜力 = 多开数据[当前 or self and self.当前].角色信息.潜力 - (x - self.上次位置)
        end
        self.上次位置 = x
        人物加点:重置限制最大值(v)
    end
end