--[[
    @Author       : GGELUA
    @Date         : 2022-04-14 09:12:55
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:59:01
--]]
local 阵型选择 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("阵型选择",0,0,776,484)
local 当前 = 多开数据.当前
local 阵型 = {'普通','天覆阵','地载阵','风扬阵','云垂阵',"鸟翔阵",'龙飞阵','虎翼阵','蛇蟠阵','鹰啸阵','雷绝阵'}
function 阵型选择:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(774,484)
    if nsf:渲染开始() then
        置窗口背景("队伍列表",0,12,766,473,true):显示(0,0)
        取白色背景(0,0,546,406,true):显示(214,57)
        __res:取图像(__res:取地址('shape/ui/dw/',0x57AD4C4E)):显示(214,170)
        字体20:置颜色(255,255,255)
        for i = 1,5 do
            字体20:取描边图像(i):显示(541,75+((i-1)*78))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.标识={}
    字体16:置颜色(255,255,255)
    local man = __res:取图像(__res:取地址('shape/ui/dw/',0x0E43E0DF))
    for i = 1,5 do
        local nsf = require('SDL.图像')(man.宽度,man.高度)
        if nsf:渲染开始() then
            man:显示(0,0)
            字体16:取描边图像(i):显示(1,12)
            nsf:渲染结束()
        end
        self.标识[i] = nsf
    end
end

function 阵型选择:打开()
    self:置可见(true)
    self.选中 = nil
    self.阵型信息=nil
    self.阵型网格:置数据(阵型)
end

function 阵型选择:重置()
    self.图像 = nil
    if self.选中 and self.阵型信息 then
        local nsf = require('SDL.图像')(774,484)
        if nsf:渲染开始() then
            字体20:置颜色(__取颜色('黄色'))
            字体20:取图像(阵型[self.选中]):显示(224,80)
            字体20:置颜色(__取颜色('绿色'))
            字体20:取图像(self.阵型信息.说明):显示(224,113)
            字体20:置颜色(__取颜色('浅黑'))
            for i = 1,5 do
                self.标识[i]:显示(self.阵型信息[i].x+74,self.阵型信息[i].y-20)
                字体20:取图像(self.阵型信息[i].tip):显示(564,75+((i-1)*78))
            end
            local kz = '' 
            for k, v in pairs(self.阵型信息.克制) do
                kz = kz..'克制'..k..v..'%\n'
            end
            字体20:置颜色(__取颜色('绿色'))
            字体20:取图像(kz):显示(224,170) 
            local bkz = '' 
            for k, v in pairs(self.阵型信息.被克制) do
                bkz = bkz..'被克制'..k..v..'%\n'
            end
            字体20:置颜色(__取颜色('红色'))
            字体20:取图像(bkz):显示(224,290) 
            nsf:渲染结束()
        end
        self.图像 = nsf:到精灵()
    end
end

local 关闭 = 阵型选择:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",726,0)

function 关闭:左键弹起(x,y,msg)
    阵型选择:置可见(false)
end

local 阵型网格 = 阵型选择:创建网格("阵型网格",15,53,184,417)

function 阵型网格:初始化()
    self:创建格子(184,55,9,0,#阵型,1,true)
end

function 阵型网格:左键弹起(x, y, a, b, msg)
    if 阵型选择.选中 then
        self.子控件[阵型选择.选中]._spr.确定 = nil
    end
    阵型选择.选中 = a
    self.子控件[a]._spr.确定 = true
    阵型选择.阵型信息 = __取阵法(阵型[a])
    阵型选择:重置()
end

function 阵型网格:置数据(数据)
    for i = 1,#阵型网格.子控件 do
        local lssj = __阵型格子.创建()
        lssj:置数据(数据[i])
        阵型网格.子控件[i]:置精灵(lssj)
    end
end
local 选的阵型按钮 = 阵型选择:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(147,41),"选的阵型按钮",299,408,'选的阵型')
function 选的阵型按钮:左键弹起(x,y,msg)
    if 阵型选择.选中 then
        发送数据(当前 or self and self.当前,4009,{名称=阵型[阵型选择.选中]})
    end
end