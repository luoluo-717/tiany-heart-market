--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-06-27 06:51:06
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-07-15 12:31:47
FilePath: \XYQCS\lua\数据\特效数据.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2024-06-26 23:32:17
-- @Last Modified time  : 2024-06-29 23:22:12
--[[
    @Author       : GGELUA
    @Date         : 2022-02-27 17:26:22
Last Modified by: GGELUA
Last Modified time: 2023-05-29 14:15:54
--]]
function 模型特效库(tx,wq)
	if wq ~= nil then
		tx =tx.. "_"..wq
	end
	local txs = {}
	if Mxtexiaoku[tx] then
		txs[1]=Mxtexiaoku[tx].txs1
		txs[2]=Mxtexiaoku[tx].txs2
	end
	return txs
end

Mxtexiaoku={}
Mxtexiaoku["蛟魔王攻击" ]={
		txs1 = 0xBABABA07
	}
Mxtexiaoku["蛟魔王攻击2" ]={
		txs1 = 0xBABABA07
	}
Mxtexiaoku["蛟魔王施法" ]={
		txs1 =0xBABABA05
	}
Mxtexiaoku["超级神蛇乙巳攻击"]={
		txs1 = 0xbf100007
	}
Mxtexiaoku["超级神蛇乙巳攻击2"]={
		txs1 = 0xbf100007
	}
Mxtexiaoku["超级神蛇乙巳施法"]={
		txs1 = 0xbf100009
	}

Mxtexiaoku["锦衣鬼将攻击"]={
	txs1 = 0xFA00AA13
}
Mxtexiaoku["锦衣鬼将攻击2"]={
	txs1 =0xFA00AA14
}
Mxtexiaoku["锦衣鬼将施法"]={
	txs1 = 0xFA00AA12
}

Mxtexiaoku["锦衣谛听攻击"]={
	txs1 = 0xFA01AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣谛听攻击2"]={
	txs1 =0xFA01AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣谛听施法"]={
	txs1 = 0xFA01AA12
	,txs2 = "liang.wdf"
}

 Mxtexiaoku["锦衣画魂攻击"]={
	txs1 = 0xFA02AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣画魂攻击2"]={
	txs1 =0xFA02AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣画魂施法"]={
	txs1 = 0xFA02AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣雷鸟人攻击"]={
	txs1 = 0xFA03AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣雷鸟人攻击2"]={
	txs1 =0xFA03AA13
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣龙鲤攻击"]={
	txs1 = 0xFA04AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣龙鲤攻击2"]={
	txs1 =0xFA04AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣龙鲤施法"]={
	txs1 = 0xFA04AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣持国巡守攻击"]={
	txs1 = 0xFA05AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣持国巡守攻击2"]={
	txs1 =0xFA05AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣持国巡守施法"]={
	txs1 = 0xFA05AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣月魅攻击"]={
	txs1 = 0xFA06AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣月魅攻击2"]={
	txs1 =0xFA06AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣月魅施法"]={
	txs1 = 0xFA06AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣涂山瞳攻击"]={
	txs1 = 0xFA07AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣涂山瞳攻击2"]={
	txs1 =0xFA07AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣涂山瞳施法"]={
	txs1 = 0xFA07AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣涂山雪攻击"]={
	txs1 = 0xFA08AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣涂山雪攻击2"]={
	txs1 =0xFA08AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣涂山雪施法"]={
	txs1 = 0xFA08AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣吸血鬼攻击"]={
	txs1 = 0xFA09AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣吸血鬼攻击2"]={
	txs1 =0xFA09AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣吸血鬼施法"]={
	txs1 = 0xFA09AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣毗舍童子攻击"]={
	txs1 = 0xFA10AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣毗舍童子攻击2"]={
	txs1 =0xFA10AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣毗舍童子施法"]={
	txs1 = 0xFA10AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣狂豹人形攻击"]={
	txs1 = 0xFA11AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣狂豹人形攻击2"]={
	txs1 =0xFA11AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣狂豹人形施法"]={
	txs1 = 0xFA11AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣猫灵人形攻击"]={
	txs1 = 0xFA12AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣猫灵人形攻击2"]={
	txs1 =0xFA12AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣猫灵人形施法"]={
	txs1 = 0xFA12AA12
	,txs2 = "liang.wdf"
}

Mxtexiaoku["锦衣日游神攻击"]={
	txs1 = 0xFA13AA13
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣日游神攻击2"]={
	txs1 =0xFA13AA14
	,txs2 = "liang.wdf"
}
Mxtexiaoku["锦衣日游神施法"]={
	txs1 = 0xFA13AA12
	,txs2 = "liang.wdf"
}
	Mxtexiaoku["春三十娘攻击"]={
		txs1 = 0x266a9fc8
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["春三十娘攻击2"]={
		txs1 = 0x191350e7
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["春三十娘施法"]={
		txs1 = 0xc8ff1d3f
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["有个和尚攻击"]={
		txs1 = 0x674b7703
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["有个和尚攻击2"]={
		txs1 = 0x2244e213
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["有个和尚施法"]={
		txs1 = 0xcd37f3ed
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["郑镖头攻击"]={
		txs1 = 0xa207f463
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["郑镖头攻击2"]={
		txs1 = 0x713ca601
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["郑镖头施法"]={
		txs1 = 0x169f911c
		,txs2 = "shape.wdf"
	----------------------------------------------------------------shape.wdb
	}
	Mxtexiaoku["进阶古代瑞兽攻击"]={
		txs1 = 0xeca68574
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶古代瑞兽攻击2"]={
		txs1 = 0xf7543fd0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶古代瑞兽施法"]={
		txs1 = 0xf4de90d7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雷鸟人攻击"]={
		txs1 = 0x7869dd13
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雷鸟人攻击2"]={
		txs1 = 0x840082df
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雷鸟人施法"]={
		txs1 = 0x66fb57c3
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蝴蝶仙子攻击"]={
		txs1 = 0x7d9e57fc
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蝴蝶仙子攻击2"]={
		txs1 = 0x130a0f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蝴蝶仙子施法"]={
		txs1 = 0xbb5dde0e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶天兵攻击"]={
		txs1 = 0x7528dfd0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶天兵攻击2"]={
		txs1 = 0x763fefe7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶天兵施法"]={
		txs1 = 0x1fbd9899
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鲛人攻击"]={
		txs1 = 0x4697234
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鲛人攻击2"]={
		txs1 = 0xd4ce6708
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鲛人施法"]={
		txs1 = 0x22a67114
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蛟龙攻击"]={
		txs1 = 0x30c6f4c7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蛟龙攻击2"]={
		txs1 = 0x4d803032
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蛟龙施法"]={
		txs1 = 0x15900f1c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶凤凰攻击"]={
		txs1 = 0x84406f3c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶凤凰攻击2"]={
		txs1 = 0xa0c0a40e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶凤凰施法"]={
		txs1 = 0x4f4a5c60
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶芙蓉仙子攻击"]={
		txs1 = 0x4ff04acc
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶芙蓉仙子攻击2"]={
		txs1 = 0x85b7d239
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶芙蓉仙子施法"]={
		txs1 = 0x42052a70
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军兽形攻击"]={
		txs1 = 0x9870f7a2
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军兽形攻击2"]={
		txs1 = 0xb8dc68ba
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军兽形施法"]={
		txs1 = 0x93324eff
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军人形攻击"]={
		txs1 = 0x88a585b9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军人形攻击2"]={
		txs1 = 0x6c9eca36
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军人形施法"]={
		txs1 = 0x6f29fdf0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶如意仙子攻击"]={
		txs1 = 0x65f5a965
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶如意仙子攻击2"]={
		txs1 = 0x2bf4cce0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶如意仙子施法"]={
		txs1 = 0xb6eed6fa
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶灵符女娲攻击"]={
		txs1 = 0xfcee38c1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶灵符女娲攻击2"]={
		txs1 = 0x33c79a93
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶灵符女娲施法"]={
		txs1 = 0xe3fd7084
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶净瓶女娲攻击"]={
		txs1 = 0x41c451d9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶净瓶女娲攻击2"]={
		txs1 = 0x6facb0b1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶净瓶女娲施法"]={
		txs1 = 0xdd92cfed
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶律法女娲攻击"]={
		txs1 = 0xffaae034
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶律法女娲攻击2"]={
		txs1 = 0xbbe99333
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶律法女娲施法"]={
		txs1 = 0x3d2a8762
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶吸血鬼攻击"]={
		txs1 = 0x2285828c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶吸血鬼攻击2"]={
		txs1 = 0xbfc6c6e2
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶吸血鬼施法"]={
		txs1 = 0xe5305297
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽灵攻击"]={
		txs1 = 0xce0b75af
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽灵攻击2"]={
		txs1 = 0x40e93aa4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽灵施法"]={
		txs1 = 0x704e7698
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽萤娃娃攻击"]={
		txs1 = 0xe9581101
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽萤娃娃攻击2"]={
		txs1 = 0xa71dfba1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽萤娃娃施法"]={
		txs1 = 0x2314c566
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鬼将攻击"]={
		txs1 = 0xa7228fd9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鬼将攻击2"]={
		txs1 = 0x9b8d3851
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鬼将施法"]={
		txs1 = 0x1a1bc07f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶画魂攻击"]={
		txs1 = 0x9fdbfc64
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶画魂攻击2"]={
		txs1 = 0xa017274e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶画魂施法"]={
		txs1 = 0xc0f17b1b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶炎魔神攻击"]={
		txs1 = 0xe941964f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶炎魔神攻击2"]={
		txs1 = 0x3ed806b0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶炎魔神施法"]={
		txs1 = 0xeae5e3f4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶大力金刚攻击"]={
		txs1 = 0x1c562fe4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶大力金刚攻击2"]={
		txs1 = 0xab649391
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶大力金刚施法"]={
		txs1 = 0x4676514f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶夜罗刹攻击"]={
		txs1 = 0xa36d6a7c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶夜罗刹攻击2"]={
		txs1 = 0xd16718c6
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶夜罗刹施法"]={
		txs1 = 0x35edc3dd
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶噬天虎攻击"]={
		txs1 = 0x476fafa7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶噬天虎攻击2"]={
		txs1 = 0x201657b3
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶噬天虎施法"]={
		txs1 = 0x5e882e5a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雾中仙攻击"]={
		txs1 = 0xa2467825
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雾中仙攻击2"]={
		txs1 = 0x8ad0efcb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雾中仙施法"]={
		txs1 = 0x70f5ed80
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶龙龟攻击"]={
		txs1 = 0x731b65cd
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶龙龟攻击2"]={
		txs1 = 0xcc34c56c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶龙龟施法"]={
		txs1 = 0x2320b6f5
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶踏云兽攻击"]={
		txs1 = 0x46702722
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶踏云兽攻击2"]={
		txs1 = 0x1b2151d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶踏云兽施法"]={
		txs1 = 0x4614738e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡鬼攻击"]={
		txs1 = 0x78ddaf3a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡鬼攻击2"]={
		txs1 = 0xb85132af
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡鬼施法"]={
		txs1 = 0xd87018be
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡妖攻击"]={
		txs1 = 0x59a2d761
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡妖攻击2"]={
		txs1 = 0x9488874f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡妖施法"]={
		txs1 = 0xa419dba6
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["毗舍童子攻击"]={
		txs1 = 0x9871d7cd
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["毗舍童子攻击2"]={
		txs1 = 0x725f1df7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["毗舍童子施法"]={
		txs1 = 0x13af98e4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶毗舍童子攻击"]={
		txs1 = 0xf75396e5
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶毗舍童子攻击2"]={
		txs1 = 0x1763975b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶毗舍童子施法"]={
		txs1 = 0xed474523
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["持国巡守攻击"]={
		txs1 = 0xea995304
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["持国巡守攻击2"]={
		txs1 = 0xf2662308
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["持国巡守施法"]={
		txs1 = 0xa1041d6d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶持国巡守攻击"]={
		txs1 = 0xfa30944c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶持国巡守攻击2"]={
		txs1 = 0xddc3e82d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶持国巡守施法"]={
		txs1 = 0xb2045a0a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["真陀护法攻击"]={
		txs1 = 0xec025a5e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["真陀护法攻击2"]={
		txs1 = 0xf9f0399d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["真陀护法施法"]={
		txs1 = 0xc453a2f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶真陀护法攻击"]={
		txs1 = 0x1ecf6d90
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶真陀护法攻击2"]={
		txs1 = 0x9816f95d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶真陀护法施法"]={
		txs1 = 0xde773ac7
		,txs2 = "shape.wdb"


	}
	Mxtexiaoku["进阶超级六耳猕猴攻击"]={
		txs1 = 0x21d839a3
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级六耳猕猴攻击2"]={
		txs1 = 0x296bd86b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级六耳猕猴施法"]={
		txs1 = 0xe762a017
		,txs2 = "shape.wdb"

	}
	Mxtexiaoku["超级六耳猕猴攻击"]={
		txs1 = 0x46d6a07d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级六耳猕猴攻击2"]={
		txs1 = 0x449eef7c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级六耳猕猴施法"]={
		txs1 = 0x89e544a0
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神羊攻击"]={
		txs1 = 0x63d5219a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["超级神羊攻击2"]={
		txs1 = 0x5fb77edf
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["超级神羊施法"]={
		txs1 = 0x35dd725b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级神羊攻击"]={
		txs1 = 0x5c40c9ce
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级神羊攻击2"]={
		txs1 = 0x2451d0c2
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级神羊施法"]={
		txs1 = 0x7e5de223
		,txs2 = "shape.wdb"

	}
	Mxtexiaoku["超级玉兔攻击"]={
		txs1 = 0x1ed288f4
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级玉兔攻击2"]={
		txs1 = 0x54ab99c8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级玉兔施法"]={
		txs1 = 0x5f8d0a1f
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级玉兔攻击"]={
		txs1 = 0x1ed288f4
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级玉兔攻击2"]={
		txs1 =0x54ab99c8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级玉兔施法"]={
		txs1 = 0x5f8d0a1f
		,txs2 = "shape.wd8"


	}
	Mxtexiaoku["超级土地公公攻击"]={
		txs1 = 0x6be5f454
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级土地公公攻击2"]={
		txs1 = 0xf48458bd
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级土地公公施法"]={
		txs1 = 0x87a7971d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级土地公公攻击"]={
		txs1 = 0xbd793588
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级土地公公攻击2"]={
		txs1 =0x36476e57
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级土地公公施法"]={
		txs1 = 0x87a7971d
		,txs2 = "shape.wd8"

	}
	Mxtexiaoku["超级神鸡攻击"]={
		txs1 = 0xb93a607a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神鸡攻击2"]={
		txs1 = 0xa73d8bc6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神鸡施法"]={
		txs1 = 0x7077369a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神鸡施法2"]={
		txs1 = 0x4058c44b
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡攻击"]={
		txs1 = 0xb0373051
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡攻击2"]={
		txs1 =0xe1cc9b33
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡施法"]={
		txs1 = 0xa8818f22
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡施法2"]={
		txs1 = 0x9d6c0b63
		,txs2 = "shape.wd8"


	}
	Mxtexiaoku["超级神猴攻击"]={
		txs1 = 0xfc84dfce
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神猴攻击2"]={
		txs1 = 0xdb0bf35a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神猴施法"]={
		txs1 = 0x2832090c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神猴攻击"]={
		txs1 = 0x876e0cb3
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神猴攻击2"]={
		txs1 =0x70c03a66
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神猴施法"]={
		txs1 = 0x225228b2
		,txs2 = "shape.wd8"

	}
	Mxtexiaoku["龙马攻击"]={
		txs1 = 0x6641afe4
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["龙马攻击2"]={
		txs1 =0x7cae7545
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["龙马施法"]={
		txs1 = 0xdb361ae8
		,txs2 = "shape.wd8"

	}
	Mxtexiaoku["李靖攻击"]={
		txs1 = 0x9f8df0b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李天王攻击"]={
		txs1 = 0x9f8df0b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李靖攻击2"]={
		txs1 =0x79763ad1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李天王攻击2"]={
		txs1 =0x79763ad1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李靖施法"]={
		txs1 = 0x960983b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李天王施法"]={
		txs1 = 0x960983b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音姐姐攻击"]={
		txs1 = 0xffededb5
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音菩萨攻击"]={
		txs1 = 0xffededb5
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音姐姐攻击2"]={
		txs1 =0xc0baa3a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音菩萨攻击2"]={
		txs1 =0xc0baa3a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音姐姐施法"]={
		txs1 = 0x94596b0c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音菩萨施法"]={
		txs1 = 0x94596b0c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["空度禅师攻击"]={
		txs1 = 0xca02d49e
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["空度禅师攻击2"]={
		txs1 =0xacb80e59
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["空度禅师施法"]={
		txs1 =0xb2458366
		,txs2 = "shape.wd8"

	}
	Mxtexiaoku["地藏王攻击"]={
		txs1 = 0x7a8c772c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏菩萨攻击"]={
		txs1 = 0x7a8c772c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏王攻击2"]={
		txs1 =0x451d6b7d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏菩萨攻击2"]={
		txs1 =0x451d6b7d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏王施法"]={
		txs1 =0xddba60f9
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏菩萨施法"]={
		txs1 =0xddba60f9
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元子攻击"]={
		txs1 = 0xa927eb1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元大仙攻击"]={
		txs1 = 0xa927eb1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元子攻击2"]={
		txs1 =0xde4223a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元大仙攻击2"]={
		txs1 =0xde4223a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元子施法"]={
		txs1 =0x8c59ab3b
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元大仙施法"]={
		txs1 =0x8c59ab3b
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["大大王攻击"]={
		txs1 = 0xc2855f45
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["青狮精攻击"]={
		txs1 = 0xc2855f45
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["大大王攻击2"]={
		txs1 =0x23094a8c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["青狮精攻击2"]={
		txs1 =0x23094a8c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["大大王施法"]={
		txs1 =0x2af1f828
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["青狮精施法"]={
		txs1 =0x2af1f828
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提祖师攻击"]={
		txs1 = 0x1ea7de85
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提祖师攻击2"]={
		txs1 =0xcd093578
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提祖师施法"]={
		txs1 =0xb8d766b2
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提老祖攻击"]={
		txs1 = 0x1ea7de85
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提老祖攻击2"]={
		txs1 =0xcd093578
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提老祖施法"]={
		txs1 =0xb8d766b2
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["哮天犬攻击"]={
		txs1 = 0x9ac4a6ed
		,txs2 = "shape.wda"
	}
	Mxtexiaoku["哮天犬攻击2"]={
		txs1 =0x2cd5c2fe
		,txs2 = "shape.wda"
	}
	Mxtexiaoku["哮天犬施法"]={
		txs1 = 0x9457f168
		,txs2 = "shape.wda"
	}
	Mxtexiaoku["进阶哮天犬攻击"]={
		txs1 = 0x3258556f
		,txs2 = "shape.wda"
	}
	Mxtexiaoku["进阶哮天犬攻击2"]={
		txs1 =0x19438299
		,txs2 = "shape.wda"
	}
	Mxtexiaoku["进阶哮天犬施法"]={
		txs1 = 0xa182805f
		,txs2 = "shape.wda"
	}
	Mxtexiaoku["牛魔王攻击" ]={
		txs1 = 0x9c029a9
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["牛魔王攻击2" ]={
		txs1 =0xb1f577ab
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["牛魔王施法" ]={
		txs1 =0x72c110e5
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["东海龙王攻击"]={
		txs1 = 0x6c5cbb68
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["东海龙王攻击2"]={
		txs1 =0xe75daeaa
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["东海龙王施法"]={
		txs1 =0x9ca707d3
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["男人_东海龙王攻击"]={
		txs1 = 0x6c5cbb68
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["男人_东海龙王攻击2"]={
		txs1 =0xe75daeaa
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["男人_东海龙王施法"]={
		txs1 =0x9ca707d3
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["孙婆婆攻击" ]={
		txs1 = 0xf201592
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["孙婆婆攻击2" ]={
		txs1 =0x6f515e25
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["孙婆婆施法" ]={
		txs1 =0x73b1558f
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["进阶小毛头攻击"]={
		txs1 = 0xd7562254
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小毛头攻击2"]={
		txs1 = 0x934fab88
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小毛头施法"]={
		txs1 = 0x88c50de5
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小丫丫攻击"]={
		txs1 = 0xe135cc7c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小丫丫攻击2"]={
		txs1 = 0xe6b82194
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小丫丫施法"]={
		txs1 = 0x6f77d45
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小魔头攻击"]={
		txs1 = 0x7d766a65
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小魔头攻击2"]={
		txs1 = 0x5e1e29cb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小魔头施法"]={
		txs1 = 0xc1810c1d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小精灵攻击"]={
		txs1 = 0xa87f72d7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小精灵攻击2"]={
		txs1 = 0x9d79f43f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小精灵施法"]={
		txs1 = 0xf623febc
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙灵攻击"]={
		txs1 = 0x438fea2a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙灵攻击2"]={
		txs1 = 0xfedf20ac
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙灵施法"]={
		txs1 = 0x5dbb1568
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙女攻击"]={
		txs1 = 0x9ac5f9db
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙女攻击2"]={
		txs1 = 0x7e6fed4b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙女施法"]={
		txs1 = 0x955e84dd
		,txs2 = "shape.wdb"

	----------------------------------------------------------------shape.wdc
	}
	Mxtexiaoku["进阶黑山老妖攻击"]={
		txs1 = 0x123e5270
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶黑山老妖攻击2"]={
		txs1 = 0x460b1eb7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶黑山老妖施法"]={
		txs1 = 0x7eedb37d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶白熊攻击"]={
		txs1 = 0xf90e825a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶白熊攻击2"]={
		txs1 = 0x5ec0e760
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶白熊施法"]={
		txs1 = 0xa8ee7f08
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶风伯攻击"]={
		txs1 = 0xea7e19ad
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶风伯攻击2"]={
		txs1 = 0x13e62d29
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶风伯施法"]={
		txs1 = 0xfe6fd88
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶天将攻击"]={
		txs1 = 0xbe65728f--0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶天将攻击2"]={
		txs1 = 0xb2854590
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶天将施法"]={
		txs1 = 0x9b29e8fc
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶碧水夜叉攻击"]={
		txs1 = 0xd161263b
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶碧水夜叉攻击2"]={
		txs1 = 0x20739b2f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶碧水夜叉施法"]={
		txs1 = 0x283b0731
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蚌精攻击"]={
		txs1 = 0x5da14093
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蚌精攻击2"]={
		txs1 = 0x87a988a6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蚌精施法"]={
		txs1 = 0x1a5bcf97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶地狱战神攻击"]={
		txs1 = 0xa91a54b2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶地狱战神攻击2"]={
		txs1 = 0x5e3d1399
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶地狱战神施法"]={
		txs1 = 0x37697f1f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶雨师攻击"]={
		txs1 = 0x95c26e4f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶雨师攻击2"]={
		txs1 = 0x64354fe0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶雨师施法"]={
		txs1 = 0xa45d4b32
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶星灵仙子攻击"]={
		txs1 = 0x9a88f10f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶星灵仙子攻击2"]={
		txs1 = 0x2f83b341
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶星灵仙子施法"]={
		txs1 = 0xee51c201
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巡游天神攻击"]={
		txs1 = 0xf1aebdcd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巡游天神攻击2"]={
		txs1 = 0x95c4bd51
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巡游天神施法"]={
		txs1 = 0xade34bbc
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶锦毛貂精攻击"]={
		txs1 = 0x460b1eb7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶锦毛貂精攻击2"]={
		txs1 = 0xbd210400
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶锦毛貂精施法"]={
		txs1 = 0xb390a1fd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶千年蛇魅攻击"]={
		txs1 = 0xed9f3561
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶千年蛇魅攻击2"]={
		txs1 = 0x4b65b5d9
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶千年蛇魅施法"]={
		txs1 = 0xc2746881
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶野猪精攻击"]={
		txs1 = 0xdac8410
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶野猪精攻击2"]={
		txs1 = 0xb0890cb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶野猪精施法"]={
		txs1 = 0x9676f109
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶百足将军攻击"]={
		txs1 = 0xf06aefeb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶百足将军攻击2"]={
		txs1 = 0x9f8c999c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶百足将军施法"]={
		txs1 = 0xde2347
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶鼠先锋攻击"]={
		txs1 = 0xa1239e33
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶鼠先锋攻击2"]={
		txs1 = 0xb3ea50aa
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶鼠先锋施法"]={
		txs1 = 0x149316b4
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["泪妖攻击"]={
		txs1 = 0xe8923a84
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["泪妖攻击2"]={
		txs1 = 0xf6807d96
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["泪妖施法"]={
		txs1 = 0x774f7a03
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶泪妖攻击"]={
		txs1 = 0x7fdc1d43
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶泪妖攻击2"]={
		txs1 = 0x62649885
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶泪妖施法"]={
		txs1 = 0x6a570a79
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["镜妖攻击"]={
		txs1 = 0x48f1fe02
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["镜妖攻击2"]={
		txs1 = 0xba30964e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["镜妖施法"]={
		txs1 = 0x6bb76cce
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶镜妖攻击"]={
		txs1 = 0xc02f26a5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶镜妖攻击2"]={
		txs1 = 0x526fae9c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶镜妖施法"]={
		txs1 = 0xc645150e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶阴阳伞攻击"]={
		txs1 = 0x9ae21560
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶阴阳伞攻击2"]={
		txs1 = 0x79d1ee6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶阴阳伞施法"]={
		txs1 = 0xc883c02f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵鹤攻击"]={
		txs1 = 0xe80ab0db
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵鹤攻击2"]={
		txs1 = 0xe212e9c3
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵鹤施法"]={
		txs1 = 0x788dbf99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙攻击"]={
		txs1 = 0x27091438
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["琴仙攻击2"]={
		txs1 = 0x54fc3258
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["琴仙施法"]={
		txs1 = 0xe261700c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙攻击"]={
		txs1 = 0x27091438
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙攻击2"]={
		txs1 = 0xa68fd1f7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙施法"]={
		txs1 = 0x62a2596c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["金饶僧攻击"]={
		txs1 = 0xe46674a2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["金饶僧攻击2"]={
		txs1 = 0xd7ed2bc6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["金饶僧施法"]={
		txs1 = 0x46384746
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金饶僧攻击"]={
		txs1 = 0x18014e24
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金饶僧攻击2"]={
		txs1 = 0xbe826521
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金饶僧施法"]={
		txs1 = 0x41e3bff9
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶葫芦宝贝攻击"]={
		txs1 = 0xd0d575ac
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶葫芦宝贝攻击2"]={
		txs1 = 0x5b5cbde0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶葫芦宝贝施法"]={
		txs1 = 0x74252756
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶红萼仙子攻击"]={
		txs1 = 0xb7fd0cc5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶红萼仙子攻击2"]={
		txs1 = 0x4f211b8e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶红萼仙子施法"]={
		txs1 = 0x6e719ab2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蝎子精攻击"]={
		txs1 = 0x76fdb3c1
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蝎子精攻击2"]={
		txs1 = 0x99de926c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蝎子精施法"]={
		txs1 = 0xde8feb67
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关兽攻击"]={
		txs1 = 0x46735ef7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关兽攻击2"]={
		txs1 = 0x2b134d98
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关兽施法"]={
		txs1 = 0x3be331a5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关人人形攻击"]={
		txs1 = 0xc4c0e792
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关人人形攻击2"]={
		txs1 = 0x2374b0f8
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关人人形施法"]={
		txs1 = 0xd2c4def2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关鸟攻击"]={
		txs1 = 0x6346e4d2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关鸟攻击2"]={
		txs1 = 0x3b8ecb7d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关鸟施法"]={
		txs1 = 0xb8e00d09
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶连弩车攻击"]={
		txs1 = 0x8c3f954d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶连弩车攻击2"]={
		txs1 = 0x1decdcb0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶连弩车施法"]={
		txs1 = 0xb0848bfb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巴蛇攻击"]={
		txs1 = 0xf90e825a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巴蛇攻击2"]={
		txs1 = 0x9b5b839b
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巴蛇施法"]={
		txs1 = 0xf7901ba1
		,txs2 = "shape.wdc"

	}
	Mxtexiaoku["进阶长眉灵猴攻击"]={
		txs1 = 0x8866e34a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶长眉灵猴攻击2"]={
		txs1 = 0xf58576fb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶长眉灵猴施法"]={
		txs1 = 0x3d697d14
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巨力神猿攻击"]={
		txs1 = 0xb4cbfd3f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巨力神猿攻击2"]={
		txs1 = 0x61c6fa0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巨力神猿施法"]={
		txs1 = 0xe11d3d6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶藤蔓妖花攻击"]={
		txs1 = 0xa3a0e64a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶藤蔓妖花攻击2"]={
		txs1 = 0x75fc6569
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶藤蔓妖花施法"]={
		txs1 = 0xd2dda7a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金身罗汉攻击"]={
		txs1 = 0xbe8a540e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金身罗汉攻击2"]={
		txs1 = 0xa74e47d4
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金身罗汉施法"]={
		txs1 = 0xc9c5c1a7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶曼珠沙华攻击"]={
		txs1 = 0xb7ff1e5a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶曼珠沙华攻击2"]={
		txs1 = 0x63503fe9
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶曼珠沙华施法"]={
		txs1 = 0xea292149
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["增长巡守攻击"]={
		txs1 = 0x4aa9d4dd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["增长巡守攻击2"]={
		txs1 = 0x57980622
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["增长巡守施法"]={
		txs1 = 0x4aaeb519
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶增长巡守攻击"]={
		txs1 = 0x4aa9d4dd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶增长巡守攻击2"]={
		txs1 = 0xbc3eaa3a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶增长巡守施法"]={
		txs1 = 0xef92f600
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["灵灯侍者攻击"]={
		txs1 = 0xaa40dc28
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["灵灯侍者攻击2"]={
		txs1 = 0x7966374d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵灯侍者攻击"]={
		txs1 = 0x20c26b09
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵灯侍者攻击2"]={
		txs1 = 0x65f3d51e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵灯侍者施法"]={
		txs1 = 0xf3ca9b9d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["般若天女攻击"]={
		txs1 = 0x813c3438
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["般若天女攻击2"]={
		txs1 = 0x63a1780c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["般若天女施法"]={
		txs1 = 0x1feb2910
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶般若天女攻击"]={
		txs1 = 0xe59c493a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶般若天女攻击2"]={
		txs1 = 0x5e9c020a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶般若天女施法"]={
		txs1 = 0x4a5c90be
		,txs2 = "shape.wdc"

	}
	Mxtexiaoku["自在天魔宝珠攻击"]={
		txs1 = 0xcc90d6d3
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝珠攻击2"]={
		txs1 = 0xe9e021f1
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝珠施法"]={
		txs1 = 0xe9e021f1
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔刀攻击"]={
		txs1 = 0xe4144a99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔刀攻击2"]={
		txs1 = 0xe4144a99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔刀施法"]={
		txs1 = 0xe4144a99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝剑攻击"]={
		txs1 = 0xc71ec94e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝剑攻击2"]={
		txs1 = 0xc71ec94e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝剑施法"]={
		txs1 = 0xc71ec94e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔经筒攻击"]={
		txs1 = 0xad765f97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔经筒攻击2"]={
		txs1 = 0xad765f97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔经筒施法"]={
		txs1 = 0xad765f97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔弓弩攻击"]={
		txs1 = 0xb109bcf2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔弓弩攻击2"]={
		txs1 = 0xb109bcf2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔弓弩施法"]={
		txs1 = 0xb109bcf2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔法杖攻击"]={
		txs1 = 0xf3ffc8ed
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔法杖攻击2"]={
		txs1 = 0xf3ffc8ed
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔法杖施法"]={
		txs1 = 0xf3ffc8ed
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔斧钺攻击"]={
		txs1 = 0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔斧钺攻击2"]={
		txs1 = 0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔斧钺施法"]={
		txs1 = 0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔攻击"]={
		txs1 = 0xef5821e5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔攻击2"]={
		txs1 = 0xef5821e5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔施法"]={
		txs1 = 0x35aa81a7
		,txs2 = "shape.wdc"
	-------------------------------
	}
	Mxtexiaoku["小毛头攻击"]={
		txs1 = 0x8aa62a0f
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小丫丫施法"]={
		txs1 = 0xd5abc8d4
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小精灵攻击"]={
		txs1 = 0x130a9b37
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小精灵施法"]={
		txs1 = 0x5dfc166f
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙灵攻击"]={
		txs1 = 0x100d17e2
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙灵攻击2"]={
		txs1 = 0x9290e494
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙灵施法"]={
		txs1 = 0x3fcec9f6
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙女攻击"]={
		txs1 = 0x1449c3a8
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙女攻击2"]={
		txs1 = 0xcf38fd3d
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙女施法"]={
		txs1 = 0x7d39a425
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["雪人攻击"]={
		txs1 = 0x19cdf673
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["雪人攻击2"]={
		txs1 = 0x9c60288
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["雪人施法"]={
		txs1 = 0x8150f82a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["雪人施法2"]={
		txs1 = 0xe2cd2c8
		,txs2 = "common/shape.wdf"
	---------------
	}
	Mxtexiaoku["进阶猫灵兽形攻击"]={
		txs1 = 0xad5a8508
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵兽形攻击2"]={
		txs1 = 0x1a0e8ceb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵兽形施法"]={
		txs1 = 0xc1f5fe1e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵人形攻击"]={
		txs1 = 0xad5a8508
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵人形攻击2"]={
		txs1 = 0x1a0e8ceb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵人形施法"]={
		txs1 = 0xda3a2696
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["狂豹兽形攻击"]={
		txs1 = 0x4775e8d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["狂豹兽形攻击2"]={
		txs1 = 0x6c23b003
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["狂豹兽形施法"]={
		txs1 = 0xc3b82b9a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶狂豹兽形攻击"]={
		txs1 = 0xf709454a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹兽形攻击2"]={
		txs1 = 0xf8b6ff97
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹兽形施法"]={
		txs1 = 0xc0021bb9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹人形攻击"]={
		txs1 = 0x79878052
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹人形攻击2"]={
		txs1 = 0x2C3F4457
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹人形施法"]={
		txs1 = 0x4cc37fe1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["混沌兽攻击"]={
		txs1 = 0x1850de8c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["混沌兽攻击2"]={
		txs1 = 0xe404a24c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["混沌兽施法"]={
		txs1 = 0xb6bac528
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶混沌兽攻击"]={
		txs1 = 0xdf86b03
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶混沌兽攻击2"]={
		txs1 = 0x3ea4065a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶混沌兽施法"]={
		txs1 = 0xa6eda0a1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["飞燕女攻击_双短剑1"]={
		txs1 = 0x8e38ad6a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_双短剑1"]={
		txs1 = 0x8e38ad6a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_双短剑1"]={
		txs1 = 0x6a60178d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击_环圈1"]={
		txs1 = 0xbad926db
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_环圈1"]={
		txs1 = 0xbad926db
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_环圈1"]={
		txs1 = 0x36bdc402
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击_双短剑2"]={
		txs1 = 0x7d959e28
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_双短剑2"]={
		txs1 = 0x7d959e28
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_双短剑2"]={
		txs1 = 0x87f8c21a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击_环圈2"]={
		txs1 =0x2142b0d7
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_环圈2"]={
		txs1 =0x2142b0d7
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_环圈2"]={
		txs1 = 0xc6758d02
		,txs2 = "common/shape.wdf"
	}

		--==================================================人物攻击施法特效0-80级
    Mxtexiaoku["剑侠客攻击_剑1"]={
        txs1 = 0xABCAB209
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客攻击2_剑1"]={
        txs1 = 0xABCAB209
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客施法_剑1"]={
        txs1 = 0xABCAB210
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客攻击_刀1"]={
        txs1 = 0xABCAB207
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客攻击2_刀1"]={
        txs1 = 0xABCAB207
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客施法_刀1"]={
        txs1 = 0xABCAB208
        ,txs2 = "剑侠客素材.wdf"
    }
--==================================================人物攻击施法特效90-160级

    Mxtexiaoku["剑侠客攻击_剑2"]={
        txs1 = 0xABCAB211
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客攻击2_剑2"]={
        txs1 = 0xABCAB211
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客施法_剑2"]={
        txs1 = 0xABCAB212
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客攻击_刀2"]={
        txs1 = 0xABCAB213
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客攻击2_刀2"]={
        txs1 = 0xABCAB213
        ,txs2 = "剑侠客素材.wdf"
    }
    Mxtexiaoku["剑侠客施法_刀2"]={
        txs1 = 0xABCAB208
        ,txs2 = "剑侠客素材.wdf"
    }

	
	Mxtexiaoku["逍遥生攻击_剑1"]={
		txs1 = 0x6e78c93b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_剑1"]={
		txs1 = 0x6e78c93b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_剑1"]={
		txs1 = 0x5f809c80
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击_扇1"]={
		txs1 = 0x99594e46
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_扇1"]={
		txs1 = 0x99594e46
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_扇1"]={
		txs1 = 0xe472b0be
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击_剑2"]={
		txs1 = 0x3936cbe8
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_剑2"]={
		txs1 = 0x3936cbe8
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_剑2"]={
		txs1 = 0x6620a3a2
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击_扇2"]={
		txs1 =0x797993b0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_扇2"]={
		txs1 =0x797993b0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_扇2"]={
		txs1 = 0x193e046
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_爪刺1"]={
		txs1 = 0xf471d81d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_爪刺1"]={
		txs1 = 0xf471d81d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_爪刺1"]={
		txs1 = 0xbe5cad45
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_鞭1"]={
		txs1 = 0x91c32d86
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_鞭1"]={
		txs1 = 0x91c32d86
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_鞭1"]={
		txs1 = 0xf3b0aa07
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_爪刺2"]={
		txs1 = 0x846f1074
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_爪刺2"]={
		txs1 = 0x846f1074
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_爪刺2"]={
		txs1 = 0x1d156715
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_鞭2"]={
		txs1 =0x2f78067e
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_鞭2"]={
		txs1 =0x2f78067e
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_鞭2"]={
		txs1 = 0xa241eab1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_爪刺1"]={
		txs1 = 0xd36bc394
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_爪刺1"]={
		txs1 = 0xd36bc394
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_爪刺1"]={
		txs1 = 0x287fb10
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_魔棒1"]={
		txs1 = 0x1332ce5d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_魔棒1"]={
		txs1 = 0x1332ce5d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_魔棒1"]={
		txs1 = 0x56994640
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_爪刺2"]={
		txs1 = 0xd04d9728
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_爪刺2"]={
		txs1 = 0xd04d9728
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_爪刺2"]={
		txs1 = 0x3563d35f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_魔棒2"]={
		txs1 =0x4fdffa0c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_魔棒2"]={
		txs1 =0x4fdffa0c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_魔棒2"]={
		txs1 = 0xb402d438
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_斧钺1"]={
		txs1 = 0x60e4c3fa
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_斧钺1"]={
		txs1 = 0x60e4c3fa
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_斧钺1"]={
		txs1 = 0x67174e05
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_刀1"]={
		txs1 = 0x1700a6c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_刀1"]={
		txs1 = 0x1700a6c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_刀1"]={
		txs1 = 0xd350be85
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_斧钺2"]={
		txs1 = 0xe3ae17c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_斧钺2"]={
		txs1 = 0xe3ae17c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_斧钺2"]={
		txs1 = 0xe5a28f36
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_刀2"]={
		txs1 =0x826228c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_刀2"]={
		txs1 =0x826228c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_刀2"]={
		txs1 = 0x2a172a4b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_斧钺1"]={
		txs1 = 0x46ab3059
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_斧钺1"]={
		txs1 = 0x46ab3059
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_斧钺1"]={
		txs1 = 0xe8e12086
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_锤1"]={
		txs1 = 0xde8167d1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_锤1"]={
		txs1 = 0xde8167d1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_锤1"]={
		txs1 = 0x5a51ca67
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_斧钺2"]={
		txs1 = 0x9e683b76
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_斧钺2"]={
		txs1 = 0x9e683b76
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_斧钺2"]={
		txs1 = 0x7a01cd70
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_锤2"]={
		txs1 =0x92cb1dc9
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_锤2"]={
		txs1 =0x92cb1dc9
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_锤2"]={
		txs1 = 0x55d81513
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_飘带1"]={
		txs1 = 0xf10824d6
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_飘带1"]={
		txs1 = 0xf10824d6
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_飘带1"]={
		txs1 = 0xa2e7afcf
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_环圈1"]={
		txs1 = 0x5b45294c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_环圈1"]={
		txs1 = 0x5b45294c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_环圈1"]={
		txs1 = 0xb1e11fb1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_飘带2"]={
		txs1 = 0x35264f52
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_飘带2"]={
		txs1 = 0x35264f52
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_飘带2"]={
		txs1 = 0xd56def19
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_环圈2"]={
		txs1 =0xe0fbfac1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_环圈2"]={
		txs1 =0xe0fbfac1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_环圈2"]={
		txs1 = 0x3ae4c1c0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_飘带1"]={
		txs1 = 0xeac576e0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_飘带1"]={
		txs1 = 0xeac576e0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_飘带1"]={
		txs1 = 0x976f350f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_魔棒1"]={
		txs1 = 0xdec05693
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_魔棒1"]={
		txs1 = 0xdec05693
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_魔棒1"]={
		txs1 = 0x9f35ea32
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_飘带2"]={
		txs1 =  0x3cd82541
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_飘带2"]={
		txs1 = 0x3cd82541
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_飘带2"]={
		txs1 = 0x60d01153
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_魔棒2"]={
		txs1 =0x440a2bc5
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_魔棒2"]={
		txs1 =0x440a2bc5
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_魔棒2"]={
		txs1 = 0x4ff6b583
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_枪矛1"]={
		txs1 = 0xe2770734
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_枪矛1"]={
		txs1 = 0xe2770734
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_枪矛1"]={
		txs1 = 0xafbcb42d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_锤1"]={
		txs1 = 0x4e65cd50
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_锤1"]={
		txs1 = 0x4e65cd50
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_锤1"]={
		txs1 = 0x3c1ec801
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_枪矛2"]={
		txs1 = 0x36284398
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_枪矛2"]={
		txs1 = 0x36284398
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_枪矛2"]={
		txs1 = 0x32170257
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_锤2"]={
		txs1 =0xc7b92924
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_锤2"]={
		txs1 =0xc7b92924
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_锤2"]={
		txs1 = 0x1c55c59f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_枪矛1"]={
		txs1 = 0x6c1e5a4a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_枪矛1"]={
		txs1 = 0x6c1e5a4a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_枪矛1"]={
		txs1 = 0xdd3b0296
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_扇1"]={
		txs1 = 0xfe2c7349
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_扇1"]={
		txs1 = 0xfe2c7349
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_扇1"]={
		txs1 = 0x42c2f6be
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_枪矛2"]={
		txs1 = 0x7ade766c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_枪矛2"]={
		txs1 = 0x7ade766c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_枪矛2"]={
		txs1 = 0x401df67b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_扇2"]={
		txs1 =0x6ddc0f67
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_扇2"]={
		txs1 =0x6ddc0f67
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_扇2"]={
		txs1 = 0x3aac439a
		,txs2 = "common/shape.wdf"

	}

	Mxtexiaoku["影精灵攻击_魔棒2"]={
        txs1 = 0x10000358
        ,txs2 = "cwmx.wdf"
    }
    Mxtexiaoku["影精灵攻击2_魔棒2"]={
        txs1 = 0x10000358
        ,txs2 = "cwmx.wdf"
    }
    Mxtexiaoku["影精灵施法_魔棒2"]={
        txs1 = 0x10000359
        ,txs2 = "影精灵锦衣.wdf"
    }
    Mxtexiaoku["影精灵攻击_爪刺2"]={
        txs1 = 0x10000361
        ,txs2 = "影精灵锦衣.wdf"
    }
    Mxtexiaoku["影精灵攻击2_爪刺2"]={
        txs1 = 0x10000361
        ,txs2 = "影精灵锦衣.wdf"
    }
    Mxtexiaoku["影精灵施法_爪刺2"]={
        txs1 = 0x10000363
        ,txs2 = "影精灵锦衣.wdf"
    }
	

	Mxtexiaoku["影精灵攻击_双斧乾2"]={
        txs1 = 0x10000358
        ,txs2 = "cwmx.wdf"
    }
    Mxtexiaoku["影精灵攻击2_双斧乾2"]={
        txs1 = 0x10000340
        ,txs2 = "cwmx.wdf"
    }
    Mxtexiaoku["影精灵施法_双斧乾2"]={
        txs1 = 0x10000341
        ,txs2 = "cwmx.wdf"
    }



    Mxtexiaoku["影精灵攻击_双斧坤2"]={
        txs1 = 0x10000358
        ,txs2 = "cwmx.wdf"
    }
    Mxtexiaoku["影精灵攻击2_双斧坤2"]={
        txs1 = 0x10000340
        ,txs2 = "cwmx.wdf"
    }
    Mxtexiaoku["影精灵施法_双斧坤2"]={
        txs1 = 0x10000341
        ,txs2 = "cwmx.wdf"
    }


	
	Mxtexiaoku["鬼潇潇攻击_伞1"]={
		txs1 = 0x78b26a25
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_伞1"]={
		txs1 = 0x78b26a25
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_伞1"]={
		txs1 = 0x67b53394
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击_爪刺1"]={
		txs1 = 0xb0aada79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_爪刺1"]={
		txs1 = 0xb0aada79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_爪刺1"]={
		txs1 = 0x223b9d9d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击_伞2"]={
		txs1 = 0xb2fd1e56
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_伞2"]={
		txs1 = 0xb2fd1e56
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_伞2"]={
		txs1 = 0xf46e4bb3
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击_爪刺2"]={
		txs1 = 0x44c94422
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_爪刺2"]={
		txs1 = 0x44c94422
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_爪刺2"]={
		txs1 = 0x3dab59bd
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_巨剑1"]={
		txs1 = 0x55b9bb79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_巨剑1"]={
		txs1 = 0x55b9bb79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_巨剑1"]={
		txs1 = 0x8cbb28a0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_剑1"]={
		txs1 = 0x650fe30c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_剑1"]={
		txs1 = 0x650fe30c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_剑1"]={
		txs1 = 0x3bb4c654
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_巨剑2"]={
		txs1 = 0xef1d0947
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_巨剑2"]={
		txs1 = 0xef1d0947
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_巨剑2"]={
		txs1 = 0xc56b969c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_剑2"]={
		txs1 = 0xd84c88cc
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_剑2"]={
		txs1 = 0xd84c88cc
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_剑2"]={
		txs1 = 0xa2217adf
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_灯笼1"]={
		txs1 = 0xf109b42d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_灯笼1"]={
		txs1 = 0xf109b42d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_灯笼1"]={
		txs1 = 0xb1aa60dd
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_飘带1"]={
		txs1 = 0x707d130d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_飘带1"]={
		txs1 = 0x707d130d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_飘带1"]={
		txs1 = 0x6db596dc
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_灯笼2"]={
		txs1 = 0xc7f8ca2f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_灯笼2"]={
		txs1 = 0xc7f8ca2f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_灯笼2"]={
		txs1 = 0x244480ee
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_飘带2"]={
		txs1 =0xbfb57680
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_飘带2"]={
		txs1 =0xbfb57680
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_飘带2"]={
		txs1 = 0x175b63c0
		,txs2 = "common/shape.wdf"
	}

	---迭代
	Mxtexiaoku["自在心猿攻击" ]={
		txs1 =0xAAA00010
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["自在心猿攻击2" ]={
		txs1 =0xAAA00010
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["自在心猿施法" ]={
		txs1 =0xAAA00013
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["涂山瞳攻击"]={
		txs1 = 0xAA100040
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["涂山瞳攻击2"]={
		txs1 = 0xAA100043
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["涂山瞳施法"]={
		txs1 = 0xAA100046
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶涂山瞳攻击"]={
		txs1 = 0xAA100010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶涂山瞳攻击2"]={
		txs1 = 0xAA100013
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶涂山瞳施法"]={
		txs1 = 0xAA100016
		,txs2 = "diedai.wdf"
	}



	Mxtexiaoku["广目巡守攻击" ]={
		txs1 = 0x01001808
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["广目巡守施法" ]={
		txs1 =0x01001811
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["独角鬼王攻击" ]={
		txs1 = 0x01001608
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["独角鬼王施法" ]={
		txs1 =0x01001613
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["阿宝攻击" ]={
		txs1 = 0x01000108
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["阿宝施法" ]={
		txs1 = 0x01000111
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["芭将军攻击" ]={
		txs1 = 0x01000204
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["芭将军施法" ]={
		txs1 = 0x01000209
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["冰龟攻击" ]={
		txs1 = 0x01000304
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["冰龟施法" ]={
		txs1 = 0x01000307
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["冰火龟攻击" ]={
		txs1 = 0x01000404
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["冰火龟施法" ]={
		txs1 = 0x01000407
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["草龟攻击" ]={
		txs1 = 0x01000504
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["草龟施法" ]={
		txs1 = 0x01000507
		,txs2 = "diedai.wdf"
	}
		--特效
	Mxtexiaoku["草叶虫攻击" ]={
		txs1 = 0x01000604
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["草叶虫施法" ]={
		txs1 = 0x01000607
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["草叶魂虫攻击" ]={
		txs1 = 0x01000704
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["草叶魂虫施法" ]={
		txs1 = 0x01000707
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["超级飞廉攻击" ]={
		txs1 = 0x01000808
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["超级飞廉施法" ]={
		txs1 =0x01000813
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["超级离火兽攻击" ]={
		txs1 = 0x01000908
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["超级离火兽施法" ]={
		txs1 =0x01000913
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["超级神兔攻击" ]={
		txs1 = 0x01001004
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["超级神兔施法" ]={
		txs1 =0x01001007
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["大力金刚攻击" ]={
		txs1 = 0x01001108
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["大力金刚施法" ]={
		txs1 =0x01001113
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["谛听攻击" ]={
		txs1 = 0x01001208
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["谛听施法" ]={
		txs1 =0x01001213
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["毒花龟(日)攻击" ]={
		txs1 = 0x01001304
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["毒花龟(日)施法" ]={
		txs1 =0x01001307
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["毒花龟(夜)攻击" ]={
		txs1 = 0x01001404
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["毒花龟(夜)施法" ]={
		txs1 =0x01001407
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["毒云龟攻击" ]={
		txs1 = 0x01001504
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["毒云龟施法" ]={
		txs1 =0x01001507
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["独角鬼王攻击" ]={
		txs1 = 0x01001608
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["独角鬼王施法" ]={
		txs1 =0x01001613
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["芙蓉仙子攻击" ]={
		txs1 = 0x01001710
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["芙蓉仙子施法" ]={
		txs1 =0x01001710
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["广目巡守攻击" ]={
		txs1 = 0x01001808
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["广目巡守施法" ]={
		txs1 =0x01001811
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["鬼将攻击" ]={
		txs1 = 0x01001908
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["鬼将施法" ]={
		txs1 =0x01001911
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["鬼狸攻击" ]={
		txs1 = 0x01002008
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["鬼狸施法" ]={
		txs1 =0x01002011
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["鬼蛙攻击" ]={
		txs1 = 0x01002104
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["鬼蛙施法" ]={
		txs1 =0x01002106
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["海狸攻击" ]={
		txs1 = 0x01002204
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["海狸施法" ]={
		txs1 =0x01002206
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["黑山老妖攻击" ]={
		txs1 = 0x01002308
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["黑山老妖施法" ]={
		txs1 =0x01002311
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["幻姬攻击" ]={
		txs1 = 0x01002408
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["幻姬施法" ]={
		txs1 =0x01002411
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["火沙虫攻击" ]={
		txs1 = 0x01002504
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["火沙虫施法" ]={
		txs1 =0x01002506
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["火月蛙攻击" ]={
		txs1 = 0x01002604
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["火月蛙施法" ]={
		txs1 =0x01002606
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["火云龟攻击" ]={
		txs1 = 0x01002704
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["火云龟施法" ]={
		txs1 =0x01002706
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["积水鬼蛙攻击" ]={
		txs1 = 0x01002804
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["积水鬼蛙施法" ]={
		txs1 =0x01002806
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["积水蛙攻击" ]={
		txs1 = 0x01002904
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["积水蛙施法" ]={
		txs1 =0x01002906
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["蛟龙攻击" ]={
		txs1 = 0x01003003
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["蛟龙施法" ]={
		txs1 =0x01003005
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["金乌虫攻击" ]={
		txs1 = 0x01003104
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["金乌虫施法" ]={
		txs1 =0x01003106
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["金乌火虫攻击" ]={
		txs1 = 0x01003204
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["金乌火虫施法" ]={
		txs1 =0x01003206
		,txs2 = "diedai.wdf"
	}


	Mxtexiaoku["金乌月光虫攻击" ]={
		txs1 = 0x01003204
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["金乌月光虫施法" ]={
		txs1 =0x01003206
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["金翼攻击" ]={
		txs1 = 0x01003418
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["金翼施法" ]={
		txs1 =0x01003424
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["雷龙攻击" ]={
		txs1 = 0x01003514
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["雷龙施法" ]={
		txs1 =0x01003520
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["龙狸攻击" ]={
		txs1 = 0x01003618
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["龙狸施法" ]={
		txs1 =0x01003624
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["魔化涂山瞳攻击" ]={
		txs1 = 0x01003706
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["魔化涂山瞳施法" ]={
		txs1 =0x01003709
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["魔化有苏鸩攻击" ]={
		txs1 = 0x01003807
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["魔化有苏鸩施法" ]={
		txs1 =0x01003811
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["莫忘攻击" ]={
		txs1 = 0x01003904
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["莫忘施法" ]={
		txs1 =0x01003905
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["胖海狸攻击" ]={
		txs1 = 0x01004006
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["胖海狸施法" ]={
		txs1 =0x01004010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡飞燕女攻击" ]={
		txs1 = 0x01004118
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡飞燕女施法" ]={
		txs1 =0x01004121
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡骨精灵攻击" ]={
		txs1 = 0x01004218
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡骨精灵施法" ]={
		txs1 =0x01004221
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡剑侠客攻击" ]={
		txs1 = 0x01004318
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡剑侠客施法" ]={
		txs1 =0x01004321
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡龙太子攻击" ]={
		txs1 = 0x01004418
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡龙太子施法" ]={
		txs1 =0x01004421
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡杀破狼攻击" ]={
		txs1 = 0x01004518
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡杀破狼施法" ]={
		txs1 =0x01004521
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡神天兵攻击" ]={
		txs1 = 0x01004618
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡神天兵施法" ]={
		txs1 =0x01004621
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡巫蛮儿攻击" ]={
		txs1 = 0x01004718
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡巫蛮儿施法" ]={
		txs1 =0x01004721
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡羽灵神攻击" ]={
		txs1 = 0x01004818
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["泡泡羽灵神施法" ]={
		txs1 =0x01004821
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["强盗鬼狸攻击" ]={
		txs1 = 0x01004913
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["强盗鬼狸施法" ]={
		txs1 =0x01004916
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["强盗狸攻击" ]={
		txs1 = 0x01005006
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["强盗狸施法" ]={
		txs1 =0x01005010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["强盗沙狸攻击" ]={
		txs1 = 0x01005106
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["强盗沙狸施法" ]={
		txs1 =0x01005110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["虬龙攻击" ]={
		txs1 = 0x01005218
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["虬龙施法" ]={
		txs1 =0x01005221
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["熔火虫攻击" ]={
		txs1 = 0x01005306
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["熔火虫施法" ]={
		txs1 =0x01005310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["熔火蛙攻击" ]={
		txs1 = 0x01005406
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["熔火蛙施法" ]={
		txs1 =0x01005410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["熔岩龟攻击" ]={
		txs1 = 0x01005506
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["熔岩龟施法" ]={
		txs1 =0x01005510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["沙虫攻击" ]={
		txs1 = 0x01005606
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["沙虫施法" ]={
		txs1 =0x01005610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["沙狸攻击" ]={
		txs1 = 0x01005706
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["沙狸施法" ]={
		txs1 =0x01005710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["食魂虫(日)攻击" ]={
		txs1 = 0x01005806
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["食魂虫(日)施法" ]={
		txs1 =0x01005810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["食魂虫(夜)攻击" ]={
		txs1 = 0x01005906
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["食魂虫(夜)施法" ]={
		txs1 =0x01005910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["食铁兽攻击" ]={
		txs1 = 0x01006005
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["食铁兽施法" ]={
		txs1 =0x01006007
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["燧明兽攻击" ]={
		txs1 = 0x01006106
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["燧明兽施法" ]={
		txs1 =0x01006110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["望月蛙攻击" ]={
		txs1 = 0x01006206
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["望月蛙施法" ]={
		txs1 =0x01006210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["无名攻击" ]={
		txs1 = 0x01006304
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["无名施法" ]={
		txs1 =0x01006308
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["雪狸攻击" ]={
		txs1 = 0x01006410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["雪狸施法" ]={
		txs1 =0x01006416
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["雪蛙攻击" ]={
		txs1 = 0x01006506
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["雪蛙施法" ]={
		txs1 =0x01006510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["雪月蛙攻击" ]={
		txs1 = 0x01006606
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["雪月蛙施法" ]={
		txs1 =0x01006610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["岩冰龟攻击" ]={
		txs1 = 0x01006706
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["岩冰龟施法" ]={
		txs1 =0x01006710
		,txs2 = "diedai.wdf"
 	}
	Mxtexiaoku["岩龟攻击" ]={
		txs1 = 0x01006806
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["岩龟施法" ]={
		txs1 =0x01006810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["竹笋虫攻击" ]={
		txs1 = 0x01006906
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["竹笋虫施法" ]={
		txs1 =0x01006910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["纵火狸攻击" ]={
		txs1 = 0x01007006
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["纵火狸施法" ]={
		txs1 =0x01007010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["沙暴攻击" ]={
		txs1 = 0x01007118
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["沙暴施法" ]={
		txs1 =0x01007124
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司辰侍者过去攻击" ]={
		txs1 = 0x01007218
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司辰侍者过去施法" ]={
		txs1 =0x01007224
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司辰侍者未来攻击" ]={
		txs1 = 0x01007318
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司辰侍者未来施法" ]={
		txs1 =0x01007324
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(火)攻击" ]={
		txs1 = 0x01007418
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(火)施法" ]={
		txs1 =0x01007424
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(金)攻击" ]={
		txs1 = 0x01007518
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(金)施法" ]={
		txs1 =0x01007524
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(木)攻击" ]={
		txs1 = 0x01007618
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(木)施法" ]={
		txs1 =0x01007624
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(水)攻击" ]={
		txs1 = 0x01007718
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(水)施法" ]={
		txs1 =0x01007724
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(土)攻击" ]={
		txs1 = 0x01007818
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["五行山神(土)施法" ]={
		txs1 =0x01007824
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司风攻击" ]={
		txs1 = 0x01007918
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司风施法" ]={
		txs1 =0x01007924
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司雪攻击" ]={
		txs1 = 0x01008018
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司雪施法" ]={
		txs1 =0x01008024
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司雨攻击" ]={
		txs1 = 0x01008118
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["司雨施法" ]={
		txs1 =0x01008124
		,txs2 = "diedai.wdf"
	}

	--进阶
	Mxtexiaoku["进阶阿宝攻击" ]={
		txs1 =0xAA200010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶阿宝施法" ]={
		txs1 =0xAA200020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶大力金刚攻击" ]={
		txs1 =0xAA200110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶大力金刚施法" ]={
		txs1 =0xAA200120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶谛听攻击" ]={
		txs1 =0xAA200210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶谛听施法" ]={
		txs1 =0xAA200220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶独角鬼王攻击" ]={
		txs1 =0xAA200310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶独角鬼王施法" ]={
		txs1 =0xAA200320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶鬼将攻击" ]={
		txs1 =0xAA200610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶鬼将施法" ]={
		txs1 =0xAA200620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶幻姬攻击" ]={
		txs1 =0xAA200810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶幻姬施法" ]={
		txs1 =0xAA200820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶觉醒涂山雪攻击" ]={
		txs1 =0xAA200910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶觉醒涂山雪施法" ]={
		txs1 =0xAA200920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巨石守卫夜攻击" ]={
		txs1 =0xAA201010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巨石守卫夜施法" ]={
		txs1 =0xAA201020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巨石守卫昼攻击" ]={
		txs1 =0xAA201110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巨石守卫昼施法" ]={
		txs1 =0xAA201120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶炼丹童子攻击" ]={
		txs1 =0xAA201210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶炼丹童子施法" ]={
		txs1 =0xAA201220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶魔化毗舍童子攻击" ]={
		txs1 =0xAA201510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶魔化毗舍童子施法" ]={
		txs1 =0xAA201520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶毗舍童子攻击" ]={
		txs1 =0xAA201610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶毗舍童子施法" ]={
		txs1 =0xAA201620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶虬龙攻击" ]={
		txs1 =0xAA201710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶虬龙施法" ]={
		txs1 =0xAA201720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶沙暴攻击" ]={
		txs1 =0xAA201810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶沙暴施法" ]={
		txs1 =0xAA201820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司辰侍者过去攻击" ]={
		txs1 =0xAA201910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司辰侍者过去施法" ]={
		txs1 =0xAA201920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司辰侍者未来攻击" ]={
		txs1 =0xAA202010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司辰侍者未来施法" ]={
		txs1 =0xAA202020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司风攻击" ]={
		txs1 =0xAA202110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司风施法" ]={
		txs1 =0xAA202120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司雨攻击" ]={
		txs1 =0xAA202310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司雨施法" ]={
		txs1 =0xAA202320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(火)攻击" ]={
		txs1 =0xAA202410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(火)施法" ]={
		txs1 =0xAA202420
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(金)攻击" ]={
		txs1 =0xAA202510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(金)施法" ]={
		txs1 =0xAA202520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(木)攻击" ]={
		txs1 =0xAA202610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(木)施法" ]={
		txs1 =0xAA202620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(水)攻击" ]={
		txs1 =0xAA202710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(水)施法" ]={
		txs1 =0xAA202720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(土)攻击" ]={
		txs1 =0xAA202810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶五行山神(土)施法" ]={
		txs1 =0xAA202820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶有苏鸩攻击" ]={
		txs1 =0xAA202910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶有苏鸩施法" ]={
		txs1 =0xAA202920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶般若天女攻击" ]={
		txs1 =0xAA203010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶般若天女施法" ]={
		txs1 =0xAA203020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶地狱战神攻击" ]={
		txs1 =0xAA203110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶地狱战神施法" ]={
		txs1 =0xAA203120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶多闻巡守攻击" ]={
		txs1 =0xAA203210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶多闻巡守施法" ]={
		txs1 =0xAA203220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶广目巡守攻击" ]={
		txs1 =0xAA203310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶广目巡守施法" ]={
		txs1 =0xAA203320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶狐不归攻击" ]={
		txs1 =0xAA203410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶狐不归施法" ]={
		txs1 =0xAA203420
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶蝴蝶仙子攻击" ]={
		txs1 =0xAA203510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶蝴蝶仙子施法" ]={
		txs1 =0xAA203520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶花铃攻击" ]={
		txs1 =0xAA203610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶花铃施法" ]={
		txs1 =0xAA203620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶机关鸟攻击" ]={
		txs1 =0xAA203710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶机关鸟施法" ]={
		txs1 =0xAA203720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶机关人攻击" ]={
		txs1 =0xAA203810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶机关人施法" ]={
		txs1 =0xAA203820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶机关兽攻击" ]={
		txs1 =0xAA203910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶机关兽施法" ]={
		txs1 =0xAA203920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶蛟龙攻击" ]={
		txs1 =0xAA204010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶蛟龙施法" ]={
		txs1 =0xAA204020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶金翼攻击" ]={
		txs1 =0xAA204110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶金翼施法" ]={
		txs1 =0xAA204120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巨力神猿攻击" ]={
		txs1 =0xAA204210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巨力神猿施法" ]={
		txs1 =0xAA204220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶雷龙攻击" ]={
		txs1 =0xAA204310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶雷龙攻击2" ]={
		txs1 =0xAA204310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶雷龙施法" ]={
		txs1 =0xAA204320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶雷鸟人攻击" ]={
		txs1 =0xAA204410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶雷鸟人施法" ]={
		txs1 =0xAA204420
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶连弩车攻击" ]={
		txs1 =0xAA204510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶连弩车施法" ]={
		txs1 =0xAA204520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶灵灯侍者攻击" ]={
		txs1 =0xAA204610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶灵灯侍者施法" ]={
		txs1 =0xAA204620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶龙鲤攻击" ]={
		txs1 =0xAA204710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶龙鲤施法" ]={
		txs1 =0xAA204720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶曼珠沙华攻击" ]={
		txs1 =0xAA204810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶曼珠沙华施法" ]={
		txs1 =0xAA204820
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["进阶妙华天女攻击" ]={
		txs1 =0xAA204910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶妙华天女施法" ]={
		txs1 =0xAA204920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶千年蛇魅攻击" ]={
		txs1 =0xAA205010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶千年蛇魅施法" ]={
		txs1 =0xAA205020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶日游神攻击" ]={
		txs1 =0xAA205110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶日游神施法" ]={
		txs1 =0xAA205120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶噬天虎攻击" ]={
		txs1 =0xAA205210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶噬天虎施法" ]={
		txs1 =0xAA205220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司雪攻击" ]={
		txs1 =0xAA205310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶司雪施法" ]={
		txs1 =0xAA205320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶无常鬼差白攻击" ]={
		txs1 =0xAA205410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶无常鬼差白施法" ]={
		txs1 =0xAA205420
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶无常鬼差黑攻击" ]={
		txs1 =0xAA205510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶无常鬼差黑施法" ]={
		txs1 =0xAA205520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶吸血鬼攻击" ]={
		txs1 =0xAA205610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶吸血鬼施法" ]={
		txs1 =0xAA205620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小精灵攻击" ]={
		txs1 =0xAA205710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小精灵施法" ]={
		txs1 =0xAA205720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小毛头攻击" ]={
		txs1 =0xAA205810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小毛头施法" ]={
		txs1 =0xAA205820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小魔头攻击" ]={
		txs1 =0xAA205910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小魔头施法" ]={
		txs1 =0xAA205920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小神灵攻击" ]={
		txs1 =0xAA206010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小神灵施法" ]={
		txs1 =0xAA206020
		,txs2 = "diedai.wdf"
	}

	Mxtexiaoku["进阶小仙女攻击" ]={
		txs1 =0xAA206110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小仙女施法" ]={
		txs1 =0xAA206120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小丫丫攻击" ]={
		txs1 =0xAA206210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶小丫丫施法" ]={
		txs1 =0xAA206220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶玄珠灵仙攻击" ]={
		txs1 =0xAA206310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶玄珠灵仙施法" ]={
		txs1 =0xAA206320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巡游天神攻击" ]={
		txs1 =0xAA206410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶巡游天神施法" ]={
		txs1 =0xAA206420
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶炎魔神攻击" ]={
		txs1 =0xAA206510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶炎魔神施法" ]={
		txs1 =0xAA206520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶野猪精攻击" ]={
		txs1 =0xAA206610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶野猪精施法" ]={
		txs1 =0xAA206620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶夜罗刹攻击" ]={
		txs1 =0xAA206710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶夜罗刹施法" ]={
		txs1 =0xAA206720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶月魅攻击" ]={
		txs1 =0xAA206810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶月魅施法" ]={
		txs1 =0xAA206820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶月影仙攻击" ]={
		txs1 =0xAA206910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶月影仙施法" ]={
		txs1 =0xAA206920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶云游火攻击" ]={
		txs1 =0xAA207010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶云游火施法" ]={
		txs1 =0xAA207020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶长乐灵仙攻击" ]={
		txs1 =0xAA207110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶长乐灵仙施法" ]={
		txs1 =0xAA207120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶执音攻击" ]={
		txs1 =0xAA207210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶执音施法" ]={
		txs1 =0xAA207220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["执音攻击" ]={
		txs1 =0xAAA10510
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["执音施法" ]={
		txs1 =0xAAA10520
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶自在心猿攻击" ]={
		txs1 =0xAA207310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶自在心猿攻击2" ]={
		txs1 =0xAA207310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶自在心猿施法" ]={
		txs1 =0xAA207320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶白熊攻击" ]={
		txs1 =0xAA207410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶白熊施法" ]={
		txs1 =0xAA207420
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶百足将军攻击" ]={
		txs1 =0xAA207510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶百足将军施法" ]={
		txs1 =0xAA207520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶碧水夜叉攻击" ]={
		txs1 =0xAA207610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶碧水夜叉施法" ]={
		txs1 =0xAA207620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶风伯攻击" ]={
		txs1 =0xAA207710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶风伯施法" ]={
		txs1 =0xAA207720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶凤凰攻击" ]={
		txs1 =0xAA207810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶凤凰施法" ]={
		txs1 =0xAA207820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶鲛人攻击" ]={
		txs1 =0xAA207910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶鲛人施法" ]={
		txs1 =0xAA207920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶金铙僧攻击" ]={
		txs1 =0xAA208010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶金铙僧施法" ]={
		txs1 =0xAA208020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶金身罗汉攻击" ]={
		txs1 =0xAA208110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶金身罗汉施法" ]={
		txs1 =0xAA208120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶锦毛貂精攻击" ]={
		txs1 =0xAA208210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶锦毛貂精施法" ]={
		txs1 =0xAA208220
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶鼠先锋攻击" ]={
		txs1 =0xAA208310
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶鼠先锋施法" ]={
		txs1 =0xAA208320
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶踏云兽攻击" ]={
		txs1 =0xAA208410
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶踏云兽施法" ]={
		txs1 =0xAA208420
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶天兵攻击" ]={
		txs1 =0xAA208510
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶天兵施法" ]={
		txs1 =0xAA208520
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶天将攻击" ]={
		txs1 =0xAA208610
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶天将施法" ]={
		txs1 =0xAA208620
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶犀牛将军攻击" ]={
		txs1 =0xAA208710
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶犀牛将军施法" ]={
		txs1 =0xAA208720
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶星灵仙子攻击" ]={
		txs1 =0xAA208810
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶星灵仙子施法" ]={
		txs1 =0xAA208820
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶夜游神攻击" ]={
		txs1 =0xAA208910
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶夜游神施法" ]={
		txs1 =0xAA208920
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶增长巡守攻击" ]={
		txs1 =0xAA209010
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶增长巡守施法" ]={
		txs1 =0xAA209020
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶长眉灵猴攻击" ]={
		txs1 =0xAA209110
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶长眉灵猴施法" ]={
		txs1 =0xAA209120
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶真陀护法攻击" ]={
		txs1 =0xAA209210
		,txs2 = "diedai.wdf"
	}
	Mxtexiaoku["进阶真陀护法施法" ]={
		txs1 =0xAA209220
		,txs2 = "diedai.wdf"
	}




	Mxtexiaoku["进阶巴蛇攻击" ]={
		txs1 =0xAA210006
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶巴蛇施法" ]={
		txs1 =0xAA210015
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶蚌精攻击" ]={
		txs1 =0xAA210106
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶蚌精施法" ]={
		txs1 =0xAA210115
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶持国巡守攻击" ]={
		txs1 =0xAA210206
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶持国巡守施法" ]={
		txs1 =0xAA210215
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶芙蓉仙子攻击" ]={
		txs1 =0xAA210306
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶芙蓉仙子施法" ]={
		txs1 =0xAA210315
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶古代瑞兽攻击" ]={
		txs1 =0xAA210406
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶古代瑞兽施法" ]={
		txs1 =0xAA210415
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶黑山老妖攻击" ]={
		txs1 =0xAA210506
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶黑山老妖施法" ]={
		txs1 =0xAA210515
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶红萼仙子攻击" ]={
		txs1 =0xAA210606
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶红萼仙子施法" ]={
		txs1 =0xAA210615
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶葫芦宝贝攻击" ]={
		txs1 =0xAA210706
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶葫芦宝贝施法" ]={
		txs1 =0xAA210715
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶画魂攻击" ]={
		txs1 =0xAA210806
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶画魂施法" ]={
		txs1 =0xAA210815
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶混沌兽攻击" ]={
		txs1 =0xAA210906
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶混沌兽施法" ]={
		txs1 =0xAA210915
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶净瓶女娲攻击" ]={
		txs1 =0xAA211006
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶净瓶女娲施法" ]={
		txs1 =0xAA211015
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶镜妖攻击" ]={
		txs1 =0xAA211106
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶镜妖施法" ]={
		txs1 =0xAA211115
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶狂豹人形攻击" ]={
		txs1 =0xAA211206
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶狂豹人形施法" ]={
		txs1 =0xAA211215
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶狂豹兽形攻击" ]={
		txs1 =0xAA211306
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶狂豹兽形施法" ]={
		txs1 =0xAA211315
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶泪妖攻击" ]={
		txs1 =0xAA211406
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶泪妖施法" ]={
		txs1 =0xAA211415
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶灵符女娲攻击" ]={
		txs1 =0xAA211506
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶灵符女娲施法" ]={
		txs1 =0xAA211515
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶灵鹤攻击" ]={
		txs1 =0xAA211606
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶灵鹤施法" ]={
		txs1 =0xAA211615
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶龙龟攻击" ]={
		txs1 =0xAA211706
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶龙龟施法" ]={
		txs1 =0xAA211715
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶律法女娲攻击" ]={
		txs1 =0xAA211806
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶律法女娲施法" ]={
		txs1 =0xAA211815
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶猫灵人形攻击" ]={
		txs1 =0xAA211906
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶猫灵人形施法" ]={
		txs1 =0xAA211915
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶猫灵兽形攻击" ]={
		txs1 =0xAA212006
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶猫灵兽形施法" ]={
		txs1 =0xAA212015
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶琴仙攻击" ]={
		txs1 =0xAA212106
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶琴仙施法" ]={
		txs1 =0xAA212115
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶如意仙子攻击" ]={
		txs1 =0xAA212206
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶如意仙子施法" ]={
		txs1 =0xAA212215
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶藤蔓妖花攻击" ]={
		txs1 =0xAA212306
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶藤蔓妖花施法" ]={
		txs1 =0xAA212315
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶雾中仙攻击" ]={
		txs1 =0xAA212406
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶雾中仙施法" ]={
		txs1 =0xAA212415
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶犀牛将军兽形攻击" ]={
		txs1 =0xAA212506
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶犀牛将军兽形施法" ]={
		txs1 =0xAA212515
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶蝎子精攻击" ]={
		txs1 =0xAA212606
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶蝎子精施法" ]={
		txs1 =0xAA212615
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶修罗傀儡鬼攻击" ]={
		txs1 =0xAA212706
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶修罗傀儡鬼施法" ]={
		txs1 =0xAA212715
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶修罗傀儡妖攻击" ]={
		txs1 =0xAA212806
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶修罗傀儡妖施法" ]={
		txs1 =0xAA212815
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶阴阳伞攻击" ]={
		txs1 =0xAA212906
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶阴阳伞施法" ]={
		txs1 =0xAA212915
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶幽灵攻击" ]={
		txs1 =0xAA213006
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶幽灵施法" ]={
		txs1 =0xAA213015
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶幽萤娃娃攻击" ]={
		txs1 =0xAA213106
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶幽萤娃娃施法" ]={
		txs1 =0xAA213115
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶雨师攻击" ]={
		txs1 =0xAA213206
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶雨师施法" ]={
		txs1 =0xAA213215
		,txs2 = "diedai2.wdf"
	}
	-- Mxtexiaoku["进阶蜃气妖攻击" ]={
	-- 	txs1 =0xAA213306
	-- 	,txs2 = "diedai2.wdf"
	-- }
	-- Mxtexiaoku["进阶蜃气妖施法" ]={
	-- 	txs1 =0xAA213315
	-- 	,txs2 = "diedai2.wdf"
	-- }
	Mxtexiaoku["般若天女攻击" ]={
		txs1 =0xAA213410
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["般若天女施法" ]={
		txs1 =0xAA213420
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["持国巡守攻击" ]={
		txs1 =0xAA213510
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["持国巡守施法" ]={
		txs1 =0xAA213520
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["多闻巡守攻击" ]={
		txs1 =0xAA213610
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["多闻巡守施法" ]={
		txs1 =0xAA213620
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["风伯攻击" ]={
		txs1 =0xAA213710
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["风伯施法" ]={
		txs1 =0xAA213720
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["红萼仙子攻击" ]={
		txs1 =0xAA213810
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["红萼仙子施法" ]={
		txs1 =0xAA213820
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["狐不归攻击" ]={
		txs1 =0xAA213910
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["狐不归施法" ]={
		txs1 =0xAA213920
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["蝴蝶仙子攻击" ]={
		txs1 =0xAA214010
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["蝴蝶仙子施法" ]={
		txs1 =0xAA214020
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["花铃攻击" ]={
		txs1 =0xAA214110
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["花铃施法" ]={
		txs1 =0xAA214120
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["金铙僧攻击" ]={
		txs1 =0xAA214210
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["金铙僧施法" ]={
		txs1 =0xAA214220
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["巨石守卫夜攻击" ]={
		txs1 =0xAA214310
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["巨石守卫夜施法" ]={
		txs1 =0xAA214320
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["巨石守卫昼攻击" ]={
		txs1 =0xAA214410
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["巨石守卫昼施法" ]={
		txs1 =0xAA214420
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["炼丹童子攻击" ]={
		txs1 =0xAA214510
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["炼丹童子施法" ]={
		txs1 =0xAA214520
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["灵灯侍者攻击" ]={
		txs1 =0xAA214610
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["灵灯侍者施法" ]={
		txs1 =0xAA214620
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["魔化毗舍童子攻击" ]={
		txs1 =0xAA214710
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["魔化毗舍童子施法" ]={
		txs1 =0xAA214720
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["日游神攻击" ]={
		txs1 =0xAA214810
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["日游神施法" ]={
		txs1 =0xAA214820
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["无常鬼差白攻击" ]={
		txs1 =0xAA214910
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["无常鬼差白施法" ]={
		txs1 =0xAA214920
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["无常鬼差黑攻击" ]={
		txs1 =0xAA215010
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["无常鬼差黑施法" ]={
		txs1 =0xAA215020
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["玄珠灵仙攻击" ]={
		txs1 =0xAA215110
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["玄珠灵仙施法" ]={
		txs1 =0xAA215120
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["炎魔神攻击" ]={
		txs1 =0xAA215210
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["炎魔神施法" ]={
		txs1 =0xAA215220
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["野猪精攻击" ]={
		txs1 =0xAA215310
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["野猪精施法" ]={
		txs1 =0xAA215320
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["夜游神攻击" ]={
		txs1 =0xAA215410
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["夜游神施法" ]={
		txs1 =0xAA215420
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["幽灵攻击" ]={
		txs1 =0xAA215510
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["幽灵施法" ]={
		txs1 =0xAA215520
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["有苏鸩攻击" ]={
		txs1 =0xAA215610
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["有苏鸩施法" ]={
		txs1 =0xAA215620
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["月魅攻击" ]={
		txs1 =0xAA215710
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["月魅施法" ]={
		txs1 =0xAA215720
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["月影仙攻击" ]={
		txs1 =0xAA215810
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["月影仙施法" ]={
		txs1 =0xAA215820
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["云游火攻击" ]={
		txs1 =0xAA215910
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["云游火施法" ]={
		txs1 =0xAA215920
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["增长巡守攻击" ]={
		txs1 =0xAA216010
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["增长巡守施法" ]={
		txs1 =0xAA216020
		,txs2 = "diedai2.wdf"
	}



		Mxtexiaoku["雨师妾攻击" ]={
		txs1 = 0x01010006
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["雨师妾施法" ]={
		txs1 = 0x01010008
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级鲲鹏攻击" ]={
		txs1 = 0x01010018
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级鲲鹏施法" ]={
		txs1 = 0x01010020
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["天机虫攻击" ]={
		txs1 = 0x01010030
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["天机虫施法" ]={
		txs1 = 0x01010032
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["天将攻击" ]={
		txs1 = 0x01010042
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["天将施法" ]={
		txs1 = 0x01010044
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["程咬金攻击" ]={
		txs1 = 0x01010054
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["程咬金攻击2" ]={
		txs1 = 0x01010054
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["程咬金施法" ]={
		txs1 = 0x01010056
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["元宝龟攻击" ]={
		txs1 = 0x01010066
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["元宝龟施法" ]={
		txs1 = 0x01010068
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["月光虫攻击" ]={
		txs1 = 0x01010078
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["月光虫施法" ]={
		txs1 = 0x01010080
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["月光金乌虫攻击" ]={
		txs1 = 0x01010090
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["月光金乌虫施法" ]={
		txs1 = 0x01010092
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["月光雪蛙攻击" ]={
		txs1 = 0x01010102
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["月光雪蛙施法" ]={
		txs1 = 0x01010104
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["云龟攻击" ]={
		txs1 = 0x01010114
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["云龟施法" ]={
		txs1 = 0x01010116
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["红衣女鬼攻击" ]={
		txs1 = 0x01010126
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["红衣女鬼施法" ]={
		txs1 = 0x01010128
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["薛礼攻击" ]={
		txs1 = 0x01010138
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["薛礼施法" ]={
		txs1 = 0x01010140
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["赌徒施法" ]={
		txs1 = 0x01010151
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["龟丞相施法" ]={
		txs1 = 0x01010162
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["虾兵施法" ]={
		txs1 = 0x01010173
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["黑熊攻击" ]={
		txs1 = 0x01010183
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["强盗攻击" ]={
		txs1 = 0x01010194
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["蜘蛛精攻击" ]={
		txs1 = 0x01010205
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小精灵施法" ]={
		txs1 = 0x01010417
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小毛头施法" ]={
		txs1 = 0x01010435
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小魔头施法" ]={
		txs1 = 0x01010453
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小丫丫施法" ]={
		txs1 = 0x01010471
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["鬼火狸攻击" ]={
		txs1 = 0x01010487
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["鬼火狸施法" ]={
		txs1 = 0x01010490
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小神灵攻击" ]={
		txs1 = 0x01010506
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小神灵施法" ]={
		txs1 = 0x01010509
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小仙女攻击" ]={
		txs1 = 0x01010525
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["小仙女施法" ]={
		txs1 = 0x01010528
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["如意仙子攻击" ]={
		txs1 = 0x01011252
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["百足将军攻击" ]={
		txs1 = 0x01011273
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["百足将军施法" ]={
		txs1 = 0x01011275
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["地狱战神攻击" ]={
		txs1 = 0x01011292
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["地狱战神施法" ]={
		txs1 = 0x01011294
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["地狱战神攻击" ]={
		txs1 = 0x01011311
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["地狱战神施法" ]={
		txs1 = 0x01011313
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["混沌兽攻击" ]={
		txs1 = 0x01011330
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["混沌兽施法" ]={
		txs1 = 0x01011332
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["镜妖攻击" ]={
		txs1 = 0x01011349
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["镜妖施法" ]={
		txs1 = 0x01011351
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["狂豹兽形攻击" ]={
		txs1 = 0x01011368
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["狂豹兽形施法" ]={
		txs1 = 0x01011370
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["泪妖攻击" ]={
		txs1 = 0x01011387
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["泪妖施法" ]={
		txs1 = 0x01011389
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["灵鹤攻击" ]={
		txs1 = 0x01011406
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["灵鹤施法" ]={
		txs1 = 0x01011408
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["龙龟攻击" ]={
		txs1 = 0x01011425
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["龙龟施法" ]={
		txs1 = 0x01011427
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["毗舍童子攻击" ]={
		txs1 = 0x01011444
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["毗舍童子施法" ]={
		txs1 = 0x01011446
		,txs2 = "diedai2.wdf"
	}


	Mxtexiaoku["琴仙攻击" ]={
		txs1 = 0x01011463
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["琴仙施法" ]={
		txs1 = 0x01011465
		,txs2 = "diedai2.wdf"
	}


	Mxtexiaoku["鼠先锋攻击" ]={
		txs1 = 0x01011482
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["鼠先锋施法" ]={
		txs1 = 0x01011484
		,txs2 = "diedai2.wdf"
	}


	Mxtexiaoku["踏云兽攻击" ]={
		txs1 = 0x01011501
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["踏云兽施法" ]={
		txs1 = 0x01011503
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["雾中仙攻击" ]={
		txs1 = 0x01011520
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["雾中仙施法" ]={
		txs1 = 0x01011522
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["吸血鬼攻击" ]={
		txs1 = 0x01011539
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["吸血鬼施法" ]={
		txs1 = 0x01011541
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["野鬼攻击" ]={
		txs1 = 0x01011558
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["野鬼施法" ]={
		txs1 = 0x01011560
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["夜罗刹攻击" ]={
		txs1 = 0x01011577
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["夜罗刹施法" ]={
		txs1 = 0x01011579
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["雨师攻击" ]={
		txs1 = 0x01011596
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["雨师施法" ]={
		txs1 = 0x01011598
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["葫芦宝贝攻击" ]={
		txs1 =0xAAA10010
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["葫芦宝贝施法" ]={
		txs1 =0xAAA10020
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶涂山雪攻击" ]={
		txs1 =0xAAA10110
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶涂山雪施法" ]={
		txs1 =0xAAA10120
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["涂山雪攻击" ]={
		txs1 =0xAAA10210
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["涂山雪施法" ]={
		txs1 =0xAAA10220
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["长乐灵仙攻击" ]={
		txs1 =0xAAA10310
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["长乐灵仙施法" ]={
		txs1 =0xAAA10320
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["真陀护法攻击" ]={
		txs1 =0xAAA10410
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["真陀护法施法" ]={
		txs1 =0xAAA10420
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级红孩儿攻击" ]={
		txs1 =0xAAAA2012
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级红孩儿攻击2" ]={
		txs1 =0xAAAA2014
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级红孩儿施法" ]={
		txs1 =0xAAAA2007
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级红孩儿攻击" ]={
		txs1 =0xAAAA2023
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级红孩儿攻击2" ]={
		txs1 =0xAAAA2028
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级红孩儿施法" ]={
		txs1 =0xAAAA2030
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级飞天攻击" ]={
		txs1 =0xAAAA2042
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级飞天攻击2" ]={
		txs1 =0xAAAA2044
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级飞天施法" ]={
		txs1 =0xAAAA2037
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级飞天攻击" ]={
		txs1 =0xAAAA2042
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级飞天攻击2" ]={
		txs1 =0xAAAA2044
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级飞天施法" ]={
		txs1 =0xAAAA2037
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神狗攻击" ]={
		txs1 =0xAAAA2059
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神狗攻击2" ]={
		txs1 =0xAAAA2061
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神狗施法" ]={
		txs1 =0xAAAA2054
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神狗攻击" ]={
		txs1 =0xAAAA2076
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神狗攻击2" ]={
		txs1 =0xAAAA2078
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神狗施法" ]={
		txs1 =0xAAAA2071
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神虎(壬寅)攻击" ]={
		txs1 =0xAAAA2090
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神虎(壬寅)攻击2" ]={
		txs1 =0xAAAA2092
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神虎(壬寅)施法" ]={
		txs1 =0xAAAA2085
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神虎(壬寅)攻击" ]={
		txs1 =0xAAAA2107
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神虎(壬寅)攻击2" ]={
		txs1 =0xAAAA2109
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神虎(壬寅)施法" ]={
		txs1 =0xAAAA2102
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神龙(甲辰)攻击" ]={
		txs1 =0xAAAA2121
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神龙(甲辰)攻击2" ]={
		txs1 =0xAAAA2123
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神龙(甲辰)施法" ]={
		txs1 =0xAAAA2116
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神龙(甲辰)攻击" ]={
		txs1 =0xAAAA2137
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神龙(甲辰)攻击2" ]={
		txs1 =0xAAAA2139
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神龙(甲辰)施法" ]={
		txs1 =0xAAAA2132
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神牛(辛丑)施法" ]={
		txs1 =0xAAAA2146
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神牛(辛丑)攻击" ]={
		txs1 =0xAAAA2151
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神牛(辛丑)攻击2" ]={
		txs1 =0xAAAA2153
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神牛(辛丑)施法" ]={
		txs1 =0xAAAA2163
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神牛(辛丑)攻击" ]={
		txs1 =0xAAAA2168
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神牛(辛丑)攻击2" ]={
		txs1 =0xAAAA2170
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神鼠施法" ]={
		txs1 =0xAAAA2177
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神鼠攻击" ]={
		txs1 =0xAAAA2182
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神鼠攻击2" ]={
		txs1 =0xAAAA2184
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神鼠施法" ]={
		txs1 =0xAAAA2194
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神鼠攻击" ]={
		txs1 =0xAAAA2199
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神鼠攻击2" ]={
		txs1 =0xAAAA2201
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神兔(癸卯)施法" ]={
		txs1 =0xAAAA2208
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神兔(癸卯)攻击" ]={
		txs1 =0xAAAA2213
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神兔(癸卯)施法" ]={
		txs1 =0xAAAA2223
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神兔(癸卯)攻击" ]={
		txs1 =0xAAAA2228
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神兔(癸卯)睡梦施法" ]={
		txs1 =0xAAAA2235
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神兔(癸卯)睡梦攻击" ]={
		txs1 =0xAAAA2240
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神兔(癸卯)睡梦施法" ]={
		txs1 =0xAAAA2250
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神兔(癸卯)睡梦攻击" ]={
		txs1 =0xAAAA2255
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级神猪施法" ]={
		txs1 =0xAAAA2262
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神猪攻击" ]={
		txs1 =0xAAAA2267
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级神猪攻击2" ]={
		txs1 =0xAAAA2269
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神猪施法" ]={
		txs1 =0xAAAA2194
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神猪攻击" ]={
		txs1 =0xAAAA2199
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级神猪攻击2" ]={
		txs1 =0xAAAA2201
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级小白龙攻击" ]={
		txs1 =0xAAAA2283
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级小白龙攻击2" ]={
		txs1 =0xAAAA2285
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级小白龙攻击" ]={
		txs1 =0xAAAA2299
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级小白龙攻击2" ]={
		txs1 =0xAAAA2301
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级有熊施法" ]={
		txs1 =0xAAAA2325
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级有熊攻击" ]={
		txs1 =0xAAAA2330
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级有熊攻击2" ]={
		txs1 =0xAAAA2332
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级有熊施法" ]={
		txs1 =0xAAAA2325
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级有熊攻击" ]={
		txs1 =0xAAAA2330
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级有熊攻击2" ]={
		txs1 =0xAAAA2332
		,txs2 = "diedai2.wdf"
	}

	Mxtexiaoku["超级猪小戒施法" ]={
		txs1 =0xAAAA2339
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级猪小戒攻击" ]={
		txs1 =0xAAAA2344
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["超级猪小戒攻击2" ]={
		txs1 =0xAAAA2346
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级猪小戒施法" ]={
		txs1 =0xAAAA2339
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级猪小戒攻击" ]={
		txs1 =0xAAAA2344
		,txs2 = "diedai2.wdf"
	}
	Mxtexiaoku["进阶超级猪小戒攻击2" ]={
		txs1 =0xAAAA2346
		,txs2 = "diedai2.wdf"
	}
	--迭代

local 特效信息={[1]={前置=true,资源="waddon.wdf",类型="法宝",地址=793098736,名称="状态_苍白纸人_敌方"},
[2]={前置=false,资源="waddon.wdf",类型="法宝",地址=1496235401,名称="状态_苍白纸人_我方"}
,[3]={前置=false,资源="waddon.wdf",类型="法宝",地址=844767082,名称="状态_乾坤玄火塔_敌方"},
[4]={前置=false,资源="waddon.wdf",类型="法宝",地址=3258367777,名称="状态_乾坤玄火塔_我方"},
[5]={前置=false,资源="waddon.wdf",类型="法宝",地址=1207461887,名称="状态_干将莫邪_敌方"},
[6]={前置=false,资源="waddon.wdf",类型="法宝",地址=2016988758,名称="状态_干将莫邪_我方"},
[7]={前置=true,资源="waddon.wdf",类型="法宝",地址=793098736,名称="状态_混元伞_敌方"},
[8]={前置=false,资源="waddon.wdf",类型="法宝",地址=1496235401,名称="状态_混元伞_我方"},
[9]={前置=true,资源="waddon.wdf",类型="法宝",地址=793098736,名称="状态_五彩娃娃_敌方"},
[10]={前置=false,资源="waddon.wdf",类型="法宝",地址=1496235401,名称="状态_五彩娃娃_我方"},
[11]={前置=true,资源="magic.wdf",类型="法宝",地址=3924596173,名称="发瘟匣"},
[12]={前置=true,资源="magic.wdf",类型="法宝",地址=2062485665,名称="金甲仙衣"},
[13]={前置=true,资源="magic.wdf",类型="法宝",地址=2062485665,名称="无魂傀儡"},
[14]={前置=true,资源="magic.wdf",类型="法宝",地址=2062485665,名称="断线木偶"},
[15]={前置=true,资源="magic.wdf",类型="法宝",地址=2062485665,名称="降魔斗篷"},
[16]={前置=true,资源="magic.wdf",类型="法宝",地址=2062485665,名称="五彩娃娃"},
[17]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="法宝",地址=2062485665,名称="状态_无魂傀儡"},
[18]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="法宝",地址=2062485665,名称="状态_断线木偶"},
[19]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="法宝",地址=2062485665,名称="状态_无尘扇"},
[20]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="法宝",地址=193761842,名称="无尘扇"},
[21]={前置=false,资源="magic.wdf",类型="法宝",地址=523454049,名称="混元伞_我方"},
[22]={前置=true,资源="magic.wdf",类型="法宝",地址=4068617373,名称="混元伞_敌方"},
[23]={前置=true,资源="magic.wdf",类型="法宝",地址=2278687984,名称="金钱镖"},
[24]={前置=true,资源="magic.wdf",类型="法宝",地址=2278687984,名称="落宝金钱"},
[25]={前置=true,资源="magic.wdf",类型="法宝",地址=1207461887,名称="干将莫邪_敌方"},
[26]={前置=true,资源="magic.wdf",类型="法宝",地址=2016988758,名称="干将莫邪_我方"},
[27]={前置=true,资源="magic.wdf",类型="法宝",地址=1403147207,名称="清心咒"},
[28]={前置=true,资源="magic.wdf",类型="法宝",地址=2308833041,名称="苍白纸人"},
[29]={前置=true,资源="addon.wdf",类型="法宝",地址=3457378059,名称="状态_缚妖索"},
[30]={前置=true,资源="addon.wdf",类型="法宝",地址=3457378059,名称="状态_捆仙绳"},
[31]={前置=true,资源="addon.wdf",类型="法宝",地址=3457378059,名称="状态_缚龙索"},
[32]={前置=true,资源="addon.wdf",类型="法宝",地址=3457378059,名称="缚妖索"},
[33]={前置=true,资源="addon.wdf",类型="法宝",地址=3457378059,名称="捆仙绳"},
[34]={前置=true,资源="addon.wdf",类型="法宝",地址=3457378059,名称="缚龙索"},
[35]={前置=true,资源="magic.wdf",类型="法宝",地址=1918324162,名称="番天印"},
[36]={前置=false,资源="waddon.wdf",类型="法宝",地址=1918324162,名称="状态_番天印"},
[37]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="法宝",地址=1662990594,名称="罗汉珠"}
,[38]={前置=true,资源="waddon.wdf",类型="法宝",地址=678986956,名称="状态_罗汉珠"},
[39]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="法宝",地址=475995980,名称="分水"},
[40]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="法宝",地址=2537279276,名称="状态_分水"},
[41]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="法宝",地址=1266585977,名称="赤焰_我方"},
[42]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="法宝",地址=2276342087,名称="赤焰_敌方"},
[43]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="法宝",地址=1906144895,名称="状态_赤焰"},
[44]={前置=true,pyy=2,资源="common/magic.wdf",pyx=0,类型="法宝",地址=1479134995,名称="天煞"},
[45]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="法宝",地址=1906144895,名称="状态_天煞"},
[46]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=2373798440,名称="神木宝鼎"},
[47]={前置=true,pyy=2,资源="common/magic.wdf",pyx=0,类型="法宝",地址=426723869,名称="状态_神木宝鼎"},
[48]={前置=true,资源="magic.wdf",类型="法宝",地址=2531655005,名称="鬼泣"},
[49]={前置=true,资源="magic.wdf",类型="法宝",地址=2531655005,名称="惊魂铃"},
[50]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="法宝",地址=3051111745,名称="失心钹"},
[51]={前置=true,资源="magic.wdf",类型="法宝",地址=3835868782,名称="乾坤玄火塔"},
[52]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="法宝",地址=1144008075,名称="七宝玲珑灯"},
[53]={前置=true,资源="magic.wdf",类型="法宝",地址=852689471,名称="无字经"},
[54]={前置=false,资源="waddon.wdf",类型="法宝",地址=852689471,名称="状态_无字经"},
[55]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="法宝",地址=3761188461,名称="摄魂"},
[56]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="法宝",地址=3761188461,名称="状态_摄魂"},
[57]={前置=true,资源="magic.wdf",类型="法宝",地址=1382381987,名称="救命毫毛"},
[58]={前置=true,资源="magic.wdf",类型="法宝",地址=2161844874,名称="照妖镜"},
[59]={前置=true,资源="common/magic.wdf",类型="法宝",地址=3460305833,名称="九梵清莲"},
[60]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="法宝",地址=165296235,名称="状态_九梵清莲"},
[61]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=679441250,名称="苍灵雪羽"},
[62]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=1944003392,名称="状态_苍灵雪羽"},
[63]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="法宝",地址=3746570992,名称="烽火狼烟"},
[64]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=1417431912,名称="状态_烽火狼烟"},
[65]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=120752460,名称="舞雪冰蝶"},
[66]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=1637574764,名称="状态_舞雪冰蝶"},
[67]={前置=true,资源="common/magic.wdf",类型="法宝",地址=631800244,名称="紫火如意"},
[68]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=788664843,名称="金蟾"},
[69]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=3657672509,名称="状态_金蟾"},
[70]={前置=true,资源="common/magic.wdf",类型="法宝",地址=1726607489,名称="璞玉灵钵"},
[71]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="法宝",地址=1902025684,名称="状态_璞玉灵钵"},
[72]={前置=false,资源="magic.wdf",类型="子女",地址=2391977602,名称="还魂咒"},
[73]={前置=false,资源="magic.wdf",类型="子女",地址=388205471,名称="仙人指路"},
[74]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="子女",地址=4088602190,名称="峰回路转"},
[75]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="子女",地址=849378601,名称="四面埋伏"},
[76]={前置=false,资源="waddon.wdf",类型="子女",地址=505084121,名称="状态_四面埋伏"},
[77]={前置=true,资源="magic.wdf",类型="召唤兽",地址=180555238,名称="落岩"},
[78]={前置=true,资源="magic.wdf",类型="召唤兽",地址=4180877467,名称="水攻"},
[79]={前置=true,资源="addon.wdf",类型="召唤兽",地址=1000651155,名称="惊心一剑"},
-- [81]={前置=true,资源="magic.wdf",类型="召唤兽",地址=3746315235,名称="泰山压顶2"},
-- [82]={前置=true,资源="magic.wdf",类型="召唤兽",地址=3913292544,名称="泰山压顶3"},
-- [83]={前置=true,资源="magic.wdf",类型="召唤兽",地址=322932273,名称="泰山压顶4"},
[84]={前置=true,资源="magic.wdf",类型="召唤兽",地址=328476341,名称="八凶法阵"},
[85]={前置=true,资源="waddon.wdf",类型="召唤兽",地址=2242204664,名称="状态_八凶法阵1"},
[86]={前置=true,资源="waddon.wdf",类型="召唤兽",地址=1027581335,名称="状态_八凶法阵2"},
[87]={前置=true,资源="waddon.wdf",类型="召唤兽",地址=222869792,名称="状态_八凶法阵3"},
[88]={前置=true,资源="magic.wdf",类型="召唤兽",地址=3674269400,名称="叱诧风云"},
[89]={前置=true,资源="magic.wdf",类型="召唤兽",地址=0x01000001,名称="流沙轻音"},
[90]={前置=true,资源="magic.wdf",类型="召唤兽",地址=317939146,名称="食指大动_香蕉"},
[91]={前置=true,资源="magic.wdf",类型="召唤兽",地址=352414521,名称="食指大动_菠萝"},
[92]={前置=true,资源="magic.wdf",类型="召唤兽",地址=3175360443,名称="食指大动_西瓜"},
[93]={前置=true,资源="magic.wdf",类型="召唤兽",地址=628504046,名称="地狱烈火1"},
[94]={前置=true,资源="magic.wdf",类型="召唤兽",地址=3190971801,名称="地狱烈火2"},
[95]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="召唤兽",地址=238079300,名称="雷击"},
[96]={前置=true,资源="magic.wdf",类型="召唤兽",地址=3507654973,名称="烈火"},
-- [97]={前置=true,资源="common/magic.wdf",类型="召唤兽",地址=0x10000017,名称="水漫金山"},
-- [98]={前置=true,资源="magic.wdf",类型="召唤兽",地址=2431146143,名称="水漫金山0"}
-- ,[99]={前置=true,资源="magic.wdf",类型="召唤兽",地址=2431146143,名称="水漫金山1"},
-- [100]={前置=true,资源="magic.wdf",类型="召唤兽",地址=2536577965,名称="水漫金山2"},
[101]={前置=true,资源="magic.wdf",类型="召唤兽",地址=4281577710,名称="力劈华山"},
[102]={前置=true,资源="common/ski.wdf",类型="召唤兽",地址=685510219,名称="月光"},
-- [104]={前置=true,资源="magic.wdf",类型="召唤兽",地址=4059195682,名称="奔雷咒1"},
-- [105]={前置=true,资源="magic.wdf",类型="召唤兽",地址=714700376,名称="奔雷咒2"},
[106]={前置=true,pyy=3,资源="addon.wdf",pyx=0,类型="召唤兽",地址=2581447466,名称="壁垒击破"},
[107]={前置=true,pyy=3,资源="addon.wdf",pyx=0,类型="召唤兽",地址=2374664589,名称="善恶有报"},
[108]={前置=true,资源="magic.wdf",类型="召唤兽",地址=0x02EA2E1B,名称="上古灵符"},
[109]={前置=true,资源="magic.wdf",类型="召唤兽",地址=4052514525,名称="夜舞倾城"},
[110]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=3739150723,名称="状态_法术防御"},
[111]={前置=false,资源="waddon.wdf",类型="召唤兽",地址=421013860,名称="死亡召唤"},
[112]={前置=false,资源="waddon.wdf",类型="召唤兽",地址=421013860,名称="状态_死亡召唤"},
[113]={前置=false,资源="waddon.wdf",类型="召唤兽",地址=744629204,名称="状态_八凶法阵"},
[114]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="召唤兽",地址=1922752098,名称="剑荡四方"},
[115]={前置=true,资源="magic.wdf",类型="召唤兽",地址=1374601203,名称="打雷加电"},
[116]={前置=true,资源="waddon.wdf",类型="召唤兽",地址=1092377986,名称="津津有味"},
[117]={前置=true,资源="magic.wdf",类型="召唤兽",地址=0x2ea2e1b,名称="上古灵符(冰冻)"},
[118]={前置=true,资源="magic.wdf",类型="召唤兽",地址=0xfc1c8ee7,名称="上古灵符(流沙)"},
[119]={前置=true,资源="magic.wdf",类型="召唤兽",地址=0x9779b893,名称="上古灵符(心火)"},
[120]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="召唤兽",地址=0xef3e3fe4,名称="上古灵符(怒雷)"},
-- [121]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=2941176306,名称="状态_龙魂"},
[122]={前置=true,资源="magic.wdf",类型="召唤兽",地址=4187497166,名称="天降灵葫_大"},
[123]={前置=true,资源="magic.wdf",类型="召唤兽",地址=1966283112,名称="天降灵葫_中"},
[124]={前置=true,资源="magic.wdf",类型="召唤兽",地址=3705120885,名称="天降灵葫_小"},
[125]={前置=true,资源="waddon.wdf",类型="召唤兽",地址=2255419138,名称="状态_盾气_敌方"},
[126]={前置=true,资源="waddon.wdf",类型="召唤兽",地址=684015174,名称="状态_盾气_我方"},
[127]={前置=true,资源="magic.wdf",类型="召唤兽",地址=2889688379,名称="腾挪劲"},
[128]={前置=true,资源="magic.wdf",类型="召唤兽",地址=540773493,名称="怒吼"},
[129]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=792609393,名称="状态_无畏布施_敌方"},
[130]={前置=false,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=324241231,名称="状态_无畏布施_我方"},
[131]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=3095343689,名称="状态_进击必杀"},
[132]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=2151148071,名称="状态_进击法爆"},
[133]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=3095343689,名称="状态_高级进击必杀"},
[134]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=2151148071,名称="状态_高级进击法爆"},
[135]={前置=true,资源="magic.wdf",类型="召唤兽",地址=1856250990,名称="神牛蹈火"},
[136]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="召唤兽",地址=2708005487,名称="状态_神牛蹈火"},
[137]={前置=true,资源="magic.wdf",类型="召唤兽",地址=1333990134,名称="三头六臂"},
[138]={前置=true,资源="magic.wdf",类型="召唤兽",地址=2964547219,名称="追亡逐北"},
[139]={前置=true,资源="magic.wdf",类型="召唤兽",地址=272787349,名称="北冥之渊"},
[140]={前置=true,资源="waddon.wdf",类型="召唤兽",地址=4066099146,名称="状态_北冥之渊"},
[141]={前置=true,资源="zdy5.rpk",类型="召唤兽",地址=0x10000000,名称="扶摇万里"},
[142]={前置=true,pyy=-45,资源="magic.wdf",pyx=2,类型="召唤兽",地址=3577357803,名称="水击三千"},
[143]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="特技",地址=0xE1084D39,名称="慈航普度"},
[144]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=2128818470,名称="凝神诀"},
[145]={前置=true,资源="magic.wdf",类型="特技",地址=2391977602,名称="回魂咒"},
[146]={前置=false,资源="magic.wdf",类型="特技",地址=388205471,名称="冰清诀"},
[147]={前置=false,资源="magic.wdf",类型="特技",地址=388205471,名称="晶清诀"},
[148]={前置=false,资源="magic.wdf",类型="特技",地址=388205471,名称="同生共死"},
[149]={前置=false,资源="magic.wdf",类型="特技",地址=1712652406,名称="玉清诀"},
[150]={前置=false,资源="magic.wdf",类型="特技",地址=1712652406,名称="水清诀"},
[151]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=3497509792,名称="四海升平"},
[152]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=821212684,名称="命归术"},
[153]={前置=true,pyy=3,资源="addon.wdf",pyx=0,类型="特技",地址=387269810,名称="破血狂攻"},
[154]={前置=true,pyy=3,资源="addon.wdf",pyx=0,类型="特技",地址=387269810,名称="弱点击破"},
[155]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=3497509792,名称="气归术"},
[156]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=4227373440,名称="心疗术"},
[157]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=4088602190,名称="命疗术"},
[158]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=3505309973,名称="碎甲术"},
[159]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=3505309973,名称="破甲术"},
[160]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=843116756,名称="凝气诀"},
[161]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=4088602190,名称="气疗术"},
[162]={前置=true,资源="magic.wdf",类型="特技",地址=2391977602,名称="起死回生"},
[163]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=570091327,名称="破碎无双"},
[164]={前置=true,资源="magic.wdf",类型="特技",地址=0x81b4599f,名称="放下屠刀"},
[165]={前置=true,资源="magic.wdf",类型="特技",地址=2176080287,名称="河东狮吼"},
[166]={前置=false,资源="waddon.wdf",类型="特技",地址=1549538628,名称="状态_太极护法"},
[167]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="特技",地址=0x9B23F38E,名称="太极护法"},
[168]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="特技",地址=0x9B23F38E,名称="罗汉金钟"},
[169]={前置=false,资源="waddon.wdf",类型="特技",地址=1549538628,名称="状态_罗汉金钟"},
[170]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=4264029135,名称="流云诀"},
[171]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=4264029135,名称="啸风诀"},
[172]={前置=true,资源="magic.wdf",类型="特技",地址=0x203b8c75,名称="野兽之力"},
[173]={前置=true,资源="magic.wdf",类型="特技",地址=0x203b8c75,名称="魔兽之印"},
[174]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=956135146,名称="光辉之甲"},
[175]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=956135146,名称="圣灵之甲"},
[176]={前置=true,资源="magic.wdf",类型="特技",地址=0x5DE57BA4,名称="笑里藏刀"},
[177]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=350426462,名称="绝幻魔音"},
[178]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="特技",地址=4210336468,名称="状态_天衣无缝"},
[179]={前置=true,资源="magic.wdf",类型="特技",地址=3246643998,名称="天衣无缝"},
[180]={前置=true,资源="magic.wdf",类型="特技",地址=3521483726,名称="凝滞术"},
[181]={前置=false,资源="magic.wdf",类型="特技",地址=1204195587,名称="停陷术"},
[182]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=2769917705,名称="冥王爆杀"},
[183]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="特技",地址=2500219667,名称="修罗咒"},
[184]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="特技",地址=785149356,名称="状态_修罗咒"},
[185]={前置=true,资源="addon.wdf",类型="通用",地址=4112031304,名称="逃跑"},
[186]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="通用",地址=2769917705,名称="自爆"},
[187]={前置=true,pyy=2,资源="addon.wdf",pyx=0,类型="通用",地址=3195920150,名称="捕捉开始"},
[188]={前置=true,资源="addon.wdf",类型="通用",地址=2010253357,名称="加血"},
[189]={前置=true,资源="addon.wdf",类型="通用",地址=2156718962,名称="加愤怒"},
[190]={前置=true,资源="addon.wdf",类型="通用",地址=908223343,名称="防御"},
[191]={前置=true,资源="addon.wdf",类型="通用",地址=1000651155,名称="牛刀小试"},
[192]={前置=true,资源="addon.wdf",类型="通用",地址=1229832530,名称="飞镖"},
[193]={前置=true,资源="common/lbc.wdf",类型="通用",地址=3804004647,名称="弓弩攻击"},
[194]={前置=true,资源="addon.wdf",类型="通用",地址=1049700101,名称="加蓝"},
[195]={前置=true,资源="waddon.wdf",类型="通用",地址=324036383,名称="状态_冰封"},
[196]={前置=true,资源="addon.wdf",类型="通用",地址=4027829983,名称="保护"},
[197]={前置=false,资源="waddon.wdf",类型="通用",地址=3687768876,名称="状态_毒"},
[198]={前置=true,pyy=3,资源="addon.wdf",pyx=0,类型="通用",地址=490729788,名称="被击中"},
[199]={前置=true,pyy=3,资源="addon.wdf",pyx=0,类型="通用",地址=3690777786,名称="反震"},
[200]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="通用",地址=3973111811,名称="暴击"},
[201]={前置=true,pyy=1,资源="addon.wdf",pyx=0,类型="通用",地址=2601915514,名称="捕捉成功"},
[202]={前置=true,资源="magic.wdf",类型="通用",地址=518602860,名称="打狗棒"},
[203]={前置=false,资源="waddon.wdf",类型="通用",地址=69928620,名称="状态_护法紫丝"},
[204]={前置=true,资源="addon.wdf",类型="通用",地址=2604332261,名称="升级"},
[205]={前置=true,资源="addon.wdf",类型="通用",地址=3973111811,名称="战斗暴击"},
[206]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="通用",地址=3671632928,名称="法暴"},
[207]={前置=true,pyy=1,资源="addon.wdf",pyx=0,类型="通用",地址=2546441947,名称="战斗头标"},
[208]={前置=true,资源="magic.wdf",类型="通用",地址=2052453938,名称="特赦令牌"},
[209]={前置=true,资源="wzife.wd2",类型="通用",地址=1845385290,名称="闪亮登场"},
[210]={前置=true,资源="wzife.wd2",类型="通用",地址=922328264,名称="挑战失败"},
[211]={前置=true,资源="wzife.wdf",类型="通用",地址=4241851683,名称="无特效"},
[212]={前置=true,资源="addon.wdf",类型="通用",地址=2001827515,名称="弓弩1"},
[213]={前置=true,资源="addon.wdf",类型="通用",地址=3897292905,名称="弓弩2"},
[214]={前置=true,资源="addon.wdf",类型="通用",地址=675522948,名称="弓弩3"},
[215]={前置=true,资源="wzife.wd2",类型="通用",地址=4106238113,名称="阵型_不动如山"},
[216]={前置=false,pyy=-30,资源="waddon.wdf",pyx=0,类型="通用",地址=0xaabbcc55,名称="状态_护盾_我方"},
[217]={前置=false,pyy=-30,资源="waddon.wdf",pyx=0,类型="通用",地址=0xaabbcc56,名称="状态_护盾_敌方"},
[218]={前置=true,资源="common/magic.wdf",类型="大唐官府",地址=432079569,名称="新_横扫千军"},
[219]={前置=true,资源="common/magic.wdf",类型="大唐官府",地址=585093866,名称="新_后发制人"},
[220]={前置=true,资源="common/magic.wdf",类型="大唐官府",地址=1133941470,名称="新_破釜沉舟"},
[221]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=3293033444,名称="其疾如风"},
[222]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=2206060349,名称="其疾如林"},
[223]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=2215845942,名称="其疾如火"},
[224]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=3814947031,名称="其疾如山"},
[225]={前置=true,资源="magic.wdf",类型="大唐官府",地址=3356723242,名称="千里神行"},
[226]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="大唐官府",地址=3264874295,名称="杀气诀"},
[227]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="大唐官府",地址=2952484737,名称="状态_杀气诀"},
[228]={前置=true,资源="magic.wdf",类型="大唐官府",地址=968268166,名称="后发制人"},
[229]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="大唐官府",地址=2896471370,名称="横扫千军"},
[230]={前置=true,资源="magic.wdf",类型="大唐官府",地址=2027355398,名称="破釜沉舟"},
[231]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=707397219,名称="状态_后发制人"},
[232]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=3645258252,名称="状态_横扫千军"},
[233]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=3645258252,名称="状态_破釜沉舟"},
[234]={前置=true,资源="magic.wdf",类型="大唐官府",地址=1070238810,名称="安神诀"},
[235]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=3860707508,名称="状态_安神诀"},
[236]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="大唐官府",地址=3789941335,名称="反间之计"},
[237]={前置=true,资源="magic.wdf",类型="大唐官府",地址=2176080287,名称="斩龙诀"},
[238]={前置=true,pyy=3,资源="magic.wd1",pyx=0,类型="大唐官府",地址=2556268900,名称="长驱直入"},
[239]={前置=true,pyy=3,资源="magic.wd1",pyx=0,类型="大唐官府",地址=221458018,名称="翩鸿一击"},
[240]={前置=true,资源="magic.wd1",类型="大唐官府",地址=3201865258,名称="突进"},
[241]={前置=true,资源="waddon.wdf",类型="大唐官府",地址=2243155697,名称="状态_突进"},
[242]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="化生寺",地址=4145933047,名称="谆谆教诲"},
[243]={前置=true,资源="common/magic.wdf",类型="化生寺",地址=2869790212,名称="新_金刚护法"},
[244]={前置=true,资源="common/magic.wdf",类型="化生寺",地址=2129405803,名称="新_推气过宫"},
[245]={前置=true,资源="common/magic.wdf",类型="化生寺",地址=1875061190,名称="新_我佛慈悲"},
[246]={前置=true,资源="common/magic.wdf",类型="化生寺",地址=4019622387,名称="新_活血"},
[247]={前置=true,资源="common/magic.wdf",类型="化生寺",地址=4073176206,名称="新_救死扶伤"},
[248]={前置=true,资源="common/magic.wdf",类型="化生寺",地址=2361001698,名称="新_舍生取义"},
[249]={前置=true,资源="common/magic.wdf",类型="化生寺",地址=2655950677,名称="新_金刚护体"},
[250]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=2493890284,名称="韦陀护法"},
[251]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="化生寺",地址=1659752907,名称="状态_韦陀护法"},
[252]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=51617616,名称="妙手回春"},
[253]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=2565901429,名称="达摩护体"},
[254]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=2565901429,名称="状态_达摩护体"},
-- [255]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=0x4CFC6116,名称="推气过宫"},
[256]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=0x28E639AA,名称="救死扶伤"},
[257]={前置=true,资源="waddon.wdf",类型="化生寺",地址=916220457,名称="状态_金刚护体"},
[258]={前置=true,资源="magic.wdf",类型="化生寺",地址=428453890,名称="佛门普渡"},
[259]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=51617616,名称="活血"},
[260]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=51617616,名称="推拿"},
[261]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=952243307,名称="金刚护体"}
,[262]={前置=false,资源="waddon.wdf",类型="化生寺",地址=382287583,名称="状态_一苇渡江"},
[263]={前置=true,资源="magic.wdf",类型="化生寺",地址=4082420920,名称="一苇渡江"},
[264]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=3727996990,名称="解毒"},
-- [265]={前置=true,资源="magic.wdf",类型="化生寺",地址=3240896099,名称="唧唧歪歪"},
[266]={前置=true,资源="magic.wdf",类型="化生寺",地址=540772211,名称="我佛慈悲"},
[267]={前置=true,资源="magic.wd1",类型="化生寺",地址=1240170519,名称="诸天看护"},
[268]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=81488906,名称="金刚护法"},
[269]={前置=true,pyy=3,资源="wzife.wdf",pyx=0,类型="化生寺",地址=4241851683,名称="状态_金刚护法"},
[270]={前置=true,资源="waddon.wdf",类型="化生寺",地址=3930943562,名称="状态_佛法无边"},
[271]={前置=true,资源="magic.wdf",类型="化生寺",地址=3355516657,名称="佛法无边"},
[272]={前置=true,资源="magic.wdf",类型="化生寺",地址=4040069189,名称="舍生取义"},
[273]={前置=true,资源="magic.wdf",类型="化生寺",地址=4040069189,名称="妙悟"},
[274]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=2479870127,名称="醍醐灌顶"},
[275]={前置=true,资源="magic.wdf",类型="化生寺",地址=2806180011,名称="紫气东来"},
[276]={前置=true,资源="magic.wd1",类型="化生寺",地址=448678604,名称="渡劫金身"},
[277]={前置=true,资源="waddon.wdf",类型="化生寺",地址=2461796759,名称="状态_渡劫金身"},
[278]={前置=true,资源="common/magic.wdf",类型="女儿村",地址=687534071,名称="新_楚楚可怜"},
[279]={前置=true,资源="common/magic.wdf",类型="女儿村",地址=0x253c9538,名称="新_满天花雨"},
[280]={前置=true,资源="common/magic.wdf",类型="女儿村",地址=1943568009,名称="新_莲步轻舞"},
[281]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="女儿村",地址=3029593952,名称="新_如花解语"},
[282]={前置=true,pyy=-3,资源="common/magic.wdf",pyx=0,类型="女儿村",地址=3121669201,名称="新_似玉生香"},
[283]={前置=true,pyy=-3,资源="common/magic.wdf",pyx=0,类型="女儿村",地址=2945351131,名称="新_娉婷嬝娜"},
[284]={前置=true,资源="common/magic.wdf",类型="女儿村",地址=2472519800,名称="新_一笑倾城"}
,[285]={前置=false,资源="waddon.wdf",类型="女儿村",地址=2110711092,名称="状态_花护"},
[286]={前置=true,资源="magic.wdf",类型="女儿村",地址=3858048292,名称="红袖添香"},
[287]={前置=true,资源="waddon.wdf",类型="女儿村",地址=3037907947,名称="状态_红袖添香"},
[288]={前置=false,资源="waddon.wdf",类型="女儿村",地址=2848516743,名称="状态_飞花摘叶"},
[289]={前置=true,资源="magic.wdf",类型="女儿村",地址=2025809060,名称="飞花摘叶"},
[290]={前置=true,资源="magic.wdf",类型="女儿村",地址=3600592514,名称="百毒不侵"},
[291]={前置=true,资源="magic.wdf",类型="女儿村",地址=324036383,名称="一笑倾城"},
[292]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="女儿村",地址=3246545792,名称="情天恨海"},
[293]={前置=true,资源="magic.wdf",类型="女儿村",地址=1124767398,名称="娉婷嬝娜"},
[294]={前置=false,资源="waddon.wdf",类型="女儿村",地址=505084121,名称="状态_娉婷嬝娜"},
[295]={前置=true,资源="waddon.wdf",类型="女儿村",地址=2249091017,名称="状态_百毒不侵"},
[296]={前置=true,资源="waddon.wdf",类型="女儿村",地址=324036383,名称="状态_一笑倾城"},
[298]={前置=true,资源="magic.wdf",类型="女儿村",地址=1187493750,名称="似玉生香"},
[299]={前置=false,资源="waddon.wdf",类型="女儿村",地址=1507294969,名称="状态_似玉生香"},
[300]={前置=true,资源="magic.wd1",类型="女儿村",地址=2822397861,名称="鸿渐于陆"},
[301]={前置=true,资源="magic.wdf",类型="女儿村",地址=405595707,名称="楚楚可怜"},
[302]={前置=true,资源="waddon.wdf",类型="女儿村",地址=1923968442,名称="状态_楚楚可怜"},
[303]={前置=true,资源="magic.wdf",类型="女儿村",地址=1963789198,名称="移形换影"},
[304]={前置=false,资源="waddon.wdf",类型="女儿村",地址=505084121,名称="状态_如花解语"},
[305]={前置=false,资源="waddon.wdf",类型="女儿村",地址=3387695093,名称="状态_莲步轻舞"},
[306]={前置=true,资源="magic.wdf",类型="女儿村",地址=2319038367,名称="如花解语"},
[307]={前置=true,资源="magic.wdf",类型="女儿村",地址=2556614190,名称="莲步轻舞"},
[308]={前置=true,资源="addon.wdf",类型="女儿村",地址=1229832530,名称="雨落寒沙"},
[309]={前置=true,资源="magic.wdf",类型="女儿村",地址=3808354120,名称="月下霓裳"},
[310]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="女儿村",地址=1326540099,名称="状态_自矜"},
[311]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=2953358353,名称="落魄符"},
[312]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=18270514,名称="新_碎甲术"},
[313]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=2310198074,名称="新_失心符"},
[314]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=1540077135,名称="新_五雷咒"},
[315]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=3102044448,名称="催眠符"},
[316]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=2960331165,名称="新_失忆符"},
[317]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=604428864,名称="新_失魂符"},
[318]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=2223354850,名称="新_定身符"}
,[319]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=0xc1731a60,名称="新_落雷符"}
,[320]={前置=true,资源="common/magic.wdf",类型="方寸山",地址=1268435602,名称="新_分身术"}
,[321]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=3567923082,名称="失忆符"},
[322]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3946646209,名称="状态_失忆符"},
[323]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=1337287235,名称="落魄符"},
[324]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3635978625,名称="状态_落魄符"},
[325]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=421114130,名称="离魂符"},
[326]={前置=true,资源="magic.wdf",类型="方寸山",地址=3262911017,名称="碎甲符"},
[327]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3946646209,名称="状态_碎甲符"},
[328]={前置=true,pyy=3,资源="magic.wd1",pyx=0,类型="方寸山",地址=1986345723,名称="飞符炼魂"},
[329]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="方寸山",地址=3962653115,名称="状态_不灭"},
[330]={前置=true,资源="magic.wd1",类型="方寸山",地址=636570206,名称="钟馗论道"},
[331]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3704301026,名称="状态_钟馗论道"},
[332]={前置=true,资源="magic.wd1",类型="方寸山",地址=998683268,名称="顺势而为"},
[333]={前置=false,资源="waddon.wdf",类型="方寸山",地址=753013566,名称="状态_顺势而为"},
[334]={前置=true,资源="waddon.wdf",类型="方寸山",地址=3217293391,名称="状态_摧心"},
[335]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3655438388,名称="状态_追魂符"},
[336]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=3556918902,名称="追魂符"},
[337]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3655438388,名称="状态_离魂符"},
[338]={前置=false,资源="waddon.wdf",类型="方寸山",地址=2461182746,名称="状态_定身符"},
[339]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3635978625,名称="状态_失心符"},
[340]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=3729668740,名称="定身符"},
[341]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3398426285,名称="状态_催眠符"},
[342]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=152755655,名称="失心符"},
[343]={前置=true,资源="magic.wdf",类型="方寸山",地址=1829610500,名称="乙木仙遁"},
[344]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=0xc1731a60,名称="落雷符"},
[346]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=1366709986,名称="归元咒"},
[347]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=340456440,名称="乾天罡气"},
[348]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="方寸山",地址=2077068224,名称="失魂符"},
[349]={前置=false,资源="waddon.wdf",类型="方寸山",地址=2336457533,名称="状态_失魂符"}
,[350]={前置=true,资源="waddon.wdf",类型="方寸山",地址=3726295403,名称="状态_分身术"},
[351]={前置=true,资源="magic.wdf",类型="方寸山",地址=2651211088,名称="否极泰来"},
[352]={前置=true,资源="magic.wdf",类型="方寸山",地址=1213264229,名称="三星灭魔"},
[353]={前置=true,资源="magic.wdf",类型="方寸山",地址=1366676991,名称="凝神术"},
[354]={前置=true,资源="waddon.wdf",类型="方寸山",地址=3259441440,名称="状态_凝神术"},
[355]={前置=true,资源="magic.wdf",类型="方寸山",地址=2889414079,名称="渡劫_落魄符"},
[356]={前置=true,资源="magic.wdf",类型="方寸山",地址=3933621573,名称="渡劫_催眠符"},
[357]={前置=true,资源="common/magic.wdf",类型="天宫",地址=4050741445,名称="真·天雷斩"},
[358]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="天宫",地址=1615127066,名称="新_五雷轰顶"},
[359]={前置=true,资源="common/magic.wdf",类型="天宫",地址=2434677025,名称="新_雷霆万钧"},
[360]={前置=true,资源="common/magic.wdf",类型="天宫",地址=345397544,名称="新_镇妖"},
[361]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="天宫",地址=2368744672,名称="新_错乱"},
[362]={前置=true,资源="common/magic.wdf",类型="天宫",地址=1704285798,名称="新_百万神兵"},
[363]={前置=true,资源="magic.wdf",类型="天宫",地址=2340755185,名称="百万神兵"},
[364]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="天宫",地址=4292234442,名称="五雷轰顶"},
[365]={前置=true,资源="magic.wdf",类型="天宫",地址=3231493430,名称="天神护体"},
[366]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="天宫",地址=1935690327,名称="天神护法"},
[367]={前置=true,资源="magic.wdf",类型="天宫",地址=0xf8cacf2f,名称="雷霆万钧"},
[368]={前置=false,资源="waddon.wdf",类型="天宫",地址=3297426043,名称="状态_百万神兵"},
[369]={前置=true,资源="magic.wdf",类型="天宫",地址=0x7adce5a8,名称="错乱"},
[370]={前置=true,资源="waddon.wdf",类型="天宫",地址=796443758,名称="状态_错乱"},
[371]={前置=true,资源="addon.wdf",类型="天宫",地址=3054771897,名称="天雷斩"},
[372]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="天宫",地址=4144239303,名称="镇妖"},
[373]={前置=false,资源="waddon.wdf",类型="天宫",地址=2557820820,名称="状态_镇妖"},
[374]={前置=true,资源="magic.wdf",类型="天宫",地址=871130409,名称="腾云驾雾"},
[375]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="天宫",地址=1724676649,名称="状态_天神护体"},
[376]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="天宫",地址=1724676649,名称="状态_天神护法"},
[377]={前置=true,资源="magic.wdf",类型="天宫",地址=2804931352,名称="宁心"},
[379]={前置=true,资源="magic.wdf",类型="天宫",地址=3835868782,名称="天诛地灭"},
[380]={前置=true,资源="magic.wdf",类型="天宫",地址=468068601,名称="知己知彼"},
[381]={前置=true,资源="magic.wd1",类型="天宫",地址=0x4B7E9179,名称="金刚镯"},
[382]={前置=true,资源="waddon.wdf",类型="天宫",地址=0x4B7E9179,名称="状态_金刚镯"},
[383]={前置=false,资源="magic.wd1",类型="天宫",地址=4231042176,名称="画地为牢"},
[384]={前置=false,资源="waddon.wdf",类型="天宫",地址=3697993431,名称="状态_画地为牢"},
[385]={前置=false,资源="waddon.wdf",类型="天宫",地址=1477889479,名称="状态_轰鸣"},
[386]={前置=false,资源="waddon.wdf",类型="天宫",地址=1858765829,名称="状态_电芒"},
[387]={前置=true,资源="magic.wd1",类型="天宫",地址=2858312535,名称="风雷韵动"},
[388]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="天宫",地址=3394181829,名称="状态_趁虚"},
[389]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=1024225265,名称="真·普渡众生"},
[390]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=3304767052,名称="新_巨岩破"},
[391]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=1688442905,名称="新_靛沧海"},
[392]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=3697295294,名称="新_地裂火"},
[393]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=770601514,名称="新_苍茫树"},
[394]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=1174634801,名称="新_日光华"},
[395]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=514194124,名称="新_紧箍咒"},
[396]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=164409587,名称="新_灵动九天"},
[397]={前置=true,资源="common/magic.wdf",类型="普陀山",地址=3602863533,名称="新_自在心法"},
-- [398]={前置=true,资源="magic.wdf",类型="普陀山",地址=0x9CCB6E84,名称="巨岩破"},
[400]={前置=true,资源="magic.wdf",类型="普陀山",地址=1915810093,名称="坐莲"},
[401]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=4024909497,名称="状态_紧箍咒"},
[402]={前置=true,资源="magic.wdf",类型="普陀山",地址=804734328,名称="普渡众生"},
[403]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="普陀山",地址=1306482320,名称="状态_颠倒五行"},
[406]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="普陀山",地址=1417725769,名称="紧箍咒"},
[407]={前置=true,资源="magic.wdf",类型="普陀山",地址=939734977,名称="杨柳甘露"},
[409]={前置=true,资源="magic.wdf",类型="普陀山",地址=923673984,名称="颠倒五行"},
[410]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="普陀山",地址=3632623912,名称="状态_普渡众生"},
[411]={前置=true,资源="magic.wdf",类型="普陀山",地址=1070238810,名称="灵动九天"},
[412]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="普陀山",地址=2516534368,名称="状态_灵动九天"},
[413]={前置=true,资源="waddon.wdf",类型="普陀山",地址=1458710428,名称="清静菩提"},
[414]={前置=true,资源="magic.wdf",类型="普陀山",地址=2002331236,名称="自在心法"},
[415]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="普陀山",地址=1510462730,名称="五行错位"},
[416]={前置=true,资源="magic.wd1",类型="普陀山",地址=2217019040,名称="波澜不惊"},
[417]={前置=true,资源="waddon.wdf",类型="普陀山",地址=69928620,名称="状态_波澜不惊"},
[418]={前置=true,资源="magic.wd1",类型="普陀山",地址=2297534034,名称="剑意莲心"},
[419]={前置=false,资源="waddon.wdf",类型="普陀山",地址=756967567,名称="状态_剑意莲心"},
[420]={前置=true,资源="magic.wd1",类型="普陀山",地址=4262154835,名称="莲花心音"},
[421]={前置=true,资源="magic.wd1",类型="普陀山",地址=515146208,名称="木曰曲直"},
[422]={前置=true,资源="magic.wd1",类型="普陀山",地址=677344778,名称="士曰稼穑"},
[423]={前置=true,资源="magic.wd1",类型="普陀山",地址=362267699,名称="水曰润下"},
[424]={前置=true,资源="magic.wd1",类型="普陀山",地址=709640088,名称="火日炎上"},
[425]={前置=true,资源="magic.wd1",类型="普陀山",地址=141422918,名称="金日从革"},
[426]={前置=false,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=181030981,名称="状态_木曰曲直_我方"},
[427]={前置=false,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=809715220,名称="状态_士曰稼穑_我方"},
[428]={前置=false,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=3634537113,名称="状态_水曰润下_我方"},
[429]={前置=false,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=558433718,名称="状态_火日炎上_我方"},
[430]={前置=false,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=1329898846,名称="状态_金日从革_我方"},
[431]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=1893926450,名称="状态_木曰曲直_敌方"},
[432]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=551544853,名称="状态_士曰稼穑_敌方"},
[433]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=1055311866,名称="状态_水曰润下_敌方"},
[434]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=2151148071,名称="状态_火日炎上_敌方"},[435]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="普陀山",地址=3095343689,名称="状态_金日从革_敌方"},
[436]={前置=true,资源="common/magic.wdf",类型="龙宫",地址=2711530289,名称="新_龙卷雨击"},[437]={前置=true,资源="common/magic.wdf",类型="龙宫",地址=948417399,名称="新_龙腾"},[438]={前置=true,资源="common/magic.wdf",类型="龙宫",地址=1214487797,名称="新_龙吟"},[439]={前置=true,资源="common/magic.wdf",类型="龙宫",地址=908468230,名称="新_二龙戏珠"},
-- [440]={前置=true,资源="magic.wdf",类型="龙宫",地址=2711530289,名称="龙卷雨击"},
[441]={前置=true,资源="magic.wdf",类型="龙宫",地址=3911640280,名称="龙卷雨击1"},[442]={前置=true,资源="magic.wdf",类型="龙宫",地址=3592299801,名称="龙卷雨击2"},[443]={前置=true,资源="magic.wdf",类型="龙宫",地址=3514247917,名称="龙卷雨击3"},[444]={前置=true,资源="magic.wdf",类型="龙宫",地址=1459200517,名称="龙卷雨击4"},[445]={前置=true,资源="magic.wdf",类型="龙宫",地址=2769917705,名称="龙吟1"},[446]={前置=true,资源="magic.wdf",类型="龙宫",地址=1589827003,名称="龙吟2"},[447]={前置=true,资源="magic.wdf",类型="龙宫",地址=1031061010,名称="龙吟3"},[448]={前置=true,资源="magic.wdf",类型="龙宫",地址=1667259533,名称="龙吟4"},[449]={前置=true,资源="magic.wdf",类型="龙宫",地址=2682554441,名称="龙吟5"},[450]={前置=true,资源="magic.wdf",类型="龙宫",地址=1936174863,名称="龙腾"},[451]={前置=true,资源="magic.wdf",类型="龙宫",地址=1280017893,名称="水遁"},[452]={前置=true,资源="magic.wdf",类型="龙宫",地址=2793449505,名称="二龙戏珠"},[453]={前置=true,资源="magic.wdf",类型="龙宫",地址=2759396577,名称="神龙摆尾"},[454]={前置=true,资源="waddon.wdf",类型="龙宫",地址=4052008281,名称="状态_神龙摆尾"},[455]={前置=true,资源="magic.wdf",类型="龙宫",地址=1667259533,名称="龙吟"},[456]={前置=false,资源="waddon.wdf",类型="龙宫",地址=3366209335,名称="状态_乘风破浪"},[457]={前置=true,资源="wzife.wdf",类型="龙宫",地址=0x85b3d6f1,名称="状态_逆鳞"},[458]={前置=true,资源="magic.wdf",类型="龙宫",地址=1833750106,名称="解封"},[459]={前置=true,资源="magic.wdf",类型="龙宫",地址=1172493695,名称="乘风破浪"},[460]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="龙宫",地址=822452251,名称="清心"},[461]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="龙宫",地址=81488906,名称="逆鳞"},[462]={前置=true,资源="magic.wdf",类型="龙宫",地址=4102286099,名称="龙战于野"},[463]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="龙宫",地址=1288547531,名称="状态_龙战于野"},[464]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="龙宫",地址=2326697460,名称="状态_天龙"},[465]={前置=true,资源="magic.wd1",类型="龙宫",地址=736658021,名称="亢龙归海"},[466]={前置=true,资源="magic.wd1",类型="龙宫",地址=1640234856,名称="雷浪穿云"},[467]={前置=true,资源="waddon.wdf",类型="龙宫",地址=82552545,名称="状态_雷浪穿云"},[468]={前置=true,资源="magic.wdf",类型="龙宫",地址=551030168,名称="龙啸九天"},[469]={前置=true,资源="magic.wd1",类型="龙宫",地址=3161763199,名称="破浪"},[470]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="龙宫",地址=3962653115,名称="状态_破浪"},[471]={前置=true,资源="common/magic.wdf",类型="五庄观",地址=741188633,名称="新_日月乾坤"},[472]={前置=true,资源="common/magic.wdf",类型="五庄观",地址=486437114,名称="新_炼气化神"},[473]={前置=true,资源="common/magic.wdf",类型="五庄观",地址=2088593318,名称="新_生命之泉"},[474]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="五庄观",地址=2751305079,名称="敲金击玉"},[475]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="五庄观",地址=1723776186,名称="新_飘渺式"},[476]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="五庄观",地址=3496024499,名称="烟雨剑法"},[477]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="五庄观",地址=3496024499,名称="飘渺式"},[478]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="五庄观",地址=910697598,名称="炼气化神"},[479]={前置=true,资源="magic.wdf",类型="五庄观",地址=2802651747,名称="日月乾坤"},[480]={前置=true,资源="waddon.wdf",类型="五庄观",地址=1906144895,名称="状态_蓝灯"},[481]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="五庄观",地址=1906144895,名称="状态_炼气化神"},[482]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="五庄观",地址=4176381242,名称="状态_生命之泉"},[483]={前置=true,资源="waddon.wdf",类型="五庄观",地址=4176381242,名称="状态_红灯"},[484]={前置=true,资源="waddon.wdf",类型="五庄观",地址=826002553,名称="状态_日月乾坤"},[485]={前置=true,资源="magic.wdf",类型="五庄观",地址=2002768611,名称="三花聚顶"},
[486]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="五庄观",地址=3537672915,名称="生命之泉"},[487]={前置=true,资源="magic.wdf",类型="五庄观",地址=1056770863,名称="斗转星移"},[488]={前置=true,资源="magic.wdf",类型="五庄观",地址=1919599687,名称="驱魔"},[489]={前置=true,资源="magic.wdf",类型="五庄观",地址=1919599687,名称="驱尸"},[490]={前置=true,资源="waddon.wdf",类型="五庄观",地址=3902413279,名称="状态_驱魔"},[491]={前置=true,资源="magic.wdf",类型="五庄观",地址=4060043784,名称="同伤式"},[492]={前置=true,资源="magic.wdf",类型="五庄观",地址=569725183,名称="天地同寿"},[493]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="五庄观",地址=3067025739,名称="状态_天地同寿"},[494]={前置=true,资源="common/magic.wdf",类型="五庄观",地址=2310198074,名称="乾坤妙法"},[495]={前置=true,资源="waddon.wdf",类型="五庄观",地址=1457543986,名称="状态_乾坤妙法"},[496]={前置=true,资源="magic.wdf",类型="五庄观",地址=350426462,名称="太极生化"},[497]={前置=true,资源="magic.wd1",类型="五庄观",地址=3819755622,名称="清风望月"},[498]={前置=true,资源="magic.wd1",类型="五庄观",地址=874949856,名称="天命剑法"},[499]={前置=true,资源="magic.wd1",类型="五庄观",地址=874949856,名称="心随意动"},[500]={前置=true,资源="waddon.wdf",类型="五庄观",地址=1457543986,名称="状态_心随意动"},[501]={前置=true,资源="common/magic.wdf",类型="狮驼岭",地址=1943674063,名称="新_象形"},[502]={前置=true,资源="common/magic.wdf",类型="狮驼岭",地址=157771432,名称="新_狮搏"},[503]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="狮驼岭",地址=2197949870,名称="新_鹰击"},[504]={前置=true,资源="common/magic.wdf",类型="狮驼岭",地址=188096422,名称="新_变身"},[505]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="狮驼岭",地址=1792365061,名称="新_连环击"},[506]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="狮驼岭",地址=2222331931,名称="威慑"},[507]={前置=true,资源="waddon.wdf",类型="狮驼岭",地址=553438868,名称="状态_威慑"},[508]={前置=false,资源="waddon.wdf",类型="狮驼岭",地址=910599385,名称="状态_象形"},[509]={前置=true,资源="waddon.wdf",类型="狮驼岭",地址=1457543986,名称="状态_BUFF3"},[510]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="狮驼岭",地址=1724676649,名称="状态_定心术"},[511]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="狮驼岭",地址=755485932,名称="定心术"},[512]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="狮驼岭",地址=447447282,名称="变身"},[513]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="狮驼岭",地址=702028255,名称="状态_变身"},[514]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=2194212682,名称="鹰击"},[515]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=2433781833,名称="渡劫_鹰击"},[516]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=1754178891,名称="狮搏"},[517]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=3524163775,名称="天魔解体"},[518]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="狮驼岭",地址=1904694434,名称="极度疯狂"},[519]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="狮驼岭",地址=3152708596,名称="状态_极度疯狂"},[520]={前置=true,资源="addon.wdf",类型="狮驼岭",地址=1441516140,名称="连环击"},[521]={前置=true,资源="waddon.wdf",类型="狮驼岭",地址=3707401595,名称="状态_连环击"},[522]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=2661053669,名称="振翅千里"},[523]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=3188881443,名称="象形"},[524]={前置=false,资源="waddon.wdf",类型="狮驼岭",地址=1482851334,名称="状态_鹰击"},[525]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=2264804289,名称="疯狂鹰击"},[526]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="狮驼岭",地址=843116756,名称="魔息术"},[527]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="狮驼岭",地址=3694462578,名称="状态_魔息术"},[528]={前置=true,资源="magic.wdf",类型="狮驼岭",地址=1123039343,名称="魔兽啸天"},[529]={前置=true,pyy=2,资源="waddon.wdf",pyx=0,类型="狮驼岭",地址=2782376183,名称="状态_爪印"},[530]={前置=true,资源="magic.wd1",类型="狮驼岭",地址=2145633752,名称="背水一战"},[531]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="狮驼岭",地址=843157565,名称="状态_背水一战"},[532]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="狮驼岭",地址=1428538875,名称="状态_狂袭"},[533]={前置=true,资源="common/magic.wdf",类型="魔王寨",地址=1303803520,名称="新_飞砂走石"},[534]={前置=true,资源="common/magic.wdf",类型="魔王寨",地址=2001435887,名称="新_三昧真火"},[535]={前置=true,资源="common/magic.wdf",类型="魔王寨",地址=2678031855,名称="新_牛劲"},[536]={前置=true,资源="common/magic.wdf",类型="魔王寨",地址=1207839942,名称="新_风云变色"},
-- [537]={前置=true,资源="magic.wdf",类型="魔王寨",地址=1238094088,名称="飞砂走石"},
[538]={前置=true,资源="magic.wdf",类型="魔王寨",地址=717166877,名称="飞砂走石1"},
[539]={前置=true,资源="magic.wdf",类型="魔王寨",地址=2938873934,名称="牛屎遁"},
[540]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="魔王寨",地址=380796924,名称="魔王回首"},[541]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="魔王寨",地址=3152708596,名称="状态_魔王回首"},[542]={前置=true,资源="magic.wdf",类型="魔王寨",地址=4242328812,名称="三昧真火"},[543]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="魔王寨",地址=653299902,名称="牛劲"},[544]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="魔王寨",地址=2708005487,名称="状态_牛劲"},[545]={前置=true,pyy=-2,资源="magic.wdf",pyx=0,类型="魔王寨",地址=1264721399,名称="火甲术"},[546]={前置=true,资源="waddon.wdf",类型="魔王寨",地址=2194767352,名称="状态_火甲术"},[547]={前置=true,资源="waddon.wdf",类型="魔王寨",地址=1514813037,名称="魔火焚世"},[548]={前置=true,资源="magic.wdf",类型="魔王寨",地址=2332257768,名称="摇头摆尾"},[549]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="魔王寨",地址=1496460730,名称="状态_摇头摆尾"},[550]={前置=true,资源="magic.wdf",类型="魔王寨",地址=2794140177,名称="踏山裂石"},[551]={前置=true,资源="magic.wd1",类型="魔王寨",地址=1854443168,名称="魔焰滔天"},[552]={前置=true,资源="magic.wd1",类型="魔王寨",地址=1128747230,名称="烈焰真诀"},[553]={前置=true,资源="waddon.wdf",类型="魔王寨",地址=1092377986,名称="状态_烈焰真诀"},[554]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="魔王寨",地址=2941176306,名称="状态_蚀天"},[555]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="魔王寨",地址=76227116,名称="状态_敛恨"},[556]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="魔王寨",地址=3704665266,名称="状态_崩摧"},[557]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="魔王寨",地址=72083379,名称="状态_魔冥"},[558]={前置=true,资源="common/magic.wdf",类型="阴曹地府",地址=41987195,名称="新_阎罗令"},[559]={前置=true,资源="common/magic.wdf",类型="阴曹地府",地址=655467683,名称="新_判官令"},[560]={前置=true,资源="common/magic.wdf",类型="阴曹地府",地址=1008152314,名称="真·尸腐毒"},[561]={前置=true,资源="common/magic.wdf",类型="阴曹地府",地址=450543526,名称="新_黄泉之息"},[562]={前置=true,资源="common/magic.wdf",类型="阴曹地府",地址=263223006,名称="新_锢魂术"},[563]={前置=true,资源="common/magic.wdf",类型="阴曹地府",地址=2951983037,名称="新_魂飞魄散"},[564]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=2224965883,名称="尸腐毒"},[565]={前置=true,资源="waddon.wdf",类型="阴曹地府",地址=2208088730,名称="状态_尸腐毒"},[566]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=2709550029,名称="杳无音讯"},
-- [567]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=2662404697,名称="阎罗令"},
[568]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=2662404697,名称="阎罗拘魂"},
[569]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=605841034,名称="判官令"},
[570]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="阴曹地府",地址=132076234,名称="幽冥鬼眼"},
[571]={前置=true,pyy=3,资源="waddon.wdf",pyx=0,类型="阴曹地府",地址=558060035,名称="状态_幽冥鬼眼"},
[572]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=1538345049,名称="还阳术"},
[573]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="阴曹地府",地址=1543533550,名称="锢魂术"},[574]={前置=true,资源="waddon.wdf",类型="阴曹地府",地址=2523841483,名称="状态_锢魂术"},[575]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=4259626788,名称="寡欲令"},[576]={前置=true,资源="waddon.wdf",类型="阴曹地府",地址=3902413279,名称="状态_寡欲令"},[577]={前置=true,资源="waddon.wdf",类型="阴曹地府",地址=2289147609,名称="无间地狱"},[578]={前置=true,资源="waddon.wdf",类型="阴曹地府",地址=1934115845,名称="无间地狱2"},[579]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=2700998977,名称="魂飞魄散"},[580]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=638705710,名称="黄泉之息"},[581]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="阴曹地府",地址=1640698805,名称="状态_黄泉之息"},[582]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=4203231214,名称="冤魂不散"},[583]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="阴曹地府",地址=3746912677,名称="状态_汲魂"},[584]={前置=false,资源="common/magic.wdf",类型="阴曹地府",地址=759125516,名称="状态_魑魅缠身"},[585]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="阴曹地府",地址=1673191404,名称="魑魅缠身"},[586]={前置=true,pyy=3,资源="magic.wd1",pyx=0,类型="阴曹地府",地址=4024420829,名称="百爪狂杀"},[587]={前置=true,pyy=3,资源="magic.wd1",pyx=0,类型="阴曹地府",地址=2533814586,名称="六道无量"},[588]={前置=true,资源="magic.wdf",类型="阴曹地府",地址=3356723242,名称="遁地术"},[589]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=475519626,名称="新_勾魂"},[590]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=2980381879,名称="新_摄魄"},[591]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=2246487637,名称="新_魔音摄魂"},[592]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=3467578948,名称="新_含情脉脉"},[593]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=1622106919,名称="新_天罗地网"},[594]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=1122867384,名称="新_姐妹同心"},[595]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=704310189,名称="姐妹同心"},[596]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="盘丝洞",地址=2094646082,名称="夺命蛛丝"},[597]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=3127887554,名称="瘴气"},[598]={前置=true,资源="waddon.wdf",类型="盘丝洞",地址=219992550,名称="状态_瘴气"},[599]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=513152598,名称="天罗地网"},[600]={前置=false,资源="waddon.wdf",类型="盘丝洞",地址=2403234773,名称="状态_天罗地网(封)"},[601]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=341882911,名称="天蚕丝"},[602]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=1774142217,名称="盘丝阵"},[603]={前置=true,资源="waddon.wdf",类型="盘丝洞",地址=916220457,名称="状态_盘丝阵"},[604]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=3698682735,名称="复苏"},[605]={前置=true,资源="waddon.wdf",类型="盘丝洞",地址=2110711092,名称="状态_复苏"},[606]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=1399041837,名称="含情脉脉"},[607]={前置=false,资源="waddon.wdf",类型="盘丝洞",地址=2164502482,名称="状态_含情脉脉"},[608]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="盘丝洞",地址=669153049,名称="魔音摄魂"},[609]={前置=false,资源="waddon.wdf",类型="盘丝洞",地址=3299511832,名称="状态_魔音摄魂"},[610]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=2362865006,名称="幻镜术"},[611]={前置=true,资源="common/magic.wdf",类型="盘丝洞",地址=3272437193,名称="状态_幻镜术"},[612]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=1505585649,名称="摄魄"},[613]={前置=true,资源="magic.wdf",类型="盘丝洞",地址=457649967,名称="勾魂"},[614]={前置=false,资源="waddon.wdf",类型="盘丝洞",地址=219992550,名称="状态_迷瘴"},[615]={前置=true,资源="magic.wd1",类型="盘丝洞",地址=2161233849,名称="落花成泥"},[616]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="盘丝洞",地址=3200739338,名称="状态_落花成泥"},[617]={前置=true,资源="magic.wd1",类型="盘丝洞",地址=4120218905,名称="偷龙转凤"},[618]={前置=true,资源="waddon.wdf",类型="盘丝洞",地址=3236157004,名称="状态_偷龙转凤"},[619]={前置=true,资源="waddon.wdf",类型="盘丝洞",地址=2565398678,名称="媚眼如丝"},
-- [620]={前置=true,资源="common/magic.wdf",类型="神木林",地址=918544408,名称="新_落叶萧萧"},
[620]={前置=true,资源="common/magic.wdf",类型="神木林",地址=0x18967984,名称="新_落叶萧萧"},
[621]={前置=true,资源="common/magic.wdf",类型="神木林",地址=918544408,名称="宝莲秘法"},
[622]={前置=true,资源="common/magic.wdf",类型="神木林",地址=1673191404,名称="新_尘土刃"},
[623]={前置=true,资源="common/magic.wdf",类型="神木林",地址=880960576,名称="蛊树迷瘴"},
[624]={前置=true,资源="common/magic.wdf",类型="神木林",地址=1282699455,名称="新_冰川怒"},
[625]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="神木林",地址=54466769,名称="新_雾杀"},
[626]={前置=true,资源="common/magic.wdf",类型="神木林",地址=2918779264,名称="新_炎护"},[627]={前置=false,资源="waddon.wdf",类型="神木林",地址=3528951045,名称="状态_炎护"},[628]={前置=true,资源="common/magic.wdf",类型="神木林",地址=3134025593,名称="新_血雨"},[629]={前置=false,资源="common/magic.wdf",类型="神木林",地址=566328485,名称="状态_血雨"},[630]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="神木林",地址=534714019,名称="状态_风灵"},[631]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="神木林",地址=1506044316,名称="状态_雾杀"},[632]={前置=true,资源="common/magic.wdf",类型="神木林",地址=1863894572,名称="炎护"},[633]={前置=true,资源="common/magic.wdf",类型="神木林",地址=2645145495,名称="尘土刃"},[634]={前置=true,资源="common/magic.wdf",类型="神木林",地址=2336654137,名称="状态_炎护"},[635]={前置=true,资源="common/magic.wdf",类型="神木林",地址=3177673254,名称="落叶萧萧"},[636]={前置=true,资源="common/magic.wdf",类型="神木林",地址=4133515487,名称="落叶萧萧1"},[637]={前置=true,资源="common/magic.wdf",类型="神木林",地址=2492667257,名称="落叶萧萧2"},[638]={前置=true,资源="common/magic.wdf",类型="神木林",地址=1886752675,名称="血雨"},[639]={前置=true,资源="common/magic.wdf",类型="神木林",地址=1425547471,名称="冰川怒"},[640]={前置=true,资源="common/magic.wdf",类型="神木林",地址=1859374553,名称="叶隐"},[641]={前置=true,资源="common/magic.wdf",类型="神木林",地址=3298164407,名称="蜜润"},[642]={前置=true,资源="common/magic.wdf",类型="神木林",地址=636234317,名称="荆棘舞"},[643]={前置=true,资源="common/magic.wdf",类型="神木林",地址=3298164407,名称="星月之惠"},[644]={前置=true,资源="common/magic.wdf",类型="神木林",地址=1264783402,名称="雾杀"},[645]={前置=true,资源="common/magic.wdf",类型="神木林",地址=3231850111,名称="花语歌谣"},[646]={前置=false,资源="waddon.wdf",类型="神木林",地址=220586069,名称="状态_冰川怒"},[647]={前置=true,资源="waddon.wdf",类型="神木林",地址=2936481663,名称="状态_冰川怒伤"},[648]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="神木林",地址=534714019,名称="状态_蜜润"},[649]={前置=true,资源="common/magic.wdf",类型="神木林",地址=3471478568,名称="蝼蚁蚀天"},[650]={前置=true,资源="common/magic.wdf",类型="神木林",地址=2661300365,名称="凋零之歌"},[651]={前置=true,资源="common/magic.wdf",类型="神木林",地址=3177673254,名称="落叶萧萧1"},[652]={前置=true,资源="common/magic.wdf",类型="神木林",地址=2492667257,名称="落叶萧萧2"},[653]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="神木林",地址=882479171,名称="状态_雾痕"},[654]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=1012667926,名称="新_裂石"},[655]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=2509220919,名称="新_断岳势"},[656]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=4009081590,名称="新_天崩地裂"},[657]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3577357803,名称="新_浪涌"},[658]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=1769865702,名称="新_惊涛怒"},[659]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=1481349312,名称="新_翻江搅海"},[660]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=2320525961,名称="新_腾雷"},[661]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=3306468839,名称="新_不动如山"},[662]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3305016895,
名称="状态_战意1"},[663]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=1027378448,名称="状态_战意2"},[664]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3519264273,名称="状态_战意3"},[665]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3519264273,名称="状态_战意4"},[666]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=2336654137,名称="状态_战意5"},[667]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=2704907892,名称="碎星诀"},[668]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=741439825,名称="裂石"},[669]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=855565629,名称="断岳势"},[670]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=281904888,名称="状态_不动如山"},[671]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=1065487884,名称="浪涌"},[672]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=2761456237,名称="天崩地裂"},[673]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=814399755,名称="状态_碎星诀"},[674]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3546433571,名称="纵地金光"},[675]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=4106497964,名称="不动如山"},[676]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3385103645,名称="翻江搅海"},[677]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3197608773,名称="惊涛怒"},[678]={前置=true,资源="magic.wdf",类型="凌波城",地址=2272115910,名称="无双战魂"},[679]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=1282699455,名称="指地成钢"},[680]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=2704907892,名称="状态_镇魂诀"},[681]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=2382647645,名称="镇魂诀"},[682]={前置=true,资源="magic.wdf",类型="凌波城",地址=1833750106,名称="无穷妙道"},[683]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=3108834196,名称="腾雷"},[684]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=437505742,名称="状态_腾雷"},[685]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=540412418,名称="状态_怒涛"},[686]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=3795964039,名称="真君显灵"},[687]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=785690468,名称="状态_真君显灵"},[688]={前置=true,资源="common/magic.wdf",类型="凌波城",地址=1596797611,名称="天神怒斩"},[689]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=235955117,名称="状态_强袭"},[690]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=235955117,名称="状态_再战"},[691]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="凌波城",地址=235955117,名称="状态_力竭"},[692]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="无底洞",地址=236834233,名称="新_地涌金莲"},[693]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="无底洞",地址=361691537,名称="新_惊魂掌"},[694]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=2362865006,名称="新_煞气决"},[695]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="无底洞",地址=199851520,名称="新_夺魄令"},[696]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="无底洞",地址=3777803020,名称="新_摧心术"},[697]={前置=true,pyy=-2,资源="common/magic.wdf",pyx=0,类型="无底洞",地址=18811995,名称="新_夺命咒"},[698]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=3231850111,名称="地涌金莲"},[699]={前置=false,资源="common/magic.wdf",类型="无底洞",地址=566328485,名称="状态_夺魄令"},[700]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=3285527731,名称="惊魂掌"},[701]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=330324521,名称="移魂化骨"},[702]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="无底洞",地址=540412418,名称="状态_明光宝烛"},[703]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=2126428619,名称="状态_摧心术"},[704]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=2156799976,名称="状态_惊魂掌"},[705]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=2702496872,名称="摧心术"},
[706]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=0xa0e70f87,名称="夺命咒"},
[707]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=1479134995,名称="明光宝烛"},[708]={前置=true,pyy=1,资源="common/magic.wdf",pyx=0,类型="无底洞",地址=759125516,名称="状态_移魂化骨"},[709]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=2668097987,名称="夺魄令"},[710]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=1015505701,名称="煞气诀"},[711]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=2126428619,名称="状态_煞气诀"},[712]={前置=true,资源="magic.wdf",类型="无底洞",地址=3029064273,名称="净土灵华"},[713]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=1957190805,名称="金身舍利"},[714]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=3974903799,名称="状态_金身舍利"},[715]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=363765280,名称="万木凋枯"},[716]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=1573322717,名称="同舟共济"},[717]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=1478894474,名称="状态_同舟共济"},[718]={前置=false,资源="common/magic.wdf",类型="无底洞",地址=732930589,名称="状态_妖风四起"},[719]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=486437114,名称="妖风四起"},[720]={前置=true,资源="common/magic.wdf",类型="无底洞",地址=4026640309,名称="由己渡人"},[721]={前置=true,资源="common/magic.wdf",类型="怪物",地址=4035729128,名称="蚩尤技能"},[722]={前置=true,资源="common/magic.wdf",类型="怪物",地址=254337756,名称="刀光剑影"},[723]={前置=true,资源="common/magic.wdf",类型="怪物",地址=3754206450,名称="刀光剑影2"},[724]={前置=true,资源="common/magic.wdf",类型="怪物",地址=1037508083,名称="武神之怒"},[725]={前置=true,资源="common/magic.wdf",类型="怪物",地址=3241980893,名称="毁灭之光"},[726]={前置=true,资源="waddon.wdf",类型="怪物",地址=1480375307,名称="状态_毁灭之光"},[727]={前置=true,资源="common/magic.wdf",类型="怪物",地址=3231850111,名称="重生"},[728]={前置=true,资源="common/magic.wdf",类型="怪物",地址=979622056,名称="血沸"},[729]={前置=true,资源="common/magic.wdf",类型="怪物",地址=1065487884,名称="怒击"},[730]={前置=true,资源="common/magic.wdf",类型="怪物",地址=3459506689,名称="寒冰监牢"},[731]={前置=true,资源="common/magic.wdf",类型="怪物",地址=2576313905,名称="归墟"},[732]={前置=true,资源="common/magic.wdf",类型="怪物",地址=1012667926,名称="电芒"},[733]={前置=true,资源="addon.wdf",类型="怪物",地址=2287651809,名称="猛击"},[734]={前置=true,资源="common/magic.wdf",类型="怪物",地址=4138025932,名称="怒火"},[735]={前置=true,资源="common/magic.wdf",类型="怪物",地址=720078434,名称="秘传封印"},[736]={前置=true,资源="waddon.wdf",类型="怪物",地址=1480375307,名称="状态_秘传封印"},[737]={前置=true,资源="magic.wdf",类型="怪物",地址=2224965883,名称="尸腐无常"},[738]={前置=true,资源="waddon.wdf",类型="怪物",地址=3528951045,名称="状态_尸腐无常"},[739]={前置=true,资源="magic.wdf",类型="怪物",地址=48901659,名称="冰封千里"},[740]={前置=true,资源="common/magic.wdf",类型="怪物",地址=1479134995,名称="烈火焚原"},[741]={前置=true,资源="waddon.wdf",类型="怪物",地址=3946646209,名称="状态_烈火焚原"},[742]={前置=true,资源="magic.wdf",类型="灵宝",地址=2964547219,名称="断穹巨剑_敌方"},[743]={前置=true,资源="magic.wdf",类型="灵宝",地址=2964547219,名称="断穹巨剑_我方"},[744]={前置=true,资源="magic.wdf",类型="灵宝",地址=478120729,名称="静心禅珠"},[745]={前置=true,资源="magic.wdf",类型="灵宝",地址=532794516,名称="宁心道符"},[746]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="灵宝",地址=1590607581,名称="状态_宁心道符"},[747]={前置=true,资源="magic.wdf",类型="灵宝",地址=612261162,名称="相思寒针"},[748]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="灵宝",地址=1624944035,名称="状态_相思寒针"},[749]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="灵宝",地址=2764338276,名称="风舞心经_敌方"},[750]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="灵宝",地址=2764338276,名称="风舞心经_我方"},[751]={前置=true,资源="magic.wdf",类型="灵宝",地址=455679767,名称="锢魂命谱"},[752]={前置=true,资源="magic.wdf",类型="灵宝",地址=1319556287,名称="青狮獠牙"},[753]={前置=true,资源="magic.wdf",类型="灵宝",地址=1677272274,名称="冥火炼炉"},[754]={前置=true,资源="magic.wdf",类型="灵宝",地址=2969420210,名称="缚仙蛛丝"},[755]={前置=true,资源="magic.wdf",类型="灵宝",地址=2015653860,名称="煞魂冥灯"},[756]={前置=true,资源="magic.wdf",类型="灵宝",地址=4042837136,名称="九霄龙锥"},[757]={前置=true,资源="magic.wdf",类型="灵宝",地址=3350513751,名称="化怨清莲"},[758]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="灵宝",地址=688059605,名称="状态_化怨清莲"},
[760]={前置=true,资源="magic.wdf",类型="灵宝",地址=1374601203,名称="天雷音鼓"},[761]={前置=true,资源="magic.wdf",类型="灵宝",地址=2875043410,名称="寒霜盾戟"},[762]={前置=true,资源="magic.wdf",类型="灵宝",地址=3249833255,名称="乾坤金卷"},[763]={前置=true,资源="magic.wdf",类型="灵宝",地址=3015476820,名称="定神仙琴"},[764]={前置=true,pyy=2,资源="magic.wdf",pyx=0,类型="灵宝",地址=1624944035,名称="状态_定神仙琴"},
[766]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="灵宝",地址=250386318,名称="状态_赤炎战笛"},[767]={前置=true,资源="magic.wdf",类型="灵宝",地址=2875043410,名称="护体灵盾"},[768]={前置=true,资源="magic.wdf",类型="灵宝",地址=581240169,名称="惊兽云尺"},[769]={前置=true,资源="magic.wdf",类型="灵宝",地址=3590309158,名称="战神宝典"},[770]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="子女",地址=81488906,名称="潜力激发"},[771]={前置=true,资源="waddon.wdf",类型="盘丝洞",地址=281904888,名称="状态_BUFF8"},[772]={前置=true,资源="waddon.wdf",类型="阴曹地府",地址=2208088730,名称="状态_真·尸腐毒"},[773]={前置=true,资源="magic.wdf",类型="普陀山",地址=2208088730,名称="状态_自在心法"},[774]={前置=true,pyy=1,资源="waddon.wdf",pyx=0,类型="普陀山",地址=3632623912,名称="状态_真·普渡众生"},[775]={前置=true,资源="magic.wdf",类型="方寸山",地址=3262911017,名称="真·碎甲符"},[776]={前置=false,资源="waddon.wdf",类型="方寸山",地址=3946646209,名称="状态_真·碎甲符"},[777]={前置=true,资源="magic.wdf",类型="无底洞",地址=540772211,名称="噬魂"},[778]={前置=true,资源="magic.wdf",类型="无底洞",地址=540772211,名称="真·噬魂"},
[779]={前置=true,资源="addon.wdf",类型="女儿村",地址=0x303AA671,名称="雨落寒沙_敌方"},
[780]={前置=true,资源="addon.wdf",类型="女儿村",地址=0x665F869A,名称="雨落寒沙_我方"},[781]={前置=true,资源="waddon.wdf",类型="神木林",地址=2208088730,名称="状态_巫毒"},[782]={前置=true,资源="common/magic.wdf",类型="召唤兽",地址=2711530289,名称="叱咤风云"},[783]={前置=false,资源="waddon.wdf",类型="方寸山",地址=1640698805,名称="状态_昏睡"}
,[784]={前置=false,资源="waddon.wdf",地址=1133941470,名称="燃烧之光"}
,[785]={前置=false,资源="waddon.wdf",地址=1769865702,名称="毁灭之光"}
,[787]={前置=false,资源="waddon.wdf",地址=880960576,名称="移形换影-特"}
,[788]={前置=false,资源="waddon.wdf",地址=1268435602,名称="移花接木"}
,[789]={前置=false,资源="waddon.wdf",地址=1478894474,名称="状态_移花接木"}
,[790]={前置=false,资源="waddon.wdf",地址=1573322717,名称="身似菩提"}
,[791]={前置=false,资源="waddon.wdf",地址=1637574764,名称="状态_心明如镜"}
,[792]={前置=false,资源="waddon.wdf",地址=2361001698,名称="心明如镜"}
,[793]={前置=false,资源="waddon.wdf",地址=2473712400,名称="金刚怒目"}
,[794]={前置=false,资源="waddon.wdf",地址=3197608773,名称="金刚不坏"}
,[795]={前置=false,资源="waddon.wdf",地址=3454390793,名称="状态_金刚不坏"}
,[796]={前置=false,资源="waddon.wdf",地址=1769865702,名称="毁灭之光-"}
,[797]={前置=false,资源="waddon.wdf",地址=1268435602,名称="诅咒之伤"}
,[798]={前置=false,资源="waddon.wdf",地址=1268435602,名称="诅咒之亡"}
,[799]={前置=false,资源="waddon.wdf",地址=1012667926,名称="乾坤斩"}
,[800]={前置=false,资源="waddon.wdf",地址=908468230,名称="乾坤挪移"}
,[801]={前置=false,资源="waddon.wdf",地址=880960576,名称="移形换影-特"}
,[802]={前置=false,资源="waddon.wdf",地址=838907596,名称="死亡之音"}
,[803]={前置=false,资源="waddon.wdf",地址=720078434,名称="帝释无双"}
,[804]={前置=false,资源="waddon.wdf",地址=655467683,名称="虚空之刃"}
,[805]={前置=false,资源="waddon.wdf",地址=647553145,名称="伽罗无双"}
,[806]={前置=false,资源="waddon.wdf",地址=0xADF90980,名称="动物套效果"}
,[807]={前置=true,资源="magic.wdf",地址=3775417657,名称="燃血术"}
,[808]={前置=true,资源="magic.wdf",地址=0xA5D7B0F7,名称="催化"}
,[809]={前置=true,资源="magic.wdf",地址=0x430A96A6,名称="娉婷袅娜"}
,[810]={前置=false,资源="magic.wdf",地址=0x760B7BD7,名称="状态_娉婷袅娜"}
,[811]={前置=true,资源="magic.wdf",地址=0xA5D7B0F7,名称="狂怒"}
,[812]={前置=true,资源="magic.wdf",地址=0xA5D7B0F7,名称="状态_狂怒"}
,[813]={前置=false,资源="magic.wdf",地址=1833750106,名称="状态_无穷妙道"}
,[814]={前置=false,资源="magic.wdf",地址=0x84132036,名称="侵掠如火"}
,[815]={前置=true,pyy=3,资源="common/magic.wdf",pyx=0,类型="五庄观",地址=2751305079,名称="金击式"}
,[816]={前置=false,资源="magic.wdf",地址=0x0CEAF91A,名称="状态_侵掠如火"}

,[817]={前置=false,资源="magic.wdf",地址=0xE36378D7,名称="不动如山 "}
,[818]={前置=false,资源="magic.wdf",地址=0x0D25E055,名称="状态_不动如山 "}

,[819]={前置=false,资源="magic.wdf",地址=0x837DCF3D,名称="其徐如林 "}
,[820]={前置=false,资源="magic.wdf",地址=0x98753F94,名称="状态_其疾如风 "}
,[821]={前置=true,pyy=3,资源="magic.wdf",pyx=0,类型="化生寺",地址=81488906,名称="大快朵颐"}
,[822]={前置=true,pyy=3,资源="wzife.wdf",pyx=0,类型="化生寺",地址=4241851683,名称="状态_大快朵颐"}
,[823]={前置=true,pyy=3,资源="wzife.wdf",pyx=0,地址=0xdad8ac20,名称="法术暴击"}
,[824]={前置=true,资源="magic.wdf",地址=0xB0000041,名称="超级三昧真火"}
,[825]={前置=true,pyy=3,资源="addon.wdf",pyx=0,类型="召唤兽",地址=2581447466,名称="超级壁垒击破"}
,[826]={前置=trfalseue,资源="magic.wdf",地址=0x83FD8292,名称="状态_超级强力"}
,[827]={前置=false,资源="magic.wdf",地址=1833750106,名称="状态_吸星大法"}
,[828]={前置=false,资源="magic.wdf",地址=0x7E9811A9,名称="吸血特技"}
,[829]={前置=false,资源="magic.wdf",地址=0xAABB0001,名称="召唤"}
,[830]={前置=false,资源="magic.wdf",地址=0xaabbcc56,名称="铜头铁臂_敌方"}
,[831]={前置=false,资源="magic.wdf",地址=0xaabbcc55,名称="铜头铁臂_我方"}
,[832]={前置=false,资源="magic.wdf",地址=0xDA03A73D,名称="九幽除名"}
,[833]={前置=false,资源="magic.wdf",地址=0xDA03A73D,名称="状态_九幽除名"}
,[834]={前置=false,资源="magic.wdf",地址=0x2067A573,名称="云暗天昏"}
,[835]={前置=false,资源="magic.wdf",地址=0x89677EC6,名称="无所遁形"}
,[836]={前置=false,资源="magic.wdf",地址=0x3C0204DF,名称="状态_无所遁形"}
,[837]={前置=false,资源="magic.wdf",地址=0x109B780F,名称="呼子唤孙"}
,[838]={前置=false,资源="magic.wdf",地址=0x0D332E62,名称="状态_呼子唤孙"}
,[839]={前置=false,资源="magic.wdf",地址=648926576,名称="气慑天军"}
,[840]={前置=false,资源="magic.wdf",地址=2106427728,名称="状态_气慑天军"}
,[841]={前置=false,资源="magic.wdf",地址=3900082912,名称="天地洞明"}
,[842]={前置=false,资源="magic.wdf",地址=1133941470,名称="神针撼海"}
,[843]={前置=false,资源="magic.wdf",地址=3348997639,名称="当头一棒"}
,[844]={前置=false,资源="magic.wdf",地址=0xaabbcc57,名称="泼天乱棒"}
,[845]={前置=false,资源="magic.wdf",地址=0xaabbcc57,名称="杀威铁棒"}
,[846]={前置=false,资源="magic.wdf",地址=2458999444,名称="棒打雄风"}
,[847]={前置=false,资源="magic.wdf",地址=0xAABB0001,名称="八戒上身"}

,[848]={前置=false,资源="magic.wdf",地址=605841034,名称="棍打诸神"}
,[849]={前置=false,资源="magic.wdf",地址=605841034,名称="棒掀北斗"}
,[850]={前置=false,资源="magic.wdf",地址=605841034,名称="意马心猿"}
,[851]={前置=false,资源="magic.wdf",地址=605841034,名称="兴风作浪"}
,[852]={前置=false,资源="magic.wdf",地址=605841034,名称="棒掀北斗"}

-- ,[853]={前置=false,资源="magic.wdf",地址=0x11000245,名称="超级水漫金山"}
,[854]={前置=false,资源="magic.wdf",地址=0x3D3FA597,名称="状态_弱点火"}
,[855]={前置=false,资源="magic.wdf",地址=0xE42C0F60,名称="状态_弱点土"}
,[856]={前置=false,资源="magic.wdf",地址=0x85A553F8,名称="状态_弱点水"}
,[857]={前置=false,资源="magic.wdf",地址=0xd48b920,名称="状态_弱点雷"}

,[858]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="普陀山",地址=1417725769,名称="超级紧箍咒"}
,[859]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="普陀山",地址=4024909497,名称="状态_超级紧箍咒"}

,[860]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="花果山",地址=0xAABBCB01,名称="状态_超级战意1"}
,[861]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="花果山",地址=0xAABBCB02,名称="状态_超级战意2"}
,[862]={前置=true,pyy=1,资源="magic.wdf",pyx=0,类型="花果山",地址=0xAABBCB03,名称="状态_超级战意3"}


,[869]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=0x10CD86F8,名称="状态_玄灵珠·回春"}
,[871]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=0x10CD86F8,名称="状态_玄灵珠·破军"}
,[872]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=0x10CD86F8,名称="状态_玄灵珠·空灵"}
,[873]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=0x10CD86F8,名称="状态_玄灵珠·噬魂"}
,[874]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=3348997639,名称="靛沧啸"}
,[875]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=3348997639,名称="苍茫刺"}
,[876]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=3348997639,名称="巨岩击"}
,[877]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=3348997639,名称="地裂焚"}
,[878]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=3348997639,名称="日光耀"}

-- ,[880]={前置=false,资源="magic.wdf",地址=1187493750,名称="碎玉弄影"}
,[880]={前置=true,资源="magic.wdf",类型="女儿村",地址=1187493750,名称="碎玉弄影"}
,[884]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=0xd9463a0c,名称="状态_惊天动地"}
,[885]={前置=true,pyy=1,资源="magic.wdf",pyx=0,地址=1704285798,名称="惊天动地"}
,[886]={前置=true,资源="common/magic.wdf",类型="大唐官府",地址=432079569,名称="披挂上阵"}
,[887]={前置=true,资源="common/magic.wdf",类型="大唐官府",地址=3077923808,名称="百鬼噬魂"}
,[888]={前置=true,资源="common/magic.wdf",地址=0xFDE4BF24,名称="寡欲令"}
,[889]={前置=true,资源="common/magic.wdf",地址=0xE89A19DF,名称="状态_寡欲令"}
,[890]={前置=true,资源="common/magic.wdf",地址=2289147609,名称="无间地狱"}
,[891]={前置=true,资源="common/magic.wdf",地址=1934115845,名称="无间地狱2"}
,[892]={前置=true,资源="common/magic.wdf",地址=3077923808,名称="森罗迷瘴"}
,[893]={前置=true,资源="common/magic.wdf",地址=2676050255,名称="状态_森罗迷瘴"}
,[894]={前置=true,资源="common/magic.wdf",地址=2449616946,名称="葬玉焚花"}
,[895]={前置=true,资源="magic.wdf",类型="法宝",地址=1918324162,名称="召唤战旗"}  ----------佬伍修改（增加种族秘境时空之钥）


}

 
function 特效库(tx)
	local txs = {}
	for k,v in pairs(特效信息) do
		if 特效信息[k].名称==tx then
			if type(特效信息[k].地址) == "table" then
				txs[1]=特效信息[k].地址[1]
				txs[3]=特效信息[k].地址[2]
			else
				txs[1]=特效信息[k].地址
			end
			txs[2]=特效信息[k].资源
			txs[4]=特效信息[k].前置
			txs[5]=特效信息[k].pyx or 0
			txs[6]=特效信息[k].pyy or 0
			return txs
		end
	end
	if Texiaoku[tx] then
		txs[1]=Texiaoku[tx].txs_1
		txs[2]=Texiaoku[tx].txs_2
		txs[5]=0
		txs[6]=0
		txs[4]=false
	else
		txs[4]=false
		txs[1]= 0xFCD58523
		txs[2] = "wzife.wdf"
		txs[5]=0
		txs[6]=0
	end
	return txs
end

Texiaoku={}
Texiaoku["状态_真阳令旗" ]={
	txs_1 =0x8EE853A0
	,txs_2 ="xinui.wdf"
}
Texiaoku["真阳令旗" ]={--迭代
	txs_1 =0x593E3A9C
	,txs_2 ="lgg.wdf"
}
Texiaoku["赤炎战笛" ]={--迭代
	txs_1 =0xCFD0D35B
	,txs_2 ="lgg.wdf"
}
----------女儿
Texiaoku["满天花雨"]={
		txs_1 = 0xBF0C2C53
		,txs_2 ="lgg.wdf"
	}
----------化生
Texiaoku["推气过宫"]={---diedai
		txs_1 = 0x257571F5
		,txs_2 = "lgg.wdf"
	}
Texiaoku["唧唧歪歪"]={--迭代
		txs_1 = 0xc12c2663
		,txs_2 = "lgg.wdf"
	}
Texiaoku["新_唧唧歪歪"]={--迭代
		txs_1 = 0xf71deaf7
		,txs_2 = "lgg.wdf"
	}
	-----------地府
Texiaoku["阎罗令"]={--迭代
		txs_1 = 0x9EB11259
		,txs_2 = "lgg.wdf"
	}
	-----------地府
-------普陀
Texiaoku["靛沧海"]={---迭代
		txs_1 = 0x6C5F8376
		,txs_2 = "lgg.wdf"
	}
Texiaoku["巨岩破"]={---迭代
		txs_1 = 0x18E13BE9
		,txs_2 = "lgg.wdf"
	}
Texiaoku["苍茫树"]={--迭代
		txs_1 = 0x9CCB6E84
		,txs_2 = "lgg.wdf"
	}
Texiaoku["地裂火"]={--迭代
		txs_1 = 0x18E13BE9
		,txs_2 = "lgg.wdf"
	}
Texiaoku["日光华"]={
		txs_1 = 0x45CA9913
		,txs_2 = "lgg.wdf"
	}
-------普陀

Texiaoku["状态_泉愈"]={
		txs_1 = 216725786
		,txs_2 = "waddon.wdf"
	}
Texiaoku["状态_岚载"]={
		txs_1 = 216725786
		,txs_2 = "waddon.wdf"
	}

Texiaoku["飞砂走石"]={
	txs_1 = 0xA89DAFA7,
	txs_2 = "shape/tx"
}
Texiaoku["飞砂走石山"]={---迭代
		txs_1 = 0xb8de3e2d
		,txs_2 = "lgg.wdf"
	}
----魔王
Texiaoku["超级神蛇乙巳施法"]={
	txs_1 = 0xbf100009
	,txs_2 = "shape/tx"
}
Texiaoku["地狱烈火"]={
		txs_1 = 0xa0b00001
		,txs_2 = "common/magic.wdf"
	}
Texiaoku["水漫金山"]={
		txs_1 = 0xa0b00002
		,txs_2 = "common/magic.wdf"
	}
Texiaoku["泰山压顶"]={
		txs_1 = 0xa0b00003
		,txs_2 = "common/magic.wdf"
	}
Texiaoku["奔雷咒"]={
		txs_1 = 0x08BB2497
		,txs_2 = "common/magic.wdf"
	}
	
----------------------------------龙宫
Texiaoku["龙卷雨击"]={
		txs_1 = 0x4e23bee1
		,txs_2 = "common/magic.wdf"
	}
----------------------------------龙宫
----------------------------------天宫
Texiaoku["电刑"]={
		txs_1 = 0x51EEBFF3
		,txs_2 = "magic.wdf"
	}
Texiaoku["鸣雷诀"]={
		txs_1 = 3686610267
		,txs_2 = "magic.wdf"
	}
Texiaoku["状态_鸣雷诀"]={
		txs_1 = 0x67C338A5
		,txs_2 = "waddon.wdf"
	}
Texiaoku["掌心雷"]={
		txs_1 = 1740847269
		,txs_2 = "waddon.wdf"
	}
Texiaoku["状态_掌心雷"]={
		txs_1 = 1740847269
		,txs_2 = "waddon.wdf"
	}
Texiaoku["风雷斩·飞霆"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
Texiaoku["风雷斩"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
Texiaoku["风雷斩·霹雳"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
Texiaoku["天雷灌注"]={
		txs_1 = 0x79C39027
		,txs_2 = "zztx.wdf"
    }
Texiaoku["状态_天雷灌注"]={
		txs_1 = 0x79C39027
		,txs_2 = "zztx.wdf"
	}
Texiaoku["霹雳弦惊"]={
		txs_1 = 120282774
		,txs_2 = "zztx.wdf" --唯美
	}
Texiaoku["状态_霹雳弦惊"]={
		txs_1 = 120282774
		,txs_2 = "zztx.wdf" --唯美
	}
-------------------------天宫
Texiaoku["状态_幸运一击"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	--------------------------大唐
Texiaoku["法宝"]={
		txs_1 = 102263255
		,txs_2 = "waddon.wdf"
	}
Texiaoku["共生"]={
	txs_1 = 0xceaf91a
	,txs_2 = "common/magic.wdf"
}

Texiaoku["状态_五行珠1"]={
		txs_1 = 1595299390
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠2"]={
		txs_1 = 4187782846
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠3"]={
		txs_1 = 158224804
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠4"]={
		txs_1 = 1742019430
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠5"]={
		txs_1 = 2760108334
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠6"]={
		txs_1 = 3164645496
		,txs_2 = "waddon.wdf"
	}

Texiaoku["状态_战意1" ]={ -- 1层
		txs_1 = 0xc4fe8e3f
		,txs_2 ="common/magic.wdf"
	}
Texiaoku["状态_战意2" ]={ -- 2层
		txs_1 = 0x3d3c8d10
		,txs_2 ="common/magic.wdf"
	}
Texiaoku["状态_战意3" ]={ -- 3层-6层
		txs_1 = 0xd1c3b611
		,txs_2 ="common/magic.wdf"
	}
Texiaoku["状态_超级战意1" ]={ -- 1层
		txs_1 = 0xAABBCB01
		,txs_2 ="mgtx.wdf"

	}
Texiaoku["状态_超级战意2" ]={ -- 2层
		txs_1 = 0xAABBCB02
		,txs_2 ="mgtx.wdf"
	}
Texiaoku["状态_超级战意3" ]={ -- 3层-6层
		txs_1 = 0xAABBCB03
		,txs_2 ="mgtx.wdf"
	}
Texiaoku["状态_人参果1" ]={ -- 1层
		txs_1 = 0x3470E85A
		,txs_2 ="mgtx.wdf"
	}
Texiaoku["状态_人参果2" ]={ -- 2层
		txs_1 = 0x3470E85B
		,txs_2 ="mgtx.wdf"
	}
Texiaoku["状态_人参果3" ]={ -- 3层-6层
		txs_1 = 0x3470E85D
		,txs_2 ="mgtx.wdf"
}
Texiaoku["状态_骤雨1"]={
		txs_1 = 0xAABBCC01
		,txs_2 = "mgtx.wdf"
	}
Texiaoku["状态_骤雨2"]={
		txs_1 = 0xAABBCC02
		,txs_2 = "mgtx.wdf"
	}
Texiaoku["状态_骤雨3"]={
		txs_1 = 0xAABBCC03
		,txs_2 = "mgtx.wdf"
	}
Texiaoku["状态_龙魂"]={ --唯美的有
		txs_1 =1076770981
		,txs_2 ="zztx.wdf"
	}


	
Texiaoku["噬魔神壶成功"]={
        txs_1 = 0x1CB035D3
        ,txs_2 = "九黎城.wdf"
    }
    Texiaoku["噬魔神壶攻击"]={
        txs_1 = 0x2BAFA21E
        ,txs_2 = "九黎城.wdf"
    }
Texiaoku["状态_心源"]={
		txs_1 = 0x2ED4AF64
		,txs_2 = "common/magic.wdf"
	}
-- Texiaoku["枫魂汲魄"]={
-- 	txs_1 = 0x69e78198
-- 	,txs_2 = "common/magic.wdf"
-- }
Texiaoku["枫魂汲魄_我方"]={--迭代
        txs_1 =0x1E6A3A82
        ,txs_2 = "lgg.wdf"
    }
Texiaoku["枫魂汲魄_敌方"]={--迭代
        txs_1 =0x862C31E6
        ,txs_2 = "lgg.wdf"
    }

Texiaoku["炎魂"]={
	txs_1 = 0xababab20
	,txs_2 = "common/magic.wdf"
}
Texiaoku["状态_炎魂"]={
	txs_1 = 0x00000013
	,txs_2 = "common/magic.wdf"
}
Texiaoku["新_枫影二刃1"]={
	txs_1 = 0xAAA00002
	,txs_2 = "common/magic.wdf"
}
Texiaoku["新_枫影二刃2"]={
	txs_1 = 0xAAA00008
	,txs_2 = "common/magic.wdf"
}
Texiaoku["新_枫影二刃"]={
    txs_1 = 0xAAA00008
    ,txs_2 = "jjj.dll"
}
Texiaoku["枫影二刃"]={
    txs_1 = 0xFF000005
    ,txs_2 = "九黎新.wdf"
}
Texiaoku["枫影二刃1"]={
    txs_1 = 0xFF000005
    ,txs_2 = "九黎新.wdf"
}
Texiaoku["枫影二刃2"]={
    txs_1 = 0xFF000007
    ,txs_2 = "九黎新.wdf"
}

Texiaoku['新_力辟苍穹1']={
	txs_1 = 0xAAA00010
	,txs_2 = "common/magic.wdf"
}
Texiaoku['新_力辟苍穹2']={
	txs_1 = 0xAAA00001
	,txs_2 = "common/magic.wdf"
}
Texiaoku['新_力辟苍穹3']={
	txs_1 = 0xAAA00017
	,txs_2 = "common/magic.wdf"
}
Texiaoku['力辟苍穹1']={
    txs_1 = 0xFF000001
    ,txs_2 = "九黎新.wdf"
}
Texiaoku['力辟苍穹2']={
    txs_1 = 0xFF000003
    ,txs_2 = "九黎新.wdf"
}
Texiaoku['力辟苍穹3']={
    txs_1 = 0xFF000006
    ,txs_2 = "九黎新.wdf"
}
Texiaoku["力辟苍穹_落"]={
	txs_1 = 0xafaa0001
	,txs_2 = "common/magic.wdf"
}
Texiaoku["新_三荒尽灭"]={
	txs_1 = 0xAAA00009
	,txs_2 = "common/magic.wdf"
}
Texiaoku["三荒尽灭"]={
    txs_1 = 0xFF000011
    ,txs_2 = "九黎新.wdf"
}
Texiaoku["铁火双杨"]={
	txs_1 = 0xAAA00009
	,txs_2 = "common/magic.wdf"
}
Texiaoku["铁血生风"]={
    txs_1 = 0xFF000005
    ,txs_2 = "九黎新.wdf"
}

Texiaoku["新_铁血生风"]={
	txs_1 = 0xAAA00015
	,txs_2 = "common/magic.wdf"
}
Texiaoku["状态_怒哮"]={
	txs_1 = 0xababab26
	,txs_2 = "common/magic.wdf"
}
Texiaoku["新_一斧开天"]={
	txs_1 = 0xAAA00018
	,txs_2 = "common/magic.wdf"
}
Texiaoku["一斧开天"]={
	txs_1 = 0xFF000008
	,txs_2 = "common/magic.wdf"
}
Texiaoku["新_一斧开天成功"]={
        txs_1 = 0xAAA00009
        ,txs_2 = "jjj.dll"
    }
Texiaoku["一斧开天成功"]={
        txs_1 = 0xFF000011
        ,txs_2 = "xinui.wdf"
    }
Texiaoku["一斧开天失败"]={
	txs_1 = 00000012
	,txs_2 = "common/magic.wdf"

}
Texiaoku["浮空"]={
	txs_1 = 0xFF000009
	,txs_2 = "common/magic.wdf"
}
Texiaoku["新_浮空"]={
	txs_1 = 0xAAA00006
	,txs_2 = "common/magic.wdf"
}
---------------------------------锦衣技能
	Texiaoku["状态_手到擒来"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_半济而击"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_变化莫测"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_神谋魔道"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_言出法随"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_撼海狂龙"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_涤瑕蹈隙"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_八攻八克"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_避实击虚"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_力大无穷"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_自在逍遥"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_月明如昼"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_自我疗愈"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_兵贵神速"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_护体如磐"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_后发制人"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_苦思冥想"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_以牙还牙"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_洞察一切"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_坚如磐石"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_鹰击长空"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_除邪惩恶"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_妖魔鬼怪"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_鸿运当头"]={
		txs_1 = 0x2D3F560C
		,txs_2 = "common/magic.wdf"
	}
	---------------------------------锦衣技能

Texiaoku["超级赐福·元吉"]={
		txs_1 = 0xA1BA2780
		,txs_2 ="xinui.wdf"
	}
	Texiaoku["超级赐福·双喜"]={
		txs_1 = 0xC1CB2911
		,txs_2 ="xinui.wdf"
	}
	Texiaoku["超级赐福·三合"]={
		txs_1 = 0xB1CB2920
		,txs_2 ="xinui.wdf"
	}
	Texiaoku["超级赐福·四季"]={
		txs_1 = 0xA1BC2990
		,txs_2 ="xinui.wdf"
	}
	Texiaoku["超级赐福·五福"]={
		txs_1 = 0xC1DB2900
		,txs_2 ="xinui.wdf"
    }
    Texiaoku["超级赐福·六临"]={
		txs_1 = 0xC1DB2900
		,txs_2 ="xinui.wdf"
    }
    Texiaoku["超级赐福·七神"]={
		txs_1 = 0xC1DB2900
		,txs_2 ="xinui.wdf"
    }
    Texiaoku["超级赐福·八欲"]={
		txs_1 = 0xC1DB2900
		,txs_2 ="xinui.wdf"
    }
    Texiaoku["超级赐福·九功"]={
		txs_1 = 0xC1DB2900
		,txs_2 ="xinui.wdf"
    }
	 Texiaoku["超级赐福·十满"]={
		txs_1 = 0xC1DB2900
		,txs_2 ="xinui.wdf"
    }
    Texiaoku["超级赐福·万利"]={
		txs_1 = 0xC1DB2900
		,txs_2 ="xinui.wdf"
    }



---方寸
Texiaoku["状态_雷法·倒海"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
Texiaoku["状态_雷法·翻天"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
Texiaoku["状态_雷法·轰天"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
Texiaoku["状态_雷法·坤伏"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
Texiaoku["状态_雷法·震煞"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}

Texiaoku["雷法·震煞"]={    ---24F5813C
		txs_1 = 0x178C114C
		,txs_2 = "magic.wdf"
	}
Texiaoku["雷法·坤伏"]={    ---24F5813C
		txs_1 = 0x20D80D98
		,txs_2 = "magic.wdf"
	}
Texiaoku["雷法·崩裂"]={    ---24F5813C
		txs_1 = 0x95959595
		,txs_2 = "magic.wdf"
	}
Texiaoku["雷法·轰天"]={    ---24F5813C
		txs_1 = 0x95959595
		,txs_2 = "升星.wdf"
	}
Texiaoku["雷法·倒海"]={    ---24F5813C
		txs_1 = 0x3D74BE12
		,txs_2 = "magic.wdf"
	}
Texiaoku["五雷正法"]={    ---24F5813C
		txs_1 = 0x885ACBE1
		,txs_2 = "magic.wdf"
	}
Texiaoku["五雷咒"]={    ---24F5813C
		txs_1 = 0x387c1eeb
		,txs_2 = "magic.wdf"
	}
Texiaoku["状态_雷法·崩裂"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
Texiaoku["雷法·翻天"]={    ---24F5813C
		txs_1 = 0xAF2BA84E
		,txs_2 = "magic.wdf"
	}
Texiaoku["状态_符咒"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
Texiaoku["琴音三叠"]={    ---24F5813C
		txs_1 = 0xc817ff4b
		,txs_2 = "magic.wdf"
	}