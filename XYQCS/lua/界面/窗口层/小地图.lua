local 小地图 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("小地图",0,0,100,100)
local 当前 = 多开数据.当前
function 小地图:初始化()
    __置窗口坐标(self)
    self.标识 = __res:getPNGCC(2,1042,15,18,19):到精灵()
    self.标识:置中心(9,9)
    self.终点标识 = __res:getPNGCC(2,1136,5,31,42):到精灵()
    self.终点标识:置中心(15,42)
    self.坐标背景 = __res:getPNGCC(2,894,66,99,49):到精灵()
    self.传送阵 = __res:取图像(__res:取地址('shape/ui/dt/',0x558897FF))
end

function 小地图:显示(x,y)
    if self.图像 then
        self.图像:显示(x+20,y+74)
    end
    if self.筛选图像 then
        self.筛选图像:显示(x+20,y+74)
    end
    if not self.超级传送 then
        self.标识:显示(x+math.floor(多开数据[当前].__主显.主角.xy.x*self.py.x)+20,y+math.floor(多开数据[当前].__主显.主角.xy.y*self.py.y)+74)
    end
    if self.终点 then
        if 多开数据[当前].__主显.主角.xy:取距离(self.终点) < 10 or not 多开数据[当前].__主显.主角.是否移动 then
            self.终点 = nil
        else
            local xx,yy = x+math.floor(self.终点.x*self.py.x)+20,y+math.floor(self.终点.y*self.py.y)+74
            self.终点标识:显示(xx,yy)
            self.坐标背景:显示(xx-50,yy-100)
            字体18:置颜色(255,255,255)
            字体18:显示(xx-40,yy-90,math.floor(self.终点.x/20)..","..math.floor(self.终点.y/20))
        end
    end
end

function 小地图:左键弹起(x,y)
    if self.图像:检查透明(x,y) and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长)  then
        local xx,yy = self.图像:取坐标()
        x,y = x-xx,y-yy
        if self.超级传送 then
            发送数据(当前,3740,{地图=self.记忆地图,zb={x=x*self.pys.x/20,y=y*self.pys.y/20}})
            self:置可见(false)
        else
            self.终点 = require('GGE.坐标')(x*self.pys.x,y*self.pys.y):floor()
            多开数据[当前].__主显.主角:设置路径(self.终点)
        end
    end
end

function 小地图:打开(id,超级传送)
    if not __小地图资源加载(id) then
        多开数据[当前].__UI界面.界面层.左下角.聊天文本:添加文本("此场景无法查看小地图")
        return 
    end
    self:置可见(true)
    self.超级传送 = 超级传送
    if self.smap and self.smap ~= id then
        self:重置(id)
    elseif not self.smap then
        self:重置(id)
    end
    self.记忆地图=id
end

local 关闭 = 小地图:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",0,0)

function 关闭:左键弹起(x,y,msg)
    小地图:置可见(false)
end

function 小地图:重置(id)
   
    self.smap = id
    self.图像 = nil
    local Smap,Smapa = __小地图资源加载(id)
    if Smapa then
        self.图像 = __res:取精灵(__res:取地址('shape/smap/',Smapa))
        local w,h = self.图像.宽度+40+19,self.图像.高度+132
        if w < 360 then
            w = 360
        end
        self.py={x=self.图像.宽度/多开数据[当前].__主显.地图.宽度,y=self.图像.高度/多开数据[当前].__主显.地图.高度}
        self.pys={x=多开数据[当前].__主显.地图.宽度/self.图像.宽度,y=多开数据[当前].__主显.地图.高度/self.图像.高度}
        if self.超级传送 then
            local map = assert(__res:取地图('scene/'..id..'.map'), '地图不存在')
            self.pys={x=map.width/self.图像.宽度,y=map.height/self.图像.高度}
        end
        self:置宽高(w,h)
        __置窗口坐标(self)
        self.关闭:置坐标(w-50,5)
        self.筛选按钮:置坐标(w-288,h-50)
        self.世界按钮:置坐标(w-157,h-50)
        self.x输入:置数值(1)
        self.y输入:置数值(1)
        local nsf = require('SDL.图像')(w,h)
        if nsf:渲染开始() then
            取黑色背景(0,0,w-19,h-17,true):显示(0,17)
            local lssj2 = 取输入背景(0,0,50,23)
            lssj2:显示(76,36)
            lssj2:显示(153,36)
            字体18:置颜色(255,255,255)
            字体18:取图像("X:"):显示(50,37)
            字体18:取图像("Y:"):显示(130,37)
            nsf:渲染结束()
        end
        self:置精灵(nsf:到精灵())
        self.筛选控制 = {全部 = false,普通 = false,商业 = false,特殊 = false,传送 = false,任务 = false,出口 = false}
       多开数据[当前 or self and self.当前].__UI弹出.小地图筛选:重置()
        self:筛选重置()
    else
        self:置可见(false)
    end
end

function 小地图:筛选重置()
    self.筛选图像 = nil
    self.筛选表 = {假人 = {},传送={},场景={}}
    for k,v in pairs(场景取假人表(self.smap) or {}) do
        table.insert( self.筛选表.假人,v)
    end
    for k,v in pairs(多开数据[当前].__主显.传送表) do
        table.insert( self.筛选表.传送,v)
    end
    for k,v in pairs(场景取名称(self.smap) or {}) do
        table.insert( self.筛选表.场景,v)
    end
    local nsf = require('SDL.图像')(self.图像.宽度,self.图像.高度)
    if nsf:渲染开始() then
        if self.筛选控制.出口 then
            for _, v in ipairs(self.筛选表.传送) do
                if not v.隐藏 then
                    local x,y
                    if v.X and v.Y then
                        x,y=v.X*20,v.Y*20
                    elseif v.x and v.y then
                        x,y=v.x*20,v.y*20
                    end
                    self.传送阵:显示(math.floor(x*self.py.x-(self.传送阵.宽度/2)),math.floor(y*self.py.y-(self.传送阵.高度/2)))
                end
            end
        end
        for _, v in ipairs(self.筛选表.场景) do
            local x,y
            local tsf
            if v.X and v.Y then
                x,y=v.X*20,v.Y*20
            elseif v.x and v.y then
                x,y=v.x*20,v.y*20
            end
            if v.等级字体 then
                if v.是否红字体 then
                    tsf=字体16:置颜色(__取颜色('红色')):取描边图像(v.名称,255,255,255,150)
                else
                    tsf=字体16:置颜色(__取颜色('蓝色')):取描边图像(v.名称,255,255,255,150)
                end
            else
                tsf=字体16:置颜色(__取颜色('蓝色')):取描边图像(v.名称,255,255,255,150)
            end
            tsf:显示(math.floor(x*self.py.x-(tsf.宽度/2)),math.floor(y*self.py.y-(tsf.高度/2)))
        end
        for _, v in ipairs(self.筛选表.假人) do
            local x,y
            local tsf
            if v.X and v.Y then
                x,y=v.X*20,v.Y*20
            elseif v.x and v.y then
                x,y=v.x*20,v.y*20
            end
            if (v.小地图名称颜色 == 0 or v.小地图名称颜色 == 1) and self.筛选控制.普通 then
                tsf=字体14:置颜色(__取颜色('白色')):取描边图像(v.名称,0,0,0,150)
            elseif v.小地图名称颜色 == 2 and self.筛选控制.商业 then
                tsf=字体14:置颜色(__取颜色('黄色')):取描边图像(v.名称,0,0,0,150)
            elseif v.小地图名称颜色 == 3 and self.筛选控制.特殊 then
                tsf=字体14:置颜色(__取颜色('绿色')):取描边图像(v.名称,0,0,0,150)
            elseif v.小地图名称颜色 == 4 and self.筛选控制.传送 then
                tsf=字体14:置颜色(__取颜色('红色')):取描边图像(v.名称,0,0,0,150)
            elseif v.小地图名称颜色 == 5 and self.筛选控制.任务 then
                tsf=字体14:置颜色(__取颜色('青色')):取描边图像(v.名称,0,0,0,150)
            end
            if tsf then
                tsf:显示(math.floor(x*self.py.x-(tsf.宽度/2)),math.floor(y*self.py.y-(tsf.高度/2)))
            end
        end
        nsf:渲染结束()
    end
    self.筛选图像 = nsf:到精灵()
end

for i, v in ipairs {
    {name = 'x输入', x = 86 ,y = 38 , font = 'x输入'},
    {name = 'y输入', x = 163 ,y = 38 , font = 'y输入'},
} do
    local  临时函数 = 小地图:创建我的输入(v.name,v.x,v.y,40,18,2,3,'浅黑')
end

for i, v in ipairs {
    {name = '查询按钮', x = 0 ,y = 0 , tcp = __res:getPNGCC(2,1066,6,37,37)},
    {name = '前往按钮', font = '前往', x = 210 ,y = 28 , tcp = __res:getPNGCC(2,493,765,118,35,true):拉伸(94,35)},
    {name = '筛选按钮', font = '筛选 》', x = 0 ,y = 0 , tcp = __res:getPNGCC(2,493,765,118,35,true)},
    {name = '世界按钮', font = '世界', x = 0 ,y = 0 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(118,43)},
} do
    local  临时函数 = 小地图:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)

    function 临时函数:左键弹起(x, y)
        if v.name == '查询按钮' then
           多开数据[当前 or self and self.当前].__UI弹出.小地图寻路:打开(小地图.smap,临时函数:取坐标())
        elseif v.name == '筛选按钮' then
           多开数据[当前 or self and self.当前].__UI弹出.小地图筛选:打开(临时函数:取坐标())
        elseif v.name == '前往按钮' then
            if 小地图.x输入:取数值() and 小地图.y输入:取数值() and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长)  then
                小地图.终点 = require('GGE.坐标')(小地图.x输入:取数值()*20,小地图.y输入:取数值()*20):floor()
                多开数据[当前].__主显.主角:设置路径(小地图.终点)
            end
        end
    end
end