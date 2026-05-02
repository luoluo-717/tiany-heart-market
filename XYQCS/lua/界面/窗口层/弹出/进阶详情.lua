多开数据[多开数据.当前].__UI弹出.bb进阶详情 =  多开数据[多开数据.当前].__UI界面:创建弹出窗口( "bb进阶详情", 0, 0, 295+68, 400)
local bb进阶详情 = 多开数据[多开数据.当前].__UI弹出.bb进阶详情
local 当前 = 多开数据.当前
function bb进阶详情:初始化()
end
function bb进阶详情:左键弹起()
	self:置可见(false)
end
function bb进阶详情:打开(数据, x, y, w, h, Button, Button2, Button3, Button4, bh, lx)
	self.pid = bh
	self.lx = lx
	self.数据 = 数据
	if self.数据 then
		self:置坐标(x + abbr.py.x+68, y + abbr.py.y)
		local nsf = require("SDL.图像")(295+68, 400)
		if nsf:渲染开始() then
			取黑透明背景(0, 0, 290, 390, true):显示(68, 0)
			self.小模型 = __res:getPNGCC(3, 132, 506, 55, 55):显示(13+68,13)--["到精灵"]((__res:getPNGCC(3, 132, 506, 55, 55)))
			__res:取图像(__res:取地址("shape/dj/", 数据.小模型资源)):显示(15+68, 15)
			nsf:渲染结束()
		end
		self:置精灵(nsf:到精灵())
	else
		local nsf = require("SDL.图像")(295+68, 400)
		if nsf:渲染开始()(nsf) then
			取黑透明背景(0, 0, 290, 390, true):显示(0+68, 0)
			nsf:渲染结束()
		end
		self:置精灵(nsf:到精灵())
	end
	__道具提示(self.数据, self.道具文本)
	local Buttontable = {
		金 = false,
		火 = false,
		木 = false,
		土 = false,
		水 = false,
		取下 = false,
	}
	if Button then
		if Button=="使用" then
			for k, v in pairs(Buttontable) do
				if k ~= "取下" then
					Buttontable[k] = true
				end
			end
		else
			Buttontable[Button] = true
		end
		-- bb进阶详情[Button]["置坐标"](bb进阶详情[Button], 10+65+155, 307+30)
	end
	bb进阶详情.道具文本:置宽高(256, 310)
	for k, v in pairs(Buttontable) do
		if false == v then
			bb进阶详情[k]:置可见(false)
		end
	end
end


local 木 = bb进阶详情:创建我的按钮(__res:getPNGCC(1, 626, 28, 58, 34, true), "木", 88, 280, "木"):置可见(false)
function 木:左键弹起(x, y, msg)
	if 多开数据[当前].__UI界面.窗口层.宝宝进阶.是否可见 then
		if bb进阶详情.数据.名称=="高级清灵仙露" or bb进阶详情.数据.名称=="中级清灵仙露" or bb进阶详情.数据.名称=="初级清灵仙露" then
			多开数据[当前].__UI界面.窗口层.宝宝进阶.youcedaoju:置道具(bb进阶详情.pid,1)
		end
	end
	bb进阶详情:置可见(false)
end
local 火 = bb进阶详情:创建我的按钮(__res:getPNGCC(1, 626, 28, 58, 34, true), "火", 88+88*1, 280, "火"):置可见(false)
function 火:左键弹起(x, y, msg)
	if 多开数据[当前].__UI界面.窗口层.宝宝进阶.是否可见 then
		if bb进阶详情.数据.名称=="高级清灵仙露" or bb进阶详情.数据.名称=="中级清灵仙露" or bb进阶详情.数据.名称=="初级清灵仙露" then
			多开数据[当前].__UI界面.窗口层.宝宝进阶.youcedaoju:置道具(bb进阶详情.pid,2)
		end
	end
	bb进阶详情:置可见(false)
end
local 金 = bb进阶详情:创建我的按钮(__res:getPNGCC(1, 626, 28, 58, 34, true), "金", 88+88*2, 280, "金"):置可见(false)
function 金:左键弹起(x, y, msg)
	if 多开数据[当前].__UI界面.窗口层.宝宝进阶.是否可见 then
		if bb进阶详情.数据.名称=="高级清灵仙露" or bb进阶详情.数据.名称=="中级清灵仙露" or bb进阶详情.数据.名称=="初级清灵仙露" then
			多开数据[当前].__UI界面.窗口层.宝宝进阶.youcedaoju:置道具(bb进阶详情.pid,3)
		end
	end
	bb进阶详情:置可见(false)
end
local 土 = bb进阶详情:创建我的按钮(__res:getPNGCC(1, 626, 28, 58, 34, true), "土", 88, 280+65, "土"):置可见(false)
function 土:左键弹起(x, y, msg)
	if 多开数据[当前].__UI界面.窗口层.宝宝进阶.是否可见 then
		if bb进阶详情.数据.名称=="高级清灵仙露" or bb进阶详情.数据.名称=="中级清灵仙露" or bb进阶详情.数据.名称=="初级清灵仙露" then
			多开数据[当前].__UI界面.窗口层.宝宝进阶.youcedaoju:置道具(bb进阶详情.pid,4)
		end
	end
	bb进阶详情:置可见(false)
end
local 水 = bb进阶详情:创建我的按钮(__res:getPNGCC(1, 626, 28, 58, 34, true), "水", 88+88*1, 280+65, "水"):置可见(false)
function 水:左键弹起(x, y, msg)
	if 多开数据[当前].__UI界面.窗口层.宝宝进阶.是否可见 then
		if bb进阶详情.数据.名称=="高级清灵仙露" or bb进阶详情.数据.名称=="中级清灵仙露" or bb进阶详情.数据.名称=="初级清灵仙露" then
			多开数据[当前].__UI界面.窗口层.宝宝进阶.youcedaoju:置道具(bb进阶详情.pid,5)
		end
	end
	bb进阶详情:置可见(false)
end


local 取下 = bb进阶详情:创建我的按钮(__res:getPNGCC(3, 126, 563, 111, 36, true), "取下",10+65+155, 307+30, "取下"):置可见(false)
function 取下:左键弹起(x, y, msg)
	if 多开数据[当前].__UI界面.窗口层.宝宝进阶.是否可见 then
		多开数据[当前].__UI界面.窗口层.宝宝进阶:取下右侧道具(bb进阶详情.pid)
	end
	bb进阶详情:置可见(false)
end
local 道具文本 = bb进阶详情:创建文本("道具文本", 70+68, 38, 200, 310)---38
function 道具文本:初始化()
	self:置文字(字体16)
	
end
