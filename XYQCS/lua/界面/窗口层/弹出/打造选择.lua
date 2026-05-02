--[[
    @Author       : GGELUA
    @Date         : 2022-05-19 10:08:22
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:31:54
--]]
多开数据[多开数据.当前].__UI弹出.打造选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("打造选择",0,0,254,295)
local 当前 = 多开数据.当前
local 打造选择 = 多开数据[多开数据.当前].__UI弹出.打造选择
function 打造选择:初始化()
    local nsf = require('SDL.图像')(254,295)
    if nsf:渲染开始() then
        取黑透明背景(0,0,254,295,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 打造选择:打开(data,h,x,y)
    self:置坐标(x,y+h)
    self:置可见(true)
    self.数据 = data
    self.打造列表:重置(data)
end

local 打造列表 = 打造选择:创建列表("打造列表",10,10,234,275)

function 打造列表:初始化()
    self:置文字(字体20)
    self.行高度 = 50
    self.行间距 = 0
end

function 打造列表:重置(data)
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(234,275)
        if nsf:渲染开始() then
            if _%2 == 1 then
                --nsf:填充颜色(167,164,199,255)
            end
            local tsf=字体20:置颜色(__取颜色('白色')):取图像(v)
            tsf:显示(116-tsf.宽度/2,18)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 打造列表:左键弹起(x, y, i, item, msg)
    多开数据[当前].__UI界面.窗口层.打造.请选择:我的按钮置文字(多开数据[当前].__UI界面.窗口层.打造.请选择,__res:getPNGCC(3,378,347,143,37,true):拉伸(233,37),打造选择.数据[i])
    多开数据[当前].__UI界面.窗口层.打造.分类 = 打造选择.数据[i]
    多开数据[当前].__UI界面.窗口层.打造:刷新(多开数据[当前].__UI界面.窗口层.打造.数据)
    打造选择:置可见(false)
end