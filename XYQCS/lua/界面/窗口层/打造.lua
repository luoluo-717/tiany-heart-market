--[[
    @Author       : GGELUA
    @Date         : 2022-05-10 10:44:43
Last Modified by: GGELUA
Last Modified time: 2023-08-02 16:19:32
--]]
local 打造 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("打造", 0, 0, 777, 491)
local 当前 = 多开数据.当前

local function 分类(标识)
	local ls = {}
	if 标识 == "打造" then
		ls = { "强化人物装备", "普通人物装备", "召唤兽装备", "灵饰淬灵" }
	elseif 标识 == "镶嵌" then
		ls = { "宝石", "灵石", "点化石", "星辉石", "珍珠" ,"五色灵尘"} --,"珍珠"
	elseif 标识 == "合成" then
		ls = { "宝石", "灵石", "变身卡", "碎石锤", "精铁", "暗器", "星辉石", "钟灵石","玄灵珠·破军","玄灵珠·回春","玄灵珠·空灵","玄灵珠·噬魂","五色灵尘"}
	elseif 标识 == "修理" then
		ls = { "人物装备", "召唤兽装备", "召唤兽装饰", "坐骑装饰" }
	elseif 标识 == "熔炼" then
		ls = { "熔炼装备", "还原装备" }
	elseif 标识 == "分解" then
		ls = { "分解装备", "分解灵犀玉", "宝石降级","分解上古玉魄" }
	elseif 标识 == "神器" then
		ls = { "神器打造" }
	end
	return ls
end

local 打造说明 = {
	打造 = {
		强化人物装备 = "百炼精铁，制造指南书", --两个位置
		普通人物装备 = "百炼精铁，制造指南书", --两个位置
		召唤兽装备 = "上古锻造图策，天眼珠", --两个位置
		灵饰淬灵 = "元灵晶石，灵饰指南书", --两个位置
	},
	镶嵌 = {
		宝石 = "人物装备，宝石", --两个位置
		灵石 = "召唤兽装备，灵石", --两个位置
		珍珠 = "人物装备/召唤兽装备，珍珠", --两个位置
		点化石 = "召唤兽装备，点化石", --两个位置
		星辉石 = "人物灵饰，星辉石", --两个位置
		五色灵尘 = "人物玉魄，五色灵尘", --两个位置

	},
	合成 = {
		宝石 = "宝石", --两个位置
		灵石 = "灵石", --两个位置
		变身卡 = "变身卡", --两个位置
		碎石锤 = "碎石锤", --两个位置
		精铁 = "精铁", --两个位置
		暗器 = "暗器", --两个位置
		星辉石 = "星辉石", --三个位置
		钟灵石 = "钟灵石", --两个位置
		玄灵珠·破军= "玄灵珠·破军",
		玄灵珠·空灵= "玄灵珠·空灵",
		玄灵珠·噬魂= "玄灵珠·噬魂",
		玄灵珠·回春= "玄灵珠·回春",
		五色灵尘= "五色灵尘"

	},
	修理 = {
		人物装备 = "人物装备，珍珠", --一个位置
		召唤兽装备 = "召唤兽装备，天眼珠/珍珠", --两个位置
		召唤兽装饰 = "召唤兽装饰，珍珠", --一个位置
		坐骑装饰 = "坐骑装饰，珍珠", --一个位置
	},
	熔炼 = {
		熔炼装备 = "人物装备，钨金", --两个位置
		还原装备 = "人物装备", --一个位置
	},
	分解 = {
		分解装备 = "人物装备/召唤兽装备,分解符", --一个位置
		分解灵犀玉 = "灵犀玉", --一个位置
		宝石降级 = "人物装备，碎石锤", --一个位置
		分解上古玉魄 = "上古玉魄/分解符", --一个位置

	},
	-- 神器 = {
	-- 人物装备 = "人物装备，破天石", --两个位置
	-- 人物装备重铸 = "人物装备，冰火玄晶", --两个位置
	-- 人物装备炼化 = "人物装备，云龙珠", --两个位置
	-- 灵饰打造 = "人物灵饰，神魔石", --两个位置
	-- 灵饰重铸 = "人物灵饰，悔梦石", --两个位置
	-- 灵饰炼化 = "人物灵饰，地心火，天淬火，三昧火，真元火", --两个位置
	-- },
}

function 打造:初始化()
	__置窗口坐标(self)
	local nsf = require('SDL.图像')(777, 491)
	if nsf:渲染开始() then
		置窗口背景("制造", 0, 12, 769, 479, true):显示(0, 0)
		取灰色背景(0, 0, 359, 315, true):显示(20, 156)
		取灰色背景(0, 0, 359, 103, true):显示(392, 156)
		__res:getPNGCC(3, 694, 4, 338, 273):显示(31, 192)
		local lssc = 取输入背景(0, 0, 262, 23)
		字体18:置颜色(__取颜色('白色'))
		字体18:取图像('需要材料'):显示(28, 164)
		字体18:取图像('所需资金'):显示(390, 278)
		lssc:显示(487, 276)
		字体18:取图像('现有资金'):显示(390, 318)
		lssc:显示(487, 316)
		字体18:取图像('所需体力'):显示(390, 358)
		lssc:显示(487, 356)
		字体18:取图像('现有体力'):显示(390, 398)
		lssc:显示(487, 396)

		nsf:渲染结束()
	end
	self:置精灵(nsf:到精灵())
end

function 打造:打开(data)
	self:置可见(true)
	self.扩展格子["包裹1"]:置选中(true)
    self.页 = 1
    for i = 1, 4 do
        打造.扩展格子["包裹" .. i]:置可见(true)
    end

	self.数据 = data
	self.打造:置选中(true)
	self.标识 = '打造'
	self.分类 = nil
	self:刷新(data)
	self.请选择:我的按钮置文字(self.请选择, __res:getPNGCC(3, 378, 347, 143, 37, true):拉伸(233, 37), "请选择")
end

function 打造:显示(x, y)
	字体18:置颜色(__取颜色("黑色"))
	字体18:显示(x + 497, y + 280, (self.总价 or 0))
	字体18:置颜色(__取银子颜色(多开数据[当前 or self and self.当前].角色信息.银子))
	字体18:显示(x + 497, y + 320, 多开数据[当前 or self and self.当前].角色信息.银子)
	字体18:显示(x + 497, y + 360, (self.消耗体力 or 0))
	字体18:显示(x + 497, y + 400, 多开数据[当前 or self and self.当前].角色信息.体力)
	if self.标识 and self.分类 then
		字体18:置颜色(__取颜色('白色'))
		字体18:显示(x + 108, y + 164, 打造说明[self.标识][self.分类])
	end
end

function 打造:刷新(data)
	self.数据 = data
	self.道具网格:置物品(data)
	self.材料网格:置物品({})
end

function 打造:物品限制(item)
	if item.物品 == nil then return false end
	local mc = (item.物品 or {}).名称
	if self.标识 == "打造" then
		if self.分类 == "召唤兽装备" and (mc == "上古锻造图策" or mc == "天眼珠" or mc == "三眼天珠" or mc == "九眼天珠") then
			return true
		elseif (self.分类 == "强化人物装备" or self.分类 == "普通人物装备") and (item.物品.总类 == 5 or item.物品.总类 == 204) then
			return true
		elseif (self.分类 == "强化灵饰淬灵" or self.分类 == "灵饰淬灵") and (mc == "灵饰指南书" or mc == "元灵晶石") then
			return true
		end
		return false
	elseif self.标识 == "镶嵌" then
		if self.分类 == "宝石" and mc ~= "星辉石" and (item.物品.总类 == 2 and item.物品.分类 <= 6 or item.物品.总类 == 5 and item.物品.分类 == 6) then
			return true
		elseif self.分类 == "星辉石" and (mc == "星辉石" or (item.物品.总类 == 2 and item.物品.分类 >= 10 and item.物品.分类 <= 13)) then
			return true
		elseif self.分类 == "钟灵石" and (mc == "钟灵石" or (item.物品.总类 == 2 and item.物品.分类 >= 10 and item.物品.分类 <= 13)) then
			return true
		elseif self.分类 == "珍珠" and (mc == "珍珠" or (item.物品.总类 == 2 and item.物品.分类 <= 9)) then
			return true
		elseif self.分类 == "点化石" and (mc == "点化石" or (item.物品.总类 == 2 and item.物品.分类 <= 9 and item.物品.分类 >= 7)) then
			return true
		elseif self.分类 == "灵石" and (mc == "精魄灵石" or (item.物品.总类 == 2 and item.物品.分类 <= 9 and item.物品.分类 >= 7)) then
			return true
		elseif self.分类 == "五色灵尘" and (mc == "五色灵尘" or (item.物品.总类 == "上古玉魄")) then
			return true

		end
		return false
	elseif self.标识 == "熔炼" then
		if self.分类 == "熔炼装备" and (item.物品.总类 == 2 and item.物品.分类 <= 6 or mc == "钨金") then
			return true
		elseif self.分类 == "还原装备" and item.物品.总类 == 2 and item.物品.分类 <= 6 then
			return true
		end
		return false
	elseif self.标识 == "合成" then
		if self.分类 == "宝石" and mc ~= "星辉石" and item.物品.总类 == 5 and item.物品.分类 == 6 then
			return true
		elseif self.分类 == "星辉石" and mc == "星辉石" then
			return true
		elseif self.分类 == "五色灵尘" and mc == "五色灵尘" then
			return true
		elseif self.分类 == "玄灵珠·破军" and mc == "玄灵珠·破军" then
			return true
		elseif self.分类 == "玄灵珠·回春" and mc == "玄灵珠·回春" then
			return true
		elseif self.分类 == "玄灵珠·噬魂" and mc == "玄灵珠·噬魂" then
			return true
		elseif self.分类 == "玄灵珠·空灵" and mc == "玄灵珠·空灵" then
			return true
		elseif self.分类 == "钟灵石" and mc == "钟灵石" then
			return true
		elseif self.分类 == "变身卡" and mc == "怪物卡片" then
			return true
		elseif self.分类 == "碎石锤" and mc == "碎石锤" then
			return true
		elseif self.分类 == "百炼精铁" and mc == "百炼精铁" then
			return true
		elseif self.分类 == "暗器" and item.物品.总类 == 2000 then
			return true
		elseif self.分类 == "灵石" and item.物品.总类 == 105 then
			return true
		end
		return false
	elseif self.标识 == "修理" then
		if mc == "珍珠" or item.物品.总类 == 2 then
			return true
		end
		return false
	elseif self.标识 == "分解" then
		if (self.分类 == "分解装备" and item.物品.总类 == 2 and item.物品.分类 <= 13) or mc == "分解符" then
			return true
		elseif (item.物品.总类 == 2 and item.物品.分类 <= 13 and (self.分类 == "宝石降级" or self.分类 == "钟灵石降级")) or mc == "精致碎石锤" then
			return true
		elseif self.分类 == "分解灵犀玉" and mc == "灵犀玉" then
			return
		elseif self.分类 == "分解上古玉魄" and item.物品.总类 == "上古玉魄" then
			return true
		end
		return false
	end
	return false
end

function 打造:打造公式()
	self.消耗体力 = 0
	self.总价 = 0
	if self.标识 == "打造" then
		if 打造.材料网格.子控件[1]._spr.物品 ~= nil and 打造.材料网格.子控件[2]._spr.物品 ~= nil then
			if 打造.材料网格.子控件[1]._spr.物品.名称 == "上古锻造图策" or 打造.材料网格.子控件[1]._spr.物品.名称 == "天眼珠" or 打造.材料网格.子控件[1]._spr.物品.名称 == "三眼天珠" or 打造.材料网格.子控件[1]._spr.物品.名称 == "九眼天珠" then
				local a = 0
				if 打造.材料网格.子控件[1]._spr.物品.等级 and 打造.材料网格.子控件[2]._spr.物品.等级 then
					if 打造.材料网格.子控件[1]._spr.物品.等级 >= 打造.材料网格.子控件[2]._spr.物品.等级 then
						a = 打造.材料网格.子控件[1]._spr.物品.等级
					else
						a = 打造.材料网格.子控件[2]._spr.物品.等级
					end
				end
				self.消耗体力 = a - 20
				self.总价 = (a - 65) * 400 + 8950
			else
				local a = 0
				if 打造.材料网格.子控件[1]._spr.物品.子类 and 打造.材料网格.子控件[2]._spr.物品.子类 then
					if 打造.材料网格.子控件[1]._spr.物品.子类 >= 打造.材料网格.子控件[2]._spr.物品.子类 then
						a = 打造.材料网格.子控件[1]._spr.物品.子类
					else
						a = 打造.材料网格.子控件[2]._spr.物品.子类
					end
				end
				self.消耗体力 = (a - 10) / 10 * 20 + 50
				if a <= 20 then
					self.总价 = 5000
				elseif a == 30 then
					self.总价 = 10000
				elseif a == 40 then
					self.总价 = 20000
				elseif a == 50 then
					self.总价 = 30000
				elseif a == 60 then
					self.总价 = 40000
				elseif a == 70 then
					self.总价 = 80000
				elseif a == 80 then
					self.总价 = 100000
				elseif a == 90 then
					self.总价 = 200000
				elseif a == 100 then
					self.总价 = 300000
				elseif a == 110 then
					self.总价 = 400000
				elseif a == 120 then
					self.总价 = 500000
				elseif a == 130 then
					self.总价 = 600000
				elseif a == 140 then
					self.总价 = 700000
				else
					self.总价 = 800000
				end
			end
		end
	elseif self.标识 == "镶嵌" then
		self.消耗体力 = 0
		self.总价 = 0
	elseif self.标识 == "合成" then
		self.总价 = 0
		if 打造.材料网格.子控件[1]._spr.物品 ~= nil and 打造.材料网格.子控件[2]._spr.物品 ~= nil then
			if self.处理项目 == "宝石" and 打造.材料网格.子控件[1]._spr.物品.分类 == 6 then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "碎石锤" and 打造.材料网格.子控件[1]._spr.物品.名称 == "碎石锤" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "星辉石" and 打造.材料网格.子控件[1]._spr.物品.名称 == "星辉石" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "五色灵尘" and 打造.材料网格.子控件[1]._spr.物品.名称 == "五色灵尘" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "玄灵珠·破军" and 打造.材料网格.子控件[1]._spr.物品.名称 == "玄灵珠·破军" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "玄灵珠·回春" and 打造.材料网格.子控件[1]._spr.物品.名称 == "玄灵珠·回春" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "玄灵珠·噬魂" and 打造.材料网格.子控件[1]._spr.物品.名称 == "玄灵珠·噬魂" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "玄灵珠·空灵" and 打造.材料网格.子控件[1]._spr.物品.名称 == "玄灵珠·空灵" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10

			elseif self.处理项目 == "灵石" and 打造.材料网格.子控件[1]._spr.物品.名称 == "灵石" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "变身卡" and 打造.材料网格.子控件[1]._spr.物品.名称 == "怪物卡片" then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) * 10
			elseif self.处理项目 == "百炼精铁" and 打造.材料网格.子控件[1]._spr.物品.名称 == "百炼精铁" then
				self.消耗体力 = 打造.材料网格.子控件[1]._spr.物品.子类 or 0
			elseif self.处理项目 == "暗器" then
				if 打造.材料网格.子控件[1]._spr.物品 ~= nil and 打造.材料网格.子控件[2]._spr.物品 ~= nil then
					local a = 0
					local b = 0
					if 打造.材料网格.子控件[1]._spr.物品.分类 and 打造.材料网格.子控件[2]._spr.物品.分类 then
						if 打造.材料网格.子控件[1]._spr.物品.分类 >= 打造.材料网格.子控件[2]._spr.物品.分类 then
							a = 打造.材料网格.子控件[1]._spr.物品.分类
							b = 打造.材料网格.子控件[2]._spr.物品.分类
						else
							a = 打造.材料网格.子控件[2]._spr.物品.分类
							b = 打造.材料网格.子控件[1]._spr.物品.分类
						end
						self.消耗体力 = a
						self.总价 = a * a + b * b
					end
				end
			end
		end
	elseif self.标识 == "熔炼" then
		if self.处理项目 == "熔炼装备" then
			local a = 60
			if 打造.材料网格.子控件[1]._spr.物品 ~= nil then
				if 打造.材料网格.子控件[1]._spr.物品.总类 == 2 then
					a = 打造.材料网格.子控件[1]._spr.物品.等级
				end
			end
			if 打造.材料网格.子控件[2]._spr.物品 ~= nil then
				if 打造.材料网格.子控件[2]._spr.物品.总类 == 2 then
					a = 打造.材料网格.子控件[2]._spr.物品.等级
				end
			end
			self.消耗体力 = math.floor(a / 10)
			self.总价 = math.ceil(a / 60) * 20000
		elseif self.处理项目 == "还原装备" then
			self.总价 = math.ceil(打造.材料网格.子控件[1]._spr.物品.等级 * 10000)
		end
	elseif self.标识 == "修理" then
		if 打造.材料网格.子控件[1]._spr.物品 ~= nil then
			if 打造.材料网格.子控件[1]._spr.物品.总类 == 2 then
				self.消耗体力 = (打造.材料网格.子控件[1]._spr.物品.等级 or 0) + 20
			end
		end
	elseif self.标识 == "分解" then
		if 打造.材料网格.子控件[1]._spr.物品 ~= nil then
			if 打造.材料网格.子控件[1]._spr.物品.总类 == 2 then
				local xh = self:取分解(打造.材料网格.子控件[1]._spr.物品.等级, 打造.材料网格.子控件[1]._spr.物品.分类)
				self.消耗体力 = xh[2]
				self.总价 = xh[1]
			end
		end
	end
end

function 打造:取分解(等级, 类型)
	if 类型 <= 6 or (类型 >= 10 and 类型 <= 13) then
		if 等级 == 60 then
			return { 5, 90, 1 }
		elseif 等级 == 70 then
			return { 5, 105, math.random(1, 2) }
		elseif 等级 == 80 then
			return { 5, 120, math.random(2, 3) }
		elseif 等级 == 90 then
			return { 6, 135, math.random(2, 4) }
		elseif 等级 == 100 then
			return { 6, 150, math.random(3, 5) }
		elseif 等级 == 110 then
			return { 7, 165, math.random(3, 5) }
		elseif 等级 == 120 then
			return { 12, 180, math.random(4, 6) }
		elseif 等级 == 130 then
			return { 17, 195, math.random(5, 6) }
		elseif 等级 == 140 then
			return { 22, 210, math.random(5, 6) }
		elseif 等级 == 150 then
			return { 27, 225, math.random(6, 7) }
		elseif 等级 == 160 then
			return { 32, 240, math.random(6, 7) }
		end
	else
		if 等级 == 65 then
			return { 4, 90, 1 }
		elseif 等级 == 75 then
			return { 4, 105, 1 }
		elseif 等级 == 85 then
			return { 4, 120, math.random(1, 2) }
		elseif 等级 == 95 then
			return { 4, 135, math.random(1, 2) }
		elseif 等级 == 105 then
			return { 5, 150, math.random(2, 3) }
		elseif 等级 == 115 then
			return { 5, 165, math.random(2, 3) }
		elseif 等级 == 125 then
			return { 8, 180, math.random(4, 6) }
		elseif 等级 == 135 then
			return { 16, 195, math.random(5, 6) }
		elseif 等级 == 145 then
			return { 23, 210, math.random(5, 6) }
		end
	end
	return { 23, 210, math.random(5, 6) }
end

local 关闭 = 打造:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 727, 0)

function 关闭:左键弹起(x, y, msg)
	打造:置可见(false)
end

local 请选择 = 打造:创建我的按钮(__res:getPNGCC(3, 378, 347, 143, 37, true):拉伸(233, 37), "请选择", 93, 111, "请选择")
function 请选择:左键弹起(x, y, msg)
	多开数据[当前 or self and self.当前].__UI弹出.打造选择:打开(分类(打造.标识), self.高度, self:取坐标())
end

local 道具网格 = 打造:创建网格("道具网格", 31, 192, 339, 272)

function 道具网格:初始化()
	self:创建格子(67, 67, 0, 0, 4, 5)
end
function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and not self.子控件[a]._spr.物品禁止 then
        local 全局编号 = self.子控件[a].真实编号 or (a + 打造.页 * 20 - 20)
        for i = 1, #打造.材料网格.子控件 do
            if not 打造.材料网格.子控件[i]._spr.物品 and (i ~= 3 or (打造.标识 == "合成" and 打造.分类 == "星辉石")  or (打造.标识 == "合成" and 打造.分类 == "五色灵尘") or (打造.标识 == "合成" and 打造.分类 == "玄灵珠·破军") or (打造.标识 == "合成" and 打造.分类 == "玄灵珠·空灵")or (打造.标识 == "合成" and 打造.分类 == "玄灵珠·噬魂")or (打造.标识 == "合成" and 打造.分类 == "玄灵珠·回春") ) then
                self.子控件[a]._spr:详情打开(170, 86, w, h, "选择", 全局编号)
                打造.材料网格:置物品(self.子控件[a]._spr.物品, i)
                打造.材料网格.子控件[i]._spr.物品.原始编号 = 全局编号
                self:置物品(nil, a)
                打造:打造公式()
                break
            end
        end
    end
end

function 道具网格:置物品(data, bh)
    if not bh then
        for i = 1, #self.子控件 do
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i+ 打造.页 * 20 - 20], nil, "战斗道具")
            lssj:置偏移(10, 10)
            lssj.物品禁止 = not 打造:物品限制(lssj)
            self.子控件[i].真实编号 = i + 打造.页 * 20 - 20  -- 全量刷新正常，保留
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __物品格子.创建(当前)
        lssj:置物品(data, nil, "战斗道具")
        lssj:置偏移(10, 10)
        if data then
            lssj.物品禁止 = not 打造:物品限制(lssj)
        end
        -- 新增：单个格子刷新时，计算并赋值全局真实编号（核心修复）
        self.子控件[bh].真实编号 = bh + 打造.页 * 20 - 20
        self.子控件[bh]:置精灵(lssj)
    end
end


local 材料网格 = 打造:创建网格("材料网格", 441, 182, 260, 55)

function 材料网格:初始化()
	self:创建格子(55, 55, 0, 40, 1, 3)
end

function 材料网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 then
        local 物品 = self.子控件[a]._spr.物品
        local 原始编号 = 物品.原始编号
        if 原始编号 and 原始编号 > 0 then
            local 原始页 = math.ceil(原始编号 / 20)
            原始页 = math.max(1, math.min(4, 原始页))  -- 容错1-4页
            打造.页 = 原始页
            for i=1,4 do
                打造.扩展格子["包裹" .. i]:置选中(i == 原始页)
            end
            打造.道具网格:置物品(多开数据[当前].__主控.道具列表)
            local 本地索引 = 原始编号 - (原始页 - 1) * 20
            if 本地索引 >= 1 and 本地索引 <= 20 then
                打造.道具网格:置物品(物品, 本地索引)
            else
                for i=1,#打造.道具网格.子控件 do
                    if not 打造.道具网格.子控件[i]._spr.物品 then
                        打造.道具网格:置物品(物品, i)
                        break
                    end
                end
            end
        end
        self.子控件[a]._spr:详情打开(170, 86, w, h, "选择", 原始编号)
        self:置物品(nil, a)
        打造:打造公式()
    end
end
function 材料网格:置物品(数据, bh)
    if not bh then
        for i = 1, #self.子控件 do
            local lssj = __商店格子.创建(当前)
            lssj:置物品(数据[i], "制造")  
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __商店格子.创建(当前)
        lssj:置物品(数据, "制造")
        self.子控件[bh]:置精灵(lssj)
    end
end


for i, v in ipairs {
	{ name = '打造', x = 20 + 107 * 0, y = 61, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(95, 43), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(95, 43), font = '打造' },
	{ name = '镶嵌', x = 20 + 107 * 1, y = 61, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(95, 43), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(95, 43), font = '镶嵌' },
	{ name = '合成', x = 20 + 107 * 2, y = 61, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(95, 43), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(95, 43), font = '合成' },
	{ name = '修理', x = 20 + 107 * 3, y = 61, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(95, 43), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(95, 43), font = '修理' },
	{ name = '熔炼', x = 20 + 107 * 4, y = 61, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(95, 43), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(95, 43), font = '熔炼' },
	{ name = '分解', x = 20 + 107 * 5, y = 61, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(95, 43), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(95, 43), font = '分解' },
	--{ name = '神器', x = 20 + 107 * 6, y = 61, tcp = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(95, 43), tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(95, 43), font = '神器' },
} do
	local 临时函数 = 打造:创建我的单选按钮(v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
	function 临时函数:左键弹起(x, y)
		分类(v.name)
		打造.标识 = v.name
		打造.分类 = nil
		打造:刷新(打造.数据)
		打造.请选择:我的按钮置文字(打造.请选择, __res:getPNGCC(3, 378, 347, 143, 37, true):拉伸(233, 37), "请选择")
	end
end

local 打造按钮 = 打造:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(123, 41), "打造按钮", 625, 435, "确定")
function 打造按钮:左键弹起(x, y, msg)
	if 打造.标识 and 打造.分类 then
		if 打造.材料网格.子控件[1] and 打造.材料网格.子控件[1]._spr.物品 and (打造.材料网格.子控件[2]._spr.物品 ~= nil or 打造.标识 == "修理" or 打造.标识 == "分解" or 打造.分类 == "还原装备") then
			local 事件 = function()
				发送数据(当前 or self and self.当前, 4501, {
					序列 = 打造.材料网格.子控件[1]._spr.物品.原始编号,
					序列1 = (打造.材料网格.子控件[2]._spr.物品 or {}).原始编号,
					序列3 = (打造.材料网格.子控件[3]._spr.物品 or {}).原始编号,
					功能标识 = 打造.分类,
					分类标识 = 打造.标识
				})
			end
			if 打造.标识 == "修理" then
				local wb = "#Y修理装备有一定的失败风险,你确定要进行修理么?"
				多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
			elseif 打造.标识 == "镶嵌" then
				local wb = "#Y你确定要将该道具镶嵌至该装备么?"
				多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
			elseif 打造.标识 == "分解" then
				local wb = "#Y你确定要将该装备进行分解么?一旦分解无法找回！"
				if 打造.分类 == "宝石降级" then
					wb = "#Y此操作将会清除装备上的宝石，且指挥返还最高等级的1颗宝石！"
				elseif 打造.分类 == "分解灵犀玉"then
					wb = "#Y你确定要分解灵犀玉么！"
				end
				多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
			elseif 打造.分类 == "还原装备" then
				local wb = "#Y你确定要将该装备重铸属性还原么?一旦分解无法取消！"
				多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
			else
				事件()
			end
			return
		end
		多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('请放置需要材料！')
	else
		多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('请选择的需要打造的项目！')
	end
end


local 扩展格子 = 打造:创建控件("扩展格子", 380, 435, 300, 50)

for i, v in ipairs {
    { name = '包裹1', x = 5, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(55, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(55, 35), font = "1" },
    { name = '包裹2', x = 65, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(55, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(55, 35), font = "2" },
    { name = '包裹3', x = 125, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(55, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(55, 35), font = "3" },
    { name = '包裹4', x = 185, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(55, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(55, 35), font = "4" },
} do
    local 临时函数 = 扩展格子:创建我的单选按钮(v.tcp, v.tcp1, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '包裹1' then
            打造.页 = 1
            打造.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹2' then
            打造.页 = 2
            打造.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹3' then
            打造.页 = 3
            打造.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹4' then
            打造.页 = 4
            打造.道具网格:置物品(多开数据[当前].__主控.道具列表)
        end
    end
end
