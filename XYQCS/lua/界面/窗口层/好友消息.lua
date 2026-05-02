--[[
    @Author       : GGELUA
    @Date         : 2022-06-15 17:12:44
Last Modified by: GGELUA
Last Modified time: 2023-11-08 14:08:54
--]]
local 好友消息 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("好友消息",0,0,648,526)
local 当前 = 多开数据.当前
function 好友消息:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(648,526)
    if nsf:渲染开始() then
        置窗口背景("好友消息",0,12,642,516,true):显示(0,0)
        __res:getPNGCC(1,792,0,270,380):显示(10,120+10)
        取白色背景(0,0,345,420,true):显示(285,30+10)
        __res:getPNGCC(3,736,1155,199,37,true):拉伸(147,36):显示(335,464+10)
        字体18:置颜色(__取颜色('白色'))
        local lssj = 取输入背景(0,0,80,23):置颜色(__取颜色('黑色'))
        字体18:取图像('ID'):显示(81,62+10)
        lssj:显示(104,60+10)
        字体18:取图像('友好'):显示(22,91+10)
        lssj:显示(65,89+10)
        字体18:取图像('关系'):显示(152,91+10)
        lssj:显示(198,89+10)
        
    end
    self:置精灵(nsf:到精灵())
    self.聊天记录 = {}
end

function 好友消息:打开(data)
    self:置可见(true)
    self:重置(data)
    self.聊天文本:重置()
end

function 好友消息:重置(data)
    local nsf = require('SDL.图像')(648,504)
    if nsf:渲染开始() then
        __res:getPNGCC(3,757,291,57,57):拉伸(50,50):显示(20,34+10)
        local lssj = 取头像(data.模型)
        if lssj[2] == 0 then lssj[2] = lssj[1] end
        __res:取图像(__res:取地址('shape/mx/',lssj[2])):拉伸(48,48):显示(21,35+10)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像(data.名称):显示(81,34+10)
        字体18:取图像(data.id):显示(111,62+10)
        字体18:取图像((data.好友度 or 0)):显示(73,91+10)
        字体18:取图像((data.关系 or '陌生人')):显示(203,91+10)
        local lssj = 取头像(data.模型)
        if data.模型=="影精灵" then
        __res:取图像(__res:取地址('shape/mx/',lssj[6])):显示(40,220)
        else
        __res:取图像(__res:取地址('shape/mx/',lssj[6])):显示(153,460+10)
        end
    end
    self.图像 = nsf:到精灵()
    self.数据 = data
end

local 关闭 = 好友消息:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",598,0)

function 关闭:左键弹起(x,y,msg)
    好友消息:置可见(false)
end

for i, v in ipairs {
    {name = '表情', x = 496 ,y = 468 , tcp = __res:getPNGCC(4,539,2,45,45) },
    {name = '发送', x = 551 ,y = 472 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(77,41),  font = '发送'},
    
} do
    local 临时函数 = 好友消息:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '表情' then
            -- __UI界面.窗口层.消息综合:打开(好友消息)
            多开数据[当前].__UI界面.窗口层.消息综合:打开(好友消息)
        elseif v.name == '发送' then
            if 好友消息.消息输入:取文本() then
                发送数据(当前 or self and self.当前,6964,{id=好友消息.数据.id,内容=好友消息.消息输入:取文本()})
                好友消息.消息输入:清空()
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('Y您想说点什么给对方听呢？')
            end
        end
    end
end

local 消息输入 = 好友消息:创建输入("消息输入",344,482,144,18)
function 消息输入:初始化()
    self:取光标精灵()
    self:置限制字数(30)
    self:置颜色(__取颜色('黑色'))
end

local 聊天文本 = 好友消息:创建我的文本("聊天文本",298,55,317,395,true)

function 聊天文本:重置()
    self:清空()
    if 好友消息.聊天记录[好友消息.数据.id] then
        for i, v in ipairs(好友消息.聊天记录[好友消息.数据.id]) do
            self:置文本(v)
        end
    end
end