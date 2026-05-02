--[[
Author: GGELUA
Date: 2024-04-25 20:20:20
Last Modified by: GGELUA
Last Modified time: 2024-04-25 20:53:47
--]]
local 当前 = 多开数据.当前
local 收购出售 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("收购出售",0,0,663,440)
function 收购出售:初始化()
    字体28 = require("SDl.文字")("assets/hkyt.ttf", 28, true):置颜色(__取颜色("红色"))
    __置窗口坐标(self,'中')
    self.动画 = __res:取动画2(__res:取地址('shape/ui/xz/',0x1D5461ED))
    local nsf = require('SDL.图像')(663,440)
    if nsf:渲染开始() then
        置窗口背景("出售",0,12,655,430,true):显示(0,0)
        字体16:置颜色(__取颜色('白色'))
        字体16:取图像("摊主"):显示(21,50)
        取输入背景(0, 0, 100, 23):显示(60, 48)
        字体16:取图像("ID"):显示(170,50)
        取输入背景(0, 0, 70, 23):显示(190, 48)


        取白色背景(0, 0, 260, 320, true):显示(21,80)
        取灰色背景(0,0,260,50,true):拉伸(260,30):置透明(100):显示(21,82)
        字体16:置颜色(__取颜色('白色'))
        字体16:取图像("求购区"):显示(31,90)
        字体16:取图像("价格"):显示(200,90)

        取白色背景(0, 0, 315, 310, true):显示(290,50)
        取灰色背景(0,0,180,50,true):拉伸(315,30):置透明(100):显示(290,52)
        字体16:取图像("拥有道具"):显示(330,60)

        字体16:取图像("出售数量"):显示(290,372)
        取输入背景(0, 0, 100, 23):显示(370, 370)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 收购出售:打开(data)
    self.数据 = data
    self:置可见(true)
end

function 收购出售:显示(x,y)
    字体16:置颜色(__取颜色('黑色')):取精灵(self.数据.角色):显示(x+65,y+52)
    字体16:置颜色(__取颜色('黑色')):取精灵(self.数据.id):显示(x+195,y+52)
end

function 收购出售:刷新收购道具(data)
    self.收购道具 = data
    self.已收购网格:置物品(data)
end

local 已收购网格 = 收购出售:创建我的网格("已收购网格",30,120,240,270,230,55,13,13,10,1,true)

function 已收购网格:置物品(data)
    for i = 1,#self.子控件 do
        local lssj = __物品格子.创建(当前)
        if data[i] then
            lssj:置物品(data[i],"白格子","已收购网格",data[i].名称)
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵(nil)
        end
    end
end

function 收购出售:刷新背包道具(data)
    local 可回收 = {}
    for i=1,80 do
        if data[i] then
            可回收[#可回收+1] = data[i]
            可回收[#可回收].序号 = i
            可回收[#可回收].出售编号 = self:检测是否收购(data[i]) 
        end
    end
    self.道具网格:置物品(data)
end

function 收购出售:检测是否收购(数据)
    local 编号 = 0
    for i=1,#self.收购道具 do
        if 数据.名称 == self.收购道具[i].名称 then
            if self.收购道具[i].重点 ~= nil and self.收购道具[i].重点 ~= "" then
                if 数据.名称 == "星辉石"  or 数据.名称 == "附魔宝珠" or 数据.名称 == "战魄"then
                    local tb = 分割文本(self.收购道具[i].重点, "级")
                    if 数据.等级 == tonumber(tb[1]) then
                        编号 = i
                    end
                elseif 数据.名称 == "召唤兽内丹" or  数据.名称 == "高级召唤兽内丹" then
                    if 数据.特效 == self.收购道具[i].重点 then
                        编号 = i
                    end
                elseif 数据.名称 == "特效宝珠" then
                    if 数据.特效 == self.收购道具[i].重点 then
                        编号 = i
                    end
                 elseif 数据.名称 == "玄龟板" or 数据.名称 == "阴沉木" or 数据.名称 == "麒麟血"
                    or 数据.名称 ==  "内丹" or 数据.名称 == "金凤羽" or 数据.名称 == "补天石" or 数据.名称 == "龙之筋" then
                    if 数据.五行 == self.收购道具[i].重点 then
                        编号 = i
                    end
                elseif 数据.名称 == "未激活的星石"  then
                    if 取星石部位(数据.子类) == self.收购道具[i].重点 then
                        编号 = i
                    end
                elseif 数据.名称 == "精魄灵石"  then
                    local tb = 分割文本(self.收购道具[i].重点, "级")
                    if 数据.等级 == tonumber(tb[1]) and 数据.特效 == tb[2] then
                        编号 = i
                    end
                elseif 数据.名称 == "钟灵石"  then
                    local tb = 分割文本(self.收购道具[i].重点, "级")
                    if 数据.等级 == tonumber(tb[1]) and 数据.技能 == tb[2] then
                        编号 = i
                    end
                elseif 数据.名称 == "百炼精铁" or 数据.名称 == "元灵晶石" then
                    local tb = 分割文本(self.收购道具[i].重点, "级")
                    if 数据.子类 == tonumber(tb[1]) then
                        编号 = i
                    end
                elseif 数据.名称 == "魔兽要诀" or 数据.名称 == "高级魔兽要诀" or 数据.名称 == "特殊魔兽要诀" then
                    if 数据.附带技能 == self.收购道具[i].重点 then
                        编号 = i
                    end
                elseif 数据.名称 == "灵饰指南书" then
                    local tb = 分割文本(self.收购道具[i].重点, "级")
                    if 数据.子类 == tonumber(tb[1]) and 数据.特效 == tb[2] then
                        编号 = i
                    end
                elseif 数据.名称 == "制造指南书" then
                    local tb = 分割文本(self.收购道具[i].重点, "级")
                    local 种类 = 多开数据[当前].__主控:取武器子类(数据.特效)
                    if 数据.子类 == tonumber(tb[1]) and 种类 == tb[2] then
                        编号 = i
                    end
                end
            else
                if 数据.名称 == "天赋符" then
                    if 数据.属性 == nil  then
                        编号 = i
                    end
                else
                    编号 = i
                end
            end
        end
    end
    return 编号
end


local 道具网格 = 收购出售:创建我的网格("道具网格",295,90,330,270,55,55,1,1,16,5,true)

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        if 收购出售.选中 and self.子控件[收购出售.选中]._spr then
            self.子控件[收购出售.选中]._spr.确定 = nil
        end
        收购出售.选中 = a
        self.子控件[收购出售.选中]._spr.确定 = true
        收购出售.出售数量:置文本(1)
    end
end

function 道具网格:置物品(data)
    for i = 1,#self.子控件 do
        local lssj = __物品格子.创建(当前)
        if data[i] then
            lssj:置物品(data[i],"白格子","战斗道具")
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵(nil)
        end
    end
end

local 关闭 = 收购出售:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",612,0)
function 关闭:左键弹起(x,y,msg)
    收购出售:置可见(false)
end

local 出售数量 = 收购出售:创建输入("出售数量",380,372,90,18)
function 出售数量:初始化()
    self:取光标精灵()
    self:置限制字数(3)
    self:置颜色(__取颜色('黑色'))
end

local 出售道具 = 收购出售:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"出售道具",500,370,"出售道具")
function 出售道具:左键弹起(x,y,msg)
    if 收购出售.选中 and 收购出售.道具网格.子控件[收购出售.选中]._spr and 收购出售.道具网格.子控件[收购出售.选中]._spr.物品 and 收购出售.道具网格.子控件[收购出售.选中]._spr.物品.出售编号 ~= 0 then
        发送数据(当前,3720.7,{选中=收购出售.选中,id=收购出售.数据.招牌id,编号=收购出售.道具网格.子控件[收购出售.选中]._spr.物品.出售编号,单价=收购出售.收购道具[收购出售.道具网格.子控件[收购出售.选中]._spr.物品.出售编号].单价,数量=tonumber(收购出售.出售数量:取文本()) or 1})
    end
end


