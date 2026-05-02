--[[
    @Author       : GGELUA
    @Date         : 2022-07-12 18:25:41
Last Modified by: GGELUA
Last Modified time: 2023-06-13 14:03:53
--]]
local 认证技能 = {雷击=1,落岩=1,水攻=1,烈火=1,奔雷咒=1,泰山压顶=1,水漫金山=1,地狱烈火=1,上古灵符=1}
多开数据[多开数据.当前].__UI弹出.技能选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("技能选择",0,0,335,350)
local 技能选择 = 多开数据[多开数据.当前].__UI弹出.技能选择
local 当前 = 多开数据.当前
function 技能选择:初始化()
    local nsf = require('SDL.图像')(335,350)
    if nsf:渲染开始() then
        取黑透明背景(0,0,335,350,true):显示(0,0)
        取灰色背景(0,0,308,220,true):显示(20,14)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 技能选择:打开(数据,x,y)
    self:置坐标(x+abbr.py2.x,y+abbr.py2.y)
    self:置可见(true)
    self.技能网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[数据].技能,多开数据[当前 or self and self.当前].角色信息.宝宝列表[数据].法术认证)
    self.选中技能 = nil
    self.选中召唤兽 = 数据
end

local 技能网格 = 技能选择:创建网格("技能网格",30,24,273,202)

function 技能网格:初始化()
    self:创建格子(55,55,18,18,9,4,true)
end
function 技能网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        if 技能选择.选中技能 and self.子控件[技能选择.选中技能]._spr.确定 then
            self.子控件[技能选择.选中技能]._spr.确定 = nil
        end
        技能选择.选中技能 = a
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(x,y)
    end
end
function 技能网格:置数据(数据,认证)
    for i = 1,#self.子控件 do
        local lssj = __召唤兽技能格子.创建(当前)
        if 认证 and i == 认证 then
            认证 = 数据[i]
        end
        lssj:置数据(数据[i],55,55,nil,认证)
        self.子控件[i]:置精灵(lssj)
    end
end

local 认证法术 = 技能选择:创建我的按钮(__res:getPNGCC(3,126,563,111,36,true),"认证法术",208,300,"认证法术")

function 认证法术:左键弹起(x,y,msg)
    if 技能选择.选中召唤兽 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[技能选择.选中召唤兽] and 技能选择.选中技能 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[技能选择.选中召唤兽].技能[技能选择.选中技能] then
        if 认证技能[多开数据[当前 or self and self.当前].角色信息.宝宝列表[技能选择.选中召唤兽].技能[技能选择.选中技能]] then
            发送数据(当前 or self and self.当前,5023,{序列=技能选择.选中技能,序列1=技能选择.选中召唤兽,序列2=多开数据[当前 or self and self.当前].角色信息.宝宝列表[技能选择.选中召唤兽].技能[技能选择.选中技能]})
            技能选择:置可见(false)
        else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y这个技能无法认证')
        end
    end
end