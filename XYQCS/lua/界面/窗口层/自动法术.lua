---@diagnostic disable: redundant-parameter
--[[
    @Author       : GGELUA
    @Date         : 2022-03-04 00:30:34
Last Modified by: GGELUA
Last Modified time: 2023-06-08 16:19:56
--]]
local SDL = require('SDL')
local 自动法术 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("自动法术",0,0,365,404)
local 当前 = 多开数据.当前
function 自动法术:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(354,406)
    if nsf:渲染开始(0,0,0,0) then
        __res:getPNGCC(2,0,63,354,396):显示(0,10)
        local 宽度 = 字体20:取宽度("法术")
        字体20:置颜色(255,255,255)
        字体20:取图像("法术"):显示(354/2-宽度/2,0+16)
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像('提示：点击技能按钮两次设置'):显示(32,57)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end
function 自动法术:打开(data,lx)
    self:置可见(true)
    self.对象类型=lx
    if data[1] == nil or data[1].名称 ~= "暗器" then
        if lx == "角色" then
            table.insert(data,1,{名称="暗器"})
        end
    end
    self:置技能(data)
    self.选中 = nil
end

local 关闭 = 自动法术:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",318,0)
function 关闭:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.自动法术:置可见(false)
end

local 技能网格 = 自动法术:创建网格("技能网格",10,70,325,320)
function 技能网格:初始化()
    self:创建格子(100,100,15,12,9,3,true)
end

function 技能网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        多开数据[当前].__UI界面.窗口层.自动法术:置可见(false)
        if 自动法术.对象类型 == "bb" then
            发送数据(当前 or self and self.当前,60.1,{技能名称=self.子控件[a].技能信息})
        elseif 自动法术.对象类型 == "角色" then
            发送数据(当前 or self and self.当前,60.2,{技能名称=self.子控件[a].技能信息})
        end
    end
end

function 自动法术:置技能(data)
    self.技能数据 = data
    for i = 1,#技能网格.子控件 do
        if self.技能数据[i] then
            local nsf = require('SDL.图像')(100,100)
            local lssc = 取技能信息(self.技能数据[i].名称)
            if nsf:渲染开始() then
                nsf:渲染清除(0, 0, 0, 255)
                if self.技能数据[i].剩余冷却回合 then
                    __res:取图像(__res:取地址('shape/jn/',lssc[7])):拉伸(55,55):到灰度():显示(20,20)
                else
                    __res:取图像(__res:取地址('shape/jn/',lssc[7])):拉伸(55,55):显示(20,20)
                end
                多开数据[当前].__主控.公用蒙版:显示(20,20)
                local 宽度 = 字体20:取宽度(self.技能数据[i].名称)
                字体18:置颜色(255,255,255)
                字体18:取描边图像(self.技能数据[i].名称):显示(100/2-宽度/2,80)
                nsf:渲染结束()
            end
            
            local sc = nsf:到精灵()
            sc:置混合(2)
            技能网格.子控件[i]:置精灵(sc)
            技能网格.子控件[i].技能信息 = self.技能数据[i].名称
        else
            技能网格.子控件[i]:置精灵()
        end
    end
end
