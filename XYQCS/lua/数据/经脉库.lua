		--======================================================================--
--差不多先生 
取经脉=function(lp,jn)
	local jns = {}
	if lp == "浴血豪侠" then
		if jn == "目空" then
		jns[1] = "使用特技、翩鸿—击、后发制人时，忽略目标10%防御."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x72ED61A1
		jns[8] = 0x72ED61A1
		elseif jn == "风刃" then
		jns[1] = "普通攻击时可以对基他随机3个单位造成(等级×3)的伤害；\n主动使用杀气诀后，必定获得“风魂”；主动使用横扫千军或破釜沉舟后，有50%几率获得“风魂”；风魂：下一个风刃伤害增加1000点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF97A7093
		jns[8] = 0xF97A7093
		elseif jn == "扶阵" then
		jns[1] = "队伍每个人的阵法加成基础效果增加3%。(不可叠加)与NPC战斗时携带溅射符石，横扫千军额外对3个单位造成溅射伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD5131E6F
		jns[8] = 0xD5131E6F
		elseif jn == "翩鸿" then
		jns[1] = "翩鸿—击伤害提高35%，且随机驱散目标—个增益状态。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x30E001D4
		jns[8] = 0x30E001D4
		elseif jn == "勇武" then
		jns[1] = "你的后发制人获得下列额外效果：\n1）伤害结果增加(目标防御值×40%) ；\n2)不再消耗气血，而是回复（气血上限×15%)点气血(不超过等级×8) ；\n3）使用后回复10点愤怒；\n4)攻击后使得目标受到来自你的伤害提高10%，持续到目标倒地。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
		elseif jn == "长驱直入" then
		jns[1] = "使用该技能攻击时，目标无法被保护。伤害结果为普通攻击的110%；同时60%几率对目标附加“重创”状态：回复效果降低30%并且受到施法者的伤害增加10%。法术驱动的物理攻击，持续2回合。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB6EA7B4
		jns[8] = 0xAB6EA7B4
		jns[12] = "6回合"
		elseif jn == "杀意" then
		jns[1] = "触发物理暴击时，伤害倍率增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBB962DBE
		jns[8] = 0xBB962DBE
		elseif jn == "念心" then
		jns[1] = "攻击目标为玩家且目标召唤兽未在场时，暴击几率增加12%。(鬼魂倒地视为未在场)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB64E8CF
		jns[8] = 0xAB64E8CF
		elseif jn == "静岳" then
		jns[1] = "带有护盾时，暴击几率提高4%。回合结束时，若不带有护盾，则获得（等级×1)点护盾。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB363459E
		jns[8] = 0xB363459E
		elseif jn == "干将" then
		jns[1] = "干将莫邪效果提高30%，冷却回合数减少2，但不再提供抗封效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x01C779BC
		jns[8] = 0x01C779BC
		elseif jn == "勇念" then
		jns[1] = "使用横扫千军时，忽略目标10%防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2EF39CEC
		jns[8] = 0x2EF39CEC
		elseif jn == "神凝" then
		jns[1] = "干将莫邪额外增加300抵抗封印等级，并且取消横扫千军、破釜沉舟的气血消耗和气血需求，但冷却回合数增加2。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9640C6B0
		jns[8] = 0x9640C6B0
		elseif jn == "狂狷" then
		jns[1] = "伤害力增加(力量属性/耐力属性)×16。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAFA63BA0
		jns[8] = 0xAFA63BA0
		elseif jn == "不惊" then
		jns[1] = "武器未锻造太阳石、红玛瑙以外的宝石时，你额外忽略目标(宝石锻数×0.5-3)%的防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8F6C13D3
		jns[8] = 0x8F6C13D3
		elseif jn == "傲视" then
		jns[1] = "击倒玩家单位后，你造成的物理伤害提高12%，持续6回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB6C48838
		jns[8] = 0xB6C48838
		elseif jn == "破空" then
		jns[1] = "攻击被保护时，被保护者所受伤害提高15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0821ADC7
		jns[8] = 0x0821ADC7
		elseif jn == "历战" then
		jns[1] = "使用断穹巨剑后，每点消耗的灵元会使本场战斗你的破签沉舟额外攻击1个单位。(最多额外攻击4个目标)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x438B3BD1
		jns[8] = 0x438B3BD1
		elseif jn == "安神" then
		jns[1] = "安神诀使你受到的法术伤害额外降低50%"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 3150617611
		jns[8] = 2204689180
		elseif jn == "无敌" then
		jns[1] = "横扫千军变为4次攻击，分别使用75%、 85%、95%、105%的伤害力进行攻击。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4640D75C
		jns[8] = 0x4640D75C
		elseif jn == "额外能力"  then
		jns[1] = "增加40点伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "浴血豪侠" then
		jns[1] = "增加40点伤害，获得浴血豪侠称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "无双战神" then
		if jn == "目空" then
		jns[1] = "使用特技、翩鸿一击、后发制人时，忽略目标10%防御."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x72ED61A1
		jns[8] = 0x72ED61A1
		elseif jn == "勇进" then
		jns[1] = "与玩家战斗时，第—次使用横扫千军必定触发连破；与NPC战斗时，前两次横扫千军必定触发连破。"
		jns[10]="jpg"

		elseif jn == "突刺" then --无图标
		jns[1] = "当前气血≥90%时，你的横扫千军造成的伤害提高5%。"
		jns[10]="jpg"

		elseif jn == "翩鸿" then
		jns[1] = "翩鸿—击伤害提高35%，且随机驱散目标—个增益状态。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x30E001D4
		jns[8] = 0x30E001D4
		elseif jn == "勇武" then
		jns[1] = "你的后发制人获得下列额外效果：\n1）伤害结果增加(目标防御值×40%) ；\n2)不再消耗气血，而是回复（气血上限×15%)点气血(不超过等级×8) ；\n3）使用后回复10点愤怒；\n4)攻击后使得目标受到来自你的伤害提高10%，持续到目标倒地。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
		elseif jn == "长驱直入" then
		jns[1] = "使用该技能攻击时，目标无法被保护。伤害结果为普通攻击的110%；同时60%几率对目标附加“重创”状态：回复效果降低30%并且受到施法者的伤害增加10%。法术驱动的物理攻击，持续2回合。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB6EA7B4
		jns[8] = 0xAB6EA7B4
		jns[12] = "6回合"
		elseif jn == "亢强" then --无图标
		jns[1] = "使用特技后，每点原始愤怒消耗使你下个横扫千军触发连破的几率增加0.2%。"
		jns[10]="jpg"

		elseif jn == "念心" then
		jns[1] = "攻击目标为玩家且目标召唤兽未在场时，暴击几率增加12%。(鬼魂倒地视为未在场)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB64E8CF
		jns[8] = 0xAB64E8CF
		elseif jn == "静岳" then
		jns[1] = "带有护盾时，暴击几率提高4%。回合结束时，若不带有护盾，则获得（等级×1)点护盾。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB363459E
		jns[8] = 0xB363459E
		elseif jn == "干将" then
		jns[1] = "干将莫邪效果提高30%，冷却回合数减少2，但不再提供抗封效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x01C779BC
		jns[8] = 0x01C779BC
		elseif jn == "勇念" then
		jns[1] = "使用横扫千军时，忽略目标10%防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2EF39CEC
		jns[8] = 0x2EF39CEC
		elseif jn == "神凝" then
		jns[1] = "干将莫邪额外增加300抵抗封印等级，并且取消横扫千军、破釜沉舟的气血消耗和气血需求，但冷却回合数增加2。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9640C6B0
		jns[8] = 0x9640C6B0
		elseif jn == "惊天动地" then
		jns[1] = "【主动】程咬金在“烽火连城”—役绝境之中使用的克敌之技，为了防止狐祖再次入侵长安暂时传授给大唐弟子。"
		jns[10]="jpg"

		elseif jn == "不惊" then
		jns[1] = "武器未锻造太阳石、红玛瑙以外的宝石时，你额外忽略目标(宝石锻数×0.5-3)%的防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8F6C13D3
		jns[8] = 0x8F6C13D3
		elseif jn == "突进" then
		jns[1] = "每次造成物理伤害后，你的伤害力增加2点，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA839BBD0
		jns[8] = 0xA839BBD0
		elseif jn == "破势" then
		jns[1] = "每消耗1点灵元，你触发连破的几率增加5%，持续到战斗结束。"
		jns[10]="jpg"

		elseif jn == "孤勇" then
		jns[1] = "队伍中只有—个大唐官府弟子时:主动使用横扫千军击倒召唤兽或召唤物时，你触发连破的几率增加25%。"
		jns[10]="jpg"

		elseif jn == "熟练" then
		jns[1] = "队伍中只有一个大唐官府弟子时:你触发连破的几率增加17%."
		jns[10]="jpg"

		elseif jn == "破军" then
		jns[1] = "使用横扫千军后，获得—层“剑意”，根据“剑意”层数获得下述效果:\n2层及以上:攻击被保护时，被保护者所受伤害结果增加5%;\n5层及以上:造成的伤害增加5%;\n11层及以上:使用横扫千军时目标不会被保护且会对额外3个单位造成45%溅射伤害;\n23层及以上:不会受到无法复活的效果影响。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDC241728
		jns[8] = 0xDC241728
		elseif jn == "额外能力"  then
		jns[1] = "增加280点气血。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "无双战神" then
		jns[1] = "增加280点气血，获得无双战神称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "虎贲上将" then
		if jn == "潜心" then
		jns[1] = "使用披坚执锐后，法术追加套装的触发几率提高100%，持续3回合。"
		jns[10]="jpg"

		elseif jn == "笃志" then
		jns[1] = "法术追加套装的触发几率提高8%。与NPC战斗时，法术套装基础概率增加25％。"
		jns[10]="jpg"

		elseif jn == "昂扬" then
		jns[1] = "每8回合自动释放1次披坚执锐,并使法术追加套装的触发几率提高50%。不能主动使用披坚执锐。"
		jns[10]="jpg"

		elseif jn == "效法" then
		jns[1] = "触发的追加法术伤害提高4%。"
		jns[10]="jpg"

		elseif jn == "追戮" then
		jns[1] = "携带的某种法术追加套装件数≥3时，基角触融发时伤害提高5%."
		jns[10]="jpg"
		elseif jn == "幸运一击" then
		jns[1] = "发动一次可触发所有追加法术的物理攻击，随后进入休息状态(休息一回合)"
		jns[10]="jpg"
		elseif jn == "烈光" then
		jns[1] = "每携带—种不同的法术追加套装，触发追加法术的伤害提高1.5%。"
		jns[10]="jpg"
		elseif jn == "摧枯拉朽" then --无图标
		jns[1] = "对目标发动—次必定触发套装追加法术的物理攻击。【消耗】300点魔法【冷却】30回合，战斗开始时具有15回合冷却"
		jns[10]="jpg"
		elseif jn == "肃杀" then --无图标
		jns[1] = "处于杀气诀状态时，你的法术追加套装角融发几率提高30%."
		jns[10]="jpg"
		elseif jn == "厉兵" then --无图标
		jns[1] = "触发追加法术后，除该法术外的其他追加法术伤害提高0.3%，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "怒伤" then --无图标
		jns[1] = "主动使用披坚执锐时，你回复10点愤怒。"
		jns[10]="jpg"
		elseif jn == "奉还" then --无图标
		jns[1] = "触发追加法术时，对和i该法术所属门派相同的玩家的伤害提高20%."
		jns[10]="jpg"
		elseif jn == "催迫" then --无图标
		jns[1] = "使用原始愤怒消耗≥120点的特技后，你的下个追加法术伤害提高12%."
		jns[10]="jpg"
		elseif jn == "攻伐" then --无图标
		jns[1] = "触发套装追加法术后，你造成的所有伤害提高5%，持续3回合(不可驱散)。"
		jns[10]="jpg"
		elseif jn == "暴突" then --无图标
		jns[1] = "造成的所有伤害提高3%。"

		jns[10]="jpg"
		elseif jn == "诛伤" then --无图标
		jns[1] = "每种追加法术在战斗内被首次触发时，其伤害提高10%。"
		jns[10]="jpg"
		elseif jn == "破刃" then --无图标
		jns[1] = "每消耗1点灵元，你的法术追加套装的触发几率提高5%。"
		jns[10]="jpg"
		elseif jn == "奋战" then --无图标
		jns[1] = "干将莫邪增加40%的基础物理连击几率,持续回合数增加2，但不再增加伤害力。"
		jns[10]="jpg"
		elseif jn == "灵能" then --无图标
		jns[1] = "击飞召唤兽或召唤物后，你的下个追加法术伤害提高12%。"
		jns[10]="jpg"
		elseif jn == "披挂上阵" then --无图标
		jns[1] = "使用仅造成40%伤害的横扫千军攻击目标，每次攻击均有几率触发套装追加法术。【冷却】10回合，战斗开始时具有5回合冷却"
		jns[10]="jpg"
		elseif jn == "额外能力"  then
		jns[1] = "增加30点速度。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "虎贲上将" then
		jns[1] = "增加30点速度，获得虎贲上将称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns










	elseif lp == "杏林妙手" then-- 化生寺
		if jn == "销武" then
		jns[1] = "与NPC战斗时，唧唧歪歪、谆谆教诲造成的伤害提高(人物等级×0.08)%。但使用后造成的治疗降低50%，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9A717CB4
		jns[8] = 0x9A717CB4
		elseif jn == "止戈" then
		jns[1] = "增加(武器伤害×18%)的基础治疗能力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x96670F08
		jns[8] = 0x96670F08
		elseif jn == "圣手" then --无图标
		jns[1] = "对气血>70%的单位，治疗效果提高3%。"
		jns[10]="jpg"
		elseif jn == "妙手" then --无图标
		jns[1] = "你的活血效果提高25%。"
		jns[10]="jpg"
		elseif jn == "仁心" then
		jns[1] = "你的活血可以使你获得状态“仁心”：使你使用活血-推拿的效果增加80%，但耗魔增加140，可叠加5层。效果持续到使用推气过宫-救死扶伤-推拿为止。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
		elseif jn == "化瘀" then --无图标
		jns[1] = "你的活血效果提高120%，但有8回合冷却时间；使用推气过宫会立即重置冷却。"
		jns[10]="jpg"
		elseif jn == "佛显" then
		jns[1] = "每3次活血或醍硼灌顶可以使你下—次推气过宫或救死扶伤必定触发明光。(不可驱散)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8D52FE90
		jns[8] = 0x8D52FE90
		elseif jn == "心韧" then
		jns[1] = "你的救死扶伤效果提高100%，但具有8回合的冷却回合。(战斗开始时具有4回合的冷却回合)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x823DD991
		jns[8] = 0x823DD991
		elseif jn == "归气" then
		jns[1] = "明光将会进行2次判定，但每次判定只增加60%治疗。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x369BD94B
		jns[8] = 0x369BD94B
		elseif jn == "天照" then
		jns[1] = "推气过言和救死扶伤会使得目标当前回合受到的法术伤害结果减少40点。醍酬灌顶会使得目标当前回合受到的法术伤害减少80点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE1910A2F
		jns[8] = 0xE1910A2F
		elseif jn == "舍利" then
		jns[1] = "死亡后，回复本方其他单位愤怒，数值为(因死亡损失的愤怒×0.65)，但回复后的愤怒不会超过120，每场战斗限1次。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
		elseif jn == "佛佑" then --无图标
		jns[1] = "每场战斗的第一次推气过宫额外给目标附加2回合的“金刚护体”。"
		jns[10]="jpg"
		elseif jn == "佛法" then --无图标
		jns[1] = "队伍中只有一个化生寺弟子时：带有“佛法无边”会同时使你造成的所有治疗增加30%，抗封能力提高10%"
		jns[10]="jpg"
		elseif jn == "佛性" then
		jns[1] = "我佛慈悲回复的气血及气血上限提高120%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5D47F1F4
		jns[8] = 0x5D47F1F4
		elseif jn == "妙悟" then
		jns[1] = "【被动】醍瑚灌]顶额外在回合结束时回复目标损失的10%速度，持续3回合。\n【主动】回复目标一定气血(效果与大慈大悲等级、治疗能力相关)，同时回合结束回复目标损失的10%速度，持续3回合。"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x2F3B9A81
		jns[8] = 0x2F3B9A81
		jns[12] = "2回合"
		elseif jn == "慈心" then
		jns[1] = "回合结束且自身未死亡时：移除己方死亡单位≤2回合的无法复活效果，自身增加5回合对应效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5816C756
		jns[8] = 0x5816C756
		elseif jn == "虔诚" then --无图标
		jns[1] = "同时带有“金刚护法”、“金刚护体”、“—苇渡江”时，你的推气过宫额外作用1个单位。"
		jns[10]="jpg"
		elseif jn == "佛缘" then --无图标
		jns[1] = "自身武器五行与友方目标武器或者衣服五行相生时，治疗效果提高2%。(可叠加)"
		jns[10]="jpg"
		elseif jn == "渡劫金身" then
		jns[1] = "给目标附加—个状态，持续2个回合或目标死亡。状态消失时，恢复目标一定气血、气血上限(效果与“大慈大悲”等级、治疗能力相关)。"
		jns[3] = 8
		jns[4] = "10点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0x3819B112
		jns[8] = 0x3819B112
		jns[12] = "4回合"
		elseif jn == "额外能力"  then
		jns[1] = "增加30点治疗能力。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "杏林妙手" then
		jns[1] = "增加30点治疗能力，获得杏林妙手称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "护法金刚" then-- 化生寺
		if jn == "施他" then --无图标
		jns[1] = "如果自身带有任意增益状态，增加40点治疗能力。"
		jns[10]="jpg"
		elseif jn == "佛屠" then
		jns[1] = "金刚护法的的增益效果将在原始效果上再次增加武器伤害的9%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x32BE260B
		jns[8] = 0x32BE260B
		elseif jn == "销武" then
		jns[1] = "与NPC战斗时，唧唧歪歪、谆谆教诲造成的伤害提高(人物等级×0.08)%。但使用后造成的治疗降低50%，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9A717CB4
		jns[8] = 0x9A717CB4
		elseif jn == "聚念" then --无图标
		jns[1] = "你的“聚气”效果增加至75%。"
		jns[10]="jpg"
		elseif jn == "仁心" then
		jns[1] = "你的活血可以使你获得状态“仁心”：使你使用活血-推拿的效果增加80%，但耗魔增加140，可叠加5层。效果持续到使用推气过宫-救死扶伤-推拿为止。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
		elseif jn == "磅礴" then --无图标
		jns[1] = "你的“聚气”触发几率提升至60%。"
		jns[10]="jpg"
		elseif jn == "佛显" then
		jns[1] = "每3次活血或醍硼灌顶可以使你下—次推气过宫或救死扶伤必定触发明光。(不可驱散)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8D52FE90
		jns[8] = 0x8D52FE90
		elseif jn == "心韧" then
		jns[1] = "你的救死扶伤效果提高100%，但具有8回合的冷却回合。(战斗开始时具有4回合的冷却回合)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x823DD991
		jns[8] = 0x823DD991
		elseif jn == "归气" then
		jns[1] = "明光将会进行2次判定，但每次判定只增加60%治疗。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x369BD94B
		jns[8] = 0x369BD94B
		elseif jn == "感念" then
		jns[1] = "使用舍生取义时，临时提升目标物理防御及法术防御10%，持续3回合，不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDC31E128
		jns[8] = 0xDC31E128
		elseif jn == "舍利" then
		jns[1] = "死亡后，回复本方其他单位愤怒，数值为(因死亡损失的愤怒×0.65)，但回复后的愤怒不会超过120，每场战斗限1次。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
		elseif jn == "无碍" then --无图标
		jns[1] = "你的“韦陀护法”效果提高100%，但作用目标变为1。"
		jns[10]="jpg"
		elseif jn == "佛法" then --无图标
		jns[1] = "队伍中只有一个化生寺弟子时：带有“佛法无边”会同时使你造成的所有治疗增加30%，抗封能力提高10%"
		jns[10]="jpg"
		elseif jn == "佛性" then
		jns[1] = "我佛慈悲可以增加目标80点物理防御及法术防御，持续5回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5D47F1F4
		jns[8] = 0x5D47F1F4
		elseif jn == "妙悟" then
		jns[1] = "【被动】醍瑚灌]顶额外在回合结束时回复目标损失的10%速度，持续3回合。【主动】回复目标一定气血(效果与大慈大悲等级、治疗能力相关)，同时回合结束回复目标损失的10%速度，持续3回合。"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x2F3B9A81
		jns[8] = 0x2F3B9A81
		jns[12] = "2回合"
		elseif jn == "慈心" then
		jns[1] = "回合结束且自身未死亡时：移除己方死亡单位s2回合的无法复活效果，自身增加5回合对应效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5816C756
		jns[8] = 0x5816C756
		elseif jn == "映法" then
		jns[1] = "金刚护法、金刚护体、一苇渡江有50%几率对所有单位起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8D9EE20
		jns[8] = 0xC8D9EE20
		elseif jn == "流刚" then
		jns[1] = "金刚护法、金刚护体、一苇渡江的效果增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x067D652B
		jns[8] = 0x067D652B
		elseif jn == "诸天看护" then
		jns[1] = "虔诚的信仰会带来更强大的力量。移除目标身上的来自于你的“金刚护法、金刚护体、一苇渡江”效果，增加目标单位1.5%×(1+被移除的状态数量)的物法伤害，持续到战斗结束。(最多增加12%)续5回合。"
		jns[3] = 3
		jns[4] = "100点魔法，10点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0xED073209
		jns[8] = 0xED073209
		jns[12] = "8回合"
		elseif jn == "额外能力"  then
		jns[1] = "增加30点速度。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "护法金刚" then
		jns[1] = "增加30点速度，获得虎贲上将称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "无量尊者" then-- 化生寺
		if jn == "诵律" then --无图标
		jns[1] = "唧唧歪歪对召唤兽造成的伤害增加100点。"
		jns[10]="jpg"
		elseif jn == "授业" then --无图标
		jns[1] = "唧唧歪歪、谆谆教诲的法术伤害结果增加30点。"
		jns[10]="jpg"
		elseif jn == "修习" then --无图标
		jns[1] = "增加谆谆教诲25%的法术连击几率。"
		jns[10]="jpg"
		elseif jn == "诵经" then --无图标
		jns[1] = "基础魔法值减少(魔力点数×2.5);你的唧唧歪歪可以使你获得状态“诵经”，使你使用唧唧歪歪-谆谆教诲的效果提高16%，但耗魔增加140,可叠加5层。效果持续到使用谆谆教诲为止。"
		jns[10]="jpg"
		elseif jn == "悲悯" then --无图标
		jns[1] = "佩戴“慈悲”时，造成的法术伤害提高（慈悲层数÷1.5）%。"
		jns[10]="jpg"

		elseif jn == "解惑" then --无图标
		jns[1] = "使用唧唧歪歪后，你的谆谆教诲减少3回合冷却时间。"
		jns[10]="jpg"
		elseif jn == "持戒" then --无图标
		jns[1] = "对气血值>70%的单位造成的法术伤害提高5%。"

		jns[10]="jpg"
		elseif jn == "生花" then --无图标
		jns[1] = "渡世步等级≥人物等级时，增加60点法术伤害力。"
		jns[10]="jpg"
		elseif jn == "悟彻" then --无图标
		jns[1] = "使用灵宝后你的谆谆教诲立即取消冷却回合。"
		jns[10]="jpg"
		elseif jn == "抚琴" then --无图标
		jns[1] = "琴音三叠造成的伤害提高15%。"
		jns[10]="jpg"
		elseif jn == "舍利" then
		jns[1] = "死亡后，回复本方其他单位愤怒，数值为(因死亡损失的愤怒×0.65)，但回复后的愤怒不会超过120，每场战斗限1次。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
		elseif jn == "静气" then --无图标
		jns[1] = "你的罗汉金钟所需愤怒减少15点"
		jns[10]="jpg"
		elseif jn == "自在" then --无图标
		jns[1] = "佛法无边不再消耗魔法值。"
		jns[10]="jpg"
		elseif jn == "无量" then --无图标
		jns[1] = "队伍中仅有1个化生寺弟子时:你带有佛法无边时，唧唧歪歪有35%几率重复释放一次。"
		jns[10]="jpg"
		elseif jn == "慧定" then --无图标
		jns[1] = "佛法无边仅能对自己释放，但触发法术连击的几率增加20%，持续回合减少1。"
		jns[10]="jpg"
		elseif jn == "金刚" then --无图标
		jns[1] = "增加80点防御。"
		jns[10]="jpg"
		elseif jn == "达摩" then --无图标
		jns[1] = "增加320点气血上限。"
		jns[10]="jpg"
		elseif jn == "韦陀" then --无图标
		jns[1] = "增加30点速度。"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "坐禅" then --无图标
		jns[1] = "每带有1个增益状态，造成的法术伤害提高1%。"
		jns[10]="jpg"
		elseif jn == "无量尊者" then --无图标
		jns[1] = "增加40点法术伤害，获得无量尊者称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

















	elseif lp == "海中蛟虬" then-- 龙宫
		if jn == "波涛" then
		jns[1] = "龙腾对玩家单位造成的伤害提高10%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4714CA13
		jns[8] = 0x4714CA13

		elseif jn == "破浪" then
		jns[1] = "每回合开始时，有33%几率使本回合所有造成的法术伤害提高6%、受到的法术伤害降低9%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA5F354BA
		jns[8] = 0xA5F354BA
		elseif jn == "狂浪" then--无图标
		jns[1] = "龙卷雨击有50%几率额外造成80点伤害。"
		jns[10]="jpg"
		elseif jn == "叱咤" then--无图标
		jns[1] = "触发“龙魂”提高的伤害增加至9%。"
		jns[10]="jpg"
		elseif jn == "踏涛" then
		jns[1] = "破浪诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45238FC3
		jns[8] = 0x45238FC3
		elseif jn == "龙啸" then--无图标
		jns[1] = "使用龙腾后，有20%几率使目标受到的法术伤害提高15%，持续3回合。"
		jns[10]="jpg"
		elseif jn == "逐浪" then
		jns[1] = "当目标处于法术减免状态时，龙卷雨击造成的伤害增加(破浪诀等级×0.8)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x890B8397
		jns[8] = 0x890B8397
		elseif jn == "龙珠" then
		jns[1] = "法宝“镇海珠”效果提高3.3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF4F33841
		jns[8] = 0xF4F33841
		elseif jn == "龙息" then--无图标
		jns[1] = "每回合开始时，增加0.2%法术暴击几率，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "龙慑" then
		jns[1] = "自身武器或者衣服五行为水时，对召唤兽增加120点法术伤害结果。(可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA9FDF759
		jns[8] = 0xA9FDF759
		elseif jn == "傲翔" then
		jns[1] = "队伍中只有—个龙宫弟子时：增加(魔力点数×9%)的法术伤害结果，减少(魔力点数x20%)的防御力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA925D675
		jns[8] = 0xA925D675
		elseif jn == "飞龙" then
		jns[1] = "受到≥(气血上限×20%)的伤害后，有75%的几率获得“神龙摆尾”效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45A7F519
		jns[8] = 0x45A7F519
		elseif jn == "骇浪" then--无图标
		jns[1] = "击倒召唤兽后，下个龙卷雨击造成的伤害提高5%."
		jns[10]="jpg"
		elseif jn == "月光" then
		jns[1] = "装备上的月亮石效果提高40%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
		elseif jn == "戏珠" then
		jns[1] = "二龙戏珠冷却回合为8，但击倒召唤兽后，额外触发─次龙卷雨击。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4B2FA59C
		jns[8] = 0x4B2FA59C
		elseif jn == "汹涌" then
		jns[1] = "当目标处于法术减免状态时，忽视其8%的法术减免效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x773514B8
		jns[8] = 0x773514B8
		elseif jn == "龙魄" then
		jns[1] = "你的龙卷雨击有20%几率额外作用3个单位。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x97C568AA
		jns[8] = 0x97C568AA
		elseif jn == "斩浪" then--无图标
		jns[1] = "如果场上可被你攻击的目标数恰好为7，你的龙卷雨击暴击几率增加7%(21%)。(括号里为与NPC战斗时的效果)"
		jns[10]="jpg"
		elseif jn == "亢龙归海" then
		jns[1] = "矫健的神龙翻腾四海的英姿很少有人目睹，而之后更无人能够道出其中的神威。使用龙腾连续攻击2次目标，每次造成龙腾伤害的95%，使用后休息1回合。【消耗】200点魔法【冷却】6回合，战斗开始时具有3回合冷却"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCE07792D
		jns[8] = 0xCE07792D
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "海中蛟虬" then --无图标
		jns[1] = "增加40点法术伤害，获得海中蛟虬称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

	elseif lp == "云龙真身" then-- 龙宫
		if jn == "波涛" then
		jns[1] = "龙腾对玩家单位造成的伤害提高10%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4714CA13
		jns[8] = 0x4714CA13

		elseif jn == "破浪" then
		jns[1] = "每回合开始时，有33%几率使本回合所有造成的法术伤害提高6%、受到的法术伤害降低9%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA5F354BA
		jns[8] = 0xA5F354BA
		elseif jn == "云霄" then
		jns[1] = "你的法术技能额外减少目标50点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8A3EF0F0
		jns[8] = 0x8A3EF0F0
		elseif jn == "呼风" then--无图标
		jns[1] = "对当前魔法百分比<30%的目标，增加5%法术暴击几率。"
		jns[10]="jpg"
		elseif jn == "踏涛" then
		jns[1] = "破浪诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45238FC3
		jns[8] = 0x45238FC3
		elseif jn == "清吟" then
		jns[1] = "龙腾对当前魔法百分比<30%的玩家单位造成伤害后，使其受到的法术伤害增加15%，持续3回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA135A426
		jns[8] = 0xA135A426
		elseif jn == "龙息" then--无图标
		jns[1] = "每回合开始时，增加0.2%法术暴击几率，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "龙珠" then
		jns[1] = "法宝“镇海珠”效果提高3.3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF4F33841
		jns[8] = 0xF4F33841
		elseif jn == "唤雨" then--无图标
		jns[1] = "造成的法术伤害增加(1-目标当前魔法/目标魔法上限)×8%。"
		jns[10]="jpg"
		elseif jn == "龙慑" then
		jns[1] = "自身武器或者衣服五行为水时，对召唤兽增加120点法术伤害结果。(可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA9FDF759
		jns[8] = 0xA9FDF759
		elseif jn == "傲翔" then
		jns[1] = "队伍中只有—个龙宫弟子时：增加(魔力点数×9%)的法术伤害结果，减少(魔力点数x20%)的防御力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA925D675
		jns[8] = 0xA925D675
		elseif jn == "飞龙" then
		jns[1] = "受到≥(气血上限×20%)的伤害后，有75%的几率获得“神龙摆尾”效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45A7F519
		jns[8] = 0x45A7F519
		elseif jn == "月光" then
		jns[1] = "装备上的月亮石效果提高40%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
		elseif jn == "戏珠" then
		jns[1] = "二龙戏珠冷却回合为8，但击倒召唤兽后，额外触发─次龙卷雨击。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4B2FA59C
		jns[8] = 0x4B2FA59C
		elseif jn == "云变" then--无图标
		jns[1] = "二龙戏珠额外减少目标(带有异常状态数量×90)点魔法值。"
		jns[10]="jpg"
		elseif jn == "沐雨" then--无图标
		jns[1] = "如果龙腾攻击后的目标魔法值为0，随机驱散其1个增益状态。"
		jns[10]="jpg"
		elseif jn == "龙魄" then
		jns[1] = "你的龙卷雨击有20%几率额外作用3个单位。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x97C568AA
		jns[8] = 0x97C568AA
		elseif jn == "摧意" then
		jns[1] = "龙腾造成的伤害≥(目标气血上限x8%)时，减少目标300点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x13DFE838
		jns[8] = 0x13DFE838
		elseif jn == "雷浪穿云" then
		jns[1] = "当那天地间卷起的白浪与电闪中的云彩揉成一片，任谁都无力承当神龙见首不见尾的后续打击。对目标使用后，目标在5回合内遭受的所有法术伤害增加30%，使用法术技能消耗MP增加100%+30点。"
		jns[3] = 8
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x77EC444B
		jns[8] = 0x77EC444B
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "云龙真身" then --无图标
		jns[1] = "增加40点法术伤害，获得海中蛟虬称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end



		return jns
	elseif lp == "沧海潜龙" then-- 龙宫
		if jn == "傲岸" then--无图标
		jns[1] = "“龙骇”的触发几率提高50%。"
		jns[10]="jpg"
		elseif jn == "云魂" then--无图标
		jns[1] = "带有“龙魂”时，“龙骇”的触发几率提高100%。"
		jns[10]="jpg"
		elseif jn == "雨魄" then--无图标
		jns[1] = "“龙骇”的效果提高50%。"
		jns[10]="jpg"
		elseif jn == "盘龙" then--无图标
		jns[1] = "每次触发“龙魂”后，“龙魂”的效果增加2%，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "叱咤" then--无图标
		jns[1] = "触发“龙魂”提高的伤害增加至9%。"
		jns[10]="jpg"
		elseif jn == "踏涛" then
		jns[1] = "破浪诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45238FC3
		jns[8] = 0x45238FC3
		elseif jn == "凛然" then--无图标
		jns[1] = "每个“龙魂”或“龙骇”状态将临时增加你80点抵抗封印等级。"
		jns[10]="jpg"
		elseif jn == "龙珠" then
		jns[1] = "法宝“镇海珠”效果提高3.3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF4F33841
		jns[8] = 0xF4F33841
		elseif jn == "回灵" then
		jns[1] = "“龙魂”和“龙骇”同时触发时，额外提高16%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
		elseif jn == "龙慑" then
		jns[1] = "自身武器或者衣服五行为水时，对召唤兽增加120点法术伤害结果。(可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA9FDF759
		jns[8] = 0xA9FDF759
		elseif jn == "傲翔" then
		jns[1] = "队伍中只有—个龙宫弟子时：增加(魔力点数×9%)的法术伤害结果，减少(魔力点数x20%)的防御力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA925D675
		jns[8] = 0xA925D675
		elseif jn == "飞龙" then
		jns[1] = "受到≥(气血上限×20%)的伤害后，有75%的几率获得“神龙摆尾”效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45A7F519
		jns[8] = 0x45A7F519
		elseif jn == "月光" then
		jns[1] = "装备上的月亮石效果提高40%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
		elseif jn == "戏珠" then
		jns[1] = "二龙戏珠冷却回合为8，但击倒召唤兽后，额外触发─次龙卷雨击。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4B2FA59C
		jns[8] = 0x4B2FA59C
		elseif jn == "波涛" then
		jns[1] = "龙腾对玩家单位造成的伤害提高10%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4714CA13
		jns[8] = 0x4714CA13

		elseif jn == "龙钩" then--无图标
		jns[1] = "消耗“龙骇”的龙卷雨击有40%几率额外作用3个单位。"
		jns[10]="jpg"
		elseif jn == "睥睨" then--无图标
		jns[1] = "带有“龙魂”时，回合结束时回复5点愤怒"
		jns[10]="jpg"
		elseif jn == "惊鸿" then--无图标
		jns[1] = "消耗“龙骇”的龙腾忽视10%的法术减免效果。"
		jns[10]="jpg"
		elseif jn == "潜龙在渊" then --无图标
		jns[1] = "移除自身“龙魂”和“龙骇”状态，每个被移除状态使你获得1层以下对应增益，持续到战斗结束:龙魂:造成的法术伤害提高1%。龙骇:对应被增益的龙腾或龙卷雨击伤害提高2%。(不可驱散)"
		jns[10]="jpg"

		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "沧海潜龙" then --无图标
		jns[1] = "增加40点法术伤害，获得海中蛟虬称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns












	elseif lp == "平天大圣" then-- 魔王寨
		if jn == "充沛" then
		jns[1] = "你的牛劲效果增加20%且会附加“感知”状态。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8A07409C
		jns[8] = 0x8A07409C
		elseif jn == "震怒" then
		jns[1] = "飞砂走石增加40点法术伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA64557
		jns[8] = 0xBAA64557

		elseif jn == "激怒" then--无图标
		jns[1] = "回合开始时，有10%几率进入“蚀天”状态：造成的法术伤害增加15%，持续4回合。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "蚀天" then
		jns[1] = "受到≥(气血上限×20%)的伤害则进入“蚀天”状态：造成的法术伤害增加15%，持续3回合。(不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAC17A1D4
		jns[8] = 0xAC17A1D4
		elseif jn == "邪火" then--无图标
		jns[1] = "三昧真火伤害提高4%，且目标处于休息状态时额外提高20%(300%)。(括号里为目标为NPC时的效果)"
		jns[10]="jpg"
		elseif jn == "赤暖" then
		jns[1] = "赤焰法宝会额外为你回复气血，效果为(回复的魔法值×10)."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x36BEA656
		jns[8] = 0x36BEA656
		elseif jn == "火神" then
		jns[1] = "触发“神焰”时，三昧真火与飞砂走石伤害倍率增加14%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF44D568
		jns[8] = 0xBF44D568
		elseif jn == "震天" then
		jns[1] = "震天诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x06B6105D
		jns[8] = 0x06B6105D
		elseif jn == "真炎" then--无图标
		jns[1] = "三昧真火与飞砂走石有10%几率伤害提高30%."
		jns[10]="jpg"
		elseif jn == "神焰" then
		jns[1] = "增加五火神焰印6%的基础触发几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9D84EC63
		jns[8] = 0x9D84EC63
		elseif jn == "崩摧" then
		jns[1] = "每当敌方每次封印本方单位时，无论是香成功，你的风云变色有12%几率取消冷却时间。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4935E53B
		jns[8] = 0x4935E53B
		elseif jn == "焚尽" then--无图标
		jns[1] = "自身武器或者衣服五行为火时，法术暴击几率增加4%。(可叠加)"
		jns[10]="jpg"
		elseif jn == "咆哮" then--无图标
		jns[1] = "每层魔冥的效果增加至7%(目标为玩家单位时增加至21%)."
		jns[10]="jpg"
		elseif jn == "狂月" then
		jns[1] = "装备上的月亮石效果提高40%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0A9E4158
		jns[8] = 0x0A9E4158
		elseif jn == "燃魂" then
		jns[1] = "风云变色会使你下个法术造成的伤害增加12%，持续4回合。(不可驱散)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x79602FB7
		jns[8] = 0x79602FB7
		elseif jn == "威吓" then
		jns[1] = "触发五火神焰印时，对召唤兽和召唤物伤害倍率增加42%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3816E2FC
		jns[8] = 0x3816E2FC
		elseif jn == "连营" then
		jns[1] = "你的摇头摆尾有30%几率对随机目标再使用—次摇头摆尾，但只造成40%的伤害，可重复触发。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x90EEA1F5
		jns[8] = 0x90EEA1F5
		elseif jn == "魔心" then
		jns[1] = "增加50点法术暴击等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDAA0F7D4
		jns[8] = 0xDAA0F7D4
		elseif jn == "魔焰滔天" then
		jns[1] = "为了能给敌人造成更大的伤害，魔王寨的弟子是不怕赌上自己运气的。使用法术攻击目标，70%几率造成三昧真火法术伤害×175%，30%几率造成三昧真火法术伤害×25%。不受佛法无边影响。【消耗】60点魔法【冷却】6回合，战斗开始时具有3回合冷却"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x525B9DB0
		jns[8] = 0x525B9DB0
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "平天大圣" then --无图标
		jns[1] = "增加40点法术伤害，获得平天大圣称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

	elseif lp == "盖世魔君" then-- 魔王寨
		if jn == "充沛" then
		jns[1] = "你的牛劲效果增加20%且会附加“感知”状态。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8A07409C
		jns[8] = 0x8A07409C
		elseif jn == "震怒" then
		jns[1] = "飞砂走石增加40点法术伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA64557
		jns[8] = 0xBAA64557
		elseif jn == "炙烤" then
		jns[1] = "你的牛劲持续回合减少3，但使用时额外获得“炙烤”状态:提高20%的“神焰”基础触发几率，持续回合与牛劲相同。"
		jns[10]="jpg"

		elseif jn == "烈焰" then --无图标
		jns[1] = "受到≥气血上限20%的伤害则进入“炙烤”状态:提高20%的“神焰”基础触发几率，持续3回合。"
		jns[10]="jpg"
		elseif jn == "赤暖" then
		jns[1] = "赤焰法宝会额外为你回复气血，效果为(回复的魔法值x10) 。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x36BEA656
		jns[8] = 0x36BEA656
		elseif jn == "邪火" then --无图标
		jns[1] = "三昧真火伤害提高4%，且目标处于休息状态时额外提高20%(300%)。(括号里为目标为NPC时的效果)"
		jns[10]="jpg"
		elseif jn == "火神" then
		jns[1] = "触发“神焰”时，三昧真火与飞砂走石伤害倍率增加14%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF44D568
		jns[8] = 0xBF44D568
		elseif jn == "震天" then
		jns[1] = "震天诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x06B6105D
		jns[8] = 0x06B6105D
		elseif jn == "折服" then --无图标
		jns[1] = "触发“神焰”时，三昧真火会随机驱散目标一个增益状态、飞砂走石有25%几率随机驱散目标一个增益状态。"
		jns[10]="jpg"
		elseif jn == "焰星" then --无图标
		jns[1] = "自身武器或者衣服五行为火时，增加五火神焰印5%的基础触发几率。(可叠加)"
		jns[10]="jpg"
		elseif jn == "崩摧" then
		jns[1] = "每当敌方每次封印本方单位时，无论是香成功，你的风云变色有12%几率取消冷却时间。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4935E53B
		jns[8] = 0x4935E53B
		elseif jn == "焰威" then --无图标
		jns[1] = "触发“神焰”时，回复3点愤怒;此效果每回合仅触发1次。"
		jns[10]="jpg"
		elseif jn == "咆哮" then --无图标
		jns[1] = "每层魔冥的效果增加至7%(目标为玩家单位时增加至21%) ."
		jns[10]="jpg"
		elseif jn == "狂月" then
		jns[1] = "装备上的月亮石效果提高40%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0A9E4158
		jns[8] = 0x0A9E4158
		elseif jn == "魔焱" then --无图标
		jns[1] = "使用风云变色后，获得“炙烤”状态:提高20%的“神焰”基础触发几率，持续4回合。"
		jns[10]="jpg"
		elseif jn == "威吓" then
		jns[1] = "触发五火神焰印时，对召唤兽和召唤物伤害倍率增加42%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3816E2FC
		jns[8] = 0x3816E2FC
		elseif jn == "连营" then
		jns[1] = "你的摇头摆尾有30%几率对随机目标再使用—次摇头摆尾，但只造成40%的伤害，可重复触发。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x90EEA1F5
		jns[8] = 0x90EEA1F5
		elseif jn == "狂劲" then --无图标
		jns[1] = "你的摇头摆尾触发“神焰”的几率提高8%。"
		jns[10]="jpg"

		elseif jn == "升温" then --无图标
		jns[1] = "你每点消耗的灵元，会增加“神焰”6%的基础伤害倍率，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "盖世魔君" then --无图标
		jns[1] = "增加40点法术伤害，获得平天大圣称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "风火妖王" then-- 魔王寨
		if jn == "五蕴神焰" then --无图标
		jns[1] = "【替换技能:三昧真火】牛魔王的秘传法术之一，修炼至极致的丹田元气，威力非普通的三昧真火可比拟。对单个敌方目标造成极高的法术伤害。"

		jns[4] = "60点魔法、20点愤怒"
		jns[10]="jpg"
		jns[12]="8回合，战斗开始时具有4回合冷却"
		elseif jn == "烈火真言" then --无图标
		jns[1] = "【被动】进入战斗后，随机获得一个“秘传法术”:替换你的三昧真火为五蕴神焰，或替换你的飞砂走石为漫卷狂沙;其冷却回合皆增加至10回合。【主动】通过刻苦的练习，能够在战斗中灵活的切换激活的秘传法术，但切换后秘传法术会立即进入冷却。"

		jns[4] = "100点魔法"
		jns[10]="jpg"
		elseif jn == "漫卷狂沙" then --无图标
		jns[1] = "牛魔王的秘传法术之一，可以卷起狂风砂石，甚至可以摧毁山峰。施放一次强力的飞砂走石。"

		jns[4] = "(60×作用人数)点魔法、20点愤怒"
		jns[10]="jpg"
		jns[12]="8回合，战斗开始时具有4回合冷却"
		elseif jn == "极炙" then --无图标
		jns[1] = "五蕴神焰有20%几率额外造成25%的伤害。"

		jns[10]="jpg"
		elseif jn == "咒言" then --无图标
		jns[1] = "使用三昧真火、飞砂走石后，秘传技能冷却回合减少1。"
		jns[10]="jpg"

		elseif jn == "摧山" then --无图标
		jns[1] = "漫卷狂沙的伤害提高5%。"
		jns[10]="jpg"

		elseif jn == "不忿" then --无图标
		jns[1] = "使用“琴音三叠”后，回复15点愤怒。"
		jns[10]="jpg"

		elseif jn == "震天" then
		jns[1] = "震天诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x06B6105D
		jns[8] = 0x06B6105D
		elseif jn == "融骨" then --无图标
		jns[1] = "五蕴神焰会随机驱散目标一个增益状态;漫卷狂沙有25%几率随机驱散目标一个增益状态。"
		jns[10]="jpg"

		elseif jn == "神焰" then
		jns[1] = "增加五火神焰印6%的基础触发几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9D84EC63
		jns[8] = 0x9D84EC63
		elseif jn == "焦土" then --无图标
		jns[1] = "自身武器或者衣服五行为士时，五蕴神焰和漫卷狂沙法术暴击几率提高50%。(可叠加)"

		jns[10]="jpg"
		elseif jn == "不灭" then
		jns[1] = "每次使用五蕴神焰或漫卷狂沙，都会使本场战斗中五蕴神焰和漫卷狂沙伤害永久增加1%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAE728B11
		jns[8] = 0xAE728B11
		elseif jn == "烬藏" then --无图标
		jns[1] = "使用原始愤怒消耗≥120点的特技后，秘传技能减少1回合冷却时间。"

		jns[10]="jpg"
		elseif jn == "固基" then --无图标
		jns[1] = "五蕴神焰或漫卷狂沙基础冷却回合减少1回合。"
		jns[10]="jpg"
		elseif jn == "惊悟" then --无图标
		jns[1] = "使用五蕴神焰或漫卷狂沙后，有50%几率永久减少基础冷却回合1回合，每场战斗最多触发2次。"
		jns[10]="jpg"
		elseif jn == "威吓" then
		jns[1] = "触发五火神焰印时，对召唤兽和召唤物伤害倍率增加42%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3816E2FC
		jns[8] = 0x3816E2FC
		elseif jn == "旋阳" then --无图标
		jns[1] = "每消耗1点灵元，五蕴神焰或漫卷狂沙冷却回合减少2。"
		jns[10]="jpg"
		elseif jn == "魔心" then
		jns[1] = "增加50点法术暴击等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDAA0F7D4
		jns[8] = 0xDAA0F7D4
		elseif jn == "风火燎原" then --无图标
		jns[1] = "聆听牛魔王的秘传之咒，让魔王的意志降临于你。获得持续5回合的“牛劲”和“风火燎原”状态。风火燎原:回合结束时，五蕴神焰或漫卷狂沙冷却时间减少1。"
		jns[2] = "【消耗】50点魔法【冷却】20回合，战斗开始时冷却10回合。每次使用五蕴神焰或漫卷狂沙后，减少风火燎原5回合冷却。"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "风火妖王" then --无图标
		jns[1] = "增加40点法术伤害，获得风火妖王称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns




















	elseif lp == "通天法王" then-- 神木林
		if jn == "法身" then
		jns[1] = "偶数回合不再获取风灵，但每层风灵额外增加2％法术暴击几率。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xC3E2C628
		jns[8] = 0xC3E2C628
		elseif jn == "风魂" then
		jns[1] = "消耗风灵时，获得（消耗数量×等级×2）的护盾。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 1270320749
		jns[8] = 1270320749
		elseif jn == "灵佑" then
		jns[1] = "带有风灵时，受到的所有伤害降低2％。"
		jns[10]="jpg"
		elseif jn == "追击" then
		jns[1] = "使用落叶萧萧触发“重光”时，若有风灵，会消耗1层风灵并使得伤害提高30％。"
		jns[10]="jpg"
		elseif jn == "咒法" then
		jns[1] = "巫咒等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE17F1C2E
		jns[8] = 0xE17F1C2E
		elseif jn == "狂叶" then --无图版
		jns[1] = "当你没有风灵时，你的落叶萧萧增加90点法术伤害力。"

		jns[10]="jpg"
		elseif jn == "劲草" then --无图版
		jns[1] = "触发“鞭挞”时，每层风灵提升的伤害增加至20％。"

		jns[10]="jpg"
		elseif jn == "冰锥" then
		jns[1] = "冰川怒对召唤兽及召唤物使用时，若有风灵，会消耗一层风灵并获得下列效果\n1）封印几率提升40％；\n2）伤害结果提高30；\n3）驱散目标一个增益状态。。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x83D1EA06
		jns[8] = 0x83D1EA06
		elseif jn == "苍埃" then --无图版
		jns[1] = "尘土刃对玩家使用时，若有风灵，会消耗一层风灵并获得以下效果：\n1）造成伤害提高20％；2）\n额外减少目标受到伤害×50的气血上限。"
		jns[10]="jpg"
		elseif jn == "神木" then --无图版
		jns[1] = "自身武器或者衣服五行为木时，造成的法术伤害提高4％。（可叠加）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xD53A237C
		jns[8] = 0xD53A237C
		elseif jn == "月影" then
		jns[1] = "增加月影6％的基础法术连击几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x95F03B6B
		jns[8] = 0x95F03B6B
		elseif jn == "薪火" then --无图版
		jns[1] = "自身武器或者衣服五行为火时，每回合结束增加自己2点法伤，持续到战斗结束。（可叠加）"
		jns[10]="jpg"
		elseif jn == "纯净" then
		jns[1] = "装备上的光芒石效果提高70％。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x82DE1BB0
		jns[8] = 0x82DE1BB0
		elseif jn == "蔓延" then
		jns[1] = "使用荆棘舞、冰川怒、尘土刃造成的伤害提高10％，并且会使得你造成的所有伤害15％，持续3回合。（效果不可叠加，可刷新）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE567BAAB
		jns[8] = 0xE567BAAB
		elseif jn == "破杀" then
		jns[1] = "荆棘舞、冰川怒、尘土刃增加12％暴击几率和20％暴击伤害倍率。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xCE2EEB29
		jns[8] = 0xCE2EEB29
		elseif jn == "星光" then --无图版
		jns[1] = "战斗中本方消耗的灵元会转化为你的“星光”，每点“星光”增加你下个法术2％的伤害结果。（最多增加40％，不可驱散）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x8E6B4692
		jns[8] = 0x8E6B4692
		elseif jn == "滋养" then
		jns[1] = "你的密润只能作用于自己，但会额外获得下述效果：\n1）额外使你造成的所有法术伤害提高15％。\n2）被驱散时回复（剩余回合数×驭灵咒等级）的气血。"
		jns[10]="jpg"
		elseif jn == "灵归" then --无图版
		jns[1] = "第30和60回合时，额外获得2点风灵。"

		jns[10]="jpg"
		elseif jn == "风卷残云" then
		jns[1] = "神木林在觉醒，风在咆哮！大风带着神木林弟子的怒意无情的打击面前的敌人。\n消耗所有风灵使用一次落叶萧萧，伤害结果提高（消耗风灵数×16％）。该技能不触发“重光”，但佩戴“月影”时额外提高12％伤害并消耗1点灵气。"
		jns[3] = 4
		jns[4] = "150点魔法"
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x3778487D
		jns[8] = 0x3778487D
		jns[12] = "5回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "通天法王" then --无图标
		jns[1] = "增加40点法术伤害，获得通天法王称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns





	elseif lp == "巫影祭司" then-- 神木林
		if jn == "风魂" then
		jns[1] = "消耗风灵时，获得(消耗数量x等级×2)的护盾。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 1270320749
		jns[8] = 1270320749
		elseif jn == "迷缚" then --无图标
		jns[1] = "带有来自你“雾杀”的单位对你造成的伤害降低3%"
		jns[10]="jpg"
		elseif jn == "法身" then
		jns[1] = "偶数回合不再获得风灵，但每层风灵额外增加2%法术暴击几率。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xC3E2C628
		jns[8] = 0xC3E2C628
		elseif jn == "伏毒" then --无图标
		jns[1] = "使用蛊木迷瘴触发“重光”时，若有风灵，会消耗一层风灵并增加5%的附加雾杀几率。"

		jns[10]="jpg"
		elseif jn == "咒法" then
		jns[1] = "巫咒等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE17F1C2E
		jns[8] = 0xE17F1C2E
		elseif jn == "灵木" then --无图标
		jns[1] = "佩戴“月影”时，雾杀有(月影层数×2)%的几率附加3层“雾杀”"
		jns[10]="jpg"
		elseif jn == "绞藤" then --无图标
		jns[1] = "触发鞭达时，有(消耗风灵数量×10%)的几率为目标附加1层雾杀。"

		jns[10]="jpg"
		elseif jn == "冰锥" then
		jns[1] = "冰川怒对召唤兽及召唤物使用时，若有风灵，会消耗一层风灵并获得下列效果\n1）封印几率提升40％；\n2）伤害结果提高30；\n3）驱散目标一个增益状态。。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x83D1EA06
		jns[8] = 0x83D1EA06
		elseif jn == "寄生" then
		jns[1] = "使用尘土刃时将会引爆目标身上的所有雾痕印记，每层印记造成75点的固定伤害。"
		jns[10]="jpg"
		elseif jn == "神木" then --无图版
		jns[1] = "自身武器或者衣服五行为木时，造成的法术伤害提高4％。（可叠加）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xD53A237C
		jns[8] = 0xD53A237C
		elseif jn == "月影" then
		jns[1] = "增加月影6％的基础法术连击几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x95F03B6B
		jns[8] = 0x95F03B6B
		elseif jn == "薪火" then --无图版
		jns[1] = "自身武器或者衣服五行为火时，每回合结束增加自己2点法伤，持续到战斗结束。（可叠加）"
		jns[10]="jpg"
		elseif jn == "纯净" then
		jns[1] = "装备上的光芒石效果提高70％。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x82DE1BB0
		jns[8] = 0x82DE1BB0
		elseif jn == "蔓延" then
		jns[1] = "使用荆棘舞、冰川怒、尘土刃造成的伤害提高10％，并且会使得你造成的所有伤害15％，持续3回合。（效果不可叠加，可刷新）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE567BAAB
		jns[8] = 0xE567BAAB
		elseif jn == "破杀" then
		jns[1] = "荆棘舞、冰川怒、尘土刃增加12％暴击几率和20％暴击伤害倍率。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xCE2EEB29
		jns[8] = 0xCE2EEB29
		elseif jn == "激活" then --无图标
		jns[1] = "每消耗1点灵元，有100%的几率获得1层“催化”的效果。"
		jns[10]="jpg"
		elseif jn == "滋养" then
		jns[1] = "你的密润只能作用于自己，但会额外获得下述效果：\n1）额外使你造成的所有法术伤害提高15％。\n2）被驱散时回复（剩余回合数×驭灵咒等级）的气血。"
		jns[10]="jpg"
		elseif jn == "毒萃" then --无图标
		jns[1] = "使用后你的蛊木迷瘴附加“雾杀”的几率提高100%，持续5回合(包括当前回合)。"
		jns[2] = "【消耗】300点魔法，1点风灵"

		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加280点气血。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "凋零之歌" then
		jns[1] = "歌声飘进敌人的耳中，颤动着敌人心窝，在无形中侵袭着敌阵的斗志，埋下毁灭之种。目标接下来2回合受到的法术伤害增加16%，若目标带有雾杀效果，则引爆雾杀效果，否则只能造成100点伤害；并使对手随机3个未带雾杀效果的目标获得雾杀效果。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x281E732A
		jns[8] = 0x281E732A
		jns[12] = "8回合"
		elseif jn == "巫影祭司" then --无图标
		jns[1] = "增加280点气血，获得巫影祭司称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns




	elseif lp == "灵木神侍" then-- 神木林
		if jn == "风魂" then
		jns[1] = "消耗风灵时，获得（消耗数量×等级×2）的护盾。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 1270320749
		jns[8] = 1270320749
		elseif jn == "灵秀" then --无图标
		jns[1] = "进场时，获得的1点风灵转化为1点木精。"
		jns[10]="jpg"
		elseif jn == "归原" then --无图标
		jns[1] = "你消耗的每点木精，都将回复你(等级x4)的气血。"
		jns[10]="jpg"
		elseif jn == "苍风" then --无图标
		jns[1] = "你的落叶萧萧最多消耗1层风灵，提高6%的伤害。"jns[10]="jpg"
		elseif jn == "咒法" then
		jns[1] = "巫咒等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE17F1C2E
		jns[8] = 0xE17F1C2E
		elseif jn == "焕新" then --无图标
		jns[1] = "当你没有风灵和木精时，你的落叶萧萧增加100点法术伤害力。"
		jns[10]="jpg"
		elseif jn == "萦风" then --无图标
		jns[1] = "击飞召唤兽时，风灵转化为木精的几率提高100%。"
		jns[10]="jpg"
		elseif jn == "奉愿" then --无图标
		jns[1] = "消耗木精的技能造成的伤害提高10%。"
		jns[10]="jpg"
		elseif jn == "秀木" then --无图标
		jns[1] = "风灵转化为木精的几率提高25%。"
		jns[10]="jpg"
		elseif jn == "神木" then --无图版
		jns[1] = "自身武器或者衣服五行为木时，造成的法术伤害提高4％。（可叠加）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xD53A237C
		jns[8] = 0xD53A237C
		elseif jn == "月影" then
		jns[1] = "增加月影6％的基础法术连击几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x95F03B6B
		jns[8] = 0x95F03B6B
		elseif jn == "薪火" then --无图版
		jns[1] = "自身武器或者衣服五行为火时，每回合结束增加自己2点法伤，持续到战斗结束。（可叠加）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xD53A237C
		jns[8] = 0xD53A237C
		elseif jn == "凉秋" then --无图标
		jns[1] = "疾风秋叶额外作用1个单位目伤害提高4%，但需消耗2点木精。"
		jns[10]="jpg"
		elseif jn == "蔓延" then
		jns[1] = "使用荆棘舞、冰川怒、尘土刃造成的伤害提高10％，并且会使得你造成的所有伤害15％，持续3回合。（效果不可叠加，可刷新）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE567BAAB
		jns[8] = 0xE567BAAB
		elseif jn == "碾杀" then --无图标
		jns[1] = "古藤秘咒对玩家单位造成的伤害提高32%。"
		jns[10]="jpg"
		elseif jn == "星光" then --无图版
		jns[1] = "战斗中本方消耗的灵元会转化为你的“星光”，每点“星光”增加你下个法术2％的伤害结果。（最多增加40％，不可驱散）"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x8E6B4692
		jns[8] = 0x8E6B4692
		elseif jn == "滋养" then
		jns[1] = "你的密润只能作用于自己，但会额外获得下述效果：\n1）额外使你造成的所有法术伤害提高15％。\n2）被驱散时回复（剩余回合数×驭灵咒等级）的气血。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x82DE1BB0
		jns[8] = 0x82DE1BB0
		elseif jn == "灵精" then --无图标
		jns[1] = "你消耗的木精有20%几率转化为风灵。"
		jns[10]="jpg"
		elseif jn == "枯木逢春" then --无图标
		jns[1] = "对敌方所有单位使用一次强大的法术。1.对点选目标造成较高伤害，对其他目标造成少量伤害。⒉使用后获得2点风灵。"
		jns[2] = "【消耗】100点魔法、3点木精"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点抵抗封印等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001

		elseif jn == "灵木神侍" then --无图标
		jns[1] = "增加80点抵抗封印等级，获得灵木神侍称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns












	elseif lp == "拘灵散修" then-- 方寸山
		if jn == "雷动" then
		jns[1] = "使用落雷符时首目标法术暴击几率增加15％。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD2180C25
		jns[8] = 0xD2180C25
		elseif jn == "苦缠" then
		jns[1] = "失魂符、失心符、定身符降低属性的效果增加3％。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE99E9C96
		jns[8] = 0xE99E9C96
		elseif jn == "灵咒" then --无图标
		jns[1] = "失魂符、失心符、定身符降低属性的效果首回合增加5％。"
		jns[10]="jpg"
		elseif jn == "黄粱" then
		jns[1] = "敌方单位被你催眠时，必须受到30点以上的伤害才会苏醒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD3CF1A9E
		jns[8] = 0xD3CF1A9E
		elseif jn == "制约" then --无图标
		jns[1] = "你的催眠符成功率减少基础值的5％，但你的其他法术成功率增加基础值的5％。"
		jns[10]="jpg"
		elseif jn == "必果" then --无图标
		jns[1] = "每场战斗中，你的第一次封印对没有抗封技能且等级不大于你的玩家单位100％封印成功。"
		jns[10]="jpg"
		elseif jn == "补缺" then
		jns[1] = "回合开始时，弱自身气血＜气血上限30％，有35％几率自动使用凝神术。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3A33F2CD
		jns[8] = 0x3A33F2CD
		elseif jn == "不倦" then
		jns[1] = "增加救命毫毛15％的基础成功率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA2F9E185
		jns[8] = 0xA2F9E185
		elseif jn == "精炼" then --无图标
		jns[1] = "进入战斗时增加救命毫毛80％的基础成功率，每回合减少10％。"
		jns[10]="jpg"
		elseif jn == "化身" then
		jns[1] = "“分身术”持续回合持续回合数增加1。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE950182D
		jns[8] = 0xE950182D
		elseif jn == "调息" then
		jns[1] = "“分身术”状态下，回合结束回复（气血上限×5％）的气血与（魔法上限×3％）的魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2ACC6068
		jns[8] = 0x2ACC6068
		elseif jn == "幻变" then --无图标
		jns[1] = "“分身术”额外使你受到的伤害降低20％，但有8回合冷却时间。"
		jns[10]="jpg"
		elseif jn == "斗法" then
		jns[1] = "增加（武器伤害×12％）的封印命中等级，但不再增加法术伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1EEA41F8
		jns[8] = 0x1EEA41F8
		elseif jn == "吐纳" then
		jns[1] = "乾天罡气将消耗自身超过50％的所有气血，额外回复（消耗气血×25％）的魔法。主动使用的归元咒将额外回复至多（气血上限×50％）的气血，但额外消耗对应值×25％的魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
		elseif jn == "专神" then --无图标
		jns[1] = "带有“凝神术”时，增加4％的抵抗封印几率。"
		jns[10]="jpg"
		elseif jn == "鬼念" then
		jns[1] = "可以封印鬼魂目标，降低鬼魂类单位对自身20％的伤害。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x173015AE
		jns[8] = 0x173015AE
		elseif jn == "灵威" then --无图标
		jns[1] = "使用灵宝后，你回复12点愤怒。"
		jns[10]="jpg"
		elseif jn == "碎甲" then
		jns[1] = "你的碎甲符首回合提高100％，每回合降低20％，但具有6回合的冷却时间。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF701C5B5
		jns[8] = 0xF701C5B5
		elseif jn == "顺势而为" then
		jns[1] = "精于封印的方寸弟子可以耗费一定的愤怒值对目标施加强大的法力，100％封印住那些没有抗封技能目标的法术能力，封印效果持续2回合"
		jns[3] = 4
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0x9E6FFF66
		jns[8] = 0x9E6FFF66
		jns[12] = "6回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加30点速度。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "拘灵散修" then --无图标
		jns[1] = "增加30点速度，获得拘灵散修称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end

		return jns



	elseif lp == "伏魔天师" then-- 方寸山
		if jn == "驱雷" then --无图标
		jns[1] = "增加五雷咒3%的基础暴击几率。"
		jns[10]="jpg"
		elseif jn == "策电" then --无图标
		jns[1] = "五雷咒对首目标提高5%的伤害，在霹雳咒等级≥125时，额外提高5%。"
		jns[10]="jpg"
		elseif jn == "雷动" then
		jns[1] = "使用落雷符时首目标法术暴击几率增加15％。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD2180C25
		jns[8] = 0xD2180C25
		elseif jn == "超导" then
		jns[1] = "天气为雨时，五雷咒伤害提升20%。"
		jns[3] = 8
		jns[6] = "sjm.wdf"
		jns[7] = 0xF701C5B5
		jns[8] = 0xF701C5B5

		elseif jn == "鬼怮" then --无图标
		jns[1] = "法术防御所减免的法术伤害只对五雷咒第二目标起效10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB44BA05E
		jns[8] = 0xB44BA05E
		elseif jn == "穿透" then --无图标
		jns[1] = "琴音三叠对召唤兽和召唤物造成的伤害提高30%。"
		jns[10]="jpg"
		elseif jn == "余悸" then --无图标
		jns[1] = "被五雷咒攻击过的召唤兽，受到“悲恸”的伤害加成增加至40%"
		jns[10]="jpg"
		elseif jn == "宝诀" then --无图标
		jns[1] = "佩戴“救命毫毛”时，造成的法术伤害结果增加(救命毫毛层数/2)%。进入战斗时增加救命毛80%的基础成功率，每回合减少10%。"
		jns[10]="jpg"
		elseif jn == "妙用" then --无图标
		jns[1] = "佩戴“救命毫毛”时，造成的法术伤害结果增加(救命毫毛层数/2)%;增加“救命毫毛”15%的基础成功率。"
		jns[10]="jpg"
		elseif jn == "不灭" then
		jns[1] = "佩戴“救命毫毛”时，造成的法术伤害结果增加(救命毫毛层数/2)%;增加“救命毫毛”在每场战斗中可以发挥的次数上限3，每次“救命毫毛”复活后法术伤害力增加40点"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAE728B11
		jns[8] = 0xAE728B11
		elseif jn == "化身" then
		jns[1] = "“分身术”持续回合持续回合数增加1。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE950182D
		jns[8] = 0xE950182D
		elseif jn == "怒霆" then --无图标
		jns[1] = "使用5次五雷咒后，下个五雷咒额外作用3个单位。"
		jns[10]="jpg"
		elseif jn == "批亢" then
		jns[1] = "“分身术”状态下，造成的法术伤害提高20%，受到的伤害降低15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x200F0880
		jns[8] = 0x200F0880
		elseif jn == "顺势" then --无图标
		jns[1] = "对没有召唤兽的玩家单位造成的法术伤害提高8%。"
		jns[10]="jpg"
		elseif jn == "炼魂" then --无图标
		jns[1] = "队伍中只有一个方寸山弟子时，当回合被自己法术攻击过的敌方玩家死亡后，目标获得状态“炼魂”︰1)“炼魂”状态持续到战斗结束，无法被移除;2)你对不带有“炼魂”的玩家单位伤害提高(5%×敌方场上“炼魂”状态数目);3)当敌方所有玩家单位都带有“炼魂”时，你的五雷咒额外作用2个单位。"
		jns[10]="jpg"
		elseif jn == "吐纳" then
		jns[1] = "乾天罡气将消耗自身超过50％的所有气血，额外回复（消耗气血×25％）的魔法。主动使用的归元咒将额外回复至多（气血上限×50％）的气血，但额外消耗对应值×25％的魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
		elseif jn == "灵能" then --无图标
		jns[1] = "使用灵宝后，你的下一个五雷咒伤害提高10%。"
		jns[10]="jpg"
		elseif jn == "碎甲" then
		jns[1] = "你的碎甲符首回合提高100％，每回合降低20％，但具有6回合的冷却时间。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF701C5B5
		jns[8] = 0xF701C5B5
		elseif jn == "摧心" then
		jns[1] = "本回合被你法术攻击命中过的敌方单位死亡后，会在之后的3回合内进入虚弱状态:降低12%的伤害力、法术伤害力、法术防御和物理防御。(效果可刷新，不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF2BAFEF2
		jns[8] = 0xF2BAFEF2
		elseif jn == "钟馗论道" then
		jns[1] = "为自己附加“钟馗论道”状态，获得下述效果，持续5回合:1)五雷咒伤害提高70%;2)该效果不会被驱散;3)回合结束时减少自身“锢魂术”“死亡召唤”1回合持续时间;。【条件】当前气血比例≥50%"
		jns[2] = "【消耗】80点魔法，使用后仅保留1点气血【冷却】8回合，战斗开始时具有4回合冷却"
		jns[3] = 2
		jns[6] = "wzife.wd2"
		jns[7] = 0xB7CDB6AA
		jns[8] = 0xB7CDB6AA
		jns[12] = "8回合，战斗开始时具有4回合冷却"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法伤。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "伏魔天师" then --无图标
		jns[1] = "增加40点法伤，获得伏魔天师称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end

		return jns








	elseif lp == "五雷正宗" then-- 方寸山
		if jn == "震怒" then --无图标
		jns[1] = "仅有1种雷法加持时，五雷正法的伤害提高16%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA64557
		jns[8] = 0xBAA64557
		elseif jn == "雷动" then
		jns[1] = "使用落雷符时首目标法术暴击几率增加15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD2180C25
		jns[8] = 0xD2180C25
		elseif jn == "天篆" then --无图标
		jns[1] = "有≥3种的雷法加持时，五雷正法造成的伤害提高8%"
		jns[10]="jpg"
		elseif jn == "咒诀" then --无图标
		jns[1] = "没有任何雷法加持时，至少会出现3枚符咒。"
		jns[10]="jpg"
		elseif jn == "穿透" then --无图标
		jns[1] = "琴音三叠对召唤兽和召唤物造成的伤害提高30%。"
		jns[10]="jpg"
		elseif jn == "符威" then --无图标
		jns[1] = "转化符咒时，每枚符咒使你回复1点愤怒。"
		jns[10]="jpg"
		elseif jn == "宝诀" then --无图标
		jns[1] = "佩戴“救命毫毛”时，造成的法术伤害结果增加(救命毫毛层数/2)%。进入战斗时增加救命毫毛80%的基础成功率，每回合减少10%。"
		jns[10]="jpg"
		elseif jn == "妙用" then --无图标
		jns[1] = "佩戴“救命毫毛”时，造成的法术伤害结果增加(救命毫毛层数/2)%;增加“救命毫毛”15%的基础成功率。"
		jns[10]="jpg"
		elseif jn == "不灭" then
		jns[1] = "佩戴“救命毫毛”时，造成的法术伤害结果增加(救命毫毛层数/2)%;增加“救命毫毛”在每场战斗中可以发挥的次数上限3，每次“救命毫毛”复活后法术伤害力增加40点"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAE728B11
		jns[8] = 0xAE728B11
		elseif jn == "雷法·翻天" then --无图标
		jns[1] = "使用五雷咒攻击目标。转化当前的符咒，每转化一枚符咒，五雷正法对召唤兽造成的伤害提高35%"
		jns[2] = "【消耗】30点魔法"
		jns[10]="jpg"
		elseif jn == "吞雷" then --无图标
		jns[1] = "受到的法术伤害降低5%。"
		jns[10]="jpg"
		elseif jn == "雷法·倒海" then --无图标
		jns[1] = "使用五雷咒攻击目标。转化当前的符咒，每转化一枚符咒，五雷正法对玩家单位造成的伤害提高8%"
		jns[2] = "【消耗】30点魔法"
		jns[10]="jpg"
		elseif jn == "顺势" then --无图标
		jns[1] = "对没有召唤兽的玩家单位造成的法术伤害提高8%。"
		jns[10]="jpg"
		elseif jn == "神机" then --无图标
		jns[1] = "如果你的雷法击飞了目标，立即获得1枚符咒"
		jns[10]="jpg"
		elseif jn == "吐纳" then
		jns[1] = "乾天罡气将消耗自身超过50％的所有气血，额外回复（消耗气血×25％）的魔法。主动使用的归元咒将额外回复至多（气血上限×50％）的气血，但额外消耗对应值×25％的魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
		elseif jn == "造化" then --无图标
		jns[1] = "使用灵宝后，下回合你至少出现3枚符咒。"
		jns[10]="jpg"
		elseif jn == "碎甲" then
		jns[1] = "你的碎甲符首回合提高100％，每回合降低20％，但具有6回合的冷却时间。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF701C5B5
		jns[8] = 0xF701C5B5
		elseif jn == "摧心" then
		jns[1] = "本回合被你法术攻击命中过的敌方单位死亡后，会在之后的3回合内进入虚弱状态:降低12%的伤害力、法术伤害力、法术防御和物理防御。(效果可刷新，不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF2BAFEF2
		jns[8] = 0xF2BAFEF2
		elseif jn == "五雷·挪移" then --无图标
		jns[1] = "凝神而动，随机使用一种雷法强化自身。你获得以下效果，持续6回合:1)五雷正法获得对应雷法2枚符咒的强化效果;2)对应雷法在持续时间内无法使用。"
		jns[2] = "【条件】仅能在5枚符咒时使用【消耗】50点魔法"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "五雷正宗" then --无图标
		jns[1] = "增加40点法术暴击等级，获得五雷正宗称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns













	elseif lp == "绝代妖娆" then-- 女儿村
		if jn == "独尊" then --无图标
		jns[1] = "你的自矜触发几率增加至100％，但你的暗器附加毒的几率减少4％。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x22A77A43
		jns[8] = 0x22A77A43
		elseif jn == "暗伤" then
		jns[1] = "与NPC战斗时，雨落寒沙和子母神针增加（武器伤害×18％）的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x50E3D938
		jns[8] = 0x50E3D938
		elseif jn == "重明" then --无图标
		jns[1] = "自矜状态下使用单体封印法术命中目标时，有50％几率补清空该状态，但你的暗器附加毒的几率减少4％。"
		jns[10]="jpg"
		elseif jn == "倩影" then
		jns[1] = "每回合开始时自动回复初始速度与当前速度差值的12％。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86C6B8EF
		jns[8] = 0x86C6B8EF
		elseif jn == "花舞" then
		jns[1] = "提高自身（4％+20）的初始速度。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD5669AE4
		jns[8] = 0xD5669AE4
		elseif jn == "风行" then --无图标
		jns[1] = "进入战斗后，队伍中所有玩家单位的速度增加8点。"
		jns[10]="jpg"
		elseif jn == "傲娇" then
		jns[1] = "使用特技时，愤怒消耗减少4点。使用笑里藏刀时，愤怒消耗额外减少4点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x53DABF54
		jns[8] = 0x53DABF54
		elseif jn == "花护" then
		jns[1] = "使用水清诀、冰清诀、晶清诀、玉清诀时，愤怒消耗减少8点，并且可以使目标抵抗封印类法术的能力提高50％，持续1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC412A4C0
		jns[8] = 0xC412A4C0
		elseif jn == "空灵" then --无图标
		jns[1] = "使用特技后，自身抵抗封印几率临时增加14％，持续2回合。（状态可刷新，不可叠加）"
		jns[10]="jpg"
		elseif jn == "叶护" then --无图标
		jns[1] = "自身速度高于同队其他玩家时，受到的所有伤害降低2％。"
		jns[10]="jpg"
		elseif jn == "国色" then
		jns[1] = "自身携带的速度≥（召唤兽等级×5）的召唤兽进入战斗时速度提高12％。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0D719443
		jns[8] = 0x0D719443
		elseif jn == "轻霜" then
		jns[1] = "任何企图攻击你的敌方（包括对你施放封印、诅咒类法术）都有30％几率在攻击时受到毒的影响：每回合损失（毒经技能等级×3）的气血，持续4回合，该状态不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x848E3B4F
		jns[8] = 0x848E3B4F
		elseif jn == "抑怒" then --无图标
		jns[1] = "娉婷袅娜的命中率增加10％，同时增加10％的命中上限。"
		jns[10]="jpg"
		elseif jn == "机巧" then
		jns[1] = "每次你的封印导致敌方行动失效（死亡不算），敌方会受到毒的影响，每回合损失毒经技能等级×3的气血，持续4回合，该状态不可叠加。（仅封印回合有效）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE6EF1BBC
		jns[8] = 0xE6EF1BBC
		elseif jn == "毒雾" then
		jns[1] = "使用封印技能时，有30％几率使目标中暗器毒。"
		jns[10]="jpg"
		elseif jn == "嫣然" then
		jns[1] = "一笑倾城对首目标的命中几率增加8％。对每个目标的持续回合40％的几率提高1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x463DBA13
		jns[8] = 0x463DBA13
		elseif jn == "磐石" then
		jns[1] = "一个回合中，受到一个目标的伤害后，之后每次所受其他目标的伤害会递减55点。(按攻击目标算，一个人攻击多次只计算一次)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4F264E2A
		jns[8] = 0x4F264E2A
		elseif jn == "倾国" then --无图标
		jns[1] = "一笑倾城对所有目标的命中率增加8％，但有8回合冷却时间。"
		jns[3] = 8
		jns[6] = "wzife.wdf"
		jns[7] = 594113044
		jns[8] = 3862994147
		elseif jn == "碎玉弄影" then
		jns[1] = "“宁为玉碎，不为瓦全”，又有多少敌方可以从女儿村弟子曼妙的舞姿身影中体味那一份决绝呢？连续对敌方使用2次似玉生香。"
		jns[3] = 4
		jns[4] = "40点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0x347D755D
		jns[8] = 0x347D755D
		jns[12] = "5回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点封印命中等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "绝代妖娆" then --无图标
		jns[1] = "增加40点封印命中等级，获得绝代妖娆称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "花雨伊人" then-- 女儿村
		if jn == "涂毒" then --无图标
		jns[1] = "敌方没有任何单位带有暗器毒时，使用暗器时攻击使敌方中毒几率增加6%;你的封印命中率下降10%。"
		jns[10]="jpg"
		elseif jn == "杏花" then
		jns[1] = "使用暗器时攻击时敌方中毒几率增加4%。并且你的暗器毒能对带有“高级毒”的单位起效(但命中率降低50%)﹔你的封印命中率会下降10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x30B186DD
		jns[8] = 0x30B186DD
		elseif jn == "暗伤" then
		jns[1] = "与NPC战斗时，雨落寒沙和子母神针增加(武器伤害×18%)的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x50E3D938
		jns[8] = 0x50E3D938
		elseif jn == "淬芒" then
		jns[1] = "每一次你使敌方中暗器毒，都可以为自己增加8%的封印命中率，效果持续3回合。(上限为16%，回合数可被刷新)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x20661796
		jns[8] = 0x20661796
		elseif jn == "花舞" then
		jns[1] = "提高自身(4%+20)的初始速度。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD5669AE4
		jns[8] = 0xD5669AE4
		elseif jn == "暗刃" then --无图标
		jns[1] = "对带有暗器毒的玩家单位，造成的暗器伤害提高18%。"
		jns[10]="jpg"
		elseif jn == "傲娇" then
		jns[1] = "使用特技时，愤怒消耗减少4点。使用笑里藏刀时，愤怒消耗额外减少4点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x53DABF54
		jns[8] = 0x53DABF54
		elseif jn == "花护" then
		jns[1] = "使用水清诀、冰清诀、晶清诀、玉清诀时，愤怒消耗减少8点，并且可以使目标抵抗封印类术的能力提高50%，持续1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC412A4C0
		jns[8] = 0xC412A4C0
		elseif jn == "天香" then
		jns[1] = "每次使敌方中暗器毒，你回复6点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2AD7F908
		jns[8] = 0x2AD7F908
		elseif jn == "轻霜" then
		jns[1] = "任何企图攻击你的敌方(包括对你施放封印、诅咒类法术)都有30%几率在攻击时受到毒的影响:每回合损失(毒经技能等级×3)的气血，持续4回合，该状态不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x848E3B4F
		jns[8] = 0x848E3B4F
		elseif jn == "鸿影" then
		jns[1] = "若处于被封印状态，你的暗器对玩家单位造成的伤害增加(武器伤害×60%) ."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x25260F44
		jns[8] = 0x25260F44
		elseif jn == "百花" then --无图标
		jns[1] = "雨落寒沙有9%几率额外作用3人。"
		jns[10]="jpg"
		elseif jn == "毒雾" then --无图标
		jns[1] = "使用封印法术时，有30%几率使目标中暗器毒。"

		jns[10]="jpg"
		elseif jn == "毒引" then
		jns[1] = "敌方主动解除由女儿村弟子产生的毒时，会额外受到600点气血损失，但最低将敌方气血降为1点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x57BD8D19
		jns[8] = 0x57BD8D19
		elseif jn == "余韵" then
		jns[1] = "带有你的暗器毒的单位，每回合额外减少30点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8009DFB1
		jns[8] = 0x8009DFB1
		elseif jn == "磐石" then
		jns[1] = "一个回合中，受到一个目标的伤害后，之后每次所受其他目标的伤害会递减55点。(按攻击目标算，一个人攻击多次只计算一次)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4F264E2A
		jns[8] = 0x4F264E2A
		elseif jn == "飞花" then --无图标
		jns[1] = "飞花摘叶吸取魔法的效果提高200%，但具有8回合冷却。"
		jns[10]="jpg"
		elseif jn == "花殇" then
		jns[1] = "飞花摘叶作用人数增加6。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3590A7E4
		jns[8] = 0x3590A7E4

		elseif jn == "鸿渐于陆" then
		jns[1] = "伤其十指，不如断其一指，必要的时刻可町以将伤害凝聚起来,给予敌方一次致命的攻击。附加(武器伤害×130%)的伤害，对敌方单体进行暗器攻击，使目标100%几率中暗器每。"
		jns[2] = "【消耗】100点魔法 【冷却】4回合 "
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x18D93692
		jns[8] = 0x18D93692
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点抵抗封印等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "花雨伊人" then --无图标
		jns[1] = "增加40点抵抗封印等级，获得花雨伊人称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "花间美人" then-- 女儿村
		if jn == "花刺" then --无图标
		jns[1] = "“自矜”追加的伤害提高20%。"
		jns[10]="jpg"
		elseif jn == "花骨" then --无图标
		jns[1] = "进入战斗和攻击击飞目标后，获得“自矜”状态。"
		jns[10]="jpg"
		elseif jn == "汹涌" then --无图标
		jns[1] = "“自矜”触发几率增加15%。"
		jns[10]="jpg"
		elseif jn == "花落" then --无图标
		jns[1] = "葬玉焚花的伤害结果提高4%。"
		jns[10]="jpg"
		elseif jn == "花开" then --无图标
		jns[1] = "当前气血≥90%时，造成的物理伤害提高3%。"
		jns[10]="jpg"
		elseif jn == "花雨" then --无图标
		jns[1] = "使用满天花雨时，附加毒的几率增加5%。"
		jns[10]="jpg"
		elseif jn == "毒芒" then --无图标
		jns[1] = "对带由女儿村弟子产生的毒的目标，葬玉焚花造成伤害提高8%。"
		jns[10]="jpg"
		elseif jn == "追毒" then --无图标
		jns[1] = "对带由女儿村弟子产生的毒的目标，自矜追加伤害提高12%。"
		jns[10]="jpg"
		elseif jn == "曼珠" then --无图标
		jns[1] = "佩戴“曼陀罗”时，触发自矜的几率增加20%。"
		jns[10]="jpg"
		elseif jn == "清澈" then --无图标
		jns[1] = "“自矜”状态下，抵抗封印能力增加10%。"
		jns[10]="jpg"
		elseif jn == "轻刃" then --无图标
		jns[1] = "使用特技破碎无双有100%几率获得自矜状态。"
		jns[10]="jpg"
		elseif jn == "怒放" then --无图标
		jns[1] = "进入“自矜”状态时，额外回复6点愤"
		jns[10]="jpg"
		elseif jn == "驯宠" then --无图标
		jns[1] = "葬玉焚花攻击召唤兽和召唤物时，伤害结果提高12%。"
		jns[10]="jpg"
		elseif jn == "乘胜" then --无图标
		jns[1] = "对气血≤30%的单位，追加攻击造成的伤害提高10%"
		jns[10]="jpg"
		elseif jn == "痴念" then --无图标
		jns[1] = "满天花雨对神佑过的召唤兽和召唤物伤害结果提高20%。"
		jns[10]="jpg"
		elseif jn == "磐石" then
		jns[1] = "一个回合中，受到一个目标的伤害后，之后每次所受其他目标的伤害会递减55点。(按攻击目标算，一个人攻击多次只计算一次)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4F264E2A
		jns[8] = 0x4F264E2A
		elseif jn == "轻霜" then
		jns[1] = "任何企图攻击你的敌方(包括对你施放封印、诅咒类法术)都有30%几率在攻击时受到毒的影响:每回合损失(毒经技能等级×3)的气血，持续4回合，该状态不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x848E3B4F
		jns[8] = 0x848E3B4F
		elseif jn == "毒引" then
		jns[1] = "敌方主动解除由女儿村弟子产生的毒时，会额外受到600点气血损失，但最低将敌方气血降为1点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x57BD8D19
		jns[8] = 0x57BD8D19
		elseif jn == "花谢花飞" then --无图标
		jns[1] = "连续使用2次满天花雨攻击目标。"
		jns[2] = "【消耗】100点魔法 【冷却】16回合，战斗开始时具有8回合冷却"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "花间美人" then --无图标
		jns[1] = "增加40点伤害，获得花间美人称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns











	elseif lp == "镇妖神使" then-- 天宫
		if jn == "威吓" then
		jns[1] = "五雷轰]顶成功时造成的伤害比例在基础上增加8%并且目标本回合内不再增加愤怒值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4E4ECD7C
		jns[8] = 0x4E4ECD7C
		elseif jn == "疾雷" then
		jns[1] = "使用天雷斩攻击NPC时，额外增加0.6×(敏捷点数-人物等级)的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x67324D63
		jns[8] = 0x67324D63
		elseif jn == "轰鸣" then --无图标
		jns[1] = "使用五雷轰顶成功时，使目标减少(等级×1.6)点物理防御，持续3回合。(效果不可叠加和刷新)"
		jns[10]="jpg"
		elseif jn == "趁虚" then
		jns[1] = "使用特技之后，封印命中率增加8%，持续3回合。(效果可刷新，不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x54E910DB
		jns[8] = 0x54E910DB
		elseif jn == "余韵" then
		jns[1] = "魔兽之印、河东狮吼、圣灵之甲、碎甲术、停陷术、啸风诀的效果提高50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8009DFB1
		jns[8] = 0x8009DFB1
		elseif jn == "缭乱" then--无图标
		jns[1] = "使用错乱后，你的下个镇妖有30%几率额外作用1个单位。"
		jns[10]="jpg"
		elseif jn == "震慑" then
		jns[1] = "使用错乱成功封印目标后，使目标同时附有掌心雷的封印效果；但你的法术伤害力降低10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC5CB9BBB
		jns[8] = 0xC5CB9BBB
		elseif jn == "神念" then
		jns[1] = "使用法宝时，额外回复10点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA79CD890
		jns[8] = 0xA79CD890
		elseif jn == "藏招" then--无图标
		jns[1] = "你的掌心雷额外作用1个单位。"
		jns[10]="jpg"
		elseif jn == "苏醒" then
		jns[1] = "在一回合内掉血量达到自身气血上限的30%，回合结束时自动移除自身封印类异常状态，自身死亡时不生效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8EF7B06
		jns[8] = 0xC8EF7B06
		elseif jn == "护佑" then
		jns[1] = "增加50点防御力及法术防御力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFEAD9161
		jns[8] = 0xFEAD9161
		elseif jn == "坚壁" then--无图标
		jns[1] = "战斗中首次使用“苍白纸人”和“混元伞”时，持续回合增加1。"
		jns[10]="jpg"
		elseif jn == "月桂" then
		jns[1] = "增加(武器伤害×12%)的封印命中等级，但不再增加法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x71D17EEA
		jns[8] = 0x71D17EEA
		elseif jn == "怒火" then
		jns[1] = "当因气血损失而回复≥10的愤怒时，可以额外回复4点愤怒"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x58B7E9CB
		jns[8] = 0x58B7E9CB
		elseif jn == "套索" then--无图标
		jns[1] = "你的“金刚镯”额外使目标造成的物理伤害降低10%，且持续回合增加1回合。"
		jns[10]="jpg"
		elseif jn == "神律" then
		jns[1] = "天神护体法防效果提高100%，额外增加(云雷步等级×0.3)的速度，但不再增加法伤。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEA46BD71
		jns[8] = 0xEA46BD71
		elseif jn == "神尊" then--无图标
		jns[1] = "你的天神护体额外增加物理防御，效果和法防相同，但不再增加法伤。"
		jns[10]="jpg"
		elseif jn == "洞察" then
		jns[1] = "你的知己知彼额外增加(自身等级×2)的伤害、防御、法伤、法防、封印等级、抗封等级，持续3回合。(效果可刷新，不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8660A7C9
		jns[8] = 0x8660A7C9
		elseif jn == "画地为牢" then
		jns[1] = "天宫弟子随手布下的囚牢，却是无数穷凶极恶之徒的饮恨之所。对敌方使用后，降低敌方1个单位18%的抵抗封印能力以及24%的封印能力，持续5回合.【消耗】50点魔法【冷却】5回合"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAF731FA
		jns[8] = 0xBAF731FA
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点封印命中等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "镇妖神使" then --无图标
		jns[1] = "增加40点封印命中等级，获得镇妖神使称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "踏雷天尊" then-- 天宫
		if jn == "频变" then --无图标
		jns[1] = "“电芒”持续回合增加1。"
		jns[10]="jpg"
		elseif jn == "威吓" then --无图标
		jns[1] = "五雷轰顶成功时造成的伤害比例在基础上增加8%并且目标本回合内不再增加愤怒值。"
		jns[10]="jpg"
		elseif jn == "惊曜" then --无图标
		jns[1] = "带有“电芒”的单位再次受到雷霆万钧攻击时，额外受到的伤害增加至10%。"
		jns[10]="jpg"
		elseif jn == "震荡" then --无图标
		jns[1] = "攻击带有来自你“电芒”的单位时，增加80点法术伤害力。"
		jns[10]="jpg"
		elseif jn == "轰鸣" then
		jns[1] = "混天术≥人物等级时，你增加60点法术伤害力。"
		jns[10]="jpg"
		elseif jn == "驭意" then
		jns[1] = "增加自身(魔力属性点×5%)的速度、(魔力属性点×10%)的法术伤害力、减少(魔力属性点×24%)的法术防御力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2CBA65C0
		jns[8] = 0x2CBA65C0
		elseif jn == "电掣" then --无图标
		jns[1] = "对召唤兽造成的伤害提高15%。"
		jns[10]="jpg"
		elseif jn == "神念" then
		jns[1] = "使用法宝时，额外回复10点愤怒."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA79CD890
		jns[8] = 0xA79CD890
		elseif jn == "伏魔" then
		jns[1] = "伏魔天书的效果提高50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D54F95D
		jns[8] = 0x7D54F95D
		elseif jn == "雷霆汹涌" then --无图标
		jns[1] = "【被动】你的雷霆万钧不再会消耗“天雷灌注”"
		jns[2] = "【主动】消耗“天雷灌注”对6个目标进行法术攻击。【消耗】作用人数×35点魔法"
		jns[10]="jpg"
		elseif jn == "苏醒" then
		jns[1] = "在一回合内掉血量达到自身气血上限的30%，回合结束时自动移除自身封印类异常状态，自身死亡时不生效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8EF7B06
		jns[8] = 0xC8EF7B06
		elseif jn == "天劫" then
		jns[1] = "“天雷灌注”可以叠加3层。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11DBB164
		jns[8] = 0x11DBB164
		elseif jn == "怒电" then --无图标
		jns[1] = "使用原始愤怒消耗≥120点的特技后，有50%几率使你的下一个“雷霆万钧”额外作用1个单位。"
		jns[10]="jpg"
		elseif jn == "共鸣" then --无图标
		jns[1] = "你的召唤兽使用的奔雷咒和雷击伤害提高10%."
		jns[10]="jpg"
		elseif jn == "灵光" then
		jns[1] = "装备上的宝石舍利子效果提高25%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9571F0A2
		jns[8] = 0x9571F0A2

		elseif jn == "洞察" then
		jns[1] = "你的知己知彼额外增加(自身等级×2)的伤害、防御、法伤、法防、封印等级、抗封等级，持续3回合。(效果可刷新，不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8660A7C9
		jns[8] = 0x8660A7C9
		elseif jn == "仙音" then --无图标
		jns[1] = "琴音三叠对带有“电芒”的单位额外造成16%的伤害。"
		jns[10]="jpg"
		elseif jn == "雷波" then --无图标
		jns[1] = "雷霆万钧对首目标造成的伤害提高8%,带有“电芒”的非召唤物单位死亡时，所有敌方存活单位附加“电芒”效果。"

		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA7603CC9
		jns[8] = 0xA7603CC9
		elseif jn == "风雷韵动" then
		jns[1] = "以法术攻击敌方单体目标，造成110%的法术伤害。对带有“电芒”的单位额外提高40%(80%)的伤害。(括号内为与NPC战斗时的效果)"
		jns[2] = "【消耗】60点魔法，10点愤怒"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x169010C9
		jns[8] = 0x169010C9
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点法术伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "踏雷天尊" then --无图标
		jns[1] = "增加40点法术伤害，获得踏雷天尊称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns



	elseif lp == "霹雳真君" then-- 天宫
		if jn == "霆震" then --无图标
		jns[1] = "造成的伤害提高（6-霹雳弦惊或雷怒霆激剩余回合数)×1%。"
		jns[10]="jpg"
		elseif jn == "疾雷" then --无图标
		jns[1] = "使用天雷斩攻击NPC时，额外增加0.6×(敏捷点数-人物等级)的伤害力。"
		jns[10]="jpg"
		elseif jn == "激越" then --无图标
		jns[1] = "―“霹雳弦惊”和“雷怒霆激”持续时间减少2回合，但持续回合内你造成的物理伤害提高12%"
		jns[10]="jpg"
		elseif jn == "存雄" then --无图标
		jns[1] = "使用特技后，造成的物理伤害提高10%，持续3回合。(效果可刷新，不可叠加)"
		jns[10]="jpg"
		elseif jn == "余韵" then
		jns[1] = "魔兽之印、河东狮吼、圣灵之甲、碎甲术、停陷术、啸风诀的效果提高50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8009DFB1
		jns[8] = 0x8009DFB1
		elseif jn == "慨叹" then --无图标
		jns[1] = "破碎无双伤害提高40%"
		jns[10]="jpg"
		elseif jn == "电掣" then --无图标
		jns[1] = "对召唤兽造成的伤害提高15%。"
		jns[10]="jpg"
		elseif jn == "伏魔" then
		jns[1] = "伏魔天书的效果提高50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D54F95D
		jns[8] = 0x7D54F95D
		elseif jn == "惊霆" then --无图标
		jns[1] = "进入战斗时，获得4回合“霹雳弦惊”状态。"
		jns[10]="jpg"
		elseif jn == "雷吞" then
		jns[1] = "圣脉介绍:自身武器或者衣服五行为金时，使用“天雷灌注”时额外获得1层。(可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11DBB164
		jns[8] = 0x11DBB164
		elseif jn == "苏醒" then
		jns[1] = "在一回合内掉血量达到自身气血上限的30%，回合结束时自动移除自身封印类异常状态，自身死亡时不生效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8EF7B06
		jns[8] = 0xC8EF7B06
		elseif jn == "电光火石" then --无图标
		jns[1] = "使用后同时获得“霹雳弦惊”和“雷怒霆激”状态。【消耗】140点魔法【冷却】战斗开始时具有9回合冷却，死亡后冷却重置为9回合"
		jns[10]="jpg"
		elseif jn == "神采" then --无图标
		jns[1] = "气血≥70%时，造成的伤害提高5%。"
		jns[10]="jpg"
		elseif jn == "劲健" then --无图标
		jns[1] = "增加50点伤害力。"
		jns[10]="jpg"
		elseif jn == "啸傲" then --无图标
		jns[1] = "使用霹雳弦惊或雷怒霆激后，增加15点伤害力，持续到战斗结束，最多叠加20次。"
		jns[10]="jpg"
		elseif jn == "神律" then
		jns[1] = "天神护体法防效果提高100%，额外增加(云霄步等级×0.3)的速度，但不再增加法伤。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEA46BD71
		jns[8] = 0xEA46BD71
		elseif jn == "气势" then --无图标
		jns[1] = "战斗中首次主动使用的“霹雳弦惊”和“雷怒激”持续回合提高50%。(分别计算)"
		jns[10]="jpg"

		elseif jn == "洞察" then
		jns[1] = "你的知己知彼额外增加(自身等级×2)的伤害、防御、法伤、法防、封印等级、抗封等级，持续3回合。(效果可刷新，不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8660A7C9
		jns[8] = 0x8660A7C9
		elseif jn == "威仪九霄" then --无图标
		jns[1] = "【被动】每回合开始时，威仪九霄的伤害倍率增加3%，魔法消耗增加100点(最多叠加30次);【主动】对所有目标造成10%的物理伤害，使用后清空叠加次数。"
		jns[2] = "【消耗】30点魔法【冷却】6回合，进入战斗冷却3回合"
		jns[10]="jpg"

		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "霹雳真君" then --无图标
		jns[1] = "增加40点伤害，获得霹雳真君称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


















	elseif lp == "莲台仙子" then-- 普陀
		if jn == "推衍" then
		jns[1] = "与NPC战斗时，增加50点五行法术伤害和40点治疗能力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D712683
		jns[8] = 0x7D712683
		elseif jn == "化戈" then
		jns[1] = "普渡众生气血回复效果增加(武器伤害x18%)."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FE4B9FF
		jns[8] = 0x8FE4B9FF
		elseif jn == "普照" then--无图标
		jns[1] = "每有一个本方单位带有“普渡众生”，你增加15点防御和法术防御。"
		jns[10]="jpg"
		elseif jn == "莲花心音" then
		jns[1] = "普陀弟子以莲花苞为躯，引魂入体，则可以复活在战斗中死亡的鬼魂幻兽。复活场上—个处于死亡状态的鬼魂宠，被复活目标获得60%的气血上限与当前48%的魔法。【消耗】60点魔法"
		jns[3] = 3
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x07DEBF4F
		jns[8] = 0x07DEBF4F
		elseif jn == "静心" then--无图标
		jns[1] = "本方玩家单位抵抗封印几率增加3%。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "慈佑" then--无图标
		jns[1] = "若召唤兽带有来自你的“普渡众生”，其受到的伤害降低12%。"
		jns[10]="jpg"
		elseif jn == "劳心" then
		jns[1] = "当前气血≤(气血上限×30%)时，使用普渡众生或杨柳甘露带来的气血回复效果额外提高100%，当回合与首选目标有效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x00B8064E
		jns[8] = 0x00B8064E
		elseif jn == "普渡" then
		jns[1] = "法宝“普渡”基础几率增加20%且“普渡”会对紧箍咒起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9110FB84
		jns[8] = 0x9110FB84
		elseif jn == "度厄" then--无图标
		jns[1] = "本方没有单位带有“普渡众生”时，触发“普渡”时作用目标增加1。"
		jns[10]="jpg"
		elseif jn == "甘露" then
		jns[1] = "成功对目标使用杨柳甘露时，有50%的几率附带“普渡众生”4回合。触发提前复活“锢魂术”与“死亡召唤”目标的效果时，触发几率提增加100%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAF6FDE97
		jns[8] = 0xAF6FDE97
		elseif jn == "清净" then--无图标
		jns[1] = "你的颠倒五行额外附带效果“清净”：增加30%抵抗封印类法术的能力，持续2回合。"
		jns[10]="jpg"
		elseif jn == "莲动" then--无图标
		jns[1] = "每场战斗第—个杨柳甘露的恢复效果提高300%。"
		jns[10]="jpg"
		elseif jn == "法华" then--无图标
		jns[1] = "灵动九天额外增加100点法伤，但不再增加法防，且作用人数变为1."
		jns[10]="jpg"
		elseif jn == "灵动" then
		jns[1] = "灵动九天效果增加30点，持续回合数增加2。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4DCD5F44
		jns[8] = 0x4DCD5F44
		elseif jn == "感念" then--无图标
		jns[1] = "本方每有一个单位带有“普渡众生”，灵动九天额外作用1个单位。"
		jns[10]="jpg"
		elseif jn == "玉帛" then
		jns[1] = "护法金刚技能所加伤害的8%转化为普渡众生气血回复效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA96E7A76
		jns[8] = 0xA96E7A76
		elseif jn == "雨润" then
		jns[1] = "当本方玩家单位的“普渡众生”被驱散时，目标获得当前气血回复，效果等同于自在心法结算效果的80%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4290BCBB
		jns[8] = 0x4290BCBB
		elseif jn == "道衍" then
		jns[1] = "队伍中只有—个普陀山弟子时：你的自在心法效果提高(N×6%)，并为目标附加─个持续N回合的“普度众生”，N为我方带有“普度众生”的单位数。(回合数不超过8)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCE18F021
		jns[8] = 0xCE18F021
		elseif jn == "波澜不惊" then
		jns[1] = "普陀山弟子由于精通五行造化，方可布下这吸收一切伤害的结界阵法。为目标吸收受到的前4次攻击的伤害，持续2回合；并且将吸收的伤害转化为目标的当前气血回复，最高可吸收（(普度众生首回合治疗量×2)点气血伤害。这亦是五行学派的不传之秘，只有核心弟子方能习得。【消耗】60点魔法"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAED0F931
		jns[8] = 0xAED0F931
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点法术防御。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "莲台仙子" then --无图标
		jns[1] = "增加80点法术防御，获得莲台仙子称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end

		return jns





	elseif lp == "五行咒师" then-- 普陀
		if jn == "庄严" then --无图标
		jns[1] = "敌方每有一个单位带有“紧箍咒”，你增加15点防御和法术防御。"
		jns[10]="jpg"
		elseif jn == "借灵" then
		jns[1] = "武器伤害的24%转化为五行法术伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9C0D1C5B
		jns[8] = 0x9C0D1C5B
		elseif jn == "推衍" then
		jns[1] = "与NPC战斗时，增加50点五行法术伤害和40点治疗能力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D712683
		jns[8] = 0x7D712683
		elseif jn == "默诵" then
		jns[1] = "紧箍咒造成的基础伤害加倍且受固定伤害能力影响，造成的伤害100%不会产生愤怒，同时额外每回合减少目标6点愤怒，持续时间增加3回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6AB318F7
		jns[8] = 0x6AB318F7
		elseif jn == "莲花心音" then
		jns[1] = "普陀弟子以莲花苞为躯，引魂入体，则可以复活在战斗中死亡的鬼魂幻兽。复活场上—个处于死亡状态的鬼魂宠，被复活目标获得60%的气血上限与当前48%的魔法。【消耗】60点魔法"
		jns[3] = 3
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x07DEBF4F
		jns[8] = 0x07DEBF4F
		elseif jn == "静心" then--无图标
		jns[1] = "本方玩家单位抵抗封印几率增加3%。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "赐咒" then--无图标
		jns[1] = "敌方没有单位带有“紧箍咒”时，你的紧箍咒有54%几率额外随机作用1个单位。"
		jns[10]="jpg"
		elseif jn == "普渡" then
		jns[1] = "法宝“普渡”基础几率增加20%且“普渡”会对紧箍咒起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9110FB84
		jns[8] = 0x9110FB84
		elseif jn == "慧眼" then--无图标
		jns[1] = "五行法术克制召唤兽五行时，伤害增加60%且有60%几率使其本回合无法使用物理和法术攻击。"
		jns[10]="jpg"
		elseif jn == "无怖" then--无图标
		jns[1] = "如果你的紧箍咒导致目标死亡，目标有35%几率公开自己的防御五行。"
		jns[10]="jpg"
		elseif jn == "清净" then--无图标
		jns[1] = "你的颠倒五行额外附带效果“清净”：增加30%抵抗封印类法术的能力，持续2回合。"
		jns[10]="jpg"
		elseif jn == "秘术" then
		jns[1] = "使用五行法术时，若目标气血上限被降低至0则立即死亡，当回合不能被复活。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF109AB4C
		jns[8] = 0xF109AB4C
		elseif jn == "感念" then--无图标
		jns[1] = "本方每有一个单位带有“紧箍咒”，灵动九天额外作用1个单位。"
		jns[10]="jpg"
		elseif jn == "莲心剑意" then
		jns[1] = "使用此法术后进入进攻状态，增加（法术修炼等级*3%)的固定伤害结果(只对首目标有效)，降低10%的回复效果。(再次使用此技能进入正常状态)"
		jns[3] = 2
		jns[4] = "30点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xC2D6BBD3
		jns[8] = 0xC2D6BBD3
		elseif jn == "灵动" then
		jns[1] = "灵动九天效果增加30点，持续回合数增加2。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4DCD5F44
		jns[8] = 0x4DCD5F44
		elseif jn == "道衍" then
		jns[1] = "队伍中只有一个普陀山弟子时:你的自在心法效果提高(N×6%)，并为目标附加—个持续N回合的“普度众生”，N为我方带有“普度众生”的单位数;处于“莲心剑意”状态下时，N额外计算对方带有“紧箍咒”的单位数。(回合数不超过8)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCE18F021
		jns[8] = 0xCE18F021
		elseif jn == "缘起" then --无图标
		jns[1] = "队伍中只有—个普陀山弟子时:五行法术有(敌方带有“紧箍咒”单位数量×8%)几率额外施放1次。"
		jns[10]="jpg"
		elseif jn == "法咒" then
		jns[1] = "五行法术有15%的几率对目标造成1.5倍的暴击效果;“莲心剑意”状态下，首目标触发率增加至40%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2A398778
		jns[8] = 0x2A398778
		elseif jn == "五行制化" then
		jns[1] = "普陀弟子可以在临敌之际运用五行之力，其所耗不过一个手印口诀，而随之而来的自然生克之力却往往令人绝望。你的“颠倒五行”获得下述加成:1)法术躲避率增加15%;2)带有该状态的单位不会被五行克制;3）持续回合数增加3。"
		jns[6] = "wzife.wd2"
		jns[7] = 0xF46EB09D
		jns[8] = 0xF46EB09D

		elseif jn == "额外能力" then --无图标
		jns[1] = "增加30点速度。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "五行咒师" then --无图标
		jns[1] = "增加30点速度，获得五行咒师称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "落伽神女" then-- 普陀
		if jn == "湛然" then --无图标
		jns[1] = "五行珠数量=5时，回合结束时，有40%几率进入“剑意莲心”状态。"
		jns[10]="jpg"
		elseif jn == "因缘" then --无图标
		jns[1] = "五行攻击克制目标五行时，造成的伤害提高5%."
		jns[10]="jpg"
		elseif jn == "莲音" then --无图标
		jns[1] = "使用剑意莲心后，有50%几率使你造成的物理伤害提高20%，持续3回合。"
		jns[10]="jpg"
		elseif jn == "安忍" then --无图标
		jns[1] = "受到伤害降低(当前五行珠数量*1%)。"
		jns[10]="jpg"
		elseif jn == "静心" then--无图标
		jns[1] = "本方玩家单位抵抗封印几率增加3%。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "低眉" then--无图标
		jns[1] = "“剑意莲心”状态下，受到的伤害降低5%。"
		jns[10]="jpg"
		elseif jn == "顿悟" then--无图标
		jns[1] = "获得五行珠后，额外回复(当前五行珠数量)的愤怒。"
		jns[10]="jpg"
		elseif jn == "怒目" then--无图标
		jns[1] = "“剑意莲心”状态下，破血狂攻、破碎无双造成伤害提高16%。"
		jns[10]="jpg"
		elseif jn == "馀威" then--无图标
		jns[1] = "退出“剑意莲心”状态时，回复15点愤怒。"
		jns[10]="jpg"
		elseif jn == "清净" then--无图标
		jns[1] = "你的颠倒五行额外附带效果“清净”：增加30%抵抗封印类法术的能力，持续2回合。"
		jns[10]="jpg"
		elseif jn == "业障" then--无图标
		jns[1] = "对召唤兽造成的伤害提高20%。"
		jns[10]="jpg"
		elseif jn == "困兽" then--无图标
		jns[1] = "如果你的五行攻击克制目标五行且导致目标死亡，目标本回合将无法被复活。"
		jns[10]="jpg"

		elseif jn == "无尽" then--无图标
		jns[1] = "每次获得五行珠后，增加8点伤害力，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "抖擞" then--无图标
		jns[1] = "增加(力量点数×10%+40)的伤害力。"
		jns[10]="jpg"
		elseif jn == "莲华" then--无图标
		jns[1] = "“剑意莲心”状态下，增加150点伤害力。"
		jns[10]="jpg"
		elseif jn == "相生" then--无图标
		jns[1] = "五行珠数量≥3时，获得五行珠的几率提高50%。"
		jns[10]="jpg"
		elseif jn == "智念" then--无图标
		jns[1] = "每8回合,获得1枚五行珠。"
		jns[10]="jpg"
		elseif jn == "执念" then--无图标
		jns[1] = "五行珠数量=0时，五行攻击必定获得五行珠。"
		jns[10]="jpg"
		elseif jn == "万象" then--无图标
		jns[1] = "你的“颠倒五行”对自己释放时，获得以下效果:1）克制目标五行时，造成伤害提高8%;2)法术躲避率增加15%;3）持续回合增加（(当前五行珠数量)。"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "落伽神女" then --无图标
		jns[1] = "增加40点伤害，获得落伽神女称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns













	elseif lp == "风华舞圣" then-- 盘丝

		if jn == "粘附" then
		jns[1] = "与NPC战斗时，若自身敏捷≥等级×3或力量≥等级×3，增加(武器伤害×18%)的天罗地网伤害，且普通攻击和特技对带有你天罗地网的敌方单位造成的物理伤害提高50%."
		jns[10]="jpg"
		elseif jn == "妖气" then
		jns[1] = "增加(武器伤害×12%)的封印命中等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB3956495
		jns[8] = 0xB3956495
		elseif jn == "怜心" then
		jns[1] = "姐妹同心的命中率增加12%，效果增加10%。队伍中只有一个盘丝洞弟子时：每场战斗的第—次姐妹同心必中。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x38D87BEB
		jns[8] = 0x38D87BEB
		elseif jn == "迷瘴" then
		jns[1] = "天罗地网异常状态命中本增加20%，同时增加10%的命中率上限；且额外减少目标5%速度、(等级×1.5)的伤害力、法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x661970E1
		jns[8] = 0x661970E1
		elseif jn == "鼓乐" then
		jns[1] = "魔音摄魂的命中率增加20%，同时增加10%的命中率上限。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC17A7A56
		jns[8] = 0xC17A7A56
		elseif jn == "魔音" then--无图标
		jns[1] = "受到处于“魔音摄魂”状态单位的伤害降低18%。"
		jns[10]="jpg"
		elseif jn == "玲珑" then--无图标
		jns[1] = "“忘情”额外增加效果：受到伤害时，有30%几率减少12%伤害并回复自身10点愤怒。(触融发时消耗1点灵气)"
		jns[10]="jpg"
		elseif jn == "安抚" then
		jns[1] = "回合结束时，每个带有你的“含情脉脉”“魔音摄魂”状态的单位会为你回复4点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x756CE723
		jns[8] = 0x756CE723
		elseif jn == "丹香" then--无图标
		jns[1] = "使用三级药品后，回复2点愤怒。"
		jns[10]="jpg"
		elseif jn == "迷梦" then
		jns[1] = "每当你被他人封印或封印他人时，若敌方未带有“瘴气”效果，则60%几率对其附加“瘴气”效果。(需已习得瘴气法术)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA9AF30
		jns[8] = 0xBAA9AF30
		elseif jn == "忘川" then
		jns[1] = "你的“瘴气”的持续回合数增加3。当目标带有“瘴气”效果时，含情脉脉、魔音摄魂增加10%封印命中率及命中率上限。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD713CFD8
		jns[8] = 0xD713CFD8
		elseif jn == "连绵" then--无图标
		jns[1] = "你的“瘴气”持续回合数增加4。"
		jns[10]="jpg"
		elseif jn == "情劫" then
		jns[1] = "带有“瘴气”的目标在解除“瘴气”时获得的气血回复受“瘴气”影响；被你封印的目标在解除封印时获得的气血回复降低100%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x949B1634
		jns[8] = 0x949B1634
		elseif jn == "绝殇" then
		jns[1] = "带有“瘴气”的目标回合结束时减少1点愤怒。你的瘴气、魔音摄魂使用的当前回合无法被晶清诀、玉清诀解除。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x72B48AE0
		jns[8] = 0x72B48AE0
		elseif jn == "幻镜" then--无图标
		jns[1] = "你的幻镜术转移目标由随机单位变为30%几率随机到施法者。"
		jns[10]="jpg"
		elseif jn == "结阵" then
		jns[1] = "敌方阵营所有玩家单位每回合结束损失2点速度。(降低的总速度不会超过初始速度的20%)"
		jns[10]="jpg"
		elseif jn == "媚态" then
		jns[1] = "你的勾魂、摄魄必定命中；你使用瘴气时，清除目标身上的“寡欲令”。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x26A40C6E
		jns[8] = 0x26A40C6E
		elseif jn == "绝媚" then--无图标
		jns[1] = "你的勾魂、摄魄必定命中，且技能效果增加90%，冷却时间8回合。"
		jns[10]="jpg"
		elseif jn == "落花成泥" then
		jns[1] = "靡靡之音进入敌人耳际，使目标下回合彷徨不知所措、额外受到24%伤害，同时100%几率无法进行除灵宝以外的任何行动。(不受化生寺门派特色影响)"
		jns[3] = 4
		jns[6] = "wzife.wd2" --20点愤怒   4回合
		jns[7] = 0x4D94B673
		jns[8] = 0x4D94B673
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点法术防御。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "风华舞圣" then --无图标
		jns[1] = "增加80点法术防御，获得风华舞圣称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "迷情妖姬" then-- 盘丝
		if jn == "粘附" then
		jns[1] = "与NPC战斗时，若自身敏捷≥等级×3或力量≥等级×3，增加(武器伤害×18%)的天罗地网伤害，且普通攻击和特技对带有你天罗地网的敌方单位造成的物理伤害提高50%."
		jns[10]="jpg"
		elseif jn == "妖气" then
		jns[1] = "增加(武器伤害×12%)的封印命中等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB3956495
		jns[8] = 0xB3956495
		elseif jn == "怜心" then
		jns[1] = "姐妹同心的命中率增加12%，效果增加10%。队伍中只有一个盘丝洞弟子时：每场战斗的第—次姐妹同心必中。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x38D87BEB
		jns[8] = 0x38D87BEB
		elseif jn == "迷瘴" then
		jns[1] = "天罗地网异常状态命中本增加20%，同时增加10%的命中率上限；且额外减少目标5%速度、(等级×1.5)的伤害力、法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x661970E1
		jns[8] = 0x661970E1
		elseif jn == "鼓乐" then
		jns[1] = "魔音摄魂的命中率增加20%，同时增加10%的命中率上限。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC17A7A56
		jns[8] = 0xC17A7A56
		elseif jn == "忘忧" then
		jns[1] = "成功封印目标后，每回合开始时目标减少90点魔法值，直到封印解除。若因此效果导致魔法值为0，则额外受到(目标等级×4)的气血伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0B95DA6D
		jns[8] = 0x0B95DA6D
		elseif jn == "玲珑" then--无图标
		jns[1] = "“忘情”额外增加效果：受到伤害时，有30%几率减少12%伤害并回复自身10点愤怒。(触融发时消耗1点灵气)"
		jns[10]="jpg"
		elseif jn == "安抚" then
		jns[1] = "回合结束时，每个带有你的“含情脉脉”“魔音摄魂”状态的单位会为你回复4点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x756CE723
		jns[8] = 0x756CE723
		elseif jn == "倾情" then
		jns[1] = "使用姐妹同心成功后，如果目标的魔法值为0，则有50%的几率额外施放一次含情脉脉法术。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x59ED800F
		jns[8] = 0x59ED800F
		elseif jn == "连绵" then--无图标
		jns[1] = "你的“瘴气”持续回合数增加4。"
		jns[10]="jpg"
		elseif jn == "忘川" then
		jns[1] = "你的“瘴气”的持续回合数增加3。当目标带有“瘴气”效果时，含情脉脉、魔音摄魂增加10%封印命中率及命中率上限。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD713CFD8
		jns[8] = 0xD713CFD8
		elseif jn == "意乱" then
		jns[1] = "你的瘴气作用人数调整为(迷情大法等级/20+1)，但持续回合数减少1。"
		jns[10]="jpg"
		elseif jn == "情劫" then
		jns[1] = "带有“瘴气”的目标在解除“瘴气”时获得的气血回复受“瘴气”影响；被你封印的目标在解除封印时获得的气血回复降低100%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x949B1634
		jns[8] = 0x949B1634
		elseif jn == "魔瘴" then --无图标
		jns[1] = "姐妹同心对带有“瘴气”效果的目标效果增加12%。"
		jns[10]="jpg"
		elseif jn == "迷意" then
		jns[1] = "带有“瘴气”的目标受到的回魔效果降低30%并且回合开始时减少40点魔法值。使用魔音摄魂命中目标时，目标不能回复魔法值。(当与其他封印效果叠加时，回魔效果变为40%。)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1A6D023E
		jns[8] = 0x1A6D023E
		elseif jn == "结阵" then
		jns[1] = "敌方阵营所有玩家单位每回合结束损失2点速度。(降低的总速度不会超过初始速度的20%)"
		jns[10]="jpg"
		elseif jn == "绝媚" then--无图标
		jns[1] = "你的勾魂、摄魄必定命中，且技能效果增加90%，冷却时间8回合。"
		jns[10]="jpg"
		elseif jn == "利刃" then
		jns[1] = "敌方所有单位每回合结束时减少30点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8282C7D1
		jns[8] = 0x8282C7D1
		elseif jn == "偷龙转凤" then
		jns[1] = "这是集天地玄妙的大成之技，修习此技，不仅要有绝代风华的女儿身，更要有一颗玲珑剔透的七窍心。对目标施法后（可以是本方或敌方)，目标立刻损失所有魔法，但在回合结束时会回复损失魔法的10%，持续8回合。"
		jns[3] = 4
		jns[4] = "80点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0xC3BF2DE7
		jns[8] = 0xC3BF2DE7
		jns[12] = '8回合'
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加30点速度。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "迷情妖姬" then --无图标
		jns[1] = "增加30点速度，获得迷情妖姬称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "百媚魔姝" then-- 盘丝
		if jn == "粘附" then
		jns[1] = "与NPC战斗时，若自身敏捷≥等级×3或力量≥等级×3，使用天罗地网时，增加(武器伤害×18%)伤害且附加“天罗地网”状态几率提高100%。"
		jns[10]="jpg"
		elseif jn == "杀戮" then --无图标
		jns[1] = "攻击带有“天罗地网”的单位时，造成的物理伤害提高8%。"
		jns[10]="jpg"
		elseif jn == "罗网" then --无图标
		jns[1] = "你的普通攻击伤害提高10%，且有70%几率使目标附加“天罗地网”状态。"
		jns[10]="jpg"
		elseif jn == "天网" then --无图标
		jns[1] = "千蛛噬魂每次攻击都有3%几率对目标附加“天罗地网”状态(已有该状态则刷新为4回合)。"
		jns[10]="jpg"
		elseif jn == "凌弱" then --无图标
		jns[1] = "物理攻击负面状态数量≥2的目标时，伤害力增加80点。"
		jns[10]="jpg"
		elseif jn == "制怒" then --无图标
		jns[1] = "破血狂攻对带有“天罗地网”的单位使用后，你回复12点愤怒。"
		jns[10]="jpg"
		elseif jn == "狂击" then --无图标
		jns[1] = "使用千蛛噬魂时，物理暴击几率增加4%。"
		jns[10]="jpg"
		elseif jn == "千蛛" then --无图标
		jns[1] = "千蛛噬魂对召唤兽的伤害结果提高12%"
		jns[10]="jpg"
		elseif jn == "引诛" then --无图标
		jns[1] = "蛛丝缠绕对玩家单位造成的伤害提高6%。"
		jns[10]="jpg"
		elseif jn == "附骨" then --无图标
		jns[1] = "你的天罗地网有30%几率不会被玉清诀、晶清诀解除。"
		jns[10]="jpg"
		elseif jn == "亡缚" then --无图标
		jns[1] = "增加50点物理暴击等级。"
		jns[10]="jpg"
		elseif jn == "罗刹" then --无图标
		jns[1] = "佩戴法宝“忘情”时:对带有你“天罗地网”状态的单位伤害结果提高6%。"
		jns[10]="jpg"
		elseif jn == "障眼" then --无图标
		jns[1] = "回合结束时若敌方单位带有“瘴气”，该单位来自你的“天罗地网”状态有30%几率延长1回合。"
		jns[10]="jpg"
		elseif jn == "连绵" then --无图标
		jns[1] = "你的“瘴气”持续回合数增加4。"
		jns[10]="jpg"
		elseif jn == "意乱" then
		jns[1] = "你的瘴气作用人数调整为(迷情人法等级/20+1)，但持续回合数减少1。"
		jns[10]="jpg"
		elseif jn == "结阵" then --无图标
		jns[1] = "敌方阵营所有玩家单位每回合结束损失2点速度。(降低的总速度不会超过初始速度的20%)"
		jns[10]="jpg"
		elseif jn == "牵魂蛛丝" then --无图标
		jns[1] = "对目标附加持续1回合的“天罗地网”状态，随后对所有带有你“天罗地网”的单位发动1次攻击。"
		jns[4] = "100点魔法"
		jns[10]="jpg"
		jns[12] = "8回合"
		elseif jn == "扑袭" then --无图标
		jns[1] = "队伍中仅有一个盘丝洞弟子时:天罗地网对不带有该状态的单位造成的伤害提高40%。"
		jns[10]="jpg"
		elseif jn == "绝命毒牙" then --无图标
		jns[1] = "对目标发动一次致命攻击。1)对目标造成125%的伤害;2)激发目标身上的“天罗地网”状态，提高(天罗地网剩余回合数×10%)的伤害。"
		jns[4] = "50点魔法"
		jns[10]="jpg"
		jns[12] = "10回合，战斗开始时具有5回合冷却"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点抵抗封印等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "百媚魔姝" then --无图标
		jns[1] = "增加80点抵抗封印等级，获得百媚魔姝称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

















	elseif lp == "勾魂阎罗" then-- 地府
		if jn == "阎罗" then --无图标
		jns[1] = "与NPC战斗时，阎罗令伤害增加(武器伤害×15%)；敌方场上有非召唤物单位死亡时，你的下—个判官令或六道无量伤害提高50%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC4A24497
		jns[8] = 0xC4A24497
		elseif jn == "回旋" then
		jns[1] = "受到包括固定伤害在内的所有法术伤害减少65点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x299CC362
		jns[8] = 0x299CC362
		elseif jn == "夜行" then
		jns[1] = "夜间增加人物40点速度、40点伤害、50点阎罗令伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6CB4C5F1
		jns[8] = 0x6CB4C5F1
		elseif jn == "入骨" then
		jns[1] = "尸腐毒被解除时，使目标减少5%当前气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB9D06801
		jns[8] = 0xB9D06801
		elseif jn == "聚魂" then
		jns[1] = "摄魂的所有基础效果增加4.5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0EF6D102
		jns[8] = 0x0EF6D102
		elseif jn == "拘魄" then --无图标
		jns[1] = "摄魂的所有基础效果增加6%，但冷却回合增加至10."
		jns[10]="jpg"
		elseif jn == "索魂" then
		jns[1] = "锢魂术命中率增加(6+当前回合数x0.1)%，(最高12%)，且你的“河图洛书”不会增力加非阴曹地府玩家计数。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF259DD30
		jns[8] = 0xF259DD30
		elseif jn == "伤魂" then
		jns[1] = "对带有尸腐毒的单位增加200点封印命中等级、100点物理伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEDAB40CF
		jns[8] = 0xEDAB40CF
		elseif jn == "瘴幕" then --无图标
		jns[1] = "受到带有“尸腐毒”单位的攻击时，受到的伤害降低4%。"
		jns[10]="jpg"
		elseif jn == "黄泉" then
		jns[1] = "黄泉之息的减速效果提高50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11A0C1AE
		jns[8] = 0x11A0C1AE
		elseif jn == "幽冥" then
		jns[1] = "幽冥鬼眼持续回合数增加1."
		jns[10]="jpg"
		elseif jn == "冥视" then --无图标
		jns[1] = "幽冥鬼眼额外增加2%的抗封。"
		jns[10]="jpg"
		elseif jn == "幽光" then
		jns[1] = "九幽的每回合回复当前气血值的上限增加120点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x337664F3
		jns[8] = 0x337664F3
		elseif jn == "泉爆" then
		jns[1] = "队伍中只有一个阴曹地府弟子时：每场战斗的第一次黄泉之息将造成400%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x14AB7311
		jns[8] = 0x14AB7311
		elseif jn == "鬼火" then
		jns[1] = "使用原始愤怒消耗≤90的特技后，回复16点愤怒"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x93AE3E78
		jns[8] = 0x93AE3E78
		elseif jn == "魂飞" then
		jns[1] = "你的魂飞魄散首目标若为玩家且当回合死亡，则附加涸魂术，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC415DB52
		jns[8] = 0xC415DB52
		elseif jn == "汲魂" then
		jns[1] = "每次敌方人物死亡时，回复(自身等级×6)的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x808E00C5
		jns[8] = 0x808E00C5
		elseif jn == "扼命" then --无图标
		jns[1] = "魂飞魄散命中处于封印状态的单位时，额外随机驱散1个增益状态。"
		jns[10]="jpg"
		elseif jn == "魍魉追魂" then
		jns[1] = "地府弟子可以招来地狱深处的魑魅魍魉协助队友进行攻击。对本方—个死亡的单位附加“魍魉追魂”效果：造成的物理法术伤害提高(4+2×N)%，N为本方带有“魍魉追魂”的单位数，持续到战斗结束(不可驱散)。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x2B37D923
		jns[8] = 0x2B37D923
		jns[12] = "4回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点抵抗封印等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "勾魂阎罗" then --无图标
		jns[1] = "增加80点抵抗封印等级，获得勾魂阎罗称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "六道魍魉" then-- 地府
		if jn == "阎罗" then --无图标
		jns[1] = "与NPC战斗时，阎罗令伤害增加(武器伤害×15%)；敌方场上有非召唤物单位死亡时，你的下—个判官令或六道无量伤害提高50%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC4A24497
		jns[8] = 0xC4A24497
		elseif jn == "回旋" then
		jns[1] = "受到包括固定伤害在内的所有法术伤害减少65点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x299CC362
		jns[8] = 0x299CC362
		elseif jn == "夜行" then
		jns[1] = "夜间增加人物40点速度、40点伤害、50点阎罗令伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6CB4C5F1
		jns[8] = 0x6CB4C5F1
		elseif jn == "聚魂" then
		jns[1] = "摄魂的所有基础效果增加4.5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0EF6D102
		jns[8] = 0x0EF6D102
		elseif jn == "狱火" then --无图标
		jns[1] = "攻击带有来自你的“摄魂”的单位时，造成的伤害提高12%。"
		jns[10]="jpg"
		elseif jn == "六道" then
		jns[1] = "六道无量的伤害结果额外增加(六道轮回技能等级×4)。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x49D3C846
		jns[8] = 0x49D3C846
		elseif jn == "索魂" then
		jns[1] = "锢魂术命中率增加(6+当前回合数x0.1)%，(最高12%)，且你的“河图洛书”不会增力加非阴曹地府玩家计数。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF259DD30
		jns[8] = 0xF259DD30
		elseif jn == "伤魂" then
		jns[1] = "对带有尸腐毒的单位增加200点封印命中等级、100点物理伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEDAB40CF
		jns[8] = 0xEDAB40CF
		elseif jn == "百炼" then
		jns[1] = "武器耐久度消耗降低50%;使用百爪狂杀时临时增加40%的武器命中。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2197928B
		jns[8] = 0x2197928B
		elseif jn == "黄泉" then
		jns[1] = "黄泉之息的减速效果提高50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11A0C1AE
		jns[8] = 0x11A0C1AE
		elseif jn == "幽冥" then
		jns[1] = "幽冥鬼眼持续回合数增加1."
		jns[10]="jpg"
		elseif jn == "百爪狂杀" then --无图标
		jns[1] = "【被动】你被封印的几率增加20%【主动】法术驱动的必中物理攻击，可攻击4个目标;每增加1个攻击目标，对所有目标的伤害结果降低10%。作用目标按速度排序选择。如果你的武器带有“必中”特效，则提升10%(3%)的伤害结果。(括号内为目标为NPC时的效果)"
		jns[4] = "作用人数×35点魔法"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FCE05BE
		jns[8] = 0x8FCE05BE
		elseif jn == "咒令" then --无图标
		jns[1] = "判官令减少魔法值效果提高60%，但增加4回合冷却时间。"
		jns[10]="jpg"
		elseif jn == "泉爆" then
		jns[1] = "队伍中只有一个阴曹地府弟子时：每场战斗的第一次黄泉之息将造成400%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x14AB7311
		jns[8] = 0x14AB7311
		elseif jn == "鬼火" then
		jns[1] = "使用原始愤怒消耗≤90的特技后，回复16点愤怒"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x93AE3E78
		jns[8] = 0x93AE3E78
		elseif jn == "恶焰" then --无图标
		jns[1] = "击飞带有尸腐毒的单位时，你获得恶焰:造成的物理伤害提高12%，持续6回合。"
		jns[10]="jpg"
		elseif jn == "汲魂" then
		jns[1] = "每次敌方人物死亡时，回复(自身等级×6)的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x808E00C5
		jns[8] = 0x808E00C5
		elseif jn == "噬毒" then --无图标
		jns[1] = "净化一个敌方单位带有的“尸腐毒”，受到(人物等级×10)点伤害，但是你的下一个六道无量造成伤害提高60%且增加10%的暴击几率，下一个百爪狂杀造成伤害提高60%且对敌方玩家附加防御降低效果;若目标不带有“尸腐毒”效果，你随机获得其中一个增益状态且不会受到伤害。"
		jns[4] = "50点魔法"
		jns[10]="jpg"
		jns[12] = "8回合"
		elseif jn == "夜之王者" then --无图标
		jns[1] = "百爪狂杀额外提高14%伤害结果;夜晚增加10%暴击几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5192EAE6
		jns[8] = 0x5192EAE6
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点抵抗封印等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "六道魍魉" then --无图标
		jns[1] = "增加80点抵抗封印等级，获得六道魍魉称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "诛刑毒师" then-- 地府
		if jn == "毒炽" then --无图标
		jns[1] = "攻击带有尸腐毒的单位时，临时增加12%暴击几率。"
		jns[10]="jpg"
		elseif jn == "回旋" then --无图标
		jns[1] = "受到包括固定伤害在内的所有法术伤害减少65点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x299CC362
		jns[8] = 0x299CC362
		elseif jn == "阴翳" then --无图标
		jns[1] = "百鬼噬魂、血影蚀心附加尸腐毒的几率增加12%"
		jns[10]="jpg"
		elseif jn == "聚魂" then --无图标
		jns[1] = "摄魂的所有基础效果增加4.5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0EF6D102
		jns[8] = 0x0EF6D102
		elseif jn == "狱火" then --无图标
		jns[1] = "攻击带有来自你的“摄魂”的单位时，造成的伤害提高12%"
		jns[10]="jpg"
		elseif jn == "入魂" then --无图标
		jns[1] = "对带有你的“摄魂”的单位附加尸腐毒几率增加50%。"
		jns[10]="jpg"
		elseif jn == "毒慑" then --无图标
		jns[1] = "敌方有单位处于“尸腐毒”状态时，你造成的伤害提高4%。"
		jns[10]="jpg"
		elseif jn == "破印" then --无图标
		jns[1] = "对召唤兽的伤害提高15%。"
		jns[10]="jpg"
		elseif jn == "瘴幕" then --无图标
		jns[1] = "受到带有“尸腐毒”单位的攻击时，受到的伤害降低4%。"
		jns[10]="jpg"
		elseif jn == "无赦咒令" then --无图标
		jns[1] = "对目标发起物理攻击，伤害为普通攻击的110%，随机驱散目标1个增益状态，如果目标带毒类异常，则驱散2个。"
		jns[4] = "50点魔法"
		jns[10]="jpg"
		elseif jn == "幽冥" then
		jns[1] = "幽冥鬼眼持续回合数增加1."
		jns[10]="jpg"
		elseif jn == "通瞑" then --无图标
		jns[1] = "幽冥鬼眼仅对自己起效，但持续回合增加(释放时敌方场上带有尸腐毒的单位数量)。"
		jns[10]="jpg"
		elseif jn == "狂宴" then --无图标
		jns[1] = "攻击附带“尸腐毒”的单位后，回复2点愤怒。"
		jns[10]="jpg"
		elseif jn == "鬼火" then
		jns[1] = "使用原始愤怒消耗≤90的特技后，回复16点愤怒"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x93AE3E78
		jns[8] = 0x93AE3E78
		elseif jn == "轮回" then --无图标
		jns[1] = "队伍中只有一个阴曹地府弟子时:若回合结束时，敌方场上有6个中“尸腐毒”的单位，你获得60点伤害、暴击等级、穿刺等级、狂暴等级、抗封等级、格挡值，持续6回合。"
		jns[10]="jpg"
		elseif jn == "蚀骨" then --无图标
		jns[1] = "如果敌方场上没有单位带有“尸腐毒”，则百鬼噬魂、血影蚀心附加“尸腐毒”的几率增加15%。"
		jns[10]="jpg"
		elseif jn == "汲魂" then
		jns[1] = "每次敌方人物死亡时，回复(自身等级×6)的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x808E00C5
		jns[8] = 0x808E00C5
		elseif jn == "恶焰" then --无图标
		jns[1] = "击飞带有尸腐毒的单位时，你获得恶焰:造成的物理伤害提高12%，持续6回合。"
		jns[10]="jpg"
		elseif jn == "生杀予夺" then --无图标
		jns[1] = "提高伤害对一个目标发起一次物理攻击:1)若目标带尸腐毒，此次攻击暴击伤害倍率增加60%;2)队伍中只有一个阴曹地府弟子时:回合结束时额外减少(敌方场上尸腐毒数量)的冷却回合。"
		jns[2] = "【消耗】100点魔法 【冷却】36回合"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点抵抗封印等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "诛刑毒师" then --无图标
		jns[1] = "增加80点抵抗封印等级，获得诛刑毒师称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns








	elseif lp == "嗜血狂魔" then-- 狮驼
		if jn == "爪印" then
		jns[1] = "每次攻击敌人或被敌人攻击后，在敌人身上留下“爪印”。每个“爪印”使你在下次攻击此目标时增加(人物等级×1)伤害结果。“爪印”只有在每回合的第—次攻击中生效，持续5回合或至敌方死亡。(效果可叠加5层，可刷新，且不会被水清、冰清、玉清、晶清诀解除。)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6E34D2AA
		jns[8] = 0x6E34D2AA
		elseif jn == "迅捷" then--无图标
		jns[1] = "与NPC战斗时：你进场获得2回合“变身”，但是该“变身”会使你伤害力减少（(等级×1)。(套装效果附带状态“变身”时不触发)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x35A96711
		jns[8] = 0x35A96711
		elseif jn == "驭兽" then
		jns[1] = "本方的所有召唤兽造成的伤害提高3%，受到的伤害降低3%。(不可叠加)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x97EF1BE4
		jns[8] = 0x97EF1BE4
		elseif jn == "化血" then
		jns[1] = "在攻击中有30%几率吸收(造成伤害x16%)的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBE24B04C
		jns[8] = 0xBE24B04C
		elseif jn == "宁息" then
		jns[1] = "变身持续回合数增加2。回合结束时若处于死亡状态，“变身”的剩余回合数有70%几率不会减少。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF0B320B8
		jns[8] = 0xF0B320B8
		elseif jn == "兽王" then
		jns[1] = "受到封印时，临时减少该次封印(本方召唤兽数×2)%的封印命中率上限。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x287A0188
		jns[8] = 0x287A0188
		elseif jn == "威压" then--无图标
		jns[1] = "狮搏对召唤兽伤害提高20%并有30%几率附带持续2回合的“威慑”效果。"
		jns[10]="jpg"
		elseif jn == "怒象" then
		jns[1] = "当气血小于上限的30%时，有70%的几率在使用象形时保留变身状态并延长变身2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7CDE78AD
		jns[8] = 0x7CDE78AD
		elseif jn == "鹰啸" then
		jns[1] = "你的鹰击可以使目标召唤兽和召唤物造成的伤害降低32%，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1D7F1771
		jns[8] = 0x1D7F1771
		elseif jn == "九天" then--无图标
		jns[1] = "队伍中只有一个狮它岭弟子时：增加(大鹏展翅等级×大鹏展翅等级÷60)的命中，且你的鹰击造成的伤害提高10%。"
		jns[10]="jpg"
		elseif jn == "魔息" then
		jns[1] = "你的魔息术会使你所有技能魔法耗费减少至1。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC84857CA
		jns[8] = 0xC84857CA
		elseif jn == "协战" then--无图标
		jns[1] = "召唤兽在场时，自身造成的所有物理伤害提高7%。(鬼魂倒地视为未在场)"
		jns[10]="jpg"
		elseif jn == "怒火" then--无图标
		jns[1] = "使用破血狂攻或破碎无双后，你的召唤兽本回合造成的伤害提高32%."
		jns[10]="jpg"
		elseif jn == "狂袭" then
		jns[1] = "攻击时若被反震导致气血损失，获得下述效果：1)气血损失的4%加成至伤害力，持续1回合，可叠加。2)若气血损失>当前气血则至少保留1点气血，在行动结束时死亡。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5154ED66
		jns[8] = 0x5154ED66
		elseif jn == "癫狂" then--无图标
		jns[1] = "天魔解体会使你额外增加10%的暴击几率。"
		jns[10]="jpg"
		elseif jn == "死地" then
		jns[1] = "死亡时将增加你下─次鹰击200伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x143A6B82
		jns[8] = 0x143A6B82
		elseif jn == "乱击" then
		jns[1] = "你的连环击不再取消“变身”而是减少变身2回合，使用连环击时临时增加(狂兽诀等级×1)的伤害力且造成的伤害提高10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x28EFDCA8
		jns[8] = 0x28EFDCA8
		elseif jn == "肝胆" then
		jns[1] = "当你没有召唤兽在场时，召唤召唤兽会使得你下—次鹰击伤害提高15%、下次连环击伤害提高15%。(不可驱散)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x04600746
		jns[8] = 0x04600746
		elseif jn == "背水" then
		jns[1] = "自身封印类效果被五龙丹或水清诀解除时，获得状态“背水”：下次鹰击或疯狂鹰击额外作用1个单位，持续2回合。(可刷新，不可驱散)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0B171EFB
		jns[8] = 0x0B171EFB
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加30点速度。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "嗜血狂魔" then --无图标
		jns[1] = "增加30点速度，获得嗜血狂魔称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

	elseif lp == "万兽之王" then-- 狮驼
		if jn == "拟形" then --无图标
		jns[1] = "你使用狮搏攻击召唤兽时，你的驯兽有50%几率对其使用一次狮搏。"
		jns[10]="jpg"
		elseif jn == "念主" then --无图标
		jns[1] = "进入与NPC的战斗时，驯兽将自行进入战场，但其造成的所有伤害降低20%。"
		jns[10]="jpg"
		elseif jn == "夜视" then --无图标
		jns[1] = "你的驯兽获得“夜战”。"
		jns[10]="jpg"
		elseif jn == "宁息" then
		jns[1] = "变身持续回合数增加2。回合结束时若处于死亡状态，“变身”的剩余回合数有70%几率不会减少。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF0B320B8
		jns[8] = 0xF0B320B8
		elseif jn == "饮血" then --无图标
		jns[1] = "你和驯兽造成物理伤害后，有30%几率吸取(16%×造成伤害)的气血。"
		jns[10]="jpg"
		elseif jn == "健壮" then --无图标
		jns[1] = "你的驯兽受到来自召唤兽的伤害降低20%。"
		jns[10]="jpg"
		elseif jn == "守势" then --无图标
		jns[1] = "处于休息状态时，你的驯兽受到的伤害降低12%。"
		jns[10]="jpg"
		elseif jn == "狂化" then --无图标
		jns[1] = "处于变身状态时，你的驯兽攻击时有12%几率造成双倍伤害。"
		jns[10]="jpg"
		elseif jn == "矫健" then --无图标
		jns[1] = "驯兽气血≥70%时，造成的伤害提高10%。"
		jns[10]="jpg"
		elseif jn == "协同" then --无图标
		jns[1] = "队伍中只有一个狮驼岭弟子时:驯兽对处于封印状态的目标造成的伤害提高100%。"
		jns[10]="jpg"
		elseif jn == "九天" then --无图标
		jns[1] = "队伍中只有一个狮码它岭弟子时:增加(大鹏展翅等级×大鹏展翅等级÷60)的命中，且你的鹰击造成的伤害提高10%。"
		jns[10]="jpg"
		elseif jn == "争宠" then --无图标
		jns[1] = "召唤兽在场时，你的驯兽造成的伤害提高12%。"
		jns[10]="jpg"
		elseif jn == "羁绊" then
		jns[1] = "你每次回复气血值，你的召唤兽也会回复该数值的15%;你的召唤兽每次回复气血值，你也会回复该数值的15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5C170F92
		jns[8] = 0x5C170F92
		elseif jn == "狂袭" then
		jns[1] = "攻击时若被反震导致气血损失，获得下述效果:1)气血损失的4%加成至伤害力，持续1回合，可叠加。2)若气血损失>当前气血则至少保留1点气血，在行动结束时死亡。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5154ED66
		jns[8] = 0x5154ED66
		elseif jn == "钢牙" then --无图标
		jns[1] = "自身武器或者衣服五行为金时，回合结束时，驯兽造成的伤害提高2%。(可叠加，当前驯兽被击飞后失效)"
		jns[10]="jpg"
		elseif jn == "追逐" then --无图标
		jns[1] = "使用连环击时，你的驯兽有15%的几率对其使用一次狮搏。"
		jns[10]="jpg"
		elseif jn == "逞凶" then --无图标
		jns[1] = "你或驯兽攻击造成玩家单位死亡后，本场战斗你和驯兽对其召唤兽和孩了造成的伤害永久提高12%。"
		jns[10]="jpg"
		elseif jn == "肝胆" then
		jns[1] = "当你没有召唤兽在场时，召唤召唤兽会使驯兽的下一个狮搏伤害提高30%。(不可驱散)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x04600746
		jns[8] = 0x04600746
		elseif jn == "功勋" then --无图标
		jns[1] = "驯兽每击倒一个不同的玩家、召唤兽、孩子、NPC，获得1枚“勋章”，根据勋章数量获得以下效果:1枚及以上:造成伤害提高10%且攻击时不再触发反击和反震;3枚及以上:增加20%的物理暴击率;5枚及以上:增加30%神佑几率;10枚及以上:“幼狮之搏”有20%几率连击。"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "万兽之王" then --无图标
		jns[1] = "增加40点物理暴击等级，获得万兽之王称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

	elseif lp == "狂怒斗兽" then-- 狮驼
		if jn == "狂躁" then --无图标
		jns[1] = "“变身”的持续回合减少3，你主动使用变身时，获得相同回合数的“狂怒”状态。"
		jns[10]="jpg"
		elseif jn == "狂化" then --无图标
		jns[1] = "主动使用狂怒时，“变身”和“狂怒”的持续回合额外增加1。"
		jns[10]="jpg"
		elseif jn == "狂啸" then --无图标
		jns[1] = "击飞召唤兽后，获得3回合的“狂怒”状态。"
		jns[10]="jpg"
		elseif jn == "攫取" then --无图标
		jns[1] = "“狂怒”状态下造成物理伤害后，有50%几率吸取(16%×造成伤害)的气血。"
		jns[10]="jpg"
		elseif jn == "屏息" then --无图标
		jns[1] = "回合结束时若处于倒地状态，有70%几率不减少“变身”和“狂怒”的剩余回合数"
		jns[10]="jpg"
		elseif jn == "不羁" then --无图标
		jns[1] = "“狂怒”状态下，你的抵抗封印几率增加10%。"
		jns[10]="jpg"
		elseif jn == "狮噬" then --无图标
		jns[1] = "“狂怒”状态下，你的狮搏有32%几率额外释放一次。"
		jns[10]="jpg"
		elseif jn == "象踏" then --无图标
		jns[1] = "“狂怒”状态下，你使用象形时保留“变身”状态。"
		jns[10]="jpg"
		elseif jn == "长啸" then --无图标
		jns[1] = "当你没有召唤兽在场时，召唤召唤兽会使你获得3回合的“狂怒”状态。"
		jns[10]="jpg"
		elseif jn == "九天" then --无图标
		jns[1] = "队伍中只有一个狮驼岭弟子时:增加(大鹏展翅等级×大鹏展翅等级÷60)的命中，且你的鹰击造成的伤害提高10%。"
		jns[10]="jpg"
		elseif jn == "魔息" then
		jns[1] = "你的魔息术会使你所有技能魔法耗费减少至1."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC84857CA
		jns[8] = 0xC84857CA
		elseif jn == "协战" then --无图标
		jns[1] = "召唤兽在场时，自身造成的所有物理伤害提高7%。(鬼魂倒地视为未在场)"
		jns[10]="jpg"
		elseif jn == "羁绊" then
		jns[1] = "你每次回复气血值，你的召唤兽也会回复该数值的15%;你的召唤兽每次回复气血值，你也会回复该数值的15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5C170F92
		jns[8] = 0x5C170F92
		elseif jn == "狂袭" then
		jns[1] = "攻击时若被反震导致气血损失，获得下述效果:1)气血损失的4%加成至伤害力，持续1回合，可叠加。2）若气血损失>当前气血则至少保留1点气血，在行动结束时死亡。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5154ED66
		jns[8] = 0x5154ED66
		elseif jn == "狂血" then --无图标
		jns[1] = "使用破血狂攻或破碎无双后，获得3回合的“狂怒”状态。"
		jns[10]="jpg"
		elseif jn == "狂乱" then --无图标
		jns[1] = "“狂怒”状态下，你的鹰击有40%几率额外作用1个单位。"
		jns[10]="jpg"
		elseif jn == "雄风" then --无图标
		jns[1] = "“狂怒”状态下，你使用连环击时保留“变身”状态。"
		jns[10]="jpg"
		elseif jn == "狩猎" then --无图标
		jns[1] = "你的攻击造成玩家单位死亡后，本场战斗你对其召唤兽和孩子造成的伤害永久提高12%。"
		jns[10]="jpg"
		elseif jn == "困兽之斗" then --无图标
		jns[1] = "若处于“狂怒”状态，有50%的几率额外攻击一次。若击倒了玩家单位，则获得5回合的“狂怒”状态。"
		jns[4] = "10%当前气血、100点魔法"
		jns[10]="jpg"
		jns[12] = "8回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "狂怒斗兽" then --无图标
		jns[1] = "增加40点伤害，获得狂怒斗兽称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns













	elseif lp == "清心羽客" then-- 五庄
		if jn == "体恤" then
		jns[1] = "生命之泉的对气血≤30%的目标，效果增加150点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF19C2D33
		jns[8] = 0xF19C2D33

		elseif jn == "运转" then--无图标
		jns[1] = "生命之泉持续回合减少3，但回复量提高30%"
		jns[10]="jpg"
		elseif jn == "行气" then--无图标
		jns[1] = "以自身为目标释放炼气化神时，其持续回合增加3。"
		jns[10]="jpg"
		elseif jn == "心浪" then
		jns[1] = "回合结束时，若你愤怒<50点，随机回复1~15点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x284FBFEC
		jns[8] = 0x284FBFEC
		elseif jn == "养生" then
		jns[1] = "当你气血<70%、且不处于生命之泉状态时，获得生命之泉状态。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCF2DA86F
		jns[8] = 0xCF2DA86F
		elseif jn == "蓄志" then--无图标
		jns[1] = "你同时处于炼气化神和生命之泉状态时，每回合回复3点愤怒。"
		jns[10]="jpg"
		elseif jn == "归本" then
		jns[1] = "你的日月乾坤命中目标时，有60%几率随机驱散—个目标带有的主动法宝增益效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x736BD2FA
		jns[8] = 0x736BD2FA
		elseif jn == "修心" then
		jns[1] = "使用除慈航普度以外的特技时，若愤怒不足则将消耗(所需愤怒×20)点魔法代替。(每场战斗限—次)"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x151405E2
		jns[8] = 0x151405E2
		elseif jn == "存思" then--无图标
		jns[1] = "回合数为3的倍数时，日月乾坤增加150点封印命中等级。"
		jns[10]="jpg"
		elseif jn == "修身" then
		jns[1] = "力量、体质、魔力、耐力、敏捷均增加14点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
		elseif jn == "同辉" then
		jns[1] = "天地同寿持续回合数增加2，但是被玩家单位攻击时额外降低15%防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
		elseif jn == "守中" then--无图标
		jns[1] = "受到的所有法术伤害降低6%."
		jns[10]="jpg"
		elseif jn == "乾坤" then
		jns[1] = "如果连续2回合及以上没有使用日月乾坤，则下—次使用日月乾坤的成功率提高15%."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86543FA8
		jns[8] = 0x86543FA8
		elseif jn == "意境" then
		jns[1] = "回合结束时，本方所有单位回复24点魔法值、1点愤怒"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC5AFBFE0
		jns[8] = 0xC5AFBFE0
		elseif jn == "存神" then--无图标
		jns[1] = "使用灵宝后，有35%的几率使你的下—个日月乾坤必定命中。"
		jns[10]="jpg"
		elseif jn == "陌宝" then
		jns[1] = "日月乾坤命中率增加2%，并对命中目标额外附加无法使用道具的效果。但你的物理伤害结果降低15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xA88BC46C
		elseif jn == "心随意动" then
		jns[1] = "这是五庄弟子的最高心境，于此心法下施展“日月乾坤”，令人陶陶乎直入另—个世界。激活后(再次使用关闭此状态)，持续8回合后自动关闭。持续回合内：1.增加(七星遁等级×2.2)的封印命中等级；⒉.使用日月乾坤封印成功后自己下回合不能使用日月乾坤。"
		jns[3] = 2
		jns[4] = "30点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xFD5AC0B0
		jns[8] = 0xFD5AC0B0
		elseif jn == "玄机" then--无图标
		jns[1] = "日月乾坤对带有异常状态的单位，封印命中率增加5%。"
		jns[10]="jpg"
		elseif jn == "清风望月" then
		jns[1] = "五庄观的弟子可以于乾坤腾挪之中领悟妙法，吸收2个队友身上的封印效果，但会使自己进入疯狂状态2回合。【消耗】40点愤怒【冷却】4回合"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FE977C4
		jns[8] = 0x8FE977C4
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加30点速度。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "清心羽客" then --无图标
		jns[1] = "增加30点速度，获得清心羽客称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns




	elseif lp == "乾坤力士" then-- 五庄
		if jn == "体恤" then
		jns[1] = "生命之泉的对气≤30%的目标，效果增加150点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF19C2D33
		jns[8] = 0xF19C2D33

		elseif jn == "锤炼" then
		jns[1] = "武器耐久损失速度降低40%，增加4%武器伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x18172D37
		jns[8] = 0x18172D37
		elseif jn == "神附" then
		jns[1] = "增加(人物力量×8%)的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x43F66789
		jns[8] = 0x43F66789
		elseif jn == "心浪" then
		jns[1] = "回合结束时，若你愤怒<50点，随机回复1~15点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x284FBFEC
		jns[8] = 0x284FBFEC
		elseif jn == "养生" then
		jns[1] = "当你气<70%、且不处于生命之泉状态时，获得生命之泉状态。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCF2DA86F
		jns[8] = 0xCF2DA86F
		elseif jn == "强击" then
		jns[1] = "破血狂攻、破碎无双伤害提高32%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xA88BC46C
		elseif jn == "无极" then --无图标
		jns[1] = "同时处于生命之泉、炼气化神和真阳令旗状态时，提高9%的伤害力。"
		jns[10]="jpg"
		elseif jn == "修心" then
		jns[1] = "使用除慈航普度以外的特技时，若愤怒不足则将消耗(所需愤怒×20)点魔法代替。(每场战斗限一次)"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x151405E2
		jns[8] = 0x151405E2
		elseif jn == "混元" then
		jns[1] = "当你气血≥70%时，提高5%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x03636ACD
		jns[8] = 0x03636ACD
		elseif jn == "修身" then
		jns[1] = "力量、体质、魔力、耐力、敏捷均增加14点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
		elseif jn == "剑气" then --无图标
		jns[1] = "回合结束时，获得4点物理暴击等级，持续到战斗结束."
		jns[10]="jpg"
		elseif jn == "雨杀" then
		jns[1] = "攻击目标为非玩家单位时，烟雨剑法第二次攻击的暴击几率提高20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xB6C48838
		elseif jn == "意境" then
		jns[1] = "回合结束时，本方所有单位回复24点魔法值、1点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC5AFBFE0
		jns[8] = 0xC5AFBFE0
		elseif jn == "起雨" then --无图标
		jns[1] = "当你的“骤雨”叠加至3层时，下一次烟雨剑法会消耗所有的“骤雨”层数，额外增加1次攻击次数。"
		jns[10]="jpg"
		elseif jn == "滂沱" then --无图标
		jns[1] = "每层“骤雨”的效果增加至5%伤害和5%暴击几率，且最多叠加5层。"
		jns[10]="jpg"
		elseif jn == "剑势" then --无图标
		jns[1] = "对气血>90%的单位造成的伤害提高9%。"
		jns[10]="jpg"
		elseif jn == "心随意动" then
		jns[1] = "激活后(再次使用关闭此状态)，持续8回合后自动关闭。持续回合内增加(七星遁等级*2.2)的伤害力。"
		jns[4] = "30点魔法"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFD5AC0B0
		jns[8] = 0xFD5AC0B0
		elseif jn == "致命" then
		jns[1] = "被你攻击的目标在回合结束时，若目标气血<(其气血上限×8%)则直接死亡。(对NPC最多造成等级×8点伤害)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8C44F88C
		jns[8] = 0x8C44F88C
		elseif jn == "天命剑法" then
		jns[1] = "率意而行、道法自然，在五庄弟子出手之际，他自身也道不出这一招之中蕴含了多少剑意。或许，只有冥冥之中的三清可知吧？以无人能够预知的剑术攻击目标，对其随机发动1~7次物理攻击。使用后下回合不能行动。使用需要气血≥气血上限的70%"
		jns[3] = 4
		jns[4] = "(最大气血的2%×实际攻击次数)点气血"
		jns[6] = "wzife.wd2"
		jns[7] = 0x30EA31AF
		jns[8] = 0x30EA31AF
		jns[12] ="4回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点伤害。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "乾坤力士" then --无图标
		jns[1] = "增加40点伤害，获得乾坤力士称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns








	elseif lp == "万寿真仙" then-- 五庄
		if jn == "木摧" then --无图标
		jns[1] = "敲金击玉基础伤害增加5%。"
		jns[10]="jpg"
		elseif jn == "道果" then --无图标
		jns[1] = "进入战斗时默认携带1个人参娃娃，但人参娃娃增加的基础伤害减少10%。"
		jns[10]="jpg"
		elseif jn == "饮露" then --无图标
		jns[1] = "每个人参娃娃增加4%的基础伤害。"
		jns[10]="jpg"
		elseif jn == "炼果" then --无图标
		jns[1] = "使用破血狂攻、破碎无双、弱点击破后，会获得1个人参娃娃。"
		jns[10]="jpg"
		elseif jn == "心浪" then
		jns[1] = "回合结束时，若你愤怒<50点，随机回复1~15点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCF2DA86F
		jns[8] = 0xCF2DA86F
		elseif jn == "聚力" then --无图标
		jns[1] = "每个人参娃娃使你的破血狂攻、破碎无双、弱点击破额外造成15%的伤害。"
		jns[10]="jpg"
		elseif jn == "无极" then --无图标
		jns[1] = "同时处于生命之泉、炼气化神和真阳令旗状态时，提高9%的伤害力。"
		jns[10]="jpg"
		elseif jn == "修心" then
		jns[1] = "使用除慈航普度以外的特技时，若愤怒不足则将消耗(所需愤怒×20)点魔法代替。(每场战斗限一次)"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x151405E2
		jns[8] = 0x151405E2
		elseif jn == "混元" then
		jns[1] = "当你气血≥70%时，提高5%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x03636ACD
		jns[8] = 0x03636ACD
		elseif jn == "刺果" then --无图标
		jns[1] = "敲金击玉对召唤兽的伤害提高20%。"
		jns[10]="jpg"
		elseif jn == "修身" then
		jns[1] = "力量、体质、魔力、耐力、敏捷均增加14点"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
		elseif jn == "三元" then --无图标
		jns[1] = "当你带有3个人参娃娃时，抵抗封印几率增加15%。"
		jns[10]="jpg"
		elseif jn == "凝神" then --无图标
		jns[1] = "带有人参娃娃时，你的伤害力增加120点。"
		jns[10]="jpg"
		elseif jn == "纳气" then --无图标
		jns[1] = "增加(人物力量×10%+40)的伤害力。"
		jns[10]="jpg"
		elseif jn == "气盛" then --无图标
		jns[1] = "每个人参娃娃使你增加60点伤害力。"
		jns[10]="jpg"
		elseif jn == "剑势" then --无图标
		jns[1] = "对气血>90%的单位造成的伤害提高9%。"
		jns[10]="jpg"
		elseif jn == "还元" then --无图标
		jns[1] = "带有3个人参娃娃时，继续使用敲金击玉后将增加3%的暴击几率，持续2回合。(效果可刷新、可叠加、不可驱散)"
		jns[10]="jpg"
		elseif jn == "致命" then
		jns[1] = "被你攻击的目标在回合结束时，若目标气血<(其气血上限×8%)则直接死亡。(对NPC最多造成等级×8点伤害)"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8C44F88C
		jns[8] = 0x8C44F88C
		elseif jn == "落土止息" then --无图标
		jns[1] = "发动一次猛烈的攻击，你的人参娃娃会与你一同攻击，且额外造成的伤害翻倍。使用后临时降低防御与法防，所有人参娃娃消失，你休息1回合。"
		jns[4] = "100点魔法"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "万寿真仙" then --无图标
		jns[1] = "增加40点物理暴击等级，获得万寿真仙称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns














	elseif lp == "妙谛金莲" then-- 无底洞
		if jn == "灵照" then --无图标
		jns[1] = "场上每个带有增益状态的非召唤物单位，增加你(武器伤害×3%)的治疗能力。"
		jns[10]="jpg"
		elseif jn == "秉幽" then --无图标
		jns[1] = "增加(武器伤害×18%)的治疗能力。"
		jns[10]="jpg"
		elseif jn == "护法" then --无图标
		jns[1] = "场上每个带有护盾的非召唤物单位，增加你(武器伤害×4%)的治疗能力。"
		jns[10]="jpg"
		elseif jn == "涌泉" then --无图标
		jns[1] = "地涌金莲首目标额外回复(地冥妙法等级×6)点气血。"
		jns[10]="jpg"
		elseif jn == "绝处逢生" then --无图标
		jns[1] = "恢复自身损失的50%气血及自身损失的50%气血上限，速度增加10%，持续3回合。(不可驱散)"
		jns[3] = 8
		jns[4] = "100点魔法"
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x4F57FF06
		jns[8] = 0x4F57FF06
		jns[12] = "10回合，战斗开始时具有5回合冷却"
		elseif jn == "烛照" then --无图标
		jns[1] = "你和你的召唤兽使用药品时，触发特性“藏神”的几率提高16%。"
		jns[10]="jpg"
		elseif jn == "华光" then --无图标
		jns[1] = "燃血术强化的地涌金莲额外作用1个目标。"
		jns[10]="jpg"
		elseif jn == "风墙" then
		jns[1] = "使用“金蟾”时，会额外消耗（(当前气血x50%)的自身气血，同时为本方其他非召唤物单位增加消耗气血×(金蟾等级×4+1)%的护盾值(不超过等级×16)。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xA35299B7
		jns[8] = 0xA35299B7
		elseif jn == "血潮" then --无图标
		jns[1] = "“燃血术”消耗翻倍，但使用后你会获得2层状态。"
		jns[10]="jpg"
		elseif jn == "精进" then
		jns[1] = "明光宝烛、金身舍利效果增加50%(200%)，每回合减少10%(40%)。(括号里为与玩家战斗时的效果)"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x3AC8DBC2
		jns[8] = 0x3AC8DBC2
		elseif jn == "救人" then
		jns[1] = "明光宝烛、金身舍利作用人数固定为1且持续回合数减少1，但效果增加160%。同时地涌金莲会额外作用到带有该状态的目标。被驱散后，目标增加(剩余回合数×目标等级)的护盾值。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xFD01D3AD
		jns[8] = 0xFD01D3AD
		elseif jn == "灵身" then
		jns[1] = "受到物理暴击和法术暴击伤害倍率减少40%"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x90622900
		jns[8] = 0x90622900
		elseif jn == "持戒" then
		jns[1] = "惊魂掌命中率变为原先的300%(无视命中率上限)，目标将无法受好友保护；但持续回合数上限变为2。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x7B3ACA53
		jns[8] = 0x7B3ACA53
		elseif jn == "罗汉" then --无图标
		jns[1] = "你使用罗汉金钟所需愤怒减少4点，持续回合数增加1."
		jns[10]="jpg"
		elseif jn == "灵通" then --无图标
		jns[1] = "你消耗的每点灵元将增加你20点治疗能力，持续到战斗结束。"
		jns[10]="jpg"
		jns[10]="jpg"
		elseif jn == "忍辱" then
		jns[1] = "每当你被对方封印时，无论是否成功，都有100%几率回复15点愤怒。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB1254F74
		jns[8] = 0xB1254F74
		elseif jn == "暗潮" then
		jns[1] = "你的玉清诀愤怒消耗减少25点，但需额外消耗自身10%气血并且只能解除封印异常。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x26A40C6E
		jns[8] = 0x26A40C6E
		elseif jn == "噬魂" then
		jns[1] = "队伍中只有1个无底洞弟子时：你的水清诀、冰清诀消耗减半且解除封印时会使目标造成的物法伤害提高10%，持续1回合。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x173015AE
		jns[8] = 0x173015AE
		elseif jn == "同舟共济" then
		jns[1] = "为目标友方分担前6次受到的伤害，持续到本回合结束。目标友方承受25%伤害，你承受25%伤害。"
		jns[3] = 3
		jns[4] = "200点魔法"
		jns[5] = "当前气血比例≥50%"
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x57365436
		jns[8] = 0x57365436
		jns[12] = "4回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "妙谛金莲" then --无图标
		jns[1] = "增加40点物理暴击等级，获得妙谛金莲称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

	elseif lp == "摄魂迷影" then-- 无底洞
		if jn == "阴魅" then --无图标
		jns[1] = "若敌方场上无处于封类异常的单位，增加(武器伤害×18%)的封印命中等级。"
		jns[10]="jpg"
		elseif jn == "诡印" then --无图标
		jns[1] = "增加(武器伤害×12%)封印命中等级。"
		jns[10]="jpg"
		elseif jn == "萦魄" then --无图标
		jns[1] = "带有>2个增益状态时，增加(武器伤害x15%)的封印命中等级。"
		jns[10]="jpg"
		elseif jn == "御兽" then --无图标
		jns[1] = "自身携带的召唤兽和孩子进入战斗时，如果速度≥(召唤兽等级×3)，则增加召唤兽(等级x0.7)的速度和(召唤兽等级×1)的法术防御。(含初始进场及召唤进场)"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x4972C591
		jns[8] = 0x4972C591
		elseif jn == "绝处逢生" then --无图标
		jns[1] = "恢复自身损失的50%气血及自身损失的50%气血上限，速度增加10%，持续3回合。(不可驱散)"
		jns[3] = 8
		jns[4] = "100点魔法"
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x4F57FF06
		jns[8] = 0x4F57FF06
		elseif jn == "陷阱" then --无图标
		jns[1] = "你的夺魄令被解除时,目标当前回合减少(阴风绝章等级×1.5)的物法伤害;同时使你下次地涌金莲额外作用1个单位，但效果仅为70%。(可叠加7层，不可驱散)"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x3E7BB1D9
		jns[8] = 0x3E7BB1D9
		elseif jn == "椎骨" then --无图标
		jns[1] = "燃血术强化的夺魄令增加120点封印命中等级。"
		jns[10]="jpg"
		elseif jn == "风墙" then --无图标
		jns[1] = "使用“金蟾”时，会额外消耗(当前气×50%)的自身气血，同时为本方其他非召唤物单位增加消耗气血×(金蟾等级×4+1)%的护盾值(不超过等级×16) ."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xA35299B7
		jns[8] = 0xA35299B7
		elseif jn == "血潮" then --无图标
		jns[1] = "“燃血术”可以叠加2层。"
		jns[10]="jpg"
		elseif jn == "灵身" then --无图标
		jns[1] = "受到物理暴击和法术暴击伤害倍率减少40%."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x90622900
		jns[8] = 0x90622900
		elseif jn == "精进" then --无图标
		jns[1] = "明光宝烛、金身舍利效果增加50%(200%)，每回合减少10%(40%)。(括号里为与玩家战斗时的效果)"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x3AC8DBC2
		jns[8] = 0x3AC8DBC2
		elseif jn == "救人" then --无图标
		jns[1] = "明光宝烛、金身舍利作用人数固定为1且持续回合数减少1，但效果增加160%。同时地涌金莲会额外作用到带有该状态的目标。被驱散后，目标增加(剩余回合数x目标等级)的护盾值。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xFD01D3AD
		jns[8] = 0xFD01D3AD
		elseif jn == "烈煞" then --无图标
		jns[1] = "增加50点封印命中等级。"
		jns[10]="jpg"
		elseif jn == "持戒" then --无图标
		jns[1] = "惊魂掌命中率变为原先的300%(无视命中率上限)，目标将无法受好友保护;但持续回合数上限变为2."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x7B3ACA53
		jns[8] = 0x7B3ACA53
		elseif jn == "罗汉" then --无图标
		jns[1] = "你使用罗汉金钟所需愤怒减少4点，持续回合数增加1."
		jns[10]="jpg"
		elseif jn == "忍辱" then --无图标
		jns[1] = "每当你被敌方封印时，无论是否成功，都有100%几率回复15点愤怒。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB1254F74
		jns[8] = 0xB1254F74
		elseif jn == "暗潮" then --无图标
		jns[1] = "你的玉清诀愤怒消耗减少25点，但需额外消耗自身10%气血并且只能解除封印异常。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x26A40C6E
		jns[8] = 0x26A40C6E
		elseif jn == "噬魂" then --无图标
		jns[1] = "队伍中只有1个无底洞弟子时:你的水清诀、冰清诀消耗减半且解除封印时会使目标造成的物法伤害提高10%，持续1回合。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x173015AE
		jns[8] = 0x173015AE
		elseif jn == "妖风四起" then --无图标
		jns[1] = "驱动妖风封印敌人，使其不能使用法术，持续2回合。成功率与成功率上限为（夺魄令成功率+40%) ;该封印不能被水清、冰清、玉清、晶清解除。(对NPC时该效果无效)"
		jns[4]= "(当前气血×40%)点气血，100点魔法"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x8295E360
		jns[8] = 0x8295E360
		jns[12]= "4回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "摄魂迷影" then --无图标
		jns[1] = "增加40点物理暴击等级，获得摄魂迷影称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "幽冥巫煞" then-- 无底洞
		if jn == "弥愤" then --无图标
		jns[1] = "夺命咒和追魂刺基础伤害加倍，自身封印命中和造成的所有治疗效果降低30%.“追魂刺”不再消耗愤怒。"
		jns[10]="jpg"
		elseif jn == "魂守" then --无图标
		jns[1] = "夺命咒和追魂刺基础伤害加倍，自身封印命中和造成的所有治疗效果降低30%.“裂魂”产生的召唤物气血提高15%。"
		jns[10]="jpg"
		elseif jn == "刺骨" then --无图标
		jns[1] = "夺命咒和追魂刺基础伤害加倍，自身封印命中和造成的所有治疗效果降低30%.“追魂刺”对玩家伤害提高12%。"
		jns[10]="jpg"
		elseif jn == "余咒" then --无图标
		jns[1] = "与玩家战斗时:夺命咒也有几率触发“裂魂”，几率为追魂刺的25%"
		jns[10]="jpg"
		elseif jn == "鬼袭" then --无图标
		jns[1] = "追魂刺对召唤兽造成的伤害提高50%."
		jns[10]="jpg"
		elseif jn == "羽裂" then --无图标
		jns[1] = "“裂魂”追加的伤害提高5%。"
		jns[10]="jpg"
		elseif jn == "分魄" then --无图标
		jns[1] = "燃血术强化的追魂刺产生目标魂魄的几率提高80%."
		jns[10]="jpg"
		elseif jn == "盛怒" then --无图标
		jns[1] = "燃血术不再有气血限制也不消耗气血，使用后你回复20点愤怒。"
		jns[10]="jpg"
		elseif jn == "血潮" then --无图标
		jns[1] = "“燃血术”可以叠加2层。"
		jns[10]="jpg"
		elseif jn == "夺血" then --无图标
		jns[1] = "使用燃血术时，获得8点固定伤害能力，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "灵变" then --无图标
		jns[1] = "与玩家战斗时:增加50点固定伤害能力。"
		jns[10]="jpg"
		elseif jn == "深刻" then --无图标
		jns[1] = "与玩家战斗时:奇数回合,追魂刺临时增加70点固定伤害能力;偶数回合，夺命咒临时增加70点固定伤害能力。"
		jns[10]="jpg"
		elseif jn == "牵动" then --无图标
		jns[1] = "追魂刺造成玩家单位死亡时，必定触发“裂魂”。"
		jns[10]="jpg"
		elseif jn == "独一" then --无图标
		jns[1] = "队伍中只有1个无底洞弟子时:你可以同时拥有2个“裂魂”的召唤物。"
		jns[10]="jpg"
		elseif jn == "聚魂" then --无图标
		jns[1] = "与玩家战斗时:触发“裂魂”的基几率降低50%，但你造成的固定伤害提高8%。"
		jns[10]="jpg"
		elseif jn == "纠缠" then --无图标
		jns[1] = "触发“裂魂”时，回复4点愤怒。"
		jns[10]="jpg"
		elseif jn == "灵身" then --无图标
		jns[1] = "受到物理暴击和法术暴击伤害倍率减少40%."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x90622900
		jns[8] = 0x90622900
		elseif jn == "踏魄" then --无图标
		jns[1] = "触发“裂魂”的敌方单位造成的物理法术伤害降低6%，持续到其魂魄消失。"
		jns[10]="jpg"
		elseif jn == "冥煞" then --无图标
		jns[1] = "造成固定伤害时，有5%几率造成双倍伤害"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "幽冥巫煞" then --无图标
		jns[1] = "增加40点物理暴击等级，获得幽冥巫煞称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns












	elseif lp == "九天武圣" then-- 凌波城
		if jn == "山破" then
		jns[1] = "使用天崩地裂与翻江搅海后，有64%的几率获得1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x673833C4
		jns[8] = 0x673833C4

		elseif jn == "战诀" then
		jns[1] = "对自身使用碎星诀和镇魂诀后，额外获得1点战意。与NPC战斗时：浪涌造成的伤害增加，但不再获得战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB97A5577
		jns[8] = 0xB97A5577
		elseif jn == "无双" then--无图标
		jns[1] = "天崩地裂暴击几率增加12%；翻江搅海伤害提高12%。"
		jns[10]="jpg"
		elseif jn == "聚气" then
		jns[1] = "使用消耗愤怒≥60的特技时，获得1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x6009D906
		jns[8] = 0x6009D906
		elseif jn == "贯通" then--无图标
		jns[1] = "本方玩家单位造成的物理和法术伤害提高4%。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "魂聚" then
		jns[1] = "使用消耗战意的技能后，回复10点愤怒。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB7BD0013
		jns[8] = 0xB7BD0013
		elseif jn == "神躯" then
		jns[1] = "受到物理暴击和法术暴击的倍率降低20%。复活时，若自身战意s1，则额外获得1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xCF5AD689
		jns[8] = 0xCF5AD689
		elseif jn == "斩魔" then
		jns[1] = "斩魔效果提高40%."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE2910606
		jns[8] = 0xE2910606
		elseif jn == "冰爆" then
		jns[1] = "天气为雪时，浪涌、惊涛怒、翻江搅海暴击率提升10%."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE2910606
		jns[8] = 0xE2910606
		elseif jn == "不动" then
		jns[1] = "队伍中只有一个凌波城弟子时：额外忽略目标(1-自身气血/气血上限)×10%的防御。死亡时战意≤3将额外保留1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x9769021C
		jns[8] = 0x9769021C
		elseif jn == "力战" then
		jns[1] = "天崩地裂额外忽略目标12%防御且造成的伤害提高12%。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x0E10688C
		jns[8] = 0x0E10688C
		elseif jn == "破击" then
		jns[1] = "物理暴击几率翻倍，但暴击伤害倍率变为原来的65%."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x6E010D11
		jns[8] = 0x6E010D11
		elseif jn == "巧变" then--无图标
		jns[1] = "战意≤3时，造成的伤害提高6%；战意≥4时，受到的所有伤害减少150."
		jns[10]="jpg"
		elseif jn == "海沸" then
		jns[1] = "增加(人物力量×10%+40)的伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xBCE3BB39
		jns[8] = 0xBCE3BB39
		elseif jn == "怒火" then
		jns[1] = "增加(战意点数×战意点数)×12的伤害力，但战意不再具有抗封效果。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xDEECD728
		jns[8] = 0xDEECD728
		elseif jn == "煞气" then
		jns[1] = "使用消耗战意的技能时，增加300点伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x338B3040
		jns[8] = 0x338B3040
		elseif jn == "强袭" then
		jns[1] = "使用天崩地裂和翻江搅海后，造成的物理伤害提高16%，持续3回合。(效果可刷新，不可叠加)"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xC6AD7685
		jns[8] = 0xC6AD7685
		elseif jn == "混元" then--无图标
		jns[1] = "天崩地裂和天神怒斩攻击的目标如果在本回合死亡，有60%的几率附加“腾雷”︰受到的治疗效果降低50%，持续3回合。"
		jns[10]="jpg"
		elseif jn == "再战" then
		jns[1] = "每次使用断岳势或惊涛怒击倒单位后，下—个断岳势或惊涛怒伤害提高15%。(不可驱散)"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x606669C9
		jns[8] = 0x606669C9
		elseif jn == "天神怒斩" then
		jns[1] = "天神盛怒，以开天辟地之势，挥刀怒斩：1.增加25%暴击几率、忽略目标25%防御发动─次物理攻击，命中后驱散目标随机个增益状态。⒉.若自身战意为1，造成额外50%伤害，否则造成25%额外伤害。3.每次使用后本场战斗该技能伤害永久提高25%(目标为NPC时为50%)4.使用天崩地裂和翻江搅海会减少这个技能1回合的冷却回合。"
		jns[3] = 4
		jns[4] = "300点魔法"
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xA8AF3DC0
		jns[8] = 0xA8AF3DC0
		jns[4] = "10回合，战斗开始时具有5回合冷却"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "九天武圣" then --无图标
		jns[1] = "增加40点物理暴击等级，获得九天武圣称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "灵霄斗士" then-- 凌波城
		if jn == "石摧" then --无图标
		jns[1] = "使用天崩地裂与翻江搅海后，有32%几率获得1点超级战意。"
		jns[10]="jpg"
		elseif jn == "战诀" then --无图标
		jns[1] = "对自身使用碎星诀和镇魂诀后，额外获得1点战意。与NPC战斗时:浪涌造成的伤害增加，但不再获得战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB97A5577
		jns[8] = 0xB97A5577
		elseif jn == "天泽" then --无图标
		jns[1] = "每8回合，获得1点战意。"
		jns[10]="jpg"
		elseif jn == "聚气" then --无图标
		jns[1] = "使用消耗愤怒≥60的特技时，获得1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x6009D906
		jns[8] = 0x6009D906
		elseif jn == "贯通" then --无图标
		jns[1] = "本方玩家单位造成的物理和法术伤害提高4%。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "魂聚" then
		jns[1] = "使用消耗战意的技能后，回复10点愤怒。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB7BD0013
		jns[8] = 0xB7BD0013
		elseif jn == "神躯" then
		jns[1] = "受到物理暴击和法术暴击的倍率降低20%。复活时，若自身战意s1，则额外获得1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xCF5AD689
		jns[8] = 0xCF5AD689
		elseif jn == "斩魔" then
		jns[1] = "斩魔效果提高40%."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE2910606
		jns[8] = 0xE2910606
		elseif jn == "不动" then
		jns[1] = "队伍中只有一个凌波城弟子时：额外忽略目标(1-自身气血/气血上限)×10%的防御。死亡时战意≤3将额外保留1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x9769021C
		jns[8] = 0x9769021C
		elseif jn == "妙得" then --无图标
		jns[1] = "消耗超级战意时，不再增加伤害，而是增加等额暴击几率。"
		jns[10]="jpg"
		elseif jn == "闪雷" then --无图标
		jns[1] = "腾雷优先消耗非超级战意。"
		jns[10]="jpg"
		elseif jn == "惊涛" then --无图标
		jns[1] = "自身武器或者衣服五行为水时，每点消耗的超级战意将使本次攻击的伤害额外提高4%。(可叠加)"
		jns[10]="jpg"
		elseif jn == "海沸" then
		jns[1] = "增加(人物力量×10%+40)的伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xBCE3BB39
		jns[8] = 0xBCE3BB39
		elseif jn == "怒火" then
		jns[1] = "增加(战意点数×战意点数)×12的伤害力，但战意不再具有抗封效果。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xDEECD728
		jns[8] = 0xDEECD728
		elseif jn == "煞气" then
		jns[1] = "使用消耗战意的技能时，增加300点伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x338B3040
		jns[8] = 0x338B3040
		elseif jn == "乘势" then --无图标
		jns[1] = "使用技能消耗超级战意后，获得持续3回合的“强袭”:物理伤害提高16%。"
		jns[10]="jpg"
		elseif jn == "追袭" then --无图标
		jns[1] = "消耗超级战意的技能攻击的目标如果在本回合死亡，附加持续3回合的“腾雷”︰受到的治疗效果降低50%。"
		jns[10]="jpg"
		elseif jn == "再战" then --无图标
		jns[1] = "每次使用断岳势或惊涛怒击倒单位后，下一个断岳势或惊涛怒伤害提高15%。(不可驱散)"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x606669C9
		jns[8] = 0x606669C9
		elseif jn == "真君显灵" then --无图标
		jns[1] = "敲动战鼓，一鼓作气拿下敌人。消耗自身所有(≥1)战意进入“真君显灵”状态，持续3回合(不可驱散)︰使自己造成的物理伤害增加(20%×使用时消耗战意数)﹔消耗的超级战意使该效果翻倍。回合结束时获得1点战意。"
		jns[4] = "100点魔法，自身所有战意"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x4017404F
		jns[8] = 0x4017404F
		jns[12] = "8回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "灵霄斗士" then --无图标
		jns[1] = "增加40点物理暴击等级，获得灵霄斗士称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns


	elseif lp == "风云战将" then-- 凌波城
		if jn == "山破" then --无图标
		jns[1] = "使用天崩地裂与翻江搅海后，有64%的几率获得1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x673833C4
		jns[8] = 0x673833C4

		elseif jn == "战诀" then
		jns[1] = "对自身使用碎星诀和镇魂诀后，额外获得1点战意。与NPC战斗时：浪涌造成的伤害增加，但不再获得战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB97A5577
		jns[8] = 0xB97A5577
		elseif jn == "天泽" then --无图标
		jns[1] = "每8回合，获得1点战意。"
		jns[10]="jpg"
		elseif jn == "凝息" then --无图标
		jns[1] = "使用特技后，你的下一个天眼神通战意消耗减少1。"
		jns[10]="jpg"
		elseif jn == "贯通" then
		jns[1] = "本方玩家单位造成的物理和法术伤害提高4%。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "魂聚" then
		jns[1] = "使用消耗战意的技能后，回复10点愤怒。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xB7BD0013
		jns[8] = 0xB7BD0013
		elseif jn == "神躯" then
		jns[1] = "受到物理暴击和法术暴击的倍率降低20%。复活时，若自身战意s1，则额外获得1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xCF5AD689
		jns[8] = 0xCF5AD689
		elseif jn == "斩魔" then
		jns[1] = "斩魔效果提高40%."
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xE2910606
		jns[8] = 0xE2910606
		elseif jn == "不动" then
		jns[1] = "队伍中只有一个凌波城弟子时：额外忽略目标(1-自身气血/气血上限)×10%的防御。死亡时战意≤3将额外保留1点战意。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x9769021C
		jns[8] = 0x9769021C
		elseif jn == "威震" then --无图标
		jns[1] = "天眼神通状态下，造成的伤害提高4%。"
		jns[10]="jpg"
		elseif jn == "盛势" then --无图标
		jns[1] = "你的天眼神通获得≥2种增益状态的几率提高20%。"
		jns[10]="jpg"
		elseif jn == "天眼" then --无图标
		jns[1] = "你的天眼神通同时获得3种增益效果的几率提高50%。"
		jns[10]="jpg"
		elseif jn == "海沸" then
		jns[1] = "增加(人物力量×10%+40)的伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xBCE3BB39
		jns[8] = 0xBCE3BB39
		elseif jn == "怒火" then
		jns[1] = "增加(战意点数×战意点数)×12的伤害力，但战意不再具有抗封效果。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0xDEECD728
		jns[8] = 0xDEECD728
		elseif jn == "煞气" then
		jns[1] = "使用消耗战意的技能时，增加300点伤害力。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x338B3040
		jns[8] = 0x338B3040
		elseif jn == "蓄势" then --无图标
		jns[1] = "使用天眼神通后，有50%几率回复1点战意。"
		jns[10]="jpg"
		elseif jn == "杀罚" then --无图标
		jns[1] = "天眼神通状态下造成目标死亡时，60%的几率附加持续3回合的“腾雷”:受到的治疗效果降低50%。"
		jns[10]="jpg"
		elseif jn == "再战" then
		jns[1] = "每次使用断岳势或惊涛怒造成一个单位的死亡，都会使下一个的断岳势或惊涛怒伤害提高15%。"
		jns[3] = 8
		jns[6] = "common/wzife.wdf"
		jns[7] = 0x606669C9
		jns[8] = 0x606669C9
		elseif jn == "耳目一新" then --无图标
		jns[1] = "移除当前天眼神通的增益效果，并再次使用天眼神通，会优先获得不同的增益效果。"
		jns[2] = "【消耗】300点魔法、30点愤怒、1点战意【冷却】24回合"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加80点抵抗封印等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "风云战将" then --无图标
		jns[1] = "增加80点抵抗封印等级，获得风云战将称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns















	elseif lp == "齐天武圣" then-- 花果山
		if jn == "威仪" then--无图标
		jns[1] = "使用当头一棒后，下一个神针撼海伤害提高6%；使用神针撼海后，下—个当头─棒伤害提高6%。(不可驱散)"
		jns[10]="jpg"
		elseif jn == "逐胜" then
		jns[1] = "与NPC战斗时，你的普通攻击额外攻击1个单位，但普通攻击不再触发追加法术、无心插柳、嗜血幡。"
		jns[10]="jpg"
		elseif jn == "愈勇" then
		jns[1] = "使用如意神通时，会使得自己造成的伤害增加2%，受到的伤害降低2%，持续到使用了防御、法宝或者特技为止。(可叠加3层，不可驱散)"
		jns[10]="jpg"
		elseif jn == "斗志" then
		jns[1] = "你使用的如意神通效果提高6%，但不在下回合随机出现。"
		jns[10]="jpg"
		elseif jn == "忘形" then
		jns[1] = "使队伍的每个玩家增加3%的物理和法术暴击几率。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "贪天" then
		jns[1] = "你使用的如意神通有50%的几率出现在下回合。"
		jns[10]="jpg"
		elseif jn == "显圣" then
		jns[1] = "使用晶清诀、罗汉金钟时减少8点愤怒消耗，并且使你下回合可以使用任何如意神通。"
		jns[10]="jpg"
		elseif jn == "火眼" then
		jns[1] = "弱点击破造成的伤害提高50%."
		jns[10]="jpg"
		elseif jn == "棒打雄风" then--无图标
		jns[1] = "【如意神通】替换技能:杀威铁棒。临时提升伤害力攻击一个敌方单位，同时驱散目标的─个持续时间最短的增益状态。"
		jns[10]="jpg"
		jns[4] = "75点魔法"
		jns[10]="jpg"
		elseif jn == "闹天" then
		jns[1] = "当头─棒提高15%的伤害结果。"
		jns[10]="jpg"
		elseif jn == "铁骨" then
		jns[1] = "装备上的月亮石和翡翠石效果提高40%"
		jns[10]="jpg"
		elseif jn == "填海" then --无图标
		jns[1] = "自身武器或者衣服五行为土时，神针撼海对每个目标有5%的几率造成双倍伤害。(可叠加)"
		jns[10]="jpg"
		elseif jn == "伏妖" then
		jns[1] = "增加(人物力量×10%+40)的伤害力。"
		jns[10]="jpg"
		elseif jn == "豪胆" then
		jns[1] = "暴击几率增加10%."
		jns[10]="jpg"
		elseif jn == "压邪" then
		jns[1] = "连续三回合及以上使用如意神通时，临时增加(人物等级×1.5)点伤害力且造成的伤害增加10%。(不可驱散)"
		jns[10]="jpg"
		elseif jn == "翻天" then --无图标
		jns[1] = "无所遁形持续回合+1。"
		jns[10]="jpg"
		elseif jn == "圈养" then --无图标
		jns[1] = "每场战斗的第—次八戒上身将额外作用于所有敌方玩家。"
		jns[10]="jpg"
		elseif jn == "荡魔" then
		jns[1] = "击倒目标时将立即增加12%的伤害结果，持续2回合。(效果可刷新，不可叠加、不可驱散)"
		jns[10]="jpg"
		elseif jn == "齐天神通" then
		jns[1] = "花果山弟子逆天而立，战天斗地，每回合使用如意神通均有50%的几率额外释放—次，但临时降低30%的抵抗封印能力，状态持续4回合。(此技能为法术技能，受封印法术限制)"
		jns[10]="jpg"
		jns[4] = "60点愤怒"

		jns[12] = "8回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "齐天武圣" then --无图标
		jns[1] = "增加40点物理暴击等级，获得齐天武圣称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

	elseif lp == "斗战真神" then-- 花果山
		if jn == "顽心" then --无图标
		jns[1] = "使用普通攻击时，可以保留当前回合的如意神通至下回合。"
		jns[10]="jpg"
		elseif jn == "逐胜" then --无图标
		jns[1] = "与NPC战斗时，你的普通攻击额外攻击1个单位，但普通攻击不再触发追加法术、无心插柳、嗜血幡。"
		jns[10]="jpg"
		elseif jn == "自在" then --无图标
		jns[1] = "使用如意神通后，有32%几率下回合额外随机1个如意神通。"
		jns[10]="jpg"
		elseif jn == "变通" then --无图标
		jns[1] = "有30%几率额外随机1个如意神通，但你使用的如意神通不在下回合随机出现。"
		jns[10]="jpg"
		elseif jn == "忘形" then --无图标
		jns[1] = "使队伍的每个玩家增加3%的物理和法术暴击几率。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "顽性" then --无图标
		jns[1] = "你使用的如意神通有32%的几率额外出现在下回合。"
		jns[10]="jpg"
		elseif jn == "显圣" then --无图标
		jns[1] = "使用晶清诀、罗汉金钟时减少8点愤怒消耗，并且使你下回合可以使用任何如意神通。"
		jns[10]="jpg"
		elseif jn == "金睛" then --无图标
		jns[1] = "弱点击破造成的伤害提高(15%×本回合可使用如意神通的数量)。"
		jns[10]="jpg"
		elseif jn == "棒打雄风" then --无图标
		jns[1] = "【如意神通】临时提升伤害力攻击一个敌方单位，同时驱散目标的─个持续时间最短的增益状态。"
		jns[10]="jpg"
		jns[2] = "【消耗】75点魔法"
		elseif jn == "通天" then --无图标
		jns[1] = "可使用的如意神通数量≥5时，当头—棒、神针撼海伤害提高18%。"
		jns[10]="jpg"
		elseif jn == "铁骨" then --无图标
		jns[1] = "装备上的月亮石和翡翠石效果提高40%."
		jns[10]="jpg"
		elseif jn == "威震" then --无图标
		jns[1] = "对召唤兽的伤害提高(6%×本回合可使用如意神通的数量)."
		jns[10]="jpg"
		elseif jn == "伏妖" then --无图标
		jns[1] = "增加(人物力量×10%+40)的伤害力."
		jns[10]="jpg"
		elseif jn == "豪胆" then --无图标
		jns[1] = "暴击几率增加10%."
		jns[10]="jpg"
		elseif jn == "压邪" then --无图标
		jns[10]="jpg"
		jns[1] = "连续三回合及以上使用如意神通时，临时增加(人物等级×1.5)点伤害力且造成的伤害增加10%。(不可驱散)"
		elseif jn == "朝拜" then --无图标
		jns[1] = "当你的召唤兽造型为巨力神猿或长眉灵猴，它造成的伤害提高10%。该效果对超级神猴、超级金猴也起效。"
		jns[10]="jpg"
		elseif jn == "圈养" then --无图标
		jns[1] = "每场战斗的第—次八戒上身将额外作用于所有敌方玩家。"
		jns[10]="jpg"
		elseif jn == "荡魔" then --无图标
		jns[1] = "击倒目标时将立即增加12%的伤害结果，持续2回合。(效果可刷新，不可叠加、不可驱散)"
		jns[10]="jpg"
		elseif jn == "战神" then --无图标
		jns[1] = "造成玩家、召唤兽、孩子、NPC单位死亡后，当回合内本方单位对玩家单位造成的物理法术伤害提高8%，且你下回合额外随机1个如意神通。"
		jns[10]="jpg"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "斗战真神" then --无图标
		jns[1] = "增加40点物理暴击等级，获得斗战真神称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns

	elseif lp == "通天行者" then-- 花果山
		if jn == "威仪" then --无图标
		jns[1] = "使用棒掀北斗后，下一个兴风作浪伤害提高6%;使用兴风作浪后，下—个棒掀北斗伤害提高6%。(不可驱散)"
		jns[10]="jpg"
		elseif jn == "闹海" then --无图标
		jns[1] = "与NPC战斗时:兴风作浪必定可以使用，但不再对首目标造成额外伤害。"
		jns[10]="jpg"
		elseif jn == "愈勇" then --无图标
		jns[1] = "使用如意神通时，会使得自己造成的伤害增加2%，受到的伤害降低2%，持续到使用了防御、法宝或者特技为止。(可叠加3层，不可驱散)"
		jns[10]="jpg"
		elseif jn == "斗志" then --无图标
		jns[1] = "你使用的如意神通效果提高6%，但不在下回合随机出现。"
		jns[10]="jpg"
		elseif jn == "忘形" then --无图标
		jns[1] = "使队伍的每个玩家增加3%的物理和法术暴击几率。(不可叠加)"
		jns[10]="jpg"
		elseif jn == "顽性" then --无图标
		jns[1] = "你使用的如意神通有32%的几率额外出现在下回合。"
		jns[10]="jpg"
		elseif jn == "显圣" then --无图标
		jns[1] = "使用晶清诀、罗汉金钟时减少8点愤怒消耗，并且使你下回合可以使用任何如意神通。"
		jns[10]="jpg"
		elseif jn == "逞胜" then --无图标
		jns[1] = "意马心猿攻击的目标如果处于封印状态，额外驱散1个增益状态。"
		jns[10]="jpg"
		elseif jn == "得意" then --无图标
		jns[1] = "使用琴音三叠后，下一个如意神通的伤害提高16%."
		jns[10]="jpg"
		elseif jn == "斗战" then --无图标
		jns[1] = "棒掀北斗提高15%的伤害。"
		jns[10]="jpg"
		elseif jn == "添威" then --无图标
		jns[1] = "使用无所遁形时，有20%几率额外获得1层效果。"
		jns[10]="jpg"
		elseif jn == "胜意" then --无图标
		jns[1] = "兴风作浪对玩家有10%的几率造成双倍伤害。"
		jns[10]="jpg"
		elseif jn == "大圣" then --无图标
		jns[1] = "对召唤兽造成的伤害提高16%。"
		jns[10]="jpg"
		elseif jn == "冲霄" then --无图标
		jns[1] = "回合结束时，增加4点法术伤害力，持续到战斗结束。"
		jns[10]="jpg"
		elseif jn == "锻炼" then --无图标
		jns[1] = "连续三回合及以上使用如意神通后，有10%几率获得“铜头铁臂”效果。"
		jns[10]="jpg"
		elseif jn == "朝拜" then --无图标
		jns[1] = "当你的召唤兽造型为巨力神猿或长眉灵猴，它造成的伤害提高10%。该效果对超级神猴、超级金猴也起效。"
		jns[10]="jpg"
		elseif jn == "圈养" then --无图标
		jns[1] = "每场战斗的第—次八戒上身将额外作用于所有敌方玩家。"
		jns[10]="jpg"
		elseif jn == "荡魔" then --无图标
		jns[1] = "击倒目标时将立即增加12%的伤害结果，持续2回合。(效果可刷新，不可叠加、不可驱散)"
		jns[10]="jpg"
		elseif jn == "齐天神通" then --无图标
		jns[1] = "花果山弟子逆天而立，战天斗地，每回合使用如意神通均有50%的几率额外释放一次，但临时降低30%的抵抗封印能力，状态持续4回合。"
		jns[10]="jpg"
		jns[2] = "【消耗】60点愤怒 【冷却】8回合"
		elseif jn == "额外能力" then --无图标
		jns[1] = "增加40点物理暴击等级。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000001
		jns[8] = 0x10000001
		elseif jn == "通天行者" then --无图标
		jns[1] = "增加40点物理暴击等级，获得通天行者称谓。"
		jns[3] = 8
		jns[6] = "aaa.wdf"
		jns[7] = 0x10000002
		jns[8] = 0x10000002
		end
		return jns
	elseif lp == "铁火战魔" then
	    if jn == "枫魂" then
			jns[1] = "#S铁火战魔#:\n使用枫影二刃必定获得“怒哮”；若已有“怒哮”，枫影二刃对非角色单位造成的伤害提高20%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435509
			jns[8] = 268435510
		elseif jn == "怒刃" then
			jns[1] = "#S铁火战魔#:\n与NPC战斗时，枫影二刃造成的伤害提高25%,如果携带了铸斧，额外提高25%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435511
			jns[8] = 268435512
		elseif jn == "震怒" then
			jns[1] = "#S铁火战魔#:\n使用一斧开天未令目标浮空时，获得“怒哮”的几率提升100%；进入战斗时自动附加“怒哮”。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435513
			jns[8] = 268435520
		elseif jn == "俾睨" then
			jns[1] = "#S铁火战魔#:\n使用三荒尽灭造成的伤害提高15%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435521
			jns[8] = 268435522
		elseif jn == "识破" then
			jns[1] = "#S铁火战魔#:\n如果你的攻击五行克制对方的防御五行，一斧开天和三荒尽灭的浮空概率增加10%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435523
			jns[8] = 268435524
		elseif jn == "得势" then
			jns[1] = "#S铁火战魔#:\n使用一斧开天造成的伤害提高15%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435525
			jns[8] = 268435526
		elseif jn == "飞扬" then
			jns[1] = "#S铁火战魔#:\n如果你使用“三荒尽灭、三荒尽灭、力辟苍穹”技能组合造成≥5个目标同时浮空，你造成的所有伤害提高6%，每场战斗最多叠加3次。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435527
			jns[8] = 268435528
		elseif jn == "凌人" then
			jns[1] = "#S铁火战魔#:\n使用破血狂攻后获得“怒哮”并且下回合“黎魂”触发3个技能概率增加30%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435529
			jns[8] = 268435536
		elseif jn == "生风" then
			jns[1] = "#S铁火战魔#:\n使用铁血生风时如果目标处于浮空状态，有8%概率再释放一次铁血生风，可重复触发。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435537
			jns[8] = 268435538
		elseif jn == "蛮横" then
			jns[1] = "#S铁火战魔#:\n物理暴击几率提升5%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435539
			jns[8] = 268435540
		elseif jn == "难保" then
			jns[1] = "#S铁火战魔#:\n攻击浮空单位时，造成的伤害增加10%，且目标被保护的概率减少20%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435541
			jns[8] = 268435542
		elseif jn == "乘风" then
			jns[1] = "#S铁火战魔#:\n天气为‘风’时，一斧开天必定令目标浮空、三荒尽灭令目标浮空的概率增加10%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435543
			jns[8] = 268435544
		elseif jn == "擎天" then
			jns[1] = "#S铁火战魔#:\n铁火双扬作用目标数增加1，但具有12回合的冷却回合（战斗开始时具有6回合冷却）。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435545
			jns[8] = 268435552
		elseif jn == "族魂" then
			jns[1] = "#S铁火战魔#:\n队伍中包含5名九黎城玩家时，对全部天命门派人物单位造成的伤害提高20%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435553
			jns[8] = 268435554
		elseif jn == "魂力" then
			jns[1] = "#S铁火战魔#:\n炎魂的伤害力增加效果提高60%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435555
			jns[8] = 268435556
		elseif jn == "狂暴" then
			jns[1] = "#S铁火战魔#:\n你的攻击触发暴击时，额外增加一点连击值。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435557
			jns[8] = 268435558
		elseif jn == "驭魔" then
			jns[1] = "#S铁火战魔#:\n驭魔笼效果提高25%。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435559
			jns[8] = 268435560
		elseif jn == "野蛮" then
			jns[1] = "#S铁火战魔#:\n击飞召唤物或孩子单位时，下回合“黎魂”必定触发3个技能。"
			jns[3] = 8
			jns[6] = "jmtb.wdf"
			jns[7] = 268435561
			jns[8] = 268435568
		elseif jn == "魔神之刃" then
			jns[1] = "#S铁火战魔#:\n使用一次特殊的力辟苍穹，造成的伤害提高10%并且暴击伤害倍率增加100%，但仅作用1个浮空目标。（战斗开始时具有2回合冷却）"
			jns[3] = 4
			jns[4] = "20点魔法"
			jns[6] = "jmtb.wdf"
			jns[7] = 268435569
			jns[8] = 268435570
			jns[12] = "8回合"
		elseif jn == "铁火战魔" then
			jns[1] = "增加30点#S速度#W，获得#铁火战魔#W称谓。"
			jns[3] = 8
			jns[6] = "aaa.wdf"
			jns[7] = 0x10000001
			jns[8] = 0x10000001
		elseif jn == "额外能力" then
			jns[1] = "#S铁火战魔#:\n增加30点#S速度#W。"
			jns[3] = 8
			jns[6] = "aaa.wdf"
			jns[7] = 0x10000001
			jns[8] = 0x10000001
		end
		return jns

		end
end