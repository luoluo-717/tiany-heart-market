--[[
Author: GGELUA
Date: 2024-01-28 17:10:38
Last Modified by: GGELUA
Last Modified time: 2024-01-28 17:10:59
--]]
多开数据[多开数据.当前].__UI弹出.自由提示 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("自由提示",0,0,392,260)
local 当前 = 多开数据.当前
local 自由提示 = 多开数据[多开数据.当前].__UI弹出.自由提示
function 自由提示:初始化()
    __置窗口坐标(self)
    self:置精灵(置窗口背景(nil,0,0,392,260))
end

function 自由提示:打开(txt,xh,nt,xh2,nt2)
    self:置可见(true)
    self.提示文本:清空()
    self.提示文本:置文本(txt)
    self.序号 = xh
    self.内容 = nt
    self.序号2 = xh2
    self.内容2 = nt2
end

local 提示文本 = 自由提示:创建文本("提示文本",18,52,358,260)
function 提示文本:初始化()

end

local 关闭 = 自由提示:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",340,0)

function 关闭:左键弹起(x,y,msg)
    自由提示:置可见(false)
end


-- for i, v in ipairs {
--     {name = '确定', x = 30 ,y = 140 , tcp = __res:getPNGCC(3,511,11,117,43,true) , font = '确定'},
--     {name = '取消', x = 239 ,y = 140 , tcp = __res:getPNGCC(3,511,11,117,43,true),  font = '取消'},
    
-- } do
--     local 临时函数 = 自由提示:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
--     function 临时函数:左键弹起(x, y)
--         if v.name == '确定' then
--             发送数据(当前 or self and self.当前,自由提示.序号,自由提示.内容)
--             自由提示:置可见(false)
--         elseif v.name == '取消' then
--             if 自由提示.序号2 and 自由提示.内容2 then
--                 发送数据(当前 or self and self.当前,自由提示.序号2,自由提示.内容2) 
--             end
--             自由提示:置可见(false)
--         end
--     end
-- end