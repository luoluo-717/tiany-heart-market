local SDLF = require('SDL.函数')
 local 左上角 = 多开数据[多开数据.当前].__UI界面.界面层:创建控件("左上角", 10, 0, 500, 250)
 local 当前 = 多开数据.当前 
local lssj = { "子时", "丑时", "寅时", "卯时", "辰时", "巳时", "午时", "未时", "申时", "酉时", "戌时", "亥时" }
local 快捷按钮组 = {
    {name = "活动",x = 12,y = 9,tcp = __res:getPNGCC(2, 889, 122, 42, 52)},
    {name = "藏宝阁",x = 60,y = 7,tcp = __res:getPNGCC(2, 1118, 63, 48, 52)},
    {name = "赞助",x = 108,y = 9,tcp = __res:getPNGCC(2, 1000, 63, 59, 52)},
    {name = "排行榜",x = 159,y = 11,tcp = __res:getPNGCC(2, 1050, 122, 60, 52)},
    {name = "助战",x = 225,y = 10,tcp = __res:取图像(__res:取地址('shape/pic/', 0xacac0001))}, 
    {name = "抽奖",x = 265,y = 10,tcp =  __res:取图片("shape/pic/duobao.png")}, 
    {name = "BOSS",x = 313,y = 8,tcp =  __res:取图片("shape/pic/BOSS.png")}, 
    {name = "称号",x = 9,y = 68,tcp = __res:取图像(__res:取地址('shape/pic/', 0xBBBAAA01))}, 
    {name = "阵法系统",x = 9+55,y = 68,tcp =  __res:取图像(__res:取地址('shape/pic/', 0xA9000005))},
    {name = "巅峰赛",x = 9+55+55,y = 68+3,tcp =  __res:取图像(__res:取地址('shape/ui/', 0xAC000001))},
    {name = "武神坛",x = 9+55+55*2,y = 68+3,tcp =  __res:取图像(__res:取地址('shape/ui/', 0xC4817300))},
    {name = "千变万化",x = 9+55+55*3,y = 68+3,tcp =  __res:取图像(__res:取地址('shape/ui/', 0x17F4C25F))},
 
}

function 左上角:初始化()
    self.小人 = __res:取动画(__res:取地址('shape/ui/', 0xAC307575)):取动画(1):播放(true)
    self.白昼 = __res:取图像(__res:取地址('shape/ui/', 0x9DF6DEBC)):拉伸(360, 40):到精灵():置区域(100, 0, 44, 40)
    self.黑夜 = __res:取图像(__res:取地址('shape/ui/', 0x99738f4c)):拉伸(360, 40):到精灵():置区域(100, 0, 44, 40)
    self.时辰 = 1
    self.日夜 = "天黑了"
    self.电池外框 = __res:getPNGCC(2, 1107, 18, 22, 12):到精灵()
    self.序列=1
    --self.计时 = 1
    --self.计次 = 0
end
function 左上角:重置()
    local nsf = require('SDL.图像')(165,75)
        if nsf:渲染开始() then
            -- if 引擎.P平台~='电脑' then
             --__res:取图像(self.UI底图):置拉伸(540,62):显示(0,0)
            -- else
            self.背景:显示(0,0)
            -- end
            nsf:渲染结束()
        end
        self:置精灵(nsf:到精灵())
end

function 左上角:显示(x, y)
    if self.日夜 == "天黑了" then
        self.黑夜:显示(x + 15, y + 23)
    else
        self.白昼:显示(x + 15, y + 23)
    end
    字体14:显示(x + 66, y + 0, os.date("%H:%M:%S", os.time()))
    self.电池外框:显示(x + 144, y + 1)
    if self.电池 then
        self.电池:显示(x + 145, y + 2)
    end
end
local 退出观战 = 左上角:创建我的按钮(__res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(100,35), "退出观战", 300, 15, "退出观战")
function 退出观战:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前, 5520)
end
local 首冲按钮 = 左上角:创建我的按钮(__res:取图片("shape/pic/sc.png"), "首冲按钮", 235, 2)
function 首冲按钮:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前,200.1)
end

local 挂机按钮 = 左上角:创建我的按钮(__res:取图像(__res:取地址("shape/ui/xz/", 0x0D000021)), "挂机按钮", 180, 15)
function 挂机按钮:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前, 550)
end

local 左关闭 = 左上角:创建我的按钮(__res:getPNGCC(2, 1138, 475, 31, 64), "左关闭", 380, 90)
-- local 左关闭 = 左上角:创建我的按钮(__res:getPNGCC(1, 750, 313, 35, 64), "左关闭", 390, 90)--新春

function 左关闭:左键弹起(x, y, msg)
    if 左上角.功能栏.是否可见 then
        左上角.功能栏:置可见(false)
        self:置坐标(10, 90)
    else
        左上角.功能栏:置可见(true)
        self:置坐标(390, 90)
    end
end
local 时辰按钮 = 左上角:创建我的按钮(__res:getPNGCC(2, 893, 402, 172, 68), "时辰按钮", 0, 2)
-- local 时辰按钮 = 左上角:创建我的按钮(__res:getPNGCC(1, 3, 270, 172, 68), "时辰按钮", 0, 2)--新春

function 时辰按钮:更新(dt)
    左上角.小人:更新(dt)
end
function 时辰按钮:显示(x, y)
    if self.时辰 then
        self.时辰:显示(x, y)
    end
    字体166:显示(x + 80, y + 45,
        string.format("(%s,%s)", math.floor(多开数据[当前 or self and self.当前].角色信息.坐标.x / 20),
            math.floor(多开数据[当前 or self and self.当前].角色信息.坐标.y / 20)))
    左上角.小人:显示(x + 33, y + 54)
end

function 时辰按钮:重置(数据)
    if 数据==1 then
        左上角.日夜 = "天黑了"
    elseif 数据==2 then
        左上角.日夜 = "天亮了"
    end
    local nsf = require('SDL.图像')(360, 460)
    if nsf:渲染开始() then
        字体18:置颜色(59, 10, 1)
        字体18:取图像(取地图名称(多开数据[当前 or self and self.当前].角色信息.地图数据.编号)):显示(73, 18)
        字体14:置颜色(255, 255, 255)
        字体14:取描边图像(lssj[左上角.序列], 59, 10, 1, 255):显示(15, 3)
        nsf:渲染结束()
        if type(数据) == "number" and 数据 >=1 and 数据 <=12 then
            左上角.时辰 = 数据
        end
    end
    self.时辰 = nsf:到精灵()
    local zt, dl = SDLF.取电源信息()
    if zt == '充电中' or zt == '已充满' or zt == '使用电池' then
        local nsf = require('SDL.图像')(20, 10)
        if nsf:渲染开始() then
            dl = math.floor(20 * dl / 100)
            local qs = 20 - dl
            __res:getPNGCC(2, 1109, 31, 20, 10):置区域(qs, 0, dl, 10):显示(qs, 0)
            字体8:置颜色(__取颜色('红色'))
            if zt == '充电中' then
                字体8:取图像('z'):显示(9, -5)
            elseif zt == '已充满' then
                字体8:取图像('='):显示(9, -5)
            end
            nsf:渲染结束()
        end
        左上角.电池 = nsf:到精灵()
    end
end

function 时辰按钮:左键弹起(x, y, msg)
    if not 多开数据[当前].__主控.战斗中 then
        多开数据[当前].__UI界面.窗口层.小地图:打开(多开数据[当前 or self and self.当前].角色信息.地图数据.编号)
    end
end

local 功能栏 = 左上角:创建控件("功能栏", 0, 85, 500, 130)
function 功能栏:初始化()
    self:置精灵(__res:getPNGCC(2, 230, 964, 402, 51):拉伸(385, 130):到精灵())
end

for i, v in ipairs(快捷按钮组)  do
    local 临时函数 = 功能栏:创建我的按钮(v.tcp, v.name, v.x, v.y)
    function 临时函数:左键弹起(x, y)
        if not 多开数据[当前].__主控.战斗中 then
            if v.name == "功能" then
                -- 发送数据(当前 or self and self.当前, 29)
                多开数据[当前].__UI界面.窗口层.功能界面:置可见(true)
            elseif  v.name=='排行榜' then      
            发送数据(当前 or self and self.当前,39)
            elseif v.name == "赞助" then
             发送数据(当前 or self and self.当前,207,{显示类=1})
            elseif v.name == "抽奖" then
       			发送数据(当前 or self and self.当前,300)
            elseif v.name == "藏宝阁" then
             发送数据(当前 or self and self.当前,65.1)
            elseif v.name == "活动" then
                发送数据(当前 or self and self.当前, 66)
            
            elseif v.name == "阵法系统" then
       				发送数据(当前 or self and self.当前,6589)
            elseif v.name == "助战" then
                -- 多开数据[当前].__UI界面.窗口层.助战创建:打开()
                发送数据(当前 or self and self.当前,2001)
            elseif v.name == "称号" then
                if 多开数据[当前].__UI界面.窗口层.简单_称号系统.是否可见 then
                    多开数据[当前].__UI界面.窗口层.简单_称号系统:置可见(false)
                else
                    发送数据(当前 or self and self.当前,194,{序号1=1})
                end

            elseif v.name == "BOSS" then
                	发送数据(当前 or self and self.当前,101)
                elseif v.name == "巅峰赛" then
                    发送数据(当前 or self and self.当前,263)
                elseif v.name == "武神坛" then
                    发送数据(当前 or self and self.当前,200)

                elseif v.name == "千变万化" then
              多开数据[当前].__UI界面.窗口层.千变万化主界面:打开(内容)
            end
        end
    end
end    



