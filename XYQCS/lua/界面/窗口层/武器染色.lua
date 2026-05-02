
local 武器染色 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("武器染色",0,0,270,260)
local 当前 = 多开数据.当前
local 方向 = 5
local RGB = 1
function 武器染色:初始化()
    __置窗口坐标(self)
    self.图像 = nil
    local nsf = require('SDL.图像')(270,260)
    if nsf:渲染开始() then
        置窗口背景("武器染色",0,0,270,260,true):显示(0,0)
        __res:getPNGCC(3,761,370,308,163):拉伸(165,180):显示(10,30) --模型背景
        __res:getPNGCC(1,239,339,252,17):拉伸(185,17):显示(43,225)
        字体18:置颜色(__取颜色('白色'))
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.模型格子 = __UI模型格子.创建(当前)
    self.初始染色组 = 多开数据[当前 or self and self.当前].角色信息.装备[3].染色组
    self.初始染色方案 = 多开数据[当前 or self and self.当前].角色信息.装备[3].染色方案
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色组 = { [1] = 0, [2] = 0, [3] = 0 }
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色方案 = 0
    self.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30)
end

for i, v in ipairs {
    {name = '转身', x = 180 ,y = 120 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '转身'},
    {name = '确定', x = 180 ,y = 160 , tcp = __res:getPNGCC(1,401,65,175,43,true):拉伸(85,35) , font = '确定'},
    
} do
    local 临时函数 = 武器染色:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '确定' then
           local 武器染色方案 = 染色方案[RGB]
            
            -- 构建发送数据
            local 发送数据包 = {
                染色id = 武器染色方案.id or 0,
                炫彩 = {
                    武器染色方案.方案[1] or 0,
                    武器染色方案.方案[2] or 0,
                    武器染色方案.方案[3] or 0
                }
            }
            发送数据(当前, 3816, 发送数据包)
            武器染色:置可见(false)

        elseif v.name == '转身' then
            方向 = 方向 + 1
            if 方向 > 8 then 方向 = 1 end
        end
        武器染色.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30,nil,方向)
    end
end

local 染色滑块 = 武器染色:创建水平滚动条("染色滑块",40,230,230,30)
function 染色滑块:初始化()
    self.上次位置 = 0
    self.限制最大值 = 80
end
function 染色滑块:滚动事件(x, y, x)
    if self.上次位置 > x  then
        RGB = RGB + 1
        if RGB >= 80 then
            RGB = 80
        end
        self:置位置(RGB)
        self.上次位置 = 武器染色.染色滑块.位置
        local 武器染色方案 = 染色方案[RGB]
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色方案 = 武器染色方案.id or 0
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[1] = 武器染色方案.方案[1] or 0
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[2] = 武器染色方案.方案[2] or 0
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[3] = 武器染色方案.方案[3] or 0
        武器染色.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30,nil,方向)
    elseif self.上次位置 < x  then
        RGB = RGB - 1
        if RGB <= 0 then
            RGB = 1
        end
        self:置位置(RGB)
        self.上次位置 = 武器染色.染色滑块.位置
        local 武器染色方案 = 染色方案[RGB]
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色方案 = 武器染色方案.id or 0
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[1] = 武器染色方案.方案[1] or 0
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[2] = 武器染色方案.方案[2] or 0
        多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[3] = 武器染色方案.方案[3] or 0
        武器染色.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30,nil,方向)
    end

end

local 加 = 武器染色:创建我的按钮(__res:getPNGCC(1,641,320,29,29),"加",230,220)

function 加:左键弹起(x,y,msg)
    RGB = RGB + 1
    if RGB >= 80 then
        RGB = 80
    end
    武器染色.染色滑块:置位置(RGB)
    武器染色.染色滑块.上次位置 = 武器染色.染色滑块.位置
    local 武器染色方案 = 染色方案[RGB]
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色方案 = 武器染色方案.id or 0
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[1] = 武器染色方案.方案[1] or 0
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[2] = 武器染色方案.方案[2] or 0
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[3] = 武器染色方案.方案[3] or 0
    武器染色.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30,nil,方向)
end

local 减 = 武器染色:创建我的按钮(__res:getPNGCC(1,601,319,29,29),"减",10,220)
function 减:左键弹起(x,y,msg)
    RGB = RGB - 1
    if RGB <= 0 then
        RGB = 1
    end
    武器染色.染色滑块:置位置(RGB)
    武器染色.染色滑块.上次位置 = 武器染色.染色滑块.位置
    local 武器染色方案 = 染色方案[RGB]
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色方案 = 武器染色方案.id or 0
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[1] = 武器染色方案.方案[1] or 0
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[2] = 武器染色方案.方案[2] or 0
    多开数据[当前 or self and self.当前].角色信息.装备[3].染色组[3] = 武器染色方案.方案[3] or 0
    武器染色.模型格子:置数据(多开数据[当前 or self and self.当前].角色信息,"角色",100,30,nil,方向)
end


function 武器染色:打开(data)
    self:置可见(true)
end

function 武器染色:显示(x, y)
    self.图像:显示(x, y)
    self.模型格子:显示(x, y+145)

end


local 关闭 = 武器染色:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",225,0)
function 关闭:左键弹起(x,y,msg)
    if 武器染色.初始染色组 and 武器染色.初始染色方案 then
        多开数据[当前].角色信息.装备[3].染色组 = 武器染色.初始染色组
        多开数据[当前].角色信息.装备[3].染色方案 = 武器染色.初始染色方案
    end
    武器染色:置可见(false)
end
