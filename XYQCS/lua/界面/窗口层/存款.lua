--[[
    @Author       : GGELUA
    @Date         : 2022-04-30 11:57:17
Last Modified by: GGELUA
Last Modified time: 2023-07-27 12:49:47
--]]
local 存款 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("存款",0,0,376,454)
local 当前 = 多开数据.当前
function 存款:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(376,454)
    if nsf:渲染开始() then
        置窗口背景("银两存取业务",0,12,368,440,true):显示(0,0)
        local lssj = 取输入背景(0,0,240,23)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('现金'):显示(13,146)
        lssj:显示(111,144)
        字体18:取图像('存款'):显示(13,204)
        lssj:显示(111,202)
        字体18:取图像('存取金额'):显示(13,265)
        lssj:显示(111,263)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 存款:打开(data)
    self:置可见(true)
    self:重置(data)
end

function 存款:重置(data)
    self.数据 = data
    local nsf = require('SDL.图像')(376,454)
    if nsf:渲染开始() then
        字体18:置颜色(__取银子颜色(self.数据.银子))
        字体18:取图像(self.数据.银子):显示(115,146)
        字体18:置颜色(__取银子颜色(self.数据.存银))
        字体18:取图像(self.数据.存银):显示(115,204)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.银子输入:置数值(0)
end

local 关闭 = 存款:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",326,0)

function 关闭:左键弹起(x,y,msg)
    存款:置可见(false)
end

local 银子输入 = 存款:创建我的输入('银子输入',115,265,200,18,2,10,'黑色')

for i, v in ipairs {
    {name = '确定存入', x = 30 ,y = 394 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(152,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(152,43) , font = '确定存入'},
    {name = '确定取出', x = 200 ,y = 394 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(152,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(152,43) , font = '确定取出'},
} do
    local 临时函数 = 存款:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if 存款.银子输入:取数值() then
            if v.name == '确定存入' then
                发送数据(当前 or self and self.当前,48,{JQ=存款.银子输入:取数值()})
            elseif v.name == '确定取出' then
                发送数据(当前 or self and self.当前,49,{JQ=存款.银子输入:取数值()})
            end
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请输入数额")
        end
    end
end