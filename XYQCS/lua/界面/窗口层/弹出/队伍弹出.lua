--[[
    @Author       : GGELUA
    @Date         : 2022-04-12 15:15:42
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:58:00
--]]
多开数据[多开数据.当前].__UI弹出.队伍弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("队伍弹出",引擎.宽度-337,引擎.高度-356,150,250)
local 队伍弹出 = 多开数据[多开数据.当前].__UI弹出.队伍弹出
local 当前 = 多开数据.当前
function 队伍弹出:初始化()
    self:置精灵(取黑色背景(0,0,150,250))
end

function 队伍弹出:打开()
    if self.是否可见 then
        self:置可见(false)
    else
        self:置可见(true)
    end
end

local lsan = {'创建队伍','一键组队','加入队伍','快速登录'}

for i=1,#lsan do
    local 临时函数 = 队伍弹出:创建我的按钮(__res:getPNGCC(2,368,906,126,52,true),lsan[i].."按钮",12,11+((i-1)*60),lsan[i])
    function 临时函数:左键弹起(x,y,msg)
        if lsan[i] == "创建队伍" then
            发送数据(当前 or self and self.当前,4002,{id=多开数据[当前 or self and self.当前].角色信息.数字id})
        elseif lsan[i] == "一键组队" then
            发送数据(当前 or self and self.当前,4017.1,{id=多开数据[当前 or self and self.当前].角色信息.数字id})
        elseif lsan[i] == "加入队伍" then
            多开数据[当前].__UI界面.界面层:重置("组队")
        elseif lsan[i] == "快速登录" then
            多开数据[当前].__UI弹出.招募队员:打开(多开数据[当前].__主控.招募信息)
        end
        队伍弹出:置可见(false)
    end
end
