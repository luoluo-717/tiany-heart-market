--[[
    @Author       : GGELUA
    @Date         : 2023-04-23 09:31:45
Last Modified by: GGELUA
Last Modified time: 2023-08-06 17:55:05
--]]
local lsb = {   {name = "屏蔽玩家",rgb= "青色"},
                {name = "屏蔽摊位",rgb= "白色"},
                {name = "屏蔽非队长",rgb= "黄色"},
                {name = "野外挂机",rgb= "绿色"},
        }
__UI弹出.快捷功能 = __UI界面:创建弹出窗口("快捷功能",0,0,160,240)
local 快捷功能 =多开数据[当前 or self and self.当前].__UI弹出.快捷功能
function 快捷功能:初始化()
    local nsf = require('SDL.图像')(160,240)
    if nsf:渲染开始() then
        取黑色背景(0,0,160,240,true):显示(0,0)
        for i=1,#lsb do
            字体18:置颜色(__取颜色(lsb[i].rgb))
            字体18:取图像(lsb[i].name):显示(57,27+((i-1)*54))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 快捷功能:打开(x,y)
    self:置可见(true)
    self:置中心(-x-50,-y+190)
end

function 快捷功能:重置()
    for i=1,#lsb do
        快捷功能[lsb[i].name.."按钮"]:置选中(false)
    end
end
for i=1,#lsb do
    local 临时函数 = 快捷功能:创建我的多选按钮(__res:getPNGCC(2,1172,107,26,26,true),__res:getPNGCC(2,1171,75,26,26,true),lsb[i].name.."按钮",25,24+((i-1)*54))

    function 临时函数:左键弹起(x, y)

    end
end