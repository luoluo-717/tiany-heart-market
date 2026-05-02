--[[
Author: GGELUA
Date: 2024-04-05 16:21:18
Last Modified by: GGELUA
Last Modified time: 2024-04-05 17:53:27
--]]
多开数据[多开数据.当前].__UI弹出.单开招募 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("单开招募",引擎.宽度-693,引擎.高度-466,200,395)
local 当前 = 多开数据.当前
local 单开招募 = 多开数据[多开数据.当前].__UI弹出.单开招募

function 单开招募:初始化()
    local nsf = require('SDL.图像')(200,395)
    if nsf:渲染开始() then
        取黑透明背景(0,0,200,395,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 单开招募:打开(数据)
    self:置可见(true)
    self.数据=数据
    self.角色列表:重置()
end

function 单开招募:刷新(数据)
    self.数据=数据
    self.角色列表:重置()
end

local 角色列表 = 单开招募:创建列表("角色列表",10,12,180,320)

function 角色列表:初始化()
    self:置文字(字体18)
    self.行高度 = 60
    self.行间距 = 5
end

function 角色列表:左键弹起(x, y, i, item, msg)
    单开招募.选中 = i
end

function 角色列表:重置()
    self:清空()
    for i,v in ipairs(单开招募.数据) do
        self:添加()
        local nsf = require('SDL.图像')(180,60)
        if nsf:渲染开始() then
            __res:getPNGCC(3,757,291,57,57):拉伸(60,60):显示(0,0)
            local lssj = 取头像(v.模型)
            if lssj[2] == 0 then lssj[2] = lssj[1] end
            __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(54,54):显示(3,3)
            字体18:置颜色(255,255,255)
            字体18:取图像(v.名称):显示(70,0)
            字体18:取图像(v.门派):显示(70,20)
            字体18:取图像(v.等级):显示(70,40)
            nsf:渲染结束()
        end
        self.子控件[i]:置精灵(nsf:到精灵())
        self.子控件[i].数据 = v
    end
end

local  招募角色按钮 = 单开招募:创建我的按钮(__res:getPNGCC(2,487,802,150,43,true),'招募角色按钮',30,338,'招募')


function 招募角色按钮:左键弹起(x, y)
    if 单开招募.选中 == nil or 单开招募.数据[单开招募.选中] == nil then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请正确选择你要操作上线的角色')
    else
        local 对方id = 单开招募.数据[单开招募.选中].id
        发送数据(当前,4017,{id = 对方id})
    end
end