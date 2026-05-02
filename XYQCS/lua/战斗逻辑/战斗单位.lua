--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-06-27 06:51:06
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-08-06 15:55:45
FilePath: \XYQCS\lua\战斗逻辑\战斗单位.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
local 战斗单位 = class('战斗单位')
local function 排序(a, b) return a.cp > b.cp end
local ggf = require('GGE.函数')
local 阵法位置 = require("战斗逻辑/战斗位置")
function 战斗单位:初始化(当前)
	self.当前 = 当前
	self.伤害图片 = 多开数据[self.当前].__主控.战斗文字[1]
	self.回复图片 = 多开数据[self.当前].__主控.战斗文字[2]
	self.暴击图片 = 多开数据[self.当前].__主控.战斗文字[4]
	self.法术暴击图片 = 多开数据[self.当前].__主控.战斗文字[6]
	self.免疫 = 多开数据[self.当前].__主控.躲避
	self.反弹 = 多开数据[self.当前].__主控.躲避
	self.躲避 = 多开数据[self.当前].__主控.躲避

	self.偷袭动画 = {}
	self.偷袭动画.显示=false
	self.偷袭动画.显示2=false
	self.偷袭动画.xy={x=0,y=0}
	self.偷袭动画.xy2={x=0,y=0}
	self.偷袭动画.动画=__res:取动画2(__res:取地址('shape/tx/',0x658a8381))
	self.偷袭动画.动画2=__res:取动画2(__res:取地址('shape/tx/',0x658a8381))


end

function 战斗单位:添加特技内容(q)
	self.特技文本 = 分割字符(q)
	self.特技总数 = #self.特技文本
	self.特技序列 = {}
	self.特技次数 = 20
	self.特技间隔 = 4
	for n = 1, #self.特技文本 do
		self.特技序列[n] = {}
		self.特技序列[n].文本 = self.特技文本[n]
		self.特技序列[n].高度 = 0
		self.特技序列[n].x = self.显示xy.x - self.特技总数 * 4
		self.特技序列[n].y = self.显示xy.y
	end
	self.特技顺序 = 1
	self.特技内容开关 = true
	self.关闭计次 = 0
end

function 战斗单位:创建单位(数据, 队伍id, 编号)
	self.编号 = 编号
	self.数据 = 数据

	if 数据.id~=0 and 数据.奇袭特技 then
        self.奇袭特技 = 数据.奇袭特技
    end
    if 数据.id~=0 and 数据.奇袭三药 then
        self.奇袭三药 = 数据.奇袭三药
    end
	
	self.动画 = __战斗动画(self.当前)
	self.动画:创建动画(数据.模型, 数据.类型, 数据.染色方案, 数据.染色组, 数据.变异, 数据.武器, 数据.变身数据, 数据.显示饰品, 数据.炫彩, 数据.炫彩组, 数据.锦衣,数据.副武器)
	self.动作 = "待战"
	self.名称 = 数据.名称
	self.门派 = 数据.门派
	self.单位id = 数据.id
	self.单位类型 = 数据.类型
	self.主动技能 = 数据.主动技能
	self.武器子类 = 数据.武器子类
	self.武器等级 = 数据.等级 or 数据.等级
	self.特技技能 = 数据.特技技能
	self.自动指令 = 数据.自动指令
	self.战意 = 数据.战意
	self.追加法术=数据.披坚执锐
	self.超级战意=数据.超级战意
	self.如意神通=数据.如意神通
	self.智能施法=数据.智能施法
	self.五行珠=数据.五行珠
	self.人参果=数据.人参果
	self.骤雨=数据.骤雨
	self.共生=数据.共生
	self.法宝=数据.法宝
	self.气血 = 数据.气血 or 数据.最大气血
	self.魔法 = 数据.魔法
	self.愤怒 = 数据.愤怒
	self.队伍 = 数据.队伍
	self.黎魂 = 数据.黎魂
	self.战鼓 = 数据.战鼓
	self.一斧开天偏移 = 0
	self.最大气血 = 数据.最大气血
	self.气血上限 = 数据.气血上限 
	self.丸子time = {开关 = true,时间=os.time() + 7}
	self.丸子进化 = 数据.丸子进化
	self.超级夜战 = 数据.超级夜战
	self.超反击伤害 = 数据.超反击伤害
	self.超级偷袭 = 数据.超级偷袭
	self.色相变身 = 0
	self.门派 = 数据.门派
	名字16:置颜色(95, 218, 102)
	self.名称精灵 = 名字16:取精灵(self.名称)
	self.名称py = math.floor(0 - self.名称精灵.宽度 / 2)
	local 位置
	if 数据.队伍 == 多开数据[self.当前].__战斗主控.队伍id then
		self.初始方向 = 3
		self.敌我 = 1
		self.逃跑方向 = 0
		位置 = 多开数据[self.当前].__战斗主控.我方位置
	else
		self.初始方向 = 0
		self.敌我 = 2
		self.逃跑方向 = 3
		位置 = 多开数据[self.当前].__战斗主控.敌方位置
	end
	if 数据.附加阵法~="普通" then
		if  self.敌我==1 then
			位置=多开数据[self.当前].__战斗主控.阵型位置[数据.附加阵法].我方
		else
			位置=多开数据[self.当前].__战斗主控.阵型位置[数据.附加阵法].敌方
		end
	end

	 if 多开数据[self.当前].__战斗主控.单挑模式 then
		if self.敌我==1 then
			位置=多开数据[self.当前].__战斗主控.阵型位置.单挑.我方
		else
			位置=多开数据[self.当前].__战斗主控.阵型位置.单挑.敌方
		end
	end


	if self.敌我==1 and self.丸子进化 ~= nil and self.丸子time.开关 then
		self.丸子time.开关=false
		self:增加丸子入场(self.丸子进化)
	end
	-- if self.敌我==1 then
	-- 	self.护盾动画 = 
	-- else
	-- 	self.护盾动画 = 
	-- end
	self.浮空动画 = 多开数据[self.当前].__主控.浮空动画
	self.新浮空动画 = 多开数据[self.当前].__主控.新浮空动画
    self.特殊浮空高度 = 0
    self.浮空高度 = 0
	self.方向 = self.初始方向
	self.动画:置方向(self.方向, self.动作)
	self.模型 = 数据.模型
	self.移动坐标 = {}
	self.移动上限 = 30
	self.单位消失 = false
	self.移动频率 = 40
	self.攻击特效 = {}
	self.攻击特效1 = {}
	
	self.法术特效 = {}
	self.状态特效 = {}
	self.掉血开关 = false
	self.披坚开关=false
	self.施法特效开关=false

	self.伤害序列 = {}
	self.捕捉开关 = false
	self.是否显示 = true
	self.保护 = false
	self.友伤 = false
	self.护盾 = 0
	self.护盾开关 = false
	--self.武器宽度 = 0
	self.排序位置 = 数据.位置
	self.招式特效 = 数据.招式特效
    self.挨打坐标={}--C改
	self.影子分身 = {}           -- 存储影子分身动画
    self.影子分身坐标 = {}       -- 存储影子分身的当前坐标
    self.影子分身目标坐标 = {}   -- 存储影子分身的目标坐标
    self.影子分身移动速度 = 5    -- 影子移动速度
	if 数据.武器~=nil and 数据.变身数据 == nil then
		self.武器子类=数据.武器.子类
	end
	self.攻击帧, self.攻击延迟, self.终极帧 ,self.攻击抖动 = 多开数据[self.当前].__主控:取攻击帧(self.模型, self.武器子类)
	self.高度 = self.动画.动画["待战"].高度
	if self.高度 > 120 then
		self.高度 = 120
	elseif self.高度 < 60 then
		self.高度 = 60
	elseif self.高度 < 85 then
		self.高度 = 85
	end
	if self.位置 == 2 then
		self.高度 = self.高度 + 20
	else
		self.高度 = self.高度 + 20
	end
	self.宽度 = self.动画.动画["待战"].宽度
	
	self.移动补偿 = { [0] = 10, [1] = 10 }
	if self.移动补偿[0] < 30 then
		self.移动补偿[0] = 30
	elseif self.移动补偿[1] < 30 then
		self.移动补偿[1] = 30
	elseif self.移动补偿[0] > 100 then
		self.移动补偿[0] = 100
	elseif self.移动补偿[1] > 100 then
		self.移动补偿[1] = 100
	end
	self.显示xy = require("GGE.坐标")(位置[数据.位置].x, 位置[数据.位置].y)
	if self.敌我 == 1 then
		local C补差X, C补差Y = 0, 0
		local R补差X, R补差Y = 0, 0
		C补差X, C补差Y = -160 + (__引擎宽高2(1) - 400), -2 + (__引擎宽高2(2) - 300)
		R补差X, R补差Y = -180 + (__引擎宽高2(1) - 380), -25 + (__引擎宽高2(2) - 280)
		if 数据.位置 <= 5 then --角色
			self.显示xy.x, self.显示xy.y = self.显示xy.x + R补差X, self.显示xy.y + R补差Y
		else --前排 宠物
			self.显示xy.x, self.显示xy.y = self.显示xy.x + C补差X, self.显示xy.y + C补差Y
		end
		self.挨打坐标.x = self.显示xy.x - 90--C改
		self.挨打坐标.y = self.显示xy.y - 35--C改
		self.躲避参数 = 8
		self.躲避坐标 = 2
		self.反震误差 = { x = 50, y = 10 }
		self.逃跑坐标 = 3
	else
		local C补差X, C补差Y = 0, 0
		local R补差X, R补差Y = 0, 0
		C补差X, C补差Y = -75 + (__引擎宽高2(1) - 440), 12 + (__引擎宽高2(2) - 240)
		R补差X, R补差Y = -85 + (__引擎宽高2(1) - 450), 2 + (__引擎宽高2(2) - 250)
		if 数据.位置 <= 5 then --前排 宠物
			self.显示xy.x, self.显示xy.y = self.显示xy.x + R补差X, self.显示xy.y + R补差Y
		else --前排 宠物
			self.显示xy.x, self.显示xy.y = self.显示xy.x + C补差X, self.显示xy.y + C补差Y
		end
		self.挨打坐标.x = self.显示xy.x + 90--C改
		self.挨打坐标.y = self.显示xy.y + 35--C改
		self.反震误差 = { x = -50, y = -10 }
		self.躲避坐标 = -2
		self.躲避参数 = -8
		self.逃跑坐标 = -3
	end

	self.显示xy:floor()
	self.初始xy = require("GGE.坐标")(self.显示xy.x, self.显示xy.y)
	self.飞镖开关 = false
	self.弓弩开关 = false
    self.法术抖动计时 = 0
	self.法术抖动坐标 = {x = 0,y = 0}

	self.攻击次数 = 0
	self.抖动数据 = { 开关 = false, 进程 = 0, x = 0, y = 0 }
	self.显示表 = {}
	self.血条栏 = __res:取精灵(__res:取地址('shape/ui/zd/', 0x4FD9FFF3))
	self.血条上限栏 = __res:取精灵(__res:取地址('shape/ui/zd/', 0x4FD9FFF3)):置颜色(__取颜色("浅黑"))
	self.战意特效 = {}

	self.血条栏:置区域(0, 0, math.floor(self.气血 / self.最大气血 * 36), 4)
	self:增加奇经八脉()
	self.战斗提示={开关=false,内容="",停止时间=0}

end

function 战斗单位:更改模型(模型,类型,染色方案,染色组,变异,武器,变身,饰品,饰品颜色,炫彩,炫彩组,锦衣,名称)--(模型,类型,染色方案,染色组,变异,武器,变身,饰品,饰品颜色,炫彩,炫彩组,技能,锦衣,名称)
	self.动画:创建动画(模型,类型,染色方案,染色组,变异,武器,变身数据,显示饰品,饰品颜色,炫彩,炫彩组,锦衣)
	self.模型 = 模型
	self.攻击帧, self.攻击延迟, self.终极帧 = 多开数据[self.当前].__主控:取攻击帧(self.模型, self.武器子类)
	-- self.高度 = self.动画.动画["待战"].高度
	-- if self.高度 == nil then
	-- 	self.高度 = 80
	-- end
	-- if self.高度 > 120 then
	-- 	self.高度 = 120
	-- elseif self.高度 < 60 then
	-- 	self.高度 = 60
	-- elseif self.高度 < 85 then
	-- 	self.高度 = 85
	-- end
	-- if self.位置 == 2 then
	-- 	self.高度 = self.高度 + 20
	-- else
	-- 	self.高度 = self.高度 + 20
	-- end

	-- self.宽度 = self.动画.动画["待战"].宽度
	self.动画:置方向(self.方向, self.动作)
end

function 战斗单位:更改人物模型(模型,类型,染色方案,染色组,变异,武器,变身数据)
	self.动画:创建动画(模型, 类型, 染色方案, 染色组, 变异,武器,变身数据)
	self.模型 = 模型
	self.攻击帧, self.攻击延迟, self.终极帧,self.攻击抖动 = 多开数据[self.当前].__主控:取攻击帧(self.模型, self.武器子类)
	self.高度 = self.动画.动画["待战"].高度
	if self.高度 == nil then
		self.高度 = 80
	end
	if self.高度 > 120 then
		self.高度 = 120
	elseif self.高度 < 60 then
		self.高度 = 60
	elseif self.高度 < 85 then
		self.高度 = 85
	end
	if self.位置 == 2 then
		self.高度 = self.高度 + 20
	else
		self.高度 = self.高度 + 20
	end
	self.宽度 = self.动画.动画["待战"].宽度
	self.动画:置方向(self.方向, self.动作)
end

function 战斗单位:重置丸子技能(数据)
	self.丸子特效 = nil
	self.丸子time = {开关 = true,时间=os.time() + 3}
	self.丸子进化 = 数据.丸子进化
	self.超反击伤害 = 数据.超反击伤害
	self:增加丸子入场(self.丸子进化)
end

function 战斗单位:增加丸子入场(名称)
	if 名称 then
		local qtb = 取动态技能信息(名称)
		if qtb[7] ~= nil then
			-- self.丸子特效=__res:取图像(__res:取地址("shape/jn/", qtb[8])):到精灵()

			self.丸子特效=__res:取动画(__res:取地址("shape/jn/dt/", qtb[8])):取动画(1):置当前帧(1):播放(true)

		end
	end
end



function 战斗单位:状态是否显示(i)
	local display = true
	if i == "战意1" and self.战意 ~= 1 then
		display = false
	elseif i == "战意2" and self.战意 ~= 2 then
		display = false
	elseif i == "战意3" and self.战意 and self.战意 < 3 then
		display = false
	elseif i == "超级战意1" and self.超级战意 ~= 1 then
		display = false
	elseif i == "超级战意2" and self.超级战意 ~= 2 then
		display = false
	elseif i == "超级战意3" and self.超级战意 and self.超级战意 < 3 then
		display = false
	elseif i == "人参娃娃1" and self.人参娃娃 and self.人参娃娃.层数 and (self.人参娃娃.层数 ~= 1 or self.人参娃娃.回合 <= 0) then
		display = false
	elseif i == "人参娃娃2" and self.人参娃娃 and self.人参娃娃.层数 and (self.人参娃娃.层数 ~= 2 or self.人参娃娃.回合 <= 0) then
		display = false
	elseif i == "人参娃娃3" and self.人参娃娃 and self.人参娃娃.层数 and (self.人参娃娃.层数 < 3 or self.人参娃娃.回合 <= 0) then
		display = false
	elseif i == "风灵" and (self.风灵 == nil or self.风灵 <= 0) then
		display = false
	elseif i == "剑意"  and self.剑意 and self.剑意 <= 0 then
		display = false
	elseif i == "符咒1"  and self.符咒 and self.符咒 ~= 1 then
		display = false
	elseif i == "符咒2"  and self.符咒 and self.符咒 ~= 2 then
		display = false
	elseif i == "符咒3"  and self.符咒 and self.符咒 ~= 3 then
		display = false
	elseif i == "符咒4"  and self.符咒 and self.符咒 ~= 4 then
		display = false
	elseif i == "符咒5"  and self.符咒 and self.符咒 < 5 then
		display = false
	elseif i == "雷法崩裂" and self.雷法崩裂 and self.雷法崩裂 <= 0 then
		display = false
	elseif i == "雷法震煞" and self.雷法震煞 and self.雷法震煞 <= 0 then
		display = false
	elseif i == "雷法坤伏" and self.雷法坤伏 and self.雷法坤伏 <= 0 then
		display = false
	elseif i == "雷法翻天" and self.雷法翻天 and self.雷法翻天 <= 0 then
		display = false
	elseif i == "雷法倒海" and self.雷法倒海 and self.雷法倒海 <= 0 then
		display = false
	elseif i == "灵药红" and self.灵药红 and self.灵药红 <= 0 then
		display = false
	elseif i == "灵药蓝" and self.灵药蓝 and self.灵药蓝 <= 0 then
		display = false
	elseif i == "灵药黄" and self.灵药黄 and self.灵药黄 <= 0 then
		display = false
	elseif i == "五行珠金" and self.五行珠金 and self.五行珠金 <= 0 then
		display = false
	elseif i == "五行珠木" and self.五行珠木 and self.五行珠木 <= 0 then
		display = false
	elseif i == "五行珠水" and self.五行珠水 and self.五行珠水 <= 0 then
		display = false
	elseif i == "五行珠火" and self.五行珠火 and self.五行珠火 <= 0 then
		display = false
	elseif i == "五行珠土" and self.五行珠土 and self.五行珠土 <= 0 then
		display = false
	end
	return display
end

function 战斗单位:取txz(特效)
	if Fighttxz[特效] then
		return Fighttxz[特效]
	end
	if 特效 == "宠物_静" then
		local mt = 取模型(多开数据[当前 or self and self.当前].角色信息.宠物.模型)
		return __res:取动画2(__res:取地址('shape/mx/', mt[1]))
	elseif 特效 == "宠物_走" then
		local mt = 取模型(多开数据[当前 or self and self.当前].角色信息.宠物.模型)
		return __res:取动画2(__res:取地址('shape/mx/', mt[2]))
	else
		return 1.15
	end
end

function 战斗单位:状态前置(特效, 模型)
	if 特效 ~= nil then
		local cp = 1
		local py = { 0, 0 }
		local qianzhi = 1
		if 特效=="苍白纸人" and self.敌我~=1 then
			py = {-6,0}
		    qianzhi = 1
		    return {cp=qianzhi,py=py}
	    elseif 特效 == "紧箍咒" or 特效 == "爪印"or 特效 == "超级紧箍咒" then
			py = {2,-self.高度/2-15}
			return {cp=qianzhi,py=py}
		end
		
		if Fightztqz[特效] then
			cp = Fightztqz[特效].cp and 1 or 2
			py = Fightztqz[特效].py
		end
		if 模型 == "泡泡" or 模型 == "超级泡泡" then
			py[2] = py[2] + 30
		end
		return { cp = cp, py = py }
	end
end

function 战斗单位:法术前置(特效, 模型)
	if 特效 ~= nil then
		local lssj = 特效库(特效)
		local cp = 1
		local py = { 0, 0 }
		if lssj[4] ~= nil then
			-- cp = lssj[4]
			py = { lssj[5], lssj[6] }
			if lssj[6] == 1 then
				py[2] = -self.高度
			elseif lssj[6] == 2 then
				py[2] = math.floor(-self.高度 / 2)
			elseif lssj[6] == 3 then
				py[2] = math.floor(-self.高度 / 3)
			elseif lssj[6] == -1 then
				py[2] = self.高度
			elseif lssj[6] == -2 then
				py[2] = math.floor(self.高度 / 2)
			elseif lssj[6] == -3 then
				py[2] = math.floor(self.高度 / 3)
			end
		end
		-- if cp then
		-- 	cp = 1
		-- else
		-- 	cp = 2
		-- end
		if 模型 == "泡泡" or 模型 == "超级泡泡" then
			py[2] = py[2] + 30
		end
		return cp, py
	end
end

function 战斗单位:无需物理特效(效果)
	if skill无需物理[效果] then
	    return true
	end
	return false
end

function 战斗单位:添加攻击特效(名称, 加速)
	local 名称1 = 名称
	if not self:无需物理特效(名称) then
		local txz = self:取txz(名称)
		-- if 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方] ~= nil and  多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方] .招式特效 ~= nil and  多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方] .招式特效[名称]~= nil and 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方] .招式特效[名称] == true  then
		-- 	local lssj = 特效库("新_"..名称)
		-- 	if lssj[1] ~= nil and lssj[2] ~= nil then
		-- 		名称1 = "新_"..名称1
		-- 	end
		-- end
		self.攻击特效[#self.攻击特效 + 1] = 多开数据[self.当前].__主控:载入特效(名称1, txz)
		self.攻击特效[#self.攻击特效].cp, self.攻击特效[#self.攻击特效].py = self:法术前置(名称, self.模型)
		self.攻击特效[#self.攻击特效]:置提速(txz)
		self.攻击特效[#self.攻击特效].当前帧 = 0
		self.攻击特效[#self.攻击特效].加速更新 = nil
		self.攻击特效[#self.攻击特效].加速更新 = 加速
		
		-- if Fight特效加速[名称1] and Fight特效加速[名称1].加速 then
		-- 	self.攻击特效[#self.攻击特效].加速=Fight特效加速[名称1].加速
		-- end

	end
end
function 战斗单位:添加攻击特效1(名称, 方向)
		local 名称1 = 名称
		local 攻击特效资源 = 取攻击特效(名称)
		self.攻击特效1[#self.攻击特效1 + 1] = __res:取动画2(__res:取地址("shape/tx/sf/",攻击特效资源[1]))
		self.攻击特效1[#self.攻击特效1].当前帧 = 0
		self.攻击特效1[#self.攻击特效1]:置方向(方向)
		self.攻击特效1[#self.攻击特效1].附加y=0
        self.攻击特效1[#self.攻击特效1].附加x=0
		if Fight攻击特效加速[名称1] then
            	self.攻击特效1[#self.攻击特效1].附加y=Fight攻击特效加速[名称1].附加y or 0
            	self.攻击特效1[#self.攻击特效1].附加x=Fight攻击特效加速[名称1].附加x or 0
            	if Fight攻击特效加速[名称1].加速 then
                		self.攻击特效1[#self.攻击特效1].加速=Fight攻击特效加速[名称1].加速
            	end
    	end
end
function 战斗单位:无需法术特效(效果)
	if skill无需法术[效果] then
	    return true
	end
	return false
end

function 战斗单位:添加法术特效(名称, 加速)
	local 名称1 = 名称
	if 名称1 == "干将莫邪" or 名称1 == "混元伞" or 名称1 == "断穹巨剑"
		or 名称1 == "风舞心经" or 名称1 == "赤焰" then
		if self.敌我 == 1 then
			名称1 = 名称1 .. "_我方"
		else
			名称1 = 名称1 .. "_敌方"
		end
	end
	if 名称=="鲲鹏出场" then
	    多开数据[self.当前].__战斗主控.背景状态 = 1
	end
	if not self:无需法术特效(名称) then
		local txz = self:取txz(名称)
		if 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方] ~= nil and 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方].招式特效 ~= nil and 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方].招式特效[名称] ~= nil and 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方].招式特效[名称] == true then
			local lssj = 特效库("新_" .. 名称)
			if lssj[1] ~= nil and lssj[2] ~= nil then
				名称1 = "新_" .. 名称1
				txz = 1.5
			end
		end

		self.法术特效[#self.法术特效 + 1] = 多开数据[self.当前].__主控:载入特效(名称1, txz)
		self.法术特效[#self.法术特效]:置提速(txz)
		self.法术特效[#self.法术特效].cp, self.法术特效[#self.法术特效].py = self:法术前置(名称)
		-- if 名称 == "生命之泉" then
		-- 	self.法术特效[#self.法术特效].py[2] = self.法术特效[#self.法术特效].py[2] - 75
		-- elseif 名称 == "龙腾" then
		-- 	self.法术特效[#self.法术特效].加速 = 0.04
		
		-- elseif 名称 == "超级赐福·五福" or 名称 == "超级赐福·元吉" or 名称 == "超级赐福·双喜" or 名称 == "超级赐福·三合"or 名称 == "超级赐福·四季"or 名称 == "超级赐福·六临"
		-- or 名称 == "超级赐福·七神"or 名称 == "超级赐福·八欲"or 名称 == "超级赐福·九功"or 名称 =="超级赐福·十满" or 名称 == "超级赐福·万利"  then
		-- 	self.法术特效[#self.法术特效].加速 = 0.02
		-- elseif 名称 == "琴音三叠1"  then
		-- 	self.法术特效[#self.法术特效].加速 = 0.6
		-- elseif 名称 == "琴音三叠2"  then
		-- 	self.法术特效[#self.法术特效].加速 = 0.03
		-- elseif 名称 == "琴音三叠3"  then
		-- 	self.法术特效[#self.法术特效].加速 = 0.09
		-- end

		 if Fight特效加速[名称1] then
			self.法术特效[#self.法术特效].py[2]=Fight特效加速[名称1].附加y or 0
			if Fight特效加速[名称1].加速 then
				self.法术特效[#self.法术特效].加速=Fight特效加速[名称1].加速
			end
		end

	else
		多开数据[self.当前].__战斗主控.掉血流程 = nil
	end
end

function 战斗单位:无需状态(效果)
	if skill无需状态[效果] then
	    return true
	end
	return false
end

function 战斗单位:增加状态(名称)
	if 名称 ~= nil then
		local 名称1 = 名称
		if Fightdiwo[名称1] then
			if self.敌我 == 1 then
				名称1 = 名称1 .. "_我方"
			else
				名称1 = 名称1 .. "_敌方"
			end
		end
		self.状态特效[名称] = self:状态前置(名称1, self.模型)
		local qtb = 取技能信息(名称)
		if qtb[1] ~= nil and qtb[6] ~= nil and qtb[7] ~= nil then
			self.状态特效[名称].小图标 = __res:取精灵(__res:取地址('shape/jn/', qtb[8]))
			self.状态特效[名称].介绍 = qtb[1]
		else
			self.状态特效[名称].小图标 = __res:取精灵(__res:取地址('shape/jn/', 3143201775))
			self.状态特效[名称].介绍 = 名称 .. "这个技能暂时没有添加提示请截图给管理员"
		end
		if not self:透明状态("状态_" .. 名称1) and not self:无需状态(名称1) and 特效库("状态_" .. 名称1) then
			self.状态特效[名称].动画 = 多开数据[self.当前].__主控:载入特效("状态_" .. 名称1, self:取txz(名称)):置循环(true)
			if type(self.状态特效[名称].动画) == "table" and self.状态特效[名称].动画[1] and self.状态特效[名称].动画[2] then
				self.状态特效[名称].动画[1].cp, self.状态特效[名称].动画[1].py = self.状态特效[名称].cp, self.状态特效[名称].py
				self.状态特效[名称].动画[2].cp, self.状态特效[名称].动画[1].py = self.状态特效[名称].cp, self.状态特效[名称].py
			else
				self.状态特效[名称].动画.cp, self.状态特效[名称].动画.py = self.状态特效[名称].cp, self.状态特效[名称].py
			end
		end
		 if 名称=="护盾" and self.状态特效["铜头铁臂"]~=nil then
			if self.状态特效["铜头铁臂"].颜色=="青" then
				self.状态特效["护盾"].动画:置颜色(0xFF00FFFF)--青色
			elseif self.状态特效["铜头铁臂"].颜色=="红" then
				self.状态特效["护盾"].动画:置颜色(0xFFFF1111)--红色
			end
		end
	end
end

function 战斗单位:加载特效(名称)
	local txz = self:取txz(名称)
	local 名称1 = 名称
	local cp = 多开数据[self.当前].__主控:载入特效(名称1, txz, 不显示)
	cp:置提速(txz)
	return cp
end

function 战斗单位:透明状态(效果)
	local xxg = false
	if 效果 == "状态_金刚护法" then
		xxg = true
	end
	return xxg
end

function 战斗单位:增加奇经八脉()
	-- if self.门派 == "凌波城" then
	-- 	self:增加状态("战意1")
	-- 	self:增加状态("战意2")
	-- 	self:增加状态("战意3")
	-- 	if self.经脉流派 == "灵霄斗士" then
	-- 		self:增加状态("超级战意1")
	-- 		self:增加状态("超级战意2")
	-- 		self:增加状态("超级战意3")
	-- 	end
	if self.门派 == "神木林" then
		if self.经脉流派 == "灵木药宗" then
			self:增加状态("灵药红")
			self:增加状态("灵药蓝")
			self:增加状态("灵药黄")
		else
			self:增加状态("风灵")
		end
	elseif self.门派 == "方寸山" and self.经脉流派 == "五雷正宗" then
		self:增加状态("符咒1")
		self:增加状态("符咒2")
		self:增加状态("符咒3")
		self:增加状态("符咒4")
		self:增加状态("符咒5")
		self:增加状态("雷法崩裂")
		self:增加状态("雷法震煞")
		self:增加状态("雷法坤伏")
		self:增加状态("雷法翻天")
		self:增加状态("雷法倒海")
	elseif self.门派 == "普陀山" and self.经脉流派 == "落伽神女" then
		self:增加状态("五行珠金")
		self:增加状态("五行珠木")
		self:增加状态("五行珠水")
		self:增加状态("五行珠火")
		self:增加状态("五行珠土")
	elseif self.门派 == "五庄观" and self.经脉流派 == "万寿真仙" then
		self:增加状态("人参娃娃1")
		self:增加状态("人参娃娃2")
		self:增加状态("人参娃娃3")
	elseif self.门派 == "大唐官府" and self.经脉流派 == "无双战神" then
		self:增加状态("剑意")
	end
end

function 战斗单位:更新奇经八脉(sj)
	for k, v in pairs(self.奇经八脉) do
		self.奇经八脉[k].层数 = sj[k]
	end
end

-- function 战斗单位:取移动坐标(类型, 攻击编号)
-- 	if 类型 == "挨打" then
-- 		if self.敌我 == 1 then
-- 			return require("GGE.坐标")(self.初始xy.x-80, self.初始xy.y-40)---对手攻击位置
-- 		else
-- 			return require("GGE.坐标")(self.初始xy.x+80, self.初始xy.y+40)
-- 		end
-- 	elseif 类型 == "保护" then
-- 		return require("GGE.坐标")(self.显示xy.x, self.显示xy.y)
-- 	elseif 类型 == "友伤" then
-- 		return require("GGE.坐标")(self.显示xy.x, self.显示xy.y)
-- 	elseif 类型 == "返回" then
-- 		return require("GGE.坐标")(self.初始xy.x, self.初始xy.y)
-- 	end
-- end

function 战斗单位:取移动坐标(类型,攻击编号)--C改
	if 类型 == "挨打" then
		return self.挨打坐标.x , self.挨打坐标.y
	elseif 类型 == "友伤" then
		return self.显示xy.x,self.显示xy.y
	elseif 类型 == "保护" then
		return self.显示xy.x,self.显示xy.y
	elseif 类型 == "返回" then
		return self.初始xy.x,self.初始xy.y
	end
end

function 战斗单位:回合结束重置()
	self.攻击次数 = 0
	if self.初始方向 ~= self.方向 then
		self.方向 = self.初始方向
		self.动画:置方向(self.初始方向, self.动作)
	end
end

function 战斗单位:换动作(动作, 复原)
	if 动作 == "攻击" then
		self.攻击次数 = self.攻击次数 + 1
		if self.攻击次数 % 2 == 0 then
			动作 = "攻击2"
		end
		self.动画:置帧率(动作,0.1)
	end
	self.动作 = 动作
	self.动画:置方向(self.偷袭方向 or self.方向, self.动作)
	self.动作复原 = 复原
	self.更新次数 = 0
	local 临时模型 = self.数据.模型
	if self.数据.类型 == "角色" or self.数据.类型 == "系统角色" then
		if self.数据.武器 ~= nil then
			if self.数据.武器.名称 == "龙鸣寒水" or self.数据.武器.名称 == "非攻" then
				local wq = "弓弩1"
				临时模型 = 临时模型 .. "_" .. wq
			else
				local wq = 多开数据[self.当前].__主控:取武器子类(self.数据.武器.子类)
				临时模型 = 临时模型 .. "_" .. wq
			end
		end
	end
	if 动作=="施法" and self.数据.类型=="角色" and self.数据.锦衣[6] ~= nil then
    	self:设置施法特效()
    end

	if self.数据.变身数据~=nil and __res.配置.显示变身造型 == 1 then
		临时模型=self.数据.变身数据
	end
	
	local 临时音乐 = 取音效(临时模型)
	if 临时音乐.攻击 ~= nil then
		if self.数据.模型=="影精灵" then
		临时音乐.攻击2 = 临时音乐.攻击2
		else
		临时音乐.攻击2 = 临时音乐.攻击
		end
	end
	if 临时音乐 ~= nil and 临时音乐[动作] ~= nil and self.当前 == 多开数据.当前 then
		多开数据[self.当前].__主控:播放动作音乐(临时音乐.资源, 临时音乐[动作])
	end

	-- if 临时音乐 ~= nil and 临时音乐.攻击音 ~= nil and self.当前 == 多开数据.当前 and (self.动作=="攻击" or self.动作=="攻击2") then
	-- 	多开数据[self.当前].__主控:播放动作音乐(临时音乐.资源, 临时音乐.攻击音)
	-- end
	if 临时音乐 ~= nil and 临时音乐.施法音 ~= nil and self.当前 == 多开数据.当前 and self.动作=="施法"  then
		多开数据[self.当前].__主控:播放动作音乐(临时音乐.资源, 临时音乐.施法音)
	end
	-- if 动作=="待战" and self.敌我 == 2 then
	-- 	self.显示xy=DeepCopy(self.初始xy)----C改影响对方横扫
	-- end
end

function 战斗单位:设置施法特效()
    local xn = 取施法特效(self.数据.锦衣[6].名称)
	self.施法特效1 = __res:取动画2(__res:取地址("shape/tx/sf/",xn[1]))
    self.施法特效开关=true
end

function 战斗单位:换方向(方向)
	self.动画:置方向(方向, self.动作)
end

function 战斗单位:取当前帧()
	return self.动画:取当前帧(self.动作)
end

function 战斗单位:取结束帧()
	return self.动画:取结束帧(self.动作)
end

function 战斗单位:取开始帧()
	return self.动画:取开始帧(self.动作)
end

function 战斗单位:取间隔()
	return self.动画.动画[self.动作]:取当前帧()
end

function 战斗单位:取中间()
	return self.动画.动画[self.动作]:取帧数() / 2
end

function 战斗单位:取状态()
	if self.移动开关 or self.击退开关 or self.击飞开关 or self.倒地开关 or self.返回开关 or self.躲避开关 or self.飞镖开关 or self.弓弩开关 then
	-- if self.移动开关 or self.击退开关 or self.击飞开关 or self.倒地开关 or self.返回开关 or self.躲避开关 or self.飞镖开关 or self.弓弩开关 or self.掉血开关 then
		return false
	else
		return true
	end
end

function 战斗单位:取施法完毕()
	if self.动作 == "施法" then
		if self:取当前帧() >= math.floor(self:取结束帧() * 0.5) then
			return true
		else
			return false
		end
	else
		return true
	end
end

function 战斗单位:设置飞镖(xy, 方向, 伤害, 死亡, 名称)
	self.飞镖动画 = 多开数据[self.当前].__主控:载入特效(名称, self:取txz(名称))
	self.飞镖xy = require("GGE.坐标")(xy.x, xy.y)
	self.飞镖xy.伤害 = 伤害
	self.飞镖xy.死亡 = 死亡
	self.飞镖动画:置方向(direction8(self.飞镖xy:取角度(self.显示xy.x, self.显示xy.y)))
	self.飞镖开关 = true
end

function 战斗单位:设置弓弩(xy, 方向, 名称)
	self.弓弩动画 = 多开数据[self.当前].__主控:载入特效("弓弩3", self:取txz("弓弩3"))

	self.弓弩xy = require("GGE.坐标")(xy.x, xy.y)
	local 方向 = direction8(self.弓弩xy:取角度(self.显示xy.x, self.显示xy.y))
	-- print(方向1,方向)
	self.弓弩动画:置方向(方向)
	self.弓弩开关 = true
end

function 战斗单位:抖动挨打音效()---C改
	
	local 临时模型=self.数据.模型
	if self.数据.类型=="角色" or self.数据.类型=="系统角色" then
		if self.数据.武器~=nil  then
			if self.数据.武器.名称 == "龙鸣寒水" or self.数据.武器.名称 == "非攻" then
				local wq = "弓弩1"
				临时模型=临时模型.."_"..wq
			else
				local wq = 多开数据[self.当前].__主控["取武器子类"](多开数据[self.当前].__主控, self.数据["武器"]["子类"])
				临时模型=临时模型.."_"..wq
			end
		end
	end
	if self.数据.变身数据~=nil then
		临时模型=self.数据.变身数据
	end
	-- 多开数据[self.当前].__主控:播放特效音乐(取音效("挨打"))
	local 临时音乐=取音效(临时模型)
	if 临时音乐 ~= nil and 临时音乐.挨打 ~= nil  then
		多开数据[self.当前].__主控:播放动作音乐(临时音乐.资源, 临时音乐.挨打)
	end

end

-- function 战斗单位:开启击退(死亡)
-- 	self.击退开关 = true
-- 	self.击退延迟 = true
-- 	self.偏移类型 = 1
-- 	self.停止偏移 = 30
-- 	self.死亡参数 = 死亡
-- 	self.击退坐标 = require("GGE.坐标")(self.显示xy.x, self.显示xy.y)
-- 	if self.敌我 == 2 then
-- 		self.偏移坐标 = -1
-- 		if self.死亡参数 ~= 0 then
-- 			self.偏移坐标 = -1
-- 		end
-- 	else
-- 		self.偏移坐标 = 1
-- 		if self.死亡参数 ~= 0 then
-- 			self.偏移坐标 = 1
-- 		end
-- 	end
-- end

function 战斗单位:开启击退(死亡,x,y)
	self.攻击方有三荒尽灭 = false
    if 多开数据[self.当前].__战斗主控.战斗流程 and 多开数据[self.当前].__战斗主控.战斗流程[1] and 多开数据[self.当前].__战斗主控.战斗流程[1].攻击方 then
    	if 多开数据[self.当前].__战斗主控.战斗单位 and 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方] then
        	local 攻击方 = 多开数据[self.当前].__战斗主控.战斗单位[多开数据[self.当前].__战斗主控.战斗流程[1].攻击方]
            if 攻击方.招式特效 and 攻击方.招式特效["三荒尽灭"] then
                self.攻击方有三荒尽灭 = true
            end
		end
    end

    if self.模型=="木桩" then
	    self.击退开关=false
	    self.物理抖动开关 = false
	    if 死亡~=nil then
	    	self.是否显示=false
	    end
	    return
	end
	if x==nil or y ==nil or x==self.显示xy.x then
	    self.斜率 = 0.1
	else
		self.斜率 = (y-self.显示xy.y)/(x-self.显示xy.x)
	end
	self.斜率=(string.format("%.2f", self.斜率))+0 --保留两位小数


    self.击退开关=true
	self.击退延迟=true
	--法术抖动
	self.法术抖动计时 = 0
	self.抖动延时 = nil
	-- self.受击法术名称 = nil
	self.法术抖动坐标 = {x =0,y =0}
	self.法术抖动开关 = nil
	--物理抖动
	self.物理抖动开关 = false
	--物理抖动
	self.偏移类型=1
	-- self.停止偏移=30
	self.死亡参数=死亡
	-- if self.死亡参数==1 then
	-- 	self.停止偏移=30
	-- else
		self.停止偏移=25

	-- end
	-- if self.动作~="防御" then
	-- self.动作="被击中"
	--self.动画.按帧更新=true
	--end
	--self.动画:换方向(self.动作,self.初始方向)
	self.击退坐标={}
	self.击退坐标.x,self.击退坐标.y=self.显示xy.x,self.显示xy.y
	if self.敌我==2 then
		self.偏移坐标=-1
		if self.死亡参数~=nil then --死亡的时候
			self.偏移坐标=-0.8
		end
	else
		self.偏移坐标=1
		if self.死亡参数~=nil then --死亡的时候
			self.偏移坐标=0.8
		end
	end
	if 死亡 then
    	self.浮空高度 = 0
		self.浮空开关 = false
		self.浮空下降 = 0
    end
end
function 战斗单位:击退处理()
    if self.偏移类型==1 then
		-- print(self.偏移坐标)
		self.显示xy.x,self.显示xy.y=self.显示xy.x+self.偏移坐标,self.显示xy.y+self.偏移坐标
		if(取两点距离(生成XY(self.击退坐标.x,self.击退坐标.y),生成XY(self.显示xy.x,self.显示xy.y))>self.停止偏移)then
			self.偏移类型=2
			if self.死亡参数==1 then
				self:死亡处理()
				self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
				self.偏移类型=0
				self.击退开关=false
			else
				-- self.动作="待战"
				--self:换动作(self.动作,nil,nil)
				if self.敌我==2 then
					self.偏移坐标=-1
					if self.死亡参数~=0 then
						self.偏移坐标=-2.5
					end
				else
					self.偏移坐标=1
					if self.死亡参数~=0 then
						self.偏移坐标=2.5
					end
				end
				self.偏移类型=2
			end
		end
	elseif self.偏移类型==2 then
		self.显示xy.x,self.显示xy.y=self.显示xy.x-self.偏移坐标,self.显示xy.y-self.偏移坐标
		if(取两点距离(生成XY(self.击退坐标.x,self.击退坐标.y),生成XY(self.显示xy.x,self.显示xy.y))<=10)then
			self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
			self.偏移类型=0
			self.击退开关=false
			-- self.动画.按帧更新=false
			self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
			if self.死亡参数==2  then
				self:死亡处理()
			else
				self.动作="待战"
				self:换动作(self.动作,nil,nil)
			end
		end
	end
end
-- function 战斗单位:击退处理()
-- 	if self.偏移类型 == 1 then
-- 		self.显示xy.x, self.显示xy.y = self.显示xy.x + self.偏移坐标, self.显示xy.y + self.偏移坐标
-- 		if self.显示xy:取距离(self.击退坐标) > self.停止偏移 then
-- 			self.偏移类型 = 2
-- 			if self.死亡参数 == 1 then
-- 				self:死亡处理()
-- 				self.显示xy.x, self.显示xy.y = self.击退坐标.x, self.击退坐标.y
-- 				self.偏移类型 = 0
-- 				self.击退开关 = false
-- 				self.偏移类型 = 0
-- 			else
-- 				-- self.动作="待战"
-- 				--self:换动作(self.动作,nil,nil)
-- 				if self.敌我 == 2 then
-- 					self.偏移坐标 = -1
-- 					if self.死亡参数 ~= 0 then
-- 						self.偏移坐标 = -2
-- 					end
-- 				else
-- 					self.偏移坐标 = 1
-- 					if self.死亡参数 ~= 0 then
-- 						self.偏移坐标 = 2
-- 					end
-- 				end
-- 				self.偏移类型 = 2
-- 			end
-- 		end
-- 	elseif self.偏移类型 == 2 then
-- 		self.显示xy.x, self.显示xy.y = self.显示xy.x - self.偏移坐标, self.显示xy.y - self.偏移坐标
-- 		if self.显示xy:取距离(self.击退坐标) <= 10 then
-- 			self.偏移类型 = 0
-- 			self.击退开关 = false
-- 			self.动画.按帧更新 = false
-- 			self.显示xy.x, self.显示xy.y = self.击退坐标.x, self.击退坐标.y
-- 			if self.死亡参数 == 2 then
-- 				self:死亡处理()
-- 			else
-- 				self.动作 = "待战"
-- 				self:换动作(self.动作, nil, nil)
-- 				self.动画:置方向(self.方向, self.动作)
-- 			end
-- 		end
-- 	end
-- end

function 战斗单位:死亡处理1(死亡)
	self.死亡参数 = 死亡
	self:死亡处理()
end

function 战斗单位:死亡处理()
	self.死亡开关=true
	if self.死亡参数==1 then
		self.撞击次数=0
		self.击飞开关=true
		self.击飞时间=取游戏时间()
		self.速度x,self.速度y=0,0
		-- self.动画.按帧更新=true
		if not self.斜率 then
		    self.斜率=0.1
		end
		if self.敌我==2 then --敌方
			if self.斜率<0.74 then --往左
				self.速度x = -16
				self.速度y = self.斜率*self.速度x
			else--往上
				self.速度y = -16*2
				if self.斜率==0 then
				    self.斜率=6.7
				end
				self.速度x = -16/self.斜率
			end
		else
			-- print(self.斜率)
			if self.斜率<0.74 then --往右
				self.速度x = 16
				self.速度y = self.斜率*self.速度x
			else--往下
				self.速度y = 16
				if self.斜率==0 then
				    self.斜率=6.7
				end
				self.速度x = 16/self.斜率
			end
		end
        多开数据[self.当前].__主控["播放特效音乐"](多开数据[self.当前].__主控, 取音效("击飞"))
		
	elseif self.死亡参数 == 2 then
		self.动作 = "死亡"
		local 临时模型=self.数据.模型
	    if self.数据.变身数据~=nil then
	      临时模型=self.数据.变身数据
	    end
		local 临时音乐 = 取音效(临时模型)
	if 临时音乐.死亡 ~= nil then
		临时音乐.死亡 = 临时音乐.死亡
	end
	if 临时音乐 ~= nil and 临时音乐[self.动作] ~= nil and self.当前 == 多开数据.当前 then
		多开数据[self.当前].__主控:播放动作音乐(临时音乐.资源, 临时音乐[self.动作])
	end
		self:换方向(self.方向)
		self.倒地开关 = true
	end
end

function 战斗单位:倒地处理()
	--print(self.动作,self.动画:取当前帧(self.动作),self.动画:取开始帧(self.动作),self.动画:取结束帧(self.动作))
	if self.动画:取当前帧(self.动作) == self.动画:取结束帧(self.动作) then
		self.动作 = "死亡"
		self.倒地开关 = false
	end
end
function 战斗单位:击飞处理()
    self.显示xy.x,self.显示xy.y=self.显示xy.x+self.速度x,self.显示xy.y+self.速度y
	if 取游戏时间()-self.击飞时间>=0.005 then
		self.方向=self.方向-0.1

		if  self.方向<3 and  self.模型=="自在天魔法杖" 	or	 self.模型=="自在天魔" 		or
			self.模型=="自在天魔弓弩" 	or	 self.模型=="自在天魔斧钺" 	or
			self.模型=="自在天魔宝珠" 	or	 self.模型=="自在天魔经筒" 	or
			self.模型=="自在天魔宝剑" 	or	 self.模型=="自在天魔_身体" 	or
			self.模型=="自在天魔刀"   	or	 self.模型=="自在天魔刀_金" 	or
			self.模型=="自在天魔弓弩_金" 	or	 self.模型=="自在天魔斧钺_金" or
			self.模型=="自在天魔宝珠_金" 	or	 self.模型=="自在天魔经筒_金" or
			self.模型=="自在天魔宝剑_金" 	or	 self.模型=="自在天魔宝剑_金" or
			self.模型=="自在天魔法杖_金" or self.模型=="魔化涂山雪" then
			 self.方向=0
			 end
			 
		if self.方向<0 then self.方向=3 end
		self.击飞时间=取游戏时间()
		self:换方向(self.方向)
	end
	if self.显示xy.x<10 then
		self.速度x = - self.速度x-- * 1.5
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.显示xy.y<10 then
		self.速度y = - self.速度y --* 1.5
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.显示xy.x>引擎["宽度"]-10 then
		self.速度x = - self.速度x --* 2
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.显示xy.y>引擎["高度"]-10 then
		self.速度y = - self.速度y-- * 2
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.撞击次数 >=3 then
		self.击飞开关=false
		self.是否显示=false
	end
end

function 战斗单位:返回事件()
    if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>=20 then
		-- self.攻击次数 = 0
		self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),15)
		if not self.方向开关 then
			self.动作="返回"
			-- self.动画:置帧率(self.动作,0.02)
			self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
			self:换方向(角度算四方向(self.角度))
			self.方向开关=true
		end
		if self.超级偷袭 then
			self.偷袭动画.动画.当前帧=1
			self.偷袭动画.显示=true
			self.偷袭动画.显示2=true
			self.偷袭动画.xy.x, self.偷袭动画.xy.y = self.显示xy.x, self.显示xy.y
			self.偷袭动画.xy2.x, self.偷袭动画.xy2.y = self.显示xy.x, self.显示xy.y
			self.显示xy.x, self.显示xy.y = self.移动坐标.x, self.移动坐标.y
		else
			self.显示xy.x, self.显示xy.y = self.移动距离.x, self.移动距离.y
		end

	else
		self.返回开关=false
		self.动作="待战"
		self:换方向(self.初始方向)
        -- print(self.初始方向)
		self.显示xy.x,self.显示xy.y=self.初始xy.x,self.初始xy.y
		self.方向开关=false
        self.一斧开天偏移 = 0

	end
end

function 战斗单位:置影子分身(小类, 大类)
    if not self.影子分身 then
        self.影子分身 = {}
        self.影子分身坐标 = {}
        self.影子分身目标坐标 = {}
        self.影子分身移动速度 = 5
    end
    self.影子分身[小类] = __res:取动画2(__res:取地址("shape/mx/", 0x01011007))
    self.影子分身坐标[小类] = {x = self.显示xy.x, y = self.显示xy.y}
    self.影子分身目标坐标[小类] = self:取影子坐标(小类, 大类) or {x = 0, y = 0}
	self.影子分身[小类]:置颜色(0, 0, 0, 255)
	if self.敌我 == 2 then
    	self.影子分身[小类]:置方向(2)
	else
    	self.影子分身[小类]:置方向(1)
	end
end

function 战斗单位:取影子坐标(小类, 大类)
    local 临时数据 = {
        [1] = {
            [1] = {x = self.显示xy.x + 330+150, y = self.显示xy.y + 220+40},
            [2] = {x = self.显示xy.x + 250+150, y = self.显示xy.y + 220+40},
            [3] = {x = self.显示xy.x + 350+150, y = self.显示xy.y + 150+40},
            [4] = {x = self.显示xy.x + 150+150, y = self.显示xy.y + 250+40},
            [5] = {x = self.显示xy.x + 450+150, y = self.显示xy.y + 50+40},
            [6] = {x = self.显示xy.x + 400+150, y = self.显示xy.y + 600+40}
        },
        [2] = {
            [1] = {x = self.显示xy.x + 400+150, y = self.显示xy.y + 110+40},
            [2] = {x = self.显示xy.x + 400+150, y = self.显示xy.y + 200+40},
            [3] = {x = self.显示xy.x + 100+150, y = self.显示xy.y + 300+40},
            [4] = {x = self.显示xy.x + 320+150, y = self.显示xy.y + 300+40},
            [5] = {x = self.显示xy.x + 50+150, y = self.显示xy.y + 250+40},
            [6] = {x = self.显示xy.x + 0+150, y = self.显示xy.y + 300+40}
        },
        [3] = {
            [1] = {x = self.显示xy.x - 100+150, y = self.显示xy.y + 250+40},
            [2] = {x = self.显示xy.x + 210+150, y = self.显示xy.y + 300+40},
            [3] = {x = self.显示xy.x + 450+150, y = self.显示xy.y - 100+40},
            [4] = {x = self.显示xy.x + 480+150, y = self.显示xy.y + 150+40},
            [5] = {x = self.显示xy.x + 400+150, y = self.显示xy.y + 0+40},
            [6] = {x = self.显示xy.x + 480+150, y = self.显示xy.y + 280+40}
        }
    }
    if self.敌我 == 1 then
			临时数据 = {
			[1] = {
				[1] = {x = self.显示xy.x - 330-150, y = self.显示xy.y - 220+40},
				[2] = {x = self.显示xy.x - 250-150, y = self.显示xy.y - 220+40},
				[3] = {x = self.显示xy.x - 350-150, y = self.显示xy.y - 150+40},
				[4] = {x = self.显示xy.x - 150-150, y = self.显示xy.y - 250+40},
				[5] = {x = self.显示xy.x - 450-150, y = self.显示xy.y - 50+40},
				[6] = {x = self.显示xy.x - 400-150, y = self.显示xy.y - 600+40}
			},
			[2] = {
				[1] = {x = self.显示xy.x - 400-150, y = self.显示xy.y - 110+40},
				[2] = {x = self.显示xy.x - 400-150, y = self.显示xy.y - 200+40},
				[3] = {x = self.显示xy.x - 100-150, y = self.显示xy.y - 300+40},
				[4] = {x = self.显示xy.x - 320-150, y = self.显示xy.y -300+40},
				[5] = {x = self.显示xy.x - 50-50, y = self.显示xy.y - 250+40},
				[6] = {x = self.显示xy.x - 0-150, y = self.显示xy.y - 300+40}
			},
			[3] = {
				[1] = {x = self.显示xy.x - 100-150, y = self.显示xy.y - 250+40},
				[2] = {x = self.显示xy.x - 210-150, y = self.显示xy.y - 300+40},
				[3] = {x = self.显示xy.x - 450-150, y = self.显示xy.y - 100+40},
				[4] = {x = self.显示xy.x - 480-150, y = self.显示xy.y -150+40},
				[5] = {x = self.显示xy.x - 400-150, y = self.显示xy.y - 0+40},
				[6] = {x = self.显示xy.x - 480-150, y = self.显示xy.y -280+40}
			}
		}
	end
    return 临时数据[大类] and 临时数据[大类][小类]
end


function 战斗单位:移动计算(战斗流程, 挨打方)
    local 临时移动 = 挨打方["取移动坐标"](挨打方, "挨打", 战斗流程["攻击方"])
    local 距离 = 0
    local 距离2 = 0
    if 1 == self.敌我 then
        距离2 = self.移动补偿[self.攻击次数]
        距离 = 30
    else
        距离2 = 0 - self.移动补偿[self.攻击次数]
        距离 = -30
    end
    if self.显示xy["取距离"](self.显示xy, 临时移动.x + 距离2, 临时移动.y + 距离) >= 55 then
        self.移动开关 = true
        self.移动坐标 = 临时移动
    end
end

function 战斗单位:移动事件()
    if self.武器子类 ~= nil and self.武器子类 == 14 and not self.保护 then
		self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
		self.方向=角度算四方向(self.角度)
		self.动画:置方向(角度算四方向(self.角度),self.动作)
		self.移动开关=false
		self.友伤=false
		return
	end
	if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>15 then
		if self.攻击次数>0 then
		    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),12) --6
		else
		    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),16) --27
		end
		if not self.方向开关 then
			self.动作="跑去"
			-- self.动画:置帧率(self.动作,0.04)
			self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
			-- self.方向=角度算四方向(self.角度)
			self.方向=3--C改 暂时
			self.一斧开天偏移=0
			self.动画:置方向(self.方向,self.动作)
			self.方向开关=true
		end
		
		if self.超级偷袭 then 
			self.偷袭动画.动画.当前帧=1
			self.偷袭动画.显示=true
			self.偷袭动画.xy.x, self.偷袭动画.xy.y = self.显示xy.x, self.显示xy.y
			self.偷袭动画.xy2.x, self.偷袭动画.xy2.y = self.显示xy.x, self.显示xy.y
			self.显示xy.x, self.显示xy.y = self.移动坐标.x, self.移动坐标.y
		else
			self.显示xy.x, self.显示xy.y = self.移动距离.x, self.移动距离.y
		end

	else
		-- self.方向=2
		self.方向=self.初始方向--角度算四方向(self.角度)
		if self.超级偷袭 then
			if self.方向 == 3 then
				self.方向 = 0
			-- elseif self.方向 == 0 then
				-- self.方向 = 2
			end
		end
		self.动画:置方向(self.方向,self.动作)
		-- self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
		-- self.方向=角度算四方向(self.角度)
		-- self.动画:置方向(self.方向,self.动作)
        -- self.角度 = self.显示xy["取角度"](self.显示xy, self.移动坐标.x, self.移动坐标.y)
		self.移动开关=false
		self.移动坐标 = {}
        self.方向开关=false
	end
end

function 战斗单位:保护事件()
    if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>=20 then
      self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),10)
      self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
      self.方向=角度算四方向(self.角度)
      self.动画:置方向(角度算四方向(self.角度),self.动作)
      self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
    else
      self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
      self.方向=角度算四方向(self.角度)
      self.动画:置方向(角度算四方向(self.角度),self.动作)
      self.移动开关=false
      self.保护=false
      self.移动坐标 = {}
    end
end

function 战斗单位:开启躲避()
	self.躲避类型 = 1
	self.停止躲避 = 75
	self.躲避开关 = true
	self.躲避数量 = 0
	self.躲避xy = require("GGE.坐标")(self.显示xy.x, self.显示xy.y)
end

-- function 战斗单位:躲避事件()
-- 	if self.躲避类型 == 1 then
-- 		self.显示xy.x, self.显示xy.y = self.显示xy.x + self.躲避坐标, self.显示xy.y + self.躲避坐标
-- 		self.躲避数量 = math.floor(self.初始xy:取距离(self.显示xy) / 15)
-- 		if self.初始xy:取距离(self.显示xy) >= self.停止躲避 then
-- 			self.躲避类型 = 2
-- 		end
-- 	elseif self.躲避类型 == 2 then
-- 		self.显示xy.x, self.显示xy.y = self.显示xy.x - self.躲避坐标, self.显示xy.y - self.躲避坐标
-- 		self.躲避数量 = math.floor(self.初始xy:取距离(self.显示xy) / 15)
-- 		if self.初始xy:取距离(self.显示xy) <= 5 then
-- 			self.显示xy.x, self.显示xy.y = self.初始xy.x, self.初始xy.y
-- 			self.躲避类型 = 0
-- 			self.躲避开关 = false
-- 		end
-- 	end
-- end
function 战斗单位:躲避事件()
    if self.躲避类型==1 then
        -- 向后移动（远离攻击者方向）
        self.显示xy.x,self.显示xy.y=self.显示xy.x+self.躲避坐标,self.显示xy.y+self.躲避坐标
        if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))>=self.停止躲避)then
            self.躲避类型=2
        end
    elseif self.躲避类型==2 then
        -- 向前移动（返回原位）
        self.显示xy.x,self.显示xy.y=self.显示xy.x-self.躲避坐标,self.显示xy.y-self.躲避坐标

        if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))<=5)then
            self.显示xy.x,self.显示xy.y=self.初始xy.x,self.初始xy.y
            self.躲避类型=0
            self.躲避开关=false
            if self.法术抖动开关 or self.物理抖动开关 then
                self.法术抖动开关 = false
                self.物理抖动开关 = false
                self.法术抖动计时 = 0
                self.抖动延时 = nil
                self.法术抖动坐标 = {x = 0, y = 0}
            end
            if self.抖动数据 then
                self.抖动数据.开关 = false
                self.抖动数据.进程 = 0
                self.抖动数据.x = 0
                self.抖动数据.y = 0
            end
        end
    end
end

function 战斗单位:设置溅射(xy, 方向, 伤害, 死亡)
	self.溅射数据 = { 伤害 = 伤害, 死亡 = 死亡 }
	self.溅射开关 = true
end

function 战斗单位:设置抓捕路径(目标, 成功)
	self:换动作("跑去")
	self.抓捕移动 = 目标
end

function 战斗单位:设置吸星大法路径(目标, 成功)
	self:换动作("待战")
	self.吸星大法移动=require("GGE.坐标")(300, 350)
end

function 战斗单位:吸星大法解除(目标)
	self:换动作("待战")
	self.吸星大法返回=self:取移动坐标("返回")
end

function 战斗单位:设置抓捕动画(目标, 模型, 成功, 名称)
	self.抓捕资源 = 取模型(模型)
	self.抓捕动画 = __res:取动画2(__res:取地址('shape/mx/', self.抓捕资源[2]))
	self.抓捕动画:置方向(3)
	self.抓捕流程 = 1
	self.抓捕成功 = 成功
	self.抓捕目标 = require("GGE.坐标")(多开数据[self.当前].__战斗主控.战斗单位[目标].显示xy.x, 多开数据[self.当前].__战斗主控.战斗单位[目标].显示xy.y)
	self.抓捕xy = require("GGE.坐标")(self.显示xy.x, self.显示xy.y)
	self.抓捕开关 = true
	self.抓捕编号 = 目标
end



function 战斗单位:取消变相(dt, x, y)
	self.动画.动画["待战"]:取高亮()
	if self.动画.武器 ~= nil then
		self.动画.武器["待战"]:取高亮()
	end
end

function 战斗单位:取消隐身(dt, x, y)
	self.动画.动画["待战"]:置颜色(255, 255, 255)
	if self.动画.武器 ~= nil then
		self.动画.武器["待战"]:置颜色(255, 255, 255)
	end
end

function 战斗单位:设置提示(内容)
	self.战斗提示.开关 = true
	self.战斗提示.内容 = 内容
	self.战斗提示.停止时间 = os.time() + 2
end

function 战斗单位:结束同步(气血, 最大气血, 气血上限, 魔法, 最大魔法, 愤怒, 护盾, 战意,五行珠,人参果,骤雨,超级战意)
	if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
		if self.单位类型 == "角色" then
			if self.气血 ~= nil and 气血 ~= nil then
				self.气血 = 气血
				多开数据[当前 or self and self.当前].角色信息.气血 = 气血
			end
			if 最大气血 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.最大气血 = 最大气血
				self.最大气血 = 最大气血
			end
			if 气血上限 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.气血上限 = 气血上限
			end
			if 魔法 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.魔法 = 魔法
			end
			if 最大魔法 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.最大魔法 = 最大魔法
			end
			if 愤怒 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.愤怒 = 愤怒
			end
			多开数据[self.当前].__UI界面.界面层.右上角:重置人物()
		elseif self.单位类型 == "bb" then
			if self.气血 ~= nil and 气血 ~= nil then
				self.气血 = 气血
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.气血 = 气血
			end
			if 最大气血 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.最大气血 = 最大气血
				self.最大气血 = 最大气血
			end
			if 魔法 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.魔法 = 魔法
			end
			if 最大魔法 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.最大魔法 = 最大魔法
			end
			多开数据[self.当前].__UI界面.界面层.右上角:重置召唤兽()
		end
	end
	if 护盾 ~= nil then
		self.护盾 = 护盾
	end
	if 战意 ~= nil then
		self.战意 = 战意
	end
	if 超级战意 ~= nil then
		self.超级战意 = 超级战意
		-- print(self.超级战意)
	end
	if 五行珠 ~= nil then
		self.五行珠 = 五行珠
	end
	if 人参果 ~= nil then
		self.人参果 = 人参果
	end
	if 骤雨 ~= nil then
		self.骤雨 = 骤雨
	end
end

function 战斗单位:魔法更新(魔法)
	if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
		if self.单位类型 == "角色" then
			多开数据[当前 or self and self.当前].角色信息.魔法 = 魔法
			-------------------------------C改
			if 愤怒 ~= nil then
                多开数据[当前 or self and self.当前].角色信息.愤怒 = 愤怒
            end
			多开数据[self.当前].__UI界面.界面层.右上角:重置人物()
			-------------------------------C改

		elseif self.单位类型 == "bb" then
			多开数据[当前 or self and self.当前].角色信息.参战宝宝.魔法 = 魔法
		end
	end
	self.魔法 = 魔法
end

function 战斗单位:愤怒更新(愤怒)
	if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
		if self.单位类型 == "角色" then
			if 愤怒 ~= nil then
				多开数据[当前 or self and self.当前].角色信息.愤怒 = 愤怒
			end
		end
	end
	self.愤怒 = 愤怒
end

function 战斗单位:战意更新(战意)
	self.战意 = 战意
end

function 战斗单位:超级战意更新(超级战意)
	self.超级战意 = 超级战意
end
function 战斗单位:骤雨更新(骤雨)
	self.骤雨 = 骤雨
end

function 战斗单位:五行珠更新(五行珠)
	self.五行珠 = 五行珠
end

function 战斗单位:人参果更新(人参果)
	self.人参果 = 人参果
end

function 战斗单位:护盾更新(护盾)
	self.护盾 = 护盾
end

function 战斗单位:同步伤势(气血,气血上限,最大气血)
	if self.单位id == 多开数据[self.当前].角色信息.数字id then
		if self.气血上限 ~= nil and 气血上限 ~= nil then
			self.气血上限 = 气血上限
			多开数据[self.当前].角色信息.气血上限=气血上限
		end
	end
end

function 战斗单位:同步气血(气血,气血上限,最大气血)
	if self.单位类型 == "角色" then
		if self.气血 ~= nil and 气血 ~= nil then
			self.气血 = 气血
			if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
				多开数据[当前 or self and self.当前].角色信息.气血=气血
				多开数据[self.当前].__UI界面.界面层.右上角:重置人物()
			end
		end 
		if self.气血上限 ~= nil and 气血上限 ~= nil then
			self.气血上限 = 气血上限
			if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
				多开数据[当前 or self and self.当前].角色信息.气血上限=气血上限
				多开数据[self.当前].__UI界面.界面层.右上角:重置人物()
			end
		end
	elseif self.单位类型 == "bb" then
		if self.气血 ~= nil and 气血 ~= nil then
			self.气血 = 气血
			if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.气血=气血
				多开数据[self.当前].__UI界面.界面层.右上角:重置召唤兽()
			end
		end

	end
end

function 战斗单位:设置掉血(数额, 类型)
	local 护盾消耗 = 0
	if 数额 == nil then 数额 = 1 end
	数额 = math.floor(数额)
	if 类型==1 or 类型==3 or 类型==3.5 or 类型==4 then
		if self.护盾 ~= 0 then
			if self.护盾 >= 数额 then
				护盾消耗 = 数额
				数额 = 0
				self.护盾 = self.护盾 - 数额
				self.伤害数额 = ""..数额.."("..护盾消耗..")"
			else
				数额= 数额 - self.护盾
				护盾消耗 = self.护盾
				self.伤害数额 = ""..数额.."("..护盾消耗..")"
				self.护盾 = 0
			end
		else
			self.伤害数额 = 数额
		end
	else
		self.伤害数额 = 数额
		if self.气血+数额>self.最大气血 then
		    self.伤害数额 = self.最大气血-self.气血
		end
		if self.伤害数额<=0 then
		    return
		end
	end
	self.伤害总数 = string.len(tostring(self.伤害数额))
	local 临时序列 = {}
	self.弹跳次数 = 18
	self.弹跳间隔 = 2
	self.伤害类型 = 类型
	self.掉血开关 = true
	self.加血顺序 = 0
	if 类型 == 1 or 类型 == 3 or 类型 == 4 then
		self.气血 = self.气血 - 数额
		if self.气血 < 0 then
			self.气血 = 0
		end
		if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
			if self.单位类型 == "角色" then
				多开数据[当前 or self and self.当前].角色信息.气血 = math.floor(self.气血)
				多开数据[当前 or self and self.当前].角色信息.最大气血 = math.floor(self.最大气血)
				多开数据[当前 or self and self.当前].角色信息.气血上限 = math.floor(self.气血上限)
				临时愤怒 = math.floor(数额 / 多开数据[当前 or self and self.当前].角色信息.最大气血 * 0.5 * 100)
				多开数据[当前 or self and self.当前].角色信息.愤怒 = 多开数据[当前 or self and self.当前].角色信息.愤怒 + 临时愤怒
				if 多开数据[当前 or self and self.当前].角色信息.愤怒 > 150 then 多开数据[当前 or self and self.当前].角色信息.愤怒 = 150 end
				多开数据[self.当前].__UI界面.界面层.右上角:重置人物()
			elseif self.单位类型 == "bb" then
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.气血 = self.气血
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.最大气血 = self.最大气血
				多开数据[self.当前].__UI界面.界面层.右上角:重置召唤兽()
			end
		end
	else
		self.气血 = self.气血 + 数额
		if self.气血 > self.最大气血 then self.气血 = self.最大气血 end
		if self.气血上限 and self.气血上限 > self.最大气血 then
			self.气血上限 = self.最大气血
		end
		if self.单位id == 多开数据[当前 or self and self.当前].角色信息.数字id then
			if self.单位类型 == "角色" then
				多开数据[当前 or self and self.当前].角色信息.气血 = self.气血
				多开数据[当前 or self and self.当前].角色信息.最大气血 = self.最大气血
				多开数据[当前 or self and self.当前].角色信息.气血上限 = math.floor(self.气血上限)
				多开数据[self.当前].__UI界面.界面层.右上角:重置人物()
			elseif self.单位类型 == "bb" then
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.气血 = self.气血
				多开数据[当前 or self and self.当前].角色信息.参战宝宝.最大气血 = self.最大气血
				多开数据[self.当前].__UI界面.界面层.右上角:重置召唤兽()
			end
		end
	end
	临时序列.时间 = self.伤害总数 * 40
	if #self.伤害序列 ~= 0 then
		临时序列.进入 = math.floor(self.伤害序列[#self.伤害序列].时间 / 2)
	else
		临时序列.进入 = 0
	end
	临时序列.顺序 = 0
	for n = 1, self.伤害总数 do
		临时序列[n] = {}
		临时序列[n].数字 = string.sub(self.伤害数额, n, n)
		if 临时序列[n].数字 == "(" then
			临时序列[n].数字 = 10
		elseif 临时序列[n].数字 == ")" then
			临时序列[n].数字 = 11
		end
		临时序列[n].高度 = 0
		临时序列[n].x = self.显示xy.x - self.伤害总数 * 2 - self.伤害总数 * 1.5
		临时序列[n].y = self.显示xy.y
	end
	self.血条栏:置区域(0, 0, math.floor(self.气血 / self.最大气血 * 36), 4)
	if self.气血上限 then
		self.血条上限栏:置区域(0, 0, (self.气血上限 / self.最大气血) * 36, 4)
	end
	table.insert(self.伤害序列, 临时序列)
	self.弹跳顺序 = 1
end

function 战斗单位:检查点(x, y)
	return self.动画:检查点(x, y, self.动作)
end




function 战斗单位:更新(dt)
	self.显示表 = {}
	local _加入显示 = ggf.insert(self.显示表)
	if self.法术抖动开关~=nil then
		self:法术受击抖动(self.法术抖动开关)
	elseif self.物理抖动开关 then
		self:物理受击抖动()
	end
	dt=dt*tp战斗速度倍数
	for n=1,#self.攻击特效1 do
		if self.攻击特效1[n]~=nil then
	        if self.攻击特效1[n].加速 then
            	self.攻击特效1[n]:更新(dt*self.攻击特效1[n].加速)
	        else
	           	self.攻击特效1[n]:更新(dt)
	        end
        	if self.攻击特效1[n]:取当前帧() >= self.攻击特效1[n]:取帧数() then
	           	self.攻击特效1[n] = nil
            	table.remove(self.攻击特效1,n)
	        end
		end
	end
	if not self.击退开关 and self.动画.停止更新 then
		self.动画.停止更新 = false
		if not self.死亡标记 then
    		self:换动作("待战")
		end
    end

	if self.移动开关 then self:移动事件() end
	if self.击退开关 then self:击退处理() end
	if self.击飞开关 then self:击飞处理() end
	if self.返回开关 then self:返回事件() end
	if self.躲避开关 then self:躲避事件() end
	if self.倒地开关 then self:倒地处理() end
	if self.保护 then
		self:保护事件()
	end
	if self.抓捕开关 then
		if self.捕捉暂停 ~= nil and os.time() - self.捕捉暂停 >= 1 then
			self.捕捉暂停 = nil
			self.抓捕动画:置方向(1)
			-- self.抓捕开关=false
			if self.抓捕成功 then
				多开数据[self.当前].__战斗主控.战斗单位[self.抓捕编号]:设置抓捕路径(require("GGE.坐标")(self.显示xy.x, self.显示xy.y), self.抓捕成功)
			end
		end
		self.抓捕动画:更新(dt)
		if self.抓捕流程 == 1 then
			self.抓捕xy:移动(6, self.抓捕目标.x, self.抓捕目标.y)
			if self.抓捕xy:取距离(self.抓捕目标.x, self.抓捕目标.y) <= 40 then
				self.抓捕流程 = 2
				self.捕捉暂停 = os.time()
			end
		elseif self.抓捕流程 == 2 and self.捕捉暂停 == nil then
			self.抓捕xy:移动(6, self.显示xy.x, self.显示xy.y)
			if self.抓捕xy:取距离(self.显示xy.x, self.显示xy.y) <= 10 then
				self.抓捕动画 = nil
				self.抓捕开关 = false
			end
		end
	end
	if self.抓捕移动 ~= nil then
		self.显示xy:移动(6, self.抓捕移动.x, self.抓捕移动.y)
		if self.抓捕移动:取距离(self.显示xy.x, self.显示xy.y) <= 30 then
			self.是否显示 = false
			self.显示xy.x, self.显示xy.y = 1500, 1500
			self.抓捕移动 = nil
		end
	end

	if self.吸星大法移动 ~= nil then
		self.显示xy:移动(6, self.吸星大法移动.x, self.吸星大法移动.y)
		if self.吸星大法移动:取距离(self.显示xy.x, self.显示xy.y) <= 30 then
			self.吸星大法移动 = nil
			self:换方向(5)
		end
	end

	if self.吸星大法返回~=nil then
		self.显示xy:移动(6, self.吸星大法返回.x, self.吸星大法返回.y)
		if self.吸星大法返回:取距离(self.显示xy.x, self.显示xy.y)<=10 then
			self.吸星大法返回=nil
			self:换方向(self.初始方向)
		end
	end

	if self.飞镖开关 then
		self.飞镖xy:移动(10, self.显示xy.x, self.显示xy.y)
		if self.飞镖xy:取距离(self.显示xy.x, self.显示xy.y) <= 20 then
			self:设置掉血(self.飞镖xy.伤害, 1)
			self:换动作("挨打", nil, true)
			self:开启击退(self.飞镖xy.死亡)
			self.飞镖开关 = nil
			--self.飞镖动画:释放()
			self.飞镖动画 = nil
		end
	end
	if self.弓弩开关 then
		self.弓弩xy:移动(20, self.显示xy.x, self.显示xy.y)
		if self.弓弩xy:取距离(self.显示xy.x, self.显示xy.y) <= 20 then
			self.弓弩开关 = nil
			self.弓弩动画 = nil
		end
	end

	if self.战斗提示 and self.战斗提示.开关 and os.time() >= self.战斗提示.停止时间 then
		self.战斗提示.开关 = false
	end

	if self.状态特效["修罗隐身"] or self.状态特效["分身术"] or self.状态特效["楚楚可怜"] then
		self.动画.动画["待战"]:置颜色(255,255,255,130)
		if self.动画.武器 ~= nil then
			self.动画.武器["待战"]:置颜色(255,255,255,130)
		elseif self.动画.怪物饰品 ~= nil then
			self.动画.怪物饰品["待战"]:置颜色(255,255,255,130)
		end
	end
	if self.状态特效["金刚护法"] ~= nil and self.状态特效["修罗隐身"] == nil and self.状态特效["分身术"] == nil then
		self.色相变身 = self.色相变身 + 1
		if self.色相变身 >= 30 then
			self.动画.动画["待战"]:取高亮()
			if self.动画.武器 ~= nil then
				self.动画.武器["待战"]:取高亮()
			end
			if self.色相变身 >= 60 then
				self.色相变身 = 0
			end
		else
			self.动画.动画["待战"]:置高亮(-10855936)
			if self.动画.武器 ~= nil then
				self.动画.武器["待战"]:置高亮(-10855936)
			end
		end
	end
	-- if self.状态特效["超级强力"] ~= nil then
	-- 	self.动画:置方向(math.random(0,7),self.动作) 
	-- end
	if self.动作复原 then
		if not self.动画:是否播放(self.动作) then
			if self.动作 == "攻击" then
				--self.动画:置帧率("攻击",0.1)
			end
			self:换动作("待战")
		end
	end

	if self.护盾~= nil and self.护盾 > 0 and self.状态特效~=nil and self.状态特效["护盾"] == nil and self.护盾开关 == false then
		self.护盾开关 = true
		self:增加状态("护盾")
	end
	if self.护盾~= nil and self.护盾 <= 0 and self.状态特效~=nil and self.状态特效["护盾"] ~= nil and self.护盾开关 == true then
		self.护盾开关 = false
		self.状态特效["护盾"] = nil
	end

	
	if self.飞镖开关 then
		self.飞镖动画:更新(dt)
	end
	if self.弓弩开关 then
		self.弓弩动画:更新(dt*0.8)
	end
	if self.施法特效开关 then
        self.施法特效1:更新(dt*1.5)
		if self.施法特效1:取当前帧()>=self.施法特效1:取帧数() then
        	self.施法特效开关=false
            self.施法特效1=nil
        end
	end

	if self.丸子特效 then
		self.丸子特效:更新(dt*1.1)
	end

	if self.偷袭动画.显示 then
		self.偷袭动画.动画:更新(dt*0.5)
		self.偷袭动画.动画2:更新(dt*0.5)
	end


	if self.状态特效["狂怒"]~=nil and self.状态特效["变身"]~=nil then
		self.状态特效["变身"].动画:置颜色(255,0,0,300)
	end
	
	
	if self.逃跑开关 then
		if not self.逃跑特效 then
			self.动作 = "返回"
			self.逃跑特效 = 多开数据[self.当前].__主控:载入特效("逃跑", self:取txz("逃跑"))
			self.逃跑特效.cp, self.逃跑特效.py = 1, { 0, 0 }
		end
		self.逃跑特效:更新(dt)
		_加入显示(self.逃跑特效)
	end
	-- 更新影子分身
    if self.影子分身 then
        for n = 1, #self.影子分身 do
            if self.影子分身[n] then
                -- 更新动画
                self.影子分身[n]:更新(dt)
                
                -- 移动逻辑：向目标位置移动
                if self.影子分身坐标[n] and self.影子分身目标坐标[n] then
                    local dx = self.影子分身目标坐标[n].x - self.影子分身坐标[n].x
                    local dy = self.影子分身目标坐标[n].y - self.影子分身坐标[n].y
                    
                    -- 计算距离
                    local distance = math.sqrt(dx * dx + dy * dy)
                    
                    if distance > 0 then
                        -- 标准化移动方向
                        local moveX = dx / distance * self.影子分身移动速度
                        local moveY = dy / distance * self.影子分身移动速度
                        
                        -- 更新位置
                        self.影子分身坐标[n].x = self.影子分身坐标[n].x + moveX
                        self.影子分身坐标[n].y = self.影子分身坐标[n].y + moveY
                        
                        -- 如果接近目标，停止移动
                        if math.abs(dx) < 5 and math.abs(dy) < 5 then
                            self.影子分身坐标[n].x = self.影子分身目标坐标[n].x
                            self.影子分身坐标[n].y = self.影子分身目标坐标[n].y
                        end
                    end
                end
            end
        end
    end
	
	if self.动作 == "待战" or self.动作 == "倒地" or self.动作 == "挨打" then
		if self.状态特效.疯狂 or self.状态特效.反间之计 or self.状态特效.发瘟匣 or self.状态特效.失心钹 or self.状态特效.奇门五行令 or self.开始抖动 then
			if self.抖动数据.开关 == false then
				self.抖动数据.开关 = true
				self.抖动数据.进程 = 1
				self.抖动数据.x, self.抖动数据.y = -1, -1
			else
				self.抖动数据.进程 = self.抖动数据.进程 + 1
				if self.抖动数据.进程 <= 5 then
					self.抖动数据.x, self.抖动数据.y = self.抖动数据.进程 - self.抖动数据.进程 * 2, self.抖动数据.进程 - self.抖动数据.进程 * 2
				else
					self.抖动数据.x, self.抖动数据.y = self.抖动数据.x + 1, self.抖动数据.y + 1
					if self.抖动数据.进程 >= 12 then
						self.抖动数据.进程 = 0
					end
				end
			end
		elseif self.抖动数据.开关 then
			self.抖动数据.进程 = 0
			self.抖动数据.x, self.抖动数据.y = 0, 0
			self.抖动数据.开关 = false
		end
	end
	for i, v in pairs(self.状态特效) do
		if v and v.动画 then
			if type(v.动画) == "table" and v.动画[1] and v.动画[2] then
				for n = 1, #v.动画 do
					if self:状态是否显示(i) then
						v.动画[n]:更新(dt)
						_加入显示(v.动画[n])
					end
				end
			else
				if self:状态是否显示(i) then
					v.动画:更新(dt)
					_加入显示(v.动画)
				end
			end
		end
	end
	for i, v in pairs(self.攻击特效) do
		-- v:更新(dt)--C改
		if v.加速 == nil then
				v:更新(dt)
			else
				v:更新(v.加速)
			end



		_加入显示(v)
		if not v:是否播放() then
			table.remove(self.攻击特效, i)
		end
	end
	for i, v in pairs(self.法术特效) do
		if v then
			if v.加速 == nil then
				v:更新(dt)
			else
				v:更新(v.加速)
			end
			if v.结束时间 ~= nil then
				v.结束时间 = v.结束时间 - 1
				if v.结束时间 < 20 then
					v.py[2] = v.py[2] - 3
				end
				_加入显示(v)
				if v.结束时间 == 0 and not v:是否播放() then
					table.remove(self.法术特效, i)
					if 多开数据[self.当前].__战斗主控.掉血流程 ~= nil and #self.法术特效 == 多开数据[self.当前].__战斗主控.掉血流程 then 多开数据[self.当前].__战斗主控.掉血流程 = nil end
				end
			else
				_加入显示(v)
				if not v:是否播放() then
					table.remove(self.法术特效, i)
				end
				if 多开数据[self.当前].__战斗主控.掉血流程 ~= nil and #self.法术特效 == i and v:取当前帧() == math.floor(v:取帧数() / 1.5) then 多开数据[self.当前].__战斗主控.掉血流程 = nil end
			end
		end
	end
	

	if self.动作=="待战"  then
		if self.模型=="剑侠客" then
			self.动画:更新(dt*0.8, self.动作)----------C改
		else
			self.动画:更新(dt, self.动作)----------C改
		end
	else
		self.动画:更新(dt, self.动作)----------C改
	end
	if self.动作=="逃跑" then
		self.动画:更新(dt*1.5,self.动作)
	end
	
	-- _加入显示(self.动画)
	table.sort(self.显示表, 排序)
end

function 战斗单位:显示(x, y)
	if self.是否显示 == false then return end
	self.名称精灵:显示(self.显示xy.x +3+ self.抖动数据.x + self.名称py, self.显示xy.y + self.抖动数据.y + 12)
	if self.敌我 == 1 then
		多开数据[self.当前].__战斗主控.血条背景:显示(self.显示xy.x + self.抖动数据.x - 17, self.显示xy.y + self.抖动数据.y - self.高度 + 10)
		if self.气血上限 and self.气血上限 < self.最大气血 then
			self.血条上限栏:显示(self.显示xy.x + self.抖动数据.x - 16, self.显示xy.y + self.抖动数据.y - self.高度 + 11)
		end
		self.血条栏:显示(self.显示xy.x + self.抖动数据.x - 16, self.显示xy.y + self.抖动数据.y - self.高度 + 11)
	end

	if self.共生 then
		多开数据[self.当前].__主控.共生特效:显示(self.显示xy.x,self.显示xy.y)
	end
	if self.影子分身 then
        for n = 1, #self.影子分身 do
            if self.影子分身[n] and self.影子分身坐标[n] then
                self.影子分身[n]:显示(
                    self.影子分身坐标[n].x + self.抖动数据.x, 
                    self.影子分身坐标[n].y + self.抖动数据.y - (self.浮空高度 or 0)
                )
            end
        end
    end


	if (self.浮空高度 or 0) > 0 and self.死亡参数 == nil and self.逃跑开关 ~= true then
        if self.动作 ~= "挨打" then
            self.动作 = "挨打"

            self:换动作("挨打")
        end
        self.停止更新 = true
		if self.攻击方有三荒尽灭 then
			self.新浮空动画:更新(0.009)
        	self.新浮空动画:显示(self.显示xy.x + self.抖动数据.x+10, self.显示xy.y + self.抖动数据.y + 25)
		else
        	self.浮空动画:更新(0.009)
       		self.浮空动画:显示(self.显示xy.x + self.抖动数据.x, self.显示xy.y + self.抖动数据.y + 25)
		end
    end
	-- if not self.躲避开关 then
        if self.浮空开关 == false and self.浮空高度 > 0 then
            self.浮空下降 = self.浮空下降 + 1
            local jg = 2

            if self.浮空下降 > 0 and self.浮空下降 % jg == 0 then
                local jf = self.浮空下降 + 0.5 * self.浮空下降 * self.浮空下降 / (jg * jg)

                if self.浮空高度 < jf then
                    jf = self.浮空高度
                end

                self.浮空高度 = self.浮空高度 - jf
            end

            if self.浮空高度 == 0 and self.死亡参数 == nil and self.逃跑开关 ~= true then
                self.停止更新 = false
                self.动作 = "待战"
            end
        end
        if not self.特殊浮空开关 and self.特殊浮空高度 > 0 then
            self.特殊浮空高度 = 0
        end
        -- if not self.临时隐藏 then
        --     if self.攻击对象 ~= nil and 多开数据[self.当前].__战斗主控.战斗单位[self.攻击对象].浮空高度 ~= nil then
        --         self.动画:显示(self.显示xy.x + self.抖动数据.x, self.显示xy.y + self.抖动数据.y - (多开数据[self.当前].__战斗主控.战斗单位[self.攻击对象].浮空高度 or 0) , self.动作)
        --     elseif self.行动对象 and 多开数据[self.当前].__战斗主控.战斗单位[self.行动对象].特殊浮空高度 ~= nil then
        --         self.动画:显示(self.显示xy.x + self.抖动数据.x, self.显示xy.y + self.抖动数据.y - (多开数据[self.当前].__战斗主控.战斗单位[self.行动对象].特殊浮空高度 or 0) , self.动作)
        --     else
        --         self.动画:显示(self.显示xy.x + self.抖动数据.x, self.显示xy.y + self.抖动数据.y - (self.浮空高度 or 0) , self.动作)
        --     end
        -- end
		if not self.临时隐藏 then
			local 最终偏移 = (self.浮空高度 or 0) - self.一斧开天偏移
            if self.攻击对象 ~= nil and 多开数据[self.当前].__战斗主控.战斗单位[self.攻击对象].浮空高度 ~= nil then
				self.动画:显示(self.显示xy.x + self.抖动数据.x + self.法术抖动坐标.x, self.显示xy.y + self.抖动数据.y - (多开数据[self.当前].__战斗主控.战斗单位[self.攻击对象].浮空高度 or 0) + self.法术抖动坐标.y, self.动作)
            elseif self.行动对象 and 多开数据[self.当前].__战斗主控.战斗单位[self.行动对象].特殊浮空高度 ~= nil then
				self.动画:显示(self.显示xy.x + self.抖动数据.x + self.法术抖动坐标.x, self.显示xy.y + self.抖动数据.y - (多开数据[self.当前].__战斗主控.战斗单位[self.行动对象].特殊浮空高度 or 0) + self.法术抖动坐标.y, self.动作)
			else
				self.动画:显示(self.显示xy.x + self.抖动数据.x + self.法术抖动坐标.x, self.显示xy.y + self.抖动数据.y - 最终偏移 + self.法术抖动坐标.y, self.动作)
			end
		end
    -- end
	if self.披坚开关 then
		self:披坚显示()
	end
	if self.特技内容开关 then
		self:特技文本显示()
	end
	if self.其他掉血开关 then
		self:其他掉血显示()
	end
	if self.技能内容开关 then
		self:技能文本显示(x, y)
	end
	

	if self.加血内容开关 then
		self:加血文本显示(x, y)
	end
	for i = 1, #self.显示表 do
        self.显示表[i]:显示(self.显示xy.x + self.抖动数据.x + self.显示表[i].py[1],self.显示xy.y + self.抖动数据.y - (self.浮空高度 or 0) + self.显示表[i].py[2], self.动作)
	end
	for n=1,#self.攻击特效1 do
        self.攻击特效1[n]:显示(self.显示xy.x+(self.攻击特效1[n].附加x or 0),self.显示xy.y+(self.攻击特效1[n].附加y or 0)-(self.浮空高度 or 0))
    end
	if self.标记 then
		名字16:显示(self.显示xy.x + self.抖动数据.x + self.名称py, self.显示xy.y + self.抖动数据.y - 20, self.标记)
	end
	if self.抓捕开关 then
		self.抓捕动画:显示(self.抓捕xy.x, self.抓捕xy.y)
		多开数据[self.当前].__主显.影子:显示(self.抓捕xy.x, self.抓捕xy.y)
	end
	local 战斗提示内容=技能字体:置颜色(255,255,255,255):取精灵(self.战斗提示.内容)
	if self.战斗提示 and self.战斗提示.开关 then
		战斗提示内容:显示(self.显示xy.x+self.抖动数据.x-30,self.显示xy.y+self.抖动数据.y-130)
	end
	if self.飞镖开关 then
		self.飞镖动画:显示(self.飞镖xy.x, self.飞镖xy.y)
	end
	if self.弓弩开关 then
		self.弓弩动画:显示(self.弓弩xy.x, self.弓弩xy.y)
	end

	if self.超级偷袭开关 then
		多开数据[self.当前].__主控.超级偷袭光效:显示(self.显示xy.x+self.抖动数据.x-45,self.显示xy.y+self.抖动数据.y-36)
	end

	if self.丸子特效 and self.丸子time.时间 - os.time() > 0 then
		多开数据[self.当前].__主控.超级技能边框:显示(self.显示xy.x + self.抖动数据.x - 55+8, self.显示xy.y + self.抖动数据.y - self.高度-78+12)
		self.丸子特效:显示(self.显示xy.x + self.抖动数据.x - 25+6, self.显示xy.y + self.抖动数据.y - self.高度-38)
	end
	
	
	if 多重战斗开关 ~= false and 多重战斗开关.挨打方 and 多重战斗开关.挨打方[self.编号] ~= nil and self.死亡参数 == nil and self.逃跑开关 ~= true and 多开数据[self.当前].__战斗主控.战斗单位[多重战斗开关.攻击方].多重攻击 ~= nil and 多开数据[self.当前].__战斗主控.战斗单位[多重战斗开关.攻击方].多重攻击[self.编号] ~= nil then
        多开数据[self.当前].__战斗主控.战斗单位[多重战斗开关.攻击方].动画:显示(多开数据[self.当前].__战斗主控.战斗单位[多重战斗开关.攻击方].多重攻击[self.编号].x + 4, 多开数据[self.当前].__战斗主控.战斗单位[多重战斗开关.攻击方].多重攻击[self.编号].y - (self.浮空高度 or 0) + 4, 多开数据[self.当前].__战斗主控.战斗单位[多重战斗开关.攻击方].动作)
    end---C改

    self:显示战斗特效(x, y)
	if self.施法特效开关 then
		self.施法特效1:显示(self.显示xy.x,self.显示xy.y)
    end

end

function 战斗单位:直接击退处理()------------佬伍修改（增加种族秘境时空之钥）
	self.死亡开关=true
	self.死亡参数=1
	self.显示xy.x,self.显示xy.y=0,-1999
	self.逃跑开关=true
	self.动作="死亡"
	self.停止更新=true
  end

function 战斗单位:显示战斗特效(x, y)
    
    if self.战意 then
		if self.超级战意 and self.超级战意~=0 then
			if self.超级战意>=3 then
				多开数据[self.当前].__主控.超级战意特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度)
			elseif self.超级战意==2 then
				if self.战意==2 then
					多开数据[self.当前].__主控.超级战意特效[2]:显示(self.显示xy.x-97,self.显示xy.y-self.高度-100)
				elseif self.战意>=3 then
					多开数据[self.当前].__主控.战意特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
					多开数据[self.当前].__主控.超级战意特效[2]:显示(self.显示xy.x-97,self.显示xy.y-self.高度-100)
				end
			elseif self.超级战意==1 then
				if self.战意==1 then
					多开数据[self.当前].__主控.超级战意特效[1]:显示(self.显示xy.x-100,self.显示xy.y-self.高度-100)
				elseif self.战意==2 then
					多开数据[self.当前].__主控.战意特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
					多开数据[self.当前].__主控.超级战意特效[1]:显示(self.显示xy.x-100,self.显示xy.y-self.高度-100)
				elseif self.战意>=3 then
					多开数据[self.当前].__主控.战意特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
					多开数据[self.当前].__主控.超级战意特效[1]:显示(self.显示xy.x-100,self.显示xy.y-self.高度-100)
				end
			end
		else
			if self.战意==1 then
				多开数据[self.当前].__主控.战意特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
			elseif self.战意==2 then
				多开数据[self.当前].__主控.战意特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
			elseif self.战意>=3 then
				多开数据[self.当前].__主控.战意特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
			end
		end
	end
	if self.骤雨 and self.骤雨.层数>0 then
		if self.骤雨.层数==1 then
			多开数据[self.当前].__主控.骤雨特效[1]:显示(self.显示xy.x-100,self.显示xy.y-44-self.高度+50 )
		elseif self.骤雨.层数==2 then
			多开数据[self.当前].__主控.骤雨特效[2]:显示(self.显示xy.x-100,self.显示xy.y-44-self.高度+50 )
		elseif self.骤雨.层数>=3 then
			多开数据[self.当前].__主控.骤雨特效[3]:显示(self.显示xy.x-100,self.显示xy.y-44-self.高度+50 )
		end
	end
    if self.人参果 and self.人参果.枚>0 then
		if self.人参果.枚==1 then
			多开数据[self.当前].__主控.人参果特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度+50 )
		elseif self.人参果.枚==2 then
			多开数据[self.当前].__主控.人参果特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度+50 )
		elseif self.人参果.枚>=3 then
			多开数据[self.当前].__主控.人参果特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度+50 )
		end
	end

	if self.法宝~=nil then
		多开数据[self.当前].__主控.法宝特效:显示(self.显示xy.x,self.显示xy.y-self.高度+90)
	end
	if self.如意神通 ~= nil then
		多开数据[self.当前].__主控.如意神通特效:显示(self.显示xy.x-45,self.显示xy.y-self.高度-57)
	end
    if self.五行珠 then
        if self.五行珠==1 then
            多开数据[self.当前].__主控.五行珠特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度-15)
        elseif self.五行珠==2 then
           多开数据[self.当前].__主控.五行珠特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度-15)
        elseif self.五行珠==3 then
            多开数据[self.当前].__主控.五行珠特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度-15)
        elseif self.五行珠==4 then
            多开数据[self.当前].__主控.五行珠特效[4]:显示(self.显示xy.x,self.显示xy.y-self.高度-15)
        elseif self.五行珠==5 then
            多开数据[self.当前].__主控.五行珠特效[5]:显示(self.显示xy.x,self.显示xy.y-self.高度-15)
        elseif self.五行珠>=6 then
            多开数据[self.当前].__主控.五行珠特效[6]:显示(self.显示xy.x,self.显示xy.y-self.高度-15)
        end
	end
	if self.偷袭动画.显示 then
        self.偷袭动画.动画:显示(
            self.显示xy.x + self.抖动数据.x, 
            self.显示xy.y + self.抖动数据.y - (self.浮空高度 or 0)
        )
		if  self.偷袭动画.动画:取当前帧()>= self.偷袭动画.动画:取帧数() then
			self.偷袭动画.动画.当前帧=1
            self.偷袭动画.显示 = false
        end
    end
    
    if self.偷袭动画.显示2 then
        self.偷袭动画.动画2:显示(
            self.显示xy.x + self.抖动数据.x, 
            self.显示xy.y + self.抖动数据.y - (self.浮空高度 or 0)
        )
		if self.偷袭动画.动画2:取当前帧() >= self.偷袭动画.动画2:取帧数() then
			self.偷袭动画.动画2.当前帧=1
            self.偷袭动画.显示2 = false
        end
    end
		
end

function 战斗单位:法术受击抖动(名称)
	if self.模型=="木桩" then
		self.法术抖动开关 = nil
		return
	end
	if self.法术抖动开关 then
		if not self.抖动延时 then --还是要区分技能开始抖动的时间
			self.抖动延时 = skill法攻[self.法术抖动开关]
			-- print(self.抖动延时)
		end
		if self.抖动延时 then
			self.抖动延时 = self.抖动延时 - 1
			if self.抖动延时<0 then --开始抖动的时间
				self.法术抖动计时 = self.法术抖动计时 + 0.4
				if math.floor(self.法术抖动计时)%2 == 0 then
				    self.法术抖动坐标 = {x = 1,y = 1}
				else
					self.法术抖动坐标 = {x = -1,y = -1}
				end
			-- else
				-- if self.抖动延时<0 then --开始抖动的时候
					-- self:换动作1("挨打",nil,true)
				-- end
				if self.动作 ~= "挨打" then
					self:换动作1("挨打", nil, false)
				end
				local 当前帧 = self:取当前帧()
				local 结束帧 = self:取结束帧()
				if 当前帧 >= 结束帧 then
					self.停止更新 = true
				end

			end
		end
	end
end
function 战斗单位:物理受击抖动()
	if self.模型=="木桩" then
	    self.物理抖动开关 = false
	    return
	end
	if self.物理抖动开关 then
		self.法术抖动计时 = self.法术抖动计时 + 0.4
		if math.floor(self.法术抖动计时)%2 == 0 then
		    self.法术抖动坐标 = {x = 1,y = 1}
		else
			self.法术抖动坐标 = {x = -1,y = -1}
		end
		if self.动作 ~= "挨打" then
	        self:换动作1("挨打", nil, false)
	    end
		local 当前帧 = self:取当前帧()
	    local 结束帧 = self:取结束帧()
	    if 当前帧 >= 结束帧 then
	        self.停止更新 = true
	    end
	end
end
function 战斗单位:换动作1(动作,复原,更新,结尾气血)
	self.动作=动作
	self.动画:置方向(self.方向,self.动作)
	-- self.动作复原=复原
	self.停止更新=更新
	-- if self.结尾掉血==nil then
	-- 	self.结尾掉血=结尾气血
	-- end
end
function 战斗单位:单位血条显示()
	多开数据[self.当前].__战斗主控.血条背景:显示(self.显示xy.x + self.抖动数据.x - 23, self.显示xy.y + self.抖动数据.y - self.高度 + 5)
	if self.气血上限 and self.气血上限 < self.最大气血 then
		self.血条上限栏:显示(self.显示xy.x + self.抖动数据.x - 22, self.显示xy.y + self.抖动数据.y - self.高度 + 6)
	end
	self.血条栏:显示(self.显示xy.x + self.抖动数据.x - 22, self.显示xy.y + self.抖动数据.y - self.高度 + 6)
end
function 战斗单位:施法前掉血(结尾气血)
	if self.结尾掉血==nil then
		self.结尾掉血=结尾气血
	end
end
function 战斗单位:添加披坚内容(q)
	self.披坚文本=q
	self.关闭计次=0
	self.披坚开关=true
end

function 战斗单位:披坚显示()
	self.关闭计次=self.关闭计次+1
	local qtb = 取技能信息(self.披坚文本)
	self.技能图标=__res:取图像(__res["取地址"](__res, "shape/jn/", qtb[7])):拉伸(40, 40):到精灵()
	-- tp.字体表.披坚文字:置颜色(0xFFFFFF00):显示(self.显示xy.x-29,self.显示xy.y-149,self.披坚文本)
	self.技能图标:显示(self.显示xy.x-23,self.显示xy.y-122)
	多开数据[self.当前].__主控.披肩技能圈:显示(self.显示xy.x-33,self.显示xy.y-131)
	if self.关闭计次>=55 then
		self.披坚开关=false
		self.关闭计次=0
		self.披坚文本=nil
	end
end
function 战斗单位:其他掉血显示()
	self.关闭计次=self.关闭计次+1
    if self.关闭计次>=23 then
        self.图片高度=self.图片高度+1
    else
    	self.图片高度=self.图片高度-1
    end
    if self.掉血文本=="免疫" then
        self.免疫:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    elseif self.掉血文本=="反弹" then
    	self.反弹:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    elseif self.掉血文本=="无穷" then
    	self.无穷:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    else
    	self.躲避:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    end
	if self.关闭计次>=46 then
		self.其他掉血开关=false
		self.关闭计次=0
		self.掉血文本=nil
		self.文字坐标={}
		self.图片高度=0
	end
end

function 战斗单位:添加加血内容(q)
    self.特技文本=q
    self.关闭计次=0
	self.加血内容开关=true
end
function 战斗单位:加血文本显示()
	self.关闭计次=self.关闭计次+0.8
	技能字体:置颜色(__取颜色("白色")):取精灵(self.特技文本):显示(self.显示xy.x-20,self.显示xy.y-128)
	if self.关闭计次>=50 then
		self.加血内容开关=false
	end
end

function 战斗单位:添加技能内容(q)
    self.特技文本=q
	self.特技总数=#self.特技文本
	self.特技序列={}
	self.特技次数=20
	self.特技间隔=4
	for n=1,#self.特技文本 do
		self.特技序列[n]={}
		self.特技序列[n].文本=self.特技文本[n]
		self.特技序列[n].高度=0
		self.特技序列[n].x=self.显示xy.x-self.特技总数*4
		self.特技序列[n].y=self.显示xy.y
	end
    self.关闭计次=0
	self.技能内容开关=true
end
-- function 战斗单位:技能文本显示()
-- 	self.关闭计次=self.关闭计次+1
-- 	for n=1,self.特技总数 do
-- 		if n==self.特技顺序 then
-- 			self.特技序列[n].高度=self.特技序列[n].高度+self.特技间隔
-- 			if(self.特技序列[n].高度>=self.特技次数) then
-- 				self.特技顺序=self.特技顺序+1
-- 			end
-- 		elseif self.特技序列[n].高度>0 then
-- 			self.特技序列[n].高度=self.特技序列[n].高度-1
-- 		end
-- 	技能字体:置颜色(__取颜色("白色")):取精灵(self.特技文本):显示(self.显示xy.x-self.特技总数*4+15,self.显示xy.y-130-self.特技序列[n].高度,self.特技序列[n].文本)
-- 	if self.关闭计次>=50 then
-- 		self.技能内容开关=false
-- 	end
-- end
-- end
function 战斗单位:技能文本显示()
    self.关闭计次 = self.关闭计次 + 1
    local 文本精灵 = 技能字体:置颜色(__取颜色("白色")):取精灵(self.特技文本)
    local 文本总宽度 = 文本精灵.宽度
    for n = 1, self.特技总数 do
        if n == self.特技顺序 then
            self.特技序列[n].高度 = self.特技序列[n].高度 + self.特技间隔
            if self.特技序列[n].高度 >= self.特技次数 then
                self.特技顺序 = self.特技顺序 + 1
            end
        elseif self.特技序列[n].高度 > 0 then
            self.特技序列[n].高度 = self.特技序列[n].高度 - 1
        end
        local 显示x = self.显示xy.x - 文本总宽度 / 2
        local 显示y = self.显示xy.y - 135 - self.特技序列[n].高度
        技能字体:置颜色(__取颜色("白色")):取精灵(self.特技文本):显示(显示x, 显示y)
    end
    if self.关闭计次 >= 50 then
        self.技能内容开关 = false
    end
end

function 战斗单位:特技文本显示()
	self.关闭计次 = self.关闭计次 + 1
	for n = 1, self.特技总数 do
		if n == self.特技顺序 then
			self.特技序列[n].高度 = self.特技序列[n].高度 + self.特技间隔
			if (self.特技序列[n].高度 >= self.特技次数) then
				self.特技顺序 = self.特技顺序 + 1
			end
		elseif self.特技序列[n].高度 > 0 then
			self.特技序列[n].高度 = self.特技序列[n].高度 - 1
		end
		字体18:取图像(self.特技序列[n].文本):显示(self.特技序列[n].x - 30 + n * 16, self.特技序列[n].y - self.高度 - 30 - self.特技序列[n].高度)
	end
	if self.关闭计次 >= 50 then self.特技内容开关 = false end
end

function 战斗单位:加血显示()
	for n = 1, #self.伤害序列 do
		for i = 1, #self.伤害序列[n] do
			if self.伤害序列[n].进入 ~= 0 then
				self.伤害序列[n].进入 = self.伤害序列[n].进入 - 1
			else
				self.伤害序列[n].顺序 = self.伤害序列[n].顺序 + 1
				if n == self.弹跳顺序 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 + self.弹跳间隔
					if (self.伤害序列[n][i].高度 >= self.弹跳次数) then
						self.弹跳顺序 = self.弹跳顺序 + 1
					end
				elseif self.伤害序列[n][i].高度 > 0 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 - 1
				end
				if (self.敌我 == 2) then
					self.回复图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 20 + i * 12),
						math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20)))
				else
					self.回复图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 20 + i * 12),
						math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20)))
				end
			end
		end
	end
	for n = 1, #self.伤害序列 do
		if self.伤害序列[n] and self.伤害序列[n].顺序 >= self.伤害序列[n].时间 then
			table.remove(self.伤害序列, n)
			break
		end
	end
	if #self.伤害序列 == 0 then
		self.掉血开关 = false
		self.伤害序列 = {}
	end
end

function 战斗单位:设置特殊掉血(数额)
	if #self.特殊伤害序列>=4 then
       table.remove(self.特殊伤害序列,4)
       table.remove(self.特殊显示时间,4)
	end
	table.insert(self.特殊伤害序列,1,{})
	table.insert(self.特殊显示时间,1,0)
	local 序列=1
	数额 = math.floor(数额 or 1)
	self.特殊伤害数额 = 数额
	self.特殊伤害总数=string.len(tostring(self.特殊伤害数额))
	self.特殊掉血开关=true
	for n=1,self.特殊伤害总数 do
		self.特殊伤害序列[序列][n]={}
		self.特殊伤害序列[序列][n].数字=string.sub(self.特殊伤害数额,n,n)
		if self.特殊伤害序列[序列][n].数字 == "(" then
			self.特殊伤害序列[序列][n].数字 = 10
		elseif self.特殊伤害序列[序列][n].数字 == ")" then
			self.特殊伤害序列[序列][n].数字 = 11
		end
		self.特殊伤害序列[序列][n].高度=0
		self.特殊伤害序列[序列][n].x=self.显示xy.x-self.特殊伤害总数*12
		self.特殊伤害序列[序列][n].y=self.显示xy.y
	end
end
function 战斗单位:特殊掉血显示()
	for i=1,#self.特殊伤害序列 do
	    for n=1,#self.特殊伤害序列[i] do
	    	self.特殊显示时间[i]=self.特殊显示时间[i]+1
		    if (self.敌我==2) then
		    	if self.特殊伤害序列[i][n]==nil or self.特殊伤害序列[i][n].数字==nil then return 0 end
		    	self.伤害图片[self.特殊伤害序列[i][n].数字+1]:显示(self.特殊伤害序列[i][n].x+n*12,self.特殊伤害序列[i][n].y-40-self.特殊伤害序列[i][n].高度-i*20)
		    else
		    	if self.特殊伤害序列[i][n]==nil or self.特殊伤害序列[i][n].数字==nil then return 0 end
				if self.特殊伤害序列[i][n].数字==nil then self.特殊伤害序列[i][n].数字=0 end
				self.伤害图片[self.特殊伤害序列[i][n].数字+1]:显示(self.特殊伤害序列[i][n].x+n*12,self.特殊伤害序列[i][n].y-40-self.特殊伤害序列[i][n].高度-i*20)
		    end
		       多开数据[self.当前].__主控.噬魔神壶牌子:显示(self.特殊伤害序列[i][1].x-10,self.特殊伤害序列[i][1].y-40-self.特殊伤害序列[i][1].高度-i*20)
	    end
		if (self.特殊显示时间[i]>=#self.特殊伤害序列[i]*50) then
			table.remove(self.特殊伤害序列,i)
			table.remove(self.特殊显示时间,i)
			if #self.特殊伤害序列==0 then
			   self.特殊掉血开关=false
			end
		end
	end
end

function 战斗单位:掉血显示()
	for n = 1, #self.伤害序列 do
		for i = 1, #self.伤害序列[n] do
			if self.伤害序列[n].进入 ~= 0 then
				self.伤害序列[n].进入 = self.伤害序列[n].进入 - 1
			else
				self.伤害序列[n].顺序 = self.伤害序列[n].顺序 + 1
				if n == self.弹跳顺序 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 + self.弹跳间隔
					if (self.伤害序列[n][i].高度 >= self.弹跳次数) then
						self.弹跳顺序 = self.弹跳顺序 + 1
					end
				elseif self.伤害序列[n][i].高度 > 0 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 - 1
				end
				if (self.敌我 == 2) then
					if self.伤害序列[n][i] == nil or self.伤害序列[n][i].数字 == nil then return 0 end
					self.伤害图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 20 + i * 12),
						math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20))-(self.浮空高度 or 0))
				else
					if self.伤害序列[n][i] == nil or self.伤害序列[n][i].数字 == nil then return 0 end
					if self.伤害序列[n][i].数字 == nil then self.伤害序列[n][i].数字 = 0 end
					self.伤害图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 10 + i * 12),
						math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20))-(self.浮空高度 or 0))
				end
			end
		end
	end
	for n = 1, #self.伤害序列 do
		if self.伤害序列[n].顺序 >= self.伤害序列[n].时间 then
			table.remove(self.伤害序列, n)
			break
		end
	end
	if #self.伤害序列 == 0 then
		self.掉血开关 = false
		self.伤害序列 = {}
	end
end

function 战斗单位:暴击显示()
	for n = 1, #self.伤害序列 do
		for i = 1, #self.伤害序列[n] do
			if self.伤害序列[n].进入 ~= 0 then
				self.伤害序列[n].进入 = self.伤害序列[n].进入 - 1
			else
				self.伤害序列[n].顺序 = self.伤害序列[n].顺序 + 1
				if n == self.弹跳顺序 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 + self.弹跳间隔
					if (self.伤害序列[n][i].高度 >= self.弹跳次数) then
						self.弹跳顺序 = self.弹跳顺序 + 1
					end
				elseif self.伤害序列[n][i].高度 > 0 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 - 1
				end
				if (self.敌我 == 2) then
					if self.伤害序列[n][i] == nil or self.伤害序列[n][i].数字 == nil then
						return 0
					end
					if self.伤害序列[n].顺序 < self.伤害序列[n].时间 / 2 then
						self.暴击图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 20 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20))-(self.浮空高度 or 0))
					else
						self.暴击图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 20 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20))-(self.浮空高度 or 0))
					end
				else
					if self.伤害序列[n][i] == nil or self.伤害序列[n][i].数字 == nil then
						return 0
					end
					if self.伤害序列[n][i].数字 == nil then
						self.伤害序列[n][i].数字 = 0
					end
					if self.伤害序列[n].顺序 < self.伤害序列[n].时间 / 2 then
						self.暴击图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 10 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20))-(self.浮空高度 or 0))
					else
						self.暴击图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 10 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20))-(self.浮空高度 or 0))
					end
				end
			end
		end
	end
	for n = 1, #self.伤害序列 do
		if self.伤害序列[n].顺序 >= self.伤害序列[n].时间 then
			table.remove(self.伤害序列, n)
			break
		end
	end
	if #self.伤害序列 == 0 then
		self.掉血开关 = false
		self.伤害序列 = {}
	end
end

function 战斗单位:不掉血文字(q)
	self.掉血文本=q
	self.文字坐标={}
	self.文字坐标.x=self.显示xy.x
	self.文字坐标.y=self.显示xy.y
	self.关闭计次=0
	self.图片高度=0
	self.其他掉血开关=true
end

function 战斗单位:法术暴击显示()
	for n = 1, #self.伤害序列 do
		for i = 1, #self.伤害序列[n] do
			if self.伤害序列[n].进入 ~= 0 then
				self.伤害序列[n].进入 = self.伤害序列[n].进入 - 1
			else
				self.伤害序列[n].顺序 = self.伤害序列[n].顺序 + 1
				if n == self.弹跳顺序 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 + self.弹跳间隔
					if (self.伤害序列[n][i].高度 >= self.弹跳次数) then
						self.弹跳顺序 = self.弹跳顺序 + 1
					end
				elseif self.伤害序列[n][i].高度 > 0 then
					self.伤害序列[n][i].高度 = self.伤害序列[n][i].高度 - 1
				end
				if (self.敌我 == 2) then
					if self.伤害序列[n][i] == nil or self.伤害序列[n][i].数字 == nil then
						return 0
					end
					if self.伤害序列[n].顺序 < self.伤害序列[n].时间 / 2 then
						self.法术暴击图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 20 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20)))
					else
						self.伤害图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 20 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20)))
					end
				else
					if self.伤害序列[n][i] == nil or self.伤害序列[n][i].数字 == nil then
						return 0
					end
					if self.伤害序列[n][i].数字 == nil then
						self.伤害序列[n][i].数字 = 0
					end
					if self.伤害序列[n].顺序 < self.伤害序列[n].时间 / 2 then
						self.法术暴击图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 10 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20)))
					else
						self.伤害图片[self.伤害序列[n][i].数字 + 1]:显示(math.floor(self.伤害序列[n][i].x - 10 + i * 12),
							math.floor(self.伤害序列[n][i].y - 30 - self.伤害序列[n][i].高度 - ((#self.伤害序列 - n) * 20)))
					end
				end
			end
		end
	end
	if #self.伤害序列 > 0 then
		for n = 1, #self.伤害序列 do
			if  n > #self.伤害序列 then
				break
			end
			if self.伤害序列[n].顺序 >= self.伤害序列[n].时间 then
				table.remove(self.伤害序列, n)
				n=n-1
				if #self.伤害序列 == 0 then
					break
				end
			end
		end
	end
	if #self.伤害序列 == 0 then
		self.掉血开关 = false
		self.伤害序列 = {}
	end
end
function 战斗单位:浮空处理()
    if self.浮空开关 == true then
        return
    end

    if self.死亡参数 == nil and self.逃跑开关 ~= true then
        self.浮空开关 = true
        self.浮空高度 = 50
        self.动作 = "挨打"
        self.停止更新 = true
    end
end

function 战斗单位:浮空处理1()
    self.特殊浮空开关 = true
    self.特殊浮空高度 = 50
end

function 战斗单位:取消浮空(下降)
    if self.浮空开关 ~= true then
        return
    end
    self.浮空开关 = false
    self.浮空下降 = 下降 or 0
    self.浮空下降 = qz(self.浮空下降 * 0.6)
	self.浮空高度 = 0

	if self.死亡参数 then
		self.停止更新 = false
		self.动作 = "倒地"  -- 或根据死亡状态调整
    end

end
return 战斗单位
