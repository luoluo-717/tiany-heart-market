local 转盘抽奖 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("转盘抽奖", 0, 0, 520, 480)
local 当前 = 多开数据.当前
local 物品位置 = {
	{x=60+160,y=10+12},
	{x=60+224,y=10+29},
	{x=60+275,y=10+70},
	{x=60+304,y=10+128},
	{x=60+304,y=10+192},
	{x=60+275,y=10+254},
	{x=60+224,y=10+296},
	{x=60+160,y=10+312},
	{x=60+96,y=10+296},
	{x=60+43,y=10+253},
	{x=60+16,y=10+192},
	{x=60+16,y=10+128},
	{x=60+40,y=10+70},
	{x=60+96,y=10+24}
}
function 转盘抽奖:初始化()
    __置窗口坐标(self)
	local nsf = require('SDL.图像')(520,480)
    if nsf:渲染开始(0,0,0,0) then
		__res:取图像(__res:取地址("shape/ui/xz/", 0x01BC5E01)):显示(60,10)
		
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())

    self.资源组 = {
        [2] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E04)),
		[3] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E05)),
		[4] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E06)),
		[5] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E07)),
		[6] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E08)),
		[7] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E09)),
		[8] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E10)),
		[9] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E11)),
		[10] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E12)),
		[11] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E13)),
		[12] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E14)),
		[13] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E15)),
		[14] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E16)),
		[15] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E17)),
		[19] = __res:取动画2(__res:取地址('shape/ui/xz/',0x01BC5E03)),
    }
end

function 转盘抽奖:打开(data)
    self:置可见(true)
    self.道具网格:置物品(data.道具)
    self.进程=0
    self.位置=1
    self.间隔=0
    self.起始=时间
    self.速度=2
    self.中奖=data.道具.中奖
    self.数据 = data 
end

function 转盘抽奖:重置(data)

end

function 转盘抽奖:更新(dt)
	for i=2,15 do
		self.资源组[i]:更新(dt)
	end
	self.资源组[19]:更新(dt)
end


function 转盘抽奖:显示(x,y)
	self.资源组[19]:显示(x+20,380+y)
	-- 字体16:显示(x+30,425+y,"单次消耗100仙玉")
    if self.进程==1 then
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==15 then self.位置=1 end
		end
	elseif self.进程==2 then
		self.间隔=self.间隔+1
		if self.间隔>=self.速度 then
			self.间隔=0
			self.位置=self.位置+1
			if self.位置==15 then self.位置=1 end
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
			if self.位置==15 then self.位置=1 end
		end
		if self.位置==self.中奖 then
			self.进程=4
			self.起始=os.time()
			发送数据(当前,95,{序号=self.中奖})
		end
   	elseif self.进程==4 and os.time()>=self.起始+3 then
		self:置可见(false)
		return
	end

    if self.位置 == 1 then
		self.资源组[2]:显示(x+60+171,5+75+y)
	elseif self.位置 == 2 then
	    self.资源组[3]:显示(x+60+196,5+85+y)
	elseif self.位置 == 3 then
	    self.资源组[4]:显示(x+60+213,5+113+y)
	elseif self.位置 == 4 then
	    self.资源组[5]:显示(x+60+226,5+150+y)
	elseif self.位置 == 5 then
	    self.资源组[6]:显示(x+60+226,5+185+y)
	elseif self.位置 == 6 then
	    self.资源组[7]:显示(x+60+214,5+205+y)
	elseif self.位置 == 7 then
	    self.资源组[8]:显示(x+60+196,5+225+y)
	elseif self.位置 == 8 then
	    self.资源组[9]:显示(x+60+172,5+228+y)
	elseif self.位置 == 9 then
	    self.资源组[10]:显示(x+60+130,5+219+y)
	elseif self.位置 == 10 then
	    self.资源组[11]:显示(x+60+99,5+204+y)
	elseif self.位置 == 11 then
	    self.资源组[12]:显示(x+60+78,5+186+y)
	elseif self.位置 == 12 then
	    self.资源组[13]:显示(x+60+78,5+151+y)
	elseif self.位置 == 13 then
	    self.资源组[14]:显示(x+60+100,5+112+y)
	elseif self.位置 == 14 then
	    self.资源组[15]:显示(x+60+133,5+86+y)
	end
end

-- local 关闭 = 转盘抽奖:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",470,0)

-- function 关闭:左键弹起(x,y,msg)
--     转盘抽奖:置可见(false)
-- end

local 道具网格 = 转盘抽奖:创建网格("道具网格",0,0,520,480)

function 道具网格:初始化()
    self:创建格子(55,55,20,23,2,7)
end

function 道具网格:置物品(data)
    for i = 1,#self.子控件 do
        local lssj = __商店格子.创建(当前 or self and self.当前)
        lssj:置物品(data[i],"转盘抽奖",false)
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

for i, v in ipairs {
    { name = '开始', x = 170, y = 415, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(60, 41), font = '开始' },
	{ name = '结束', x = 270, y = 415, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(60, 41), font = '结束' },
} do
    local 临时函数 = 转盘抽奖:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
		if v.name == "开始" and 转盘抽奖.进程==0 then
			转盘抽奖.进程=1
			转盘抽奖.是否开始 = true
		elseif v.name == "结束" and 转盘抽奖.进程==1 then
			转盘抽奖.是否结束 = true
			转盘抽奖.进程=2
			转盘抽奖.起始=os.time()
		end
    end
end

