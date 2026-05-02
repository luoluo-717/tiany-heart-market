--[[
    @Author       : GGELUA
    @Date         : 2022-04-16 18:47:44
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:50:13
--]]
local 战斗召唤 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("战斗召唤",0,0,271,485)
local 当前 = 多开数据.当前
function 战斗召唤:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(271,485)
    if nsf:渲染开始() then
        __res:getPNGCC(2,622,66,263,475):显示(0,12)
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像('最多召唤12只召唤兽参战'):显示(18,452)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 战斗召唤:打开(pet,data)
    self:置可见(true)
    多开数据[当前].__UI界面.界面层.战斗界面:置可见(false)
    self.召唤数据 = data
    self.召唤列表:重置(pet)
    self.选中 = nil
end

local 关闭 = 战斗召唤:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",221,0)

function 关闭:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.战斗召唤:置可见(false)
    多开数据[当前].__UI界面.窗口层.战斗召唤详情:置可见(false)
    多开数据[当前].__UI界面.界面层.战斗界面:重置()
    多开数据[当前].__UI界面.界面层.战斗界面:置可见(true)
end

function 战斗召唤:取是否召唤(id)
    for n=1,#self.召唤数据 do
        if self.召唤数据[n]==id then
            return true
        end
    end
    return false
end

local 召唤列表 = 战斗召唤:创建列表("召唤列表",20,60,225,337)

function 召唤列表:初始化()
    self:置文字(字体18)
    self.行高度 = 67
    self.行间距 = 5
end

function 召唤列表:左键弹起(x, y, i, item, msg)
    战斗召唤.选中 = i
    多开数据[当前].__UI界面.窗口层.战斗召唤详情:打开(self.子控件[i]._spr.数据)
    local zbx , zby = 战斗召唤:取坐标()
    多开数据[当前].__UI界面.窗口层.战斗召唤详情:置坐标(zbx - 260, zby + 30 )
end

function 召唤列表:重置(pet)
    self:清空()
    for i,v in ipairs(pet) do
        local 允许召唤 = true
        self:添加()
        local nsf = require('SDL.图像')(224,67)
        if nsf:渲染开始() then
            __res:getPNGCC(3,1091,374,49,49):拉伸(60,60):显示(2,2)
            local lssj = 取头像(v.模型)
            __res:取图像(__res:取地址('shape/mx/',lssj[1])):拉伸(53,53):显示(6,6)
            字体18:置颜色(255,255,255)
            字体18:取图像(v.名称):显示(70,8)
            字体18:取图像(v.等级..'级'):显示(70,30)
            if 战斗召唤:取是否召唤(i) then
                允许召唤 = false
                字体18:置颜色(__取颜色('黄色'))
                字体18:取图像('已战斗'):显示(150,30)
            end
            nsf:渲染结束()
        end
        self.子控件[i]:置精灵(nsf:到精灵())
        self.子控件[i]._spr.允许召唤 = 允许召唤
        self.子控件[i]._spr.数据 = v
    end
end

local 召唤按钮 = 战斗召唤:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(150,40),"召唤按钮",58,407,"召唤")

function 召唤按钮:左键弹起(x,y,msg)
    if 战斗召唤.选中 and 召唤列表.子控件[战斗召唤.选中]._spr.允许召唤 then
        多开数据[当前].__UI界面.界面层.战斗界面:设置召唤(战斗召唤.选中)
        多开数据[当前].__UI界面.窗口层.战斗召唤详情:置可见(false)
    end
end