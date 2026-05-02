--[[
Author: GGELUA
Date: 2024-10-26 23:41:50
Last Modified by: GGELUA
Last Modified time: 2024-10-26 23:44:22
--]]
--[[
Author: GGELUA
Date: 2024-10-01 21:32:00
Last Modified by: GGELUA
Last Modified time: 2024-10-26 20:30:39
--]]
多开数据[多开数据.当前].__UI弹出.通用选择弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("通用选择弹出",0,0,引擎.宽度, 引擎.高度)
local 通用选择弹出 = 多开数据[多开数据.当前].__UI弹出.通用选择弹出

function 通用选择弹出:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(150, 200)
    if nsf:渲染开始() then
        取黑透明背景(0,0,150, 200,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 通用选择弹出:打开(x, y,类型,内容)
    self.x=x
    self.y=y
    self.类型=类型
    self.内容=内容
    self:重置()   
    self:置可见(true)   
end
function 通用选择弹出:重置()
    self.按钮列表=nil
    local 临时函数=self:创建列表('按钮列表',5,5,140,200)
    function 临时函数:初始化()
        self:置文字(字体18)              
        self.行间距 = 25       
        self:重置数据()  
    end
    function 临时函数:重置数据()  
         self:清空()
         self.行高度 = 25
        for _1, v3 in ipairs(通用选择弹出.内容) do
             if v3 then
                 local nsf = require('SDL.图像')(100,25)
                     if nsf:渲染开始() then
                         字体18:置颜色(__取颜色('白色'))
                         字体18:取图像(v3):显示(5,5)
                         nsf:渲染结束()
                     end
                     local r = self:添加()
                     r:置精灵(nsf:到精灵())
                     r.序列名=v3
             end
         end  
     end
    function 临时函数:左键按下(x, y, i, item, msg)
        if self.子控件[i].序列名 then
            if 通用选择弹出.类型=="界面切换" then
                全局界面风格=self.子控件[i].序列名
                全局切换界面()
                多开数据[多开数据.当前].__UI界面.窗口层.系统设置:刷新选页()
            end
        end
        通用选择弹出:置可见(false)   
    end 
    
    
end