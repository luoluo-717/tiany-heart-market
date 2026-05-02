local 御兽术 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("御兽术",0,0,485,365)
local 当前 = 多开数据.当前

function 御兽术:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(485,365)
    if nsf:渲染开始() then
        置窗口背景("御兽术",0,12,477,356,true):显示(0,0)
        取白色背景(0,0,450,175,true):显示(16,43)
        local lssj = 取输入背景(0,0,123,23)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('需要经验'):显示(15,237)
        lssj:显示(133,235)
        字体18:取图像('需要仙玉'):显示(15,273)
        lssj:显示(133,271)
        字体18:取图像('需要副本积分'):显示(15,273+36)
        lssj:显示(133,271+36)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 御兽术:打开(data)
    self:置可见(true)
    self:重置(data)
    self.上限=data.限制
    self.选中 = nil
end

function 御兽术:刷新(data)
    self.御兽术 = data.御兽术
    self.学习列表:重置(self.御兽术)
    self.上限=data.限制
    self:更新消耗显示()
end

function 御兽术:重置(data)
    self.数据 = data
    self.御兽术 = data.御兽术 or {}
    self.银子 = data.银子 or 0
    self.经验 = data.经验 or 0
    self.积分 = data.积分 or 0
    self.上限=data.限制
    local nsf = require('SDL.图像')(477,70)
    if nsf:渲染开始() then
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.图像:置中心(0,-227)
    self.学习列表:重置(self.御兽术)
end

function 御兽术:更新消耗显示()
    -- if self.选中 then
        local 当前等级 = self.御兽术[self.选中] or 0
        local 消耗经验 = self.经验 * (当前等级 + 1)
        local 消耗金钱 = self.银子 * (当前等级 + 1)
        local 消耗积分 = self.积分 * (当前等级 + 1)
        local nsf = require('SDL.图像')(300,100)
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('浅黑'))
            字体18:取图像(消耗经验):显示(140,9)
            字体18:取图像(消耗金钱):显示(140,9+36)
            字体18:取图像(消耗积分):显示(140,9+36*2)

            nsf:渲染结束()
        end
        self.图像 = nsf:到精灵()
        self.图像:置中心(0,-227)
end



local 关闭 = 御兽术:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",435,0)

function 关闭:左键弹起(x,y,msg)
    御兽术:置可见(false)
end

local 学习列表 = 御兽术:创建列表("学习列表",22,50,436,161)

function 学习列表:初始化()
    self:置文字(字体20)
    self.行高度 = 32
    self.行间距 = 0
end

local lsb = {'御兽术(法攻)','御兽术(物攻)','御兽术(气血)','御兽术(法防)','御兽术(物防)'}

function 学习列表:重置(data)
    self:清空()
    for i, v in ipairs(lsb) do
        local skillLevel = data[i] or 0
        local nsf = require('SDL.图像')(436,32)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v..'                               等级：'..skillLevel..'/'..御兽术.上限):显示(44,7)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
    学习列表:置选中(御兽术.选中)
end

function 学习列表:左键弹起(x, y, i, item, msg)
    御兽术.选中 = i
    御兽术:更新消耗显示()
end

local 学习 = 御兽术:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"学习",300,265,"学习")
function 学习:左键弹起(x,y,msg)
    if 御兽术.选中 then
        发送数据(当前 or self and self.当前,3743.1,{学习项目=御兽术.选中})
    else
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择你要学习的御兽术')
    end
end