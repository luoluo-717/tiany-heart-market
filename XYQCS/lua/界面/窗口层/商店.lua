--[[
    @Author       : GGELUA
    @Date         : 2022-04-07 10:48:42
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:33:54
--]]
local 商店 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("商店",0,0,377,510)
local 当前 = 多开数据.当前
local lsb = {"单价","总价","数量","现金"}
local lsb2 = {"单价","总价","现金"}
local ggf = require('GGE.函数')
function 商店:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(377,510)
    if nsf:渲染开始() then
        置窗口背景("无",0,12,372,505,true):显示(0,0)
        取灰色背景(0,0,340,320,true):显示(17,50)
        -- 字体18:置颜色(255,255,255)
        -- local lssj = 取输入背景(0,0,122,23)
        -- local pyx = 0
        -- local pyy = 0
        -- for i=1,#lsb do
        --     if i > 2 then
        --         pyx = 176
        --         pyy = -66
        --     end
        --     lssj:显示(58+pyx,387+((i-1)*33)+pyy)
        --     字体18:取图像(lsb[i]):显示(15+pyx,387+((i-1)*33)+pyy)
        -- end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.道具选中 = nil
    self.临时道具={}
    self.单价 = 0
	self.数量 = 0
    self.总价 = 0
    self.现金 = 0
    self.标题宽度 = 字体20:取宽度("商店")
    self.标题 = "商店"
end

function 商店:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
    字体20:显示(x+(372/2)-(self.标题宽度/2),y+15,self.标题)
end

function 商店:打开(sp,mc,lx,yz)
    self:置可见(true)
    self.道具选中 = nil
    self.临时道具={}
    self.单价 = 0
	self.数量 = 0
    self.总价 = 0
    self.现金 = yz
    if mc then
        self.标题 = mc
    else
        self.标题 = "商店"
    end
    if lx  then
        self.类型 = lx
    else
        self.类型 = "银子"
    end
    if self.类型~=nil and self.类型~="银子" then
        self.标题=self.类型
    end
       
            
    self.标题宽度 = 字体20:取宽度(self.标题)
    for i=1,#sp do
        local lssj = ggf.分割文本(sp[i],"*")
        local wp = 取物品(lssj[1])
        self.临时道具[i]={名称=lssj[1],价格=lssj[2],子类=lssj[3],原始商品=sp[i]}
        if (wp[2] == 5 and wp[3] == 6) or (wp[2] =="五色灵尘" and wp[3]==6) then
            self.临时道具[i].等级 = lssj[3]
        elseif wp[2] == 8 then
            self.临时道具[i].等级 = lssj[3]
        elseif wp[2] == 111 then
            self.临时道具[i].等级 = lssj[3]
        end
    end
    self.道具网格:置物品(self.临时道具)
    self.数量输入:置数值(1)

    if self.类型=="副本积分" or self.类型=="中秋积分" or self.类型=="师徒积分" or self.类型=="玉魄积分" or self.类型=="人族时空积分" or self.类型=="魔族时空积分" or self.类型=="仙族时空积分" or self.类型=="镇妖关" then
        lsb = {"单价","总价","数量","积分"}
    elseif self.类型=="除妖军功" then
        lsb = {"单价","总价","数量","军功"}
    elseif self.类型=="银子" then
        lsb = {"单价","总价","数量","现金"}
    else
        lsb = {"单价","总价","数量","现金"}
    end
    local nsf = require('SDL.图像')(377,510)
    if nsf:渲染开始() then
        置窗口背景("无",0,12,372,505,true):显示(0,0)
        取灰色背景(0,0,340,320,true):显示(17,50)
        字体18:置颜色(255,255,255)
        local lssj = 取输入背景(0,0,122,23)
        local pyx = 0
        local pyy = 0
        for i=1,#lsb do
            if i > 2 then
                pyx = 176
                pyy = -66
            end
            lssj:显示(58+pyx,387+((i-1)*33)+pyy)
            字体18:取图像(lsb[i]):显示(15+pyx,387+((i-1)*33)+pyy)
        end
    self:置精灵(nsf:到精灵())
    end



end
function 商店:刷新(道具组,名称,类型,银子)
		if 类型 ~= nil then
			self.类型 = 类型
			if self.类型=="比武积分" then
			  lsb = {"单价","数量","总额","积分"}
              self.现金=银子
			end
			if self.类型=="师徒积分" then
			  lsb = {"单价","数量","总额","积分"}
              self.现金=银子
			end
			if self.类型=="副本积分" then
			  lsb = {"单价","数量","总额","积分"}
              self.现金=银子
			end
			if self.类型=="中秋积分" then
			  lsb = {"单价","数量","总额","积分"}
              self.现金=银子
			end
			----------CC修改（增加时空之钥商店）
			if self.类型=="人族时空积分" then
			  lsb = {"单价","数量","总额","积分"}
              self.现金=银子

			end
			if self.类型=="魔族时空积分" then
			  lsb = {"单价","数量","总额","积分"}
              self.现金=银子

			end
			if self.类型=="仙族时空积分" or self.类型=="镇妖关" or self.类型=="玉魄积分" then
			  lsb = {"单价","数量","总额","积分"}
              self.现金=银子
			end

            if self.类型=="除妖军功" then
			  lsb = {"单价","数量","总额","军功"}
              self.现金=银子
			end

            if self.类型=="银子" then
			  lsb = {"单价","数量","总额","现金"}
              self.现金=self.现金
			end
			----------CC修改（增加时空之钥商店）
		end
        商店:重置(商店.临时道具[商店.选中道具])
end


local 关闭 = 商店:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",327,0)

function 关闭:左键弹起(x,y,msg)
    商店:置可见(false)
end

function 商店:重置(数据)
    local nsf = require('SDL.图像')(377,510)
    if nsf:渲染开始() then
        字体18:置颜色(39,53,81)
        字体18:取图像(数据.价格):显示(70,390)
        字体18:取图像((数据.价格+0)*self.数量输入:取数值()):显示(70,422)
        字体18:取图像(self.现金):显示(250,422)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

local 道具网格 = 商店:创建网格("道具网格",23,57,326,305)

function 道具网格:初始化()
    self:创建格子(55,55,9,13,15,5,true)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        if 商店.选中道具 and self.子控件[商店.选中道具]._spr.物品 then
            self.子控件[商店.选中道具]._spr.确定 = nil
        end
        商店.选中道具 = a
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
        商店:重置(商店.临时道具[商店.选中道具])
    end
end

function 道具网格:置物品(数据,zl,fl)
    for i = 1,#道具网格.子控件 do
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据[i],"NPC商店")
        道具网格.子控件[i]:置精灵(lssj)
    end
end

local 数量输入 = 商店:创建输入("数量输入",285,388,50,18)
function 数量输入:初始化()
    self:取光标精灵()
    self:置限制字数(2)
    self:置颜色(39,53,81,255)
    self:置模式(2)
end


local lsan = {"探索","购买"}
local pyx = 0
local pyy = 0
for i=1,#lsan do
    if i > 1 then
        pyx = 178
        pyy = -30
    end
    local 临时函数 = 商店:创建我的按钮(__res:getPNGCC(3,2,507,124,41):拉伸(123,41),lsan[i].."按钮",35+pyx,450+((i-1)*30)+pyy,lsan[i])
    
    function 临时函数:左键弹起(x,y,msg)
        
        if lsan[i] == "探索" then

        elseif lsan[i] == "购买" then
            if 商店.选中道具 and 道具网格.子控件[商店.选中道具]._spr.物品 then
                if 商店.数量输入:取数值() then
                    发送数据(当前 or self and self.当前,1503,{数量=商店.数量输入:取数值(),商品=商店.道具网格.子控件[商店.选中道具]._spr.物品.原始商品,类型=商店.类型,商店名称=商店.标题})
                end
            end
        end
    end
end