--[[
    @Author       : GGELUA
    @Date         : 2022-06-15 09:52:33
Last Modified by: GGELUA
Last Modified time: 2023-11-08 14:05:57
--]]
local 好友 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("好友",0,0,276,505)
local 当前 = 多开数据.当前
function 好友:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(276,505)
    if nsf:渲染开始() then
        置窗口背景("好友",0,12,268,495,true):显示(0,0)
        取白色背景(0,0,246,316,true):显示(11,122)
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像('所有在线好友'):显示(68,129)
        __res:getPNGCC(3,736,1155,199,37,true):拉伸(247,36):显示(11,77)
    end
    self:置精灵(nsf:到精灵())
    self.允许移动 = true
end

function 好友:打开(data)
    self:置可见(true)

    self.目录:重置(data)
end

local 关闭 = 好友:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",226,0)

function 关闭:左键弹起(x,y,msg)
    好友:置可见(false)
end

local 目录 = 好友:创建树形列表("目录",37,160,195,270)

function 目录:初始化()
    self:置文字(字体18)
    self.行间距 = 10
end

function 目录:重置(data)
    self:清空()
    self:置颜色(__取颜色('红色'))
    self:添加('梦幻精灵')
    self:置颜色(__取颜色('黑色'))
    for i, v in ipairs{
        { name ='我的好友' , son = '好友'} ,
        { name ='临时好友' , son = '临时'} ,
        { name ='最近联系人' , son = '最近'} ,
        { name ='黑名单' , son = '黑名单'} ,
    } do
        self:置颜色(__取颜色('黑色'))
        self:添加(v.name..self:取数量(data,v.son))
        for s, k in ipairs(data[v.son]) do
            if k.在线 then
                self:置颜色(__取颜色('绿色'))
            else
                self:置颜色(__取颜色('浅黑'))
            end
            self._node[#self._node]:添加(k.名称)
            self._node[#self._node]._node[#self._node[#self._node]._node].数据 = k
        end
    end
    好友.数据 = data
end

function 目录:左键弹起(x, y, i, item, msg)
    if item.数据 then
       多开数据[当前 or self and self.当前].__UI弹出.好友弹出:打开(item.数据)
    end
end

function 目录:取数量(data,lx)
	local 在线=0
	local 总计=#data[lx]
	for n=1,#data[lx] do
		if data[lx][n].在线 then
			在线=在线+1
		end
	end
	return string.format("(%s/%s)",在线,总计)
end

for i, v in ipairs {
    {name = '消息', x = 11 ,y = 43 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(78,35) , font = '消息'},
    {name = '好友', x = 96 ,y = 43 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(78,35) , font = '好友'},
    {name = '群', x = 182 ,y = 43 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(78,35) , font = '群'},
    {name = '设置', x = 11 ,y = 450 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(78,41) , font = '设置'},
    {name = '查找', x = 96 ,y = 450 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(78,41) , font = '查找'},
    {name = '红包', x = 182 ,y = 450 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(78,41) , font = '红包'},
} do
    local 临时函数 = 好友:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '消息' then
    
        elseif v.name == '查找' then
            if 多开数据[当前].__UI界面.窗口层.在线查询.是否可见 then
                多开数据[当前].__UI界面.窗口层.在线查询.关闭:左键弹起()
            else
                多开数据[当前].__UI界面.窗口层.在线查询:打开(内容)
            end
        end
    end
end