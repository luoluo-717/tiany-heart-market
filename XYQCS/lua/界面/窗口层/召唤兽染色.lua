--[[
Author: GGELUA
Date: 2023-11-16 12:41:43
Last Modified by: GGELUA
Last Modified time: 2023-11-16 16:24:46
--]]
--[[
Author: GGELUA
Date: 2023-11-16 12:41:43
Last Modified by: GGELUA
Last Modified time: 2023-11-16 12:43:18
--]]

local 召唤兽染色 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("召唤兽染色",0,0,270,260)
local 当前 = 多开数据.当前
local 方向 = 5
local RGB = 1
function 召唤兽染色:初始化()
    __置窗口坐标(self)
    self.图像 = nil
    local nsf = require('SDL.图像')(270,260)
    if nsf:渲染开始() then
        置窗口背景("召唤兽染色",0,0,270,260,true):显示(0,0)
        __res:getPNGCC(3,761,370,308,163):拉伸(165,180):显示(100,30) --模型背景
        字体18:置颜色(__取颜色('白色'))
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.模型格子 = __UI模型格子.创建(当前)
    self.召唤兽选中 = nil
end

for i, v in ipairs {
    {name = '1', x = 10 ,y = 35 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '减'},
    {name = '2', x = 10 ,y = 80 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '加'},
    {name = '转身', x = 10 ,y = 180 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '转身'},
    {name = '确定', x = 190 ,y = 220 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(75,35) , font = '确定'},
    
} do
    local 临时函数 = 召唤兽染色:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '确定' then
            -- table.print(染色方案[RGB])
            多开数据[当前].__UI弹出.提示弹出:打开("为召唤兽染色每次需要消耗3000W银子,你确定要染色么?", 5015,{
                序列 = 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽染色.召唤兽选中].认证码,
                序列1= 染色方案[RGB].id,
                序列2= 染色方案[RGB].方案[1],
                序列3= 染色方案[RGB].方案[2],
                序列4= 染色方案[RGB].方案[3],
            })
        elseif v.name == "1" then
            RGB = RGB - 1
            if RGB <= 0 then
                RGB = 1
            end
        elseif v.name == "2" then
            RGB = RGB + 1
            if RGB >= 80 then
                RGB = 80
            end
        elseif v.name == '转身' then
            方向 = 方向 + 1
            if 方向 > 8 then 方向 = 1 end
        end
        local 召唤兽染色方案 = 染色方案[RGB]
        多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽染色.召唤兽选中].染色方案 = 召唤兽染色方案.id or 0
        多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽染色.召唤兽选中].染色组 = 多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽染色.召唤兽选中].染色组 or {}
        多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽染色.召唤兽选中].染色组[1] = 召唤兽染色方案.方案[1] or 0
        多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽染色.召唤兽选中].染色组[2] = 召唤兽染色方案.方案[2] or 0
        召唤兽染色.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[召唤兽染色.召唤兽选中], "召唤兽", 95, 40, nil, 方向)
    end
end

function 召唤兽染色:打开(data)
    self:置可见(true)
    self.召唤兽选中 = data
    if type(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.召唤兽选中].染色组) ~= "table" then
        多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.召唤兽选中].染色组 = {[1]=0,[2]=0}
    end
    self.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[self.召唤兽选中], "召唤兽", 95, 40)
end

function 召唤兽染色:显示(x, y)
    self.图像:显示(x, y)
    self.模型格子:显示(x+80, y+145)
end


local 关闭 = 召唤兽染色:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",225,0)
function 关闭:左键弹起(x,y,msg)
    召唤兽染色:置可见(false)
end
