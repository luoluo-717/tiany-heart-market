--[[
    @Author       : GGELUA
    @Date         : 2022-06-15 15:55:16
Last Modified by: GGELUA
Last Modified time: 2023-11-08 14:07:46
--]]
多开数据[多开数据.当前].__UI弹出.好友弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("好友弹出",0,0,247,279)
local 好友弹出 = 多开数据[多开数据.当前].__UI弹出.好友弹出
local 当前 = 多开数据.当前
function 好友弹出:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(247,395)
    if nsf:渲染开始() then
        取黑透明背景(0,0,247,279,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 好友弹出:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
    if self.图像2 then
        self.图像2:显示(x,y)
    end
end

function 好友弹出:打开(data)
    self:置可见(true)
    self:重置(data)
end

function 好友弹出:重置(data)
    local nsf = require('SDL.图像')(247,395)
    if nsf:渲染开始() then
        __res:getPNGCC(3,757,291,57,57):拉伸(50,50):显示(18,13)
        local lssj = 取头像(data.模型)
        if lssj[2] == 0 then lssj[2] = lssj[1] end
        __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(48,48):显示(19,14)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像(data.名称):显示(81,15)
        字体18:取图像(data.等级..'级'):显示(81,42)
        字体18:取图像((data.门派 or '无门派')):显示(133,42)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.数据 = data
end

for i, v in ipairs {
    {name = '好友属性', x = 18 ,y = 76 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,52) , font = '好友属性'},
    {name = '消息聊天', x = 130 ,y = 76 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,52) , font = '消息聊天'},
    {name = '分组', x = 18 ,y = 141 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,52) , font = '分组'},
    {name = '组队', x = 130 ,y = 141 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,52) , font = '组队'},
    {name = '给予', x = 18 ,y = 206 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,52) , font = '给予'},
    {name = '交易', x = 130 ,y = 206 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,52) , font = '交易'},
} do
    local 临时函数 = 好友弹出:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '好友属性' then
            多开数据[当前].__UI界面.窗口层.好友属性:打开(好友弹出.数据)
        elseif v.name == '消息聊天' then
            多开数据[当前].__UI界面.窗口层.好友消息:打开(好友弹出.数据)
        end
        好友弹出:置可见(false)
    end
end