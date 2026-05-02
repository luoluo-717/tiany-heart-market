local 转换角色 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("转换角色",0,0,340,460)
local 当前 = 多开数据.当前
local txb={{"飞燕女","英女侠","巫蛮儿","舞天姬","玄彩娥","桃夭夭","狐美人","骨精灵","鬼潇潇"},{"逍遥生","剑侠客","偃无师","羽灵神","神天兵","龙太子","巨魔王","虎头怪","杀破狼"},{"影精灵"}}
local mp = {
    "大唐官府","方寸山","女儿村","神木林","化生寺","魔王寨","阴曹地府","盘丝洞","无底洞","狮驼岭","天宫","龙宫","普陀山","五庄观","凌波城","花果山","九黎城"
}
local function 载入门派(模型)
    local mp = {}
	if 模型=="飞燕女" or 模型=="英女侠" or 模型=="巫蛮儿" then
        mp={1,2,3,4,17}
    elseif 模型=="偃无师" or 模型=="逍遥生" or 模型=="剑侠客" then
    	mp={1,2,5,4,17}
	elseif 模型=="狐美人" or 模型=="骨精灵" or 模型=="鬼潇潇" then
		mp={6,7,8,9,17}
    elseif 模型=="影精灵" then    
        mp={6,7,8,9,17} 
    elseif 模型=="杀破狼" or 模型=="巨魔王" or 模型=="虎头怪" then
		mp={6,7,10,9,17}
    elseif 模型=="舞天姬" or 模型=="玄彩娥" or 模型=="桃夭夭" then
		mp={11,12,13,15,16,17}
    elseif 模型=="羽灵神" or 模型=="神天兵" or 模型=="龙太子" then
		mp={11,12,14,15,16,17}
	end
    return mp
end

function 转换角色:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(340,460)
    if nsf:渲染开始() then
        置窗口背景("转换角色",0,0,330,450,true):显示(0,0)
        
        __res:取图片("shape/ui/zmp/dt.png"):显示(15,40)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 转换角色:打开(data)
    self:置可见(true)
    self.男女 = 多开数据[当前].角色信息.性别 == "男" and 2 or 1
    self.选中模型 = 多开数据[当前].角色信息.模型
    self.选中门派 = 多开数据[当前].角色信息.门派
    self.消耗方式 = 0
    self.角色控件:重置(self.男女)
    self.角色控件:置可见(true,true)
    self.门派控件:置可见(false,false)
    self.消耗控件:置可见(false,false)
    self.主角网格:置可见(true,true)
    self.主角网格:重置()
    self.数据 = data
end

local 主角网格 = 转换角色:创建网格("主角网格",30,50,230,85)
function 主角网格:初始化()
    self:创建格子(230,85,35,25,1,1)
end

function 主角网格:重置()
    local nsf = require('SDL.图像')(230,85)
    if nsf:渲染开始() then
        local lssj = 取头像(转换角色.选中模型)
        if lssj[2] == 0 then
            lssj[2] = lssj[1]
        end
        __res:getPNGCC(3, 1091, 374, 49, 49):显示(2, 8)
        __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(44, 44):显示(5, 10)
        字体14:置颜色(__取颜色("黑色"))
        字体14:取图像(转换角色.选中模型):显示(130,9)
        字体14:取图像(转换角色.选中门派):显示(130,38)
        nsf:渲染结束()
    end
    self.子控件[1]:置精灵(nsf:到精灵())
end

local 角色控件 = 转换角色:创建控件("角色控件",10,125,310,310)

function 角色控件:重置(男女)
    local nsf = require('SDL.图像')(310,310)
    if nsf:渲染开始() then
        取白色背景(0,0,300,300,true):显示(5,5)
        __res:取图片("shape/ui/zmp/rmx.png"):显示(25,50)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.转换网格:重置(男女)
end

function 角色控件:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
end

local 切换 = 角色控件:创建我的was按钮(__res:取地址('shape/ui/zmp/',0X70E79D5D),"",260,10)

function 切换:左键弹起(x,y,msg)
    转换角色.男女 = 转换角色.男女 == 1 and 2 or 1
    转换角色.角色控件.转换网格:重置(转换角色.男女)
    -- 确保所有格子都可见
    for i = 1, 9 do
        转换角色.角色控件.转换网格.子控件[i]:置可见(true)
    end
end

local 切换1 = 角色控件:创建我的was按钮(__res:取地址('shape/ui/zmp/',0X70E79D5D),"12",230,10)

function 切换1:左键弹起(x,y,msg)
    转换角色.男女 = 3
    转换角色.角色控件.转换网格:重置(转换角色.男女)
    -- 只显示第一个格子，隐藏其他格子
    for i = 1, 9 do
        if i == 1 then
            转换角色.角色控件.转换网格.子控件[i]:置可见(true)
        else
            转换角色.角色控件.转换网格.子控件[i]:置可见(false)
        end
    end
end

local 转换网格 = 角色控件:创建网格("转换网格",80,45,230,250)

function 转换网格:初始化()
    self:创建格子(55,55,35,25,3,3)
end

function 转换网格:重置(男女)
    for i, v in ipairs(txb[男女]) do
        if 男女==3 then
            local nsf = require('SDL.图像')(55,55)
            if nsf:渲染开始() then
                local lssj = 取头像(v)
                __res:getPNGCC(3, 1091, 374, 49, 49):显示(0,0)
                __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(44, 44):显示(2, 2)
                nsf:渲染结束()
            end
            self.子控件[i]:置精灵(nsf:到精灵())
            self.子控件[i].模型数据 = v    
        else
            local nsf = require('SDL.图像')(55,55)
            if nsf:渲染开始() then
                local lssj = 取头像(v)
                if lssj[2] == 0 then
                    lssj[2] = lssj[1]
                end
                __res:getPNGCC(3, 1091, 374, 49, 49):显示(0,0)
                __res:取图像(__res:取地址("shape/mx/", lssj[2])):拉伸(44, 44):显示(2, 2)
                nsf:渲染结束()
            end
            self.子控件[i]:置精灵(nsf:到精灵())
            self.子控件[i].模型数据 = v
        end
    end
end

function 转换网格:左键弹起(x, y, i, item, msg)
    转换角色.选中模型 = self.子控件[i].模型数据
    转换角色.主角网格:重置()
    转换角色.角色控件:置可见(false)
    转换角色.门派控件:置可见(true)
    转换角色.门派控件:重置()
end

local 消耗控件 = 转换角色:创建控件("消耗控件",10,30,310,400)
    
function 消耗控件:重置()
    local nsf = require('SDL.图像')(310,400)
    if nsf:渲染开始() then
        __res:取图片("shape/ui/zmp/dt1.png"):显示(5,10)
        取白色背景(0,0,300,170,true):显示(5,200)
        字体14:置颜色(__取颜色("黑色"))
        字体14:取图像(多开数据[当前].角色信息.种族):显示(145,30)
        字体14:取图像(多开数据[当前].角色信息.模型):显示(145,60)
        字体14:取图像(多开数据[当前].角色信息.门派):显示(145,89)
        字体14:取图像(转换角色.选中模型):显示(145,119)
        字体14:取图像(转换角色.选中门派):显示(145,147)
        字体14:取图像("方式1：消耗经验、银两"):显示(30,220)
        字体14:取图像("方式2：银两"):显示(30,300)
        字体14:置颜色(__取颜色("红色"))
        字体14:取图像("消耗经验：3亿"):显示(80,245)
        字体14:取图像("消耗银两：500万"):显示(80,270)
        字体14:取图像("消耗银两：1500万"):显示(80,325)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

function 消耗控件:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
end

for i, v in ipairs {
    {name = '控件1', x = 220 ,y = 230 , tcp = __res:取地址('shape/ui/zmp/',0X46C0AA75)},
    {name = '控件2', x = 220 ,y = 310 , tcp = __res:取地址('shape/ui/zmp/',0X46C0AA75)},
} do
    local 临时函数 = 消耗控件:创建我的was单选按钮(v.tcp,v.name,v.x,v.y)
    function 临时函数:左键弹起(x, y)
        临时函数:置选中(true)
        if v.name == "控件1" then
            转换角色.消耗控件.控件2:置选中(false)
        else
            转换角色.消耗控件.控件1:置选中(false)
        end
        转换角色.消耗方式 = v.name == "控件1" and "经验银子" or "银子"
    end
end

local 确定 = 消耗控件:创建我的按钮(__res:getPNGCC(1,626,28,58,34,true):拉伸(55,30),"确定",245,340,"确定")
function 确定:左键弹起(x,y,msg)
    if 转换角色.消耗方式 ~= 0 then
        发送数据(当前,91,{门派=转换角色.选中门派,角色=转换角色.选中模型,支付方式=转换角色.消耗方式})
        转换角色.关闭:左键弹起()
    end
end

local 重选 = 消耗控件:创建我的按钮(__res:getPNGCC(1,626,28,58,34,true):拉伸(55,30),"重选",245,140,"重选")
function 重选:左键弹起(x,y,msg)
    转换角色.男女 = 多开数据[当前].角色信息.性别 == "男" and 2 or 1
    转换角色.选中模型 = 多开数据[当前].角色信息.模型
    转换角色.选中门派 = 多开数据[当前].角色信息.门派
    转换角色.角色控件:重置(转换角色.男女)
    转换角色.主角网格:重置()
    转换角色.角色控件:置可见(true)
    转换角色.主角网格:置可见(true,true)
    转换角色.消耗控件:置可见(false)
end


local 门派控件 = 转换角色:创建控件("门派控件",10,125,310,310)

function 门派控件:重置()
    local nsf = require('SDL.图像')(310,310)
    if nsf:渲染开始() then
        取白色背景(0,0,300,300,true):显示(5,5)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.门派网格:重置()
end

function 门派控件:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
end

local 门派网格 = 门派控件:创建网格("门派网格",50,45,230,250)

function 门派网格:初始化()
    self:创建格子(65,65,35,25,2,3)
end

function 门派网格:重置()
    local data = 载入门派(转换角色.选中模型)
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(65,65)
        if nsf:渲染开始() then
            字体14:置颜色(__取颜色("黑色"))
            字体14:取图像(mp[v]):显示(0,45)
            local shiy =v
            __res:取图片("shape/ui/zmp/"..shiy..".png"):显示(2,2)
           
            nsf:渲染结束()
        end
        self.子控件[_]:置精灵(nsf:到精灵())
        self.子控件[_].门派数据 = mp[v]
    end
end

function 门派网格:左键弹起(x, y, i, item, msg)
    转换角色.选中门派 = self.子控件[i].门派数据
    转换角色.门派控件:置可见(false)
    转换角色.消耗控件:置可见(true)
    转换角色.消耗控件:重置()
    转换角色.主角网格:置可见(false)
end

local 重选 = 门派控件:创建我的按钮(__res:getPNGCC(1,626,28,58,34,true):拉伸(55,30),"重选",220,240,"重选")
function 重选:左键弹起(x,y,msg)
    转换角色.男女 = 多开数据[当前].角色信息.性别 == "男" and 2 or 1
    转换角色.选中模型 = 多开数据[当前].角色信息.模型
    转换角色.角色控件:重置(转换角色.男女)
    转换角色.主角网格:重置()
    转换角色.角色控件:置可见(true)
    转换角色.门派控件:置可见(false)
end

local 关闭 = 转换角色:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",285,0)
function 关闭:左键弹起(x,y,msg)
    转换角色.图像 = nil
    转换角色.数据 = nil
    转换角色.选中 = nil
    转换角色:置可见(false)
end