





local 丸子获超魔诀 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("丸子获超魔诀",80+67+30 + abbr.py.x, 150 + abbr.py.y,650, 480)
local 当前 = 多开数据.当前

function 丸子获超魔诀:初始化()
    local nsf = require("SDL.图像")(650, 480)
    if nsf:渲染开始() then
        nsf:填充颜色(0, 0, 0, 1)
        nsf["渲染结束"](nsf)
    end
    self:置精灵(nsf:到精灵())
end

function 丸子获超魔诀:打开(技能名称)
    self.神柚动画 = __res:取动画2('shape/pic/d3e2208b.was'):置循环(false)
    self.神柚动画:置首帧()
    self.圣旨动画 = __res:取动画2('shape/pic/d3e2209b.was'):置循环(false)
    self.圣旨动画:置首帧()
    self.技能名称 = 技能名称
    self.动画阶段 = 1  -- 1:神柚动画 2:圣旨动画 3:显示文字
    self.计时器 = 0
    self:置可见(true)
end

function 丸子获超魔诀:关闭()
    self:置可见(false)
end
function 丸子获超魔诀:更新(dt)
    if self.动画阶段 == 1 and self.神柚动画 then
        self.神柚动画:更新(dt * 2)  -- 加速播放
        
        if self.神柚动画:取当前帧() >= self.神柚动画:取帧数() then
            self.动画阶段 = 2
        end
    elseif self.动画阶段 == 2 and self.圣旨动画 then
        self.圣旨动画:更新(dt)
        
        if self.圣旨动画:取当前帧() >= self.圣旨动画:取帧数() then
            self.动画阶段 = 3

        end
    elseif self.动画阶段 == 3 then
        
        self.计时器 = self.计时器 + 1
        
        if self.计时器 > 260 then
            self:关闭()
        end
    end
end

function 丸子获超魔诀:显示(x, y)
    local function utf8_to_table(str)
    local chars = {}
    local i = 1
    while i <= #str do
        local c = string.byte(str, i)
        if c < 128 then
            table.insert(chars, string.sub(str, i, i))
            i = i + 1
        elseif c < 224 then
            table.insert(chars, string.sub(str, i, i+1))
            i = i + 2
        elseif c < 240 then
            table.insert(chars, string.sub(str, i, i+2))
            i = i + 3
        elseif c < 248 then
            table.insert(chars, string.sub(str, i, i+3))
            i = i + 4
        else
            -- 不应该出现，但是为了安全
            table.insert(chars, string.sub(str, i, i))
            i = i + 1
        end
    end
    return chars
end
    if self.动画阶段 == 1 and self.神柚动画 then
        self.神柚动画:显示(x+320, y+150)
    elseif self.动画阶段 == 2 and self.圣旨动画 then
        self.圣旨动画:显示(x+330, y+170)
    elseif self.动画阶段 == 3 then
        if self.圣旨动画 then
            self.圣旨动画:显示(x+330, y+170)
        end
       if self.技能名称 then
            local chars = utf8_to_table(self.技能名称)
            local startX = x + 421
            local startY = 120 + y
            local lineHeight = 14  -- 行高，根据字体大小调整，这里假设字体16的高度为16，我们设置为20以便有间距
            for i, char in ipairs(chars) do
                字体14:置颜色(255, 255, 255)
                字体14:显示(startX, startY + (i-1) * lineHeight, char)
            end
        end
    end
end

local 总关闭 = 丸子获超魔诀:创建我的按钮(__res:取图像(__res:取地址("shape/pic/", 0xCF000002)), "总关闭", 480, 0)
function 总关闭:左键弹起(x,y,msg)
    丸子获超魔诀:关闭()
end
