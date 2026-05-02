local 仙玉寄售 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("仙玉寄售",0,0,410,410) ----------佬伍修改（增加仙玉寄售功能）
local 当前 = 多开数据.当前
local function 时间转换(时间)
	return  os.date("%m", 时间).."月"..os.date("%d", 时间).."日 "
end
function 仙玉寄售:初始化()
    __置窗口坐标(self,'右')
    local nsf = require('SDL.图像')(410,410)
    if nsf:渲染开始() then
        置窗口背景("仙玉寄售",0,12,400,400,true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 仙玉寄售:打开(数据)
    self:置可见(true)
    self.数据 = 数据
    
    self.仙玉数据={}
    self.我得仙玉={}
    self.已寄售点数 = 0
    for i=1,#self.数据.商品 do
        local ls = 分割文本(self.数据.商品[i],"*")
        self.仙玉数据[#self.仙玉数据+1]={真实编号=i,点数=ls[3],单价=ls[4],时间=ls[5],识别码=ls[6]}
        if ls[2]+0 == 多开数据[当前 or self and self.当前].角色信息.数字id then
            self.我得仙玉[#self.我得仙玉+1]={真实编号=i,点数=ls[3],单价=ls[4],时间=ls[5],识别码=ls[6]}
            self.已寄售点数=self.已寄售点数+self.我得仙玉[#self.我得仙玉].点数
        end
    end
    if #self.我得仙玉 >1 then
        table.sort(self.我得仙玉,function(a,b) return a.时间<b.时间 end)
    end
    if #self.仙玉数据 >1 then
        table.sort(self.仙玉数据,function(a,b) return a.单价<b.单价 end)
    end
    if self.数据.界面=="购买" then
        self.购买仙玉:置选中(true)
        self.购买:置可见(true)
        self.出售仙玉:置选中(false)
        self.出售:置可见(false)
        self.购买:重置()
    else
        self.出售仙玉:置选中(true)
        self.出售:置可见(true)
        self.购买仙玉:置选中(false)
        self.购买:置可见(false)
        self.出售:重置()
    end
end


function 仙玉寄售:刷新(数据)
    self.数据 = 数据
    self.仙玉数据 = {}
    self.我得仙玉 = {}
    self.已寄售点数 = 0
    for i=1,#self.数据.商品 do
        local ls = 分割文本(self.数据.商品[i],"*")
        self.仙玉数据[#self.仙玉数据+1]={真实编号=i,点数=ls[3],单价=ls[4],时间=ls[5],识别码=ls[6]}
        if ls[2]+0 == 多开数据[当前 or self and self.当前].角色信息.数字id then
            self.我得仙玉[#self.我得仙玉+1]={真实编号=i,点数=ls[3],单价=ls[4],时间=ls[5],识别码=ls[6]}
            self.已寄售点数=self.已寄售点数+self.我得仙玉[#self.我得仙玉].点数
        end
    end
    if #self.我得仙玉 >1 then
        table.sort(self.我得仙玉,function(a,b) return a.时间<b.时间 end)
    end
    if #self.仙玉数据 >1 then
        table.sort(self.仙玉数据,function(a,b) return a.单价<b.单价 end)
    end
    if self.购买.是否可见 then
        self.购买:重置()
    else
        self.出售:重置()
    end
end

local 购买 = 仙玉寄售:创建控件('购买',20,60,400, 400)

function 购买:初始化()
    self.选中 = nil
end

function 购买:重置()
    local nsf = require('SDL.图像')(410,410)
    if nsf:渲染开始() then
        置窗口背景("仙玉寄售",0,12,400,400,true):显示(0,0)
        取白色背景(0, 0, 370, 220,true):显示(20,80)
        字体16:置颜色(__取颜色(白色))
        字体16:取图像('点数'):显示(40,90)
        字体16:取图像('每点售价↑'):显示(150,90)
        字体16:取图像('总价'):显示(310,90)

        local lssj = 取输入背景(0, 0, 120, 23)
        字体16:取图像('购买点数:'):显示(30,310)
        lssj:显示(100,308)
        字体16:取图像('每点售价:'):显示(30,335)
        lssj:显示(100,333)

        字体16:取图像('所需总价：'):显示(240,310)
        字体16:取图像('携带银子：'..仙玉寄售.数据.银子):显示(240,335)
    end
    仙玉寄售.图像 = nsf:到精灵()
    self.购买列表:重置(仙玉寄售.仙玉数据)
end

local 购买点数 = 购买:创建我的输入('购买点数',90,250,200,18,2,10,'黑色')

function 购买:显示(x,y)
    if self.是否可见 and 购买.选中 and tonumber(self.购买点数:取数值()) ~= 0 and tonumber(self.购买点数:取数值()) ~= nil then
        字体16:显示(x+300,y+250,self.购买点数:取数值()*((仙玉寄售.仙玉数据[购买.选中] or {}).单价 or 0))
        字体16:置颜色(__取颜色(黑色))
        字体16:显示(x+95,y+275,(仙玉寄售.仙玉数据[购买.选中] or {}).单价 or 0)
    end
end

local 购买列表 = 购买:创建列表("购买列表",5,50,360,180)

function 购买列表:初始化()
    self:置文字(字体16)
    self.行高度 = 30
    self.行间距 = 0
    购买.选中 = nil
end

function 购买列表:重置(data)
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(360,180)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('黑色'))
            字体16:取图像(v.点数):显示(10,5)
            字体16:取图像(v.单价):显示(120,5)
            字体16:取图像(v.点数*v.单价):显示(280,5)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
    购买.选中 = nil
end

function 购买列表:左键弹起(x, y, i, item, msg)
    购买.选中 = i
end

local 确定购买 = 购买:创建我的按钮(__res:getPNGCC(1,449,28,174,35,true):置拉伸(80,25),"确定购买",230,300,"确定购买")

function 确定购买:左键弹起(消息,x,y)
    if 购买.选中 == nil or tonumber(购买.购买点数:取数值()) == nil or tonumber(购买.购买点数:取数值()) == 0 then
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入正确的购买信息")
        return
    end
    local 编号 = 仙玉寄售.仙玉数据[购买.选中].真实编号
    发送数据(当前 or self and self.当前,225,{编号=编号,数量=tonumber(购买.购买点数:取数值()),识别码=仙玉寄售.仙玉数据[购买.选中].识别码})
end

local 出售 = 仙玉寄售:创建控件('出售',20,60,400, 400)

function 出售:初始化()
    self.选中 = nil
end

function 出售:重置()
    local nsf = require('SDL.图像')(410,410)
    if nsf:渲染开始() then
        置窗口背景("仙玉寄售",0,12,400,400,true):显示(0,0)
        取白色背景(0, 0, 370, 220,true):显示(20,80)
        字体16:置颜色(__取颜色(白色))
        字体16:取图像('点数'):显示(40,90)
        字体16:取图像('总价'):显示(150,90)
        字体16:取图像('上架时间'):显示(310,90)

        字体16:取图像('可寄售点数:'..仙玉寄售.数据.仙玉):显示(30,310)
        字体16:取图像('已寄售点数:'..仙玉寄售.已寄售点数):显示(30,335)
        local lssj = 取输入背景(0, 0, 120, 23)
        字体16:取图像('寄售点数:'):显示(190,310)
        lssj:显示(260,310)
        字体16:取图像('寄售单价:'):显示(190,335)
        lssj:显示(260,335)
        字体16:取图像('总价:'):显示(190,360)
        lssj:显示(260,360)
    end
    仙玉寄售.图像 = nsf:到精灵()
    self.出售列表:重置(仙玉寄售.我得仙玉)
end

local 取回 = 出售:创建我的按钮(__res:getPNGCC(1,449,28,174,35,true):置拉伸(50,25),"取回",10,300,"取回")

function 取回:左键弹起(消息,x,y)
    if 出售.选中 == nil or 仙玉寄售.我得仙玉[出售.选中] == nil then
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请选择你要取回的点卡")
        return
    end
    local 编号 = 仙玉寄售.我得仙玉[出售.选中].真实编号
    发送数据(当前 or self and self.当前,224,{编号=编号,识别码=仙玉寄售.我得仙玉[出售.选中].识别码})
end

local 寄售 = 出售:创建我的按钮(__res:getPNGCC(1,449,28,174,35,true):置拉伸(50,25),"寄售",70,300,"寄售")

function 寄售:左键弹起(消息,x,y)
    if tonumber(出售.寄售单价:取数值()) == nil or tonumber(出售.寄售单价:取数值()) == 0 or tonumber(出售.寄售点数:取数值()) == nil or tonumber(出售.寄售点数:取数值()) == 0 then
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入正确的寄售信息")
        return
    end
    发送数据(当前 or self and self.当前,223,{数量=tonumber(出售.寄售点数:取数值()),单价=tonumber(出售.寄售单价:取数值())})
end

local 寄售点数 = 出售:创建我的输入('寄售点数',250,255,200,18,2,10,'黑色')
local 寄售单价 = 出售:创建我的输入('寄售单价',250,280,200,18,2,10,'黑色')
function 出售:显示(x,y)
    if self.是否可见 and tonumber(self.寄售单价:取数值()) ~= 0 and tonumber(self.寄售单价:取数值()) ~= nil and tonumber(self.寄售点数:取数值()) ~= 0 and tonumber(self.寄售点数:取数值()) ~= nil then
        字体16:显示(x+250,y+305,self.寄售单价:取数值()*self.寄售点数:取数值())
    end
end

local 出售列表 = 出售:创建列表("出售列表",5,50,360,180)
function 出售列表:初始化()
    self:置文字(字体16)
    self.行高度 = 30
    self.行间距 = 0
    出售.选中 = nil
end

function 出售列表:重置(data)
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(360,180)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('黑色'))
            字体16:取图像(v.点数):显示(10,5)
            字体16:取图像(v.单价*v.点数):显示(120,5)
            字体16:取图像(时间转换(v.时间)):显示(280,5)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
    出售.选中 = nil
end

function 出售列表:左键弹起(x, y, i, item, msg)
    出售.选中 = i
end



for i, v in ipairs {
    {name = '购买仙玉', x = 90 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(120,25), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(120,25),font="购买仙玉"},
    {name = '出售仙玉', x = 90+90+35 ,y = 45 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(120,25), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(120,25),font="出售仙玉"},
} do
    local 临时函数 = 仙玉寄售:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == "购买仙玉" then
            仙玉寄售.购买仙玉:置选中(true)
            仙玉寄售.购买:置可见(true)
            仙玉寄售.出售:置可见(false)
            仙玉寄售.购买:重置()
            仙玉寄售.出售仙玉:置选中(false)
        elseif v.name == "出售仙玉" then
            仙玉寄售.购买仙玉:置选中(false)
            仙玉寄售.购买:置可见(false)
            仙玉寄售.出售:置可见(true)
            仙玉寄售.出售:重置()
            仙玉寄售.出售仙玉:置选中(true)
        end
    end
end


local 关闭 = 仙玉寄售:创建我的按钮(__res:getPNGCC(1,401,0,46,46):置拉伸(30,30),"关闭",370,12)
function 关闭:左键弹起(x,y,msg)
    仙玉寄售:置可见(false)
end
