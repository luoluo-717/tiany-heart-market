--[[
    @Author       : GGELUA
    @Date         : 2022-04-22 19:06:23
Last Modified by: GGELUA
Last Modified time: 2023-08-05 20:21:05
--]]
local 召唤兽仓库 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("商会上架召唤兽",0,0,777,488)
local 当前 = 多开数据.当前
function 召唤兽仓库:初始化()
    self:置精灵(置窗口背景("商会上架召唤兽",0,12,723,476))
end

function 召唤兽仓库:打开(data)
    __置窗口坐标(self)
    self:置可见(true)
    self.页数 = 1
    self.总页= 10
    self.data = data
    self.数据 = data.宠物
    self.召唤兽控件:重置(self.数据)
    self.召唤兽控件:置可见(true)
end

for i, v in ipairs {
    {name = '左翻', x = 16 ,y = 410 , tcp = __res:getPNGCC(3,335,561,96,35):拉伸(46,46)},
    {name = '右翻', x = 100 ,y = 410 , tcp = __res:getPNGCC(3,436,561,96,34):拉伸(46,46)},
} do
    local  临时函数 = 召唤兽仓库:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '左翻' and 召唤兽仓库.页数 > 1 then
            发送数据(当前,6115,{编号=召唤兽仓库.data.编号,店主id=召唤兽仓库.data.店主id,页数=召唤兽仓库.页数-1})
        elseif v.name == '右翻' and 召唤兽仓库.页数 < 召唤兽仓库.总页 then
            发送数据(当前,6115,{编号=召唤兽仓库.data.编号,店主id=召唤兽仓库.data.店主id,页数=召唤兽仓库.页数+1})
        end
    end
end

local 关闭 = 召唤兽仓库:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",690,0)

function 关闭:左键弹起(x,y,msg)
    召唤兽仓库:置可见(false)
end

function 召唤兽仓库:刷新(data)
    self.数据 = data
    self.召唤兽控件:重置(self.数据)
end

local 召唤兽控件 = 召唤兽仓库:创建控件("召唤兽控件",0,0,777,488)

function 召唤兽控件:重置(data)
    self:置可见(true)
    召唤兽仓库.图像 = nil
    召唤兽仓库.图像2 = nil
    local nsf = require('SDL.图像')(777,488):置像素(20, 20, 0, 0, 0, 255)
    if nsf:渲染开始() then
        local lssj = 取白色背景(0,0,306,330,true)
        lssj:显示(17,62)
        lssj:显示(400,62)
        字体18:置颜色(__取颜色('浅黑'))
        字体18:取图像('名字'):显示(58,70)
        字体18:取图像('价格'):显示(225,70)
        字体18:取图像('名字'):显示(441,70)
        字体18:取图像('等级'):显示(608,70)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像("上架价格"):置混合(0):显示(350, 420)
        __res:getPNGCC(2, 795, 885, 373, 115):拉伸(130, 35):显示(430, 415)

        nsf:渲染结束()
    end
    召唤兽仓库.图像 = nsf:到精灵()
    召唤兽仓库.仓库召唤兽数据 = data
    self.召唤兽列表:重置(多开数据[当前].角色信息.宝宝列表)
    self.仓库召唤兽列表:重置(召唤兽仓库.仓库召唤兽数据)
end

function 召唤兽控件:显示(x,y)
    字体18:显示(x+70,y+422,召唤兽仓库.页数.."/"..召唤兽仓库.总页)
end


local 召唤兽列表 = 召唤兽控件:创建列表("召唤兽列表",404,100,298,270)

function 召唤兽列表:初始化()
    self:置文字(字体20)
    self.行高度 = 50
    self.行间距 = 0
end

function 召唤兽列表:重置(data)
    召唤兽仓库.道具选中 = nil
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(298,50)
        if nsf:渲染开始() then
            if _%2 == 1 then
                --nsf:填充颜色(167,164,199,255)
            end
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v.名称):显示(11,15)
            字体16:取图像(v.等级):显示(205,15)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 召唤兽列表:左键弹起(x, y, i, item, msg)
    召唤兽仓库.道具选中 = i
end

for i, v in ipairs {
    {name = '查看1', x = 220 ,y = 410 , tcp = __res:getPNGCC(3,511,11,117,43,true) , font = "查看"},
    {name = '查看2', x = 590 ,y = 410 , tcp = __res:getPNGCC(3,511,11,117,43,true) , font = "查看"},
} do
    local 临时函数 = 召唤兽仓库:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '查看1' then
            if 召唤兽仓库.仓库选中 and 召唤兽仓库.仓库召唤兽数据[召唤兽仓库.仓库选中] then
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(召唤兽仓库.仓库召唤兽数据[召唤兽仓库.仓库选中])
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请选择你要查看的仓库内的召唤兽","xt")
            end
            
        elseif v.name == '查看2' then
            if 召唤兽仓库.道具选中 and 多开数据[当前].角色信息.宝宝列表[召唤兽仓库.道具选中] then 
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(多开数据[当前].角色信息.宝宝列表[召唤兽仓库.道具选中])
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#YY请选择你要查看的随身召唤兽","xt")
            end
        end
    end
end

local 仓库召唤兽列表 = 召唤兽控件:创建列表("仓库召唤兽列表",17,100,298,270)

function 仓库召唤兽列表:初始化()
    self:置文字(字体20)
    self.行高度 = 50
    self.行间距 = 0
end

function 仓库召唤兽列表:重置(data)
    召唤兽仓库.仓库选中 = nil
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(298,50)
        if nsf:渲染开始() then
            if _%2 == 1 then
                --nsf:填充颜色(167,164,199,255)
            end
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v.名称):显示(11,15)
            字体16:取图像(v.价格):显示(205,15)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 仓库召唤兽列表:左键弹起(x, y, i, item, msg)
    召唤兽仓库.仓库选中 = i
end

local 上架按钮 = 召唤兽仓库:创建我的按钮(__res:getPNGCC(3, 244, 563, 78, 34, true):拉伸(56, 38), "上架", 331, 160, "上架")
function 上架按钮:左键弹起(x, y)
    if 召唤兽仓库.价格输入:取数值() == nil or 召唤兽仓库.价格输入:取数值() <= 1 then
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请正确的输入价格")
        return
    end
    if 召唤兽仓库.价格输入:取数值() ~= 0 and 召唤兽仓库.道具选中 and 多开数据[当前].角色信息.宝宝列表[召唤兽仓库.道具选中] then
        发送数据(当前,6114,{编号=召唤兽仓库.data.编号,选中=召唤兽仓库.道具选中,店主id=召唤兽仓库.data.店主id,验证=多开数据[当前].角色信息.宝宝列表[召唤兽仓库.道具选中].认证码,价格=召唤兽仓库.价格输入:取数值(),页数=召唤兽仓库.页数})
    end
end
local 下架按钮 = 召唤兽仓库:创建我的按钮(__res:getPNGCC(3, 244, 563, 78, 34, true):拉伸(56, 38), "下架", 331, 335, "下架")
function 下架按钮:左键弹起(x, y)
    if 召唤兽仓库.仓库选中 and 召唤兽仓库.仓库召唤兽数据[召唤兽仓库.仓库选中] then
        发送数据(当前,6113,{编号=召唤兽仓库.data.编号,选中=召唤兽仓库.仓库选中,店主id=召唤兽仓库.data.店主id,验证=召唤兽仓库.仓库召唤兽数据[召唤兽仓库.仓库选中].认证码,页数=召唤兽仓库.页数})
    end
end

local 价格输入 = 召唤兽仓库:创建我的输入("价格输入", 440, 420, 110, 18,2,9,'黑色')