--[[
    @Author       : GGELUA
    @Date         : 2022-04-14 07:33:09
Last Modified by: GGELUA
Last Modified time: 2023-10-23 10:14:19
--]]
local 合成旗 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("合成旗",0,0,100,100)
local 当前 = 多开数据.当前
function 合成旗:初始化()
    __置窗口坐标(self)
    self.地图大小={
		[1092]={w=4480,h=3020},
		[1001]={w=11000,h=5600},
		[1501]={w=5760,h=2880},
		[1070]={w=3200,h=4200},
		[1208]={w=3840,h=2400},
		[1226]={w=3200,h=2400},
		[1040]={w=3280,h=2480},
		[1173]={w=12800,h=2400},
	}
end

function 合成旗:显示(x,y)
    if self.图像 then
        self.图像:显示(x+20,y+20)
    end
    for i,v in ipairs(self.坐标点) do
        v.tcp:显示(x+math.floor(v.x*20*self.py.x)+20,y+math.floor(v.y*20*self.py.y)+20)
    end
end

function 合成旗:左键弹起(x,y)
    for i,v in ipairs(self.坐标点) do
        if v.tcp:检查透明(x,y) then
            发送数据(当前 or self and self.当前,3737,{序列=i})
            合成旗:置可见(false)
        end
    end 
end

function 合成旗:打开(数据)
    self:置可见(true)
    -- if self.smap and self.smap ~= 数据.地图 then
    --     self:重置(数据)
    -- elseif not self.smap then
        self:重置(数据)
    -- end
end

local 关闭 = 合成旗:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",0,0)

function 关闭:左键弹起(x,y,msg)
    合成旗:置可见(false)
end

function 合成旗:重置(数据)
    self.smap = 数据.地图
    self.图像 = nil
    self.传送点 = {}
    self.坐标点=数据.xy
    local Smap,Smapa = __小地图资源加载(self.smap)
    if Smapa and self.地图大小[self.smap] then
        self.图像 = __res:取精灵(__res:取地址('shape/smap/',Smapa))
        local w,h = self.图像.宽度+40,self.图像.高度+40
        self.py={x=self.图像.宽度/self.地图大小[self.smap].w,y=self.图像.高度/self.地图大小[self.smap].h}
        self.pys={x=self.地图大小[self.smap].w/self.图像.宽度,y=self.地图大小[self.smap].h/self.图像.高度}
        self:置宽高(w+30,h)
        __置窗口坐标(self)
        self.关闭:置坐标(w-20,0)
        self:置精灵(取黑色背景(0,0,w,h))
        for i=1,#self.坐标点 do
            self.坐标点[i].tcp = __res:getPNGCC(2,1042,15,18,19):拉伸(25,25):到精灵():置中心(9,9)
        end
    else
        self:置可见(false)
    end
end