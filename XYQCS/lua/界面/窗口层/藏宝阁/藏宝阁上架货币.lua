--[[
    @Author       : GGELUA
    @Date         : 2022-04-30 11:57:17
Last Modified by: GGELUA
Last Modified time: 2023-07-27 12:49:47
--]]
local 藏宝阁上架货币 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("藏宝阁上架货币",0,0,376,454)
local 当前 = 多开数据.当前
function 藏宝阁上架货币:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(376,454)
    if nsf:渲染开始() then
        置窗口背景("上架货币",0,12,368,440,true):显示(0,0)
        local lssj = 取输入背景(0,0,240,23)
        
        lssj:显示(111,144)
        
        lssj:显示(111,202)
        lssj:显示(111,263)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 藏宝阁上架货币:打开(数量)
    self:置可见(true)
    self.类型="银子"
    self:重置("银子",数量)
end

function 藏宝阁上架货币:重置(类型,数量)
    self.数据 = 多开数据[当前].角色信息
    local nsf = require('SDL.图像')(376,454)
    if nsf:渲染开始() then
        字体18:置颜色(__取银子颜色(数量))
        字体18:取图像(数量):显示(115,146)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像(类型):显示(13,146)
        字体18:取图像('出售数量'):显示(13,204)
        字体18:取图像('出售价格'):显示(13,265)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.出售数量:置数值(0)
    self.出售价格:置数值(0)
end

local 关闭 = 藏宝阁上架货币:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",326,0)

function 关闭:左键弹起(x,y,msg)
    藏宝阁上架货币:置可见(false)
end

local 出售数量 = 藏宝阁上架货币:创建我的输入('出售数量',115,204,200,18,2,10,'黑色')
local 出售价格 = 藏宝阁上架货币:创建我的输入('出售价格',115,265,200,18,2,10,'黑色')

for i, v in ipairs {
    {name = '确定出售', x = 110 ,y = 394 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(152,43) , tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(152,43) , font = '确定出售'},
} do
    local 临时函数 = 藏宝阁上架货币:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if tonumber(藏宝阁上架货币.出售数量:取数值()) and tonumber(藏宝阁上架货币.出售价格:取数值()) then
            发送数据(当前 or self and self.当前,60.8,{编号=藏宝阁上架货币.出售数量:取数值(),价格=藏宝阁上架货币.出售价格:取数值()})
            藏宝阁上架货币:置可见(false)
        else
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请正确输入内容")
        end
    end
end