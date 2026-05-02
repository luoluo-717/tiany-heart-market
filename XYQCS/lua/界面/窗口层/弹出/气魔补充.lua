--[[
    @Author       : GGELUA
    @Date         : 2022-04-19 09:51:33
Last Modified by: GGELUA
Last Modified time: 2023-11-07 13:03:08
--]]
多开数据[多开数据.当前].__UI弹出.气魔补充 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("气魔补充",引擎.宽度-345,39,290,157)
local 气魔补充 = 多开数据[多开数据.当前].__UI弹出.气魔补充
local 当前 = 多开数据.当前
function 气魔补充:初始化()
    self:置精灵(取黑色背景(0,0,290,157))
end

function 气魔补充:显示(x,u)
    if self.图像 then
        self.图像:显示(x,u)
    end
end

function 气魔补充:打开(lx)
    self:置可见(true)
    self:重置(lx)
    self.类型 = lx
end

function 气魔补充:重置(lx)
    local nsf = require('SDL.图像')(290,157)
    if lx == '人物' then
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('黄色'))
            字体18:取描边图像(string.format( "气血 ：%s/%s/%s",多开数据[当前 or self and self.当前].角色信息.气血,多开数据[当前 or self and self.当前].角色信息.气血上限,多开数据[当前 or self and self.当前].角色信息.最大气血)):显示(20,78)
            字体18:取描边图像(string.format( "魔法 ：%s/%s",多开数据[当前 or self and self.当前].角色信息.魔法,多开数据[当前 or self and self.当前].角色信息.最大魔法)):显示(20,99)
            字体18:取描边图像(string.format( "愤怒 ：%s/%s",多开数据[当前 or self and self.当前].角色信息.愤怒,150)):显示(20,120)
            nsf:渲染结束()
        end
    elseif lx == '召唤兽' then
        if nsf:渲染开始() then
            字体18:置颜色(__取颜色('黄色'))
            字体18:取描边图像(string.format("气血 ：%s/%s",多开数据[当前 or self and self.当前].角色信息.参战宝宝.气血,多开数据[当前 or self and self.当前].角色信息.参战宝宝.最大气血)):显示(20,78)
            字体18:取描边图像(string.format("魔法 ：%s/%s",多开数据[当前 or self and self.当前].角色信息.参战宝宝.魔法,多开数据[当前 or self and self.当前].角色信息.参战宝宝.最大魔法)):显示(20,99)
            nsf:渲染结束()
        end
    end
    self.图像 = nsf:到精灵()
end

for i, v in ipairs {
    {name = '补充气血', x = 17 ,y = 15 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36),font = '补充气血'},
    {name = '补充魔法', x = 150 ,y = 15 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(109,36),font = '补充魔法'},
} do
    local  临时函数 = 气魔补充:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '补充气血' then
            气魔补充:置可见(false)
            if 气魔补充.类型 == '人物' then
                发送数据(当前 or self and self.当前,3727,{类型=1})
            elseif 气魔补充.类型 == '召唤兽' then
                发送数据(当前 or self and self.当前,3727,{类型=2})
            end
        elseif v.name == '补充魔法' then
            气魔补充:置可见(false)
            if 气魔补充.类型 == '人物' then
                发送数据(当前 or self and self.当前,3728,{类型=1})
            elseif 气魔补充.类型 == '召唤兽' then
                发送数据(当前 or self and self.当前,3727,{类型=2})
            end
        end
    end
end