--[[
    @Author       : GGELUA
    @Date         : 2022-04-28 09:55:18
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:09:06
--]]
local 商会列表 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("商会列表",0,0,774,501)
local 当前 = 多开数据.当前
function 商会列表:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(774,501)
    if nsf:渲染开始() then
        置窗口背景("商会",0,12,767,489,true):显示(0,0)
        取灰色背景(0, 0, 560, 336, true):显示(10,105)
        取白色背景(0, 0, 180, 338, true):显示(580,105)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('号码/店名'):显示(44,114)
        字体18:取图像('规模'):显示(184,114)
        字体18:取图像('类型'):显示(234,114)
        字体18:取图像('号码/店名'):显示(324,114)
        字体18:取图像('规模'):显示(460,114)
        字体18:取图像('类型'):显示(511,114)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 商会列表:打开(data)
    self:置可见(true)
    self.商店网格:置物品(data)
    self.选中 = nil
end

local 关闭 = 商会列表:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",724,0)
function 关闭:左键弹起(x,y,msg)
    商会列表:置可见(false)
end

local 商店网格 = 商会列表:创建网格("商店网格",18,145,548,292)


function 商店网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        if 商会列表.选中 then
            self.子控件[商会列表.选中]._spr.确定 = nil
        end
        商会列表.选中 = a
        self.子控件[a]._spr.确定 = true
    end
end


function 商店网格:置物品(data)
    self:创建格子(270,68,8,8,math.ceil(#data/2),2,true)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __商会格子.创建(当前)
            lssj:置物品(data[i],"商会")
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

for i, v in ipairs {
    {name = '物品店', x = 429 ,y = 451 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(140,41) , font = '物品店'},
    {name = '宠物店', x = 619 ,y = 451 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(140,41) , font = '宠物店'},
} do
    local 临时函数 = 商会列表:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if 商会列表.选中 then
            if v.name == '物品店' then
                发送数据(当前 or self and self.当前,6107,{编号=商会列表.商店网格.子控件[商会列表.选中]._spr.数据.编号,店主id= 商会列表.商店网格.子控件[商会列表.选中]._spr.数据.店主id})
            elseif v.name == '宠物店' then
                发送数据(当前 or self and self.当前,6108,{编号=商会列表.商店网格.子控件[商会列表.选中]._spr.数据.编号,店主id= 商会列表.商店网格.子控件[商会列表.选中]._spr.数据.店主id})
            end
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#请选择一个店铺')
        end
    end
end