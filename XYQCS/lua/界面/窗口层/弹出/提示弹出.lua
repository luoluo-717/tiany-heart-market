--[[
Author: GGELUA
Date: 2024-06-27 10:51:49
Last Modified by: GGELUA
Last Modified time: 2024-07-04 11:11:59
--]]
多开数据[多开数据.当前].__UI弹出.提示弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("提示弹出",0,0,392,200)
local 当前 = 多开数据.当前
local 提示弹出 = 多开数据[多开数据.当前].__UI弹出.提示弹出
function 提示弹出:初始化()
    __置窗口坐标(self)
    self:置精灵(置窗口背景(nil,0,0,392,200))
end

function 提示弹出:打开(txt,xh,nt,xh2,nt2)
    self:置可见(true)
    self.提示文本:清空()
    self.提示文本:置文本(txt)
    self.序号 = xh
    self.内容 = nt
    self.序号2 = xh2
    self.内容2 = nt2
end

local 提示文本 = 提示弹出:创建文本("提示文本",18,52,358,75)
function 提示文本:初始化()

end

function 提示弹出:自动同意入队()
    self.队伍id = self.内容.队长id
    self.邀请id = self.内容.邀请id
    self.内容 = {队伍id = self.队伍id, 邀请id = self.邀请id}
    发送数据(当前 or self and self.当前,4015,self.内容)
    self:置可见(false)
end

function 提示弹出:更新(dt)
    if self.序号 == 4015  then
        self.队伍id = self.内容.队长id
        self.邀请id = self.内容.邀请id
        self.内容 = {队伍id = self.队伍id, 邀请id = self.邀请id}
        发送数据(当前 or self and self.当前,self.序号,self.内容)
        self:置可见(false)
    end
end

for i, v in ipairs {
    {name = '确定', x = 30 ,y = 140 , tcp = __res:getPNGCC(3,511,11,117,43,true) , font = '确定'},
    {name = '取消', x = 239 ,y = 140 , tcp = __res:getPNGCC(3,511,11,117,43,true),  font = '取消'},
    
} do
    local 临时函数 = 提示弹出:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '确定' then
            if 提示弹出.序号 == 4015 then
                提示弹出.队伍id = 提示弹出.内容.队长id
                提示弹出.邀请id = 提示弹出.内容.邀请id
                提示弹出.内容 = {队伍id = 提示弹出.队伍id, 邀请id = 提示弹出.邀请id}
            end
            发送数据(当前 or self and self.当前,提示弹出.序号,提示弹出.内容)
            提示弹出:置可见(false)
        elseif v.name == '取消' then
            if 提示弹出.序号2 and 提示弹出.内容2 then
                发送数据(当前 or self and self.当前,提示弹出.序号2,提示弹出.内容2) 
            end
            提示弹出:置可见(false)
        end
    end
end