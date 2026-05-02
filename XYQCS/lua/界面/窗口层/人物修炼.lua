--[[
    @Author       : GGELUA
    @Date         : 2022-05-09 09:23:28
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:20:11
--]]
local 人物修炼 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("人物修炼",0,0,485,365)
local 当前 = 多开数据.当前
local function 计算修炼等级经验(等级,上限)
    local 临时经验=110
   if 等级==0 then return 110 end
   for n=1,上限+1 do
       临时经验=临时经验+20+n*20
       if n==等级 then return  临时经验 end
   end
end

function 人物修炼:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(485,365)
    if nsf:渲染开始() then
        置窗口背景("人物修炼",0,12,477,356,true):显示(0,0)
        取白色背景(0,0,450,175,true):显示(16,43)
        local lssj = 取输入背景(0,0,123,23)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('帮派现有资金'):显示(15,237)
        lssj:显示(133,235)
        字体18:取图像('现金'):显示(274,237)
        lssj:显示(320,235)
        字体18:取图像('修炼所需金钱'):显示(15,273)
        lssj:显示(133,271)
        字体18:取图像('帮贡'):显示(274,273)
        lssj:显示(320,271)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 人物修炼:打开(data)
    self:置可见(true)
    self:重置(data)
    self.选中 = nil
end

function 人物修炼:重置(data)
    self.数据 = data
    self.免资材=data.免资材
    local nsf = require('SDL.图像')(477,70)
    if nsf:渲染开始() then
        local lssj = 取输入背景(0,0,123,23)
        字体18:置颜色(__取颜色('浅黑'))
        字体18:取图像(self.数据.帮派资材 or 0):显示(143,7)
        字体18:取图像(self.数据.银子):显示(330,7)
        字体18:取图像('20000'):显示(143,42)
        字体18:取图像('5'):显示(330,42)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.图像:置中心(0,-227)
    self.修炼列表:重置(self.数据.人物修 or self.数据.修炼)
end

local 关闭 = 人物修炼:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",435,0)

function 关闭:左键弹起(x,y,msg)
    人物修炼:置可见(false)
end

local 修炼列表 = 人物修炼:创建列表("修炼列表",22,50,436,161)

function 修炼列表:初始化()
    self:置文字(字体20)
    self.行高度 = 32
    self.行间距 = 0
end
local lsb = {'攻击修炼','防御修炼','法术修炼','抗法修炼','猎术修炼'}
function 修炼列表:重置(data)
    self:清空()
    for _, v in ipairs(lsb) do
        local nsf = require('SDL.图像')(436,32)
        if nsf:渲染开始() then
            if _%2 == 1 then
                --nsf:填充颜色(167,164,199,255)
            end
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v..'      等级：'..data[v][1]..'/'..data[v][3]..'      修炼经验'..data[v][2]..'/'..计算修炼等级经验(data[v][1],data[v][3])):显示(44,7)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
    修炼列表:置选中(人物修炼.选中)
end

function 修炼列表:左键弹起(x, y, i, item, msg)
    人物修炼.选中 = i
end

local 修炼 = 人物修炼:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"修炼",100,305,"修炼")
function 修炼:左键弹起(x,y,msg)
    if 人物修炼.选中 then
        发送数据(当前 or self and self.当前,44,{类型="人物修炼",免资材=人物修炼.免资材,修炼项目=lsb[人物修炼.选中],次数=1})
    else
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择你要修炼的项目')
    end
end

local 修炼十次 = 人物修炼:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"修炼十次",230,305,"修炼十次")
function 修炼十次:左键弹起(x,y,msg)
    if 人物修炼.选中 then
        发送数据(当前 or self and self.当前,44,{类型="人物修炼",免资材=人物修炼.免资材,修炼项目=lsb[人物修炼.选中],次数=10})
    else
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择你要修炼的项目')
    end
end