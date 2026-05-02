--[[
    @Author       : GGELUA
    @Date         : 2023-04-09 14:55:42
    @Last Modified by: GGELUA
    @Last Modified time: 2023-04-09 16:33:16
--]]
--[[
    @Author       : GGELUA
    @Date         : 2022-04-30 11:57:17
    @Last Modified by: GGELUA
    @Last Modified time: 2022-04-30 15:17:17
--]]
local 雁塔地宫指定 = __UI界面.窗口层:创建我的窗口("雁塔地宫指定",0,0,376,554)
function 雁塔地宫指定:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(376,454)
    if nsf:渲染开始() then
        置窗口背景("雁塔地宫指定层数",0,12,368,210,true):显示(0,0)
        local lssj = 取输入背景(0,0,240,23)
        lssj:显示(61,100)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 雁塔地宫指定:打开(data)
    self:置可见(true)
    self.银子输入:置数值(0)
end

local 关闭 = 雁塔地宫指定:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",326,0)

function 关闭:左键弹起(x,y,msg)
    雁塔地宫指定:置可见(false)
end

local 银子输入 = 雁塔地宫指定:创建我的输入('银子输入',65,100,200,18,2,10,'黑色')

for i, v in ipairs {
    {name = '确定', x = 110 ,y = 154 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(152,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(152,43) , font = '确定'},
} do
    local 临时函数 = 雁塔地宫指定:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if 雁塔地宫指定.银子输入:取数值() then
            if v.name == '确定' then
                发送数据(当前 or self and self.当前,1522,{层数=雁塔地宫指定.银子输入:取数值()})
                雁塔地宫指定:置可见(false)
            end
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请输入层数")
        end
    end
end