--[[
    @Author       : GGELUA
    @Date         : 2022-04-04 20:02:27
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:49:09
--]]
多开数据[多开数据.当前].__UI弹出.召唤兽选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("创建弹出控件",0,0,221,353)
local 召唤兽选择 = 多开数据[多开数据.当前].__UI弹出.召唤兽选择
local 当前 = 多开数据.当前
function 召唤兽选择:初始化()
    local nsf = require('SDL.图像')(221,353)
    if nsf:渲染开始() then
        取黑透明背景(0,0,221,353,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 召唤兽选择:打开(x,y,lx)
    self:置可见(true)
    self.头像网格:置头像(多开数据[当前 or self and self.当前].角色信息.宝宝列表)
    self:置坐标(x+abbr.py2.x,y+abbr.py2.y)
    self.类型 = lx
end

local 头像网格 = 召唤兽选择:创建网格("头像网格",12,12,198,331)

function 头像网格:初始化()

end


function 头像网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        if 召唤兽选择.类型 == "洗炼" then
            多开数据[当前].__UI界面.窗口层.召唤兽洗炼:重置(a)
            召唤兽选择:置可见(false)
        elseif 召唤兽选择.类型 == "合宠" then
           if 多开数据[当前].__UI界面.窗口层.召唤兽合宠.选中召唤兽 ~= a and 多开数据[当前].__UI界面.窗口层.召唤兽合宠.选中召唤兽2 ~= a then
                多开数据[当前].__UI界面.窗口层.召唤兽合宠:重置(a,召唤兽选择.类型)
                召唤兽选择:置可见(false)
           end
        elseif 召唤兽选择.类型 == "召唤兽换造型" then
                多开数据[当前].__UI界面.窗口层.召唤兽换造型:重置模型1(a)
                召唤兽选择:置可见(false)
        elseif 召唤兽选择.类型 == "合宠2" then
            if 多开数据[当前].__UI界面.窗口层.召唤兽合宠.选中召唤兽 ~= a and 多开数据[当前].__UI界面.窗口层.召唤兽合宠.选中召唤兽2 ~= a then
                多开数据[当前].__UI界面.窗口层.召唤兽合宠:重置(a,召唤兽选择.类型)
                召唤兽选择:置可见(false)
            end
        elseif 召唤兽选择.类型 == "增加" or 召唤兽选择.类型 == "替换" then
            多开数据[当前].__UI界面.窗口层.神兽增加技能:重置(a)
            召唤兽选择:置可见(false)
        elseif 召唤兽选择.类型 == "回收" then
            多开数据[当前].__UI弹出.提示弹出:打开("神兽一旦回收将无法找回,请确定是否回收神兽?", 5022,{a})
        end
    end
end

function 头像网格:置头像(数据)
    self:创建格子(198,57,10,0,#数据,1,true)
    for i = 1,#头像网格.子控件 do
        local lssj = __头像格子2.创建(当前)
        lssj:置头像(数据[i])
        头像网格.子控件[i]:置精灵(lssj)
    end
end