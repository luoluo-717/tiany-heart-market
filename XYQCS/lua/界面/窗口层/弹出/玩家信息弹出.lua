--[[
    @Author       : GGELUA
    @Date         : 2022-06-17 18:35:35
Last Modified by: GGELUA
Last Modified time: 2023-08-06 16:24:57
--]]
多开数据[多开数据.当前].__UI弹出.玩家信息弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("玩家信息弹出",引擎.宽度-465,引擎.高度-438,230,322)
local 玩家信息弹出 = 多开数据[多开数据.当前].__UI弹出.玩家信息弹出
local 当前 = 多开数据.当前
function 玩家信息弹出:初始化(当前)
    self.当前=当前
    local nsf = require('SDL.图像')(230,322)
    if nsf:渲染开始() then
        取黑透明背景(0,0,230,322,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 玩家信息弹出:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
    if self.图像2 then
        self.图像2:显示(x,y)
    end
end

function 玩家信息弹出:打开(data)
    self:置可见(true)
    self:重置(data)
end

function 玩家信息弹出:重置(data)
    local nsf = require('SDL.图像')(247,395)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('陌生人'):显示(139,20)
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像(data.名称):显示(21,20)
        字体18:取图像('ID:'..(data.玩家ID or data.id)):显示(21,48)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.数据 = data
end

for i, v in ipairs {
    {name = '给予', x = 15 ,y = 73 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '给予'},
    {name = '交易', x = 119 ,y = 73 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '交易'},
    {name = '组队', x = 15 ,y = 123 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '组队'},
    {name = '团队', x = 119 ,y = 123 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '团队'},
    {name = '加为好友', x = 15 ,y = 173 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '加为好友'},
    {name = '发起聊天', x = 119 ,y = 173 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '发起聊天'},
    {name = '攻击', x = 15 ,y = 222 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '攻击'},
    {name = '信息', x = 119 ,y = 222 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '信息'},
    {name = '空间', x = 15 ,y = 271 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '空间'},
    {name = '举报', x = 119 ,y = 271 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(98,42) , font = '举报'},
} do
    local 临时函数 = 玩家信息弹出:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '给予' then
            发送数据(当前 or self and self.当前,3716,{id=玩家信息弹出.数据.玩家ID or 玩家信息弹出.数据.id})
        elseif v.name == '组队' then
            发送数据(当前 or self and self.当前,4014,{id=玩家信息弹出.数据.玩家ID or 玩家信息弹出.数据.id})
        elseif v.name == '交易' then
            发送数据(当前 or self and self.当前,3718,{id=玩家信息弹出.数据.玩家ID or 玩家信息弹出.数据.id})
        elseif v.name == '攻击' then
            if 多开数据[当前].__主显.地图.对象[玩家信息弹出.数据.玩家ID or 玩家信息弹出.数据.id].战斗开关 then --观战
                local 确认 = "是否要观战玩家："..玩家信息弹出.数据.名称.." ？"
                local 事件 = function()
				    发送数据(当前 or self and self.当前,6565,{序列=玩家信息弹出.数据.玩家ID or 玩家信息弹出.数据.id})
                end
                多开数据[当前 or self and self.当前].__UI界面.窗口层.文本栏:打开(确认,285,155,390,200,事件)

            else
                local dity=多开数据[当前 or self and self.当前].角色信息.地图数据.编号
                local xy = require("GGE.坐标")(x, y) - 多开数据[当前 or self and self.当前].__主显.屏幕坐标
                if (dity==1001 and xy.x>398*20 and xy.x<439*20 and xy.y>164*20 and xy.y<183*20) or dity == 2009 then
                    PK选中玩家 = 玩家信息弹出.数据.玩家ID
                    多开数据[当前 or self and self.当前].__UI界面.窗口层.对话栏:打开({
                        模型 = "",
                        名称 = "",
                        对话 = "少侠，你选择的对手刚好也是独自一人。你想向他发起切磋还是“单挑”呢",
                        选项 = { "切磋", "单挑" },
                        回调处理 = nil,
                    })
                else
                    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请到长安城 擂台PK!.....")
                end
            end
            if 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==1197 then
                多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y比武等待区不允许发生战斗！")
            elseif 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5136 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5137 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5138 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==5139 then
                发送数据(self.当前,6566,{序列=self.玩家ID,PK地图=多开数据[当前 or self and self.当前].角色信息.地图数据.编号})
            elseif 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 2010 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 2011 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 2012 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号 == 1511 then
                发送数据(self.当前,6552,{序列=self.玩家ID})--帮战
            end
        end
        玩家信息弹出:置可见(false)
    end
end