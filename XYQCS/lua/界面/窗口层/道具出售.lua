--[[
    @Author       : GGELUA
    @Date         : 2022-04-08 10:57:22
Last Modified by: GGELUA
Last Modified time: 2023-07-30 21:33:33
--]]
local 道具出售 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("道具出售",0,0,374,508)
local 当前 = 多开数据.当前
function 道具出售:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(374,508)
    if nsf:渲染开始() then
        置窗口背景("道具出售",0,12,362,495,true):显示(0,0)
        取灰色背景(0,0,340,280,true):显示(15,50)
        local lssj = 取输入背景(0,0,130,23)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('银       子：'):显示(70,350)
        lssj:显示(170,348)
        字体18:取图像('储       备：'):显示(70,375)
        lssj:显示(170,373)
        字体18:取图像('回收价格：'):显示(70,400)
        lssj:显示(170,398)
        字体18:取图像('数       量：'):显示(70,423)
        取输入背景(0,0,60,23):显示(170,423)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 道具出售:打开(数据,mc,lx,dj)
    self.数据 = 数据
    self.银子 = 数据.银子
    self.储备 = 数据.储备
    self.数量输入:置数值(1)
    self:置可见(true)
    self:重置()
end

function 道具出售:刷新(数据,mc,lx,dj)
    self.数据 = 数据
    self.银子 = 数据.银子
    self.储备 = 数据.储备
    self.数量输入:置数值(1)
    self:重置()
end

function 道具出售:重置()
    local nsf = require('SDL.图像')(374,508)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('浅黑'))
        字体18:取图像(self.银子):显示(175,350)
        字体18:取图像(self.储备):显示(175,375)
        nsf:渲染结束()
    end
    self:刷新金额显示()
    self.图像 = nsf:到精灵()
    self.道具网格:置物品(__主控.道具列表)
    self.选中类型 = "道具"
    
end

local 道具网格 = 道具出售:创建网格("道具网格",20,60,326,260)

function 道具网格:初始化()
    self:创建格子(55,55,14,13,4,5)
end

function 道具出售:刷新金额显示()
    local nsf = require('SDL.图像')(374,508)
    if nsf:渲染开始() then
        if  道具出售.选中 and self.数据.道具[道具出售.选中] then
            字体18:置颜色(__取颜色('浅黑'))
            字体18:取图像(self.银子):显示(175,350)
            字体18:取图像(self.储备):显示(175,375)
            字体18:取图像(self.数据.道具[道具出售.选中].回收价格):显示(175,400)
            self.数量输入:置数值(self.数据.道具[道具出售.选中].数量 or 1)
        end
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if  道具出售.选中 and  self.子控件[道具出售.选中]._spr.物品 then
        self.子控件[道具出售.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and  self.子控件[a]._spr.物品  then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        self.子控件[a]._spr:详情打开(520,86,w,h)
        self.子控件[a]._spr.确定 = true
        道具出售.选中 = a
        道具出售:刷新金额显示()
    end

end

function 道具网格:置物品(数据,bh)
    if not bh then
        for i = 1,#道具网格.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i],"道具出售")
            道具网格.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据,"道具出售")
        道具网格.子控件[bh]:置精灵(lssj)
    end
end

local 关闭 = 道具出售:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",326,0)

function 关闭:左键弹起(x,y,msg)
    道具出售:置可见(false)
end

local 数量输入 = 道具出售:创建我的输入("数量输入",190,425,50,24,2,2,'黑色')

for i, v in ipairs {
    {name = "确定按钮", x = 35 ,y = 450 , tcp = __res:getPNGCC(3,2,507,124,41):拉伸(123,41) , font = '确定出售'},
    {name = "一键出售", x = 175 ,y = 450 , tcp = __res:getPNGCC(3,2,507,124,41):拉伸(123,41) , font = '一键出售'},
} do
    local 临时函数 = 道具出售:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == "确定按钮" then
            if 道具出售.选中 == nil then
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请先选中需要操作的物品')
                return
            elseif type(道具出售.数据.道具[道具出售.选中].回收价格) == "string" then
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y该物品无法出售，请重新选择')
                return
            end
            if 道具出售.选中 and 道具出售.数量输入:取数值() then
                发送数据(当前 or self and self.当前,3763,{
                    物品 = 道具出售.选中,
                    数量 = 道具出售.数量输入:取数值(),
                    类型 = "道具"
                })
                道具出售.选中 = nil
            end
        elseif v.name == "一键出售" then
            发送数据(当前 or self and self.当前,3764)
        end
    end
end