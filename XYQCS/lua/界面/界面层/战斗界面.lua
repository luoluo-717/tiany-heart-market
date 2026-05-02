--[[
    @Author       : GGELUA
    @Date         : 2022-02-27 16:42:57
Last Modified by: GGELUA
Last Modified time: 2023-05-25 20:06:48
--]]
local 战斗界面 = 多开数据[多开数据.当前].__UI界面.界面层:创建控件("战斗界面", 490 + abbr.py.x, 90 + abbr.py.y, 440, 450)
local 当前 = 多开数据.当前
local 门派 = { 大唐 = 0xAAAA0001, 化生寺 = 0xAAAA0002, 女儿村 = 0XAAAA0003, 天机城 = 0XAAAA0004, 神木林 = 0XAAAA0005, 天宫 = 0XAAAA0006, 龙宫 = 0XAAAA0007, 五庄观 = 0XAAAA0008, 普陀山 = 0XAAAA0009, 凌波城 = 0XAAAA0010, 女魃墓 = 0XAAAA0011, 无底洞 = 0XAAAA0012, 花果山 = 0XAAAA0013, 阴曹地府 = 0XAAAA0014, 魔王寨 = 0XAAAA0015, 狮驼岭 = 0XAAAA0016, 盘丝洞 = 0XAAAA0017, 方寸山 = 0XAAAA0018 }

function 战斗界面:初始化()
    self.敏捷对象=0
	self.敏捷执行=0
    self.奇袭三按钮 = false

    self.奇袭已使用 = {}  -- 新增：记录哪些单位已经使用了奇袭

    self.单挑圈圈 = {
		[2] =__res:取动画(__res:取地址("shape/tx/", 0xAABBCC10)):取动画(1):置当前帧(1):播放(true),
		[3] =__res:取动画(__res:取地址("shape/tx/", 0xAABBCC10)):取动画(1):置当前帧(1):播放(true),
		[4] =__res:取动画(__res:取地址("shape/tx/", 0xAABBCC11)):取动画(1):置当前帧(1):播放(true),
		[5] =__res:取动画(__res:取地址("shape/tx/", 0xAABBCC11)):取动画(1):置当前帧(1):播放(true),
		}
    local tab = {00000600,00000601,00000602,00000603,00000604}
    self.法术次数图片 = {}
    for n = 1, 5 do
        self.法术次数图片[n] = __res:取图像(__res:取地址("shape/mx/", tab[n]))
    end
end

function 战斗界面:重置()
   
    self.单挑召唤=nil

    self.命令类型 = nil
    self.命令附加 = 4
    if not self.是否可见 then
        self:置可见(true)
    end
    if 战斗界面.操作类.是否可见 then
        战斗界面.操作类:置可见(false)
        显示战斗鼠标=false
    end
    local 允许默认法术 = false
    local tcp
    if self.参战单位[self.单位编号[self.操作对象]].自动指令 and self.参战单位[self.单位编号[self.操作对象]].自动指令.类型 == '法术' then
        for i, v in ipairs(self.参战单位[self.单位编号[self.操作对象]].主动技能) do
            if v.名称 == self.参战单位[self.单位编号[self.操作对象]].自动指令.参数 then
                允许默认法术 = v
                
                local 冷却 = 多开数据[当前].__战斗主控.战斗单位[self.单位编号[self.操作对象]].技能冷却
                if 冷却 and 冷却[v.名称] then
                    v.剩余冷却回合 = 冷却[v.名称]
                else
                    v.剩余冷却回合 = nil
                end
                local nsf = require('SDL.图像')(45, 45)
                local lssc = 取技能信息(v.名称)
                local 门派=多开数据[当前].__UI界面.界面层.战斗界面.参战单位[多开数据[当前].__UI界面.界面层.战斗界面.单位编号[ 多开数据[当前].__UI界面.界面层.战斗界面.操作对象]].门派
                local tux = require("SDL.图像")
                if nsf:渲染开始() then
                    nsf:渲染清除(0, 0, 0, 255)
                    if lssc[9] then
                        if v.剩余冷却回合 then
                            if self:技能在如意神通中(v.名称, self.参战单位[self.单位编号[self.操作对象]].如意神通) then
                                __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(45, 45):显示(20, 20)
                            else
                                __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(45, 45):到灰度():显示(20, 20)
                                v.不可选择 = true
                            end
                        else
                            if self:技能在如意神通中(v.名称, self.参战单位[self.单位编号[self.操作对象]].如意神通) then
                                __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(45, 45):显示(20, 20)
                            else
                                __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(45, 45):到灰度():显示(20, 20)
                                v.不可选择 = true
                            end
                        end
                    else
                        if v.剩余冷却回合 then
                            if lssc[10] then
                                tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[门派].."/"..__jingmaimiaoshu[v.名称]..".jpg"):到灰度():拉伸(45, 45):显示(0,0)
                            else
                                __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(45, 45):到灰度():显示(0, 0)
                            end
                        else
                            if lssc[10] then
                                tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[门派].."/"..__jingmaimiaoshu[v.名称]..".jpg"):拉伸(45, 45):显示(0,0)
                            else
                                __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(45, 45):显示(0, 0)
                            end
                        end
                    end
                    nsf:渲染结束()
                end
                tcp = nsf:到精灵()
            end
        end
    end
    if self.参战单位[self.单位编号[self.操作对象]].自动战斗 or (self.参战单位[self.单位编号[self.操作对象]].死亡开关 and self.参战单位[self.单位编号[self.操作对象]].单位类型=="bb") then
        if self.操作对象+self.敏捷执行>=self.对象上限+self.敏捷对象 or self.操作对象 >= self.对象上限 then
            self:完成命令()
        else
            self.操作对象 = self.操作对象 + 1
            self:重置()
        end
    else
        
        if self.参战单位[self.单位编号[self.操作对象]].单位类型 == "角色" then
            local 当前单位已使用奇袭 = self.奇袭已使用[self.单位编号[self.操作对象]] or false
            if self.奇袭总显示 and not 当前单位已使用奇袭 then
                self.人物指令类.奇袭按钮:置可见(true)
                if self:奇袭按钮可更() then
                    self.人物指令类.奇袭按钮:置禁止(false)
                else
                    self.人物指令类.奇袭按钮:置禁止(true)
                end
            else
                self.人物指令类.奇袭按钮:置可见(false)
            end

            战斗界面.召唤兽指令类:置可见(false)
            战斗界面.人物指令类:置可见(true)
            战斗界面.奇袭指令类:置可见(false)
            
            if 允许默认法术 then
                self.人物指令类.默认法术:置正常精灵(tcp:置中心(0, 0))
                self.人物指令类.默认法术:置按下精灵(tcp:置中心(-1, -1))
                self.人物指令类.默认法术:置正常的精灵(tcp)
                self.人物指令类.默认法术:置可见(true)
                self.人物指令类.默认法术.技能信息 = 允许默认法术
            else
                self.人物指令类.默认法术:置可见(false)
                self.人物指令类.默认法术.技能信息 = nil
            end
        else
            战斗界面.召唤兽指令类:置可见(true)
            战斗界面.人物指令类:置可见(false)
            战斗界面.奇袭指令类:置可见(false)

            if 允许默认法术 then
                self.召唤兽指令类.默认法术按钮:置正常精灵(tcp:置中心(0, 0))
                self.召唤兽指令类.默认法术按钮:置按下精灵(tcp:置中心(-1, -1))
                self.召唤兽指令类.默认法术按钮:置正常的精灵(tcp)
                self.召唤兽指令类.默认法术按钮:置可见(true)
                self.召唤兽指令类.默认法术按钮.技能信息 = 允许默认法术
            else
                self.召唤兽指令类.默认法术按钮:置可见(false)
                self.召唤兽指令类.默认法术按钮.技能信息 = nil
            end
        end
    end
    nsf = require("SDL.图像")(300+310, 160)
    if nsf:渲染开始() then
        if self.参战单位[self.单位编号[self.操作对象]].门派 == "九黎城" and self.参战单位[self.单位编号[self.操作对象]].黎魂 then
            if self.九黎多次[self.单位编号[self.操作对象]] == nil then
                序列 = 0
            else
                序列 = #self.九黎多次[self.单位编号[self.操作对象]]
            end
            local 序列 = self.参战单位[self.单位编号[self.操作对象]].黎魂 - 序列
            if 序列 > 0 then
                    self.法术次数图片[math.min(序列, 5)]:显示(120+310-75,68)
            end
        end
        字体18:置颜色(__取颜色("黄色"))
        local 单位信息 = "操作对象："..self.参战单位[self.单位编号[self.操作对象]].名称
        if self.参战单位[self.单位编号[self.操作对象]].门派 then
            单位信息 = 单位信息 .. "(" .. self.参战单位[self.单位编号[self.操作对象]].门派 .. ")"
        end
        字体18:取图像(单位信息, 247, 247, 247):显示(110, 10)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 战斗界面:更新类型(sj)
    战斗界面:置可见(true, true)
    self.敏捷对象=0
	self.敏捷执行=0
    self.单位编号 = sj.mb
    self.单位id = sj.id
    self.操作对象 = 1
    self.完成指令 = {mb=sj.mb}
    self.对象上限 = #sj.mb
    self.参战单位 = 多开数据[当前].__战斗主控.战斗单位
    self.命令参数 = ""
    self.奇袭指令 = {}
    self.奇袭已使用 = {}  -- 每回合开始时重置
    self.九黎多次 = {}
	self.九黎编号=nil
	战斗连击显示 = {}
	战斗连击单位 = 0
    for i=1,self.对象上限 do
		if self.参战单位[self.单位编号[i]] then
			self.参战单位[self.单位编号[i]].主动技能 = sj["zdjn"..i]
            if type(sj) == "table" and type(sj.zccz) == "table" then
                self.参战单位[self.单位编号[i]].超级敏捷 = sj.zccz[i] or 0
            else
                self.参战单位[self.单位编号[i]].超级敏捷 = 0
            end
            if self.参战单位[self.单位编号[i]].超级敏捷==1 then
                self.参战单位[self.单位编号[i]].超敏记录=false
                self.敏捷对象 = self.敏捷对象 + 1
            end
		end
	end

    for n = 1, #sj.mb do
        if type(sj.qixi)=="table" and self.参战单位[self.单位编号[n]] then
            if sj.qixi[self.单位编号[n]] then
                self.参战单位[self.单位编号[n]].奇袭法术 = true
            else
                self.参战单位[self.单位编号[n]].奇袭法术 = nil
            end
        end
        self.完成指令[n] = {}
        self.奇袭指令[n] = {}
    end
    self.奇袭总显示 = true
    self:重置()
end

function 战斗界面:操作重置()
    if not self.是否可见 then
        self:置可见(true)
    end
    if self.人物指令类.是否可见 then
        战斗界面.人物指令类:置可见(false)
        战斗界面.奇袭指令类:置可见(false)
    end
    if self.召唤兽指令类.是否可见 then
        战斗界面.召唤兽指令类:置可见(false)
    end
    self.操作类:置可见(true)
    显示战斗鼠标=true

end

function 战斗界面:完成命令()
    print("完成命令")
    -- table.print(self.完成指令)
    self.完成指令.奇袭指令 = self.奇袭指令
    发送数据(当前 or self and self.当前, 5502, self.完成指令)
    多开数据[当前].__战斗主控.进程 = "等待"
    self:置可见(false)
    if self.人物指令类.是否可见 then
        战斗界面.人物指令类:置可见(false)
    end
    if self.召唤兽指令类.是否可见 then
        战斗界面.召唤兽指令类:置可见(false)
    end
    if self.奇袭指令类.是否可见 then
        战斗界面.奇袭指令类:置可见(false)
    end
    if self.操作类.是否可见 then
        战斗界面.操作类:置可见(false)
    end
    
    显示战斗鼠标=false

end

function 战斗界面:取类型选择(敌我, bh)
    if self.命令类型 == "法术" or self.命令类型 == "道具" or self.命令类型 == "灵宝" then
        if 敌我 == 2 and self.命令附加 == 4 then
            return true
        elseif 敌我 == 1 and (self.命令附加 == 5 or self.命令附加 == 6 or self.命令附加 == 3) then
            return true
        elseif self.命令附加 == 88 then
            return true
        end
    elseif self.命令类型 == "捕捉" and 敌我 == 2 then
        return true
    elseif self.命令类型 == "保护" and 敌我 == 1 and bh ~= self.操作对象 then
        return true
    elseif self.命令类型 == "攻击" then
        return true
    elseif not self.命令类型 and 敌我 == 2 then
        self.命令类型 = "攻击"
        return true
    end
    return false
end

function 战斗界面:设置指令(编号)
    -- ========== 新增：清除奇袭残留的再次操作缓存 ==========
    if self.完成指令[self.操作对象] then
        self.完成指令[self.操作对象].再次操作 = nil
    end
    -- ==============================================
    if self.命令类型 == "攻击" and self.参战单位[编号].敌我 == 1 then
        if 编号 == self.单位编号[self.操作对象] then
            self:重置()
            return
        else
            self.命令类型 = "攻击"
            self.命令附加 = "友伤"
        end
    elseif not self.命令类型 then
        self.命令类型 = "攻击"
    end
    
if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].单位类型~="角色" then
    if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超敏记录 then
    	self.参战单位[self.单位编号[self.操作对象]].超敏记录 = nil
    	self.完成指令[self.操作对象].再次操作={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
    else
        self.完成指令[self.操作对象] = { 类型 = self.命令类型, 目标 = 编号, 敌我 = 0, 参数 = self.命令参数, 附加 = self.命令附加, id = self.单位id[self.操作对象] }
    end
    self.命令参数 = ""
    if self.操作对象+self.敏捷执行>=self.对象上限+self.敏捷对象 or self.操作对象 >= self.对象上限 then
        self:完成命令()
    else
        if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超级敏捷 ==1 then
			self.参战单位[self.单位编号[self.操作对象]].超级敏捷 = 0
			self.参战单位[self.单位编号[self.操作对象]].超敏记录=true
			self.敏捷执行 = self.敏捷执行 + 1
        else
            self.操作对象 = self.操作对象 + 1
        end
        self:重置()
    end
else
        local 继续 = true
        self.完成指令[self.操作对象] = { 类型 = self.命令类型, 目标 = 编号, 敌我 = 0, 参数 = self.命令参数, 附加 = self.命令附加, id = self.单位id[self.操作对象] }
        if self.参战单位[self.单位编号[self.操作对象]].门派 == "九黎城" and self.命令类型 == "法术" and self.参战单位[self.单位编号[self.操作对象]].黎魂 ~= nil and 九黎城攻击技能[self.命令参数] ~= nil then
            if self.九黎多次[self.单位编号[self.操作对象]] == nil then
                self.九黎多次[self.单位编号[self.操作对象]] = {
                    {
                        self.命令参数,
                        编号
                    }
                }
                继续 = false
            elseif #self.九黎多次[self.单位编号[self.操作对象]] < self.参战单位[self.单位编号[self.操作对象]].黎魂 - 1 then
                self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
                    self.命令参数,
                    编号
                }
                继续 = false
            else
                self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
                    self.命令参数,
                    编号
                }
                self.完成指令[self.操作对象] = {
                    敌我 = 0,
                    类型 = self.命令类型,
                    目标 = 编号,
                    id=self.单位id[self.操作对象],
                    参数 = self.九黎多次[self.单位编号[self.操作对象]],
                    附加 = self.命令附加
                }
            end
        end
        if self.命令类型 == "攻击" then
            继续 = true  
        end
        if 继续 then
            if self.操作对象 >= self.对象上限 then
                self:完成命令()
            else
                self.操作对象 = self.操作对象 + 1
    
            end
        end
        self:重置()
end
end
function 战斗界面:设置指令1(编号)
    
    self.命令参数 = ""
  if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].单位类型~="角色" then
    if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超敏记录 then
    	self.参战单位[self.单位编号[self.操作对象]].超敏记录 = nil
    	self.完成指令[self.操作对象].再次操作={类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加,id=self.单位id[self.操作对象]}
    else
        self.完成指令[self.操作对象] = { 类型 = self.命令类型, 目标 = 编号, 敌我 = 0, 参数 = self.命令参数, 附加 = self.命令附加, id = self.单位id[self.操作对象] }
    end
    if self.操作对象+self.敏捷执行>=self.对象上限+self.敏捷对象 or self.操作对象 >= self.对象上限 then
        self:完成命令()
    else
        if self.单位编号[self.操作对象]~=nil and self.参战单位[self.单位编号[self.操作对象]].超级敏捷 ==1 then
			self.参战单位[self.单位编号[self.操作对象]].超级敏捷 = 0
			self.参战单位[self.单位编号[self.操作对象]].超敏记录=true
			self.敏捷执行 = self.敏捷执行 + 1
        else
            self.操作对象 = self.操作对象 + 1
        end
        self:重置()
    end
  else
    local 继续 = true
    self.完成指令[self.操作对象] = { 类型 = self.命令类型, 目标 = 编号, 敌我 = 0, 参数 = self.命令参数, 附加 = self.命令附加, id = self.单位id[self.操作对象] }
    if self.参战单位[self.单位编号[self.操作对象]].门派 == "九黎城" and self.命令类型 == "法术" and self.参战单位[self.单位编号[self.操作对象]].黎魂 ~= nil and 九黎城攻击技能[self.命令参数] ~= nil then
        if self.九黎多次[self.单位编号[self.操作对象]] == nil then
            self.九黎多次[self.单位编号[self.操作对象]] = {
                {
                    self.命令参数,
                    编号
                }
            }
            继续 = false
        elseif #self.九黎多次[self.单位编号[self.操作对象]] < self.参战单位[self.单位编号[self.操作对象]].黎魂 - 1 then
            self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
                self.命令参数,
                编号
            }
            继续 = false
        else
            self.九黎多次[self.单位编号[self.操作对象]][#self.九黎多次[self.单位编号[self.操作对象]] + 1] = {
                self.命令参数,
                编号
            }
            self.完成指令[self.操作对象] = {
                敌我 = 0,
                类型 = self.命令类型,
                目标 = 编号,
                id = self.单位id[self.操作对象],
                参数 = self.九黎多次[self.单位编号[self.操作对象]],
                附加 = self.命令附加
            }
        end
    end
    if self.命令类型 == "攻击" then
        继续 = true  
    end
    if 继续 then
        if self.操作对象 >= self.对象上限 then
            self:完成命令()
        else
            self.操作对象 = self.操作对象 + 1

        end
    end
    self:重置()
  end
end
-- 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].数据.id
function 战斗界面:置单位身光()
    local 当前编号 = 战斗界面.单位编号[战斗界面.操作对象]
    if 当前编号 and 
       多开数据[当前].__战斗主控 and 
       多开数据[当前].__战斗主控.战斗单位 and 
       多开数据[当前].__战斗主控.战斗单位[当前编号] then
        -- print("为当前单位设置身光:", 战斗界面.参战单位[当前编号] and 战斗界面.参战单位[当前编号].名称 or "未知")
        多开数据[当前].__战斗主控:置单位身光(战斗界面.奇袭三按钮)
    end
end

function 战斗界面:设置法术参数(法术)
    if 法术 == nil then
        return
    end
    -- ========== 新增：重置奇袭相关的继续标志和九黎缓存 ==========
    -- local 继续 = true  -- 强制设为true，跳过奇袭的“继续=false”逻辑
    -- self.九黎多次 = {} -- 清空九黎城多段攻击缓存
    -- ==============================================

    self.命令类型 = "法术"
    self.命令参数 = 法术.名称
    local 临时种类 = 取技能信息(法术.名称)
    self.法术名称 = 法术.名称
    self.命令附加 = 临时种类[3]
    self.命令版面 = false
    self.法术开关 = false
    if 法术.名称 == "妙手空空" then
        self.命令附加 = 4
    end
    if self.命令附加 == 2 then
        self:设置指令(self.单位编号[self.操作对象])
        -- ========== 新增：强制触发完成指令（若操作对象已到上限） ==========
        if self.操作对象 >= self.对象上限 then
            self:完成命令()
        end
        -- ==============================================
    else
        self:操作重置()
    end
end
function 战斗界面:设置披坚执锐(法术,可选编号)
    if nil == 法术 or not 法术.可选 then
        return
    end
    self.完成指令[self.操作对象]={类型="披坚执锐",目标=1,敌我=0,参数=法术.名称,附加=可选编号,id=self.单位id[self.操作对象]}
    if self.操作对象 >= self.对象上限 then
        发送数据(5502, self.完成指令)
        多开数据[当前].__战斗主控["进程"] = "等待"
        self:置可见(false)
        self.图像 = nil
        显示战斗鼠标=false
    else
        self.操作对象 = self.操作对象 + 1
        self.重置(self)
    end
end

function 战斗界面:设置道具(data, lx)
    多开数据[当前].__UI界面.窗口层.战斗道具:打开(data.道具, lx)
end

function 战斗界面:设置灵宝(data)
    多开数据[当前].__UI界面.窗口层.战斗灵宝:打开(data)
end

function 战斗界面:设置道具参数(编号, 对象)
    self.命令类型 = "道具"
    self.命令附加 = 对象
    self.命令参数 = 编号
    多开数据[当前].__UI界面.窗口层.战斗道具:置可见(false)
    if self.命令附加 == 2 then
        self:设置指令(self.单位编号[self.操作对象])
    else
        self:操作重置()
    end
end

function 战斗界面:设置灵宝参数(编号, 对象)
    self.命令类型 = "道具"
    self.命令附加 = 对象
    self.命令参数 = 编号
    多开数据[当前].__UI界面.窗口层.战斗灵宝:置可见(false)
    if self.命令附加 == 2 then
        self:设置指令(self.单位编号[self.操作对象])
    else
        self:操作重置()
    end
end

function 战斗界面:设置逃跑(id)
    self.完成指令[self.操作对象] = { 类型 = "逃跑", 目标 = 1, 敌我 = 0, 参数 = self.命令参数, 附加 = 1, id = self.单位id[self.操作对象] }
    if self.操作对象 >= self.对象上限 then
        self:完成命令()
    else
        self.操作对象 = self.操作对象 + 1
        self:重置()
    end
end

function 战斗界面:设置召唤(id)
    self.命令类型 = "召唤"
    self.完成指令[self.操作对象] = { 类型 = self.命令类型, 目标 = id, 敌我 = 0, 参数 = self.命令参数, 附加 = self.命令附加, id = self.单位id[self.操作对象],位置=self.召唤位置}
    self:置可见(true)
    多开数据[当前].__UI界面.窗口层.战斗召唤:置可见(false)
    if self.操作对象 >= self.对象上限 then
        self:完成命令()
    else
        self.操作对象 = self.操作对象 + 1
        self:重置()
    end
end

local 奇袭指令类 = 战斗界面:创建控件("奇袭指令类", 84, 0, 440, 450)
function 奇袭指令类:初始化()
end

local 人物指令类 = 战斗界面:创建控件("人物指令类", 0, 0, 440, 450)
function 人物指令类:初始化()
end

for i, v in ipairs {
    { name = '捕捉', x = 12, y = 373, tcp = __res:getPNGCC(2, 10, 3, 54, 54) },
    { name = '逃跑', x = 84, y = 373, tcp = __res:getPNGCC(2, 72, 3, 54, 54) },
    { name = '召还', x = 157, y = 373, tcp = __res:getPNGCC(2, 138, 3, 54, 54) },
    { name = '保护', x = 228, y = 373, tcp = __res:getPNGCC(2, 203, 3, 54, 54) },
    -- { name = '指挥', x = 302, y = 249, tcp = __res:getPNGCC(2, 272, 3, 54, 54) },
    { name = '防御', x = 302, y = 373, tcp = __res:getPNGCC(2, 329, 3, 54, 54) },
    { name = '自动', x = 376, y = 373, tcp = __res:getPNGCC(2, 391, 3, 54, 54) },
    { name = '召唤', x = 302, y = 312, tcp = __res:getPNGCC(2, 918 / 2, 3, 54, 54) },
    { name = '道具', x = 376, y = 312, tcp = __res:getPNGCC(2, 521, 3, 54, 54) },
    { name = '特技', x = 376, y = 249, tcp = __res:getPNGCC(2, 586, 3, 54, 54) },
    { name = '灵宝', x = 376, y = 188, tcp = __res:getPNGCC(2, 845, 3, 54, 54) },
    { name = '法宝', x = 376, y = 125, tcp = __res:getPNGCC(2, 653, 3, 54, 54) },
    { name = '法术', x = 376, y = 63, tcp = __res:getPNGCC(2, 719, 3, 54, 54) },
    { name = '攻击', x = 376, y = 0, tcp = __res:getPNGCC(2, 780, 3, 54, 54) },
    { name = '默认法术', x = 302, y = 50, tcp = __res:getPNGCC(2, 780, 3, 54, 54) }
} do
    local 临时函数 = 人物指令类:创建我的按钮(v.tcp, v.name, v.x, v.y)
    function 临时函数:左键弹起(x, y)
        if v.name == '捕捉' then
            战斗界面.命令类型 = "捕捉"
            战斗界面.命令附加 = 4
            战斗界面:操作重置()
        elseif v.name == '逃跑' then
            战斗界面:设置逃跑()
        elseif v.name == '召还' then
        elseif v.name == '指挥' then

        elseif v.name == '保护' then
            战斗界面.命令类型 = "保护"
            战斗界面:操作重置()
        elseif v.name == '防御' then
            战斗界面.命令类型 = "防御"
            战斗界面:设置指令1(0)
        elseif v.name == '自动' then
            if 多开数据[当前].__UI界面.窗口层.战斗自动.是否可见 then
                多开数据[当前].__UI界面.窗口层.战斗自动.是否可见 = false
                
            else
                发送数据(当前 or self and self.当前, 5511)
            end
            -- 发送数据(当前 or self and self.当前, 5507)
        elseif v.name == '召唤' then
             if 战斗界面.单挑召唤 then
                战斗界面.单挑召唤=nil
                显示战斗鼠标=false
                return
            end
            if 多开数据[当前].__战斗主控.单挑模式 then
                战斗界面.命令类型="单挑召唤"
                显示战斗鼠标=true
                战斗界面.单挑召唤=true
            else
            发送数据(当前 or self and self.当前, 5505, { 真实id = 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].数据.id })
            end
        elseif v.name == '道具' then
            发送数据(当前 or self and self.当前, 5504, { 真实id = 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].数据.id })
        elseif v.name == '特技' then
            战斗界面.命令类型 = "特技"
            多开数据[当前].__UI界面.窗口层.战斗法术:打开(战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].特技技能, "特技")
        elseif v.name == '灵宝' then
            发送数据(当前 or self and self.当前, 5519, { 真实id = 战斗界面.单位id[战斗界面.操作对象] })
        elseif v.name == '法宝' then
            发送数据(当前 or self and self.当前, 5508, { 真实id = 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].数据.id })
        elseif v.name == '法术' then
            -- ========== 新增：重置奇袭状态，避免干扰 ==========
            战斗界面.奇袭三按钮 = false
            战斗界面.奇袭命令下达 = false
            战斗界面.奇袭总显示 = true
            -- ==============================================

            战斗界面.命令类型 = "法术"
            多开数据[当前].__UI界面.窗口层.战斗法术:打开(
                        战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].主动技能, 
                        "法术", 
                        战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].技能冷却,
                        战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].如意神通,
                        战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].追加法术
                        )

        elseif v.name == '攻击' then
            战斗界面.命令类型 = "攻击"
            战斗界面:操作重置()
        elseif v.name == '默认法术' then
            战斗界面.命令类型 = "法术"
            多开数据[当前].__UI界面.界面层.战斗界面:设置法术参数(临时函数.技能信息)
        end
    end
end

function 战斗界面:技能在如意神通中(技能名称, 如意神通)
    for _, v in ipairs(如意神通) do
        if v == 技能名称 then
            return true
        end
    end
    return false
end


local 召唤兽指令类 = 战斗界面:创建控件("召唤兽指令类", 0, 0, 440, 450)
function 召唤兽指令类:初始化()
    self:置可见(false)
end

for i, v in ipairs {
    { name = '逃跑按钮', x = 157, y = 373, tcp = __res:getPNGCC(2, 72, 3, 54, 54) },
    { name = '保护按钮', x = 228, y = 373, tcp = __res:getPNGCC(2, 203, 3, 54, 54) },
    { name = '防御按钮', x = 302, y = 373, tcp = __res:getPNGCC(2, 329, 3, 54, 54) },
    { name = '自动按钮', x = 376, y = 373, tcp = __res:getPNGCC(2, 391, 3, 54, 54) },
    { name = '道具按钮', x = 376, y = 312, tcp = __res:getPNGCC(2, 521, 3, 54, 54) },
    { name = '法术按钮', x = 376, y = 249, tcp = __res:getPNGCC(2, 719, 3, 54, 54) },
    { name = '攻击按钮', x = 376, y = 188, tcp = __res:getPNGCC(2, 780, 3, 54, 54) },
    { name = '默认法术按钮', x = 302, y = 188, tcp = __res:getPNGCC(2, 780, 3, 54, 54) }
} do
    local 临时函数 = 召唤兽指令类:创建我的按钮(v.tcp, v.name, v.x, v.y)
    function 临时函数:左键弹起(x, y)
        if v.name == '逃跑按钮' then
            战斗界面:设置逃跑()
        elseif v.name == '保护按钮' then
            战斗界面.命令类型 = "保护"
            战斗界面:操作重置()
        elseif v.name == '防御按钮' then
            战斗界面.命令类型 = "防御"
            战斗界面:设置指令1(0)
        elseif v.name == '自动按钮' then

        elseif v.name == '道具按钮' then
            发送数据(当前 or self and self.当前, 5504, { 真实id = 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].数据.id })
        elseif v.name == '法术按钮' then
            战斗界面.命令类型 = "法术"
            多开数据[当前].__UI界面.窗口层.战斗法术:打开(
                            战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].主动技能, 
                            "法术", 
                            战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].技能冷却
                            
                            )
        elseif v.name == '攻击按钮' then
            战斗界面.命令类型 = "攻击"
            战斗界面:操作重置()
        elseif v.name == '默认法术按钮' then
            战斗界面.命令类型 = "法术"
            多开数据[当前].__UI界面.界面层.战斗界面:设置法术参数(临时函数.技能信息)
        end
    end
end

local 操作类 = 战斗界面:创建控件("操作类", 0, 0, 440, 450)
function 操作类:初始化()
    self:置可见(false)
end

for i, v in ipairs {
    -- {name = '随机目标', x = 376 ,y = 312 , tcp = __res:getPNGCC(2,903,1,68,55)},
    { name = '返回', x = 376, y = 373, tcp = __res:getPNGCC(2, 973, 1, 56, 56) },

} do
    local 临时函数 = 操作类:创建我的按钮(v.tcp, v.name, v.x, v.y)
    function 临时函数:左键弹起(x, y)
        if v.name == '随机目标' then
        elseif v.name == '返回' then
            战斗界面.奇袭三按钮 = false  -- 重置奇袭三按钮状态
            战斗界面:置单位身光() 
            -- ========== 新增：重置所有奇袭残留状态 ==========
            战斗界面.奇袭命令下达 = false    -- 重置奇袭命令状态
            战斗界面.奇袭总显示 = true       -- 恢复普通法术的显示逻辑
            战斗界面.命令类型 = nil          -- 清空奇袭设置的命令类型
            战斗界面.命令附加 = 4            -- 恢复默认附加参数
            战斗界面.命令参数 = ""           -- 清空奇袭设置的参数
            战斗界面.九黎多次 = {}           -- 清空九黎城多段攻击缓存（若有）
        -- ==============================================

            if 战斗界面:奇袭指令未有(战斗界面.操作对象) then
                if 战斗界面.奇袭命令下达 then
                    战斗界面.奇袭命令下达 = false
                end
                if not 战斗界面.奇袭总显示 then
                    战斗界面.奇袭总显示 = true
                end
            end
            if 多开数据[当前].__战斗主控.进程 == "等待" or 多开数据[当前].__战斗主控.进程 == "执行" then
            else
                战斗界面:重置()
            end
        end
    end
end

-- local 退出按钮 = 战斗界面:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):置拉伸(75,31), "退出按钮", -140,150, "退出")

-- function 退出按钮:左键弹起(x, y, msg)
--     发送数据(当前 or self and self.当前, 6002)
-- end
function 战斗界面:单挑显示(x,y)
    self.ssdjfj=false
    if self.单挑召唤 then
        for i=2,5 do
            self.单挑圈圈[i]:更新(0.05)
            self.单挑圈圈[i]:显示(多开数据[当前].__战斗主控.阵型位置.单挑.我方[i].x-180+(引擎.宽度/2-400),多开数据[当前].__战斗主控.阵型位置.单挑.我方[i].y-25+(引擎.高度/2-300))
            if self.单挑圈圈[i]:检查点(x, y) then
                self.召唤位置=i
                self.ssdjfj=true
            end
        end
    elseif self.召唤兽指令类["是否可见"] then
        if self.参战单位[self.单位编号[self.操作对象]].单位类型 == "bb" then
			local bh = self.单位编号[self.操作对象]
			-- print(self.参战单位[bh].排序位置)
			self.单挑圈圈[self.参战单位[bh].排序位置]:更新(0.05)
			self.单挑圈圈[self.参战单位[bh].排序位置]:显示(多开数据[当前].__战斗主控.阵型位置.单挑.我方[self.参战单位[bh].排序位置].x-180+(引擎.宽度/2-400),多开数据[当前].__战斗主控.阵型位置.单挑.我方[self.参战单位[bh].排序位置].y-25+(引擎.高度/2-300))
		end
    end
end

function 战斗界面:左键弹起(x, y)
    if self.单挑召唤 and self.ssdjfj then
        显示战斗鼠标=false
        战斗界面.单挑召唤=nil
         发送数据(当前 or self and self.当前, 5505, { 真实id = 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].数据.id })
    end
end
--------------------奇袭新增
local 奇袭按钮 = 人物指令类:创建我的按钮(__res:getPNGCC(18, 18, 587, 60, 60), "奇袭按钮", 298, 312-70)
function 奇袭按钮:左键弹起(x, y)
    战斗界面.人物指令类:置可见(false)
    战斗界面.奇袭指令类:置可见(true)
    战斗界面.奇袭三按钮 = true  -- 设置奇袭三按钮状态
    战斗界面:置单位身光()  -- 调用置单位身光
    if 战斗界面:奇袭三按钮可更("奇袭法术") then
        战斗界面.奇袭指令类.奇袭法术按钮:置禁止(false)
    else
        战斗界面.奇袭指令类.奇袭法术按钮:置禁止(true)
    end
    if 战斗界面:奇袭三按钮可更("奇袭特技") then
        战斗界面.奇袭指令类.奇袭特技按钮:置禁止(false)
    else
        战斗界面.奇袭指令类.奇袭特技按钮:置禁止(true)
    end
    if 战斗界面:奇袭三按钮可更("奇袭三药") then
        战斗界面.奇袭指令类.奇袭三药按钮:置禁止(false)
    else
        战斗界面.奇袭指令类.奇袭三药按钮:置禁止(true)
    end
end

local 奇袭返回按钮 = 奇袭指令类:创建我的按钮(__res:getPNGCC(18, 103, 587, 60, 60), "奇袭返回按钮", 200, 70)
function 奇袭返回按钮:左键弹起(x, y)
    战斗界面.奇袭命令下达 = true
    战斗界面.奇袭三按钮 = false  -- 设置奇袭三按钮状态
    战斗界面:置单位身光()  -- 调用置单位身光
    战斗界面.人物指令类:置可见(true)
    战斗界面.奇袭指令类:置可见(false)
    多开数据[当前].__UI界面.窗口层.奇袭界面:置可见(false)
     -- ========== 新增：强制重置操作对象和指令 ==========
    战斗界面.命令类型 = nil
    战斗界面.命令参数 = ""
    战斗界面:重置() -- 强制刷新普通指令界面
    -- ==============================================
end

local 奇袭法术按钮 = 奇袭指令类:创建我的按钮(__res:getPNGCC(18, 21, 670, 60, 60), "奇袭法术按钮", 200, 150)
function 奇袭法术按钮:左键弹起(x, y)
    多开数据[当前].__UI界面.窗口层.奇袭界面:打开(战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].主动技能,"法术",战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].门派)
end

local 奇袭特技按钮 = 奇袭指令类:创建我的按钮(__res:getPNGCC(18, 64, 744, 60, 60), "奇袭特技按钮", 200, 230)
function 奇袭特技按钮:左键弹起(x, y)
    local data={}
    data[1] = 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].特技技能
    data[2] = 战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].奇袭特技
    多开数据[当前].__UI界面.窗口层.奇袭界面:打开(data,"特技",战斗界面.参战单位[战斗界面.单位编号[战斗界面.操作对象]].门派)
end

local 奇袭三药按钮 = 奇袭指令类:创建我的按钮(__res:getPNGCC(18, 103, 670, 60, 60), "奇袭三药按钮", 200, 310)
function 奇袭三药按钮:左键弹起(x, y)
    发送数据(当前,5504.5,{玩家=战斗界面.单位编号[战斗界面.操作对象]})
end

function 战斗界面:奇袭按钮可更()
    if self.奇袭已使用[self.单位编号[self.操作对象]] then
        return false
    end
    
    if self.参战单位~=nil and self.参战单位[self.单位编号[self.操作对象]]~=nil and self.参战单位[self.单位编号[self.操作对象]].单位id ~= 0 then
        if self.参战单位[self.单位编号[self.操作对象]].奇袭三药 then
            return true
        end
        if self.参战单位[self.单位编号[self.操作对象]].奇袭特技 then
            return true
        end
        if self.参战单位[self.单位编号[self.操作对象]].奇袭法术 then
            return true
        end
        return false
    end
    return false
end

function 战斗界面:奇袭三按钮可更(xxx)
    if self.参战单位~=nil and self.参战单位[self.单位编号[self.操作对象]]~=nil and self.参战单位[self.单位编号[self.操作对象]].单位id ~= 0 then
        if self.参战单位[self.单位编号[self.操作对象]][xxx] then
            return true
        end
        return false
    end
    return false
end

function 战斗界面:设置奇袭法术(法术, silllx)
    if nil == 法术 or 法术.剩余冷却回合 then
        return
    end
    self.命令类型 = silllx or "法术"
    self.命令参数 = 法术.名称
    local 临时种类 = 取技能信息(法术.名称)
    self.法术名称 = 法术.名称
    self.命令附加 = 临时种类[3]
    self.命令版面 = false
    self.法术开关 = false
    if self.命令附加==2 then
        self.奇袭命令下达 = false
        print("=====设置奇袭法术====")
        if self.单位编号 and self.单位编号[self.操作对象] then
            self.奇袭已使用[self.单位编号[self.操作对象]] = true
        end
        
        self.奇袭命令下达 = false
        self.奇袭总显示 = false
        self.奇袭三按钮 = false
        self:置单位身光()

        -- self:设置奇袭指令(self.单位编号[self.操作对象])
    else
        self.奇袭命令下达 = true
        self.奇袭总显示 = false
        self.奇袭三按钮 = false
        self:置单位身光()

        self.操作重置(self)
    end
    self.奇袭命令下达 = true
    self.奇袭总显示 = false
    self.奇袭三按钮 = false  -- 重置奇袭三按钮状态
    self:置单位身光()  -- 调用置单位身光
end

function 战斗界面:设置奇袭指令(编号)
    self.奇袭命令下达 = false
    if self.参战单位[self.单位编号[self.操作对象]]~=nil and self:奇袭指令未有(self.操作对象) then
        if self.奇袭指令[self.操作对象] then
            self.奇袭指令[self.操作对象] = {类型=self.命令类型,目标=编号,敌我=0,参数=self.命令参数,附加=self.命令附加}
        end
    end
    -- 标记当前单位已使用奇袭
    if self.单位编号 and self.单位编号[self.操作对象] then
        self.奇袭已使用[self.单位编号[self.操作对象]] = true
    end

    self.重置(self)
end

function 战斗界面:奇袭指令未有(编号)
    if self.奇袭指令[编号] and self.奇袭指令[编号].类型 then
        return false
    end
    return true
end

function 战斗界面:设置奇袭道具(编号, 对象)
    self.命令类型 = "道具"
    self.命令附加 = 对象
    self.命令参数 = 编号
    if 2 == self.命令附加 then
        print("======设置奇袭道具======")
        -- self:设置指令0(self.单位编号[self.操作对象])
    else
        self.操作重置(self)
    end
    self.奇袭命令下达 = true
    self.奇袭总显示 = false
    self.奇袭三按钮 = false  -- 重置奇袭三按钮状态
    self:置单位身光()  -- 调用置单位身光
end