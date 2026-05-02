local 自由技能栏 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("自由技能栏",0,0,773,502)
local 当前 = 多开数据.当前
local fz = {"强身术","冥想","强壮","暗器技巧","中药医理","烹饪技巧","打造技巧","裁缝技巧","炼金术","养生之道","健身术","熔炼之术","神速"}
function 自由技能栏:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(773,502)
    if nsf:渲染开始() then
        置窗口背景("自由技能栏",0,12,765,490,true):显示(0,0)
        取白色背景(0,0,295,433,true):显示(20,50)
        取白色背景(0,0,410,100,true):显示(320,50)
        local lssj = 取输入背景(0,0,124,23)
        字体18:置颜色(__取颜色('黑色'))
        for _, v in ipairs{
            {name = '技能' , x = 89 , y = 58},
            {name = '等级' , x = 238 , y = 58},
            {name = '相关法术' , x = 498 , y = 159 , colour = '白色' },
            {name = '可用经验' , x = 325 , y = 357 , input = true},
            {name = '所需积分' , x = 540 , y = 357 , input = true},
            {name = '可用金钱' , x = 325 , y = 388 , input = true},
            {name = '所需金钱' , x = 540 , y = 388 , input = true},

        }do
            if v.colour then
                字体18:置颜色(__取颜色(v.colour))
            end
            字体18:取图像(v.name):显示(v.x,v.y)
            if v.input then
                lssj:显示(v.x+85,v.y-2)
            end
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 自由技能栏:重置(level,name)
    local nsf = require('SDL.图像')(430,100)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黑色'))
        for _, v in ipairs{
            {name = '可用经验' , dy = '当前经验' , x = 103 , y = 22 , input = true},
            {name = '所需经验' , x = 318 , y = 22 , input = true},
            {name = '可用金钱' , dy = '银子' , x = 103 , y = 52 , input = true},
            {name = '所需金钱' , x = 318 , y = 52 , input = true},
        }do
            if level then
                local 临时消耗=self:学习技能(level,level+1)
                if v.name == '所需经验' then
                    字体18:取图像(临时消耗 or "上限"):显示(v.x,v.y)  
                elseif v.name == '所需金钱' then
                    字体18:取图像("???"):显示(v.x,v.y)
                else
                    字体18:取图像(多开数据[当前 or self and self.当前].角色信息[v.dy]):显示(v.x,v.y)
                end
            else
                if v.name == '所需经验' then
                    字体18:取图像(0):显示(v.x,v.y)
                elseif v.name == '所需金钱' then
                    字体18:取图像(0):显示(v.x,v.y)
                else
                    字体18:取图像(多开数据[当前 or self and self.当前].角色信息[v.dy]):显示(v.x,v.y)
                end
            end
        end
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.图像:置中心(-317,-338)
end
function 自由技能栏:学习技能(当前技能等级,目标技能等级)
	return math.floor(当前技能等级*(1+0.5*(当前技能等级-1)))
end


function 自由技能栏:打开(类型)
    self:置可见(true)
    -- 自定义系统处理("shjnxh")
    -- 自定义系统处理("qzjnxh")
    if 类型=="紫衣盗" then
        fz = {"打造技巧","裁缝技巧","中药医理","炼金术","烹饪技巧","熔炼之术"}
    elseif 类型=="黑山老妖" then
        fz = {"强身术","冥想","养生之道","健身术","暗器技巧","烹饪技巧","强壮","神速"}
    end
    self.类型 = 类型
    self.技能列表:重置()
    self:重置()
    self.选中 = nil
end

local 关闭 = 自由技能栏:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",723,0)

function 关闭:左键弹起(x,y,msg)
    自由技能栏:置可见(false)
    自由技能栏.技能文本:清空()
end

local 技能文本 = 自由技能栏:创建我的文本("技能文本",345,60,384,88,true)
local 技能列表 = 自由技能栏:创建列表("技能列表",22,86,292,350)

function 技能列表:初始化()
    self:置文字(字体20)
    self.行高度 = 50
    self.行间距 = 0
end

function 技能列表:重置()
    local tbsj = {}
    self:清空()
    for v=1,#fz do
        local nsf = require('SDL.图像')(292,50)
        local 等级 = self:取等级(fz[v])
        if nsf:渲染开始() then
            local skill = 取技能信息(fz[v])
            __res:取图像(__res:取地址('shape/jn/',skill[8])):拉伸(30,30):显示(11,10)
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(fz[v]):显示(54,15)
            
            local 上限 = 100
            if fz[v] == "强壮" or fz[v] == "神速" then
                上限 = 40
            end
            字体16:取图像(等级..'/'..上限):显示(200,15)
            nsf:渲染结束()
        end
        local r = self:添加()
        r.技能名称 = fz[v] 
        r.技能等级 = 等级
        r:置精灵(nsf:到精灵())
    end
end

function 技能列表:取等级(名称)
    for _, v in ipairs(多开数据[当前 or self and self.当前].角色信息.辅助技能) do
        if v.名称 == 名称 then
            return v.等级
        end
    end
    return 0
end

function 技能列表:单个重置()
    if fz[自由技能栏.选择] then
        local 等级 = self:取等级(fz[自由技能栏.选择])
        local nsf = require('SDL.图像')(292,50)
        if nsf:渲染开始() then
            local skill = 取技能信息(fz[自由技能栏.选择])
            __res:取图像(__res:取地址('shape/jn/',skill[8])):拉伸(30,30):显示(11,10)
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像( fz[自由技能栏.选择]):显示(54,15)
            local 上限 = 100
            if fz[自由技能栏.选择] == "强壮" or fz[自由技能栏.选择] == "神速" then
                上限 = 40
            end
            字体16:取图像(等级..'/'..上限):显示(200,15)
            nsf:渲染结束()
        end
        自由技能栏.技能列表.子控件[自由技能栏.选择]:置精灵(nsf:到精灵())
        自由技能栏:重置(等级,fz[自由技能栏.选择])
    end
end

function 技能列表:左键弹起(x, y, i, item, msg)
    local skill = 取技能信息(self.子控件[i].技能名称)
    技能文本:清空()
    技能文本:置文本('#G'..self.子控件[i].技能名称)
    技能文本:置文本('#K'..(skill[1] or '无效果'))
    自由技能栏:重置(self.子控件[i].技能等级,self.子控件[i].技能名称)
    自由技能栏.选中 = self.子控件[i].技能名称
    自由技能栏.选择 = i
end

local 学习 = 自由技能栏:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),'学习',475,450,'学习')
function 学习:左键弹起(x,y,msg)
    if 自由技能栏.选中 then
        发送数据(当前 or self and self.当前,3712,{名称=自由技能栏.选中,内容=自由技能栏.类型})
    end
end

