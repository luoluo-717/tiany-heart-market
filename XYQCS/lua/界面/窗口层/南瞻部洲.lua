local 南瞻部洲 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("南瞻部洲",0,0,800,560)
local 当前 = 多开数据.当前
function 南瞻部洲:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(800,560)
    if nsf:渲染开始() then
        -- 取黑色背景(0,0,660,500,true):显示(0,0)
        -- __res:取图像(__res:取地址('shape/ui/xz/',0x0B19A5DC)):显示(10,10)
         __res:getPNGCC(10, 0, 0, 800, 560):显示(5,5)

    end
    self:置精灵(nsf:到精灵())
end

function 南瞻部洲:打开(id)
    self:置可见(true)
end

-- local 小西天 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xEA60ABA4),"小西天",61,80) --小西天 A
local 小西天 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A828),"小西天",95,72) --小西天 A

function 小西天:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1203,true)
    南瞻部洲:置可见(false)
end

-- local 墨家村 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF617F5A9),"墨家村",165,26) --墨家村 A
local 墨家村 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A826),"墨家村",220,108) --墨家村 A

function 墨家村:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1218,true)
    南瞻部洲:置可见(false)
end

-- local 无名鬼蜮 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x5B96A2DD),"无名鬼蜮",284,28) --无名鬼蜮 A
local 无名鬼蜮 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A830),"无名鬼蜮",355,42) --无名鬼蜮 A

function 无名鬼蜮:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1202,true)
    南瞻部洲:置可见(false)
end

-- local 魔王寨 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x150B5122),"魔王寨",199,104) --魔王寨 A
local 魔王寨 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A825),"魔王寨",157,177) --魔王寨 A

function 魔王寨:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1512,true)
    南瞻部洲:置可见(false)
end

-- local 阴曹地府 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x9C992236),"阴曹地府",342,44) --阴曹地府 A
local 阴曹地府 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A829),"阴曹地府",288,60) --阴曹地府 A

function 阴曹地府:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1122,true)
    南瞻部洲:置可见(false)
end

-- local 江州 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x991B588D),"江州",360,124) --江州 A
local 江州 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A832),"江州",462,133) --江州 A

function 江州:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1110,true)
    南瞻部洲:置可见(false)
end

-- local 洪州 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x6EA52AE1),"洪州",306,139) --洪州 A
local 青丘 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A813),"青丘",394,193) --青丘 A

function 青丘:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1284,true)
    南瞻部洲:置可见(false)
end

-- local 大唐官府 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xE0C66A6F),"大唐官府",461,111) --大唐官府 A
local 大唐官府 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A809),"大唐官府",552,132) --大唐官府 A

function 大唐官府:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1198,true)
    南瞻部洲:置可见(false)
end

-- local 狮驼岭 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xBF78C1EF),"狮驼岭",14,195) --狮驼岭 A
local 狮驼岭 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A824),"狮驼岭",80,220) --狮驼岭 A

function 狮驼岭:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1131,true)
    南瞻部洲:置可见(false)
end

-- local 高老庄 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xFF1D4A14),"高老庄",116,242) --高老庄 A
local 高老庄 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A815),"高老庄",237,285) --高老庄 A

function 高老庄:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1173,true)
    南瞻部洲:置可见(false)
end

-- local 盘丝洞 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x301A4FE7),"盘丝洞",223,204) --盘丝洞 A
local 盘丝洞 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A814),"盘丝洞",285,228) --盘丝洞 A

function 盘丝洞:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1513,true)
    南瞻部洲:置可见(false)
end

-- local 长安城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x71DF41E1),"长安城",376,150) --长安城 A
local 长安城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A812),"长安城",500,162) --长安城 A

function 长安城:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1001,true)
    南瞻部洲:置可见(false)
end

-- local 化生寺 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x47FE6497),"化生寺",488,168) --化生寺 A
local 化生寺 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A811),"化生寺",702,217) --化生寺 A

function 化生寺:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1002,true)
    南瞻部洲:置可见(false)
end

-- local 五庄观 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xCA26DE5D),"五庄观",242,280) --五庄观 A
local 五庄观 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A816),"五庄观",372,300) --五庄观 A

function 五庄观:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1146,true)
    南瞻部洲:置可见(false)
end

-- local 神木林 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xCAF25E94),"神木林",381,268) --神木林 A
local 神木林 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A817),"神木林",495,330) --神木林 A

function 神木林:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1138,true)
    南瞻部洲:置可见(false)
end

-- local 建邺城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0x6AB41A9A),"建邺城",480,241) --建邺城 A
local 建邺城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A818),"建邺城",607,292) --建邺城 A

function 建邺城:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1501,true)
    南瞻部洲:置可见(false)
end
-- local 凌波城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xBDAEEA53),"凌波城",382,324) --凌波城 A
local 凌波城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A821),"凌波城",557,394) --凌波城 A

function 凌波城:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1150,true)
    南瞻部洲:置可见(false)
end

-- local 普陀山 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xEC9EBCA8),"普陀山",342,421) --普陀山 A
local 普陀山 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A822),"普陀山",421,478) --普陀山 A

function 普陀山:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1140,true)
    南瞻部洲:置可见(false)
end

-- local 龙宫 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xAD1DC28A),"龙宫",480,384) --龙宫 A
local 龙宫 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A820),"龙宫",592,466) --龙宫 A

function 龙宫:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1116,true)
    南瞻部洲:置可见(false)
end
local 九黎城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A827),"九黎城",178,60) --九黎城 A

function 九黎城:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1580,true)
    南瞻部洲:置可见(false)
end
local 天机城 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A823),"天机城",243,368) --九黎城 A
function 天机城:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1250,true)
    南瞻部洲:置可见(false)
end

local 女魃墓 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A831),"女魃墓",426,79) --九黎城 A
function 女魃墓:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1249,true)
    南瞻部洲:置可见(false)
end
local 芙蓉园 = 南瞻部洲:创建我的was按钮(__res:取地址('shape/ui/xz/',0xF8A8A810),"芙蓉园",647,177) --九黎城 A
function 芙蓉园:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.小地图:打开(1359,true)
    南瞻部洲:置可见(false)
end

local 关闭 = 南瞻部洲:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",732,8)
function 关闭:左键弹起(x,y)
        多开数据[当前].__UI弹出.世界大地图:打开()

    南瞻部洲:置可见(false)
end