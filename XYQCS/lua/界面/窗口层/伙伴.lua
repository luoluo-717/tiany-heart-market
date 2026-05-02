--[[
    @Author       : GGELUA
    @Date         : 2022-04-30 15:18:16
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:19:34
--]]
local 伙伴 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("伙伴",0,0,378,499)
local 当前 = 多开数据.当前
function 伙伴:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(378,499)
    if nsf:渲染开始() then
        置窗口背景("伙伴",0,12,366,487,true):显示(0,0)
        取属性背景(0, 0, 340, 285,true):显示(13,50)
        取灰色背景(0, 0, 340, 140,true):显示(13,344)
        __res:getPNGCC(3,375,388,145,149):显示(25,60)
        local lssj = 取输入背景(0,0,110,23)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('名称'):显示(181,60)
        lssj:显示(230,58)
        字体18:取图像('星际'):显示(181,60+30)
        lssj:显示(230,58+30)
        字体18:取图像('等级'):显示(181,60+30*2)
        lssj:显示(230,58+30*2)
        字体18:取图像('经验'):显示(181,60+30*3)
        lssj:显示(230,58+30*3)
        字体18:取图像('技能'):显示(181,60+30*4)
        lssj:显示(230,58+30*4)
    end
    self:置精灵(nsf:到精灵())
    self.模型格子 = __UI模型格子.创建(当前)
end

function 伙伴:打开(data)
    self:置可见(true)
    self.数据 = data
    self.头像网格:置头像(data)
    self.选中 = nil
    self.模型格子:置数据()
end

function 伙伴:重置(data)
    local nsf = require('SDL.图像')(378,210)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('浅黑'))
        字体18:取图像(data.模型):显示(240,60)
        字体18:取图像(data.星级):显示(240,60+30)
        字体18:取图像(data.伙伴等级):显示(240,60+30*2)
        字体18:取图像(data.伙伴经验):显示(240,60+30*3)
        字体18:取图像(data.技能):显示(240,60+30*4)
    end
    self.图像 = nsf:到精灵()
end

local 关闭 = 伙伴:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",328,0)

function 关闭:左键弹起(x,y,msg)
    伙伴:置可见(false)
end

local 头像网格 = 伙伴:创建网格("头像网格",25,357,320,120)

function 头像网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        伙伴.选中 = a
        伙伴.模型格子:置数据(伙伴.数据[a],"召唤兽",93,165)
        伙伴:重置(伙伴.数据[a])
    end
end

function 头像网格:置头像(data)
    self:创建格子(55,55,10,10,math.ceil(#data/5),5,true)
    for i = 1,#头像网格.子控件 do
        if data[i] then
            local lssj = __头像格子.创建(当前)
            lssj:置头像(data[i],"伙伴")
            头像网格.子控件[i]:置精灵(lssj)
        else
            头像网格.子控件[i]:置精灵()
        end
    end
end

for i, v in ipairs {
    {name = '出战', x = 28 ,y = 233 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(90,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(90,43) , font = '出战'},
    {name = '升级', x = 141 ,y = 233 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(90,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(90,43) , font = '升级'},
    {name = '升星', x = 253 ,y = 233 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(90,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(90,43) , font = '升星'},
    {name = '招贤1次', x = 28 ,y = 282 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(150,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(150,43) , font = '招贤1次'},
    {name = '招贤10次', x = 196 ,y = 282 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(150,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(150,43) , font = '招贤10次'},
} do
    local 临时函数 = 伙伴:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '出战' or v.name == '升级' or v.name == '升星' then
            if 伙伴.选中 then
                if v.name == '出战' then
                    发送数据(当前 or self and self.当前,6203,{模型=伙伴.数据[伙伴.选中].模型,选中=伙伴.选中})
                elseif v.name == '升级' then
                    发送数据(当前 or self and self.当前,6204,{模型=伙伴.数据[伙伴.选中].模型,选中=伙伴.选中})
                elseif v.name == '升星' then
                    发送数据(当前 or self and self.当前,6205,{模型=伙伴.数据[伙伴.选中].模型,选中=伙伴.选中})
                end
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请选择伙伴")
            end
        elseif v.name == '招贤1次' then
            发送数据(当前 or self and self.当前,6201)
        elseif v.name == '招贤10次' then

        end
        
    end
end