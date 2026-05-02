--[[
    @Author       : GGELUA
    @Date         : 2022-06-15 22:17:25
Last Modified by: GGELUA
Last Modified time: 2023-07-27 18:14:49
--]]
local 文字 = [[
    丹青生有一宝画，乃是上古流传下来的珍品，名曰《乾
坤九曜图》。此画中有雾楼云阁，亭台水榭，青山秀水，蕊
珠宫阙，只要轻轻将画卷展开，便可身临其境。各路神魔仙
怪因为厌倦尘世杀戮而隐居在此，再也不问时世。天帝命丹
青生将此画卷谨慎收藏，不再沾染红尘血腥。只可惜近日魔
神将要现世，画中诸雄无不感到了他的怨念与仇恨而杀意萌
动。他们忘却了修身养性的要诀，却没有忘记运用盖世的神
功手段来杀戮他们看到的一切……于是，丹青生手执画卷，
在此等待有缘的侠义之士，来化解他们的戾气。
]]
local 生死劫 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("生死劫",0,0,511,520)
local 当前 = 多开数据.当前
function 生死劫:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(511,520)
    if nsf:渲染开始() then
        置窗口背景("生死劫",0,12,503,502,true):显示(0,0)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像(文字):显示(21,60)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 生死劫:打开(内容)
    self:置可见(true)
    -- self.关卡=内容[1]
end

function 生死劫:刷新(内容)
    -- self.关卡=内容[1]
end

local 关闭 = 生死劫:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",461,0)

function 关闭:左键弹起(x,y,msg)
    生死劫:置可见(false)
end

for i, v in ipairs {
    {name = '止戈', x = 20 ,y = 359 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41) , font = '止戈'},
    {name = '清心', x = 195 ,y = 359 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '清心'},
    {name = '雷霆', x = 367 ,y = 359 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '雷霆'},
    {name = '惜花', x = 20 ,y = 410 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '惜花'},
    {name = '忘情', x = 195 ,y = 410 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '忘情'},
    {name = '卧龙', x = 367 ,y = 410 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '卧龙'},
    {name = '天象', x = 20 ,y = 461 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '天象'},
    {name = '轮回', x = 195 ,y = 461 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '轮回'},
    {name = '娑罗', x = 367 ,y = 461 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(114,41),  font = '娑罗'},
    
} do
    local 临时函数 = 生死劫:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)

        if v.name == "止戈" then
      发送数据(当前,1511)
    elseif v.name == "清心" then
      发送数据(当前,1512)
    elseif v.name == "雷霆" then
      发送数据(当前,1513)
    elseif v.name == "惜花" then
      发送数据(当前,1514)
    elseif v.name == "忘情" then
      发送数据(当前,1515)
    elseif v.name == "卧龙" then
      发送数据(当前,1516)
    elseif v.name == "天象" then
      发送数据(当前,1517)
    elseif v.name == "轮回" then
      发送数据(当前,1518)
    elseif v.name == "娑罗" then
      发送数据(当前,1519)
    end
        -- if 生死劫.关卡 < i then
        --    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/你尚未通关前面关卡！")
        -- elseif  生死劫.关卡 > i then
        --    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/你已经通关当前关卡挑战！")
        -- else
        --     local 事件 = function()
        --         发送数据(当前 or self and self.当前,72,{关卡=i})
        --     end
        --     local wb = "此图共有九关，坐镇的神魔仙怪各有传奇经历与神功手段，你确定准备好了吗?"   
        --     多开数据[当前].__UI界面.窗口层.文本栏:打开(wb,285,155,390,200,事件)
        -- end
        生死劫.关闭:左键弹起()
    end
end