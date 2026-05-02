--[[
    @Author       : GGELUA
    @Date         : 2022-04-23 12:24:43
Last Modified by: GGELUA
Last Modified time: 2023-11-07 13:08:45
--]]
local 门派选择 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("门派选择",0,0,601,344)
local 当前 = 多开数据.当前
function 门派选择:初始化()
    __置窗口坐标(self)
    self:置精灵( 置窗口背景("门派选择",0,12,593,319))
    self.师傅模型={}
end

function 门派选择:打开()
    self:置可见(true)
    self.可选门派 = 多开数据[当前].__主控:队伍角色(多开数据[当前 or self and self.当前].角色信息.模型)
    self:重置()
end

local 关闭 = 门派选择:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",551,0)

function 关闭:左键弹起(x,y,msg)
    门派选择:置可见(false)
end

function 门派选择:重置()
    local nsf = require('SDL.图像')(601,290)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('白色'))
        for i, v in ipairs(self.可选门派.门派) do
            __res:取图片("shape/ui/xz/"..v..".png"):显示(20+((i-1)*140),40)
            local w = 取模型(self.可选门派.门派模型[i])
            self.师傅模型[i] = __res:取动画2(__res:取地址('shape/mx/', w[1])):置循环(true) 
        end
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end


function 门派选择:更新(dt)
    for i,v in ipairs(self.师傅模型) do
        v:更新(dt)
    end
end

function 门派选择:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
    for i,v in ipairs(self.师傅模型) do
        v:显示(x+60+((i-1)*150),y+260)
    end
end


for i, v in ipairs {
    {name = '传送1', x = 30 ,y = 300 , tcp = __res:getPNGCC(3,2,507,124,41,true):拉伸(88,25) , font = '传送'},
    {name = '传送2', x = 170 ,y = 300 , tcp = __res:getPNGCC(3,2,507,124,41,true):拉伸(88,25) , font = '传送'},
    {name = '传送3', x = 310 ,y = 300 , tcp = __res:getPNGCC(3,2,507,124,41,true):拉伸(88,25) , font = '传送'},
    {name = '传送4', x = 450 ,y = 300 , tcp = __res:getPNGCC(3,2,507,124,41,true):拉伸(88,25) , font = '传送'},
} do
    local  临时函数 = 门派选择:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        发送数据(当前 or self and self.当前,57,{门派=门派选择.可选门派.传送门派[i]})
        门派选择:置可见(false)
    end
end
