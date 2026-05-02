--[[
    @Author       : GGELUA
    @Date         : 2022-04-15 10:33:55
Last Modified by: GGELUA
Last Modified time: 2023-08-16 09:15:42
--]]
多开数据[多开数据.当前].__UI弹出.招募队员 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("招募队员",引擎.宽度-693,引擎.高度-466,200,395)
local 当前 = 多开数据.当前
local 招募队员 = 多开数据[多开数据.当前].__UI弹出.招募队员
function 招募队员:初始化()
    local nsf = require('SDL.图像')(200,395)
    if nsf:渲染开始() then
        取黑透明背景(0,0,200,395,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 招募队员:打开(数据,队伍)
    self:置可见(true)
    self.队伍=队伍
    self.角色列表:重置()
end

local 角色列表 = 招募队员:创建列表("角色列表",10,12,180,320)

function 角色列表:初始化()
    self:置文字(字体18)
    self.行高度 = 60
    self.行间距 = 5
end

function 角色列表:左键弹起(x, y, i, item, msg)
    if self.子控件[i].数据 and self.子控件[i].数据.已登录 and not 招募队员.队伍 then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y该角色已经登录了')
        角色列表:置选中(0)
        招募队员.选中 = nil
    else
        招募队员.选中 = i
    end
end

function 角色列表:重置()
    self:清空()
    for i,v in ipairs(多开数据[当前].__主控.招募信息) do
        self:添加()
        local nsf = require('SDL.图像')(180,60)
        if nsf:渲染开始() then
            __res:getPNGCC(3,757,291,57,57):拉伸(60,60):显示(0,0)
            local lssj = 取头像(v.造型)
            if lssj[2] == 0 then lssj[2] = lssj[1] end
            __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(54,54):显示(3,3)
            字体18:置颜色(255,255,255)
            字体18:取图像(v.名称):显示(70,0)
            字体18:取图像(v.门派):显示(70,20)
            字体18:取图像(v.等级):显示(70,40)
            v.已登录 = nil
            for i=1,5 do
                if 多开数据[i] and 多开数据[i].角色信息 and 多开数据[i].角色信息.数字id == v.id then
                    字体18:置颜色(__取颜色('红色'))
                    字体18:取描边图像('已登陆',255,255,255,255):显示(0,0)
                    v.已登录 = true
                end
            end

            nsf:渲染结束()
        end
        self.子控件[i]:置精灵(nsf:到精灵())
        self.子控件[i].数据 = v
    end
end

local  招募角色按钮 = 招募队员:创建我的按钮(__res:getPNGCC(2,487,802,150,43,true),'招募角色按钮',30,338,'招募')


function 招募角色按钮:左键弹起(x, y)
    if 招募队员.选中 == nil or 招募队员.角色列表.子控件[招募队员.选中] == nil then
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请正确选择你要操作上线的角色')
    else
        if 招募队员.队伍 then
            local 对方id = 招募队员.角色列表.子控件[招募队员.选中].数据.id
            local 成功 = false
            for i=1,5 do
                if 多开数据[i] and 多开数据[i].角色信息 and 多开数据[i].角色信息.数字id == 对方id then
                    发送数据(当前,4004.1,{目标id = 对方id})
                    成功 = true
                    break
                end
            end
            if not 成功  then
                多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y目标角色尚未进入游戏')
            end
        else
            标签:开启多开()
            if 标签:快速上号(招募队员.角色列表.子控件[招募队员.选中].数据,招募队员.选中) then
                招募队员.选中 = nil
            end
        end
    end
end