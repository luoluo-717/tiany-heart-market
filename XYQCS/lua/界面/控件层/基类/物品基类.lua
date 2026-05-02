local 物品基类 = class("物品基类")
function 物品基类:初始化()
  self.变身资源 = {
    ["大海龟"] = 1014729192,
    ["大蝙蝠"] = 612491212,
    ["海毛虫"] = 1003533652,
    ["护卫"] = 1879306612,
    ["巨蛙"] = 2565027711,
    ["强盗"] = 3586283118,
    ["山贼"] = 1601390248,
    ["树怪"] = 1322633668,
    ["野猪"] = 4013589261,
    ["蛤蟆精"] = 2320700812,
    ["黑熊"] = 3570558474,
    ["狐狸精"] = 3692357273,
    ["花妖"] = 3532932172,
    ["老虎"] = 1178549915,
    ["羊头怪"] = 2400841514,
    ["骷髅怪"] = 3502123475,
    ["狼"] = 2461373478,
    ["牛妖"] = 989305258,
    ["虾兵"] = 3901848017,
    ["小龙女"] = 3764287062,
    ["蟹将"] = 1708909706,
    ["野鬼"] = 3104753175,
    ["龟丞相"] = 1742733422,
    ["黑熊精"] = 901631944,
    ["僵尸"] = 3350275782,
    ["马面"] = 3392285047,
    ["牛头"] = 110566689,
    ["蜘蛛精"] = 3535931709,
    ["白熊"] = 1888675829,
    ["古代瑞兽"] = 1999160242,
    ["黑山老妖"] = 2516437261,
    ["蝴蝶仙子"] = 2540271099,
    ["雷鸟人"] = 1315201859,
    ["地狱战神"] = 3053345056,
    ["风伯"] = 3744411701,
    ["天兵"] = 2595705183,
    ["天将"] = 2122760873,
    ["凤凰"] = 708925943,
    ["蛟龙"] = 3561237562,
    ["大力金刚"] = 1680374503,
    ["鬼将"] = 37398078,
    ["净瓶女娲"] = 2123998708,
    ["灵符女娲"] = 1462172548,
    ["灵鹤"] = 2901380535,
    ["律法女娲"] = 1322664706,
    ["如意仙子"] = 1092229319,
    ["噬天虎"] = 2378316974,
    ["雾中仙"] = 2827962478,
    ["吸血鬼"] = 2640290796,
    ["星灵仙子"] = 3525763588,
    ["巡游天神"] = 4248163555,
    ["炎魔神"] = 3113317524,
    ["夜罗刹"] = 2870935475,
    ["幽灵"] = 1653036033,
    ["芙蓉仙子"] = 3137075880,
    ["猫灵兽形"] = 2664942248,
    ["猫灵人形"] = 1283629726,
    ["狂豹兽形"] = 3523770813,
    ["狂豹人形"] = 1434045443,
    ["蝎子精"] = 129453697,
    ["混沌兽"] = 2752955542,
    ["长眉灵猴"] = 3194937054,
    ["巨力神猿"] = 2583351075,
    ["修罗傀儡鬼"] = 1295304252,
    ["修罗傀儡妖"] = 1581882750,
    ["金身罗汉"] = 2981531014,
    ["藤蔓妖花"] = 1539542949,
    ["曼珠沙华"] = 3926577754,
    ["蜃气妖"] = 2421106756,
    ["持国巡守"] = 1842568427,
    ["毗舍童子"] = 2055537949,
    ["真陀护法"] = 1518872974,
    ["灵灯侍者"] = 430207498,
    ["琴仙"] = 539634096,
    ["金饶僧"] = 2688340638,
    ["泪妖"] = 2720971822,
    ["镜妖"] = 2770049521,
    ["般若天女"] = 3223340062,
    ["增长巡守"] = 3436403729,
    ["变幻莫测"] = 3585454986,
    ["进阶黑山老妖"] = 2516437261,
    ["进阶蝴蝶仙子"] = 2540271099,
    ["进阶雷鸟人"] = 1315201859,
    ["进阶地狱战神"] = 3053345056,
    ["进阶风伯"] = 3744411701,
    ["进阶天兵"] = 2595705183,
    ["进阶天将"] = 2122760873,
    ["进阶凤凰"] = 708925943,
    ["进阶蛟龙"] = 3561237562,
    ["进阶大力金刚"] = 1680374503,
    ["进阶鬼将"] = 37398078,
    ["进阶净瓶女娲"] = 2123998708,
    ["进阶灵符女娲"] = 1462172548,
    ["进阶灵鹤"] = 2901380535,
    ["进阶律法女娲"] = 1322664706,
    ["进阶如意仙子"] = 1092229319,
    ["进阶噬天虎"] = 2378316974,
    ["进阶雾中仙"] = 2827962478,
    ["进阶吸血鬼"] = 2640290796,
    ["进阶星灵仙子"] = 3525763588,
    ["进阶巡游天神"] = 4248163555,
    ["进阶炎魔神"] = 3113317524,
    ["进阶夜罗刹"] = 2870935475,
    ["进阶幽灵"] = 1653036033,
    ["进阶芙蓉仙子"] = 3137075880,
    ["进阶猫灵兽形"] = 2664942248,
    ["进阶猫灵人形"] = 1283629726,
    ["进阶狂豹兽形"] = 3523770813,
    ["进阶狂豹人形"] = 1434045443,
    ["进阶蝎子精"] = 129453697,
    ["进阶混沌兽"] = 2752955542,
    ["进阶长眉灵猴"] = 3194937054,
    ["进阶巨力神猿"] = 2583351075,
    ["进阶修罗傀儡鬼"] = 1295304252,
    ["进阶修罗傀儡妖"] = 1581882750,
    ["进阶金身罗汉"] = 2981531014,
    ["进阶藤蔓妖花"] = 1539542949,
    ["进阶曼珠沙华"] = 3926577754,
    ["进阶蜃气妖"] = 2421106756,
    ["进阶持国巡守"] = 1842568427,
    ["进阶毗舍童子"] = 2055537949,
    ["进阶真陀护法"] = 1518872974,
    ["进阶灵灯侍者"] = 659687891,
    ["进阶琴仙"] = 539634096,
    ["进阶金饶僧"] = 2821037429,
    ["进阶泪妖"] = 2720971822,
    ["进阶镜妖"] = 173301367,
    ["进阶般若天女"] = 4163515805,
    ["进阶增长巡守"] = 3436403729,
    ["进阶变幻莫测"] = 3585454986
  }
  self.变身资源小 = {
    ["灵灯侍者"] = 1918635276,
    ["琴仙"] = 3903044949,
    ["金饶僧"] = 2997230479,
    ["泪妖"] = 1481939282,
    ["镜妖"] = 3065018168,
    ["般若天女"] = 4184269078,
    ["增长巡守"] = 2465305568,
    ["变幻莫测"] = 441456792,
    ["进阶灵灯侍者"] = 1553070147,
    ["进阶琴仙"] = 3382000198,
    ["进阶金饶僧"] = 2047520747,
    ["进阶泪妖"] = 1658430392,
    ["进阶镜妖"] = 661111819,
    ["进阶般若天女"] = 1508120477,
    ["进阶增长巡守"] = 2170814517,
    ["进阶变幻莫测"] = 441456792
  }
  self.五行_ = {
    "金",
    "木",
    "水",
    "火",
    "土"
  }
end
local function __变身卡(模型)
	if 模型 == "大海龟" then
		return "大海龟","item.wdf",0x4A028BEE,0x3C7B89E8,nil,nil,20,1,3
	elseif 模型 == "巨蛙" then
		return "巨蛙","item.wdf",0x4A028BEE,0x98E3377F,nil,nil,20,1,3
	elseif 模型 == "海星" then
		return "海星","item.wdf",1241680878,3876179373,nil,nil,20,1,3,"item.wdf"
	elseif 模型 == "章鱼" then
		return "章鱼","item.wdf",1241680878,2880866697,nil,nil,20,1,3,"item.wdf"
	elseif 模型 == "浣熊" then
		return "浣熊","item.wdf",1241680878,2785980633,nil,nil,20,1,3,"item.wdf"
	elseif 模型 == "大蝙蝠" then
		return "大蝙蝠","item.wdf",1241680878,0x2481DFCC,nil,nil,20,1,3
	elseif 模型 == "赌徒" then
		return "赌徒","item.wdf",1241680878,0x6BE81A68,nil,nil,20,1,3
	elseif 模型 == "海毛虫" then
		return "海毛虫","item.wdf",1241680878,0x3BD0B554,nil,nil,20,1,3
	elseif 模型 == "护卫" then
		return "护卫","item.wdf",1241680878,0x7003F174,nil,nil,20,1,3
	elseif 模型 == "强盗" then
		return "强盗","item.wdf",1241680878,0xD5C2566E,nil,nil,20,1,3
	elseif 模型 == "山贼" then
		return "山贼","item.wdf",1241680878,0x5F7346A8,nil,nil,20,1,3
	elseif 模型 == "树怪" then
		return "树怪","item.wdf",1241680878,0x4ED5C9C4,nil,nil,20,1,3
	elseif 模型 == "野猪" then
		return "野猪","item.wdf",1241680878,0xEF3A830D,nil,nil,20,1,3
	end
end
function 物品基类:取重复名物品()
  if self.物品.名称 == "七彩礼盒" and 121 == self.物品.总类 then
    if 1 == self.物品.子类 then
      self.物品.小模型资源 = 1750312685
      self.物品.大模型资源 = 2953344867
      self.物品.资源 = "item.wdf"
    elseif 2 == self.物品.子类 then
      self.物品.小模型资源 = 2635597099
      self.物品.大模型资源 = 19640093
      self.物品.资源 = "item.wdf"
    elseif 3 == self.物品.子类 then
      self.物品.小模型资源 = 959572106
      self.物品.大模型资源 = 4133429663
      self.物品.资源 = "item.wdf"
    elseif 4 == self.物品.子类 then
      self.物品.小模型资源 = 1603392130
      self.物品.大模型资源 = 3301638632
      self.物品.资源 = "item.wdf"
    elseif 5 == self.物品.子类 then
      self.物品.小模型资源 = 383029506
      self.物品.大模型资源 = 1270624199
      self.物品.资源 = "item.wdf"
    elseif 6 == self.物品.子类 then
      self.物品.小模型资源 = 1299035500
      self.物品.大模型资源 = 2244217285
      self.物品.资源 = "item.wdf"
    elseif 7 == self.物品.子类 then
      self.物品.小模型资源 = 4238056341
      self.物品.大模型资源 = 3552236507
      self.物品.资源 = "item.wdf"
    elseif 8 == self.物品.子类 then
      self.物品.小模型资源 = 2621789207
      self.物品.大模型资源 = 615133736
      self.物品.资源 = "item.wdf"
    elseif 9 == self.物品.子类 then
      self.物品.小模型资源 = 856900047
      self.物品.大模型资源 = 2499796481
      self.物品.资源 = "item.wdf"
    end
  elseif self.物品.名称 == "新春导标旗" and 11 == self.物品.总类 then
    if 1 == self.物品.子类 then
      self.物品.小模型资源 = 1012243771
      self.物品.大模型资源 = 462489476
      self.物品.资源 = "common/item.wdf"
    elseif 2 == self.物品.子类 then
      self.物品.小模型资源 = 1070398321
      self.物品.大模型资源 = 128061229
      self.物品.资源 = "common/item.wdf"
    elseif 3 == self.物品.子类 then
      self.物品.小模型资源 = 3025260918
      self.物品.大模型资源 = 748010811
      self.物品.资源 = "common/item.wdf"
    elseif 4 == self.物品.子类 then
      self.物品.小模型资源 = 1327542465
      self.物品.大模型资源 = 2270617810
      self.物品.资源 = "common/item.wdf"
    end
  elseif self.物品.名称 == "精魄灵石" and 5 == self.物品.总类 then
    if 1 == self.物品.子类 then
      self.物品.小模型资源 = 4237411335
      self.物品.大模型资源 = 1670874479
      self.物品.资源 = "item.wdf"
    elseif 2 == self.物品.子类 then
      self.物品.小模型资源 = 4237411335
      self.物品.大模型资源 = 1670874479
      self.物品.资源 = "item.wdf"
    elseif 3 == self.物品.子类 then
      self.物品.小模型资源 = 2600896674
      self.物品.大模型资源 = 2896990907
      self.物品.资源 = "item.wdf"
    elseif 4 == self.物品.子类 then
      self.物品.小模型资源 = 2600896674
      self.物品.大模型资源 = 2896990907
      self.物品.资源 = "item.wdf"
    elseif 5 == self.物品.子类 then
      self.物品.小模型资源 = 1004579182
      self.物品.大模型资源 = 1218247800
      self.物品.资源 = "item.wdf"
    elseif 6 == self.物品.子类 then
      self.物品.小模型资源 = 1004579182
      self.物品.大模型资源 = 1218247800
      self.物品.资源 = "item.wdf"
    end
  end
end
function 物品基类:取数据(data)
  self:置对象(data.名称)
  for n, v in pairs(data) do
    self.物品[n] = v
  end
  if data.名称 == "怪物卡片" then
    if 1 == data.等级 then
      self.物品.小模型资源 = 1241680878
    elseif 2 == data.等级 then
      self.物品.小模型资源 = 3140870638
    elseif 3 == data.等级 then
      self.物品.小模型资源 = 3892077778
    elseif 4 == data.等级 then
      self.物品.小模型资源 = 2684829942
    elseif 5 == data.等级 then
      self.物品.小模型资源 = 562268034
    elseif 6 == data.等级 then
      self.物品.小模型资源 = 4056436405
    elseif 7 == data.等级 then
      self.物品.小模型资源 = 4020550188
    elseif 8 == data.等级 then
      self.物品.小模型资源 = 771949169
    elseif 9 == data.等级 then
      self.物品.小模型资源 = 1991581967
    end
    self.物品.大模型资源 = self.变身资源[data.造型]
  end
  if data.价格 then
    self.物品.价格 = data.价格
  end
  self:取重复名物品(self.物品)
end
function 物品基类:置禁止(zl, fl)
  if self.物品 then
    if type(zl) == "table" then
      for i,v in pairs(zl) do
        if v == self.物品.名称 then
          self.物品禁止 = false
          return true
        end
      end
      self.物品禁止 = true
    elseif zl=="法宝合成" then
      if self.物品.名称 == "天蚕丝" or self.物品.名称 == "古龙筋" or self.物品.名称 == "内丹" or self.物品.名称 == "玄龟板" or self.物品.名称 == "金凤羽" or self.物品.名称 == "麒麟血" or self.物品.名称 == "补天石" or self.物品.名称 == "千年阴沉木" or self.物品.名称 == "九眼天珠" or self.物品.总类==1000  then
        self.物品禁止 = false
        return true
      end
      self.物品禁止 = true
    elseif self.物品.总类 == zl then
      if fl then
        if self.物品.分类 == fl then
          self.物品禁止 = false
        else
          self.物品禁止 = true
        end
      else
        self.物品禁止 = false
      end
    else
      self.物品禁止 = true
    end
  end
end
function 物品基类:置总类禁止(data)
  for i, v in ipairs(data) do
    if self.物品 and self.物品.总类 ~= v then
      self.物品禁止 = true
    else
      self.物品禁止 = false
      break
    end
  end
end
function 物品基类:置分类禁止(data)
  if not self.物品禁止 then
    for i, v in ipairs(data) do
      if self.物品 and self.物品.分类 ~= v then
        self.物品禁止 = true
      else
        self.物品禁止 = false
        break
      end
    end
  end
end
function 物品基类:置等级禁止(data, lx)
  if not self.物品禁止 and "小" == lx then
    if self.物品 and data > self.物品.等级 then
      self.物品禁止 = true
    end
  end
end
function 物品基类:置对象(名称, 打造, 总类, 根, 允许)
  self.物品 = {}
  local 道具
  local c = false
  if type(名称) == "table" then
    self.物品.临时道具 = 取物品(名称)
    self.物品.介绍 = 道具[1]
    self.物品.总类 = 道具[2]
    self.物品.分类 = 道具[3]
    self.物品.子类 = 道具[4]
    道具 = 名称
    self.物品.名称 = 道具.名称
    c = true
    self.物品.介绍 = 道具.介绍
    self.物品.总类 = 道具.总类
    self.物品.分类 = 道具.分类
    self.物品.子类 = 道具.子类
    if 2 == 道具.总类 then
      self.物品.等级 = 道具.等级
      self.物品.角色限制 = 道具.角色限制
      self.物品.性别限制 = 道具.性别限制
      self.物品.等级 = 道具.等级
    end
    if 道具.阶品 ~= nil then
      self.物品.阶品 = 道具.阶品
    end
    if nil ~= 道具.价格 then
      self.物品.价格 = 道具.价格
    end
    if nil ~= 道具.气血 then
      self.物品.气血 = 道具.气血
    end
    if nil ~= 道具.魔法 then
      self.物品.魔法 = 道具.魔法
    end
  else
    道具 = 取物品(名称)
    self.物品.介绍 = 道具[1]
    self.物品.总类 = 道具[2]
    self.物品.分类 = 道具[3]
    self.物品.子类 = 道具[4]
    self.物品.名称 = 名称
    if 2 == 道具[2] then
      self.物品.等级 = 0
      if nil ~= 道具[7] then
        self.物品.角色限制 = 道具[7]
      end
      if nil ~= 道具[6] then
        self.物品.性别限制 = 道具[6]
      end
      if nil ~= 道具[5] then
        self.物品.等级 = 道具[5]
      end
    end
    if 10 == 道具[3] and 2 == 道具[4] then
      self.物品.阶品 = 道具[8]
    end
    if 1 == 道具[2] then
      self.物品.阶品 = 道具[8]
    end
    if nil ~= 道具[14] then
      self.物品.价格 = 道具[14]
    end
    if nil ~= 道具[9] then
      self.物品.气血 = 道具[9]
    end
    if nil ~= 道具[10] then
      self.物品.魔法 = 道具[10]
    end
  end
  self.物品.资源 = 道具[11]
  self.物品.小模型资源 = 道具[12]
  self.物品.大模型资源 = 道具[13]
  if 2 == self.物品.总类 and nil == 允许 then
    if self.物品.等级 == nil then
      self.物品.等级 = 0
    end
    local lv = self.物品.等级
    if 3 == self.物品.分类 then
      self.物品.伤害 = math.ceil(lv / 10 * 30 + 10)
      self.物品.命中 = math.ceil(lv / 10 * 35 + 10 + 2)
    elseif 4 == self.物品.分类 then
      self.物品.防御 = math.ceil(lv / 10 * 15 + 10)
    elseif 1 == self.物品.分类 then
      self.物品.防御 = math.ceil(lv / 10 * 5 + 5)
      self.物品.魔法 = math.ceil(lv / 10 * 10 + 5 + 2)
    elseif 5 == self.物品.分类 then
      self.物品.防御 = math.ceil(lv / 10 * 5 + 5)
      self.物品.气血 = math.ceil(lv / 10 * 20 + 10)
    elseif 2 == self.物品.分类 then
      self.物品.灵力 = math.ceil(lv / 10 * 12 + 5)
    elseif 6 == self.物品.分类 then
      self.物品.防御 = math.ceil(lv / 10 * 5 + 5)
      self.物品.敏捷 = math.ceil(lv / 10 * 3 + 5)
    elseif 10 == self.物品.分类 then
      self.物品.气血 = math.ceil(lv / 5 * 15 + 20)
    elseif 11 == self.物品.分类 then
      self.物品.魔法 = math.ceil(lv / 5 * 5 + 40)
    elseif 12 == self.物品.分类 then
      self.物品.伤害 = math.ceil(lv / 5 * 20 + 20)
    elseif 13 == self.物品.分类 then
      self.物品.防御 = math.ceil(lv / 5 * 3 + 10)
    elseif 14 == self.物品.分类 then
      self.物品.敏捷 = math.ceil(lv / 5 * 2 + 10)
    end
    -- if 7 == self.物品.分类 then
    --   self.物品.伤害 = math.ceil(lv / 10 * 2 + 5)
    --   self.物品.命中 = math.ceil(lv / 10 * 2 + 5 + 2)
    -- elseif 8 == self.物品.分类 then
    --   self.物品.速度 = math.ceil(lv / 10 * 1 + 5)
    --   self.物品.伤害 = math.ceil(lv / 10 * 2 + 5)
    -- elseif 9 == self.物品.分类 then
    --   self.物品.防御 = math.ceil(lv / 10 * 2 + 5)
    --   self.物品.伤害 = math.ceil(lv / 10 * 2 + 5)
    -- end
    self.物品.鉴定 = true
    self.物品.五行 = self.五行_[math.random(1, 5)]
    if 3 == self.物品.分类 then
      if self.物品.等级 >= 0 and self.物品.等级 < 10 then
        self.物品.价格 = 500
      elseif self.物品.等级 >= 10 and self.物品.等级 < 20 then
        self.物品.价格 = 3000
      elseif self.物品.等级 >= 20 and self.物品.等级 < 30 then
        self.物品.价格 = 6000
      elseif self.物品.等级 >= 30 and self.物品.等级 < 40 then
        self.物品.价格 = 10000
      else
        self.物品.价格 = math.floor(self.物品.等级 * 3500 / 5)
      end
    elseif self.物品.等级 >= 0 and self.物品.等级 < 10 then
      self.物品.价格 = 500
    elseif self.物品.等级 >= 10 and self.物品.等级 < 20 then
      self.物品.价格 = 1000
    elseif self.物品.等级 >= 20 and self.物品.等级 < 30 then
      self.物品.价格 = 2500
    elseif self.物品.等级 >= 30 and self.物品.等级 < 40 then
      self.物品.价格 = 5000
    else
      self.物品.价格 = math.floor(self.物品.等级 * 2500 / 5)
    end
    self.物品.开运孔数 = {
      ["当前"] = 0,
      ["上限"] = 0
    }
    if self.物品.等级 <= 40 then
      self.物品.开运孔数 = {
        ["当前"] = 0,
        ["上限"] = 2
      }
    elseif self.物品.等级 > 40 and self.物品.等级 <= 80 then
      self.物品.开运孔数 = {
        ["当前"] = 0,
        ["上限"] = 3
      }
    elseif self.物品.等级 > 40 and self.物品.等级 <= 80 then
      self.物品.开运孔数 = {
        ["当前"] = 0,
        ["上限"] = 3
      }
    elseif self.物品["等级"] > 80 and self.物品["等级"] <= 120 then
      self.物品["开运孔数"] = {
        ["当前"] = 0,
        ["上限"] = 4
      }
    elseif self.物品.等级 > 120 and self.物品.等级 <= 160 then
      self.物品.开运孔数 = {
        ["当前"] = 0,
        ["上限"] = 5
      }
    elseif self.物品.等级 > 160 and self.物品.等级 <= 180 then
      self.物品.开运孔数 = {
        ["当前"] = 0,
        ["上限"] = 6
      }
    end
    self.物品.符石 = {}
    self.物品.星位 = {}
    self.物品.符石组合 = {
      ["符石组合"] = {},
      ["门派条件"] = {},
      ["部位条件"] = {},
      ["效果说明"] = {}
    }
    self.物品.熔炼效果 = {}
  elseif 3 == self.物品.总类 then
    if 1 == self.物品.分类 then
      self.物品.附带技能 = 打造
    elseif self.物品.分类 == 12 then
      self.物品.可叠加 = true
    end
  elseif 1 == self.物品.总类 then
    if 3 ~= self.物品.阶品 then
      self.物品.可叠加 = true
    else
      self.物品.可叠加 = false
    end
  elseif 4 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 5 == self.物品.总类 then
    self.物品.子类 = 打造
    if nil ~= 总类 then
      self.物品.特效 = 总类
    end
    self.物品.可叠加 = false
    if 4 == self.物品.分类 then
      self.物品.子类 = 道具[4]
      self.物品.特效 = 道具[5]
      self.物品.可叠加 = true
    elseif 6 == self.物品.分类 then
      self.物品.子类 = 道具[4]
      self.物品.角色限制 = 道具[8]
      self.物品.等级 = 打造 or 1
      self.物品.特效 = 道具[9]
      if nil ~= 道具[5] then
        self.物品.等级 = 道具[5]
      end
    elseif 7 == self.物品.分类 then
      self.物品.等级 = 1
    end
  elseif 6 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 7 == self.物品.总类 then
    if 2 == self.物品.分类 then
      self.物品.可叠加 = true
    else
      self.物品.可叠加 = false
    end
  elseif 9 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 10 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 11 == self.物品.总类 then
    self.物品.可叠加 = false
  elseif 12 == self.物品.总类 then
    self.物品.子类 = 打造
    self.物品.可叠加 = false
  elseif 13 == self.物品.总类 then
    self.物品.子类 = 打造
    self.物品.可叠加 = false
  elseif 55 == self.物品.总类 then
    self.物品.等级 = 道具[16]
    if "体质" == 道具[18] then
      self.物品.体质 = 道具[19]
    elseif "耐力" == 道具[18] then
      self.物品.耐力 = 道具[19]
    elseif "敏捷" == 道具[18] then
      self.物品.敏捷 = 道具[19]
    elseif "法术防御" == 道具[18] then
      self.物品.法术防御 = 道具[19]
    elseif "魔力" == 道具[18] then
      self.物品.魔力 = 道具[19]
    elseif "力量" == 道具[18] then
      self.物品.力量 = 道具[19]
    elseif "法术伤害" == 道具[18] then
      self.物品.法术伤害 = 道具[19]
    elseif "气血" == 道具[18] then
      self.物品.气血 = 道具[19]
    elseif "防御" == 道具[18] then
      self.物品.防御 = 道具[19]
    elseif "命中" == 道具[18] then
      self.物品.命中 = 道具[19]
    elseif "伤害" == 道具[18] then
      self.物品.伤害 = 道具[19]
    elseif "灵力" == 道具[18] then
      self.物品.灵力 = 道具[19]
    elseif "魔法" == 道具[18] then
      self.物品.魔法 = 道具[19]
    elseif "速度" == 道具[18] then
      self.物品.速度 = 道具[19]
    elseif "躲避" == 道具[18] then
      self.物品.躲避 = 道具[19]
    elseif "固定伤害" == 道具[18] then
      self.物品.固定伤害 = 道具[19]
    end
    if nil ~= 道具[21] then
      if "体质" == 道具[21] then
        self.物品.体质 = 道具[22]
      elseif "耐力" == 道具[21] then
        self.物品.耐力 = 道具[22]
      elseif "敏捷" == 道具[21] then
        self.物品.敏捷 = 道具[22]
      elseif "法术防御" == 道具[21] then
        self.物品.法术防御 = 道具[22]
      elseif "魔力" == 道具[21] then
        self.物品.魔力 = 道具[22]
      elseif "力量" == 道具[21] then
        self.物品.力量 = 道具[22]
      elseif "法术伤害" == 道具[21] then
        self.物品.法术伤害 = 道具[22]
      elseif "气血" == 道具[21] then
        self.物品.气血 = 道具[22]
      elseif "防御" == 道具[21] then
        self.物品.防御 = 道具[22]
      elseif "命中" == 道具[21] then
        self.物品.命中 = 道具[22]
      elseif "伤害" == 道具[21] then
        self.物品.伤害 = 道具[22]
      elseif "灵力" == 道具[21] then
        self.物品.灵力 = 道具[22]
      elseif "魔法" == 道具[21] then
        self.物品.魔法 = 道具[22]
      elseif "速度" == 道具[21] then
        self.物品.速度 = 道具[22]
      elseif "躲避" == 道具[21] then
        self.物品.躲避 = 道具[22]
      elseif "固定伤害" == 道具[21] then
        self.物品.固定伤害 = 道具[22]
      end
    end
    self.物品.耐久度 = 道具[17]
    self.物品.特效 = 道具[20]
  elseif 100 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 103 == self.物品.总类 then
  elseif 102 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 105 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 107 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif 109 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif self.物品.总类 == 151 then
    if 1 == self.物品.分类 or 2 == self.物品.分类 or 3 == self.物品.分类 or 7 == self.物品.分类 or 11 == self.物品.分类 or 12 == self.物品.分类 or 13 == self.物品.分类 or 17 == self.物品.分类 or 18 == self.物品.分类 or 19 == self.物品.分类 then
      self.物品.可叠加 = true
    end
  elseif self.物品.总类 == 200 then
    self.物品.价格 = 5000
  elseif self.物品.总类 == 207 then
    self.物品.可叠加 = true
  elseif 20 == self.物品.总类 or 25 == self.物品.总类 or 8 == self.物品.总类 then
    self.物品.可叠加 = true
  elseif self.物品.总类 == 1000 then
    self.五行_ = {
      "金",
      "木",
      "水",
      "火",
      "土"
    }
    self.物品.使用 = 道具[5]
    self.物品.特技 = 道具[6]
    self.物品.气血 = 0
    self.物品.魔法 = 道具[3] * 50
    self.物品.角色限制 = 道具[7] or 0
    self.物品.五行 = self.五行_[math.random(1, 5)]
    self.物品.伤害 = 道具[8] or 0
  elseif self.物品.总类 == 1002 then
    self.物品.使用 = 道具[5]
    self.物品.特技 = 道具[6]
    self.物品.效果 = 道具[15]
    self.物品.魔法 = 道具[3] * 50
    self.物品.气血 = 0
  elseif 21 == self.物品.总类 then
    self.物品.特效 = 道具[8]
    if 3 == self.物品.分类 then
      self.物品.可叠加 = false
    else
      self.物品.可叠加 = true
    end
  elseif 30 == self.物品.总类 then
    self.物品.角色限制, self.物品.资源, self.物品.小模型资源, self.物品.大模型资源, self.物品.特技, self.物品.特效, self.物品.魔法, self.物品.气血, self.物品.伤害, self.物品.小模型id = __变身卡(打造)
  end
end
return 物品基类
