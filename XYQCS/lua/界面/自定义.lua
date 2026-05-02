--[[
    @Author       : GGELUA
    @Date         : 2022-04-09 13:46:39
Last Modified by: GGELUA
Last Modified time: 2023-05-25 16:58:29
--]]
local SDL = require 'SDL'
local GUI控件 = require('GUI.控件')
local GUI网格 = require('GUI.网格')
local GUI列表 = require('GUI.列表')
local GUI文本 = require('GUI.文本')
local GUI滑块 = require('GUI.滑块')
function 事件确认(数据)
    local 事件 = function()
    发送数据(多开数据.当前,数据.序号,数据.内容)
  end
  多开数据[多开数据.当前].__UI界面.窗口层.文本栏:打开(数据.介绍, 285, 155, 390, 200, 事件)
  end
function GUI控件:创建我的窗口(name, x, y, w, h)
    local 窗口 = self:创建窗口(name, x, y, w, h)
    function 窗口:更新(dt)
        if self.模型格子 then
            self.模型格子:更新(dt)
        end
    end

    function 窗口:显示(x, y)
        if self.图像 then
            self.图像:显示(x, y)
        end
        if self.图像2 then
            self.图像2:显示(x, y)
        end
        if self.模型格子 then
            self.模型格子:显示(x, y)
        end
    end

    return 窗口
end

function GUI控件:创建我的编辑(name, x, y, w, h, ms, zs, colour)
    local 输入 = self:创建编辑(name, x, y, w, h)
    function 输入:初始化()
        self:取光标精灵()
        self:置限制字数(zs)
        self:置颜色(__取颜色(colour))
        if fnt then
            self:置文字(fnt)
        end
    end

    return 输入
end
function GUI控件:按钮创建(tcp, ...) --通用按钮
    --print(ggetype(tcp))
   --     print(ggetype( __res:取动画(tcp)))
   if type(tcp) == 'string' then
       tcp = __res:取动画(tcp)
   end
   local arg = {...}
   local jlzu ={}
   if arg[6] and arg[6] == 'UI按钮'  then--and gge.platform ~= 'Windows'
       for i = 1, tcp.frame do
           if i==tcp.frame then
               table.insert(jlzu, tcp:取灰度精灵(1):置拉伸(40, 40)) 
           else
             table.insert(jlzu, tcp:取精灵(i):置拉伸(40, 40))    
           end      
       end       
   else
   if arg[6] and (arg[6] == 'UI按钮' or arg[6] == 'UI按钮1') then    
       for i = 1, tcp.frame do
           if i==tcp.frame then
               table.insert(jlzu, tcp:取灰度精灵(1)) 
           else
               table.insert(jlzu, tcp:取精灵(i))    
           end      
       end  
   end
end
   tcp=jlzu
   local 按钮 = self:创建按钮(...)   
   function 按钮:初始化()      
       if #tcp == 1 then
           self:置正常精灵(tcp[1]:置中心(0, 0))
           self:置按下精灵(tcp[1]:置中心(-1, -1))
           self:置经过精灵(tcp[1]:置中心(0, 0))
           self:置禁止精灵(tcp[#jlzu])
       elseif #tcp == 2 then
           self:置正常精灵(tcp[1])
           self:置按下精灵(tcp[2])
           self:置经过精灵(tcp[2])
           self:置禁止精灵(tcp[#jlzu])
       elseif #tcp >= 3 then
           self:置正常精灵(tcp[1])
           self:置按下精灵(tcp[2])
           self:置经过精灵(tcp[3])
           self:置禁止精灵(tcp[#jlzu])
       end
   end
   return 按钮
end
function GUI控件:创建我的输入(name, x, y, w, h, ms, zs, colour)
    local 输入 = self:创建输入(name, x, y, w, h)
    function 输入:初始化()
        self:取光标精灵()
        self:置限制字数(zs)
        self:置颜色(__取颜色(colour))
        if fnt then
            self:置文字(fnt)
        end
        if ms then
            self:置模式(2)
        end
    end

    return 输入
end

function GUI控件:创建我的网格(name, x, y, w, h, w2, h2, hj, lj, hs, ls, auto)
    local 网格 = self:创建网格(name, x, y, w, h)
    function 网格:初始化()
        网格:创建格子(w2, h2, hj, lj, hs, ls, auto)
    end

    return 网格
end

function GUI控件:创建我的进度(tcp, name, x, y, w, h)
    local 进度 = self:创建进度(name, x, y, w, h)
    function 进度:初始化()
        self:置精灵(tcp:到精灵())
    end

    return 进度
end

function GUI控件:创建我的文本(name, x, y, w, h, bq)
    local 文本 = self:创建文本(name, x, y, w, h)
    if bq then
        for i = 1, 8 do
            文本:添加精灵(i + 899, 多开数据[多开数据.当前].__主控.频道[i])
        end
        for i = 1, 120 do
            文本:添加精灵(i, 多开数据[多开数据.当前].__主控.表情[i])
        end

        local n=0

        for i=121,170 do

           if  i<=130 then
               n=i-120
                if  n==10 then
                n=0
                end
                文本:添加精灵(i,多开数据[多开数据.当前].__主控.金色id[n])
            elseif i<=140 then
                n=i-130
                if  n==10 then
                    n=0
                end
                文本:添加精灵(i,多开数据[多开数据.当前].__主控.紫色id[n])
            elseif i<=150 then
                n=i-140
                if  n==10 then
                    n=0
                end
                文本:添加精灵(i,多开数据[多开数据.当前].__主控.绿色id[n])
            elseif i<=160 then
                n=i-150
                if  n==10 then
                    n=0
                end
                文本:添加精灵(i,多开数据[多开数据.当前].__主控.蓝色id[n])
             elseif i<=170 then
                n=i-160
                if  n==10 then
                    n=0
                end
                -- 文本:添加精灵(i,多开数据[多开数据.当前].__主控.趣味id[n])
                local 精灵 = 多开数据[多开数据.当前].__主控.趣味id[n]
                文本:添加精灵(i, 精灵:置中心(0, 15))  -- 将中心点向上偏移20像素

           end
        end

    end
    return 文本
end

function GUI控件:我的按钮置文字(self, tcp, txt) --was按钮
    if txt then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf = 字体20:置颜色(255, 255, 255, 255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
    end
    self:置正常精灵(tcp:到精灵():置中心(0, 0))
    self:置按下精灵(tcp:到精灵():置中心(-1, -1))
    self:置经过精灵(tcp:到精灵():置中心(0, 0))
    self:置禁止精灵(tcp:复制():到灰度():到精灵():置中心(0, 0))
    self:置精灵(tcp)
    self:置状态(1)
end

function GUI控件:创建我的按钮(tcp, name, x, y, txt, jinz, zt) --was按钮
    local 按钮 = self:创建按钮(name, x, y)
    local 字体 = 字体20
    if zt then 字体 = 选择字体[zt] end
    if txt and txt~="" then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf = 字体:置颜色(255, 255, 255, 255):取图像(txt)
            ----------------------------------------------
            elseif  type(txt) == 'number' then
                    tsf=字体20:置颜色(255,255,255,255):取图像(txt)
           ----------------------------------------------C改
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
    end
    function 按钮:初始化()
        self:置正常精灵(tcp:到精灵():置中心(0, 0))
        self:置按下精灵(tcp:到精灵():置中心(-1, -1))
        self:置经过精灵(tcp:到精灵():置中心(0, 0))
        self:置禁止精灵(tcp:复制():到灰度():到精灵():置中心(0, 0))
        self:置精灵(tcp)
        if jinz then
            self:置禁止(jinz)
        end
    end

    return 按钮
end
function GUI控件:创建我的按钮18(tcp,name,x,y,txt,jinz) --
    local 按钮 = self:创建按钮(name,x,y)
    if txt and txt~="" then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf=字体18:置颜色(255,255,255,255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2-1)
            tcp:渲染结束()
        end
    end
    function 按钮:初始化()
        self:置正常精灵(tcp:到精灵():置中心(0, 0))
        self:置按下精灵(tcp:到精灵():置中心(-1, -1))
        self:置禁止精灵(tcp:复制():到灰度():到精灵():置中心(0,0))
        if jinz then
            self:置禁止(jinz)
        end
    end
    return 按钮
end
function GUI控件:创建我的按钮16(tcp,name,x,y,txt,jinz,颜色) --
    local 按钮 = self:创建按钮(name,x,y)
    if txt and txt~="" then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                if 颜色 then
                    tsf=字体16:置颜色(__取颜色(颜色)):取图像(txt)
                else
                    tsf=字体16:置颜色(159,33,31):取图像(txt)
                end
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
    end
    function 按钮:初始化()
        self:置正常精灵(tcp:到精灵():置中心(0, 0))
        self:置按下精灵(tcp:到精灵():置中心(-1, -1))
        self:置禁止精灵(tcp:复制():到灰度():到精灵():置中心(0,0))
        if jinz then
            self:置禁止(jinz)
        end
    end
    return 按钮
end
function GUI控件:创建我的文字按钮(tcp, name, x, y, txt, jinz, zt) --was按钮
    local 按钮 = self:创建按钮(name, x, y)
    if txt then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf = zt:置颜色(255, 255, 255, 255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
    end
    function 按钮:初始化()
        self:置正常精灵(tcp:到精灵():置中心(0, 0))
        self:置按下精灵(tcp:到精灵():置中心(-1, -1))
        self:置经过精灵(tcp:到精灵():置中心(0, 0))
        self:置禁止精灵(tcp:复制():到灰度():到精灵():置中心(0, 0))
        if jinz then
            self:置禁止(jinz)
        end
    end

    return 按钮
end

function GUI控件:创建我的控件(name, x, y, w, h)
    local 控件 = self:创建控件(name, x, y, w, h)
    function 控件:更新(dt)
        if self.模型格子 then
            self.模型格子:更新(dt)
        end
    end

    function 控件:显示(x, y)
        if self.图像 then
            self.图像:显示(x, y)
        end
        if self.图像2 then
            self.图像2:显示(x, y)
        end
        if self.模型格子 then
            self.模型格子:显示(x, y)
        end
    end

    return 控件
end

function GUI控件:创建我的多选按钮(tcp,tcp2,name,x,y,txt) --was按钮
    local 按钮 = self:创建多选按钮(name,x,y)
    if txt and txt~="" then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf=字体20:置颜色(255,255,255,255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
        if tcp2:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf=字体20:置颜色(255,255,255,255):取图像(txt)
            end
            tsf:显示((tcp2.宽度 - tsf.宽度) // 2, (tcp2.高度 - tsf.高度) // 2)
            tcp2:渲染结束()
        end
    end
    function 按钮:初始化()
        self:置正常精灵(tcp:到精灵():置中心(0, 0))
        self:置按下精灵(tcp:到精灵():置中心(-1, -1))
        self:置选中正常精灵(tcp2:到精灵():置中心(0, 0))
    end
    return 按钮
end
function GUI控件:我的按钮18置文字(self,tcp,txt) --was按钮
    if txt and txt~="" then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf=字体18:置颜色(255,255,255,255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2-1)
            tcp:渲染结束()
        end
    end
    self:置正常精灵(tcp:到精灵():置中心(0, 0))
    self:置按下精灵(tcp:到精灵():置中心(-1, -1))
    self:置状态(1)
    self:置可见(true)
end
function GUI控件:我的单选按钮置文字(self,tcp,tcp2,txt)
    -- print(txt)
    if txt and txt~="" then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf=字体20:置颜色(255,255,255,255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
        if tcp2:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf=字体20:置颜色(255,255,255,255):取图像(txt)
            end
            tsf:显示((tcp2.宽度 - tsf.宽度) // 2, (tcp2.高度 - tsf.高度) // 2)
            tcp2:渲染结束()
        end
    end
    self:置正常精灵(tcp:到精灵():置中心(0, 0))
    self:置按下精灵(tcp:到精灵():置中心(-1, -1))
    self:置选中正常精灵(tcp2:到精灵():置中心(0, 0))
    self:置可见(true)
end
function GUI控件:创建我的单选按钮(tcp, tcp2, name, x, y, txt) --was按钮
    local 按钮 = self:创建单选按钮(name, x, y)
    if txt then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf = 字体20:置颜色(255, 255, 255, 255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
        if tcp2:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf = 字体20:置颜色(255, 255, 255, 255):取图像(txt)
            end
            tsf:显示((tcp2.宽度 - tsf.宽度) // 2, (tcp2.高度 - tsf.高度) // 2)
            tcp2:渲染结束()
        end
    end
    function 置轮廓文字(wz,tuxiang,底色,字色,x,y)
    wz:置颜色(__取颜色(底色)):置轮廓(1):取图像(tuxiang):显示(x,y)
    wz:置颜色(__取颜色(字色)):置轮廓(0):取图像(tuxiang):显示(x+1,y+1)
end

    function 按钮:置文字(tcp, tcp2, txt)
        if txt then
            if tcp:渲染开始() then
                local tsf = txt
                if type(txt) == 'string' then
                    tsf = 字体20:置颜色(255, 255, 255, 255):取图像(txt)
                end
                tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
                tcp:渲染结束()
            end
            if tcp2:渲染开始() then
                local tsf = txt
                if type(txt) == 'string' then
                    tsf = 字体20:置颜色(255, 255, 255, 255):取图像(txt)
                end
                tsf:显示((tcp2.宽度 - tsf.宽度) // 2, (tcp2.高度 - tsf.高度) // 2)
                tcp2:渲染结束()
            end
            self:置正常精灵(tcp:到精灵():置中心(0, 0))
            self:置按下精灵(tcp:到精灵():置中心(-1, -1))
            self:置经过精灵(tcp:到精灵():置中心(0, 0))
            self:置选中正常精灵(tcp2:到精灵():置中心(0, 0))
        end
    end
    function 按钮:初始化()
        self:置正常精灵(tcp:到精灵():置中心(0, 0))
        self:置按下精灵(tcp:到精灵():置中心(-1, -1))
        self:置经过精灵(tcp:到精灵():置中心(0, 0))
        self:置选中正常精灵(tcp2:到精灵():置中心(0, 0))
    end

    return 按钮
end
function GUI控件:创建关闭按钮(tcp, ...) --was按钮
    local 按钮 = self:创建单选按钮(...)
    function 按钮:初始化()
        if type(tcp) == 'string' then
            tcp = __res:取动画(tcp)
        end
        if tcp.frame == 1 then
            self:置正常精灵(tcp:取精灵(1):置中心(0, 0))
            self:置按下精灵(tcp:取精灵(2):置中心(-1, -1))
            self:置经过精灵(tcp:取精灵(3):置中心(0, 0))
            self:置选中正常精灵(tcp:取精灵(4):置中心(0, 0))
        elseif tcp.frame == 2 then
            self:置正常精灵(tcp:取精灵(1))
            self:置按下精灵(tcp:取精灵(2))
            self:置经过精灵(tcp:取精灵(1))
            self:置选中正常精灵(tcp:取精灵(2):置中心(0, 0))
        elseif tcp.frame >= 3 then
            self:置正常精灵(tcp:取精灵(1))
            self:置按下精灵(tcp:取精灵(2))
            self:置经过精灵(tcp:取精灵(2))
            self:置禁止精灵(tcp:取灰度精灵(3))
            self:置选中正常精灵(tcp:取精灵(3):置中心(0, 0))
        end
    end

    return 按钮
end
function GUI控件:创建我的单选按钮14(tcp, tcp2, name, x, y, txt) --was按钮
    local 按钮 = self:创建单选按钮(name, x, y)
    if txt then
        if tcp:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf = 字体14:置颜色(255, 255, 255, 255):取图像(txt)
            end
            tsf:显示((tcp.宽度 - tsf.宽度) // 2, (tcp.高度 - tsf.高度) // 2)
            tcp:渲染结束()
        end
        if tcp2:渲染开始() then
            local tsf = txt
            if type(txt) == 'string' then
                tsf = 字体14:置颜色(255, 255, 255, 255):取图像(txt)
            end
            tsf:显示((tcp2.宽度 - tsf.宽度) // 2, (tcp2.高度 - tsf.高度) // 2)
            tcp2:渲染结束()
        end
    end
    function 按钮:初始化()
        self:置正常精灵(tcp:到精灵():置中心(0, 0))
        self:置按下精灵(tcp:到精灵():置中心(-1, -1))
        self:置经过精灵(tcp:到精灵():置中心(0, 0))
        self:置选中正常精灵(tcp2:到精灵():置中心(0, 0))
    end

    return 按钮
end

function GUI控件:创建我的was按钮(tcp, ...) --was按钮
    local 按钮 = self:创建按钮(...)
    function 按钮:初始化()
        if type(tcp) == 'string' then
            tcp = __res:取动画(tcp)
        end
        if tcp.frame == 1 then
            self:置正常精灵(tcp:取精灵(1):置中心(0, 0))
            self:置按下精灵(tcp:取精灵(1):置中心(-1, -1))
            self:置经过精灵(tcp:取精灵(1):置中心(0, 0))
        elseif tcp.frame == 2 then
            self:置正常精灵(tcp:取精灵(1))
            self:置按下精灵(tcp:取精灵(2))
            self:置经过精灵(tcp:取精灵(1))
        elseif tcp.frame >= 3 then
            self:置正常精灵(tcp:取精灵(1))
            self:置按下精灵(tcp:取精灵(2))
            self:置经过精灵(tcp:取精灵(1))
            self:置经过精灵(tcp:取精灵(3))
        end
    end

    return 按钮
end

function GUI控件:创建我的was单选按钮(tcp, ...) --was按钮
    local 按钮 = self:创建单选按钮(...)
    function 按钮:初始化()
        if type(tcp) == 'string' then
            tcp = __res:取动画(tcp)
        end
        if tcp.frame == 1 then
            self:置正常精灵(tcp:取精灵(1):置中心(0, 0))
            self:置按下精灵(tcp:取精灵(1):置中心(-1, -1))
            self:置经过精灵(tcp:取精灵(1):置中心(0, 0))
            self:置选中正常精灵(tcp:取精灵(1):置中心(0, 0))
        elseif tcp.frame == 2 then
            self:置正常精灵(tcp:取精灵(1))
            self:置按下精灵(tcp:取精灵(2))
            self:置经过精灵(tcp:取精灵(1))
            self:置选中正常精灵(tcp:取精灵(2))
        elseif tcp.frame >= 3 then
            self:置正常精灵(tcp:取精灵(1))
            self:置按下精灵(tcp:取精灵(2))
            self:置经过精灵(tcp:取精灵(3))
            self:置禁止精灵(tcp:取灰度精灵(1))
            self:置选中正常精灵(tcp:取精灵(2))
        end
    end

    return 按钮
end

function GUI控件:创建我的was单选按钮1(tcp, ...) --was按钮
    local 按钮 = self:创建单选按钮(...)
    function 按钮:初始化()
        if type(tcp) == 'string' then
            tcp = __res:取动画(tcp)
        end
        self:置正常精灵(tcp:取精灵(2))
        self:置按下精灵(tcp:取精灵(4))
        self:置经过精灵(tcp:取精灵(3))
        self:置禁止精灵(tcp:取灰度精灵(4))
        self:置选中正常精灵(tcp:取精灵(5))
    end
    function 按钮:重置was(tcp)
        if type(tcp) == 'string' then
            tcp = __res:取动画(tcp)
        end
        self:置正常精灵(tcp:取精灵(2))
        self:置按下精灵(tcp:取精灵(4))
        self:置经过精灵(tcp:取精灵(3))
        self:置禁止精灵(tcp:取灰度精灵(4))
        self:置选中正常精灵(tcp:取精灵(5))
    end
    return 按钮
end


function GUI控件:创建我的was文字按钮(tcp, name, x, y, txt,zt) --was按钮
    local 按钮 = self:创建按钮(name, x, y)
    function 按钮:初始化()
        self:置正常精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
        self:置按下精灵(取按钮精灵(tcp, 1, txt,1,1,zt))
        self:置经过精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
        self:置禁止精灵(取按钮图像(tcp, 1, txt,nil,nil,zt):到灰度():到精灵())
    end
    function 按钮:重置was(tcp)
        self:置正常精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
        self:置按下精灵(取按钮精灵(tcp, 1, txt,1,1,zt))
        self:置经过精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
        self:置禁止精灵(取按钮图像(tcp, 1, txt,nil,nil,zt):到灰度():到精灵())
    end
    return 按钮
end

function GUI控件:创建我的was文字单选按钮(tcp, name, x, y, txt) --was按钮
    local 按钮 = self:创建单选按钮(name, x, y)
    function 按钮:初始化()
        self:置正常精灵(取按钮精灵(tcp, 1, txt))
        self:置按下精灵(取按钮精灵(tcp, 1, txt,1,1))
        self:置经过精灵(取按钮精灵(tcp, 1, txt))
        self:置禁止精灵(取按钮图像(tcp, 1, txt):到灰度():到精灵())
        self:置选中正常精灵(取按钮精灵(tcp, 2, txt))
    end
    function 按钮:重置was(tcp)
        self:置正常精灵(取按钮精灵(tcp, 1, txt))
        self:置按下精灵(取按钮精灵(tcp, 1, txt,1,1))
        self:置经过精灵(取按钮精灵(tcp, 1, txt))
        self:置禁止精灵(取按钮图像(tcp, 1, txt):到灰度():到精灵())
        self:置选中正常精灵(取按钮精灵(tcp, 2, txt))
    end
    return 按钮
end

function GUI控件:我的was按钮置文字(self, tcp, txt,zt) --was按钮
    self:置正常精灵(取按钮精灵(tcp, 2, txt,nil,nil,zt))
    self:置按下精灵(取按钮精灵(tcp, 4, txt,1,1,zt))
    self:置经过精灵(取按钮精灵(tcp, 3, txt,nil,nil,zt))
    self:置禁止精灵(取按钮图像(tcp, 1, txt,nil,nil,zt):到灰度():到精灵())
    function self:重置was(tcp)
        self:置正常精灵(取按钮精灵(tcp, 2, txt,nil,nil,zt))
        self:置按下精灵(取按钮精灵(tcp, 4, txt,1,1,zt))
        self:置经过精灵(取按钮精灵(tcp, 3, txt,nil,nil,zt))
        self:置禁止精灵(取按钮图像(tcp, 1, txt,nil,nil,zt):到灰度():到精灵())
    end
end

function GUI控件:我的was单选按钮置文字(self, tcp, txt,zt) --was按钮
    self:置正常精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
    self:置按下精灵(取按钮精灵(tcp, 1, txt,1,1,zt))
    self:置经过精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
    self:置禁止精灵(取按钮图像(tcp, 1, txt,nil,nil,zt):到灰度():到精灵())
    self:置选中正常精灵(取按钮精灵(tcp, 2,txt,nil,nil,zt))
    function self:重置was(tcp)
        self:置正常精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
        self:置按下精灵(取按钮精灵(tcp, 1, txt,1,1,zt))
        self:置经过精灵(取按钮精灵(tcp, 1, txt,nil,nil,zt))
        self:置禁止精灵(取按钮图像(tcp, 1, txt,nil,nil,zt):到灰度():到精灵())
        self:置选中正常精灵(取按钮精灵(tcp, 2,txt,nil,nil,zt))
    end
end

function 取按钮精灵(tcp, i, txt, x, y,zt) --从tcp
    x = x or 0
    y = y or 0
    local sf = __res:get(tcp):取图像(i)
    if sf:渲染开始() then
        local tsf = txt
        if type(txt) == 'string' then
            if zt then
                tsf = zt:置颜色(255, 255, 255, 255):取图像(txt)
            else
                tsf = 字体20:置颜色(255, 255, 255, 255):取图像(txt)
            end
        end
        tsf:显示((sf.宽度 - tsf.宽度) // 2 + x, (sf.高度 - tsf.高度) // 2 + y + 1)
        sf:渲染结束()
    end
    return sf:到精灵()
end

function 取按钮图像(tcp, i, txt, x, y,zt)
    x = x or 0
    y = y or 0
    local sf = __res:get(tcp):取图像(i)
    if sf:渲染开始() then
        local tsf = txt
        if type(txt) == 'string' then
            if zt then
                tsf = zt:置颜色(187, 165, 75, 255):取图像(txt)
            else
                tsf = 字体20:置颜色(187, 165, 75, 255):取图像(txt)
            end
        end
        tsf:显示((sf.宽度 - tsf.宽度) // 2 + x, (sf.高度 - tsf.高度) // 2 + y + 1)
        sf:渲染结束()
    end
    return sf
end

function 取图像指定帧(tcp, i)
    local sf = __res:get(tcp):取图像(i)
    return sf
end

local function _滚动(self)
    local py = self._py --滚动值
    for i, v in ipairs(self.子控件) do
        v.是否可见 = v.y < self.高度 + py + self.行间距
        v:置中心(0, py)
    end
end

local function _刷新列表(self) -- 自己修改
    local hy, py = 0, self._py
    for i, v in ipairs(self.子控件) do
        hy = hy + v.高度 + self.行间距
    end
    hy = hy / self.列数量
    hy = hy - self.行间距
    if hy > self.高度 then --可以滚动的最大值
        self._max = hy - self.高度
    else
        self._max = 0
    end
end

function GUI网格:创建格子(宽度, 高度, 行间距, 列间距, 行数量, 列数量, auto, zl)
    for _, v in self:遍历控件() do
        if v._id then
            self:删除控件(v._id)
        end
    end
    self._id = 0
    local sl = 0
    for h = 1, 行数量 do
        for l = 1, 列数量 do
            if zl == nil or sl < zl then
                sl = sl + 1
                local r = self:添加格子((l - 1) * (宽度 + 列间距), (h - 1) * (高度 + 行间距), 宽度, 高度)
            end
        end
    end
    self.py = 0  --滚动值
    self.max = 0 --滚动最大值
    self.行间距 = 行间距
    self.列间距 = 列间距
    self.行数量 = 行数量
    self.列数量 = 列数量
    self._auto = auto
    _刷新列表(self)
    return self
end

local _计算位置 = function(self, _x, _y)
    local x, y, pos = self._rect:取坐标()

    if self.宽度 > self.高度 then --横向
        local w = self._rect.宽度 - self._btn2.宽度
        pos = math.floor((_x - x - self._bx) / w * self.最大值)
    else
        local h = self._rect.高度 - self._btn2.高度
        pos = math.floor((_y - y - self._by) / h * self.最大值)
    end
    if pos ~= self.位置 and pos <= self.最大值 and pos >= self.最小值 and pos <= self.限制最大值 then
        self:置位置(pos)
        return true
    end
end

function GUI滑块:置位置(v)
    if v < self.最小值 or tostring(v) == '-nan(ind)' or tostring(v) == 'nan' or tostring(v) == 'inf' then
        v = self.最小值
    end
    if v > self.最大值 then
        v = self.最大值
    end
    self.位置 = v
    if self.宽度 > self.高度 then --横向
        local w = self._rect.宽度 - self._btn2.宽度
        self._btn2:置坐标(math.floor(v / self.最大值 * w), 0)
    else
        local h = self._rect.高度 - self._btn2.高度
        self._btn2:置坐标(0, math.floor(v / self.最大值 * h))
    end

    return self
end

function GUI滑块:_消息事件(msg)
    if msg.鼠标 and self:发送消息('鼠标消息') ~= false then
        for _, v in ipairs(msg.鼠标) do
            if v.type == SDL.MOUSE_DOWN and v.button == SDL.BUTTON_LEFT then
                if self._btn2:检查点(v.x, v.y) then --在按钮接收事件前，记录鼠标在按钮上的位置
                    local x, y = self._btn2:取坐标()
                    self._bx = v.x - x
                    self._by = v.y - y
                    self.滚动开始=true
                    break
                end
            elseif v.type == SDL.MOUSE_UP then
                self.滚动开始 = nil
            end
        end
    end
    GUI控件._消息事件(self, msg) --发给按钮
    if not msg.鼠标 then
        return
    end
    for _, v in ipairs(msg.鼠标) do
        if v.type == SDL.MOUSE_DOWN then
            if self._rect:检查点(v.x, v.y) and v.button == SDL.BUTTON_LEFT then --点击区域
                v.typed, v.type = v.type, nil
                v.control = self
                self._btn2:置状态('按下')
                self._btn2._LEFTDOWN = true
                -- self._bx = self._btn2.宽度 // 2
                -- self._by = self._btn2.高度 // 2
                -- -- local x, y = self._btn2:取坐标()
                -- -- self:发送消息('滚动事件', x, y, self.位置, msg)
                -- print(666666666666)
                -- self.滚动开始=true
            end
        elseif self.滚动开始 then
            if _计算位置(self, v.x, v.y) then
                local x, y = self._btn2:取坐标()
                self:发送消息('滚动事件', x, y, self.位置, msg)
            end
        end
    end
end

function GUI滑块:置最大值(str)
    self.最大值 = str
    self.限制最大值 = str
end

function GUI网格:_消息事件(msg)
    if not self.是否可见 then
        return
    end
    GUI控件._消息事件(self, msg)
    if not msg.鼠标 then
        return
    end
    for _, v in ipairs(msg.鼠标) do
        if v.type == SDL.MOUSE_DOWN then
            local a, b = self:检查格子(v.x, v.y)
            if a then
                v.typed, v.type = v.type, nil
                v.control = self

                if not self.是否禁止 then
                    local x, y, r = b:取坐标()
                    if v.button == SDL.BUTTON_LEFT then
                        self._ldown = a
                        r = self:发送消息('左键按下', x, y, a, b, msg)
                    elseif v.button == SDL.BUTTON_RIGHT then
                        self._rdown = a
                        r = self:发送消息('右键按下', x, y, a, b, msg)
                    end
                    if not msg.win and not r then
                        v.type = v.typed
                    end
                end
            end
        elseif v.type == SDL.MOUSE_UP then
            local a, b = self:检查格子(v.x, v.y)
            self._按下位置 = nil -- 自己添加
            if a then
                v.typed, v.type = v.type, nil
                v.control = self
                if not self.是否禁止 then
                    local x, y, r = b:取坐标()
                    if v.button == SDL.BUTTON_LEFT then
                        if self._ldown == a then
                            r = self:发送消息('左键弹起', x, y, a, b, msg)
                        end
                        if v.clicks == 2 then
                            r = self:发送消息('左键双击', x, y, a, b, msg)
                        end
                    elseif v.button == SDL.BUTTON_RIGHT then
                        if self._rdown == a then
                            r = self:发送消息('右键弹起', x, y, a, b, msg)
                        end
                        if v.clicks == 2 then
                            r = self:发送消息('右键双击', x, y, a, b, msg)
                        end
                    end
                    if not msg.win and not r then
                        v.type = v.typed
                    end
                end
            end
            self._ldown = nil
            self._rdown = nil
        elseif v.type == SDL.MOUSE_MOTION then
            if v.state == 0 then
                local a, b = self:检查格子(v.x, v.y)
                if a then
                    v.typed, v.type = v.type, nil
                    v.control = self
                    self._focus = true
                    local x, y = b:取坐标()
                    self:发送消息('获得鼠标', x, y, a, b, msg)
                elseif self._focus then
                    self._focus = nil
                    self:发送消息('失去鼠标', v.x, v.y, msg)
                end
            end
        elseif v.state == SDL.BUTTON_LMASK and self._auto then -- 自己添加
            local x, y = v.x, v.y
            if self:检查点(x, y) and self._max > 0 and self._按下位置 then
                v.typed, v.type = v.type, nil
                v.control = self
                if self._按下位置 > y then
                    self._py = self._py + 10
                    if self._py > self._max then
                        self._py = self._max
                    end
                    _滚动(self)
                elseif self._py > 0 then
                    if self._max >= math.abs(self._py) then
                        self._py = self._py - 10
                        if self._py < 0 then
                            self._py = 0
                        end
                        _滚动(self)
                    end
                end
            end
            self._按下位置 = v.y
        end
    end
end

local function _刷新焦点(self, x, y)
    local i, item = self:检查项目(x, y)
    if item then
        self.焦点行 = i
        return i, item
    else
        self.焦点行 = 0
    end
end


function GUI控件:创建水平滚动条(name, x, y, w, h)
    local 滑块 = self:创建滑块(name, x, y, w, h)
    local 滑块按钮 = 滑块:创建滑块按钮('滑块按钮', 0, 0)
    function 滑块按钮:初始化()
        self:置正常精灵(__res:getPNGCC(1,676,320,29,29):到精灵())
    end
    滑块:注册事件(
        滑块,
        {
            获得鼠标 = function(_, x, y)
                鼠标层:手指形状()
            end
        }
    )
    return 滑块
end

function GUI列表:_消息事件(msg)
    if not self.是否可见 then
        return
    end
    GUI控件._消息事件(self, msg)

    if not msg.鼠标 then
        return
    end

    for _, v in ipairs(msg.鼠标) do
        if v.type == SDL.MOUSE_DOWN then
            if self:检查点(v.x, v.y) then
                v.typed, v.type = v.type, nil
                v.control = self

                if not self.是否禁止 then
                    local i, item = self:检查项目(v.x, v.y)
                    if item then
                        self._curdown = i
                        if v.button == SDL.BUTTON_LEFT then
                            self.选中行 = i
                            if rawget(self, '左键按下') then
                                local x, y = item:取坐标()
                                self:发送消息('左键按下', x, y, i, item, msg)
                            end
                        elseif v.button == SDL.BUTTON_RIGHT then
                            if rawget(self, '右键按下') then
                                local x, y = item:取坐标()
                                self:发送消息('右键按下', x, y, i, item, msg)
                            end
                        end
                    end
                end
            end
        elseif v.type == SDL.MOUSE_UP then
            if self:检查点(v.x, v.y) then
                v.typed, v.type = v.type, nil
                v.control = self
                self._按下位置 = nil -- 自己添加
                if not self.是否禁止 then
                    local i, item = self:检查项目(v.x, v.y)
                    if item and self._curdown == i then
                        if v.button == SDL.BUTTON_LEFT then
                            local x, y = item:取坐标()
                            if ggetype(self) == 'GUI树形列表' then
                                if item.收展 then --有按钮
                                    item.收展:置选中(not item.是否展开)
                                elseif item.是否节点 then
                                    item.是否展开 = not item.是否展开
                                    item.父控件._ref = true
                                end
                                item:发送消息('左键弹起', x, y, i, item, msg)
                            end
                            if rawget(self, '左键弹起') then
                                self:发送消息('左键弹起', x, y, i, item, msg)
                            end
                            if v.clicks == 2 and rawget(self, '左键双击') then
                                self:发送消息('左键双击', x, y, i, item, msg)
                            end
                        elseif v.button == SDL.BUTTON_RIGHT then
                            if rawget(self, '右键弹起') then
                                local x, y = item:取坐标()
                                self:发送消息('右键弹起', x, y, i, item, msg)
                            end
                        end
                    end
                end
            end
        elseif v.type == SDL.MOUSE_MOTION then
            if self:检查点(v.x, v.y) then
                v.typed, v.type = v.type, nil
                v.control = self

                local i, item = _刷新焦点(self, v.x, v.y)
                if item then
                    local x, y = item:取坐标()
                    self:发送消息('获得鼠标', x, y, i, item, msg)
                end
            else
                self.焦点行 = 0
            end
        elseif v.type == SDL.MOUSE_WHEEL then
            local x, y = SDL._wins[v.windowID]:取鼠标坐标()

            if self:检查点(x, y) and self._max > 0 then
                v.typed, v.type = v.type, nil
                v.control = self
                if not self.是否禁止 then
                    local py = self._py + v.y * (self.高度 / 2)

                    if py > 0 then
                        py = 0
                    end

                    if math.abs(py) > self._max then
                        py = -self._max
                    end

                    if self.滑块 then
                        self.滑块:置位置(math.floor(math.abs(py) / self._max * self.滑块.最大值))
                    else
                        self._py = math.floor(py)
                        _滚动(self)
                    end

                    self:发送消息('鼠标滚轮', py == -self._max)
                end
            end
        elseif v.state == SDL.BUTTON_LMASK then -- 自己添加
            local x, y = v.x, v.y
            if self:检查点(x, y) and self._max > 0 and self._按下位置 then
                v.typed, v.type = v.type, nil
                v.control = self
                if self._按下位置 > y then
                    self._py = self._py + 5
                    if self._py > self._max then
                        self._py = self._max
                    end
                    _滚动(self)
                elseif self._py > 0 then
                    if self._max >= math.abs(self._py) then
                        self._py = self._py - 5
                        if self._py < 0 then
                            self._py = 0
                        end
                        _滚动(self)
                    end
                end
            end
            self._按下位置 = v.y
        end
    end
end

function GUI文本:_消息事件(msg)
    if not self.是否可见 or self.是否禁止 or not msg.鼠标 then
        return
    end
    for _, v in ipairs(msg.鼠标) do
        if v.type == SDL.MOUSE_DOWN then
            if self:检查点(v.x, v.y) then
                self._DOWN = { x = v.x, y = v.y, py = self._py }
                local cb = self:检查回调(v.x, v.y)
                if cb then
                    if v.button == SDL.BUTTON_LEFT then
                        self._lcb = cb
                        if rawget(self, '左键按下') then
                            v.typed, v.type = v.type, nil
                            v.control = self
                            self:发送消息('左键按下', cb, msg)
                        end
                    elseif v.button == SDL.BUTTON_RIGHT then
                        self._rcb = cb
                        if rawget(self, '右键按下') then
                            v.typed, v.type = v.type, nil
                            v.control = self
                            self:发送消息('右键按下', cb, msg)
                        end
                    end
                end
            end
        elseif v.type == SDL.MOUSE_UP then
            self._DOWN = false
            self._按下位置 = nil -- 自己添加
            if self:检查点(v.x, v.y) then
                local cb = self:检查回调(v.x, v.y)
                if cb then
                    if v.button == SDL.BUTTON_LEFT and rawget(self, '回调左键弹起') then
                        if cb == self._lcb then
                            v.typed, v.type = v.type, nil
                            v.control = self
                            self:发送消息('回调左键弹起', cb, msg)
                        end
                    elseif v.button == SDL.BUTTON_RIGHT and rawget(self, '回调右键弹起') then
                        if cb == self._rcb then
                            v.typed, v.type = v.type, nil
                            v.control = self
                            self:发送消息('回调右键弹起', cb, msg)
                        end
                    end
                end
                self._lcb = nil
                self._rcb = nil
            end
        elseif v.type == SDL.MOUSE_MOTION then
            if gge.platform == 'Windows' then
                if self:检查点(v.x, v.y) and v.state == 0 then
                    local x, y = self:取坐标()
                    self:发送消息('获得鼠标', x, y, msg)
                    self._mf = true
                    local cb = self:检查回调(v.x, v.y)
                    if cb then
                        v.typed, v.type = v.type, nil
                        v.control = self
                        self._focus = true
                        self:发送消息('获得回调', v.x, v.y, cb, msg)
                    elseif self._focus then
                        self._focus = nil
                        self:发送消息('失去回调', v.x, v.y, msg)
                    end
                elseif self._mf then
                    self._mf = nil
                    self:发送消息('失去鼠标', v.x, v.y, msg)
                end
            elseif self._DOWN and v.state & SDL.BUTTON_LMASK == SDL.BUTTON_LMASK then
                local py = self._DOWN.py + (v.y - self._DOWN.y)
                if py > 0 then
                    py = 0
                elseif math.abs(py) > self._max then
                    py = -self._max
                end
                if self.滑块 then
                    self.滑块:置位置(math.floor(math.abs(py) / self._max * self.滑块.最大值))
                else
                    self._py = math.floor(py)
                end

                self:发送消息('鼠标滚轮', py == -self._max)
            end
        elseif v.type == SDL.MOUSE_WHEEL then
            local x, y = SDL._wins[v.windowID]:取鼠标坐标()
            if self:检查点(x, y) and self._max > 0 then
                v.typed, v.type = v.type, nil
                v.control = self
                local py = self._py + v.y * (self.高度 / 2)

                if py > 0 then
                    py = 0
                elseif math.abs(py) > self._max then
                    py = -self._max
                end

                if self.滑块 then
                    self.滑块:置位置(math.floor(math.abs(py) / self._max * self.滑块.最大值))
                else
                    self._py = math.floor(py)
                end

                self:发送消息('鼠标滚轮', py == -self._max)
            end
        elseif v.state == SDL.BUTTON_LMASK then -- 自己添加
            local x, y = v.x, v.y
            if self:检查点(x, y) and self._max > 0 and self._按下位置 then
                v.typed, v.type = v.type, nil
                v.control = self
                if self._按下位置 < y then
                    if self._py < 0 then
                        self._py = self._py + 5
                        if self._py > 0 then
                            self._py = 0
                        end
                        --_滚动(self)
                    end
                else
                    if self._max > math.abs(self._py) then
                        self._py = self._py - 5
                        --_滚动(self)
                    end
                end
            end
            self._按下位置 = v.y
        end
    end
end

local GGE文本 = require('GGE.文本')

local _objmeta = {
    检查点 = function(self, x, y)
        if self.rect then
            return self.rect:检查点(x, y)
        end
    end,
    置透明 = function(self, a)
        self.o:置透明(a)
    end,
    取坐标 = function(self)
        return self.o:取坐标()
    end,
    更新 = function(self, dt)
        if self.o.更新 then
            self.o:更新(dt)
        end
    end,
    显示 = function(self, x, y)
        if self.b then --闪烁
            self.b = self.b + 1
            if self.b > 60 then
                self.b = 0
            end
        end
        if not self.b or self.b > 30 then
            self.o:显示(self.x + x, y)
            if self.rect then
                self.rect:置坐标(self.o:取坐标())
                --self.rect:显示()
            end
        end
    end
}

local _obj = function(t, x, o)
    local self = setmetatable({}, { __index = _objmeta })
    self.x = x
    self.o = o --obj

    if t.m or t.url then
        self.cb = t.m or t.url
        self.rect = require('SDL.矩形')(0, 0, o.宽度, o.高度)
    end

    if t.b then --闪烁
        self.b = 0
    end
    return self
end

local _colors = {
    --RGBWYKCHLSZNPF
    [0x52] = 0xFF0000,   --R
    [0x47] = 0x00FF00,   --G
    [0x42] = 0x0000FF,   --B
    [0x57] = 0xFFFFFF,   --W
    [0x59] = 0xFFFF00,   --Y
    [0x4B] = 0x000000,   --K
    [0x43] = 0xFF9900,   --C
    [0x48] = 0xFF000000, --H
    [0x4C] = -16776961,  --L
    [0x53] = -16466190,  --S
    [0x5A] = -16711681,  --Z
    [0x4E] = -16777216,  --N
    [0x50] = 0x00FFFF,   --P
    [0x46] = 0xFF00FE,   --F
    [0x4D] = 0xFF808080, --M
}

local function _insert(t) --比table.insert 快
    local i = #t + 1
    return function(data)
        if data ~= nil then
            t[i] = data
            i = i + 1
        end
    end
end

local function _Parser(str)                                    --解析结构
    local style_c, style_b, style_u, style_F, style_m, style_j --颜色,下划线,闪烁,字体,回调,旧回调 qqq回调
    local datas = {}
    local indata = _insert(datas)
    local codes = {}
    local incode = _insert(codes)

    local u8char = utf8.char
    local unpack = table.unpack
    local iter = utf8.codes(str)
    str = string.upper(str)
    local p, code
    while true do
        p, code = iter(str, p)
        if not p then
            if style_j then
                local m, s = string.match(u8char(unpack(codes)), '(.+)/(.*)')
                indata { c = style_c, b = style_b, u = style_u, F = style_F, m = m, s = s }
                codes = {}
                incode = _insert(codes)
                style_j = false
                p, code = iter(str, p)
                if not p then
                    break
                end
                if _colors[code] then --RGBWYK颜色
                    style_c = _colors[code]
                end
            end
            break
        end
        if code == 0x23 and not style_j then --#?
            p, code = iter(str, p)
            if not p then
                break
            end
            if #codes >= 1 and code ~= 0x23 and code ~= 0x72 and not style_m then --结束
                indata { c = style_c, b = style_b, u = style_u, F = style_F, s = u8char(unpack(codes)) }
                codes = {}
                incode = _insert(codes)
            end
            --样式解析
            if code == 0x23 then     --##
                incode(code)
            elseif code == 0x62 then --#bXXXX#b 闪烁
                style_b = not style_b
            elseif code == 0x63 then --#cFFFFFF 指定16进制颜色
                style_c = tonumber(str:sub(p + 1, p + 6), 16)
                if style_c then
                    p = p + 6
                end
            elseif _colors[code] then --RGBWYK颜色
                style_c = _colors[code]
            elseif code == 0x6D then  --#m(aaa)bbb#m 回调
                if style_m then
                    local m, s = string.match(u8char(unpack(codes)), '%((.+)%)(.*)')
                    indata { c = style_c, b = style_b, u = style_u, F = style_F, m = m, s = s }
                    codes = {}
                    incode = _insert(codes)
                end
                style_m = not style_m
            elseif code == 0x5B then --#[aaa$bbb#] 回调
                style_m = true
            elseif code == 0x5D then --#[aaa$bbb#] 回调
                if style_m then
                    local m, s = string.match(u8char(unpack(codes)), '(.+)$(.*)')
                    indata { c = style_c, b = style_b, u = style_u, F = style_F, m = m, s = s }
                    codes = {}
                    incode = _insert(codes)
                    style_m = false
                end
            elseif code == 0x56 then --回调开始
                style_j = true
            elseif code == 0x6E then --#n 结束
                style_c = nil
            elseif code == 0x75 then --#uXXXX#u 下划线
                style_u = not style_u
            elseif code == 0x4A then --#r 换行
                indata { c = style_c, b = style_b, u = style_u, F = style_F, r = true, s = u8char(unpack(codes)) }
                codes = {}
                incode = _insert(codes)
            elseif code == 0x46 then                  --#FXXX14: 字体开始
                style_F = true
            elseif code >= 0x30 and code <= 0x39 then --#0 - #999 表情
                local num = { code }
                local p_ = p
                for i = 2, 3 do
                    p_, code = iter(str, p_)
                    if not code then
                        break
                    elseif code >= 0x30 and code <= 0x39 then
                        p = p_
                        num[i] = code
                    end
                end
                indata { s = tonumber(u8char(unpack(num))) }
            end
        elseif style_F == true and code == 0x3A then --: 字体结束
            local name, size = string.match(u8char(unpack(codes)), '([^%d]+)(%d*)')
            style_F = { name, tonumber(size) }
            codes = {}
            incode = _insert(codes)
        elseif code == 0x68 then --h
            p, code = iter(str, p)
            if code == 0x74 then --t
                p, code = iter(str, p)
                if not p then
                    break
                end
                if #codes >= 1 and code ~= 0x74 and code ~= 0x72 and not style_j then --结束
                    indata { c = style_c, b = style_b, u = style_u, F = style_F, s = u8char(unpack(codes)) }
                    codes = {}
                    incode = _insert(codes)
                end
                if code == 0x7C then --|
                    style_j = true
                end
            end
        elseif code == 0x23 and style_j then
            local m, s = string.match(u8char(unpack(codes)), '(.+)/(.*)')
            indata { c = style_c, b = style_b, u = style_u, F = style_F, m = m, s = s }
            codes = {}
            incode = _insert(codes)
            style_j = false
            p, code = iter(str, p)
            if not p then
                break
            end
            if _colors[code] then --RGBWYK颜色
                style_c = _colors[code]
            end
        elseif code == 0x2F and not style_j then
        else --内容
            incode(code)
        end
    end

    if #codes > 0 then --结束
        indata { c = style_c, b = style_b, u = style_u, F = style_F, s = u8char(unpack(codes)) }
    end

    return datas
end

local function _split(str, width, font)
    for i, c in utf8.codes(str) do
        local w = font:取宽度(utf8.char(c))
        if w > width then
            return str:sub(1, i - 1), str:sub(i)
        else
            width = width - w
        end
    end
    return '', str
end

--适应宽度，生成x坐标
local function _Adjust(self)
    local width = self.宽度
    local fonts = self._文字表
    local emote = self._精灵表

    local font = fonts.默认
    local fh = font:取高度()

    local ret = {}
    local x = 0
    local line = { w = 0, h = fh }
    for _, v in ipairs(self._解析后) do
        if type(v.s) == 'string' then --文本
            --字体
            if type(v.F) == 'table' then
                local file, size = v.F[1], v.F[2]
                if fonts[file] then
                    font = fonts[file]
                end
                font:置大小(size)
                fh = size
                if not line.eh or fh > line.eh then --当没有表情时
                    line.h = fh
                end
            end
            --超链接
            local str = v.s
            if str:find('<url>') then
                str = str:match('<url>(.+)</url>')
                v.s = str
                v.url = str
                if str:find('<show>') then
                    local a, b = str:match('<show>(.+)</show>(.*)')
                    if a and b then
                        str = a
                        v.s = str
                        v.url = b
                    end
                end
            end
            --颜色
            if v.c then
                font:置颜色(v.c >> 16 & 0xFF, v.c >> 8 & 0xFF, v.c & 0xFF, 255)
            else
                font:置颜色(255, 255, 255, 255)
            end
            --下划线
            if v.u or v.url then
                font:置样式(SDL.TTF_STYLE_UNDERLINE)
            else
                font:置样式(font:取样式() & ~SDL.TTF_STYLE_UNDERLINE)
            end

            local w, h = font:取宽高(str)

            if x == 0 and w > 0 and font:取宽度(utf8.char(utf8.codepoint(str, 1))) > width then
                print('宽度过小')
            elseif x + w > width then --大于就换行
                ::loop::
                local a, b = _split(str, width - x, font)
                if a ~= '' then
                    w, h = font:取宽高(a)
                    table.insert(line, _obj(v, x, font:取精灵(a):置中心(0, h)))
                    x = x + w
                end
                line.w = x
                table.insert(ret, line)
                x = 0
                line = { w = 0, h = fh }
                --换行

                w, h = font:取宽高(b)
                if w > width then --循环换行
                    str = b
                    goto loop
                else
                    table.insert(line, _obj(v, x, font:取精灵(b):置中心(0, h)))
                    x = x + w
                    if v.r or x == width then
                        line.w = x
                        table.insert(ret, line)
                        x = 0
                        line = { w = 0, h = fh }
                    end
                end
            else
                if w > 0 then
                    table.insert(line, _obj(v, x, font:取精灵(str):置中心(0, h)))
                    x = x + w
                end
                if v.r or x == width then
                    line.w = x
                    table.insert(ret, line)
                    x = 0
                    line = { w = 0, h = fh }
                end
            end
        elseif emote[v.s] then --表情
            local e = emote[v.s]
            if e then
                local w, h = e:取宽高()

                if x + w > width then       --大于就换行
                    line.w = x
                    table.insert(ret, line) --换行
                    x = 0
                    line = { w = 0, h = fh }
                end
                if x + w <= width then
                    table.insert(line, _obj(v, x, e:复制()))
                    x = x + w
                end
                if h > line.h then
                    line.h = h
                    line.eh = h
                end
                if v.r or x == width then
                    line.w = x
                    table.insert(ret, line)
                    x = 0
                    line = { w = 0, h = fh }
                end
            else --表情不存在，以文本显示
            end
        end
    end
    line.w = x
    table.insert(ret, line)
    for i, v in ipairs(ret) do
        v.eh = nil
    end
    return ret
end

function GGE文本:置文本(s, ...)
    if not self._文字表.默认 then
        return 0, 0
    end
    if select('#', ...) > 0 then
        s = s:format(...)
    end
    --self:清空()
    s = tostring(s)
    s = s:gsub('\r\n', '#r'):gsub('\r', '#r'):gsub('\n', '#J'):gsub('qqq|', '#V')
    self._解析后 = _Parser(s)
    for _, v in ipairs(_Adjust(self)) do
        table.insert(self._数据表, v)
    end

    local w, h, y = 0, 0, 0
    for _, v in ipairs(self._数据表) do
        if v.w > w then 
            w = v.w
        end
        h = h + v.h + self.行间距

        y = y + v.h
        v.y = y
        y = y + self.行间距
    end

    return w, h - self.行间距 --返回当前区域内容最大宽高
end

local SDL文字 = require('SDL.文字')

local _set = function(self)
    if self._file then
        self:置大小(self._size)
        self:置样式(self._style)
    end
end
function SDL文字:取我的描边图像(t, r, g, b, a)
    if t and t ~= '' then
        _set(self)
        local sfa,sfb
        if self._anti then --抗锯齿
            sfa = self._font:RenderUTF8_Blended(t, self._r, self._g, self._b, self._a)
            sfb = self._font:RenderUTF8_Blended(t, r or 0, g or 0, b or 0, a)
        else
            sfa = self._font:RenderUTF8_Solid(t, self._r, self._g, self._b, self._a)
            sfb = self._font:RenderUTF8_Solid(t, r or 0, g or 0, b or 0, a)
        end
        local sf = SDL.CreateRGBSurfaceWithFormat(sfa.w + 2, sfa.h + 2)
        local r = SDL.CreateRect(1, 0, 0, 0)
        sfb:BlitSurface(nil, sf, r)
        r:SetRectXY(0, 1)
        sfb:BlitSurface(nil, sf, r)
        r:SetRectXY(2, 1)
        sfb:BlitSurface(nil, sf, r)
        r:SetRectXY(1, 2)
        sfb:BlitSurface(nil, sf, r)
        r:SetRectXY(1, 1)
        sfa:BlitSurface(nil, sf, r)
        return require('SDL.图像')(sf)
    end
end

--轮廓对宋体无效
function SDL文字:取我的描边精灵(t, r, g, b, a)
    if t and t ~= '' then
        return self._win:创建精灵(self:取我的描边图像(t, r, g, b, a))
    end
    return self._win:创建精灵()
end

function SDL文字:取我的投影图像(t, r, g, b, a)
    if t and t ~= '' then
        _set(self)
        local sfa
        local sfb
        if self._anti then --抗锯齿
            sfa = self._font:RenderUTF8_Blended(t, self._r, self._g, self._b, self._a)
            if sfa == nil then
                t = "特殊名称"
                sfa = self._font:RenderUTF8_Blended(t, self._r, self._g, self._b, self._a)
            end
            sfb = self._font:RenderUTF8_Blended(t, r or 0, g or 0, b or 0, a)
        else
            sfa = self._font:RenderUTF8_Solid(t, self._r, self._g, self._b, self._a)
            sfb = self._font:RenderUTF8_Solid(t, r or 0, g or 0, b or 0, a)
        end
        local sf = SDL.CreateRGBSurfaceWithFormat(sfa.w + 1, sfa.h + 1)
        local r = SDL.CreateRect(1, 0, 0, 0)
        --sfa:BlitSurface(nil, sf, r)
        r:SetRectXY(0, 1)
        sfb:BlitSurface(nil, sf, r)
        r:SetRectXY(0, 0)
        sfa:BlitSurface(nil, sf, r)
        r:SetRectXY(0, 0)
        sfa:BlitSurface(nil, sf, r)
        return require('SDL.图像')(sf)
    end
end

function SDL文字:取我的投影精灵(t, r, g, b, a)
    if t and t ~= '' then
        -- print(t)
        return self._win:创建精灵(self:取我的投影图像(t, r, g, b, a))
    end
    return self._win:创建精灵()
end

local SDL图像 = require('SDL.图像')


function SDL图像:更新时间()
    self._time = os.time() + 300
end

function SDL图像:检查时间(time)
    if not self._time then
        self._time = os.time()
    end
    return time > self._time
end

function __取颜色(name)
    if name == "黑色" then
        return 0, 0, 0
    elseif name == "浅黑" then
        return 39, 53, 81
    elseif name == "红色" then
        return 255, 1, 1
    elseif name == "青色" then
        return 4, 255, 255
    elseif name == "黄色" then
        return 255, 255, 8
    elseif name == "绿色" then
        return 1, 255, 1
    elseif name == "紫色" then
        return 255, 1, 255
    elseif name == "蓝色" then
        return 1, 205, 225
    elseif name == "橙色" then
        return 255, 154, 0
    elseif name == "深蓝" then
        return 29, 27, 238
    elseif name == "灰色" then
        return 128, 128, 128
    else
        return 255, 255, 255
    end
end

function __取银子颜色(jiag)
    if jiag < 100000 then
        return __取颜色('黑色')
    elseif jiag < 1000000 then
        return __取颜色('绿色')
    elseif jiag < 10000000 then
        return __取颜色('红色')
    elseif jiag >= 10000000 then
        return __取颜色('紫色')
    end
end

function __取阵法(name)
    local 阵法信息 = {}
    阵法信息.普通 = {
        [1] = { x = 357, y = 255, tip = '无效果' },
        [3] = { x = 324, y = 273, tip = '无效果' },
        [2] = { x = 389, y = 240, tip = '无效果' },
        [5] = { x = 291, y = 292, tip = '无效果' },
        [4] = { x = 422, y = 226, tip = '无效果' },
        说明 = "普通的一字阵形，没有特别的\n站位效果。",
        克制 = { 地载阵 = 5, 云垂阵 = 5, 虎翼阵 = 5, 蛇蟠阵 = 5, 雷绝阵 = 5 },
        被克制 = { 天覆阵 = 5, 风扬阵 = 5, 龙飞阵 = 5, 鸟翔阵 = 5, 鹰啸阵 = 5 }
    }
    阵法信息.天覆阵 = {
        [1] = { x = 379, y = 278, tip = '物法伤害效果+20%\n对怪固伤效果+15\n%速度-10%' },
        [3] = { x = 324, y = 273, tip = '物法伤害效果+20%\n对怪固伤效果+15\n%速度-10%' },
        [2] = { x = 389, y = 240, tip = '物法伤害效果+20%\n对怪固伤效果+15\n%速度-10%' },
        [5] = { x = 291, y = 292, tip = '物法伤害效果+20%\n对怪固伤效果+15\n%速度-10%' },
        [4] = { x = 422, y = 226, tip = '物法伤害效果+20%\n对怪固伤效果+15\n%速度-10%' },
        说明 = "攻击型阵法，所有队员物理、法术\n攻击效果提高，速度下降。",
        克制 = { 地载阵 = 10, 龙飞阵 = 10, 普通阵 = 5, 鸟翔阵 = 5, 鹰啸阵 = 5 },
        被克制 = { 风扬阵 = 10, 蛇蟠阵 = 10, 虎翼阵 = 5, 云垂阵 = 5, 雷绝阵 = 5 }
    }
    阵法信息.地载阵 = {
        [1] = { x = 399, y = 281, tip = '物法防御效果+15%' },
        [2] = { x = 373, y = 256, tip = '物法防御效果+15%' },
        [3] = { x = 433, y = 266, tip = '物法防御效果+15%' },
        [4] = { x = 364, y = 298, tip = '物法防御效果+15%' },
        [5] = { x = 419, y = 306, tip = '速度+10%' },
        说明 = "防御型阵法，阵中及两侧物理、法\n术防御效果提高，阵前攻击效\n果提高，阵后速度提高。",
        克制 = { 风扬阵 = 10, 虎翼阵 = 10, 雷绝阵 = 10, 云垂阵 = 5, 蛇蟠阵 = 5 },
        被克制 = { 天覆阵 = 10, 鹰啸阵 = 10, 鸟翔阵 = 10, 普通阵 = 5, 龙飞阵 = 5 }
    }
    阵法信息.风扬阵 = {
        [1] = { x = 399, y = 282, tip = '物法伤害效果+20%\n速度+5%' },
        [2] = { x = 433, y = 264, tip = '物法伤害效果+10%' },
        [3] = { x = 365, y = 299, tip = '物法伤害效果+10%' },
        [4] = { x = 404, y = 246, tip = '速度+10%' },
        [5] = { x = 333, y = 284, tip = '速度+10%' },
        说明 = "攻速型阵法，两翼速度效果提高，其\n余位置攻击效果提高。",
        克制 = { 天覆阵 = 10, 鸟翔阵 = 10, 鹰啸阵 = 10, 普通阵 = 5, 蛇蟠阵 = 5 },
        被克制 = { 地载阵 = 10, 虎翼阵 = 10, 雷绝阵 = 10, 云垂阵 = 5, 龙飞阵 = 5 }
    }
    阵法信息.云垂阵 = {
        [1] = { x = 425, y = 305, tip = '物法防御效果+25%\n%速度-15%' },
        [2] = { x = 387, y = 242, tip = '物法防御效果+10%' },
        [3] = { x = 322, y = 280, tip = '物法防御效果+20%' },
        [4] = { x = 424, y = 219, tip = '速度+10%' },
        [5] = { x = 279, y = 301, tip = '速度+10%' },
        说明 = "防御型阵法，两翼队员速度提高，右\n肋防御效果提高，左肋攻击效\n果大幅度提高，阵尾防御效果\n大幅度提高，速度大幅度降低。",
        克制 = { 鸟翔阵 = 10, 蛇蟠阵 = 10, 鹰啸阵 = 10, 天覆阵 = 5, 风扬阵 = 5 },
        被克制 = { 龙飞阵 = 10, 虎翼阵 = 10, 雷绝阵 = 10, 普通阵 = 5, 地载阵 = 5 }
    }
    阵法信息.龙飞阵 = {
        [1] = { x = 377, y = 293, tip = '法术防御效果+10%' },
        [2] = { x = 408, y = 317, tip = '物理防御效果+10%' },
        [3] = { x = 419, y = 228, tip = '法术伤害效果+30%\n%速度-20%' },
        [4] = { x = 306, y = 292, tip = '速度+10%' },
        [5] = { x = 346, y = 271, tip = '物法防御效果+20%' },
        说明 = "全能型阵法，队长法术防御效\n果提高，阵尾物理防御效果提\n高，阵前中间队员攻击效果提\n高，左翼速度提高，右翼法术\n对敌伤害提高、速度降低。",
        克制 = { 云垂阵 = 10, 雷绝阵 = 10, 普通阵, 地载阵 = 5, 风扬阵 = 5 },
        被克制 = { 天覆阵 = 10, 鹰啸阵 = 10, 虎翼阵, 鸟翔阵 = 5, 蛇蟠阵 = 5 }
    }
    阵法信息.虎翼阵 = {
        [1] = { x = 426, y = 299, tip = '物法防御效果+30%' },
        [2] = { x = 429, y = 262, tip = '物法防御效果+10%' },
        [3] = { x = 368, y = 298, tip = '物法防御效果+10%' },
        [4] = { x = 429, y = 223, tip = '物法伤害效果+10%' },
        [5] = { x = 297, y = 295, tip = '物法伤害效果+10%' },
        说明 = "攻击型阵法，两翼攻击效果提\n高，中间防御效果提高，阵尾\n攻击效果大幅度提高。",
        克制 = { 风扬阵 = 10, 云垂阵 = 10, 天覆阵 = 5, 龙飞阵 = 5, 雷绝阵 = 5 },
        被克制 = { 地载阵 = 10, 鸟翔阵 = 10, 普通阵 = 5, 蛇蟠阵 = 5, 鹰啸阵 = 5 }
    }
    阵法信息.鸟翔阵 = {
        [1] = { x = 363, y = 255, tip = '速度+20%' },
        [2] = { x = 429, y = 262, tip = '速度+10%' },
        [3] = { x = 368, y = 298, tip = '速度+10%' },
        [4] = { x = 429, y = 223, tip = '速度+10%' },
        [5] = { x = 297, y = 295, tip = '速度+15%' },
        说明 = "全速型阵法，所有队员的速度\n大幅度提高。",
        克制 = { 地载阵 = 10, 虎翼阵 = 10, 普通阵 = 5, 龙飞阵 = 5, 鹰啸阵 = 5 },
        被克制 = { 风扬阵 = 10, 云垂阵 = 10, 天覆阵 = 5, 蛇蟠阵 = 5, 雷绝阵 = 5 }
    }
    阵法信息.蛇蟠阵 = {
        [1] = { x = 400, y = 287, tip = '封印抵抗+20%' },
        [2] = { x = 367, y = 302, tip = '封印抵抗+20%' },
        [3] = { x = 430, y = 274, tip = '封印抵抗+20%' },
        [4] = { x = 331, y = 276, tip = '物法伤害效果+10%' },
        [5] = { x = 433, y = 317, tip = '物法伤害效果+10%' },
        说明 = "灵力型阵法，阵中及两侧抵御\n敌人法术的几率增加，阵前及\n阵尾攻击效果提高。",
        克制 = { 天覆阵 = 10, 龙飞阵 = 5, 虎翼阵 = 5, 鸟翔阵 = 5, 雷绝阵 = 5 },
        被克制 = { 云垂阵 = 10, 普通阵 = 5, 地载阵 = 5, 风扬阵 = 5, 鹰啸阵 = 5 }
    }
    阵法信息.鹰啸阵 = {
        [4] = { x = 399, y = 281, tip = '物理防御效果+10%' },
        [5] = { x = 444, y = 329, tip = '速度+10%' },
        [3] = { x = 433, y = 266, tip = '速度+10%' },
        [2] = { x = 364, y = 298, tip = '物法伤害效果+15%' },
        [1] = { x = 419, y = 306, tip = '物法伤害效果+10%' },
        说明 = "攻击型阵法，两翼速度提高，\n阵前阵尾攻击效果提高，阵中\n物理防御效果提高。",
        克制 = { 地载阵 = 10, 龙飞阵 = 10, 普通阵 = 5, 虎翼阵 = 5, 蛇蟠阵 = 5 },
        被克制 = { 风扬阵 = 10, 云垂阵 = 10, 天覆阵 = 5, 鸟翔阵 = 5, 雷绝阵 = 5 }
    }
    阵法信息.雷绝阵 = {
        [1] = { x = 429, y = 312, tip = '固定伤害效果+20%' },
        [3] = { x = 433, y = 264, tip = '固定伤害效果+20%' },
        [2] = { x = 365, y = 299, tip = '固定伤害效果+20%' },
        [5] = { x = 404, y = 246, tip = '物法伤害效果+10%' },
        [4] = { x = 333, y = 284, tip = '物法伤害效果+10%' },
        说明 = "攻击型阵法，阵后三人固定攻\n击效果提升，阵前两人攻击效\n果提升，全队携带的召唤兽攻\n击效果提升。",
        克制 = { 风扬阵 = 10, 云垂阵 = 10, 天覆阵 = 5, 鸟翔阵 = 5, 鹰啸阵 = 5 },
        被克制 = { 地载阵 = 10, 龙飞阵 = 10, 普通阵 = 5, 虎翼阵 = 5, 蛇蟠阵 = 5 }
    }
    return 阵法信息[name]
end

function 取特殊字符(t)
    if t == nil or t == "" then
        return false
    end
    return true
end

function __引擎宽高2(lx)
    if lx == 1 then
        return math.floor(引擎.宽度 / 2)
    elseif lx == 2 then
        return math.floor(引擎.高度 / 2)
    end
end

function __置窗口坐标(lx)
    local w, h = lx:取宽高()
    lx:置坐标((引擎.宽度 - w) / 2, (引擎.高度 - h) / 2)
end

function dcsv(str, reps)
    local resultStrList = {}
    string.gsub(str, '[^' .. reps .. ']+', function(w)
        table.insert(resultStrList, w)
    end)
    return resultStrList
end

染色方案 = {
    [1] = { 方案 = { [1] = 1, [2] = 0 }, id = 64 },
    [2] = { 方案 = { [1] = 1, [2] = 0 }, id = 0 },
    [3] = { 方案 = { [1] = 1, [2] = 0 }, id = 83 },
    [4] = { 方案 = { [1] = 1, [2] = 0 }, id = 106 },
    [5] = { 方案 = { [1] = 1, [2] = 0 }, id = 114 },
    [6] = { 方案 = { [1] = 1, [2] = 0 }, id = 77 },
    [7] = { 方案 = { [1] = 1, [2] = 0 }, id = 60 },
    [8] = { 方案 = { [1] = 1, [2] = 0 }, id = 2051 },
    [9] = { 方案 = { [1] = 1, [2] = 0 }, id = 2065 },
    [10] = { 方案 = { [1] = 1, [2] = 1 }, id = 56 },
    [11] = { 方案 = { [1] = 1, [2] = 0 }, id = 54 },
    [12] = { 方案 = { [1] = 1, [2] = 0 }, id = 67 },
    [13] = { 方案 = { [1] = 1, [2] = 0 }, id = 52 },
    [14] = { 方案 = { [1] = 1, [2] = 0 }, id = 82 },
    [15] = { 方案 = { [1] = 1, [2] = 1 }, id = 107 },
    [16] = { 方案 = { [1] = 1, [2] = 0 }, id = 76 },
    [17] = { 方案 = { [1] = 1, [2] = 0 }, id = 80 },
    [18] = { 方案 = { [1] = 1, [2] = 0 }, id = 2070 },
    [19] = { 方案 = { [1] = 0, [2] = 1 }, id = 2057 },
    [20] = { 方案 = { [1] = 1, [2] = 0 }, id = 53 },
    [21] = { 方案 = { [1] = 1, [2] = 0 }, id = 85 },
    [22] = { 方案 = { [1] = 1, [2] = 0 }, id = 69 },
    [23] = { 方案 = { [1] = 2 }, id = 119 },
    [24] = { 方案 = { [1] = 0, [2] = 1 }, id = 2069 },
    [25] = { 方案 = { [1] = 1, [2] = 0 }, id = 101 },
    [26] = { 方案 = { [1] = 1, [2] = 0 }, id = 58 },
    [27] = { 方案 = { [1] = 2, [2] = 0 }, id = 2000 },
    [28] = { 方案 = { [1] = 5, [2] = 0 }, id = 2078 },
    [29] = { 方案 = { [1] = 5, [2] = 0 }, id = 2079 },
    [30] = { 方案 = { [1] = 1, [2] = 0 }, id = 2042 },
    [31] = { 方案 = { [1] = 1, [2] = 1 }, id = 90 },
    [32] = { 方案 = { [1] = 1, [2] = 0 }, id = 2071 },
    [33] = { 方案 = { [1] = 1, [2] = 0 }, id = 75 },
    [34] = { 方案 = { [1] = 1, [2] = 0 }, id = 95 },
    [35] = { 方案 = { [1] = 1, [2] = 1 }, id = 108 },
    [36] = { 方案 = { [1] = 1, [2] = 0 }, id = 81 },
    [37] = { 方案 = { [1] = 1, [2] = 0 }, id = 70 },
    [38] = { 方案 = { [1] = 1, [2] = 1 }, id = 55 },
    [39] = { 方案 = { [1] = 1, [2] = 0 }, id = 63 },
    [40] = { 方案 = { [1] = 1, [2] = 0 }, id = 89 },
    [41] = { 方案 = { [1] = 1, [2] = 0 }, id = 66 },
    [42] = { 方案 = { [1] = 4, [2] = 0 }, id = 20113 },
    [43] = { 方案 = { [1] = 1, [2] = 0 }, id = 74 },
    [44] = { 方案 = { [1] = 0, [2] = 1 }, id = 111 },
    [45] = { 方案 = { [1] = 1, [2] = 0 }, id = 2062 },
    [46] = { 方案 = { [1] = 0, [2] = 1 }, id = 112 },
    [47] = { 方案 = { [1] = 1, [2] = 0 }, id = 98 },
    [48] = { 方案 = { [1] = 1, [2] = 1 }, id = 94 },
    [49] = { 方案 = { [1] = 0, [2] = 1 }, id = 110 },
    [50] = { 方案 = { [1] = 0, [2] = 1 }, id = 102 },
    [51] = { 方案 = { [1] = 1, [2] = 0 }, id = 61 },
    [52] = { 方案 = { [1] = 1, [2] = 1 }, id = 59 },
    [53] = { 方案 = { [1] = 1, [2] = 0 }, id = 51 },
    [54] = { 方案 = { [1] = 1, [2] = 0 }, id = 68 },
    [55] = { 方案 = { [1] = 1, [2] = 0 }, id = 78 },
    [56] = { 方案 = { [1] = 1, [2] = 1 }, id = 93 },
    [57] = { 方案 = { [1] = 1, [2] = 0 }, id = 62 },
    [58] = { 方案 = { [1] = 1, [2] = 0 }, id = 103 },
    [59] = { 方案 = { [1] = 1, [2] = 0 }, id = 71 },
    [60] = { 方案 = { [1] = 5, [2] = 0 }, id = 20104 },
    [61] = { 方案 = { [1] = 1, [2] = 1 }, id = 92 },
    [62] = { 方案 = { [1] = 0, [2] = 3 }, id = 20103 },
    [63] = { 方案 = { [1] = 1, [2] = 0 }, id = 65 },
    [64] = { 方案 = { [1] = 1, [2] = 1 }, id = 91 },
    [65] = { 方案 = { [1] = 1, [2] = 0 }, id = 97 },
    [66] = { 方案 = { [1] = 1, [2] = 0 }, id = 96 },
    [67] = { 方案 = { [1] = 1, [2] = 0 }, id = 87 },
    [68] = { 方案 = { [1] = 1, [2] = 0 }, id = 105 },
    [69] = { 方案 = { [1] = 1, [2] = 0 }, id = 99 },
    [70] = { 方案 = { [1] = 1, [2] = 0 }, id = 104 },
    [71] = { 方案 = { [1] = 1, [2] = 1 }, id = 88 },
    [72] = { 方案 = { [1] = 1 }, id = 20306 },
    [73] = { 方案 = { [1] = 1, [2] = 0 }, id = 100 },
    [74] = { 方案 = { [1] = 1, [2] = 1 }, id = 73 },
    [75] = { 方案 = { [1] = 1, [2] = 0 }, id = 79 },
    [76] = { 方案 = { [1] = 1, [2] = 0 }, id = 57 },
    [77] = { 方案 = { [1] = 1 }, id = 2059 },
    [78] = { 方案 = { [1] = 1, [2] = 0 }, id = 84 },
    [79] = { 方案 = { [1] = 1, [2] = 0 }, id = 109 },
    [80] = { 方案 = { [1] = 3, [2] = 0 }, id = 20230 },
}

local SDLF = require('SDL.函数')
local GGF = require('GGE.函数')
local ZY = require('GGE.资源')
function Skill(data, 类型)
    local lineStr = dcsv(data, '\n\r'); -- 划分行数据
    local General = { 类型 } --物品数据
    local titles = GGF.分割文本(lineStr[2], ",");
    local Subclass = 1;
    local arrs = {}
    local total = 1
    arrs[General[total]] = {}
    local fillContent
    local function 目录重复(目录)
        for i = 1, #General do
            if General[i] == 目录 then
                return true
            end
        end
        return false
    end
    for i = 3, #lineStr, 1 do
        local content = GGF.分割文本(lineStr[i], ",");
        if arrs[General[total]][tonumber(content[1]) or content[1]] == nil then
            arrs[General[total]][tonumber(content[1]) or content[1]] = {}
        end
        for j = 2, #titles, 1 do
            if content[j] ~= nil and content[j] ~= "" and not 目录重复(content[j]) then
                arrs[General[total]][tonumber(content[1]) or content[1]][titles[j]] = tonumber(content[j]) or content[j]
            end
        end
        Subclass = Subclass + 1
    end
    return arrs
end

自定义系统 = {}

function 自定义系统处理(名称)
    -- local path = SDLF.取内部存储路径() .. "/assets/xh/" .. 名称 .. ".csv"
    -- local 类型 = {
    --     bpjnxh = "辅助技能",
    --     bpqzxh = "强壮技能",
    --     bpshxh = "生活技能",
    --     bpxlxh = "修炼技能",
    --     mpjnxh = "门派技能",
    --     qzjnxh = "强壮技能",
    --     shjnxh =
    --     "生活技能"
    -- }
    -- if 类型[名称] == nil or 自定义系统[名称] then return end
    -- local 数据 = GGF.读入文件(path)
    -- 数据 = gge.gbktoutf8(数据)
    -- if 数据 then
    --     local 临时数据 = Skill(数据, 类型[名称])
    --     自定义系统[名称] = 临时数据[类型[名称]]
    -- end
end

自定义系统["bpjnxh"]={[76]={消耗帮贡=76,消耗金钱=324198,需要帮贡=380,消耗经验=46759},[66]={消耗帮贡=66,消耗金钱=192729,需要帮贡=330,消耗经验=27798},[96]={消耗帮贡=96,消耗金钱=774901,需要帮贡=480,消耗经验=111765},[86]={消耗帮贡=86,消耗金钱=513347,需要帮贡=430,消耗经验=74040},[141]={消耗帮贡=141,消耗金钱=3326430,需要帮贡=705,消耗经验=479774},[146]={消耗帮贡=146,消耗金钱=3800671,需要帮贡=730,消耗经验=548174},[16]={消耗帮贡=16,消耗金钱=1638,需要帮贡=80,消耗经验=236},[36]={消耗帮贡=36,消耗金钱=22097,需要帮贡=180,消耗经验=3187},[26]={消耗帮贡=26,消耗金钱=7363,需要帮贡=130,消耗经验=1062},[56]={消耗帮贡=56,消耗金钱=105877,需要帮贡=280,消耗经验=15271},[46]={消耗帮贡=46,消耗金钱=52244,需要帮贡=230,消耗经验=7535},[137]={消耗帮贡=137,消耗金钱=2980133,需要帮贡=685,消耗经验=429827},[160]={消耗帮贡=160,消耗金钱=16197373,需要帮贡=800,消耗经验=1868927},[113]={消耗帮贡=113,消耗金钱=1432933,需要帮贡=565,消耗经验=206673},[138]={消耗帮贡=138,消耗金钱=3064048,需要帮贡=690,消耗经验=441930},[87]={消耗帮贡=87,消耗金钱=535986,需要帮贡=435,消耗经验=77306},[97]={消耗帮贡=97,消耗金钱=805656,需要帮贡=485,消耗经验=116200},[67]={消耗帮贡=67,消耗金钱=203666,需要帮贡=335,消耗经验=29375},[77]={消耗帮贡=77,消耗金钱=340288,需要帮贡=385,消耗经验=49080},[131]={消耗帮贡=131,消耗金钱=2512193,需要帮贡=655,消耗经验=362336},[17]={消耗帮贡=17,消耗金钱=1954,需要帮贡=85,消耗经验=281},[136]={消耗帮贡=136,消耗金钱=2897950,需要帮贡=680,消耗经验=417974},[47]={消耗帮贡=47,消耗金钱=56404,需要帮贡=235,消耗经验=8135},[57]={消耗帮贡=57,消耗金钱=112892,需要帮贡=285,消耗经验=16283},[27]={消耗帮贡=27,消耗金钱=8340,需要帮贡=135,消耗经验=1202},[37]={消耗帮贡=37,消耗金钱=24300,需要帮贡=185,消耗经验=3504},[127]={消耗帮贡=127,消耗金钱=2232374,需要帮贡=635,消耗经验=321977},[103]={消耗帮贡=103,消耗金钱=1009782,需要帮贡=515,消耗经验=145642},[153]={消耗帮贡=153,消耗金钱=9094972,需要帮贡=765,消耗经验=1049419},[128]={消耗帮贡=128,消耗金钱=2300022,需要帮贡=640,消耗经验=331734},[124]={消耗帮贡=124,消耗金钱=2038344,需要帮贡=620,消耗经验=293992},[145]={消耗帮贡=145,消耗金钱=3702014,需要帮贡=725,消耗经验=533944},[94]={消耗帮贡=94,消耗金钱=716035,需要帮贡=470,消耗经验=103274},[84]={消耗帮贡=84,消耗金钱=470220,需要帮贡=420,消耗经验=67820},[74]={消耗帮贡=74,消耗金钱=293732,需要帮贡=370,消耗经验=42365},[64]={消耗帮贡=64,消耗金钱=172177,需要帮贡=320,消耗经验=24833},[54]={消耗帮贡=54,消耗金钱=92829,需要帮贡=270,消耗经验=13389},[44]={消耗帮贡=44,消耗金钱=44620,需要帮贡=220,消耗经验=6435},[34]={消耗帮贡=34,消耗金钱=18147,需要帮贡=170,消耗经验=2617},[24]={消耗帮贡=24,消耗金钱=5673,需要帮贡=120,消耗经验=818},[14]={消耗帮贡=14,消耗金钱=1127,需要帮贡=70,消耗经验=162},[157]={消耗帮贡=157,消耗金钱=15062130,需要帮贡=785,消耗经验=1737938},[133]={消耗帮贡=133,消耗金钱=2661559,需要帮贡=665,消耗经验=383879},[152]={消耗帮贡=152,消耗金钱=8869188,需要帮贡=760,消耗经验=1023367},[158]={消耗帮贡=158,消耗金钱=15433694,需要帮贡=790,消耗经验=1780810},[114]={消耗帮贡=114,消耗金钱=1481544,需要帮贡=570,消耗经验=213684},[65]={消耗帮贡=65,消耗金钱=182238,需要帮贡=325,消耗经验=26284},[75]={消耗帮贡=75,消耗金钱=308684,需要帮贡=375,消耗经验=44522},[85]={消耗帮贡=85,消耗金钱=491430,需要帮贡=425,消耗经验=70879},[95]={消耗帮贡=95,消耗金钱=745034,需要帮贡=475,消耗经验=107457},[9]={消耗帮贡=9,消耗金钱=384,需要帮贡=45,消耗经验=55},[8]={消耗帮贡=8,消耗金钱=300,需要帮贡=40,消耗经验=43},[7]={消耗帮贡=7,消耗金钱=233,需要帮贡=35,消耗经验=33},[6]={消耗帮贡=6,消耗金钱=177,需要帮贡=30,消耗经验=25},[5]={消耗帮贡=5,消耗金钱=134,需要帮贡=25,消耗经验=19},[4]={消耗帮贡=4,消耗金钱=98,需要帮贡=20,消耗经验=14},[3]={消耗帮贡=3,消耗金钱=68,需要帮贡=15,消耗经验=9},[2]={消耗帮贡=2,消耗金钱=42,需要帮贡=10,消耗经验=6},[1]={消耗帮贡=1,消耗金钱=21,需要帮贡=5,消耗经验=3},[147]={消耗帮贡=147,消耗金钱=3901286,需要帮贡=735,消耗经验=562686},[123]={消耗帮贡=123,消耗金钱=1976566,需要帮贡=615,消耗经验=285082},[148]={消耗帮贡=148,消耗金钱=4003880,需要帮贡=740,消耗经验=577483},[144]={消耗帮贡=144,消耗金钱=3605285,需要帮贡=720,消耗经验=519993},[101]={消耗帮贡=101,消耗金钱=937888,需要帮贡=505,消耗经验=135272},[92]={消耗帮贡=92,消耗金钱=660578,需要帮贡=460,消耗经验=95276},[62]={消耗帮贡=62,消耗金钱=153310,需要帮贡=310,消耗经验=22112},[52]={消耗帮贡=52,消耗金钱=81021,需要帮贡=260,消耗经验=11686},[82]={消耗帮贡=82,消耗金钱=429861,需要帮贡=410,消耗经验=61999},[72]={消耗帮贡=72,消耗金钱=265457,需要帮贡=360,消耗经验=38287},[22]={消耗帮贡=22,消耗金钱=4295,需要帮贡=110,消耗经验=619},[12]={消耗帮贡=12,消耗金钱=751,需要帮贡=60,消耗经验=108},[42]={消耗帮贡=42,消耗金钱=37857,需要帮贡=210,消耗经验=5460},[32]={消耗帮贡=32,消耗金钱=14751,需要帮贡=160,消耗经验=2127},[106]={消耗帮贡=106,消耗金钱=1125253,需要帮贡=530,消耗经验=162296},[134]={消耗帮贡=134,消耗金钱=2738687,需要帮贡=670,消耗经验=395003},[120]={消耗帮贡=120,消耗金钱=1799616,需要帮贡=600,消耗经验=259560},[93]={消耗帮贡=93,消耗金钱=687889,需要帮贡=465,消耗经验=99215},[73]={消耗帮贡=73,消耗金钱=279328,需要帮贡=365,消耗经验=40288},[83]={消耗帮贡=83,消耗金钱=449701,需要帮贡=415,消耗经验=64861},[53]={消耗帮贡=53,消耗金钱=86775,需要帮贡=265,消耗经验=12516},[115]={消耗帮贡=115,消耗金钱=1531378,需要帮贡=575,消耗经验=220872},[33]={消耗帮贡=33,消耗金钱=16383,需要帮贡=165,消耗经验=2362},[43]={消耗帮贡=43,消耗金钱=41135,需要帮贡=215,消耗经验=5932},[13]={消耗帮贡=13,消耗金钱=924,需要帮贡=65,消耗经验=133},[23]={消耗帮贡=23,消耗金钱=4949,需要帮贡=115,消耗经验=713},[143]={消耗帮贡=143,消耗金钱=3510463,需要帮贡=715,消耗经验=506317},[159]={消耗帮贡=159,消耗金钱=15812082,需要帮贡=795,消耗经验=1824471},[156]={消耗帮贡=156,消耗金钱=14697306,需要帮贡=780,消耗经验=1695843},[155]={消耗帮贡=155,消耗金钱=9559428,需要帮贡=775,消耗经验=1103010},[154]={消耗帮贡=154,消耗金钱=9325035,需要帮贡=770,消耗经验=1075965},[151]={消耗帮贡=151,消耗金钱=8647629,需要帮贡=755,消耗经验=997803},[89]={消耗帮贡=89,消耗金钱=583497,需要帮贡=445,消耗经验=84158},[149]={消耗帮贡=149,消耗金钱=4108484,需要帮贡=745,消耗经验=592570},[142]={消耗帮贡=142,消耗金钱=3417518,需要帮贡=710,消耗经验=492911},[25]={消耗帮贡=25,消耗金钱=6478,需要帮贡=125,消耗经验=934},[139]={消耗帮贡=139,消耗金钱=3149719,需要帮贡=695,消耗经验=454287},[98]={消耗帮贡=98,消耗金钱=837314,需要帮贡=490,消耗经验=120767},[88]={消耗帮贡=88,消耗金钱=559364,需要帮贡=440,消耗经验=80678},[78]={消耗帮贡=78,消耗金钱=356966,需要帮贡=390,消耗经验=51486},[68]={消耗帮贡=68,消耗金钱=215059,需要帮贡=340,消耗经验=31018},[135]={消耗帮贡=135,消耗金钱=2817476,需要帮贡=675,消耗经验=406367},[121]={消耗帮贡=121,消耗金钱=1857222,需要帮贡=605,消耗经验=267869},[105]={消耗帮贡=105,消耗金钱=1085720,需要帮贡=525,消耗经验=156594},[132]={消耗帮贡=132,消耗金钱=2586069,需要帮贡=660,消耗经验=372991},[18]={消耗帮贡=18,消耗金钱=2314,需要帮贡=90,消耗经验=333},[130]={消耗帮贡=130,消耗金钱=2439908,需要帮贡=650,消耗经验=351910},[126]={消耗帮贡=126,消耗金钱=2166226,需要帮贡=630,消耗经验=312437},[129]={消耗帮贡=129,消耗金钱=2369193,需要帮贡=645,消耗经验=341711},[122]={消耗帮贡=122,消耗金钱=1916199,需要帮贡=610,消耗经验=276375},[48]={消耗帮贡=48,消耗金钱=60805,需要帮贡=240,消耗经验=8770},[38]={消耗帮贡=38,消耗金钱=26660,需要帮贡=190,消耗经验=3845},[28]={消耗帮贡=28,消耗金钱=9409,需要帮贡=140,消耗经验=1357},[15]={消耗帮贡=15,消耗金钱=1364,需要帮贡=75,消耗经验=196},[110]={消耗帮贡=110,消耗金钱=1294244,需要帮贡=550,消耗经验=186670},[35]={消耗帮贡=35,消耗金钱=20050,需要帮贡=175,消耗经验=2891},[102]={消耗帮贡=102,消耗金钱=973339,需要帮贡=510,消耗经验=140385},[30]={消耗帮贡=30,消耗金钱=11856,需要帮贡=150,消耗经验=1710},[117]={消耗帮贡=117,消耗金钱=1632935,需要帮贡=585,消耗经验=235788},[10]={消耗帮贡=10,消耗金钱=484,需要帮贡=50,消耗经验=69},[140]={消耗帮贡=140,消耗金钱=3237172,需要帮贡=700,消耗经验=466900},[70]={消耗帮贡=70,消耗金钱=239268,需要帮贡=350,消耗经验=34510},[60]={消耗帮贡=60,消耗金钱=136032,需要帮贡=300,消耗经验=19620},[50]={消耗帮贡=50,消耗金钱=70372,需要帮贡=250,消耗经验=10149},[40]={消耗帮贡=40,消耗金钱=31892,需要帮贡=200,消耗经验=4599},[118]={消耗帮贡=118,消耗金钱=1688423,需要帮贡=590,消耗经验=243523},[39]={消耗帮贡=39,消耗金钱=29188,需要帮贡=195,消耗经验=4209},[90]={消耗帮贡=90,消耗金钱=608400,需要帮贡=450,消耗经验=87750},[80]={消耗帮贡=80,消耗金钱=392148,需要帮贡=400,消耗经验=56560},[91]={消耗帮贡=91,消耗金钱=634088,需要帮贡=455,消耗经验=91455},[49]={消耗帮贡=49,消耗金钱=65458,需要帮贡=245,消耗经验=9441},[59]={消耗帮贡=59,消耗金钱=127959,需要帮贡=295,消耗经验=18456},[69]={消耗帮贡=69,消耗金钱=226923,需要帮贡=345,消耗经验=32729},[111]={消耗帮贡=111,消耗金钱=1339304,需要帮贡=555,消耗经验=193169},[61]={消耗帮贡=61,消耗金钱=144477,需要帮贡=305,消耗经验=20838},[19]={消耗帮贡=19,消耗金钱=2725,需要帮贡=95,消耗经验=393},[119]={消耗帮贡=119,消耗金钱=1743356,需要帮贡=595,消耗经验=251446},[11]={消耗帮贡=11,消耗金钱=606,需要帮贡=55,消耗经验=87},[21]={消耗帮贡=21,消耗金钱=3710,需要帮贡=105,消耗经验=535},[31]={消耗帮贡=31,消耗金钱=13244,需要帮贡=155,消耗经验=1910},[41]={消耗帮贡=41,消耗金钱=34779,需要帮贡=205,消耗经验=5016},[79]={消耗帮贡=79,消耗金钱=374249,需要帮贡=395,消耗经验=53978},[112]={消耗帮贡=112,消耗金钱=1384747,需要帮贡=560,消耗经验=199836},[116]={消耗帮贡=116,消耗金钱=1582455,需要帮贡=580,消耗经验=228239},[71]={消耗帮贡=71,消耗金钱=252109,需要帮贡=355,消耗经验=36362},[55]={消耗帮贡=55,消耗金钱=99194,需要帮贡=275,消耗经验=14307},[45]={消耗帮贡=45,消耗金钱=48320,需要帮贡=225,消耗经验=6969},[29]={消耗帮贡=29,消耗金钱=10579,需要帮贡=145,消耗经验=1525},[51]={消耗帮贡=51,消耗金钱=75556,需要帮贡=255,消耗经验=10897},[107]={消耗帮贡=107,消耗金钱=1165852,需要帮贡=535,消耗经验=168152},[81]={消耗帮贡=81,消耗金钱=410680,需要帮贡=405,消耗经验=59233},[150]={消耗帮贡=150,消耗金钱=4215120,需要帮贡=750,消耗经验=607950},[20]={消耗帮贡=20,消耗金钱=3188,需要帮贡=100,消耗经验=459},[58]={消耗帮贡=58,消耗金钱=120250,需要帮贡=290,消耗经验=17344},[99]={消耗帮贡=99,消耗金钱=869894,需要帮贡=495,消耗经验=125466},[100]={消耗帮贡=100,消耗金钱=903412,需要帮贡=500,消耗经验=130300},[104]={消耗帮贡=104,消耗金钱=1047236,需要帮贡=520,消耗经验=151044},[109]={消耗帮贡=109,消耗金钱=1250330,需要帮贡=545,消耗经验=180336},[108]={消耗帮贡=108,消耗金钱=1207539,需要帮贡=540,消耗经验=174164},[63]={消耗帮贡=63,消耗金钱=162540,需要帮贡=315,消耗经验=23443},[125]={消耗帮贡=125,消耗金钱=2101558,需要帮贡=625,消耗经验=303109}}
自定义系统["bpxlxh"]={[12]={消耗经验=216},[11]={消耗经验=174},[14]={消耗经验=314},[13]={消耗经验=266},[25]={消耗经验=918},[9]={消耗经验=110},[7]={消耗经验=66},[8]={消耗经验=86},[5]={消耗经验=38},[6]={消耗经验=50},[3]={消耗经验=18},[4]={消耗经验=28},[1]={消耗经验=6},[2]={消耗经验=12},[24]={消耗经验=854},[23]={消耗经验=806},[22]={消耗经验=748},[21]={消耗经验=684},[17]={消耗经验=488},[19]={消耗经验=574},[18]={消耗经验=526},[20]={消耗经验=651},[16]={消耗经验=432},[15]={消耗经验=398},[10]={消耗经验=138}}



function 生活技能消耗(目标技能等级,技能)
	local 等级 = 目标技能等级
	local 技能消耗 = {}
	if 技能=="强壮" or 技能=="神速" then
		技能消耗[1]={经验=1720000,金钱=430000}
		技能消耗[2]={经验=1980000,金钱=495000}
		技能消耗[3]={经验=2280000,金钱=570000}
		技能消耗[4]={经验=2620000,金钱=655000}
		技能消耗[5]={经验=3000000,金钱=750000}
		技能消耗[6]={经验=3420000,金钱=855000}
		技能消耗[7]={经验=3880000,金钱=970000}
		技能消耗[8]={经验=4380000,金钱=1095000}
		技能消耗[9]={经验=4920000,金钱=1230000}
		技能消耗[10]={经验=5500000,金钱=1375000}
		技能消耗[11]={经验=6120000,金钱=1530000}
		技能消耗[12]={经验=6780000,金钱=1695000}
		技能消耗[13]={经验=7480000,金钱=1870000}
		技能消耗[14]={经验=8220000,金钱=2055000}
		技能消耗[15]={经验=9000000,金钱=2250000}
		技能消耗[16]={经验=9820000,金钱=2455000}
		技能消耗[17]={经验=10680000,金钱=2670000}
		技能消耗[18]={经验=11580000,金钱=2895000}
		技能消耗[19]={经验=12520000,金钱=3130000}
		技能消耗[20]={经验=13500000,金钱=3375000}
		技能消耗[21]={经验=14520000,金钱=3630000}
		技能消耗[22]={经验=15580000,金钱=3895000}
		技能消耗[23]={经验=16680000,金钱=4170000}
		技能消耗[24]={经验=17820000,金钱=4455000}
		技能消耗[25]={经验=19000000,金钱=4750000}
		技能消耗[26]={经验=20220000,金钱=5055000}
		技能消耗[27]={经验=21480000,金钱=5370000}
		技能消耗[28]={经验=22780000,金钱=5695000}
		技能消耗[29]={经验=25500000,金钱=6375000}
		技能消耗[30]={经验=26920000,金钱=6730000}
		技能消耗[31]={经验=26920000,金钱=6730000}
		技能消耗[32]={经验=28380000,金钱=7095000}
		技能消耗[33]={经验=29880000,金钱=7470000}
		技能消耗[34]={经验=31420000,金钱=7855000}
		技能消耗[35]={经验=33000000,金钱=8250000}
		技能消耗[36]={经验=34620000,金钱=8655000}
		技能消耗[37]={经验=36280000,金钱=9070000}
		技能消耗[38]={经验=37980000,金钱=9495000}
		技能消耗[39]={经验=39720000,金钱=9930000}
		技能消耗[40]={经验=41500000,金钱=10375000}
		技能消耗[41]={经验=43500000,金钱=12375000}
		技能消耗[目标技能等级].帮贡=目标技能等级
		技能消耗[目标技能等级].需求=目标技能等级 * 5
		return 技能消耗[目标技能等级]
	end
	技能消耗[1] = {经验 = 16, 金钱 = 3, 需求 = 6, 帮贡 = 1}
	技能消耗[2] = {经验 = 32, 金钱 = 6, 需求 = 12, 帮贡 = 2}
	技能消耗[3] = {经验 = 52, 金钱 = 9, 需求 = 18, 帮贡 = 3}
	技能消耗[4] = {经验 = 75, 金钱 = 14, 需求 =24, 帮贡 = 4}
	技能消耗[5] = {经验 = 103, 金钱 = 19, 需求 = 30, 帮贡 = 5}
	技能消耗[6] = {经验 = 136, 金钱 = 25, 需求 = 36, 帮贡 = 6}
	技能消耗[7] = {经验 = 179, 金钱 = 33, 需求 = 42, 帮贡 = 7}
	技能消耗[8] = {经验 = 231, 金钱 = 43, 需求 = 48, 帮贡 = 8}
	技能消耗[9] = {经验 = 295, 金钱 = 55, 需求 = 54, 帮贡 = 9}
	技能消耗[10] = {经验 = 372, 金钱 = 69, 需求 = 60, 帮贡 = 10}
	技能消耗[11] = {经验 = 466, 金钱 = 87, 需求 = 66, 帮贡 = 11}
	技能消耗[12] = {经验 = 578, 金钱 = 108, 需求 = 72, 帮贡 = 12}
	技能消耗[13] = {经验 = 711, 金钱 = 133, 需求 = 78, 帮贡 = 13}
	技能消耗[14] = {经验 = 867, 金钱 = 162, 需求 = 84, 帮贡 = 14}
	技能消耗[15] = {经验 = 1049, 金钱 = 196, 需求 = 90, 帮贡 = 15}
	技能消耗[16] = {经验 = 1260, 金钱 = 236, 需求 = 96, 帮贡 = 16}
	技能消耗[17] = {经验 = 1503, 金钱 = 281, 需求 = 102, 帮贡 = 17}
	技能消耗[18] = {经验 = 1780, 金钱 = 333, 需求 = 108, 帮贡 = 18}
	技能消耗[19] = {经验 = 2096, 金钱 = 393, 需求 = 114, 帮贡 = 19}
	技能消耗[20] = {经验 = 2452, 金钱 = 459, 需求 = 120, 帮贡 = 20}
	技能消耗[21] = {经验 = 2854, 金钱 = 535, 需求 = 126, 帮贡 = 21}
	技能消耗[22] = {经验 = 3304, 金钱 = 619, 需求 = 132, 帮贡 = 22}
	技能消耗[23] = {经验 = 3807, 金钱 = 713, 需求 = 138, 帮贡 = 23}
	技能消耗[24] = {经验 = 4364, 金钱 = 818, 需求 = 144, 帮贡 = 24}
	技能消耗[25] = {经验 = 4983, 金钱 = 934, 需求 = 150, 帮贡 = 25}
	技能消耗[26] = {经验 = 5664, 金钱 = 1062, 需求 = 156, 帮贡 = 26}
	技能消耗[27] = {经验 = 6415, 金钱 = 1202, 需求 = 162, 帮贡 = 27}
	技能消耗[28] = {经验 = 7238, 金钱 = 1357, 需求 = 168, 帮贡 = 28}
	技能消耗[29] = {经验 = 8138, 金钱 = 1525, 需求 = 174, 帮贡 = 29}
	技能消耗[30] = {经验 = 9120, 金钱 = 1710, 需求 = 180, 帮贡 = 30}
	技能消耗[31] = {经验 = 10188, 金钱 = 1910, 需求 = 186, 帮贡 = 31}
	技能消耗[32] = {经验 = 11347, 金钱 = 2127, 需求 = 192, 帮贡 = 32}
	技能消耗[33] = {经验 = 12602, 金钱 = 2362, 需求 = 198, 帮贡 = 33}
	技能消耗[34] = {经验 = 13959, 金钱 = 2617, 需求 = 204, 帮贡 = 34}
	技能消耗[35] = {经验 = 15423, 金钱 = 2891, 需求 = 210, 帮贡 = 35}
	技能消耗[36] = {经验 = 16998, 金钱 = 3187, 需求 = 216, 帮贡 = 36}
	技能消耗[37] = {经验 = 18692, 金钱 = 3504, 需求 = 222, 帮贡 = 37}
	技能消耗[38] = {经验 = 20508, 金钱 = 3845, 需求 = 228, 帮贡 = 38}
	技能消耗[39] = {经验 = 22452, 金钱 = 4209, 需求 = 234, 帮贡 = 39}
	技能消耗[40] = {经验 = 24532, 金钱 = 4599, 需求 = 240, 帮贡 = 40}
	技能消耗[41] = {经验 = 26753, 金钱 = 5106, 需求 = 246, 帮贡 = 41}
	技能消耗[42] = {经验 = 29121, 金钱 = 5460, 需求 = 252, 帮贡 = 42}
	技能消耗[43] = {经验 = 31642, 金钱 = 5932, 需求 = 258, 帮贡 = 43}
	技能消耗[44] = {经验 = 34323, 金钱 = 6435, 需求 = 264, 帮贡 = 44}
	技能消耗[45] = {经验 = 37169, 金钱 = 6969, 需求 = 270, 帮贡 = 45}
	技能消耗[46] = {经验 = 40188, 金钱 = 7535, 需求 = 276, 帮贡 = 46}
	技能消耗[47] = {经验 = 43388, 金钱 = 8135, 需求 = 282, 帮贡 = 47}
	技能消耗[48] = {经验 = 46773, 金钱 = 8770, 需求 = 288, 帮贡 = 48}
	技能消耗[49] = {经验 = 50352, 金钱 = 9441, 需求 = 294, 帮贡 = 49}
	技能消耗[50] = {经验 = 54132, 金钱 = 10149, 需求 = 300, 帮贡 = 50}
	技能消耗[51] = {经验 = 58120, 金钱 = 10897, 需求 = 306, 帮贡 = 51}
	技能消耗[52] = {经验 = 62324, 金钱 = 11685, 需求 = 312, 帮贡 = 52}
	技能消耗[53] = {经验 = 66750, 金钱 = 12515, 需求 = 318, 帮贡 = 53}
	技能消耗[54] = {经验 = 71407, 金钱 = 13388, 需求 = 324, 帮贡 = 54}
	技能消耗[55] = {经验 = 76303, 金钱 = 14306, 需求 = 330, 帮贡 = 55}
	技能消耗[56] = {经验 = 81444, 金钱 = 15270, 需求 = 336, 帮贡 = 56}
	技能消耗[57] = {经验 = 86840, 金钱 = 16282, 需求 = 342, 帮贡 = 57}
	技能消耗[58] = {经验 = 92500, 金钱 = 17343, 需求 = 348, 帮贡 = 58}
	技能消耗[59] = {经验 = 98430, 金钱 = 18455, 需求 = 354, 帮贡 = 59}
	技能消耗[60] = {经验 = 104640, 金钱 = 19620, 需求 = 360, 帮贡 = 60}
	技能消耗[61] = {经验 = 111136, 金钱 = 20838, 需求 = 366, 帮贡 = 61}
	技能消耗[62] = {经验 = 117931, 金钱 = 22112, 需求 = 372, 帮贡 = 62}
	技能消耗[63] = {经验 = 125031, 金钱 = 23443, 需求 = 378, 帮贡 = 63}
	技能消耗[64] = {经验 = 132444, 金钱 = 24833, 需求 = 384, 帮贡 = 64}
	技能消耗[65] = {经验 = 140183, 金钱 = 26284, 需求 = 390, 帮贡 = 65}
	技能消耗[66] = {经验 = 148253, 金钱 = 27797, 需求 = 396, 帮贡 = 66}
	技能消耗[67] = {经验 = 156666, 金钱 = 29374, 需求 = 402, 帮贡 = 67}
	技能消耗[68] = {经验 = 165430, 金钱 = 31018, 需求 = 408, 帮贡 = 68}
	技能消耗[69] = {经验 = 174556, 金钱 = 32729, 需求 = 414, 帮贡 = 69}
	技能消耗[70] = {经验 = 184052, 金钱 = 34509, 需求 = 420, 帮贡 = 70}
	技能消耗[71] = {经验 = 193930, 金钱 = 36361, 需求 = 426, 帮贡 = 71}
	技能消耗[72] = {经验 = 204198, 金钱 = 38287, 需求 = 432, 帮贡 = 72}
	技能消耗[73] = {经验 = 214868, 金钱 = 40287, 需求 = 438, 帮贡 = 73}
	技能消耗[74] = {经验 = 225948, 金钱 = 42365, 需求 = 444, 帮贡 = 74}
	技能消耗[75] = {经验 = 237449, 金钱 = 44521, 需求 = 450, 帮贡 = 75}
	技能消耗[76] = {经验 = 249383, 金钱 = 46759, 需求 = 456, 帮贡 = 76}
	技能消耗[77] = {经验 = 261760, 金钱 = 39080, 需求 = 462, 帮贡 = 77}
	技能消耗[78] = {经验 = 274589, 金钱 = 51485, 需求 = 468, 帮贡 = 78}
	技能消耗[79] = {经验 = 287884, 金钱 = 53978, 需求 = 474, 帮贡 = 79}
	技能消耗[80] = {经验 = 301652, 金钱 = 56559, 需求 = 480, 帮贡 = 80}
	技能消耗[81] = {经验 = 315908, 金钱 = 59232, 需求 = 486, 帮贡 = 81}
	技能消耗[82] = {经验 = 330662, 金钱 = 61999, 需求 = 492, 帮贡 = 82}
	技能消耗[83] = {经验 = 345924, 金钱 = 64860, 需求 = 498, 帮贡 = 83}
	技能消耗[84] = {经验 = 361708, 金钱 = 67820, 需求 = 504, 帮贡 = 84}
	技能消耗[85] = {经验 = 378023, 金钱 = 70879, 需求 = 510, 帮贡 = 85}
	技能消耗[86] = {经验 = 394882, 金钱 = 73030, 需求 = 516, 帮贡 = 86}
	技能消耗[87] = {经验 = 412297, 金钱 = 77305, 需求 = 522, 帮贡 = 87}
	技能消耗[88] = {经验 = 430280, 金钱 = 80677, 需求 = 528, 帮贡 = 88}
	技能消耗[89] = {经验 = 448844, 金钱 = 84158, 需求 = 534, 帮贡 = 89}
	技能消耗[90] = {经验 = 468000, 金钱 = 87750, 需求 = 540, 帮贡 = 90}
	技能消耗[91] = {经验 = 487760, 金钱 = 91455, 需求 = 546, 帮贡 = 91}
	技能消耗[92] = {经验 = 508137, 金钱 = 95275, 需求 = 552, 帮贡 = 92}
	技能消耗[93] = {经验 = 529145, 金钱 = 99214, 需求 = 558, 帮贡 = 93}
	技能消耗[94] = {经验 = 550796, 金钱 = 103274, 需求 = 564, 帮贡 = 94}
	技能消耗[95] = {经验 = 573103, 金钱 = 107456, 需求 = 570, 帮贡 = 95}
	技能消耗[96] = {经验 = 596078, 金钱 = 111764, 需求 = 576, 帮贡 = 96}
	技能消耗[97] = {经验 = 619735, 金钱 = 116200, 需求 = 582, 帮贡 = 97}
	技能消耗[98] = {经验 = 644088, 金钱 = 120766, 需求 = 588, 帮贡 = 98}
	技能消耗[99] = {经验 = 669149, 金钱 = 125465, 需求 = 594, 帮贡 = 99}
	技能消耗[100] = {经验 = 694932, 金钱 = 130299, 需求 = 600, 帮贡 = 100}
	技能消耗[101] = {经验 = 721452, 金钱 = 135272, 需求 = 606, 帮贡 = 101}
	技能消耗[102] = {经验 = 748722, 金钱 = 140385, 需求 = 612, 帮贡 = 102}
	技能消耗[103] = {经验 = 776755, 金钱 = 145641, 需求 = 618, 帮贡 = 103}
	技能消耗[104] = {经验 = 805566, 金钱 = 151043, 需求 = 624, 帮贡 = 104}
	技能消耗[105] = {经验 = 835169, 金钱 = 156594, 需求 = 630, 帮贡 = 105}
	技能消耗[106] = {经验 = 865579, 金钱 = 162296, 需求 = 636, 帮贡 = 106}
	技能消耗[107] = {经验 = 896809, 金钱 = 168151, 需求 = 642, 帮贡 = 107}
	技能消耗[108] = {经验 = 928876, 金钱 = 174164, 需求 = 648, 帮贡 = 108}
	技能消耗[109] = {经验 = 961792, 金钱 = 180336, 需求 = 654, 帮贡 = 109}
	技能消耗[110] = {经验 = 995572, 金钱 = 186669, 需求 = 660, 帮贡 = 110}
	技能消耗[111] = {经验 = 1030234, 金钱 = 193168, 需求 = 666, 帮贡 = 111}
	技能消耗[112] = {经验 = 1065190, 金钱 = 199835, 需求 = 672, 帮贡 = 112}
	技能消耗[113] = {经验 = 1102256, 金钱 = 206673, 需求 = 678, 帮贡 = 113}
	技能消耗[114] = {经验 = 1139649, 金钱 = 213684, 需求 = 684, 帮贡 = 114}
	技能消耗[115] = {经验 = 1177983, 金钱 = 220871, 需求 = 690, 帮贡 = 115}
	技能消耗[116] = {经验 = 1217273, 金钱 = 228238, 需求 = 696, 帮贡 = 116}
	技能消耗[117] = {经验 = 1256104, 金钱 = 235788, 需求 = 702, 帮贡 = 117}
	技能消耗[118] = {经验 = 1298787, 金钱 = 243522, 需求 = 709, 帮贡 = 118}
	技能消耗[119] = {经验 = 1341043, 金钱 = 251445, 需求 = 714, 帮贡 = 119}
	技能消耗[120] = {经验 = 1384320, 金钱 = 259560, 需求 = 720, 帮贡 = 120}
	技能消耗[121] = {经验 = 1428632, 金钱 = 267868, 需求 = 726, 帮贡 = 121}
	技能消耗[122] = {经验 = 1473999, 金钱 = 276374, 需求 = 732, 帮贡 = 122}
	技能消耗[123] = {经验 = 1520435, 金钱 = 285081, 需求 = 738, 帮贡 = 123}
	技能消耗[124] = {经验 = 1567957, 金钱 = 293992, 需求 = 744, 帮贡 = 124}
	技能消耗[125] = {经验 = 1616583, 金钱 = 303109, 需求 = 750, 帮贡 = 125}
	技能消耗[126] = {经验 = 1666328, 金钱 = 312436, 需求 = 756, 帮贡 = 126}
	技能消耗[127] = {经验 = 1717211, 金钱 = 321977, 需求 = 762, 帮贡 = 127}
	技能消耗[128] = {经验 = 1769248, 金钱 = 331734, 需求 = 768, 帮贡 = 128}
	技能消耗[129] = {经验 = 1822456, 金钱 = 341710, 需求 = 774, 帮贡 = 129}
	技能消耗[130] = {经验 = 1876852, 金钱 = 351909, 需求 = 780, 帮贡 = 130}
	技能消耗[131] = {经验 = 1932456, 金钱 = 363335, 需求 = 786, 帮贡 = 131}
	技能消耗[132] = {经验 = 1989284, 金钱 = 372990, 需求 = 792, 帮贡 = 132}
	技能消耗[133] = {经验 = 2047353, 金钱 = 383878, 需求 = 798, 帮贡 = 133}
	技能消耗[134] = {经验 = 2106682, 金钱 = 395002, 需求 = 804, 帮贡 = 134}
	技能消耗[135] = {经验 = 2167289, 金钱 = 406366, 需求 = 810, 帮贡 = 135}
	技能消耗[136] = {经验 = 2229192, 金钱 = 417973, 需求 = 816, 帮贡 = 136}
	技能消耗[137] = {经验 = 2292410, 金钱 = 429826, 需求 = 822, 帮贡 = 137}
	技能消耗[138] = {经验 = 2356960, 金钱 = 441930, 需求 = 828, 帮贡 = 138}
	技能消耗[139] = {经验 = 2422861, 金钱 = 454286, 需求 = 834, 帮贡 = 139}
	技能消耗[140] = {经验 = 2490132, 金钱 = 466899, 需求 = 840, 帮贡 = 140}
	技能消耗[141] = {经验 = 2558792, 金钱 = 479773, 需求 = 846, 帮贡 = 141}
	技能消耗[142] = {经验 = 2628860, 金钱 = 492911, 需求 = 852, 帮贡 = 142}
	技能消耗[143] = {经验 = 2700356, 金钱 = 506316, 需求 = 858, 帮贡 = 143}
	技能消耗[144] = {经验 = 2773296, 金钱 = 519993, 需求 = 864, 帮贡 = 144}
	技能消耗[145] = {经验 = 2847703, 金钱 = 533944, 需求 = 870, 帮贡 = 145}
	技能消耗[146] = {经验 = 2923593, 金钱 = 548173, 需求 = 876, 帮贡 = 146}
	技能消耗[147] = {经验 = 3000989, 金钱 = 562685, 需求 = 882, 帮贡 = 147}
	技能消耗[148] = {经验 = 3079908, 金钱 = 577482, 需求 = 888, 帮贡 = 148}
	技能消耗[149] = {经验 = 3160372, 金钱 = 592569, 需求 = 894, 帮贡 = 149}
	技能消耗[150] = {经验 = 3242400, 金钱 = 607950, 需求 = 900, 帮贡 = 150}
	技能消耗[151] = {经验 = 5022276, 金钱 = 623627, 需求 = 906, 帮贡 = 151}
	技能消耗[152] = {经验 = 5185064, 金钱 = 639604, 需求 = 912, 帮贡 = 152}
	技能消耗[153] = {经验 = 5352040, 金钱 = 655887, 需求 = 918, 帮贡 = 153}
	技能消耗[154] = {经验 = 5523289, 金钱 = 672478, 需求 = 924, 帮贡 = 154}
	技能消耗[155] = {经验 = 5698889, 金钱 = 689381, 需求 = 930, 帮贡 = 155}
	技能消耗[156] = {经验 = 5878922, 金钱 = 706601, 需求 = 936, 帮贡 = 156}
	技能消耗[157] = {经验 = 6063472, 金钱 = 724140, 需求 = 942, 帮贡 = 157}
	技能消耗[158] = {经验 = 6252524, 金钱 = 742004, 需求 = 948, 帮贡 = 156}
	技能消耗[159] = {经验 = 6446464, 金钱 = 760195, 需求 = 954, 帮贡 = 159}
	技能消耗[160] = {经验 = 6645076, 金钱 = 778719, 需求 = 960, 帮贡 = 160}
	技能消耗[161] = {经验 = 12459518, 金钱 = 839604, 需求 = 966, 帮贡 = 161}
	return 技能消耗[目标技能等级]
end



自定义系统["mpjnxh"] = {}
自定义系统["mpjnxh"][1]={消耗经验=16,消耗金钱=6}
自定义系统["mpjnxh"][2]={消耗经验=32,消耗金钱=12}
自定义系统["mpjnxh"][3]={消耗经验=52,消耗金钱=19}
自定义系统["mpjnxh"][4]={消耗经验=75,消耗金钱=28}
自定义系统["mpjnxh"][5]={消耗经验=103,消耗金钱=38}
自定义系统["mpjnxh"][6]={消耗经验=136,消耗金钱=51}
自定义系统["mpjnxh"][7]={消耗经验=179,消耗金钱=67}
自定义系统["mpjnxh"][8]={消耗经验=231,消耗金钱=86}
自定义系统["mpjnxh"][9]={消耗经验=295,消耗金钱=110}
自定义系统["mpjnxh"][10]={消耗经验=372,消耗金钱=139}
自定义系统["mpjnxh"][11]={消耗经验=466,消耗金钱=174}
自定义系统["mpjnxh"][12]={消耗经验=578,消耗金钱=216}
自定义系统["mpjnxh"][13]={消耗经验=711,消耗金钱=266}
自定义系统["mpjnxh"][14]={消耗经验=867,消耗金钱=325}
自定义系统["mpjnxh"][15]={消耗经验=1049,消耗金钱=393}
自定义系统["mpjnxh"][16]={消耗经验=1260,消耗金钱=472}
自定义系统["mpjnxh"][17]={消耗经验=1503,消耗金钱=563}
自定义系统["mpjnxh"][18]={消耗经验=1780,消耗金钱=667}
自定义系统["mpjnxh"][19]={消耗经验=2096,消耗金钱=786}
自定义系统["mpjnxh"][20]={消耗经验=2452,消耗金钱=919}
自定义系统["mpjnxh"][21]={消耗经验=2854,消耗金钱=1070}
自定义系统["mpjnxh"][22]={消耗经验=3304,消耗金钱=1238}
自定义系统["mpjnxh"][23]={消耗经验=3807,消耗金钱=1426}
自定义系统["mpjnxh"][24]={消耗经验=4364,消耗金钱=1636}
自定义系统["mpjnxh"][25]={消耗经验=4983,消耗金钱=1868}
自定义系统["mpjnxh"][26]={消耗经验=5664,消耗金钱=2124}
自定义系统["mpjnxh"][27]={消耗经验=6415,消耗金钱=2404}
自定义系统["mpjnxh"][28]={消耗经验=7238,消耗金钱=2714}
自定义系统["mpjnxh"][29]={消耗经验=8138,消耗金钱=3050}
自定义系统["mpjnxh"][30]={消耗经验=9120,消耗金钱=3420}
自定义系统["mpjnxh"][31]={消耗经验=10188,消耗金钱=3820}
自定义系统["mpjnxh"][32]={消耗经验=11347,消耗金钱=4255}
自定义系统["mpjnxh"][33]={消耗经验=12602,消耗金钱=4725}
自定义系统["mpjnxh"][34]={消耗经验=13959,消耗金钱=5234}
自定义系统["mpjnxh"][35]={消耗经验=15423,消耗金钱=5783}
自定义系统["mpjnxh"][36]={消耗经验=16998,消耗金钱=6374}
自定义系统["mpjnxh"][37]={消耗经验=18692,消耗金钱=7009}
自定义系统["mpjnxh"][38]={消耗经验=20508,消耗金钱=7690}
自定义系统["mpjnxh"][39]={消耗经验=22452,消耗金钱=8419}
自定义系统["mpjnxh"][40]={消耗经验=24532,消耗金钱=9199}
自定义系统["mpjnxh"][41]={消耗经验=26753,消耗金钱=10032}
自定义系统["mpjnxh"][42]={消耗经验=29121,消耗金钱=10920}
自定义系统["mpjnxh"][43]={消耗经验=31642,消耗金钱=11865}
自定义系统["mpjnxh"][44]={消耗经验=34323,消耗金钱=12871}
自定义系统["mpjnxh"][45]={消耗经验=37169,消耗金钱=13938}
自定义系统["mpjnxh"][46]={消耗经验=40188,消耗金钱=15070}
自定义系统["mpjnxh"][47]={消耗经验=43388,消耗金钱=16270}
自定义系统["mpjnxh"][48]={消耗经验=46773,消耗金钱=17540}
自定义系统["mpjnxh"][49]={消耗经验=50352,消耗金钱=18882}
自定义系统["mpjnxh"][50]={消耗经验=54132,消耗金钱=20299}
自定义系统["mpjnxh"][51]={消耗经验=58120,消耗金钱=21795}
自定义系统["mpjnxh"][52]={消耗经验=62324,消耗金钱=23371}
自定义系统["mpjnxh"][53]={消耗经验=66750,消耗金钱=25031}
自定义系统["mpjnxh"][54]={消耗经验=71407,消耗金钱=26777}
自定义系统["mpjnxh"][55]={消耗经验=76303,消耗金钱=28613}
自定义系统["mpjnxh"][56]={消耗经验=81444,消耗金钱=30541}
自定义系统["mpjnxh"][57]={消耗经验=86840,消耗金钱=32565}
自定义系统["mpjnxh"][58]={消耗经验=92500,消耗金钱=34687}
自定义系统["mpjnxh"][59]={消耗经验=98430,消耗金钱=36911}
自定义系统["mpjnxh"][60]={消耗经验=104640,消耗金钱=39240}
自定义系统["mpjnxh"][61]={消耗经验=111136,消耗金钱=41676}
自定义系统["mpjnxh"][62]={消耗经验=117931,消耗金钱=44224}
自定义系统["mpjnxh"][63]={消耗经验=125031,消耗金钱=46886}
自定义系统["mpjnxh"][64]={消耗经验=132444,消耗金钱=49666}
自定义系统["mpjnxh"][65]={消耗经验=140183,消耗金钱=52568}
自定义系统["mpjnxh"][66]={消耗经验=148253,消耗金钱=55595}
自定义系统["mpjnxh"][67]={消耗经验=156666,消耗金钱=58749}
自定义系统["mpjnxh"][68]={消耗经验=165430,消耗金钱=62036}
自定义系统["mpjnxh"][69]={消耗经验=174556,消耗金钱=65458}
自定义系统["mpjnxh"][70]={消耗经验=184052,消耗金钱=69019}
自定义系统["mpjnxh"][71]={消耗经验=193930,消耗金钱=72723}
自定义系统["mpjnxh"][72]={消耗经验=204198,消耗金钱=76574}
自定义系统["mpjnxh"][73]={消耗经验=214868,消耗金钱=80575}
自定义系统["mpjnxh"][74]={消耗经验=225948,消耗金钱=84730}
自定义系统["mpjnxh"][75]={消耗经验=237449,消耗金钱=89043}
自定义系统["mpjnxh"][76]={消耗经验=249383,消耗金钱=93518}
自定义系统["mpjnxh"][77]={消耗经验=261760,消耗金钱=98160}
自定义系统["mpjnxh"][78]={消耗经验=274589,消耗金钱=102971}
自定义系统["mpjnxh"][79]={消耗经验=287884,消耗金钱=107956}
自定义系统["mpjnxh"][80]={消耗经验=301652,消耗金钱=113119}
自定义系统["mpjnxh"][81]={消耗经验=315908,消耗金钱=118465}
自定义系统["mpjnxh"][82]={消耗经验=330662,消耗金钱=123998}
自定义系统["mpjnxh"][83]={消耗经验=345924,消耗金钱=129721}
自定义系统["mpjnxh"][84]={消耗经验=361708,消耗金钱=135640}
自定义系统["mpjnxh"][85]={消耗经验=378023,消耗金钱=141758}
自定义系统["mpjnxh"][86]={消耗经验=394882,消耗金钱=148080}
自定义系统["mpjnxh"][87]={消耗经验=412297,消耗金钱=154611}
自定义系统["mpjnxh"][88]={消耗经验=430280,消耗金钱=161355}
自定义系统["mpjnxh"][89]={消耗经验=448844,消耗金钱=168316}
自定义系统["mpjnxh"][90]={消耗经验=468000,消耗金钱=175500}
自定义系统["mpjnxh"][91]={消耗经验=487760,消耗金钱=182910}
自定义系统["mpjnxh"][92]={消耗经验=508137,消耗金钱=190551}
自定义系统["mpjnxh"][93]={消耗经验=529145,消耗金钱=198429}
自定义系统["mpjnxh"][94]={消耗经验=550796,消耗金钱=206548}
自定义系统["mpjnxh"][95]={消耗经验=573103,消耗金钱=214913}
自定义系统["mpjnxh"][96]={消耗经验=596078,消耗金钱=223529}
自定义系统["mpjnxh"][97]={消耗经验=619735,消耗金钱=232400}
自定义系统["mpjnxh"][98]={消耗经验=644088,消耗金钱=241533}
自定义系统["mpjnxh"][99]={消耗经验=669149,消耗金钱=250931}
自定义系统["mpjnxh"][100]={消耗经验=694932,消耗金钱=260599}
自定义系统["mpjnxh"][101]={消耗经验=721452,消耗金钱=270544}
自定义系统["mpjnxh"][102]={消耗经验=748722,消耗金钱=280770}
自定义系统["mpjnxh"][103]={消耗经验=776755,消耗金钱=291283}
自定义系统["mpjnxh"][104]={消耗经验=805566,消耗金钱=302087}
自定义系统["mpjnxh"][105]={消耗经验=835169,消耗金钱=313188}
自定义系统["mpjnxh"][106]={消耗经验=865579,消耗金钱=324592}
自定义系统["mpjnxh"][107]={消耗经验=896809,消耗金钱=336303}
自定义系统["mpjnxh"][108]={消耗经验=928876,消耗金钱=348328}
自定义系统["mpjnxh"][109]={消耗经验=961792,消耗金钱=360672}
自定义系统["mpjnxh"][110]={消耗经验=995572,消耗金钱=373339}
自定义系统["mpjnxh"][111]={消耗经验=1030234,消耗金钱=386337}
自定义系统["mpjnxh"][112]={消耗经验=1065190,消耗金钱=399671}
自定义系统["mpjnxh"][113]={消耗经验=1102256,消耗金钱=413346}
自定义系统["mpjnxh"][114]={消耗经验=1139649,消耗金钱=427368}
自定义系统["mpjnxh"][115]={消耗经验=1177983,消耗金钱=441743}
自定义系统["mpjnxh"][116]={消耗经验=1217273,消耗金钱=456477}
自定义系统["mpjnxh"][117]={消耗经验=1256104,消耗金钱=471576}
自定义系统["mpjnxh"][118]={消耗经验=1298787,消耗金钱=487045}
自定义系统["mpjnxh"][119]={消耗经验=1341043,消耗金钱=502891}
自定义系统["mpjnxh"][120]={消耗经验=1384320,消耗金钱=519120}
自定义系统["mpjnxh"][121]={消耗经验=1428632,消耗金钱=535737}
自定义系统["mpjnxh"][122]={消耗经验=1473999,消耗金钱=552749}
自定义系统["mpjnxh"][123]={消耗经验=1520435,消耗金钱=570163}
自定义系统["mpjnxh"][124]={消耗经验=1567957,消耗金钱=587984}
自定义系统["mpjnxh"][125]={消耗经验=1616583,消耗金钱=606218}
自定义系统["mpjnxh"][126]={消耗经验=1666328,消耗金钱=624873}
自定义系统["mpjnxh"][127]={消耗经验=1717211,消耗金钱=643954}
自定义系统["mpjnxh"][128]={消耗经验=1769248,消耗金钱=663468}
自定义系统["mpjnxh"][129]={消耗经验=1822456,消耗金钱=683421}
自定义系统["mpjnxh"][130]={消耗经验=1876852,消耗金钱=703819}
自定义系统["mpjnxh"][131]={消耗经验=1932456,消耗金钱=724671}
自定义系统["mpjnxh"][132]={消耗经验=1989284,消耗金钱=745981}
自定义系统["mpjnxh"][133]={消耗经验=2047353,消耗金钱=767757}
自定义系统["mpjnxh"][134]={消耗经验=2106682,消耗金钱=790005}
自定义系统["mpjnxh"][135]={消耗经验=2167289,消耗金钱=812733}
自定义系统["mpjnxh"][136]={消耗经验=2229192,消耗金钱=835947}
自定义系统["mpjnxh"][137]={消耗经验=2292410,消耗金钱=859653}
自定义系统["mpjnxh"][138]={消耗经验=2356960,消耗金钱=883860}
自定义系统["mpjnxh"][139]={消耗经验=2422861,消耗金钱=908573}
自定义系统["mpjnxh"][140]={消耗经验=2490132,消耗金钱=933799}
自定义系统["mpjnxh"][141]={消耗经验=2558792,消耗金钱=959547}
自定义系统["mpjnxh"][142]={消耗经验=2628860,消耗金钱=985822}
自定义系统["mpjnxh"][143]={消耗经验=2700356,消耗金钱=1012633}
自定义系统["mpjnxh"][144]={消耗经验=2773296,消耗金钱=1039986}
自定义系统["mpjnxh"][145]={消耗经验=2847703,消耗金钱=1067888}
自定义系统["mpjnxh"][146]={消耗经验=2923593,消耗金钱=1096347}
自定义系统["mpjnxh"][147]={消耗经验=3000989,消耗金钱=1125371}
自定义系统["mpjnxh"][148]={消耗经验=3079908,消耗金钱=1154965}
自定义系统["mpjnxh"][149]={消耗经验=3160372,消耗金钱=1185139}
自定义系统["mpjnxh"][150]={消耗经验=3242400,消耗金钱=1215900}
自定义系统["mpjnxh"][151]={消耗经验=6652022,消耗金钱=2494508}
自定义系统["mpjnxh"][152]={消耗经验=6822452,消耗金钱=2558419}
自定义系统["mpjnxh"][153]={消耗经验=6996132,消耗金钱=2623549}
自定义系统["mpjnxh"][154]={消耗经验=7173104,消耗金钱=2689914}
自定义系统["mpjnxh"][155]={消耗经验=7353406,消耗金钱=2757527}
自定义系统["mpjnxh"][156]={消耗经验=11305620,消耗金钱=4239607}
自定义系统["mpjnxh"][157]={消耗经验=11586254,消耗金钱=4344845}
自定义系统["mpjnxh"][158]={消耗经验=11872072,消耗金钱=4452027}
自定义系统["mpjnxh"][159]={消耗经验=12163140,消耗金钱=4561177}
自定义系统["mpjnxh"][160]={消耗经验=12459518,消耗金钱=4672319}
自定义系统["mpjnxh"][161]={消耗经验=15033471,消耗金钱=450041 }
自定义系统["mpjnxh"][162]={消耗经验=15315219,消耗金钱=4594563}
自定义系统["mpjnxh"][163]={消耗经验=15600468,消耗金钱=4680138}
自定义系统["mpjnxh"][164]={消耗经验=15889236,消耗金钱=4766769}
自定义系统["mpjnxh"][165]={消耗经验=16181550,消耗金钱=4854465}
自定义系统["mpjnxh"][166]={消耗经验=16477425,消耗金钱=4943226}
自定义系统["mpjnxh"][167]={消耗经验=16776885,消耗金钱=5033064}
自定义系统["mpjnxh"][168]={消耗经验=17079954,消耗金钱=5123985}
自定义系统["mpjnxh"][169]={消耗经验=17386650,消耗金钱=5215995}
自定义系统["mpjnxh"][170]={消耗经验=17697000,消耗金钱=5309100}
自定义系统["mpjnxh"][171]={消耗经验=24014692,消耗金钱=7204407}
自定义系统["mpjnxh"][172]={消耗经验=24438308,消耗金钱=7331490}
自定义系统["mpjnxh"][173]={消耗经验=24866880,消耗金钱=7460064}
自定义系统["mpjnxh"][174]={消耗经验=25300432,消耗金钱=7590129}
自定义系统["mpjnxh"][175]={消耗经验=25739000,消耗金钱=7721700}
自定义系统["mpjnxh"][176]={消耗经验=32728255,消耗金钱=9818475}
自定义系统["mpjnxh"][177]={消耗经验=33289095,消耗金钱=9986727}
自定义系统["mpjnxh"][178]={消耗经验=33856310,消耗金钱=10156893}
自定义系统["mpjnxh"][179]={消耗经验=34492930,消耗金钱=10328979}
自定义系统["mpjnxh"][180]={消耗经验=40842000,消耗金钱=12252600}

function 时间转换1(时间)
    return os.date("%d", 时间) .. "_" .. os.date("%X", 时间)
end

function 时间转换2(时间)
    return os.date("%m", 时间) .. "." .. os.date("%d", 时间) .. "  " .. os.date("%H", 时间) .. ":" .. os.date("%M", 时间)
end

function 时间转换3(时间)
    return "[" .. os.date("%m", 时间) .. "月" .. os.date("%d", 时间) .. "日" .. os.date("%H", 时间) ..
        ":" .. os.date("%M", 时间) .. "]"
end

function 时间转换(时间)
    return "[" ..os.date("%Y", 时间).."年".. os.date("%m", 时间) .. "月" .. os.date("%d", 时间) .. "日" .. os.date("%H", 时间) ..
        ":" .. os.date("%M", 时间) .. "]"
end

PK选中玩家 = 0
function 取表数量(t)
    local n=0
    if type(t)~="table" then
      return n
   end
    for k,v in pairs(t) do
        n=n+1
    end
    return n
end