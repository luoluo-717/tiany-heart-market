--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-12-23 13:13:35
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-12-26 15:06:35
FilePath: \XYQCS\lua\界面\窗口层\人物称谓.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
local 人物称谓 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("人物称谓",0,0,380,480)
local 当前 = 多开数据.当前

function 人物称谓:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(360,460)
    if nsf:渲染开始() then
        置窗口背景("人物称谓",0,12,360,460,true):显示(0,0)
        取属性背景(0,0,320,200,true):显示(20,80)
        取属性背景(0,0,320,100,true):显示(20,300)
        
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中 = nil 
end

function 人物称谓:显示(x,y)
    字体18:置颜色(__取颜色("白色")):显示(x+20,y+55,"当前称谓 "..(多开数据[当前 or self and self.当前].角色信息.当前称谓 or "无"))
end

function 人物称谓:打开() 
    self:置可见(true)
    人物称谓.称谓列表:重置()
    self.选中 = nil
    self.称谓说明文本:清空()
end

local 关闭 = 人物称谓:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",320,0)

function 关闭:左键弹起(x,y,msg)
    人物称谓:置可见(false)
end

local 称谓列表 = 人物称谓:创建列表("称谓列表",30,90,300,180)

function 称谓列表:初始化()
    self:置文字(字体18)
    self.行间距 = 10
end

function 称谓列表:重置()
    称谓列表:清空()
    称谓列表:置颜色(255,255,255)
    
    for i = 1,#多开数据[当前 or self and self.当前].角色信息.称谓 do
        称谓列表:添加(多开数据[当前 or self and self.当前].角色信息.称谓[i])
    end
end

function 称谓列表:左键弹起(x, y, i, item, msg)
    人物称谓.选中 = i
    人物称谓.称谓说明文本:清空()
    local 称谓名称 = 多开数据[当前 or self and self.当前].角色信息.称谓[i]
    local 说明 = 人物称谓:取称谓说明(称谓名称)
    人物称谓.称谓说明文本:置文本(说明)
end

local 称谓说明文本 = 人物称谓:创建文本("称谓说明文本",30,310,300,80)

function 称谓说明文本:初始化()
end

function 人物称谓:取称谓说明(称谓)
    if not 称谓 then return "" end
    if 称谓 == "九天揽月" or 称谓 == "威震天下" then
        return "伤害+200、灵力+100、限时7天"
   
    else
        return "未知称谓"
    end
end

local 更改 = 人物称谓:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true),"更改",126,420,"更改")

function 更改:左键弹起(x,y,msg)
    if 人物称谓.选中 then
        发送数据(当前 or self and self.当前,31,{称谓ID=人物称谓.选中 or 0})
        多开数据[当前].角色信息["当前称谓"] = 多开数据[当前].角色信息["称谓"][人物称谓["选中"]]
        多开数据[当前].__主显.主角:置称谓(多开数据[当前].角色信息.当前称谓)
        人物称谓:置可见(false)
    end
end