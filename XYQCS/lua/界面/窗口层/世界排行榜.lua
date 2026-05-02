local 世界排行榜 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("世界排行榜",0,0,650,500)
local 当前 = 多开数据.当前
function 世界排行榜:初始化()
end

function 世界排行榜:打开(数据)
    self.数据=数据
    self:置可见(true,true)
	self:置窗口()
	self.数据列表:重置(1)
    
end

function 世界排行榜:置窗口()
	__置窗口坐标(self)
    local nsf = require('SDL.图像')(650,500)
    if nsf:渲染开始() then
        置窗口背景("世界排行榜",0,12,600,450,true):显示(0,0)
        取白色背景(0,0,535,355,true):显示(25,50)
        字体18:取图像("排名               玩家                     数据（伤害）"):显示(50, 55)
        self.奖励领取:置可见(false,false)
        字体18:置颜色(__取颜色("白色"))
        if self.数据.排行.最终一击 == nil then
            字体18:取图像("最终一击：尚未产生"):显示(50, 405)
        else
            字体18:取图像("最终一击："..self.数据.排行.最终一击.名称.." 造成伤害："..self.数据.排行.最终一击.伤害):显示(50, 405)
            if self.数据.排行.最终一击.id == 对开数据[当前].角色信息.数字id and not self.数据.开启 then
                self.奖励领取:置可见(true,true)
            end
        end
        字体18:取图像("当前BOOS气血："..self.数据.气血.当前.."/"..self.数据.气血.上限):显示(50, 430)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

for i, v in ipairs {
    { name = '领取奖励', x = 170, y = 415, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(90, 35), font = '领取奖励' },
    { name = '奖励领取', x = 490, y = 410, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(90, 35), font = '领取奖励' },
} do
    local 临时函数 = 世界排行榜:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.奖励领取 == "领取奖励" then
            发送数据(当前,101.2)
        elseif v.奖励领取 == "奖励领取" then
            发送数据(当前,101.3)
        end
    end
end

local 数据列表 = 世界排行榜:创建列表("数据列表",30,85,425,340)

function 数据列表:初始化()
    self:置文字(字体16)
    self.行高度 = 32
    self.行间距 = 0
end

function 数据列表:重置()
    self:清空()
	self.行高度 = 32
    世界排行榜.领取奖励:置可见(false,false)
    for _, v in ipairs(世界排行榜.数据.排行) do
        local nsf = require('SDL.图像')(425,350)
        if nsf:渲染开始() then
            -- if _%2 == 1 then
            --     nsf:填充颜色(167,164,199,255)
            -- end
            字体16:置颜色(__取颜色('浅黑'))
			字体16:取图像("第".._.."名"):显示(20,5)
            字体16:取图像(v.名称):显示(147,5)
            字体16:取图像(v.伤害):显示(310,5)
            if v.id == 对开数据[当前].角色信息.数字id and not 世界排行榜.数据.开启 then
                世界排行榜.领取奖励:置可见(true,true)
                世界排行榜.领取奖励:置坐标(490,90+_*32-32)
            end
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 数据列表:左键弹起(x,y,a)

end

local 关闭 = 世界排行榜:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",560,0)
function 关闭:左键弹起(x,y)
    世界排行榜:置可见(false)
end

