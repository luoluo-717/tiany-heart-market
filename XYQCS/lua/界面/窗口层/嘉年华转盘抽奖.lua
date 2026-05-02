local 嘉年华转盘抽奖 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("嘉年华转盘抽奖", 0, 0, 600, 480)
local 当前 = 多开数据.当前
local 物品位置 = {
	{x=300,y=25},
	{x=368,y=25},
	{x=436,y=25},

	{x=300,y=85},
	{x=368,y=85},
	{x=436,y=85},

	{x=300,y=145},
	{x=368,y=145},
	{x=436,y=145},

	{x=300,y=205},
	{x=368,y=205},
	{x=436,y=205},

	{x=368,y=215},
	{x=435,y=215}
}
function 嘉年华转盘抽奖:初始化()
    __置窗口坐标(self)
	local nsf = require('SDL.图像')(600,480)
    if nsf:渲染开始(0,0,0,0) then
		__res:取图像(__res:取地址("shape/ui/", 0xAAABBB00)):显示(60,10)
		
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())

    self.资源组 = {
        [2] = __res.UI素材[3]:复制区域(1115, 603, 70, 69):拉伸(61, 61):到精灵(),
    	}
end

function 嘉年华转盘抽奖:打开(data)
    self:置可见(true)
    self.道具网格:置物品(data.道具)
    self.进程=0
    self.位置=1
    self.间隔=0
    self.起始=时间
    self.速度=10
    self.中奖=data.道具.中奖
	self.积分=data.积分
	self.消耗积分=data.消耗积分
    self.数据 = data 

end

function 嘉年华转盘抽奖:刷新积分(data)
	self.积分=self.积分-data.消耗积分
end

function 嘉年华转盘抽奖:更新(dt)
	
end

local 临时函数 = 嘉年华转盘抽奖["创建我的多选按钮"](嘉年华转盘抽奖, __res:getPNGCC(2, 1172, 107, 26, 26, true), __res:getPNGCC(2, 1171, 75, 26, 26, true), "跳过动画", 240,321)
function  临时函数:左键弹起(x, y)
		跳过动画=not 跳过动画
end


local 关闭 = 嘉年华转盘抽奖:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",550,0)

function 关闭:左键弹起(x,y,msg)
    嘉年华转盘抽奖:置可见(false)
end

local 道具网格 = 嘉年华转盘抽奖:创建网格("道具网格",65,15,550,480)

function 道具网格:初始化()
    self:创建格子(55,55,20,23,2,7)
end

function 道具网格:置物品(data)
    for i = 1,#self.子控件 do
        local lssj = __商店格子.创建(当前 or self and self.当前)
        lssj:置物品(data[i],"嘉年华转盘抽奖",false)
        self.子控件[i]:置精灵(lssj)
		self.子控件[i]:置坐标(物品位置[i].x, 物品位置[i].y)
    end
    for n = 1,#data do
        if self.子控件 and self.子控件[n] and self.子控件[n]._spr then
            self.子控件[n]._spr.确认 = true
        end
    end
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        self.子控件[a]._spr:详情打开(350,110)
    end
end


function 嘉年华转盘抽奖:显示(x,y)
    字体16:置颜色(255, 255, 255)
	字体16:显示(x+376,280+y,"当前嘉年华积分:"..self.积分)
	字体16:显示(x+165,328+y,"跳过动画")

    if self.进程==1 then
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==13 then self.位置=1 end
		end
	elseif self.进程==2 then
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==13 then self.位置=1 end
		end
		if os.time()>=self.起始+2 then
			self.进程=3
		end
	elseif self.进程==3 then
		local 距离=math.abs(self.位置-self.中奖)
		if 距离>=10 then
			self.速度=10
		elseif 距离>=6 then
			self.速度=20
		elseif 距离>=3 then
			self.速度=40
   		end
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==13 then self.位置=1 end
		end
		if self.位置==self.中奖 then
			self.进程=4
			self.起始=os.time()
			发送数据(当前,95.1,{序号=self.中奖})
		end
   	elseif self.进程==4 and os.time()>=self.起始+3 then
		self:置可见(false)
		return
	end

    if self.位置 == 1 then
		self.资源组[2]:显示(x+362,38+y)
	elseif self.位置 == 2 then
	    self.资源组[2]:显示(x+362+68,38+y)
	elseif self.位置 == 3 then
	    self.资源组[2]:显示(x+362+68*2,38+y)

	elseif self.位置 == 4 then
	    self.资源组[2]:显示(x+362,38+60+y)
	elseif self.位置 == 5 then
	    self.资源组[2]:显示(x+362+68,38+60+y)
	elseif self.位置 == 6 then
	    self.资源组[2]:显示(x+362+68*2,38+60+y)

	elseif self.位置 == 7 then
	    self.资源组[2]:显示(x+362,38+60*2+y)
	elseif self.位置 == 8 then
	    self.资源组[2]:显示(x+362+68,38+60*2+y)
	elseif self.位置 == 9 then
	    self.资源组[2]:显示(x+362+68*2,38+60*2+y)

	elseif self.位置 == 10 then
	    self.资源组[2]:显示(x+362,38+60*3+y)
	elseif self.位置 == 11 then
	    self.资源组[2]:显示(x+362+68,38+60*3+y)
	elseif self.位置 == 12 then
	    self.资源组[2]:显示(x+362+68*2,38+60*3+y)
	end
end


for i, v in ipairs {
    { name = '开始', x = 395, y = 305, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(60, 35), font = '开始' },
	{ name = '结束', x = 480, y = 305, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(60, 35), font = '结束' },
} do
    local 临时函数 = 嘉年华转盘抽奖:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
		if v.name == "开始" and 嘉年华转盘抽奖.进程==0 then
			if 跳过动画 then
				发送数据(当前,95.1,{序号=self.中奖})
				嘉年华转盘抽奖:置可见(false)
				return
			else
				发送数据(当前,95.2)
			end
		elseif v.name == "结束" and 嘉年华转盘抽奖.进程==1 then
			嘉年华转盘抽奖.是否结束 = true
			嘉年华转盘抽奖.进程=2
			嘉年华转盘抽奖.起始=os.time()
		end
    end
end

