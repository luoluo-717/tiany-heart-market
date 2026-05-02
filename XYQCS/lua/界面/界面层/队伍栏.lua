--[[
    @Author       : GGELUA
    @Date         : 2022-04-14 22:11:39
Last Modified by: GGELUA
Last Modified time: 2023-08-17 09:48:15
--]]
local 队伍栏 =  多开数据[多开数据.当前].__UI界面.界面层:创建控件("队伍栏",350+abbr.py.x,0,320,67)
local 当前 = 多开数据.当前
function 队伍栏:初始化()

end

local 队员网格 = 队伍栏:创建网格("队员网格",20,0,300,60)

function 队员网格:初始化()
    self:创建格子(60,60,0,0,1,5)
end

function 队员网格:左键弹起(x, y, a, b, msg)
    if 队员网格.子控件[a] and 队员网格.子控件[a].数据 and  队员网格.子控件[a].数据.id ~= 多开数据[当前 or self and self.当前].角色信息.数字id then
       多开数据[当前 or self and self.当前].__UI弹出.玩家信息弹出:打开(队员网格.子控件[a].数据)
    end
end

function 队员网格:左键双击(x, y, a, b, msg)
    if 队员网格.子控件[a] and 队员网格.子控件[a].数据 and  队员网格.子控件[a].数据.id ~= 多开数据[当前 or self and self.当前].角色信息.数字id then
        local positions = {
            [4] = 2,
            [3] = 3,
            [2] = 4,
            [1] = 5
        }
        local 位置 = positions[a] or 1
        发送数据(当前 or self and self.当前,4010,{序列=位置})
    end
end

function 队员网格:置头像(数据)
    for i = 1,#队员网格.子控件 do
        local bh = 6-i
        if 数据[i] then
            local nsf = require('SDL.图像')(60,60)
            if nsf:渲染开始() then
                __res:getPNGCC(3,757,291,57,57):拉伸(60,60):显示(0,0)
                local lssj = 取头像(数据[i].模型)
                if lssj[2] == 0 then lssj[2] = lssj[1] end
                __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(54,54):显示(3,3)
                nsf:渲染结束()
            end
            队员网格.子控件[bh]:置精灵(nsf:到精灵())
            队员网格.子控件[bh].数据 = 数据[i]
        else
            队员网格.子控件[bh]:置精灵(nil)
        end
    end
end