--[[
    @Author       : GGELUA
    @Date         : 2022-04-18 17:31:19
Last Modified by: GGELUA
Last Modified time: 2023-10-07 16:21:31
--]]
local 消息管理 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("消息管理",0,10,570,530)
local 当前 = 多开数据.当前
local function 字符串判定(str,item)
	local t = {}
	local l = {}
	local index = 0
	for i = 1, string.len(str) do
		table.insert(t, string.byte(string.sub(str, i, i)))
	end

	for i = 1, string.len(item) do
		table.insert(l, string.byte(string.sub(item, i, i)))
	end
	if #l > #t then
		return false
	end

	for k, v1 in pairs(t) do
		index = index + 1
		if v1 == l[1] then
			local iscontens = true
			for i = 1, #l do
				if t[index + i - 1] ~= l[i] then
					iscontens = false
				end
			end
			if iscontens then
				return iscontens
			end
		end
	end
	return false
end

function 消息管理:初始化()
    local nsf = require('SDL.图像')(570,530)
    if nsf:渲染开始() then
        __res:getPNGCC(4,0,0,535,529):显示(0,0)
        -- 取输入背景(0,0,200,34):显示(130,476)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 消息管理:打开(data)
    self:置可见(true)
    for _,k in ipairs(多开数据[当前].__UI界面.界面层.左下角.消息缓存['xt']) do
        消息管理.聊天文本:添加文本(k,'xt')
    end
    self.xt:置选中(true)
    self.发送方式 = 1
    self.附加数据={}
    self.选中 = 'xt'
end

local 关闭 = 消息管理:创建我的按钮(__res:getPNGCC(2,1138,475,31,64),"关闭",535,215)

function 关闭:左键弹起(x,y,msg)
    消息管理:置可见(false)
    if 多开数据[当前].__UI界面.窗口层.消息综合.是否可见 then
        多开数据[当前].__UI界面.窗口层.消息综合:打开(消息管理)
    end
end

for i, v in ipairs {
    {name = 'xt', x = 48 ,y = 60 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(73,50),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(73,50),font = '系统'},
    {name = 'sj', x = 48 ,y = 60+55 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(73,50),tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(73,50),font = '世界'},
    {name = 'bp', x = 48 ,y = 60+55*2 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(73,50), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(73,50),font = '帮派'},
    {name = 'dq', x = 48 ,y = 60+55*3 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(73,50), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(73,50),font = '当前'},
    {name = 'cw', x = 48 ,y = 60+55*4 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(73,50), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(73,50),font = '传闻'},
    {name = 'dw', x = 48 ,y = 60+55*5 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(73,50), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(73,50),font = '队伍'},
    {name = 'cy', x = 48 ,y = 60+55*6 , tcp = __res:getPNGCC(3,880,331,86,37,true):拉伸(73,50), tcp2 = __res:getPNGCC(3,876,289,85,36,true):拉伸(73,50),font = '传音'},
} do
    local  临时函数 = 消息管理:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        消息管理.聊天文本:清空()
        for _,k in ipairs(多开数据[当前].__UI界面.界面层.左下角.消息缓存[v.name]) do
            消息管理.聊天文本:添加文本(k,v.name)
        end
        消息管理.选中 = v.name
    end
end

local 聊天文本 = 消息管理:创建我的文本("聊天文本",140,77,343,376,true)

function 聊天文本:添加文本(文本,频道)
    if self._max > 1500 then
        self:清空()
    end
    if not 频道 or not __频道表[频道] then 
        频道 = "dq"
    end
    self:置文本('#'..__频道表[频道]..文本)
    self._py = -self._max
end

function 聊天文本:回调左键弹起(cb,msg)
    -- print(cb,msg)
end 

local 消息输入 = 消息管理:创建输入("消息输入",133,485,190,18)
function 消息输入:初始化()
    self:取光标精灵()
    self:置限制字数(30)
    self:置颜色(__取颜色('黑色'))
end

local 表情 = 消息管理:创建我的按钮(__res:getPNGCC(4,539,2,45,45,true),"表情",328,470)

function 表情:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.消息综合:打开(消息管理)
end

local 序列表 = {
    sj = 3 ,
    bp = 6 ,
    dq = 1 ,
    cw = 5 ,
    dw = 2 ,
    cy = 7 ,
}

local 发送 = 消息管理:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true),"发送",383,473,"发送")

function 发送:左键弹起(x,y,msg)
    if 消息管理.消息输入:取文本() then
        if 序列表[消息管理.选中] then
            if self.发送方式 == 1 then
                发送数据(当前 or self and self.当前,6001,{频道=序列表[消息管理.选中],文本=消息管理.消息输入:取文本(),发送方式=消息管理.发送方式})
                消息管理.消息输入:清空()
            else
                -- local pd = false
				-- for i=1,#消息管理.附加数据 do
				-- 	if 字符串判定(消息管理.消息输入:取文本(),消息管理.附加数据[i].类型2) and 消息管理.附加数据[i].类型 ~= "" and 消息管理.附加数据[i].类型1 ~= "" and 消息管理.附加数据[i].编号 ~= 0 then
				-- 		pd = true
				-- 	else
				-- 		pd = false
				-- 		break
				-- 	end
				-- end
                if #消息管理.附加数据 > 0 and (序列表[消息管理.选中] == 3 or 序列表[消息管理.选中] == 2 or 序列表[消息管理.选中] == 7) then
                    发送数据(当前 or self and self.当前,6001,{频道=序列表[消息管理.选中],文本=消息管理.消息输入:取文本(),发送方式=2,超链接=消息管理.附加数据})
                    消息管理.消息输入:清空()
                    消息管理.发送方式=1
					消息管理.附加数据 = {}
                else
                    发送数据(当前 or self and self.当前,6001,{频道=序列表[消息管理.选中],文本=消息管理.消息输入:取文本(),发送方式=1})
                    消息管理.消息输入:清空()
                    消息管理.发送方式=1
					消息管理.附加数据 = {}
                end
            end
        end
    else
        
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/温馨提示：你还未输入内容")
    end
end


