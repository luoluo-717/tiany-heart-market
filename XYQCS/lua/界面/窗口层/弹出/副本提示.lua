--[[
Author: GGELUA
Date: 2023-11-05 21:30:11
Last Modified by: GGELUA
Last Modified time: 2023-11-07 15:22:18
--]]
--[[
Author: GGELUA
Date: 2023-10-06 13:50:26
Last Modified by: GGELUA
Last Modified time: 2023-10-06 13:51:32
--]]
多开数据[多开数据.当前].__UI弹出.副本提示 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("副本提示",0,0,392,200)
local 当前 = 多开数据.当前
local 副本提示 = 多开数据[多开数据.当前].__UI弹出.副本提示
function 副本提示:初始化()
    __置窗口坐标(self)
    self:置精灵(置窗口背景(nil,0,0,392,200))
end

function 副本提示:打开(txt,xh,nt,xh2,nt2)
    self:置可见(true)
    self.提示文本:清空()
    self.提示文本:置文本(txt)
    self.序号 = xh
    self.内容 = nt
    self.序号2 = xh2
    self.内容2 = nt2
end

local 提示文本 = 副本提示:创建文本("提示文本",18,52,358,75)
function 提示文本:初始化()

end

for i, v in ipairs {
    {name = '创建副本', x = 30 ,y = 140 , tcp = __res:getPNGCC(3,511,11,117,43,true) , font = '创建副本'},
    {name = '进入副本', x = 239 ,y = 140 , tcp = __res:getPNGCC(3,511,11,117,43,true),  font = '进入副本'},
    
} do
    local 临时函数 = 副本提示:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '创建副本' then
            发送数据(当前 or self and self.当前,27,{副本提示.内容.副本名称})
            副本提示:置可见(false)
        elseif v.name == '进入副本' then
            发送数据(当前 or self and self.当前,34,{副本提示.内容.副本名称}) 
            副本提示:置可见(false)
        end
    end
end