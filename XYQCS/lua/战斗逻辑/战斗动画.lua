--[[
    @Author       : GGELUA
    @Date         : 2022-02-27 16:49:59
Last Modified by: GGELUA
Last Modified time: 2023-05-25 20:29:42
--]]
local 战斗动画 = class('战斗动画')
local 动作 = { "待战", "跑去", "防御", "攻击", "攻击2", "挨打", "返回", "死亡", "施法" }
local action_type = { 攻击 = 1, 攻击2 = 2, 死亡 = 3, 防御 = 4, 待战 = 6, 施法 = 7, 跑去 = 8, 返回 = 8, 挨打 = 9 }
local action_types = { 攻击 = 1, 攻击2 = 2, 死亡 = 3, 防御 = 4, 待战 = 6, 施法 = 7, 跑去 = 8, 返回 = 8, 挨打 = 9 }
转换子类战斗={
  ["剑侠客"]=12,
  ["逍遥生"]=3,
  ["飞燕女"]=11,
  ["英女侠"]=10,
  ["龙太子"]=1,
  ["巨魔王"]=12,
  ["虎头怪"]=9,
  ["狐美人"]=10,
  ["骨精灵"]=8,
  ["神天兵"]=1,
  ["舞天姬"]=11,
  ["玄彩娥"]=8,
  ["偃无师"]=3,
  ["巫蛮儿"]=13,
  ["鬼潇潇"]=6,
  ["羽灵神"]=13,
  ["影精灵"]=8,


}

function 战斗动画:初始化(当前)
	self.当前 = 当前
end

function 战斗动画:创建动画(模型, 类型, 染色方案, 染色组, 变异, 武器, 变身, 显示饰品, 炫彩, 炫彩组, 锦衣,副武器)
	self.动画 = {}
	self.身体 = nil
	self.动作特效 = {}
	self.武器 = nil
	self.武器类型 = 武器
	self.副武器=nil
	self.副武器类型= 副武器
	self.怪物饰品 = nil
	self.py = { 0, 0 }
	self.cp = 2
	self.染色方案 = 染色方案
	self.染色组 = 染色组
	self.炫彩 = 炫彩
	self.炫彩组 = 炫彩组
	self.行为 = "待战"
	self.状态行为 = "待战"
	self.动画 = {}
	self.动作特效 = {}
	self.方向 = 0
	self.锦衣 = 锦衣
	self.模型=模型
	local 模型 = 模型
	if 变身 ~= nil and __res.配置.显示变身造型 == 1 then
		类型 = 1
		模型 = 变身
	end
	local 施法特效1
	if 武器 and 武器.施法特效 and 武器.施法特效.名称 then
		施法特效1=武器.施法特效.名称
	end
	local djs
	local zl = 0
	local 修正武器子类 = false
	if 模型=="影精灵" then
		if 锦衣 and 锦衣[2] ~= nil then
			if 武器 and 武器.子类 == 910 then
				武器.子类 = 8  -- 魔棒的子类
				修正武器子类 = true
			end
			if 副武器 and 副武器.子类 == 911 then
				修正武器子类 = true
			end
		end
	end
	if 锦衣 and 锦衣[2] and 锦衣[2].名称=="恶魔棘刺" then
		if 武器 then
			武器.子类=转换子类战斗[模型]
		end
	end
	if 类型 == "角色" or 类型 == "系统角色" then
		local lssj
		local 允许武器 = true
		if ( not lssj or ( lssj and not lssj[1])) and 锦衣 and 锦衣[1] and 锦衣[1].名称 and __res.配置.锦衣 == 1  then
			local 锦衣名称 = 锦衣[1].名称
			if 锦衣名称=="青花瓷月白"   or 锦衣名称=="龙行玉泽" or 锦衣名称=="萌龙咆哮" or 锦衣名称=="胖胖龙" or 锦衣名称=="黑麒麟" or 锦衣名称=="锦鲤" or 锦衣名称=="青花瓷月黑" or 锦衣名称=="灼灼韶华"
				or 锦衣名称=="齐天大圣月白" or 锦衣名称=="齐天大圣月黑" then
				允许武器 = false
				lssj =取祥瑞模型(模型,锦衣名称,1)	
			else
				local 武器类型 = nil
				if 武器 ~= nil then 
					武器类型 = 多开数据[多开数据.当前].__主控:取武器子类(武器.子类)
					lssj = 取战斗锦衣模型(锦衣名称, 模型, 武器.子类)
				else
					lssj = 取战斗锦衣模型(锦衣名称, 模型)
					武器类型 = nil
				end
				if 锦衣名称 and string.find(锦衣名称,"斗战胜佛") then
					允许武器 = false
				end
			end
		end
		

		if 武器 ~= nil then
			if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
				zl = "弓弩1"
			else
				zl = 多开数据[多开数据.当前].__主控:取武器子类(武器.子类)
			end
		end
		self.wqzl=zl
		local n = 取战斗模型(模型)
		if zl ~= 0 and zl ~= true then
			n = 取战斗模型(模型, zl)
		end

		if (not 变身  or (变身 and __res.配置.显示变身造型 ~= 1)) and n[11]~=nil and n[12]~=nil and n[12]~=nil then
			动作={"待战","跑去","防御","攻击","攻击2","挨打","返回","死亡","施法","逃跑","连击1","连击2","连击3"}
			action_type = { 攻击 = 1, 攻击2 = 2, 死亡 = 3, 防御 = 4, 待战 = 6, 施法 = 7, 跑去 = 8, 返回 = 8, 挨打 = 9 ,连击1=11,连击2=12,连击3=13}
			action_types = { 攻击 = 1, 攻击2 = 2, 死亡 = 3, 防御 = 4, 待战 = 6, 施法 = 7, 跑去 = 8, 返回 = 8, 挨打 = 9 ,连击1=11,连击2=12,连击3=13}
		end
		if lssj and lssj[1] then
			for i = 1, #动作 do
				if lssj[action_types[动作[i]]] then
					self.动画[动作[i]] = __res:取动画2(__res:取地址('shape/mx/zj/', lssj[action_types[动作[i]]]))
					if 动作[i] == "待战" or 动作[i] == "返回" then
						self.动画[动作[i]]:置循环(true)
					end
				else
					self.动画[动作[i]] = __res:取动画2(__res:取地址('shape/mx/', n[action_type[动作[i]]]))
					if 动作[i] == "待战" or 动作[i] == "返回" then
						self.动画[动作[i]]:置循环(true)
					end
				end
			end
		else
			for i = 1, #动作 do
				self.动画[动作[i]] = __res:取动画2(__res:取地址('shape/mx/', n[action_type[动作[i]]]))
				if 动作[i] == "待战" or 动作[i] == "返回" then
					self.动画[动作[i]]:置循环(true)
				end
			end
		end
		    if 施法特效1  then
				local sft=取施法特效(施法特效1)
				self.动画.施法_特效 = __res:取动画2(__res:取地址("shape/tx/sf/",sft[1]))
				self.施法特效播放完成 = true
			end
		local w = 取战斗模型(模型 .. "_身体")
		if w[1] ~= nil and w[2] ~= nil and w[3] ~= nil and w[4] ~= nil and w[6] ~= nil and w[7] ~= nil and w[8] ~= nil and w[9] ~= nil then
			self.身体 = {}
			self.身体["待战"] = __res:取动画2(__res:取地址('shape/mx/', w[6])):置循环(true)
			self.身体["跑去"] = __res:取动画2(__res:取地址('shape/mx/', w[8]))
			self.身体["防御"] = __res:取动画2(__res:取地址('shape/mx/', w[4]))
			self.身体["攻击"] = __res:取动画2(__res:取地址('shape/mx/', w[1]))
			self.身体["攻击2"] = __res:取动画2(__res:取地址('shape/mx/', w[2]))
			self.身体["挨打"] = __res:取动画2(__res:取地址('shape/mx/', w[9]))
			self.身体["返回"] = __res:取动画2(__res:取地址('shape/mx/', w[8])):置循环(true)
			if w[3] ~= 0 then
				self.身体["死亡"] = __res:取动画2(__res:取地址('shape/mx/', w[3]))
			end
			self.身体["施法"] = __res:取动画2(__res:取地址('shape/mx/', w[7]))
		end
		if 副武器 and 允许武器 and not 修正武器子类 then
			self.副武器 = {}
			local 副武器资源 = 取战斗模型(副武器.名称.."_"..模型)--动画资源:载入(副武器资源[10],"网易WDF动画",副武器资源[6])
			self.副武器.待战 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/",副武器资源[6]))
			self.副武器.跑去 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[8]))
			self.副武器.防御 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[4]))
			self.副武器.攻击 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[1]))
			self.副武器.攻击2 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[2]))
			self.副武器.挨打 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[9]))
			self.副武器.返回 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[8]))
			self.副武器.施法 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[7]))
			self.副武器.静立 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[6]))
			self.副武器.连击1 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[11]))
			self.副武器.连击2 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[12]))
			self.副武器.连击3 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[13]))
			self.副武器.死亡 = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", 副武器资源[3]))

		end
		if 武器 ~= nil and 武器.等级 ~= nil  and 允许武器 then
			local txzl = "1"
			if 武器.等级 >= 90 then
				txzl = "2"
			end
			local qsj = 模型特效库(模型 .. "攻击", zl .. txzl)
			if #qsj >= 2 then
				self.动作特效.攻击 = __res:取动画2(__res:取地址('shape/mx/', qsj[1]))
			end
			qsj = 模型特效库(模型 .. "攻击2", zl .. txzl)
			if #qsj >= 2 then
				self.动作特效.攻击2 = __res:取动画2(__res:取地址('shape/mx/', qsj[1]))
			end
			qsj = 模型特效库(模型 .. "施法", zl .. txzl)
			if #qsj >= 2 then
				self.动作特效.施法 = __res:取动画2(__res:取地址('shape/mx/', qsj[1]))
			end
		end
		if (not 锦衣 or not 锦衣[1]) or __res.配置.锦衣 ~= 1  then
			if self.炫彩 then
				self.置炫彩调色(self)
			elseif self.染色方案   then
				self.置调色(self)
			end
		end
		if 武器 ~= nil and 允许武器 then
			self.武器 = {}
			local m = 多开数据[多开数据.当前].__主控:取武器附加名称(武器.子类, 武器.等级 or 武器.等级, 武器.名称)
			local w = 取战斗模型(m .. "_" .. 模型)
			local nw = 取模型(m.."_"..模型)
			local 资源='shape/mx/'
			if 锦衣 and 锦衣[2]~=nil then
				资源='shape/mx/zj3/'
				if 锦衣[2].名称=="恶魔棘刺" then
					w = 取战斗武器装扮(锦衣[2].名称,模型)
				else
					w = 取战斗武器装扮(锦衣[2].名称,模型,武器.子类)
				end
			end

			self.音效模型 = 模型 .. "_" .. zl
			if zl == "弓弩" or zl == "弓弩1" then
				self.攻击方式 = 1
			end
			if w[10] ~= nil then
				self.武器.待战 = __res:取动画2(__res:取地址(资源, w[6])):置循环(true)
				self.武器.跑去 = __res:取动画2(__res:取地址(资源, w[8]))
				self.武器.防御 = __res:取动画2(__res:取地址(资源, w[4]))
				self.武器.攻击 = __res:取动画2(__res:取地址(资源, w[1]))
				self.武器.攻击2 = __res:取动画2(__res:取地址(资源, w[2]))
				if w[11]~=nil and w[12]~=nil and w[13]~=nil then
					self.武器.连击1 = __res:取动画2(__res:取地址(资源, w[11]))
					self.武器.连击2 = __res:取动画2(__res:取地址(资源, w[12]))
					self.武器.连击3 = __res:取动画2(__res:取地址(资源, w[13]))
				end
				pysa = math.floor(self.武器.攻击.宽度 / 20)
				if 模型 == "鬼潇潇" then
					pysa = -15
				elseif 模型 == "偃无师" or 模型 == "桃夭夭" or 模型 == "狐美人" then
					pysa = 2
					pysy = 18
				elseif 模型 == "玄彩娥" then
					if zl == "飘带" then
						pysa = -2
					else
						pysa = 18
					end
				elseif 模型 == "舞天姬" then
					pysa = 9
				elseif 模型 == "虎头怪" or 模型 == "真陀护法" then
					pysa = 15
				elseif 模型 == "神天兵" or 模型 == "骨精灵" then
					if zl == "枪矛" then
						pysa = 40
					else
						pysa = 20
					end
				elseif 模型 == "巨魔王" then
					pysa = 12
				elseif 模型 == "杀破狼" or 模型 == "巫蛮儿" then
					pysa = 7
				elseif 模型 == "逍遥生" then
					pysa = 15
					pysy = 32
				elseif 模型 == "剑侠客" then
					if zl == "刀" then
						pysa = 60
						pysy = 12
					else
						pysa = 25
						self.终结帧 = 1
					end
				elseif 模型 == "英女侠" then
					pysa = -5
				elseif 模型 == "飞燕女" then
					pysa = 25
					pysy = 29
				elseif 模型 == "吸血鬼" then
					pysa = -15
				elseif 模型 == "天兵" then
					pysa = 6
					pysy = 10
				end
				self.武器.挨打 = __res:取动画2(__res:取地址(资源, w[9]))
				self.武器.返回 = __res:取动画2(__res:取地址(资源, w[8])):置循环(true)
				if w[3] ~= 0 then
					self.武器.死亡 = __res:取动画2(__res:取地址(资源, w[3]))
				end
				self.武器.施法 = __res:取动画2(__res:取地址(资源, w[7]))
			end
			if 武器 and 武器.染色方案 then
				self.置调色(self)
			end
			if 副武器 and 副武器.染色方案 then
				self.置调色(self)
			end
		end
	else
		local n = 取战斗模型(模型)
		if zl ~= 0 and zl ~= true then
			n = 取战斗模型(模型, zl)
		end
		-- self.信息 = 多开数据[当前 or self and self.当前].角色信息
		self.行为 = "待战"
		self.状态行为 = "待战"
		self.动画 = {}
		self.动作特效 = {}
		for i = 1, #动作 do
			self.动画[动作[i]] = __res:取动画2(__res:取地址('shape/mx/', n[action_type[动作[i]]]))
			if 动作[i] == "待战" or 动作[i] == "返回" then
				self.动画[动作[i]]:置循环(true)
			end
		end
		self.动画.召唤兽 = true
		local w = 取战斗模型(模型 .. "_身体")
		if w[1] ~= nil and w[2] ~= nil and w[3] ~= nil and w[4] ~= nil and w[6] ~= nil and w[7] ~= nil and w[8] ~= nil and w[9] ~= nil then
			self.身体 = {}
			self.身体["待战"] = __res:取动画2(__res:取地址('shape/mx/', w[6])):置循环(true)
			self.身体["跑去"] = __res:取动画2(__res:取地址('shape/mx/', w[8]))
			self.身体["防御"] = __res:取动画2(__res:取地址('shape/mx/', w[4]))
			self.身体["攻击"] = __res:取动画2(__res:取地址('shape/mx/', w[1]))
			self.身体["攻击2"] = __res:取动画2(__res:取地址('shape/mx/', w[2]))
			self.身体["挨打"] = __res:取动画2(__res:取地址('shape/mx/', w[9]))
			self.身体["返回"] = __res:取动画2(__res:取地址('shape/mx/', w[8])):置循环(true)
			if w[3] ~= 0 then
				self.身体["死亡"] = __res:取动画2(__res:取地址('shape/mx/', w[3]))
			end
			self.身体["施法"] = __res:取动画2(__res:取地址('shape/mx/', w[7]))
		end
		local w = 取战斗模型(模型 .. "_装饰")
		if w[1] ~= nil and w[2] ~= nil and w[3] ~= nil and w[4] ~= nil and w[6] ~= nil and w[7] ~= nil and w[8] ~= nil and w[9] ~= nil then
			self.怪物饰品 = {}
			self.怪物饰品["待战"] = __res:取动画2(__res:取地址('shape/mx/', w[6])):置循环(true)
			self.怪物饰品["跑去"] = __res:取动画2(__res:取地址('shape/mx/', w[8]))
			self.怪物饰品["防御"] = __res:取动画2(__res:取地址('shape/mx/', w[4]))
			self.怪物饰品["攻击"] = __res:取动画2(__res:取地址('shape/mx/', w[1]))
			self.怪物饰品["攻击2"] = __res:取动画2(__res:取地址('shape/mx/', w[2]))
			self.怪物饰品["挨打"] = __res:取动画2(__res:取地址('shape/mx/', w[9]))
			self.怪物饰品["返回"] = __res:取动画2(__res:取地址('shape/mx/', w[8])):置循环(true)
			if w[3] ~= 0 then
				self.怪物饰品["死亡"] = __res:取动画2(__res:取地址('shape/mx/', w[3]))
			end
			self.怪物饰品["施法"] = __res:取动画2(__res:取地址('shape/mx/', w[7]))
		end
		local qsj = 模型特效库(模型 .. "攻击")
		if #qsj > 0 then
			self.动作特效.攻击 = __res:取动画2(__res:取地址('shape/mx/', qsj[1]))
		end
		qsj = 模型特效库(模型 .. "攻击2")
		if #qsj > 0 then
			self.动作特效.攻击2 = __res:取动画2(__res:取地址('shape/mx/', qsj[1]))
		end
		qsj = 模型特效库(模型 .. "施法")
		if #qsj > 0 then
			self.动作特效.施法 = __res:取动画2(__res:取地址('shape/mx/', qsj[1]))
		end
		--变异=true
		if 变身 == nil  then
			if 显示饰品 then
				local w = 取战斗模型(模型 .. "_饰品")
				if w[1] ~= nil and w[2] ~= nil and w[3] ~= nil and w[4] ~= nil and w[6] ~= nil and w[7] ~= nil and w[8] ~= nil and w[9] ~= nil then
					self.怪物饰品 = {}
					self.怪物饰品["待战"] = __res:取动画2(__res:取地址('shape/mx/', w[6])):置循环(true)
					self.怪物饰品["跑去"] = __res:取动画2(__res:取地址('shape/mx/', w[8]))
					self.怪物饰品["防御"] = __res:取动画2(__res:取地址('shape/mx/', w[4]))
					self.怪物饰品["攻击"] = __res:取动画2(__res:取地址('shape/mx/', w[1]))
					self.怪物饰品["攻击2"] = __res:取动画2(__res:取地址('shape/mx/', w[2]))
					self.怪物饰品["挨打"] = __res:取动画2(__res:取地址('shape/mx/', w[9]))
					self.怪物饰品["返回"] = __res:取动画2(__res:取地址('shape/mx/', w[8])):置循环(true)
					if w[3] ~= 0 then
						self.怪物饰品["死亡"] = __res:取动画2(__res:取地址('shape/mx/', w[3]))
					end
					self.怪物饰品["施法"] = __res:取动画2(__res:取地址('shape/mx/', w[7]))
					-- if 饰品颜色 ~= nil then
					-- 	self.怪物饰品["待战"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["跑去"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["防御"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["攻击"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["攻击2"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["挨打"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["返回"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["死亡"]:置颜色(饰品颜色,-1)
					-- 	self.怪物饰品["施法"]:置颜色(饰品颜色,-1)
					-- 	--self.怪物饰品["行走"]:置颜色(饰品颜色,-1)
					-- end
				end
			else
				local w = 取战斗模型(模型 .. "_装饰")
				if w[1] ~= nil and w[2] ~= nil and w[3] ~= nil and w[4] ~= nil and w[6] ~= nil and w[7] ~= nil and w[8] ~= nil and w[9] ~= nil then
					self.怪物饰品 = {}
					self.怪物饰品["待战"] = __res:取动画2(__res:取地址('shape/mx/', w[6])):置循环(true)
					self.怪物饰品["跑去"] = __res:取动画2(__res:取地址('shape/mx/', w[8]))
					self.怪物饰品["防御"] = __res:取动画2(__res:取地址('shape/mx/', w[4]))
					self.怪物饰品["攻击"] = __res:取动画2(__res:取地址('shape/mx/', w[1]))
					self.怪物饰品["攻击2"] = __res:取动画2(__res:取地址('shape/mx/', w[2]))
					self.怪物饰品["挨打"] = __res:取动画2(__res:取地址('shape/mx/', w[9]))
					self.怪物饰品["返回"] = __res:取动画2(__res:取地址('shape/mx/', w[8])):置循环(true)
					if w[3] ~= 0 then
						self.怪物饰品["死亡"] = __res:取动画2(__res:取地址('shape/mx/', w[3]))
					end
					self.怪物饰品["施法"] = __res:取动画2(__res:取地址('shape/mx/', w[7]))
				end
			end
			if self.炫彩 then
				-- self.置炫彩调色(self)
			elseif self.染色方案 then
				self.boby_wpal = __res:dewpal(self.染色方案)
				if self.染色组 then
					for i, v in ipairs(self.染色组) do
						self.染色组[i] = self.染色组[i]
					end
				end
				self.置调色(self)

			if 变异 and 染色信息[模型] then
				self.boby_wpal = __res:dewpal(染色信息[模型].id)
				self.染色组 = {}
				self.染色方案 = 染色信息[模型].id 
				for i,v in ipairs(染色信息[模型].方案) do
					self.染色组[i] = v
				end
				self.置调色(self)
			end
		end
	end
end
	self.初始化结束 = true
end

function 战斗动画:置调色()
	for i = 1, 3 do
		if not self.染色组[i] then
			self.染色组[i] = 0
		end
	end
	local 有锦衣 = (self.锦衣 and self.锦衣[1]) and (__res.配置.锦衣 == 1)
	for i, v in ipairs(动作) do
		if not 有锦衣 then
			if self.动画[v] then
				__res:置染色(self.动画[v], self.染色方案, self.染色组[1], self.染色组[2], self.染色组[3])
			end
		end
		if self.身体 and self.身体[v] then
			__res:置染色(self.身体[v], self.染色方案, self.染色组[1], self.染色组[2], self.染色组[3])
		end
		if self.武器 and self.武器[v] and self.武器类型.染色方案 then
			__res:置染色(self.武器[v], self.武器类型.染色方案, self.武器类型.染色组[1], self.武器类型.染色组[2])
		end

		if self.副武器 and self.副武器[v] and self.副武器类型.染色方案 then
			__res:置染色(self.副武器[v], self.副武器类型.染色方案, self.副武器类型.染色组[1], self.副武器类型.染色组[2])
		end

	end
end
function 战斗动画:置炫彩调色()
    local rsid = self.炫彩组[1][1].R ..
        self.炫彩组[1][1].G ..
        self.炫彩组[1][1].B ..
        self.炫彩组[1][2].R ..
        self.炫彩组[1][2].G .. self.炫彩组[1][2].B .. self.炫彩组[1][3].R ..
        self.炫彩组[1][3].G .. self.炫彩组[1][3].B
    local rsid = tonumber(self.炫彩组[1][1].R .. self.炫彩组[1][1].G .. self.炫彩组[1][1].B) +
        tonumber(self.炫彩组[1][2].R .. self.炫彩组[1][2].G .. self.炫彩组[1][2].B) +
        tonumber(self.炫彩组[1][3].R .. self.炫彩组[1][3].G .. self.炫彩组[1][3].B)
    for i, v in ipairs(动作) do
        if self.动画[v] then
            self.动画[v]["炫彩调色"](self.动画[v], self.wpal, 16843008, self.炫彩组, rsid)
        end
        if self.身体 and self.身体[v] then
            self.身体[v]["炫彩调色"](self.身体[v], self.wpal, 16843008, self.炫彩组, rsid)
        end
    end
end
function 战斗动画:置方向(方向, 动作)
	self.方向 = 方向
	if 动作 == "施法" and self.动画.施法_特效 then
        self.施法特效播放完成 = false
        self.动画.施法_特效:置方向(方向)
        self.动画.施法_特效:置首帧():恢复()
		self.动画.施法_特效.方向 = 方向
    end

	if self.动画[动作] then
		self.动画[动作]:置方向(方向)
		self.动画[动作]:置首帧():恢复()
		self.动画[动作].方向 = 方向  -- 保存方向到动画对象
	end
	
	if self.动作特效[动作] ~= nil then
		self.动作特效[动作]:置方向(方向)
		self.动作特效[动作]:置首帧():恢复()
		self.动作特效[动作].方向 = 方向
		-- self.武器[动作].方向 = 方向
	end
	if self.武器 ~= nil and self.武器[动作] ~= nil then
		self.武器[动作]:置方向(方向)
		self.武器[动作]:置首帧():恢复()
	end
	if self.副武器 and self.副武器[动作] then
        self.副武器[动作]:置方向(方向)
        self.副武器[动作]:置首帧():恢复()
    end
	if self.身体 ~= nil and self.身体[动作] ~= nil then
		self.身体[动作]:置方向(方向)
		self.身体[动作]:置首帧():恢复()
	end
	if self.怪物饰品 ~= nil and self.怪物饰品[动作] ~= nil then
		self.怪物饰品[动作]:置方向(方向)
		self.怪物饰品[动作]:置首帧():恢复()
	end
end
function 战斗动画:临时染色(染色, 编号)
    local aa = {"待战","攻击","攻击2","挨打","连击1","连击2","连击3"}
    for i = 1, #aa do
        self:置颜色(0xFFFF0000, aa[i])
    end
end
function 战斗动画:置颜色(颜色,动作)
    if self.动画[动作] then
        self.动画[动作]:置颜色(颜色)
    end

    if self.武器~=nil and self.武器[动作]~=nil  then
        self.武器[动作]:置颜色(颜色)
    end
    if self.副武器 and self.副武器[动作] then
        self.副武器[动作]:置颜色(颜色)
    end
    if self.身体~=nil and self.身体[动作]~=nil  then
        self.身体[动作]:置颜色(颜色)
    end
    if self.怪物饰品~=nil and self.怪物饰品[动作]~=nil  then
        self.怪物饰品[动作]:置颜色(颜色)
    end
end
function 战斗动画:还原染色()
    local aa = {"待战","攻击","攻击2","挨打","连击1","连击2","连击3"}
    for i = 1, #aa do
        if self.动画[aa[i]] then
            self.动画[aa[i]]:置颜色(0xffffffff)
        end

        if self.武器~=nil and self.武器[aa[i]]~=nil then
            self.武器[aa[i]]:置颜色(0xffffffff)
        end
        if self.副武器~=nil and self.副武器[aa[i]]~=nil then
            self.副武器[aa[i]]:置颜色(0xffffffff)
        end
        if self.身体~=nil and self.身体[aa[i]]~=nil then
            self.身体[aa[i]]:置颜色(0xffffffff)
        end
        if self.怪物饰品~=nil and self.怪物饰品[aa[i]]~=nil then
            self.怪物饰品[aa[i]]:置颜色(0xffffffff)
        end
    end
end
function 战斗动画:置帧率(动作, 帧率)
	if self.动画[动作] then
	self.动画[动作]:置帧率(帧率)
	end
	-- if self.动画[动作.."_特效"] then
	-- 	self.动画[动作.."_特效"]:置帧率(帧率)
	-- end
	if self.动作特效[动作] ~= nil then
		self.动作特效[动作]:置帧率(帧率)
	end
	if self.武器 ~= nil and self.武器[动作] ~= nil then
		self.武器[动作]:置帧率(帧率)
	end
	if self.副武器~= nil and self.副武器[动作]~= nil then
        self.副武器[动作]:置帧率(帧率)
    end
	if self.身体 ~= nil and self.身体[动作] ~= nil then
		self.身体[动作]:置帧率(帧率)
	end
	if self.怪物饰品 ~= nil and self.怪物饰品[动作] ~= nil then
		self.怪物饰品[动作]:置帧率(帧率)
	end
end

function 战斗动画:取当前帧(动作)
	if self.动画[动作] == nil then return 1 end
	return self.动画[动作]:取当前帧()
end

function 战斗动画:取结束帧(动作)
	if self.动画[动作] == nil then return 1 end
	return self.动画[动作]:取帧数()
end

function 战斗动画:取开始帧(动作)
	if self.动画[动作] == nil then return 1 end
	return self.动画[动作]:取开始帧()
end

function 战斗动画:检查点(x, y, 动作)
	return self.动画[动作]:检查点(x, y)
end

function 战斗动画:是否播放(动作)
	return self.动画[动作] and self.动画[动作]:是否播放()
end

function 战斗动画:更新(dt, 动作)
	dt=dt*tp战斗速度倍数
	if self.动画[动作] ~= nil then
		self.动画[动作]:更新(dt)
		-- if self.动画[动作.."_特效"] then
		-- 	self.动画[动作.."_特效"]:更新(dt)
		-- end

		if self.动画.施法_特效 and not self.施法特效播放完成 then
            self.动画.施法_特效:更新(dt)
            if self.动画.施法_特效:取当前帧() >= self.动画.施法_特效:取帧数() then
                self.施法特效播放完成 = true
            end
        end

		if self.动作特效[动作] ~= nil then
			self.动作特效[动作]:更新(dt)
		end
		if self.武器 ~= nil and self.武器[动作] ~= nil then
			self.武器[动作]:更新(dt)
		end
		if self.副武器 ~= nil and self.副武器[动作] ~= nil then
            self.副武器[动作]:更新(dt)
        end
		if self.身体 ~= nil and self.身体[动作] ~= nil then
			self.身体[动作]:更新(dt)
		end
		if self.怪物饰品 ~= nil and self.怪物饰品[动作] ~= nil then
			self.怪物饰品[动作]:更新(dt)
		end
	end
end


function 战斗动画:需要先显示武器(武器子类, 模型, 方向, 动作)
    local 方向数字 = tonumber(方向) or 方向
    local 条件 = {
        鞭 = {
            英女侠 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,逃跑=false},
                -- [0] = {逃跑=true},
                [0] = {待战 = false},
            },
            狐美人 = {
                [0] = {待战 = true,跑去 = true,挨打 = true,死亡 = false,施法 = false,防御 = false,返回 = false,逃跑 = false},
                [3] = {待战 = false,攻击 = true,防御=true,挨打=true,死亡=true},
            },
            },
        刀 = {
            剑侠客 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = false,逃跑=true},
                -- [0] = {逃跑=true},
                [0] = {待战 = false},
            },
            巨魔王 = {
                [0] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = false,防御 = false,返回 = false,逃跑 = false},
                [3] = {待战 = false,攻击 = false},
            },
            },
        剑 = {
            剑侠客 = {
                [3] = {施法 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,待战 = false,防御 = false,返回 = false,逃跑 = false},
                [0] = {待战 = false},
            },
            逍遥生 = {
                [0] = {待战 = true,跑去 = true,挨打 = true,死亡 = true,攻击 = false,攻击2 = false,施法 = false},
                [5] = {待战 = true,跑去 = true,挨打 = true,死亡 = true},
                [4] = {待战 = true,跑去 = true,挨打 = true,死亡 = true},
                [1] = {待战 = true,跑去 = true,挨打 = true,死亡 = true},
                [3] = {待战 = false,攻击 = false},
            },
            偃无师 = {
                [3] = {防御 = true,跑去 = true,挨打 = true,死亡 = true,待战 = false,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true},
                [0] = {待战 = true,挨打=true,攻击 = false},
            },
            },
        扇 = {
            龙太子 = {
                [3] = {施法 = true,防御 = true,待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,返回 = false,逃跑 = false},
                [0] = {待战 = false,攻击 = false},
            },
            逍遥生 = {
                [3] = {施法 = true,防御 = true,待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,返回 = false,逃跑 = false},
                [0] = {待战 = false},
            },
            },
        枪矛 = {
            龙太子 = {
                [0] = {待战 = true,施法 = true,跑去 = true,挨打 = true,返回 = false,攻击 = false,攻击2 = false,防御 = false,死亡=true},
                [3] = {攻击 = false,防御 = true,返回=true,跑去=true},
            },
            神天兵 = {
                [0] = {待战 = true,跑去 = true,挨打 = true,返回 = true,攻击 = false,施法 = false,防御 = false,死亡=true},
                [3] = {攻击 = false,死亡=true},
            },
            },
        斧钺 = {
            巨魔王 = {
                [0] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [3] = {待战 = false,攻击 = false},
            },
            虎头怪 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [0] = {待战 = false},
            },
        },
        锤 = {
            神天兵 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [0] = {待战 = false},
            },
            虎头怪 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true, 跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [0] = {待战 = false},
            },
        },
        -- 爪刺类武器
        爪刺 = {
            影精灵 = {
                [0] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [3] = {待战 = false,
                },
            },

            鬼潇潇 = {
                [0] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = false,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [3] = {待战 = false,死亡=true,挨打=true,跑去=true},
            },

            骨精灵 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [0] = {
                    待战 = false},
            },
            },
        -- 魔棒类武器
        魔棒 = {
            影精灵 = {
                [0] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = false,死亡 = true,施法 = true,防御 = false,返回 = true,逃跑 = true},
                [3] = {待战 = false,防御=true},
            },
            骨精灵 = {
                [3] = {攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true,待战 = false},
                [0] = {待战 = false},
            },
            玄彩娥 = {
                [3] = {待战 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,攻击 = false,攻击2 = false},
                [4] = {待战 = true},
                [0] = {待战 = false},
            },
        },
        -- 飘带类武器
        飘带 = {
            玄彩娥 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [4] = {待战 = true,攻击 = true},
                [0] = {待战 = false},
            },
            舞天姬 = {
                [0] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [4] = {待战 = true,攻击 = true},
                [3] = {待战 = false},
            },
        },

        弓弩 = {
            杀破狼 = {
                [3] = {待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [0] = {挨打 = true},
            },

            羽灵神 = {
                [0] = {跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true},
                [4] = {待战 = true,攻击 = true},
                [3] = {攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,待战 = true,防御 = true},
            },
        },
        宝珠 = {
            杀破狼 = {
                [3] = {挨打 = true,跑去 = true,死亡 = true,防御 = true,返回 = true,逃跑 = true},
                [0] = {挨打 = true,施法 = true},
            },

            羽灵神 = {
                [0] = {待战 = true,攻击 = true,攻击2 = true, 连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,施法 = true,防御 = true,返回 = true,逃跑 = true,
                },
                [4] = {待战 = true,攻击 = true},
                [3] = {待战 = false},
            },
        },
        伞 = {
            鬼潇潇 = {
                [0] = {逃跑 = true,},
                [3] = {挨打 = true,施法 = true,待战 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,死亡 = true,防御 = true}
                },
        },
        灯笼 = {
            桃夭夭 = {
                [3] = {待战 = true,挨打 = true,死亡 = true},
                [0] = {待战 = false},
            },
        },
        巨剑 = {
            偃无师 = {
                [0] = {待战 = true,挨打 = true,攻击 = false,攻击2 = false,施法 = false},
                [3] = {待战 = false},
            },
        },
        法杖 = {
            巫蛮儿 = {
                [3] = {施法 = true,防御 = true,攻击 = true,攻击2 = true,连击1 = true,连击2 = true,连击3 = true,跑去 = true,挨打 = true,死亡 = true,待战 = false,返回 = false,逃跑 = false},
                [0] = {待战 = true},
            },
            羽灵神 = {
                [3] = {施法 = true,防御 = true,跑去 = true,挨打 = true,死亡 = true,待战 = false,返回 = false,逃跑 = false},
                [0] = {待战 = true},
            },
        }
    }
    local 武器规则 = 条件[武器子类]
    if not 武器规则 then
        return false
    end
    local 模型规则 = 武器规则[模型]
    if not 模型规则 then
        return false
    end
    local 方向规则 = 模型规则[方向数字]
    if not 方向规则 then
        return false
    end
    local 先显示 = 方向规则[动作]
    if 先显示 == nil then
        return false
    end

    return 先显示
end




function 战斗动画:显示(x, y, 动作)
	多开数据[self.当前].__主显.影子:显示(x, y)
	------==========原
	-- if self.动画[动作] ~= nil then
	-- 	self.动画[动作]:显示(x, y)
	-- end
	-- if self.武器 ~= nil and self.武器[动作] ~= nil then
	-- 	self.武器[动作]:显示(x, y)
	-- end
	------==========原
	local 方向 =self.动画[动作].方向 or 0
	local 先显示武器 = false
    if self.武器 and self.武器[动作] and self.动画[动作] then
        先显示武器 = self:需要先显示武器(self.wqzl, self.模型, 方向, 动作)
    end
	if self.武器 and self.武器[动作] then
	    if 先显示武器 and self.锦衣 and self.锦衣[2] then
	     		self.武器[动作]:显示(x,y)
	    		self.动画[动作]:显示(x,y)
	    else
	    		self.动画[动作]:显示(x,y)
	    		self.武器[动作]:显示(x,y)
	    end
	else
	    self.动画[动作]:显示(x,y)
	end





	if self.动画.施法_特效 and not self.施法特效播放完成 then
		self.动画.施法_特效:显示(x, y)
	end

	if self.动作特效[动作] ~= nil then
		self.动作特效[动作]:显示(x, y)
	end
	
	if self.副武器 and self.副武器[动作] then
		self.副武器[动作]:显示(x,y)
	end
	if self.身体 ~= nil and self.身体[动作] ~= nil then
		self.身体[动作]:显示(x, y)
	end
	if self.怪物饰品 ~= nil and self.怪物饰品[动作] ~= nil then
		self.怪物饰品[动作]:显示(x, y)
	end
end

return 战斗动画
