local GGEF = require('GGE.函数')

local 活跃分割={}
local 活动指引 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("活动指引", 0, 0, 700, 500)

local 当前 = 多开数据.当前
function 活动指引:初始化()
	self.领取记录 = nil

end

function 活动指引:打开(数据)
    self.数据=数据
	self.签到奖励 = 数据.签到奖励
	table.print(self.签到奖励)
	self:置窗口()
    self.累计签到:置选中(true)
    self.累签系统:重置()
	self:置可见(true)
    self.限时活动:置选中(false)
    self.日常任务:置选中(false)
   	self.副本任务:置选中(false)
	self.活动控件:置可见(false)
	self.提示控件:置可见(false)
	self.活跃=数据.活跃度
	if 数据.领取记录~=nil then
			self.领取记录 = 数据.领取记录
		end
	if self.活跃>=300 and self.领取记录~=nil and self.领取记录[6]==1 then
		self.葫芦1:置可见(true)
		self.葫芦2:置可见(true)
		self.葫芦3:置可见(true)
		self.葫芦4:置可见(true)
		self.葫芦5:置可见(true)
		self.葫芦6:置可见(true)

	elseif self.活跃>=250 and self.领取记录~=nil and self.领取记录[5]==1 then
		self.葫芦1:置可见(true)
		self.葫芦2:置可见(true)
		self.葫芦3:置可见(true)
		self.葫芦4:置可见(true)
		self.葫芦5:置可见(true)
		self.葫芦6:置可见(false)

	elseif self.活跃>=200 and self.领取记录~=nil and self.领取记录[4]==1 then
		self.葫芦1:置可见(true)
		self.葫芦2:置可见(true)
		self.葫芦3:置可见(true)
		self.葫芦4:置可见(true)
		self.葫芦5:置可见(false)
		self.葫芦6:置可见(false)

	elseif self.活跃>=150 and self.领取记录~=nil and self.领取记录[3]==1 then
		self.葫芦1:置可见(true)
		self.葫芦2:置可见(true)
		self.葫芦3:置可见(true)
		self.葫芦4:置可见(false)
		self.葫芦5:置可见(false)
		self.葫芦6:置可见(false)

	elseif self.活跃>=100 and self.领取记录~=nil and self.领取记录[2]==1 then
		self.葫芦1:置可见(true)
		self.葫芦2:置可见(true)
		self.葫芦3:置可见(false)
		self.葫芦4:置可见(false)
		self.葫芦5:置可见(false)
		self.葫芦6:置可见(false)

	elseif self.活跃>=50 and self.领取记录~=nil and self.领取记录[1]==1 then
		self.葫芦1:置可见(true)
		self.葫芦2:置可见(false)
		self.葫芦3:置可见(false)
		self.葫芦4:置可见(false)
		self.葫芦5:置可见(false)
		self.葫芦6:置可见(false)

	else
		self.葫芦1:置可见(false)
		self.葫芦2:置可见(false)
		self.葫芦3:置可见(false)
		self.葫芦4:置可见(false)
		self.葫芦5:置可见(false)
		self.葫芦6:置可见(false)

	end
    活动指引:属性重置()
end
function 活动指引:属性重置()
 活动指引.经验条:置位置(math.floor(self.活跃 / 300 * 80))
end

local 经验条 = 活动指引:创建进度("经验条", 85, 170, 430, 8)
function 经验条:初始化()
    self:置精灵(__res:getPNGCC(1, 587, 108, 183, 16):到精灵())
end

function 活动指引:置窗口()
	__置窗口坐标(self)
    local nsf = require('SDL.图像')(700,500)
    if nsf:渲染开始() then
         __res:getPNGCC(16, 0, 0, 700, 500):显示(0,0)
		__res:取图像(__res:取地址("shape/ui/xz/", 0xA1100062)):显示(114,135)
		__res:取图像(__res:取地址("shape/ui/xz/", 0xA1100063)):显示(114+85-24,135)
		__res:取图像(__res:取地址("shape/ui/xz/", 0xA1100064)):显示(114+85*2-44,135)
		__res:取图像(__res:取地址("shape/ui/xz/", 0xA1100065)):显示(114+85*3-67,135)
		__res:取图像(__res:取地址("shape/ui/xz/", 0xA1100066)):显示(114+85*4-90,135)
		__res:取图像(__res:取地址("shape/ui/xz/", 0xA1100067)):显示(114+85*4+65-93,135)
        __res:取图片("shape/pic/jy.png"):拉伸(430,8):显示(85, 170) 


		字体14:置颜色(__取颜色("黑色"))
        字体14:取图像(50):显示(130, 175)
		字体14:取图像(100):显示(130+59, 175)
		字体14:取图像(150):显示(130+59*2+5, 175)
		字体14:取图像(200):显示(130+59*3+10, 175)
		字体14:取图像(250):显示(130+59*4+10, 175)
		字体14:取图像(300):显示(130+59*5+15, 175)

		字体14:取图像("当前活跃度:"..self.数据.活跃度):显示(500, 130)



        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

for i, v in ipairs {
    {name = '累计签到', x = 40 ,y = 190 , tcp =取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),1), tcp2 = 取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),3), font = '累计签到'},
    {name = '日常任务', x = 188 ,y = 190 , tcp =取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),1), tcp2 = 取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),3), font = '日常任务'},
    {name = '限时活动', x = 336 ,y = 190 , tcp =取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),1), tcp2 = 取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),3) , font = '限时活动'},
    {name = '副本任务', x = 484 ,y = 190 , tcp =取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),1), tcp2 = 取图像指定帧(__res:取地址("shape/ui/hyd/", 0x00000123),3) , font = '副本任务'},
} do
    local  临时函数 = 活动指引:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
		if v.name == "日常任务" then
			活动指引.累计签到:置选中(false)
			活动指引.限时活动:置选中(false)
			活动指引.副本任务:置选中(false)
    		活动指引.累签系统:置可见(false)
			活动指引.日常任务:置选中(true)
			活动指引.活动控件:重置(v.name)
		elseif v.name == "限时活动" then
			活动指引.累计签到:置选中(false)
			活动指引.日常任务:置选中(false)
			活动指引.副本任务:置选中(false)
    		活动指引.累签系统:置可见(false)
			活动指引.限时活动:置选中(true)
			活动指引.活动控件:重置(v.name)
		elseif v.name == "副本任务" then
			活动指引.累计签到:置选中(false)
			活动指引.限时活动:置选中(false)
			活动指引.日常任务:置选中(false)
    		活动指引.累签系统:置可见(false)
			活动指引.副本任务:置选中(true)
			活动指引.活动控件:重置(v.name)
		elseif v.name == "累计签到" then
			活动指引.副本任务:置选中(false)
			活动指引.限时活动:置选中(false)
			活动指引.日常任务:置选中(false)
			活动指引.累计签到:置选中(true)
    		活动指引.累签系统:置可见(true)
			活动指引.活动控件:置可见(false)
		end
		活动指引.提示控件:置可见(false)
    end
end

function 活动指引:取活跃数据(名称)
	for i=1,#活跃分割 do
		if 活跃分割[i][1] == 名称 then
			活跃分割[i][5]=i
			return 活跃分割[i]
		end
	end
	return {}
end
function 活动指引:更新活跃(内容)
	if 领取记录~=nil then
		self.领取记录 = 领取记录
	end
end

local 活动控件 = 活动指引:创建控件('活动控件',15,230,676, 240)
function 活动控件:重置(name)
	self:置可见(true)
	local 活动类型 = {}
	for i,v in pairs(活动指引.数据.指引[name]) do
		活动类型[#活动类型+1] = v
	end


	self.活动网格:置物品(活动类型)
end

local 活动网格 = 活动控件:创建网格("活动网格",1,3,670,240)
function 活动网格:初始化()
end

function 活动网格:左键弹起(x, y, a, b, msg)
	-- 发送数据(当前 or self and self.当前, 40, { 获取 = "查看攻略", 文本 = 活动指引.数据.标题, 文件 = self.子控件[a].指引名称 })
	self.鼠标x = x
	self.鼠标y = y
end

function 活动网格:显示介绍(数据)
	多开数据[当前].__UI弹出.指引弹出:置可见(true, true)
	多开数据[当前].__UI弹出.指引弹出.技能文本:清空()
	多开数据[当前].__UI弹出.指引弹出:打开(数据.文本, self.鼠标x + 60, self.鼠标y - 125, 340, 200)
end

local 提示控件 = 活动指引:创建控件('提示控件',10,200,676, 290)
local 提示文本 = 提示控件:创建文本("提示文本",5,10,245,230)
function 提示控件:重置(name)
	local nsf = require('SDL.图像')(245,230)
	local h =230
	local w =245
	if nsf:渲染开始() then
		__res:getPNGCC(3,213,927,30,30):显示(0,0)
		__res:getPNGCC(3,213,927+30,30,141):平铺(30,h-60):显示(0,30)
		__res:getPNGCC(3,213,927+171,30,31):显示(0,h-30)
		__res:getPNGCC(3,213+30,927,140,30):平铺(w-60,30):显示(30,0)
		__res:getPNGCC(3,213+30,927+30,155,141):平铺(w-60,h-60):显示(30,30)
		__res:getPNGCC(3,213+30,927+171,155,31):平铺(w-60,30):显示(30,h-30)
		__res:getPNGCC(3,228+170,927,30,30):显示(w-30,0)
		__res:getPNGCC(3,228+170,927+30,30,141):平铺(30,h-60):显示(w-30,30)
		__res:getPNGCC(3,228+170,927+171,30,31):显示(w-30,h-30)

		nsf:渲染结束()

	end
	self:置精灵(nsf:到精灵())
	self.提示文本:清空()
	__每日提示(self.提示文本, name)
end
function 提示控件:左键弹起(x, y)
	self:置可见(false)
end
-- local 经验条 = 活动指引:创建进度("经验条", 95, 165, 300, 8)
-- function 经验条:初始化()
--  --   self:置精灵(__res:getPNGCC(1, 401, 181, 300, 8):到精灵())
--     --self:置精灵(__res:getPNGCC(1, 401, 181, 300, 8):到精灵())
--     self:置精灵(__res:getPNGCC(1, 587, 108, 183, 16):到精灵())
-- end



function 活动网格:置物品(活动类型)
	self:创建格子(300, 65, 8, 2, math.ceil(#活动类型 / 2), 2, true)
    for i = 1,#self.子控件 do
        if 活动类型[i] then
			local nsf = require('SDL.图像')(300,65)
			if nsf:渲染开始() then
				字体16:置颜色(__取颜色("灰色"))
				字体18:置颜色(__取颜色("黑色"))
				__res:getPNGCC(17, 0, 0, 340, 80):显示(-7,-6)
				if	活动类型[i].名称=="客服小二" or 活动类型[i].名称=="武神坛服战冠军" or 活动类型[i].名称=="武神坛服战亚军" or 活动类型[i].名称=="武神坛服战季军"
					or 活动类型[i].名称=="仙气十足" or 活动类型[i].名称=="武神坛服战4强" or 活动类型[i].名称=="武神坛服战8强"
					or 活动类型[i].名称=="龙神" or 活动类型[i].名称=="新年快乐" or 活动类型[i].名称=="新春快乐" or 活动类型[i].名称=="魂殿殿主" or 活动类型[i].名称=="魂殿使者"
					or 活动类型[i].名称=="夏日炎炎" or 活动类型[i].名称=="远古妖魔尊主" or 活动类型[i].名称=="远古妖魔领主" or 活动类型[i].名称=="远古妖魔头目" or 活动类型[i].名称=="三界财神爷"
					or 活动类型[i].名称=="下凡的灵猴"or 活动类型[i].名称=="十二生肖" then
				__res:取图像(__res:取地址('shape/mx/',活动类型[i].地址)):显示(12,8)
				else
				__res:取图像(__res:取地址('shape/dj/',活动类型[i].地址)):显示(10,3)
				end
				字体18:取图像(活动类型[i].名称 .." ("..(活动类型[i].星级 or "1").."星)" ):显示(70,3)
				字体16:取图像("可完成："..(活动类型[i].最大次数 or "无限制").."次"):显示(70,25)
				字体16:取图像("可获得"..(活动类型[i].活跃 or "无").."活跃"):显示(70,45)

				nsf:渲染结束()
			end
			self.子控件[i]:置精灵(nsf:到精灵())
            local 按钮 = self.子控件[i]:创建我的按钮(__res:getPNGCC(1,626,28,58,34,true):置拉伸(58,30),'按钮'..i,230,35,"参加")
            function 按钮:左键弹起(x,y,msg)
				   if 活动类型[i] and 活动类型[i].名称 then
					发送数据(当前 or self and self.当前,178,{类型=活动类型[i].名称})
					end
				-- 活动指引.提示控件:置可见(true)
				-- 活动指引.提示控件:重置(活动类型[i].名称)
            end
            按钮:置可见(true,true)


            local 查看 = self.子控件[i]:创建我的按钮(__res:getPNGCC(1,626,28,58,34,true):置拉伸(58,30),'查看'..i,230,1,"详情")
            function 查看:左键弹起(x,y,msg)
				活动指引.提示控件:置可见(true)
				活动指引.提示控件:重置(活动类型[i].名称)
            end
            查看:置可见(true,true)

        else
            self.子控件[i]:置精灵(nil)
        end
    end
end


for i, v in ipairs {
	{name = '葫芦1', x = -575 ,y = -353 , tcp =__res:取图像(__res:取地址("shape/ui/xz/", 0xA1000062))},
	{name = '葫芦2', x = -514 ,y = -353 , tcp =__res:取图像(__res:取地址("shape/ui/xz/", 0xA1000063))},
	{name = '葫芦3', x = -449 ,y = -353 , tcp =__res:取图像(__res:取地址("shape/ui/xz/", 0xA1000064))},
	{name = '葫芦4', x = -387 ,y = -353 , tcp =__res:取图像(__res:取地址("shape/ui/xz/", 0xA1000065))},
	{name = '葫芦5', x = -328 ,y = -353 , tcp =__res:取图像(__res:取地址("shape/ui/xz/", 0xA1000066))},
	{name = '葫芦6', x = -263 ,y = -353 , tcp =__res:取图像(__res:取地址("shape/ui/xz/", 0xA1000067))},


} do
local  临时函数 = 活动指引:创建我的按钮(v.tcp,v.name,v.x,v.y)
function 临时函数:左键弹起(x, y)
	local a = 1
	if v.name == '葫芦2' then
		a = 2
	elseif v.name == '葫芦3' then
		a = 3
	elseif v.name == '葫芦4' then
		a = 4
	elseif v.name == '葫芦5' then
		a = 5
	elseif v.name == '葫芦6' then
		a = 6
	end
	发送数据(当前 or self and self.当前, 57.1, {a})
end
end

local 关闭 = 活动指引:创建我的按钮(__res:getPNGCC(7, 234, 28, 33, 33),"关闭",610,0)

function 关闭:左键弹起(x,y)
    活动指引:置可见(false)
end

local 签到 = 活动指引:创建我的按钮(require('SDL.图像')('assets/shape/ui/pic/huoyue.png'),"签到",15,130)

function 签到:左键弹起(x,y)
    发送数据(当前 or self and self.当前,58)
end




local 累签系统 = 活动指引:创建控件("累签系统",0,230,665,230)
function 累签系统:重置()
	self:置可见(true)
	self.奖励物品 = {}
	for n=1,#活动指引.签到奖励 do
		self.奖励物品[n] = {}
		for i=1,10 do
			if 活动指引.签到奖励[n]["物品"..i] then
				self.奖励物品[n][#self.奖励物品[n]+1] = 活动指引.签到奖励[n]["物品"..i]
			end
		end
	end
	self.累签网格:置物品(self.奖励物品)
end


local 累签网格 = 累签系统:创建网格("累签网格",5,0,630,230)
function 累签网格:初始化()

end

function 累签网格:左键弹起(x, y, a, b, msg)
    if 累签系统.奖励选中 ~= 0 and self.子控件[累签系统.奖励选中]  then
        self.子控件[累签系统.奖励选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        local w,h = self.子控件[a]:取宽高()
        累签系统.奖励选中 = a
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
    end
end

function 累签网格:置物品(奖励)
    self:创建格子(630,65,0,0,#奖励,1,true,12)
    for i = 1,#self.子控件 do
        local nsf = require('SDL.图像')(630,60)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色("红色"))
            字体16:取图像("累签"):显示(45,10)
			local 要求 = 活动指引.签到奖励[i].领取条件
			字体16:取图像(要求.."天"):显示(45,30)
            nsf:渲染结束()
        end
        self.子控件[i]:置精灵(nsf:到精灵())
        local 子网格 = self.子控件[i]:创建网格("子网格"..i,105,7,630,60)
        子网格:创建格子(55, 55, 10, 1, #奖励[i], 10)
        for x=1,#子网格.子控件 do
            if 奖励[i][x] then
                local lssj = __商店格子.创建(当前)
                lssj:置物品(奖励[i][x],"黄格子",true)
                子网格.子控件[x]:置精灵(lssj)
            else
                子网格.子控件[x]:置精灵(nil)
            end
        end
        子网格:置可见(true,true)
        function 子网格:左键弹起(x, y, a, b, msg)
            if 子网格.子控件[a] and 子网格.子控件[a]._spr and 子网格.子控件[a]._spr.物品 then
                local x,y = 子网格.子控件[a]:取坐标()
                local w,h = 子网格.子控件[a]:取宽高()
                子网格.子控件[a]._spr.确定 = true
                子网格.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
            end
        end

		local 子按钮 = self.子控件[i]:创建我的按钮(__res:getPNGCC(1,449,28,174,35,true):置拉伸(90,25),"奖励领取"..i,500,15,"领取奖励")
		function 子按钮:左键弹起(消息,x,y)
			发送数据(当前 or self and self.当前,19,{奖励类型=活动指引.签到奖励[i].礼包类型})
		end
		子按钮:置可见(true,true)
    end
end


