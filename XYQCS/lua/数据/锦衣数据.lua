function 取武器类型(类型)
 local n = {"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼",[911] = "双斧坤",[910] = "双斧乾"}
 if n[类型]~=nil then
     return n[类型]
    else
     return ""
    end
end

function 取普通武器装扮(名称,造型,类型)
   local aa = 取战斗武器装扮(名称,造型,类型)
   return {aa[20], aa[21], aa[10]}
end
local 角色模型 = {
    ["剑侠客"] = "AAAB",
    ["逍遥生"] = "ABCA",
    ["飞燕女"] = "ABDA",
    ["英女侠"] = "AABA",
    ["龙太子"] = "ABBA",
    ["巨魔王"] = "AC0A",
    ["虎头怪"] = "AC1A",
    ["狐美人"] = "AC2A",
    ["骨精灵"] = "AC3A",
    ["神天兵"] = "AC4A",
    ["舞天姬"] = "AC5A",
    ["玄彩娥"] = "AC6A",
    ["偃无师"] = "AC7A",
    ["巫蛮儿"] = "AC8A",
    ["鬼潇潇"] = "AC9A",
    ["羽灵神"] = "AC9B",
    ["影精灵"] = "AC9C",
}
function 取战斗武器装扮(名称,造型,类型)
   local chs = {}
   local ch = 名称.."_"..造型
   if 取武器类型(类型) ~= "" then
      ch = ch.."_"..取武器类型(类型)
   end
   if 名称=="恶魔棘刺" then
      local aaa = 角色模型[造型]
      chs[1] = tonumber("0x"..aaa.."0001")  -- 攻击1
      chs[2] = tonumber("0x"..aaa.."0001")  -- 攻击2
      chs[3] = tonumber("0x"..aaa.."0003")  -- 死亡
      chs[4] = tonumber("0x"..aaa.."0004")  -- 防御
      chs[6] = tonumber("0x"..aaa.."0006")  -- 待战
      chs[7] = tonumber("0x"..aaa.."0007")  -- 施法
      chs[8] = tonumber("0x"..aaa.."0011")  -- 跑去
      chs[9] = tonumber("0x"..aaa.."0009")  -- 挨打
      chs[10] = "111.wdf"  -- 资源
      chs[11] = tonumber("0x"..aaa.."0001")  -- 连击1
      chs[12] = tonumber("0x"..aaa.."0001")  -- 连击2
      chs[13] = tonumber("0x"..aaa.."0001")  -- 连击3
      chs[20] = tonumber("0x"..aaa.."0010")  -- 静立
      chs[21] = tonumber("0x"..aaa.."0011")  -- 移动
   end
   if ch == "凤羽吉光·月白_剑侠客_剑" then
      chs[1]=0xABAA0000--攻击
      chs[2]=0xABAA0000--攻击
      chs[3]=0xABAA0002--死亡
      chs[4]=0xABAA0017--防御
      chs[6]=0xABAA0003--待战
      chs[7]=0xABAA0005--施法
      chs[8]=0xABAA0007--跑去
      chs[9]=0xABAA0008--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0006
      chs[21]=0xABAA0007

   elseif ch == "凤羽吉光·月白_剑侠客_刀" then
      chs[1]=0xABAA0012--攻击
      chs[2]=0xABAA0012--攻击
      chs[3]=0xABAA0014--死亡
      chs[4]=0xABAA0015--防御
      chs[6]=0xABAA0011--待战
      chs[7]=0xABAA0013--施法
      chs[8]=0xABAA0010--跑去
      chs[9]=0xABAA0016--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0009
      chs[21]=0xABAA0010

   elseif ch == "凤羽吉光·月白_影精灵_爪刺" then
      chs[1]=0xABAA0021--攻击
      chs[2]=0xABAA0021--攻击
      chs[3]=0xABAA0024--死亡
      chs[4]=0xABAA0023--防御
      chs[6]=0xABAA0020--待战
      chs[7]=0xABAA0022--施法
      chs[8]=0xABAA0018--跑去
      chs[9]=0xABAA0025--挨打
      chs[10]="武器锦衣.wdf"
      chs[11]=0xABAA0021--攻击
      chs[12]=0xABAA0021--攻击
      chs[13]=0xABAA0021--攻击
      chs[20]=0xABAA0019
      chs[21]=0xABAA0018



   elseif ch == "凤羽吉光·月白_影精灵_魔棒" then
      chs[1]=0xABAA0028--攻击
      chs[2]=0xABAA0028--攻击
      chs[3]=0xABAA0032--死亡
      chs[4]=0xABAA0031--防御
      chs[6]=0xABAA0029--待战
      chs[7]=0xABAA0030--施法
      chs[8]=0xABAA0027--跑去
      chs[9]=0xABAA0033--挨打
      chs[10]="武器锦衣.wdf"
      chs[11]=0xABAA0028--攻击
      chs[12]=0xABAA0028--攻击
      chs[13]=0xABAA0028--攻击
      chs[20]=0xABAA0026
      chs[21]=0xABAA0027

   elseif ch == "凤羽吉光·月白_逍遥生_剑" then
      chs[1]=0xABAA0037--攻击
      chs[2]=0xABAA0037--攻击
      chs[3]=0xABAA0040--死亡
      chs[4]=0xABAA0039--防御
      chs[6]=0xABAA0036--待战
      chs[7]=0xABAA0038--施法
      chs[8]=0xABAA0034--跑去
      chs[9]=0xABAA0041--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0035
      chs[21]=0xABAA0034

   elseif ch == "凤羽吉光·月白_逍遥生_扇" then
      chs[1]=0xABAA0044--攻击
      chs[2]=0xABAA0044--攻击
      chs[3]=0xABAA0128--死亡
      chs[4]=0xABAA0045--防御
      chs[6]=0xABAA0043--待战
      chs[7]=0xABAA0046--施法
      chs[8]=0xABAA0129--跑去
      chs[9]=0xABAA0047--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0042
      chs[21]=0xABAA0129

   elseif ch == "凤羽吉光·月白_飞燕女_环圈" then
      chs[1]=0xABAA0052--攻击
      chs[2]=0xABAA0052--攻击
      chs[3]=0xABAA0054--死亡
      chs[4]=0xABAA0053--防御
      chs[6]=0xABAA0050--待战
      chs[7]=0xABAA0051--施法
      chs[8]=0xABAA0048--跑去
      chs[9]=0xABAA0055--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0049
      chs[21]=0xABAA0048

   elseif ch == "凤羽吉光·月白_飞燕女_双短剑" then
      chs[1]=0xABAA0060--攻击
      chs[2]=0xABAA0060--攻击
      chs[3]=0xABAA0062--死亡
      chs[4]=0xABAA0061--防御
      chs[6]=0xABAA0058--待战
      chs[7]=0xABAA0059--施法
      chs[8]=0xABAA0057--跑去
      chs[9]=0xABAA0063--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0056
      chs[21]=0xABAA0057

   elseif ch == "凤羽吉光·月白_英女侠_鞭" then
      chs[1]=0xABAA0068--攻击
      chs[2]=0xABAA0068--攻击
      chs[3]=0xABAA0070--死亡
      chs[4]=0xABAA0069--防御
      chs[6]=0xABAA0066--待战
      chs[7]=0xABAA0067--施法
      chs[8]=0xABAA0064--跑去
      chs[9]=0xABAA0071--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0065
      chs[21]=0xABAA0064

   elseif ch == "凤羽吉光·月白_英女侠_双短剑" then
      chs[1]=0xABAA0076--攻击
      chs[2]=0xABAA0076--攻击
      chs[3]=0xABAA0078--死亡
      chs[4]=0xABAA0077--防御
      chs[6]=0xABAA0074--待战
      chs[7]=0xABAA0075--施法
      chs[8]=0xABAA0073--跑去
      chs[9]=0xABAA0079--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0072
      chs[21]=0xABAA0073

   elseif ch == "凤羽吉光·月白_龙太子_扇" then
      chs[1]=0xABAA0084--攻击
      chs[2]=0xABAA0084--攻击
      chs[3]=0xABAA0086--死亡
      chs[4]=0xABAA0085--防御
      chs[6]=0xABAA0082--待战
      chs[7]=0xABAA0083--施法
      chs[8]=0xABAA0131--跑去
      chs[9]=0xABAA0087--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0131
      chs[21]=0xABAA0130

   elseif ch == "凤羽吉光·月白_龙太子_枪矛" then
      chs[1]=0xABAA0092--攻击
      chs[2]=0xABAA0092--攻击
      chs[3]=0xABAA0094--死亡
      chs[4]=0xABAA0093--防御
      chs[6]=0xABAA0090--待战
      chs[7]=0xABAA0091--施法
      chs[8]=0xABAA0089--跑去
      chs[9]=0xABAA0095--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0088
      chs[21]=0xABAA0089

   elseif ch == "凤羽吉光·月白_巨魔王_刀" then
      chs[1]=0xABAA0100--攻击
      chs[2]=0xABAA0100--攻击
      chs[3]=0xABAA0102--死亡
      chs[4]=0xABAA0101--防御
      chs[6]=0xABAA0098--待战
      chs[7]=0xABAA0099--施法
      chs[8]=0xABAA0097--跑去
      chs[9]=0xABAA0103--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0096
      chs[21]=0xABAA0097

   elseif ch == "凤羽吉光·月白_巨魔王_斧钺" then
      chs[1]=0xABAA0108--攻击
      chs[2]=0xABAA0108--攻击
      chs[3]=0xABAA0110--死亡
      chs[4]=0xABAA0109--防御
      chs[6]=0xABAA0106--待战
      chs[7]=0xABAA0107--施法
      chs[8]=0xABAA0105--跑去
      chs[9]=0xABAA0111--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0104
      chs[21]=0xABAA0105
   elseif ch == "凤羽吉光·月白_虎头怪_锤" then
      chs[1]=0xABAA0116--攻击
      chs[2]=0xABAA0116--攻击
      chs[3]=0xABAA0118--死亡
      chs[4]=0xABAA0117--防御
      chs[6]=0xABAA0114--待战
      chs[7]=0xABAA0115--施法
      chs[8]=0xABAA0112--跑去
      chs[9]=0xABAA0119--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0113--站立
      chs[21]=0xABAA0112--奔跑
   elseif ch == "凤羽吉光·月白_虎头怪_斧钺" then
      chs[1]=0xABAA0124--攻击
      chs[2]=0xABAA0124--攻击
      chs[3]=0xABAA0126--死亡
      chs[4]=0xABAA0125--防御
      chs[6]=0xABAA0122--待战
      chs[7]=0xABAA0123--施法
      chs[8]=0xABAA0125--跑去
      chs[9]=0xABAA0127--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0120--站立
      chs[21]=0xABAA0121--奔跑
   elseif ch == "凤羽吉光·月白_狐美人_爪刺" then
      chs[1]=0xABAA0136--攻击
      chs[2]=0xABAA0136--攻击
      chs[3]=0xABAA0138--死亡
      chs[4]=0xABAA0137--防御
      chs[6]=0xABAA0134--待战
      chs[7]=0xABAA0135--施法
      chs[8]=0xABAA0133--跑去
      chs[9]=0xABAA0139--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0132--站立
      chs[21]=0xABAA0133--奔跑
   elseif ch == "凤羽吉光·月白_狐美人_鞭" then
      chs[1]=0xABAA0144--攻击
      chs[2]=0xABAA0144--攻击
      chs[3]=0xABAA0146--死亡
      chs[4]=0xABAA0145--防御
      chs[6]=0xABAA0142--待战
      chs[7]=0xABAA0143--施法
      chs[8]=0xABAA0141--跑去
      chs[9]=0xABAA0147--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0140--站立
      chs[21]=0xABAA0141--奔跑
   elseif ch == "凤羽吉光·月白_骨精灵_爪刺" then
      chs[1]=0xABAA0152--攻击
      chs[2]=0xABAA0152--攻击
      chs[3]=0xABAA0154--死亡
      chs[4]=0xABAA0153--防御
      chs[6]=0xABAA0150--待战
      chs[7]=0xABAA0151--施法
      chs[8]=0xABAA0149--跑去
      chs[9]=0xABAA0155--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0148--站立
      chs[21]=0xABAA0149--奔跑
   elseif ch == "凤羽吉光·月白_骨精灵_魔棒" then
      chs[1]=0xABAA0160--攻击
      chs[2]=0xABAA0160--攻击
      chs[3]=0xABAA0162--死亡
      chs[4]=0xABAA0161--防御
      chs[6]=0xABAA0158--待战
      chs[7]=0xABAA0159--施法
      chs[8]=0xABAA0157--跑去
      chs[9]=0xABAA0163--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0156--站立
      chs[21]=0xABAA0157--奔跑
   elseif ch == "凤羽吉光·月白_神天兵_锤" then
      chs[1]=0xABAA0168--攻击
      chs[2]=0xABAA0168--攻击
      chs[3]=0xABAA0170--死亡
      chs[4]=0xABAA0169--防御
      chs[6]=0xABAA0166--待战
      chs[7]=0xABAA0167--施法
      chs[8]=0xABAA0165--跑去
      chs[9]=0xABAA0171--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0164--站立
      chs[21]=0xABAA0165--奔跑
   elseif ch == "凤羽吉光·月白_神天兵_枪矛" then
      chs[1]=0xABAA0176--攻击
      chs[2]=0xABAA0176--攻击
      chs[3]=0xABAA0178--死亡
      chs[4]=0xABAA0177--防御
      chs[6]=0xABAA0174--待战
      chs[7]=0xABAA0175--施法
      chs[8]=0xABAA0173--跑去
      chs[9]=0xABAA0179--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0172--站立
      chs[21]=0xABAA0173--奔跑
   elseif ch == "凤羽吉光·月白_舞天姬_飘带" then
      chs[1]=0xABAA0184--攻击
      chs[2]=0xABAA0184--攻击
      chs[3]=0xABAA0186--死亡
      chs[4]=0xABAA0185--防御
      chs[6]=0xABAA0182--待战
      chs[7]=0xABAA0183--施法
      chs[8]=0xABAA0181--跑去
      chs[9]=0xABAA0187--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0180--站立
      chs[21]=0xABAA0181--奔跑
   elseif ch == "凤羽吉光·月白_舞天姬_环圈" then
      chs[1]=0xABAA0192--攻击
      chs[2]=0xABAA0192--攻击
      chs[3]=0xABAA0194--死亡
      chs[4]=0xABAA0193--防御
      chs[6]=0xABAA0190--待战
      chs[7]=0xABAA0191--施法
      chs[8]=0xABAA0189--跑去
      chs[9]=0xABAA0195--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0188--站立
      chs[21]=0xABAA0189--奔跑
   elseif ch == "凤羽吉光·月白_玄彩娥_魔棒" then
      chs[1]=0xABAA0200--攻击
      chs[2]=0xABAA0200--攻击
      chs[3]=0xABAA0202--死亡
      chs[4]=0xABAA0201--防御
      chs[6]=0xABAA0198--待战
      chs[7]=0xABAA0199--施法
      chs[8]=0xABAA0197--跑去
      chs[9]=0xABAA0203--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0196--站立
      chs[21]=0xABAA0197--奔跑
   elseif ch == "凤羽吉光·月白_玄彩娥_飘带" then
      chs[1]=0xABAA0208--攻击
      chs[2]=0xABAA0208--攻击
      chs[3]=0xABAA0210--死亡
      chs[4]=0xABAA0209--防御
      chs[6]=0xABAA0206--待战
      chs[7]=0xABAA0207--施法
      chs[8]=0xABAA0205--跑去
      chs[9]=0xABAA0211--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0204--站立
      chs[21]=0xABAA0205--奔跑
   elseif ch == "凤羽吉光·月白_偃无师_剑" then
      chs[1]=0xABAA0216--攻击
      chs[2]=0xABAA0216--攻击
      chs[3]=0xABAA0218--死亡
      chs[4]=0xABAA0217--防御
      chs[6]=0xABAA0214--待战
      chs[7]=0xABAA0215--施法
      chs[8]=0xABAA0213--跑去
      chs[9]=0xABAA0219--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0212--站立
      chs[21]=0xABAA0213--奔跑
   elseif ch == "凤羽吉光·月白_偃无师_巨剑" then
      chs[1]=0xABAA0224--攻击
      chs[2]=0xABAA0224--攻击
      chs[3]=0xABAA0226--死亡
      chs[4]=0xABAA0225--防御
      chs[6]=0xABAA0222--待战
      chs[7]=0xABAA0223--施法
      chs[8]=0xABAA0213--跑去
      chs[9]=0xABAA0227--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0220--站立
      chs[21]=0xABAA0221--奔跑
   elseif ch == "凤羽吉光·月白_巫蛮儿_法杖" then
      chs[1]=0xABAA0232--攻击
      chs[2]=0xABAA0232--攻击
      chs[3]=0xABAA0234--死亡
      chs[4]=0xABAA0233--防御
      chs[6]=0xABAA0230--待战
      chs[7]=0xABAA0231--施法
      chs[8]=0xABAA0229--跑去
      chs[9]=0xABAA0235--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0228--站立
      chs[21]=0xABAA0229--奔跑
   elseif ch == "凤羽吉光·月白_巫蛮儿_宝珠" then
      chs[1]=0xABAA0239--攻击
      chs[2]=0xABAA0239--攻击
      chs[3]=0xABAA0242--死亡
      chs[4]=0xABAA0241--防御
      chs[6]=0xABAA0238--待战
      chs[7]=0xABAA0240--施法
      chs[8]=0xABAA0237--跑去
      chs[9]=0xABAA0243--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0236--站立
      chs[21]=0xABAA0237--奔跑
   elseif ch == "凤羽吉光·月白_杀破狼_弓弩" then
      chs[1]=0xABAA0248--攻击
      chs[2]=0xABAA0248--攻击
      chs[3]=0xABAA0250--死亡
      chs[4]=0xABAA0249--防御
      chs[6]=0xABAA0246--待战
      chs[7]=0xABAA0247--施法
      chs[8]=0xABAA0245--跑去
      chs[9]=0xABAA0251--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0244--站立
      chs[21]=0xABAA0245--奔跑
   elseif ch == "凤羽吉光·月白_杀破狼_宝珠" then
      chs[1]=0xABAA0256--攻击
      chs[2]=0xABAA0256--攻击
      chs[3]=0xABAA0258--死亡
      chs[4]=0xABAA0257--防御
      chs[6]=0xABAA0254--待战
      chs[7]=0xABAA0255--施法
      chs[8]=0xABAA0253--跑去
      chs[9]=0xABAA0259--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0252--站立
      chs[21]=0xABAA0253--奔跑
   elseif ch == "凤羽吉光·月白_鬼潇潇_爪刺" then
      chs[1]=0xABAA0264--攻击
      chs[2]=0xABAA0264--攻击
      chs[3]=0xABAA0266--死亡
      chs[4]=0xABAA0265--防御
      chs[6]=0xABAA0262--待战
      chs[7]=0xABAA0263--施法
      chs[8]=0xABAA0260--跑去
      chs[9]=0xABAA0267--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0261--站立
      chs[21]=0xABAA0260--奔跑
   elseif ch == "凤羽吉光·月白_鬼潇潇_伞" then
      chs[1]=0xABAA0272--攻击
      chs[2]=0xABAA0272--攻击
      chs[3]=0xABAA0274--死亡
      chs[4]=0xABAA0273--防御
      chs[6]=0xABAA0270--待战
      chs[7]=0xABAA0271--施法
      chs[8]=0xABAA0269--跑去
      chs[9]=0xABAA0275--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0268--站立
      chs[21]=0xABAA0269--奔跑
   elseif ch == "凤羽吉光·月白_羽灵神_弓弩" then
      chs[1]=0xABAA0280--攻击
      chs[2]=0xABAA0280--攻击
      chs[3]=0xABAA0282--死亡
      chs[4]=0xABAA0281--防御
      chs[6]=0xABAA0278--待战
      chs[7]=0xABAA0279--施法
      chs[8]=0xABAA0277--跑去
      chs[9]=0xABAA0283--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0276--站立
      chs[21]=0xABAA0277--奔跑
   elseif ch == "凤羽吉光·月白_羽灵神_法杖" then
      chs[1]=0xABAA0288--攻击
      chs[2]=0xABAA0288--攻击
      chs[3]=0xABAA0291--死亡
      chs[4]=0xABAA0289--防御
      chs[6]=0xABAA0286--待战
      chs[7]=0xABAA0287--施法
      chs[8]=0xABAA0285--跑去
      chs[9]=0xABAA0290--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0284--站立
      chs[21]=0xABAA0285--奔跑
   elseif ch == "凤羽吉光·月白_桃夭夭_飘带" then
      chs[1]=0xABAA0295--攻击
      chs[2]=0xABAA0295--攻击
      chs[3]=0xABAA0299--死亡
      chs[4]=0xABAA0298--防御
      chs[6]=0xABAA0294--待战
      chs[7]=0xABAA0296--施法
      chs[8]=0xABAA0293--跑去
      chs[9]=0xABAA0297--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0292--站立
      chs[21]=0xABAA0293--奔跑
   elseif ch == "凤羽吉光·月白_桃夭夭_灯笼" then
      chs[1]=0xABAA0304--攻击
      chs[2]=0xABAA0304--攻击
      chs[3]=0xABAA0305--死亡
      chs[4]=0xABAA0306--防御
      chs[6]=0xABAA0302--待战
      chs[7]=0xABAA0303--施法
      chs[8]=0xABAA0301--跑去
      chs[9]=0xABAA0307--挨打
      chs[10]="武器锦衣.wdf"
      chs[20]=0xABAA0300--站立
      chs[21]=0xABAA0301--奔跑















   elseif ch == "凤羽吉光_剑侠客_剑" then
      chs[1]=0xBBBAA001--攻击
      chs[2]=0xBBBAA001--攻击
      chs[3]=0xBBBAA003--死亡
      chs[4]=0xBBBAA002--防御
      chs[6]=0xBBBAA004--待战
      chs[7]=0xAA000006--施法
      chs[8]=0xBBBAA010--跑去
      chs[9]=0xBBBAA005--挨打
      chs[10]="wjj.dll"
      chs[20]=0xBBBAA009
      chs[21]=0xBBBAA010

   elseif ch == "凤羽吉光_剑侠客_刀" then
      chs[1]=0xBBBA0001--攻击
      chs[2]=0xBBBA0001--攻击
      chs[3]=0xBBBA0003--死亡
      chs[4]=0xBBBA0002--防御
      chs[6]=0xBBBA0004--待战
      chs[7]=0xBBBA0006--施法
      chs[8]=0xBBBA0010--跑去
      chs[9]=0xBBBA0005--挨打
      chs[10]="wjj.dll"
      chs[20]=0xBBBA0009
      chs[21]=0xBBBA0010

   end
   return chs
end




function 取普通锦衣模型(名称,造型,类型)
   local chs = {}
   local ch = 名称.."_"..造型
   if 取武器类型(类型) ~= "" then
      ch = ch.."_"..取武器类型(类型)
   end
if ch == "春日宴_飞燕女" then
   chs[2]=0xFAF00005   chs[1]=0xFAF00009  chs[3]="cry.dll"
elseif ch == "春日宴_飞燕女_双短剑" then
   chs[2]=0xFAF00005   chs[1]=0xFAF00009  chs[3]="cry.dll"
elseif ch == "春日宴_飞燕女_环圈" then
   chs[2]=0xFAF00005   chs[1]=0xFAF00009  chs[3]="cry.dll"
elseif ch == "春日宴_骨精灵" then
   chs[2]=0xFAF00023  chs[1]=0xFAF00026  chs[3]="cry.dll"
elseif ch == "春日宴_骨精灵_魔棒" then
   chs[2]=0xFAF00023   chs[1]=0xFAF00026   chs[3]="cry.dll"
elseif ch == "春日宴_骨精灵_爪刺" then
   chs[2]=0xFAF00023   chs[1]=0xFAF00026   chs[3]="cry.dll"
elseif ch == "春日宴_鬼潇潇" then
   chs[2]=0xFAF00039  chs[1]=0xFAF00042  chs[3]="cry.dll"
elseif ch == "春日宴_鬼潇潇_伞" then
   chs[2]=0xFAF00039  chs[1]=0xFAF00042  chs[3]="cry.dll"
elseif ch == "春日宴_鬼潇潇_爪刺" then
   chs[2]=0xFAF00048  chs[1]=0xFAF00051  chs[3]="cry.dll"
elseif ch == "春日宴_狐美人" then
   chs[2]=0xFAF00057  chs[1]=0xFAF00060  chs[3]="cry.dll"
elseif ch == "春日宴_狐美人_鞭" then
   chs[2]=0xFAF00057  chs[1]=0xFAF00060  chs[3]="cry.dll"
elseif ch == "春日宴_狐美人_爪刺" then
   chs[2]=0xFAF00057  chs[1]=0xFAF00060  chs[3]="cry.dll"
elseif ch == "春日宴_虎头怪" then
   chs[2]=0xFAF00073  chs[1]=0xFAF00076  chs[3]="cry.dll"
elseif ch == "春日宴_虎头怪_锤" then
   chs[2]=0xFAF00073  chs[1]=0xFAF00076  chs[3]="cry.dll"
elseif ch == "春日宴_虎头怪_斧钺" then
   chs[2]=0xFAF00073  chs[1]=0xFAF00076  chs[3]="cry.dll"
elseif ch == "春日宴_剑侠客" then
   chs[2]=0xFAF00090   chs[1]=0xFAF00093  chs[3]="cry.dll"
elseif ch == "春日宴_剑侠客_刀" then
   chs[2]=0xFAF00090   chs[1]=0xFAF00093  chs[3]="cry.dll"
elseif ch == "春日宴_剑侠客_剑" then
   chs[2]=0xFAF00090   chs[1]=0xFAF00093  chs[3]="cry.dll"
elseif ch == "春日宴_巨魔王" then
   chs[2]=0xFAF00107  chs[1]=0xFAF00110  chs[3]="cry.dll"
elseif ch == "春日宴_巨魔王_斧钺" then
   chs[2]=0xFAF00107  chs[1]=0xFAF00110  chs[3]="cry.dll"
elseif ch == "春日宴_巨魔王_刀" then
   chs[2]=0xFAF00107  chs[1]=0xFAF00110  chs[3]="cry.dll"
elseif ch == "春日宴_龙太子" then
   chs[2]=0xFAF00123  chs[1]=0xFAF00126  chs[3]="cry.dll"
elseif ch == "春日宴_龙太子_枪矛" then
   chs[2]=0xFAF00123  chs[1]=0xFAF00126  chs[3]="cry.dll"
elseif ch == "春日宴_龙太子_扇" then
   chs[2]=0xFAF00123  chs[1]=0xFAF00126  chs[3]="cry.dll"
elseif ch == "春日宴_杀破狼" then
   chs[2]=0xFAF00139  chs[1]=0xFAF00142  chs[3]="cry.dll"
elseif ch == "春日宴_杀破狼_宝珠" then
   chs[2]=0xFAF00139  chs[1]=0xFAF00142  chs[3]="cry.dll"
elseif ch == "春日宴_杀破狼_弓弩" then
   chs[2]=0xFAF00148  chs[1]=0xFAF00151  chs[3]="cry.dll"
elseif ch == "春日宴_神天兵" then
   chs[2]=0xFAF00157  chs[1]=0xFAF00160  chs[3]="cry.dll"
elseif ch == "春日宴_神天兵_锤" then
   chs[2]=0xFAF00157  chs[1]=0xFAF00160  chs[3]="cry.dll"
elseif ch == "春日宴_神天兵_枪矛" then
   chs[2]=0xFAF00157  chs[1]=0xFAF00160  chs[3]="cry.dll"
elseif ch == "春日宴_桃夭夭" then
   chs[2]=0xFAF00173  chs[1]=0xFAF00176  chs[3]="cry.dll"
elseif ch == "春日宴_桃夭夭_灯笼" then
   chs[2]=0xFAF00173  chs[1]=0xFAF00176  chs[3]="cry.dll"
elseif ch == "春日宴_桃夭夭_飘带" then
   chs[2]=0xFAF00182  chs[1]=0xFAF00185  chs[3]="cry.dll"
elseif ch == "春日宴_巫蛮儿" then
   chs[2]=0xFAF00191  chs[1]=0xFAF00194  chs[3]="cry.dll"
elseif ch == "春日宴_巫蛮儿_法杖" then
   chs[2]=0xFAF00191  chs[1]=0xFAF00194  chs[3]="cry.dll"
elseif ch == "春日宴_巫蛮儿_宝珠" then
   chs[2]=0xFAF00191  chs[1]=0xFAF00194  chs[3]="cry.dll"
elseif ch == "春日宴_舞天姬" then
   chs[2]=0xFAF00207  chs[1]=0xFAF00210  chs[3]="cry.dll"
elseif ch == "春日宴_舞天姬_环圈" then
   chs[2]=0xFAF00207  chs[1]=0xFAF00210  chs[3]="cry.dll"
elseif ch == "春日宴_舞天姬_飘带" then
   chs[2]=0xFAF00207  chs[1]=0xFAF00210  chs[3]="cry.dll"
elseif ch == "春日宴_逍遥生" then
   chs[2]=0xFAF00223  chs[1]=0xFAF00226  chs[3]="cry.dll"
elseif ch == "春日宴_逍遥生_剑" then
   chs[2]=0xFAF00223  chs[1]=0xFAF00226  chs[3]="cry.dll"
elseif ch == "春日宴_逍遥生_扇" then
   chs[2]=0xFAF00232  chs[1]=0xFAF00235  chs[3]="cry.dll"
elseif ch == "春日宴_玄彩娥" then
   chs[2]=0xFAF00241  chs[1]=0xFAF00244  chs[3]="cry.dll"
elseif ch == "春日宴_玄彩娥_飘带" then
   chs[2]=0xFAF00241  chs[1]=0xFAF00244  chs[3]="cry.dll"
elseif ch == "春日宴_玄彩娥_魔棒" then
   chs[2]=0xFAF00241  chs[1]=0xFAF00244  chs[3]="cry.dll"
elseif ch == "春日宴_偃无师" then
   chs[2]=0xFAF00266  chs[1]=0xFAF00269  chs[3]="cry.dll"
elseif ch == "春日宴_偃无师_巨剑" then
   chs[2]=0xFAF00266  chs[1]=0xFAF00269  chs[3]="cry.dll"
elseif ch == "春日宴_偃无师_剑" then
   chs[2]=0xFAF00257  chs[1]=0xFAF00260  chs[3]="cry.dll"
elseif ch == "春日宴_英女侠" then
   chs[2]=0xFAF00275  chs[1]=0xFAF00278  chs[3]="cry.dll"
elseif ch == "春日宴_英女侠_鞭" then
   chs[2]=0xFAF00275  chs[1]=0xFAF00278  chs[3]="cry.dll"
elseif ch == "春日宴_英女侠_双短剑" then
   chs[2]=0xFAF00275  chs[1]=0xFAF00278  chs[3]="cry.dll"
elseif ch == "春日宴_影精灵" then
   chs[2]=0xFAF00291  chs[1]=0xFAF00294  chs[3]="cry.dll"
elseif ch == "春日宴_影精灵_双斧乾" then
   chs[2]=0xFAF00291  chs[1]=0xFAF00294  chs[3]="cry.dll"
elseif ch == "春日宴_影精灵_双斧坤" then
   chs[2]=0xFAF00291  chs[1]=0xFAF00294  chs[3]="cry.dll"
elseif ch == "春日宴_影精灵_爪刺" then
   chs[2]=0xFAF00300  chs[1]=0xFAF00303  chs[3]="cry.dll"
elseif ch == "春日宴_影精灵_魔棒" then
   chs[2]=0xFAF00309  chs[1]=0xFAF00312  chs[3]="cry.dll"
elseif ch == "春日宴_羽灵神" then
   chs[2]=0xFAF00318  chs[1]=0xFAF00321  chs[3]="cry.dll"
elseif ch == "春日宴_羽灵神_法杖" then
   chs[2]=0xFAF00318  chs[1]=0xFAF00321  chs[3]="cry.dll"
elseif ch == "春日宴_羽灵神_弓弩" then
   chs[2]=0xFAF00327  chs[1]=0xFAF00330  chs[3]="cry.dll"












elseif ch == "旃檀香·墨黑_剑侠客" then
   chs[2]=0xBAA00002   chs[1]=0xBAA00001  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_剑侠客_刀" then
   chs[2]=0xBAA00002   chs[1]=0xBAA00001  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_剑侠客_剑" then
   chs[2]=0xBAA00002   chs[1]=0xBAA00001  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_飞燕女" then
   chs[2]=0xBAA00020   chs[1]=0xBAA00019  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_飞燕女_双短剑" then
   chs[2]=0xBAA00020   chs[1]=0xBAA00019  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_飞燕女_环圈" then
   chs[2]=0xBAA00020   chs[1]=0xBAA00019  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_骨精灵" then
   chs[2]=0xBAA00036  chs[1]=0xBAA00035  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_骨精灵_魔棒" then
   chs[2]=0xBAA00036   chs[1]=0xBAA00035   chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_骨精灵_爪刺" then
   chs[2]=0xBAA00036   chs[1]=0xBAA00035   chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_鬼潇潇" then
   chs[2]=0xBAA00052  chs[1]=0xBAA00051  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_鬼潇潇_伞" then
   chs[2]=0xBAA00052  chs[1]=0xBAA00051  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_鬼潇潇_爪刺" then
   chs[2]=0xBAA00054  chs[1]=0xBAA00053  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_狐美人" then
   chs[2]=0xBAA00070  chs[1]=0xBAA00069  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_狐美人_鞭" then
   chs[2]=0xBAA00070  chs[1]=0xBAA00069  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_狐美人_爪刺" then
   chs[2]=0xBAA00070  chs[1]=0xBAA00069  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_虎头怪" then
   chs[2]=0xBAA00086  chs[1]=0xBAA00085  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_虎头怪_锤" then
   chs[2]=0xBAA00086  chs[1]=0xBAA00085  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_虎头怪_斧钺" then
   chs[2]=0xBAA00086  chs[1]=0xBAA00085  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_巨魔王" then
   chs[2]=0xBAA00102  chs[1]=0xBAA00101  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巨魔王_斧钺" then
   chs[2]=0xBAA00102  chs[1]=0xBAA00101  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巨魔王_刀" then
   chs[2]=0xBAA00102  chs[1]=0xBAA00101  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_龙太子" then
   chs[2]=0xBAA00118  chs[1]=0xBAA00117  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_龙太子_枪矛" then
   chs[2]=0xBAA00118  chs[1]=0xBAA00117  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_龙太子_扇" then
   chs[2]=0xBAA00118  chs[1]=0xBAA00117  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_杀破狼" then
   chs[2]=0xBAA00134  chs[1]=0xBAA00133  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_杀破狼_宝珠" then
   chs[2]=0xBAA00134  chs[1]=0xBAA00133  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_杀破狼_弓弩" then
   chs[2]=0xBAA00136  chs[1]=0xBAA00135  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_神天兵" then
   chs[2]=0xBAA00152  chs[1]=0xBAA00151  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_神天兵_锤" then
   chs[2]=0xBAA00152  chs[1]=0xBAA00151  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_神天兵_枪矛" then
   chs[2]=0xBAA00152  chs[1]=0xBAA00151  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_桃夭夭" then
   chs[2]=0xBAA00168  chs[1]=0xBAA00167  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_桃夭夭_灯笼" then
   chs[2]=0xBAA00168  chs[1]=0xBAA00167  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_桃夭夭_飘带" then
   chs[2]=0xBAA00170  chs[1]=0xBAA00169  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_巫蛮儿" then
   chs[2]=0xBAA00186  chs[1]=0xBAA00185  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巫蛮儿_法杖" then
   chs[2]=0xBAA00186  chs[1]=0xBAA00185  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巫蛮儿_宝珠" then
   chs[2]=0xBAA00186  chs[1]=0xBAA00185  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_舞天姬" then
   chs[2]=0xBAA00202  chs[1]=0xBAA00201  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_舞天姬_环圈" then
   chs[2]=0xBAA00202  chs[1]=0xBAA00201  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_舞天姬_飘带" then
   chs[2]=0xBAA00202  chs[1]=0xBAA00201  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_逍遥生" then
   chs[2]=0xBAA00218  chs[1]=0xBAA00217  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_逍遥生_剑" then
   chs[2]=0xBAA00218  chs[1]=0xBAA00217  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_逍遥生_扇" then
   chs[2]=0xBAA00220  chs[1]=0xBAA00219  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_玄彩娥" then
   chs[2]=0xBAA00236  chs[1]=0xBAA00235  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_玄彩娥_飘带" then
   chs[2]=0xBAA00236  chs[1]=0xBAA00235  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_玄彩娥_魔棒" then
   chs[2]=0xBAA00236  chs[1]=0xBAA00235  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_偃无师" then
   chs[2]=0xBAA00245  chs[1]=0xBAA00244  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_偃无师_巨剑" then
   chs[2]=0xBAA00245  chs[1]=0xBAA00244  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_偃无师_剑" then
   chs[2]=0xBAA00247  chs[1]=0xBAA00246  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_英女侠" then
   chs[2]=0xBAA00270  chs[1]=0xBAA00269  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_英女侠_鞭" then
   chs[2]=0xBAA00270  chs[1]=0xBAA00269  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_英女侠_双短剑" then
   chs[2]=0xBAA00270  chs[1]=0xBAA00269  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_羽灵神" then
   chs[2]=0xBAA00286  chs[1]=0xBAA00285  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_羽灵神_法杖" then
   chs[2]=0xBAA00286  chs[1]=0xBAA00285  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_羽灵神_弓弩" then
   chs[2]=0xBAA00288  chs[1]=0xBAA00287  chs[3]="audio/1155.mp3"

elseif ch == "旃檀香·墨黑_影精灵" then
   chs[2]=0xBAA00304  chs[1]=0xBAA00303  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_影精灵_双斧乾" then
   chs[2]=0xBAA00304  chs[1]=0xBAA00303  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_影精灵_双斧坤" then
   chs[2]=0xBAA00304  chs[1]=0xBAA00303  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_影精灵_爪刺" then
   chs[2]=0xBAA00308  chs[1]=0xBAA00307  chs[3]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_影精灵_魔棒" then
   chs[2]=0xBAA00306  chs[1]=0xBAA00305  chs[3]="audio/1155.mp3"








elseif ch == "小福兔·月白_剑侠客" then
   chs[2]=0xAABA0010   chs[1]=0xAABA0009  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_剑侠客_刀" then
   chs[2]=0xAABA0010   chs[1]=0xAABA0009  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_剑侠客_剑" then
   chs[2]=0xAABA0020   chs[1]=0xAABA0019  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_飞燕女" then
   chs[2]=0xAABA0030   chs[1]=0xAABA0029  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_飞燕女_双短剑" then
   chs[2]=0xAABA0030   chs[1]=0xAABA0029   chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_飞燕女_环圈" then
   chs[2]=0xAABA0030   chs[1]=0xAABA0029   chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_骨精灵" then
   chs[2]=0xAABA0050  chs[1]=0xAABA0049  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_骨精灵_魔棒" then
   chs[2]=0xAABA0050   chs[1]=0xAABA0049   chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_骨精灵_爪刺" then
   chs[2]=0xAABA0050   chs[1]=0xAABA0049   chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_鬼潇潇" then
   chs[2]=0xAABA0070  chs[1]=0xAABA0069  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_鬼潇潇_伞" then
   chs[2]=0xAABA0070  chs[1]=0xAABA0069  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_鬼潇潇_爪刺" then
   chs[2]=0xAABA0080  chs[1]=0xAABA0079  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_狐美人" then
   chs[2]=0xAABA0090  chs[1]=0xAABA0089  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_狐美人_鞭" then
   chs[2]=0xAABA0090  chs[1]=0xAABA0089  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_狐美人_爪刺" then
   chs[2]=0xAABA0100  chs[1]=0xAABA0099  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_虎头怪" then
   chs[2]=0xAABA0110  chs[1]=0xAABA0109  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_虎头怪_锤" then
   chs[2]=0xAABA0110  chs[1]=0xAABA0109  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_虎头怪_斧钺" then
   chs[2]=0xAABA0110  chs[1]=0xAABA0109  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_巨魔王" then
   chs[2]=0xAABA0130  chs[1]=0xAABA0129  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_巨魔王_斧钺" then
   chs[2]=0xAABA0130  chs[1]=0xAABA0129  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_巨魔王_刀" then
   chs[2]=0xAABA0130  chs[1]=0xAABA0129  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_龙太子" then
   chs[2]=0xAABA0150  chs[1]=0xAABA0149  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_龙太子_枪矛" then
   chs[2]=0xAABA0150  chs[1]=0xAABA0149  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_龙太子_扇" then
   chs[2]=0xAABA0150  chs[1]=0xAABA0149  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_杀破狼" then
   chs[2]=0xAABA0170  chs[1]=0xAABA0169  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_杀破狼_宝珠" then
   chs[2]=0xAABA0170  chs[1]=0xAABA0169  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_杀破狼_弓弩" then
   chs[2]=0xAABA0180  chs[1]=0xAABA0179  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_神天兵" then
   chs[2]=0xAABA0190  chs[1]=0xAABA0189  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_神天兵_锤" then
   chs[2]=0xAABA0190  chs[1]=0xAABA0189  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_神天兵_枪矛" then
   chs[2]=0xAABA0190  chs[1]=0xAABA0189  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_桃夭夭" then
   chs[2]=0xAABA0210  chs[1]=0xAABA0209  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_桃夭夭_灯笼" then
   chs[2]=0xAABA0210  chs[1]=0xAABA0209  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_桃夭夭_飘带" then
   chs[2]=0xAABA0220  chs[1]=0xAABA0219  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_巫蛮儿" then
   chs[2]=0xAABA0230  chs[1]=0xAABA0229  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_巫蛮儿_法杖" then
   chs[2]=0xAABA0230  chs[1]=0xAABA0229  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_巫蛮儿_宝珠" then
   chs[2]=0xAABA0230  chs[1]=0xAABA0229  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_舞天姬" then
   chs[2]=0xAABA0250  chs[1]=0xAABA0249  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_舞天姬_环圈" then
   chs[2]=0xAABA0250  chs[1]=0xAABA0249  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_舞天姬_飘带" then
   chs[2]=0xAABA0260  chs[1]=0xAABA0259  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_逍遥生" then
   chs[2]=0xAABA0270  chs[1]=0xAABA0269  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_逍遥生_剑" then
   chs[2]=0xAABA0270  chs[1]=0xAABA0269  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_逍遥生_扇" then
   chs[2]=0xAABA0280  chs[1]=0xAABA0279  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_玄彩娥" then
   chs[2]=0xAABA0300  chs[1]=0xAABA0299  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_玄彩娥_飘带" then
   chs[2]=0xAABA0300  chs[1]=0xAABA0299  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_玄彩娥_魔棒" then
   chs[2]=0xAABA0290  chs[1]=0xAABA0289  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_偃无师" then
   chs[2]=0xAABA0320  chs[1]=0xAABA0319  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_偃无师_巨剑" then
   chs[2]=0xAABA0320  chs[1]=0xAABA0319  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_偃无师_剑" then
   chs[2]=0xAABA0310  chs[1]=0xAABA0309  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_英女侠" then
   chs[2]=0xAABA0330  chs[1]=0xAABA0329  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_英女侠_鞭" then
   chs[2]=0xAABA0330  chs[1]=0xAABA0329  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_英女侠_双短剑" then
   chs[2]=0xAABA0340  chs[1]=0xAABA0339  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_羽灵神" then
   chs[2]=0xAABA0360  chs[1]=0xAABA0359  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_羽灵神_法杖" then
   chs[2]=0xAABA0360  chs[1]=0xAABA0359  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_羽灵神_弓弩" then
   chs[2]=0xAABA0350  chs[1]=0xAABA0349  chs[3]="audio/1515.mp3"

elseif ch == "小福兔·月白_影精灵" then
   chs[2]=0xAABA0393  chs[1]=0xAABA0392  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_影精灵_双斧乾" then
   chs[2]=0xAABA0393  chs[1]=0xAABA0392  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_影精灵_双斧坤" then
   chs[2]=0xAABA0393  chs[1]=0xAABA0392  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_影精灵_爪刺" then
   chs[2]=0xAABA0380  chs[1]=0xAABA0379  chs[3]="audio/1515.mp3"
elseif ch == "小福兔·月白_影精灵_魔棒" then
   chs[2]=0xAABA0370  chs[1]=0xAABA0369  chs[3]="audio/1515.mp3"





elseif ch == "浮生绡·点黛_剑侠客" then
   chs[2]=0xAAA00002   chs[1]=0xAAA00001  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_剑侠客_刀" then
   chs[2]=0xAAA00002   chs[1]=0xAAA00001  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_剑侠客_剑" then
   chs[2]=0xAAA00002   chs[1]=0xAAA00001  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_飞燕女" then
   chs[2]=0xAAA00015   chs[1]=0xAAA00014  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_飞燕女_双短剑" then
   chs[2]=0xAAA00015   chs[1]=0xAAA00014   chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_飞燕女_环圈" then
   chs[2]=0xAAA00015   chs[1]=0xAAA00014   chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_骨精灵" then
   chs[2]=0xAAA00032  chs[1]=0xAAA00031  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_骨精灵_魔棒" then
   chs[2]=0xAAA00032   chs[1]=0xAAA00031   chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_骨精灵_爪刺" then
   chs[2]=0xAAA00032   chs[1]=0xAAA00031   chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_鬼潇潇" then
   chs[2]=0xAAA00048  chs[1]=0xAAA00047  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_鬼潇潇_伞" then
   chs[2]=0xAAA00048  chs[1]=0xAAA00047  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_鬼潇潇_爪刺" then
   chs[2]=0xAAA00056  chs[1]=0xAAA00055  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_狐美人" then
   chs[2]=0xAAA00065  chs[1]=0xAAA00064  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_狐美人_鞭" then
   chs[2]=0xAAA00065  chs[1]=0xAAA00064  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_狐美人_爪刺" then
   chs[2]=0xAAA00056  chs[1]=0xAAA00055  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_影精灵" then
   chs[2]=0xAAA00081  chs[1]=0xAAA00080  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_影精灵_双斧乾" then
   chs[2]=0xAAA00081  chs[1]=0xAAA00080  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_影精灵_双斧坤" then
   chs[2]=0xAAA00081  chs[1]=0xAAA00080  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_影精灵_爪刺" then
   chs[2]=0xAAA00091  chs[1]=0xAAA00090  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_影精灵_魔棒" then
   chs[2]=0xAAA00100  chs[1]=0xAAA00099  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_虎头怪" then
   chs[2]=0xAAA00110  chs[1]=0xAAA00109  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_虎头怪_锤" then
   chs[2]=0xAAA00110  chs[1]=0xAAA00109  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_虎头怪_斧钺" then
   chs[2]=0xAAA00110  chs[1]=0xAAA00109  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_巨魔王" then
   chs[2]=0xAAA00126  chs[1]=0xAAA00125  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巨魔王_斧钺" then
   chs[2]=0xAAA00126  chs[1]=0xAAA00125  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巨魔王_刀" then
   chs[2]=0xAAA00126  chs[1]=0xAAA00125  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_龙太子" then
   chs[2]=0xAAA00142  chs[1]=0xAAA00141  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_龙太子_枪矛" then
   chs[2]=0xAAA00142  chs[1]=0xAAA00141  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_龙太子_扇" then
   chs[2]=0xAAA00142  chs[1]=0xAAA00141  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_杀破狼" then
   chs[2]=0xAAA00157  chs[1]=0xAAA00156  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_杀破狼_宝珠" then
   chs[2]=0xAAA00157  chs[1]=0xAAA00156  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_杀破狼_弓弩" then
   chs[2]=0xAAA00166  chs[1]=0xAAA00165  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_神天兵" then
   chs[2]=0xAAA00174  chs[1]=0xAAA00173  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_神天兵_锤" then
   chs[2]=0xAAA00174  chs[1]=0xAAA00173  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_神天兵_枪矛" then
   chs[2]=0xAAA00174  chs[1]=0xAAA00173  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_桃夭夭" then
   chs[2]=0xAAA00190  chs[1]=0xAAA00189  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_桃夭夭_灯笼" then
   chs[2]=0xAAA00190  chs[1]=0xAAA00189  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_桃夭夭_飘带" then
   chs[2]=0xAAA00199  chs[1]=0xAAA00198  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_巫蛮儿" then
   chs[2]=0xAAA00208  chs[1]=0xAAA00207  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巫蛮儿_法杖" then
   chs[2]=0xAAA00208  chs[1]=0xAAA00207  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巫蛮儿_宝珠" then
   chs[2]=0xAAA00208  chs[1]=0xAAA00207  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_舞天姬" then
   chs[2]=0xAAA00224  chs[1]=0xAAA00223  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_舞天姬_环圈" then
   chs[2]=0xAAA00224  chs[1]=0xAAA00223  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_舞天姬_飘带" then
   chs[2]=0xAAA00233  chs[1]=0xAAA00232  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_逍遥生" then
   chs[2]=0xAAA00242  chs[1]=0xAAA00241  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_逍遥生_剑" then
   chs[2]=0xAAA00242  chs[1]=0xAAA00241  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_逍遥生_扇" then
   chs[2]=0xAAA00251  chs[1]=0xAAA00250  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_玄彩娥" then
   chs[2]=0xAAA00260  chs[1]=0xAAA00259  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_玄彩娥_飘带" then
   chs[2]=0xAAA00260  chs[1]=0xAAA00259  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_玄彩娥_魔棒" then
   chs[2]=0xAAA00269  chs[1]=0xAAA00268  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_偃无师" then
   chs[2]=0xAAA00278  chs[1]=0xAAA00277  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_偃无师_巨剑" then
   chs[2]=0xAAA00278  chs[1]=0xAAA00277  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_偃无师_剑" then
   chs[2]=0xAAA00287  chs[1]=0xAAA00286  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_英女侠" then
   chs[2]=0xAAA00296  chs[1]=0xAAA00295  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_英女侠_鞭" then
   chs[2]=0xAAA00296  chs[1]=0xAAA00295  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_英女侠_双短剑" then
   chs[2]=0xAAA00304  chs[1]=0xAAA00303  chs[3]="audio/1405.mp3"

elseif ch == "浮生绡·点黛_羽灵神" then
   chs[2]=0xAAA00314  chs[1]=0xAAA00313  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_羽灵神_法杖" then
   chs[2]=0xAAA00314  chs[1]=0xAAA00313  chs[3]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_羽灵神_弓弩" then
   chs[2]=0xAAA00323  chs[1]=0xAAA00322  chs[3]="audio/1405.mp3"









elseif ch == "浮生_飞燕女" then
   chs[2]=0xAA000010   chs[1]=0xAA000009  chs[3]="audio/1503.mp3"
elseif ch == "浮生_飞燕女_双短剑" then
   chs[2]=0xAA000020   chs[1]=0xAA000019   chs[3]="audio/1503.mp3"
elseif ch == "浮生_飞燕女_环圈" then
   chs[2]=0xAA000010   chs[1]=0xAA000009   chs[3]="audio/1503.mp3"

elseif ch == "浮生_剑侠客" then
   chs[2]=0xAA000120   chs[1]=0xAA000119   chs[3]="audio/1503.mp3"
elseif ch == "浮生_剑侠客_刀" then
   chs[2]=0xAA000120   chs[1]=0xAA000119   chs[3]="audio/1503.mp3"
elseif ch == "浮生_剑侠客_剑" then
   chs[2]=0xAA000110   chs[1]=0xAA000109   chs[3]="audio/1503.mp3"

elseif ch == "浮生_逍遥生" then
   chs[2]=0xAA000270   chs[1]=0xAA000269   chs[3]="audio/1503.mp3"
elseif ch == "浮生_逍遥生_剑" then
   chs[2]=0xAA000270   chs[1]=0xAA000269   chs[3]="audio/1503.mp3"
elseif ch == "浮生_逍遥生_扇" then
   chs[2]=0xAA000280   chs[1]=0xAA000279   chs[3]="audio/1503.mp3"

elseif ch == "浮生_英女侠" then
   chs[2]=0xAA000330   chs[1]=0xAA000329   chs[3]="audio/1503.mp3"
elseif ch == "浮生_英女侠_鞭" then
   chs[2]=0xAA000330   chs[1]=0xAA000329   chs[3]="audio/1503.mp3"
elseif ch == "浮生_英女侠_双短剑" then
   chs[2]=0xAA000340   chs[1]=0xAA000339   chs[3]="audio/1503.mp3"

elseif ch == "浮生_偃无师" then
   chs[2]=0xAA000320   chs[1]=0xAA000319   chs[3]="audio/1503.mp3"
elseif ch == "浮生_偃无师_剑" then
   chs[2]=0xAA000310   chs[1]=0xAA000309   chs[3]="audio/1503.mp3"
elseif ch == "浮生_偃无师_巨剑" then
   chs[2]=0xAA000320   chs[1]=0xAA000319   chs[3]="audio/1503.mp3"

elseif ch == "浮生_巫蛮儿" then
   chs[2]=0xAA000230   chs[1]=0xAA000229   chs[3]="audio/1503.mp3"
elseif ch == "浮生_巫蛮儿_法杖" then
   chs[2]=0xAA000240   chs[1]=0xAA000239   chs[3]="audio/1503.mp3"
elseif ch == "浮生_巫蛮儿_宝珠" then
   chs[2]=0xAA000230   chs[1]=0xAA000229   chs[3]="audio/1503.mp3"

elseif ch == "浮生_巨魔王" then
   chs[2]=0xAA000130   chs[1]=0xAA000129   chs[3]="audio/1503.mp3"
elseif ch == "浮生_巨魔王_刀" then
   chs[2]=0xAA000130   chs[1]=0xAA000129   chs[3]="audio/1503.mp3"
elseif ch == "浮生_巨魔王_斧钺" then
   chs[2]=0xAA000140   chs[1]=0xAA000139   chs[3]="audio/1503.mp3"

elseif ch == "浮生_虎头怪" then
   chs[2]=0xAA000090   chs[1]=0xAA000089   chs[3]="audio/1503.mp3"
elseif ch == "浮生_虎头怪_锤" then
   chs[2]=0xAA000090   chs[1]=0xAA000089   chs[3]="audio/1503.mp3"
elseif ch == "浮生_虎头怪_斧钺" then
   chs[2]=0xAA000100   chs[1]=0xAA000099   chs[3]="audio/1503.mp3"

elseif ch == "浮生_狐美人" then
   chs[2]=0xAA000080   chs[1]=0xAA000079   chs[3]="audio/1503.mp3"
elseif ch == "浮生_狐美人_鞭" then
   chs[2]=0xAA000080   chs[1]=0xAA000079   chs[3]="audio/1503.mp3"
elseif ch == "浮生_狐美人_爪刺" then
   chs[2]=0xAA000080   chs[1]=0xAA000079   chs[3]="audio/1503.mp3"

elseif ch == "浮生_骨精灵" then
   chs[2]=0xAA000030   chs[1]=0xAA000029   chs[3]="audio/1503.mp3"
elseif ch == "浮生_骨精灵_魔棒" then
   chs[2]=0xAA000030   chs[1]=0xAA000029   chs[3]="audio/1503.mp3"
elseif ch == "浮生_骨精灵_爪刺" then
   chs[2]=0xAA000040   chs[1]=0xAA000039   chs[3]="audio/1503.mp3"

elseif ch == "浮生_影精灵" then
   chs[2]=0xAA000353   chs[1]=0xAA000352   chs[3]="audio/1503.mp3"
elseif ch == "浮生_影精灵_双斧乾" then
   chs[2]=0xAA000353   chs[1]=0xAA000352   chs[3]="audio/1503.mp3"
elseif ch == "浮生_影精灵_双斧坤" then
   chs[2]=0xAA000353   chs[1]=0xAA000352   chs[3]="audio/1503.mp3"
elseif ch == "浮生_影精灵_魔棒" then
   chs[2]=0xA0000030   chs[1]=0xA0000029   chs[3]="audio/1132.mp3"
elseif ch == "浮生_影精灵_爪刺" then
   chs[2]=0xA0000040   chs[1]=0xA0000039   chs[3]="audio/1132.mp3"

elseif ch == "浮生_杀破狼" then
   chs[2]=0xAA000170   chs[1]=0xAA000169   chs[3]="audio/1503.mp3"
elseif ch == "浮生_杀破狼_宝珠" then
   chs[2]=0xAA000170   chs[1]=0xAA000169   chs[3]="audio/1503.mp3"
elseif ch == "浮生_杀破狼_弓弩" then
   chs[2]=0xAA000180   chs[1]=0xAA000179   chs[3]="audio/1503.mp3"

elseif ch == "浮生_鬼潇潇" then
   chs[2]=0xAA000050   chs[1]=0xAA000049   chs[3]="audio/1503.mp3"
elseif ch == "浮生_鬼潇潇_爪刺" then
   chs[2]=0xAA000060   chs[1]=0xAA000059   chs[3]="audio/1503.mp3"
elseif ch == "浮生_鬼潇潇_伞" then
   chs[2]=0xAA000050   chs[1]=0xAA000049   chs[3]="audio/1503.mp3"

elseif ch == "浮生_神天兵" then
   chs[2]=0xAA000190   chs[1]=0xAA000189   chs[3]="audio/1503.mp3"
elseif ch == "浮生_神天兵_锤" then
   chs[2]=0xAA000190   chs[1]=0xAA000189   chs[3]="audio/1503.mp3"
elseif ch == "浮生_神天兵_枪矛" then
   chs[2]=0xAA000200   chs[1]=0xAA000199   chs[3]="audio/1503.mp3"

elseif ch == "浮生_龙太子" then
   chs[2]=0xAA000150   chs[1]=0xAA000149   chs[3]="audio/1503.mp3"
elseif ch == "浮生_龙太子_枪矛" then
   chs[2]=0xAA000150   chs[1]=0xAA000149   chs[3]="audio/1503.mp3"
elseif ch == "浮生_龙太子_扇" then
   chs[2]=0xAA000160   chs[1]=0xAA000159   chs[3]="audio/1503.mp3"

elseif ch == "浮生_舞天姬" then
   chs[2]=0xAA000250   chs[1]=0xAA000249   chs[3]="audio/1503.mp3"
elseif ch == "浮生_舞天姬_环圈" then
   chs[2]=0xAA000250   chs[1]=0xAA000249   chs[3]="audio/1503.mp3"
elseif ch == "浮生_舞天姬_飘带" then
   chs[2]=0xAA000260   chs[1]=0xAA000259   chs[3]="audio/1503.mp3"

elseif ch == "浮生_玄彩娥" then
   chs[2]=0xAA000290   chs[1]=0xAA000289   chs[3]="audio/1503.mp3"
elseif ch == "浮生_玄彩娥_魔棒" then
   chs[2]=0xAA000290   chs[1]=0xAA000289   chs[3]="audio/1503.mp3"
elseif ch == "浮生_玄彩娥_飘带" then
   chs[2]=0xAA000300   chs[1]=0xAA000299   chs[3]="audio/1503.mp3"

elseif ch == "浮生_羽灵神" then
   chs[2]=0xAA000363   chs[1]=0xAA000362   chs[3]="audio/1503.mp3"
elseif ch == "浮生_羽灵神_法杖" then
   chs[2]=0xAA000373   chs[1]=0xAA000372   chs[3]="audio/1503.mp3"
elseif ch == "浮生_羽灵神_弓弩" then
   chs[2]=0xAA000363   chs[1]=0xAA000362   chs[3]="audio/1503.mp3"

elseif ch == "浮生_桃夭夭" then
   chs[2]=0xAA000220   chs[1]=0xAA000219   chs[3]="audio/1503.mp3"
elseif ch == "浮生_桃夭夭_飘带" then
   chs[2]=0xAA000230   chs[1]=0xAA000229   chs[3]="audio/1503.mp3"
elseif ch == "浮生_桃夭夭_灯笼" then
   chs[2]=0xAA000220   chs[1]=0xAA000219   chs[3]="audio/1503.mp3"
--===========================================================青花瓷================================================================================
elseif ch == "青花瓷_飞燕女" then
   chs[2]=0xA0000010   chs[1]=0xA0000009  chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_飞燕女_双短剑" then
   chs[2]=0xA0000020   chs[1]=0xA0000019   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_飞燕女_环圈" then
   chs[2]=0xA0000010   chs[1]=0xA0000009   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_剑侠客" then
   chs[2]=0xA0000120   chs[1]=0xA0000119   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_剑侠客_刀" then
   chs[2]=0xA0000120   chs[1]=0xA0000119   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_剑侠客_剑" then
   chs[2]=0xA0000110   chs[1]=0xA0000109   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_逍遥生" then
   chs[2]=0xA0000270   chs[1]=0xA0000269   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_逍遥生_剑" then
   chs[2]=0xA0000270   chs[1]=0xA0000269   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_逍遥生_扇" then
   chs[2]=0xA0000280   chs[1]=0xA0000279   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_英女侠" then
   chs[2]=0xA0000330   chs[1]=0xA0000329   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_英女侠_鞭" then
   chs[2]=0xA0000330   chs[1]=0xA0000329   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_英女侠_双短剑" then
   chs[2]=0xA0000340   chs[1]=0xA0000339   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_偃无师" then
   chs[2]=0xA0000320   chs[1]=0xA0000319   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_偃无师_剑" then
   chs[2]=0xA0000310   chs[1]=0xA0000309   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_偃无师_巨剑" then
   chs[2]=0xA0000320   chs[1]=0xA0000319   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_巫蛮儿" then
   chs[2]=0xA0000230   chs[1]=0xA0000229   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_巫蛮儿_法杖" then
   chs[2]=0xA0000240   chs[1]=0xA0000239   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_巫蛮儿_宝珠" then
   chs[2]=0xA0000230   chs[1]=0xA0000229   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_巨魔王" then
   chs[2]=0xA0000130   chs[1]=0xA0000129   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_巨魔王_刀" then
   chs[2]=0xA0000130   chs[1]=0xA0000129   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_巨魔王_斧钺" then
   chs[2]=0xA0000140   chs[1]=0xA0000139   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_虎头怪" then
   chs[2]=0xA0000090   chs[1]=0xA0000089   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_虎头怪_锤" then
   chs[2]=0xA0000090   chs[1]=0xA0000089   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_虎头怪_斧钺" then
   chs[2]=0xA0000100   chs[1]=0xA0000099   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_狐美人" then
   chs[2]=0xA0000080   chs[1]=0xA0000079   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_狐美人_鞭" then
   chs[2]=0xA0000080   chs[1]=0xA0000079   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_狐美人_爪刺" then
   chs[2]=0xA0000080   chs[1]=0xA0000079   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_骨精灵" then
   chs[2]=0xA0000030   chs[1]=0xA0000029   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_骨精灵_魔棒" then
   chs[2]=0xA0000030   chs[1]=0xA0000029   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_骨精灵_爪刺" then
   chs[2]=0xA0000040   chs[1]=0xA0000039   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_影精灵" then
   chs[2]=0xA0000353   chs[1]=0xA0000352   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_影精灵_双斧乾" then
   chs[2]=0xA0000353   chs[1]=0xA0000352   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_影精灵_双斧坤" then
   chs[2]=0xA0000353   chs[1]=0xA0000352   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_影精灵_魔棒" then
   chs[2]=0xA0000010   chs[1]=0xA0000009   chs[3]="audio/1132.mp3"
elseif ch == "青花瓷_影精灵_爪刺" then
   chs[2]=0xA0000020   chs[1]=0xA0000019   chs[3]="audio/1132.mp3"

elseif ch == "青花瓷_杀破狼" then
   chs[2]=0xA0000170   chs[1]=0xA0000169   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_杀破狼_宝珠" then
   chs[2]=0xA0000170   chs[1]=0xA0000169   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_杀破狼_弓弩" then
   chs[2]=0xA0000180   chs[1]=0xA0000179   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_鬼潇潇" then
   chs[2]=0xA0000050   chs[1]=0xA0000049   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_鬼潇潇_爪刺" then
   chs[2]=0xA0000060   chs[1]=0xA0000059   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_鬼潇潇_伞" then
   chs[2]=0xA0000050   chs[1]=0xA0000049   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_神天兵" then
   chs[2]=0xA0000190   chs[1]=0xA0000189   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_神天兵_锤" then
   chs[2]=0xA0000190   chs[1]=0xA0000189   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_神天兵_枪矛" then
   chs[2]=0xA0000200   chs[1]=0xA0000199   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_龙太子" then
   chs[2]=0xA0000150   chs[1]=0xA0000149   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_龙太子_枪矛" then
   chs[2]=0xA0000150   chs[1]=0xA0000149   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_龙太子_扇" then
   chs[2]=0xA0000160   chs[1]=0xA0000159   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_舞天姬" then
   chs[2]=0xA0000250   chs[1]=0xA0000249   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_舞天姬_环圈" then
   chs[2]=0xA0000250   chs[1]=0xA0000249   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_舞天姬_飘带" then
   chs[2]=0xA0000260   chs[1]=0xA0000259   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_玄彩娥" then
   chs[2]=0xA0000290   chs[1]=0xA0000289   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_玄彩娥_魔棒" then
   chs[2]=0xA0000290   chs[1]=0xA0000289   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_玄彩娥_飘带" then
   chs[2]=0xA0000300   chs[1]=0xA0000299   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_羽灵神" then
   chs[2]=0xA0000363   chs[1]=0xA0000362   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_羽灵神_法杖" then
   chs[2]=0xA0000373   chs[1]=0xA0000372   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_羽灵神_弓弩" then
   chs[2]=0xA0000363   chs[1]=0xA0000362   chs[3]="audio/1130.mp3"

elseif ch == "青花瓷_桃夭夭" then
   chs[2]=0xA0000220   chs[1]=0xA0000219   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_桃夭夭_飘带" then
   chs[2]=0xA0000230   chs[1]=0xA0000229   chs[3]="audio/1130.mp3"
elseif ch == "青花瓷_桃夭夭_灯笼" then
   chs[2]=0xA0000220   chs[1]=0xA0000219   chs[3]="audio/1130.mp3"

   end
   return chs
end

function 取战斗锦衣模型(名称,造型,类型)
   local chs = {}
   if 造型==nil then
      if 造型 =="影精灵" then
            造型 ="骨精灵"
      end
   end
   local ch = 名称.."_"..造型
   if 取武器类型(类型) ~= "" then
      ch = ch.."_"..取武器类型(类型)
   end
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
if ch == "春日宴_飞燕女" then
   chs[1]=0xFAF00003   chs[2]=0xFAF00003   chs[3]=0xFAF00001 chs[4]=0xFAF00002   chs[6]=0xFAF00008 chs[7]=0xFAF00006   chs[8]=0xFAF00010  chs[9]=0xFAF00004   chs[10]="cry.dll"
elseif ch == "春日宴_飞燕女_环圈" then
   chs[1]=0xFAF00003   chs[2]=0xFAF00003   chs[3]=0xFAF00001 chs[4]=0xFAF00002   chs[6]=0xFAF00008 chs[7]=0xFAF00006   chs[8]=0xFAF00010  chs[9]=0xFAF00004   chs[10]="cry.dll"
elseif ch == "春日宴_飞燕女_双短剑" then
   chs[1]=0xFAF00014   chs[2]=0xFAF00014   chs[3]=0xFAF00012 chs[4]=0xFAF00013   chs[6]=0xFAF00017 chs[7]=0xFAF00016   chs[8]=0xFAF00011  chs[9]=0xFAF00015   chs[10]="cry.dll"

  -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_骨精灵" then
   chs[1]=0xFAF00021   chs[2]=0xFAF00021   chs[3]=0xFAF00019 chs[4]=0xFAF00020   chs[6]=0xFAF00025 chs[7]=0xFAF00024   chs[8]=0xFAF00018   chs[9]=0xFAF00022   chs[10]="cry.dll"
elseif ch == "春日宴_骨精灵_魔棒" then
   chs[1]=0xFAF00021   chs[2]=0xFAF00021   chs[3]=0xFAF00019 chs[4]=0xFAF00020   chs[6]=0xFAF00025 chs[7]=0xFAF00024   chs[8]=0xFAF00018   chs[9]=0xFAF00022   chs[10]="cry.dll"
elseif ch == "春日宴_骨精灵_爪刺" then
   chs[1]=0xFAF00030   chs[2]=0xFAF00030   chs[3]=0xFAF00028 chs[4]=0xFAF00029   chs[6]=0xFAF00033 chs[7]=0xFAF00032   chs[8]=0xFAF00018   chs[9]=0xFAF00031   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_鬼潇潇" then
   chs[1]=0xFAF00037   chs[2]=0xFAF00037   chs[3]=0xFAF00035 chs[4]=0xFAF00036   chs[6]=0xFAF00041 chs[7]=0xFAF00040   chs[8]=0xFAF00034   chs[9]=0xFAF00038   chs[10]="cry.dll"
elseif ch == "春日宴_鬼潇潇_伞" then
   chs[1]=0xFAF00037   chs[2]=0xFAF00037   chs[3]=0xFAF00035 chs[4]=0xFAF00036   chs[6]=0xFAF00041 chs[7]=0xFAF00040   chs[8]=0xFAF00034   chs[9]=0xFAF00038   chs[10]="cry.dll"
elseif ch == "春日宴_鬼潇潇_爪刺" then
   chs[1]=0xFAF00046   chs[2]=0xFAF00046   chs[3]=0xFAF00044 chs[4]=0xFAF00045   chs[6]=0xFAF00050 chs[7]=0xFAF00049   chs[8]=0xFAF00043   chs[9]=0xFAF00047   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_狐美人" then
   chs[1]=0xFAF00055   chs[2]=0xFAF00055   chs[3]=0xFAF00053 chs[4]=0xFAF00054   chs[6]=0xFAF00059 chs[7]=0xFAF00058   chs[8]=0xFAF00052   chs[9]=0xFAF00056   chs[10]="cry.dll"
elseif ch == "春日宴_狐美人_鞭" then
   chs[1]=0xFAF00055   chs[2]=0xFAF00055   chs[3]=0xFAF00053 chs[4]=0xFAF00054   chs[6]=0xFAF00059 chs[7]=0xFAF00058   chs[8]=0xFAF00052   chs[9]=0xFAF00056   chs[10]="cry.dll"
elseif ch == "春日宴_狐美人_爪刺" then
   chs[1]=0xFAF00064   chs[2]=0xFAF00064   chs[3]=0xFAF00062 chs[4]=0xFAF00063   chs[6]=0xFAF00067 chs[7]=0xFAF00066   chs[8]=0xFAF00061   chs[9]=0xFAF00065   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_虎头怪" then
   chs[1]=0xFAF00071   chs[2]=0xFAF00071   chs[3]=0xFAF00069 chs[4]=0xFAF00070   chs[6]=0xFAF00075 chs[7]=0xFAF00074   chs[8]=0xFAF00068   chs[9]=0xFAF00072   chs[10]="cry.dll"
elseif ch == "春日宴_虎头怪_锤" then
   chs[1]=0xFAF00071   chs[2]=0xFAF00071   chs[3]=0xFAF00069 chs[4]=0xFAF00070   chs[6]=0xFAF00075 chs[7]=0xFAF00074   chs[8]=0xFAF00068   chs[9]=0xFAF00072   chs[10]="cry.dll"
elseif ch == "春日宴_虎头怪_斧钺" then
   chs[1]=0xFAF00080   chs[2]=0xFAF00080   chs[3]=0xFAF00078 chs[4]=0xFAF00079   chs[6]=0xFAF00083 chs[7]=0xFAF00082   chs[8]=0xFAF00077   chs[9]=0xFAF00081   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_剑侠客" then
   chs[1]=0xFAF00088   chs[2]=0xFAF00088   chs[3]=0xFAF00086 chs[4]=0xFAF00087   chs[6]=0xFAF00092 chs[7]=0xFAF00091   chs[8]=0xFAF00085   chs[15]=0xFAF00084 chs[9]=0xFAF00089   chs[10]="cry.dll"
elseif ch == "春日宴_剑侠客_刀" then
   chs[1]=0xFAF00088   chs[2]=0xFAF00088   chs[3]=0xFAF00086 chs[4]=0xFAF00087   chs[6]=0xFAF00092 chs[7]=0xFAF00091   chs[8]=0xFAF00085   chs[15]=0xFAF00084 chs[9]=0xFAF00089   chs[10]="cry.dll"
elseif ch == "春日宴_剑侠客_剑" then
   chs[1]=0xFAF00098   chs[2]=0xFAF00098   chs[3]=0xFAF00096 chs[4]=0xFAF00097   chs[6]=0xFAF00101 chs[7]=0xFAF00100   chs[8]=0xFAF00095   chs[15]=0xFAF00094 chs[9]=0xFAF00099   chs[10]="cry.dll"


   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_巨魔王" then
   chs[1]=0xFAF00114   chs[2]=0xFAF00114   chs[3]=0xFAF00112 chs[4]=0xFAF00113   chs[6]=0xFAF00117 chs[7]=0xFAF00116   chs[8]=0xFAF00111   chs[9]=0xFAF00115   chs[10]="cry.dll"
elseif ch == "春日宴_巨魔王_斧钺" then
   chs[1]=0xFAF00114   chs[2]=0xFAF00114   chs[3]=0xFAF00112 chs[4]=0xFAF00113   chs[6]=0xFAF00117 chs[7]=0xFAF00116   chs[8]=0xFAF00111   chs[9]=0xFAF00115   chs[10]="cry.dll"
elseif ch == "春日宴_巨魔王_刀" then
   chs[1]=0xFAF00105   chs[2]=0xFAF00105   chs[3]=0xFAF00103 chs[4]=0xFAF00104   chs[6]=0xFAF00109 chs[7]=0xFAF00108   chs[8]=0xFAF00102   chs[9]=0xFAF00106   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_龙太子" then
   chs[1]=0xFAF00121   chs[2]=0xFAF00121   chs[3]=0xFAF00119 chs[4]=0xFAF00120   chs[6]=0xFAF00125 chs[7]=0xFAF00124   chs[8]=0xFAF00118   chs[9]=0xFAF00122   chs[10]="cry.dll"
elseif ch == "春日宴_龙太子_枪矛" then
   chs[1]=0xFAF00121   chs[2]=0xFAF00121   chs[3]=0xFAF00119 chs[4]=0xFAF00120   chs[6]=0xFAF00125 chs[7]=0xFAF00124   chs[8]=0xFAF00118   chs[9]=0xFAF00122   chs[10]="cry.dll"
elseif ch == "春日宴_龙太子_扇" then
   chs[1]=0xFAF00130   chs[2]=0xFAF00130   chs[3]=0xFAF00128 chs[4]=0xFAF00129   chs[6]=0xFAF00133 chs[7]=0xFAF00132   chs[8]=0xFAF00127   chs[9]=0xFAF00131   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_杀破狼" then
   chs[1]=0xFAF00137   chs[2]=0xFAF00137   chs[3]=0xFAF00135 chs[4]=0xFAF00136   chs[6]=0xFAF00141 chs[7]=0xFAF00140   chs[8]=0xFAF00134   chs[9]=0xFAF00138   chs[10]="cry.dll"
elseif ch == "春日宴_杀破狼_宝珠" then
   chs[1]=0xFAF00137   chs[2]=0xFAF00137   chs[3]=0xFAF00135 chs[4]=0xFAF00136   chs[6]=0xFAF00141 chs[7]=0xFAF00140   chs[8]=0xFAF00134   chs[9]=0xFAF00138   chs[10]="cry.dll"
elseif ch == "春日宴_杀破狼_弓弩" then
   chs[1]=0xFAF00146   chs[2]=0xFAF00146   chs[3]=0xFAF00144 chs[4]=0xFAF00145   chs[6]=0xFAF00150 chs[7]=0xFAF00149   chs[8]=0xFAF00143   chs[9]=0xFAF00147   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_神天兵" then
   chs[1]=0xFAF00155   chs[2]=0xFAF00155   chs[3]=0xFAF00153 chs[4]=0xFAF00154   chs[6]=0xFAF00159 chs[7]=0xFAF00158   chs[8]=0xFAF00152   chs[9]=0xFAF00156   chs[10]="cry.dll"
elseif ch == "春日宴_神天兵_锤" then
   chs[1]=0xFAF00155   chs[2]=0xFAF00155   chs[3]=0xFAF00153 chs[4]=0xFAF00154   chs[6]=0xFAF00159 chs[7]=0xFAF00158   chs[8]=0xFAF00152   chs[9]=0xFAF00156   chs[10]="cry.dll"
elseif ch == "春日宴_神天兵_枪矛" then
   chs[1]=0xFAF00164   chs[2]=0xFAF00164   chs[3]=0xFAF00162 chs[4]=0xFAF00163   chs[6]=0xFAF00167 chs[7]=0xFAF00166   chs[8]=0xFAF00161   chs[9]=0xFAF00165   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_桃夭夭" then
   chs[1]=0xFAF00171   chs[2]=0xFAF00171   chs[3]=0xFAF00169 chs[4]=0xFAF00170   chs[6]=0xFAF00175 chs[7]=0xFAF00174   chs[8]=0xFAF00168   chs[9]=0xFAF00172   chs[10]="cry.dll"
elseif ch == "春日宴_桃夭夭_灯笼" then
   chs[1]=0xFAF00171   chs[2]=0xFAF00171   chs[3]=0xFAF00169 chs[4]=0xFAF00170   chs[6]=0xFAF00175 chs[7]=0xFAF00174   chs[8]=0xFAF00168   chs[9]=0xFAF00172   chs[10]="cry.dll"
elseif ch == "春日宴_桃夭夭_飘带" then
   chs[1]=0xFAF00180   chs[2]=0xFAF00180   chs[3]=0xFAF00178 chs[4]=0xFAF00179   chs[6]=0xFAF00184 chs[7]=0xFAF00183   chs[8]=0xFAF00177   chs[9]=0xFAF00181   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_巫蛮儿" then
   chs[1]=0xFAF00198   chs[2]=0xFAF00198   chs[3]=0xFAF00196 chs[4]=0xFAF00197   chs[6]=0xFAF00201 chs[7]=0xFAF00200   chs[8]=0xFAF00195   chs[9]=0xFAF00199   chs[10]="cry.dll"
elseif ch == "春日宴_巫蛮儿_法杖" then
   chs[1]=0xFAF00198   chs[2]=0xFAF00198   chs[3]=0xFAF00196 chs[4]=0xFAF00197   chs[6]=0xFAF00201 chs[7]=0xFAF00200   chs[8]=0xFAF00195   chs[9]=0xFAF00199   chs[10]="cry.dll"
elseif ch == "春日宴_巫蛮儿_宝珠" then
   chs[1]=0xFAF00189   chs[2]=0xFAF00189   chs[3]=0xFAF00187 chs[4]=0xFAF00188   chs[6]=0xFAF00193 chs[7]=0xFAF00192   chs[8]=0xFAF00186   chs[9]=0xFAF00190   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_舞天姬" then
   chs[1]=0xFAF00205   chs[2]=0xFAF00205   chs[3]=0xFAF00203 chs[4]=0xFAF00204   chs[6]=0xFAF00209 chs[7]=0xFAF00208   chs[8]=0xFAF00202   chs[9]=0xFAF00206   chs[10]="cry.dll"
elseif ch == "春日宴_舞天姬_环圈" then
   chs[1]=0xFAF00205   chs[2]=0xFAF00205   chs[3]=0xFAF00203 chs[4]=0xFAF00204   chs[6]=0xFAF00209 chs[7]=0xFAF00208   chs[8]=0xFAF00202   chs[9]=0xFAF00206   chs[10]="cry.dll"
elseif ch == "春日宴_舞天姬_飘带" then
   chs[1]=0xFAF00214   chs[2]=0xFAF00214   chs[3]=0xFAF00212 chs[4]=0xFAF00213   chs[6]=0xFAF00217 chs[7]=0xFAF00216   chs[8]=0xFAF00211   chs[9]=0xFAF00215   chs[10]="cry.dll"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_逍遥生" then
   chs[1]=0xFAF00221   chs[2]=0xFAF00221   chs[3]=0xFAF00219 chs[4]=0xFAF00220   chs[6]=0xFAF00225 chs[7]=0xFAF00224   chs[8]=0xFAF00218   chs[9]=0xFAF00222   chs[10]="cry.dll"
elseif ch == "春日宴_逍遥生_剑" then
   chs[1]=0xFAF00221   chs[2]=0xFAF00221   chs[3]=0xFAF00219 chs[4]=0xFAF00220   chs[6]=0xFAF00225 chs[7]=0xFAF00224   chs[8]=0xFAF00218   chs[9]=0xFAF00222   chs[10]="cry.dll"
elseif ch == "春日宴_逍遥生_扇" then
   chs[1]=0xFAF00230   chs[2]=0xFAF00230   chs[3]=0xFAF00228 chs[4]=0xFAF00229   chs[6]=0xFAF00234 chs[7]=0xFAF00233   chs[8]=0xFAF00227   chs[9]=0xFAF00231   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_玄彩娥" then
   chs[1]=0xFAF00248   chs[2]=0xFAF00248   chs[3]=0xFAF00246 chs[4]=0xFAF00247   chs[6]=0xFAF00251 chs[7]=0xFAF00250   chs[8]=0xFAF00245   chs[9]=0xFAF00249   chs[10]="cry.dll"
elseif ch == "春日宴_玄彩娥_飘带" then
   chs[1]=0xFAF00248   chs[2]=0xFAF00248   chs[3]=0xFAF00246 chs[4]=0xFAF00247   chs[6]=0xFAF00251 chs[7]=0xFAF00250   chs[8]=0xFAF00245   chs[9]=0xFAF00249   chs[10]="cry.dll"
elseif ch == "春日宴_玄彩娥_魔棒" then
   chs[1]=0xFAF00239   chs[2]=0xFAF00239   chs[3]=0xFAF00237 chs[4]=0xFAF00238   chs[6]=0xFAF00243 chs[7]=0xFAF00242   chs[8]=0xFAF00239   chs[9]=0xFAF00240   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_偃无师" then
   chs[1]=0xFAF00264   chs[2]=0xFAF00264   chs[3]=0xFAF00262 chs[4]=0xFAF00263   chs[6]=0xFAF00268 chs[7]=0xFAF00267   chs[8]=0xFAF00261   chs[9]=0xFAF00265   chs[10]="cry.dll"
elseif ch == "春日宴_偃无师_巨剑" then
   chs[1]=0xFAF00264   chs[2]=0xFAF00264   chs[3]=0xFAF00262 chs[4]=0xFAF00263   chs[6]=0xFAF00268 chs[7]=0xFAF00267   chs[8]=0xFAF00261   chs[9]=0xFAF00265   chs[10]="cry.dll"
elseif ch == "春日宴_偃无师_剑" then
   chs[1]=0xFAF00255   chs[2]=0xFAF00255   chs[3]=0xFAF00253 chs[4]=0xFAF00254   chs[6]=0xFAF00259 chs[7]=0xFAF00258   chs[8]=0xFAF00252   chs[9]=0xFAF00256   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_英女侠" then
   chs[1]=0xFAF00273   chs[2]=0xFAF00273   chs[3]=0xFAF00271 chs[4]=0xFAF00272   chs[6]=0xFAF00277 chs[7]=0xFAF00276   chs[8]=0xFAF00270   chs[9]=0xFAF00274   chs[10]="cry.dll"
elseif ch == "春日宴_英女侠_鞭" then
   chs[1]=0xFAF00273   chs[2]=0xFAF00273   chs[3]=0xFAF00271 chs[4]=0xFAF00272   chs[6]=0xFAF00277 chs[7]=0xFAF00276   chs[8]=0xFAF00270   chs[9]=0xFAF00274   chs[10]="cry.dll"
elseif ch == "春日宴_英女侠_双短剑" then
   chs[1]=0xFAF00282   chs[2]=0xFAF00282   chs[3]=0xFAF00280 chs[4]=0xFAF00281   chs[6]=0xFAF00285 chs[7]=0xFAF00284   chs[8]=0xFAF00279   chs[9]=0xFAF00283   chs[10]="cry.dll"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_影精灵" then
   chs[1]=0xFAF00289   chs[2]=0xFAF00289   chs[3]=0xFAF00287 chs[4]=0xFAF00288   chs[6]=0xFAF00293 chs[7]=0xFAF00292   chs[8]=0xFAF00286   chs[9]=0xFAF00290   chs[10]="cry.dll" chs[11]=0xFAF00289 chs[12]=0xFAF00289 chs[13]=0xFAF00289
elseif ch == "春日宴_影精灵_双斧乾" then
   chs[1]=0xFAF00289   chs[2]=0xFAF00289   chs[3]=0xFAF00287 chs[4]=0xFAF00288   chs[6]=0xFAF00293 chs[7]=0xFAF00292   chs[8]=0xFAF00286   chs[9]=0xFAF00290   chs[10]="cry.dll" chs[11]=0xFAF00289 chs[12]=0xFAF00289 chs[13]=0xFAF00289
elseif ch == "春日宴_影精灵_双斧坤" then
   chs[1]=0xFAF00289   chs[2]=0xFAF00289   chs[3]=0xFAF00287 chs[4]=0xFAF00288   chs[6]=0xFAF00293 chs[7]=0xFAF00292   chs[8]=0xFAF00286   chs[9]=0xFAF00290   chs[10]="cry.dll" chs[11]=0xFAF00289 chs[12]=0xFAF00289 chs[13]=0xFAF00289
elseif ch == "春日宴_影精灵_爪刺" then
   chs[1]=0xFAF00298   chs[2]=0xFAF00298   chs[3]=0xFAF00296 chs[4]=0xFAF00297   chs[6]=0xFAF00302 chs[7]=0xFAF00301   chs[8]=0xFAF00295   chs[9]=0xFAF00299   chs[10]="cry.dll"  chs[11]=0xFAF00298  chs[12]=0xFAF00298  chs[13]=0xFAF00298
elseif ch == "春日宴_影精灵_魔棒" then
   chs[1]=0xFAF00307   chs[2]=0xFAF00307   chs[3]=0xFAF00305 chs[4]=0xFAF00306   chs[6]=0xFAF00311 chs[7]=0xFAF00310   chs[8]=0xFAF00304   chs[9]=0xFAF00308   chs[10]="cry.dll"  chs[11]=0xFAF00307  chs[12]=0xFAF00307  chs[13]=0xFAF00307

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "春日宴_羽灵神" then
   chs[1]=0xFAF00316   chs[2]=0xFAF00316   chs[3]=0xFAF00314 chs[4]=0xFAF00315   chs[6]=0xFAF00320 chs[7]=0xFAF00319   chs[8]=0xFAF00313   chs[9]=0xFAF00317   chs[10]="cry.dll"
elseif ch == "春日宴_羽灵神_法杖" then
   chs[1]=0xFAF00316   chs[2]=0xFAF00316   chs[3]=0xFAF00314 chs[4]=0xFAF00315   chs[6]=0xFAF00320 chs[7]=0xFAF00319   chs[8]=0xFAF00313   chs[9]=0xFAF00317   chs[10]="cry.dll"
elseif ch == "春日宴_羽灵神_弓弩" then
   chs[1]=0xFAF00325   chs[2]=0xFAF00325   chs[3]=0xFAF00323 chs[4]=0xFAF00324   chs[6]=0xFAF00329 chs[7]=0xFAF00328   chs[8]=0xFAF00322   chs[9]=0xFAF00326   chs[10]="cry.dll"



















   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_剑侠客" then
   chs[1]=0xBAA00005   chs[2]=0xBAA00005   chs[3]=0xBAA00007 chs[4]=0xBAA00006   chs[6]=0xBAA00003 chs[7]=0xBAA00004   chs[8]=0xBAA00009   chs[15]=0xBAA00008 chs[9]=0xBAA00010   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_剑侠客_刀" then
   chs[1]=0xBAA00005   chs[2]=0xBAA00005   chs[3]=0xBAA00007 chs[4]=0xBAA00006   chs[6]=0xBAA00003 chs[7]=0xBAA00004   chs[8]=0xBAA00009   chs[15]=0xBAA00008 chs[9]=0xBAA00010   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_剑侠客_剑" then
   chs[1]=0xBAA00011   chs[2]=0xBAA00011   chs[3]=0xBAA00013 chs[4]=0xBAA00012   chs[6]=0xBAA00014 chs[7]=0xBAA00016   chs[8]=0xBAA00017   chs[15]=0xBAA00018 chs[9]=0xBAA00015   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_飞燕女" then
   chs[1]=0xBAA00021   chs[2]=0xBAA00021   chs[3]=0xBAA00023 chs[4]=0xBAA00022   chs[6]=0xBAA00024 chs[7]=0xBAA00026   chs[8]=0xBAA00027   chs[9]=0xBAA00025   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_飞燕女_环圈" then
   chs[1]=0xBAA00021   chs[2]=0xBAA00021   chs[3]=0xBAA00023 chs[4]=0xBAA00022   chs[6]=0xBAA00024 chs[7]=0xBAA00026   chs[8]=0xBAA00027   chs[9]=0xBAA00025   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_飞燕女_双短剑" then
   chs[1]=0xBAA00028   chs[2]=0xBAA00028   chs[3]=0xBAA00030 chs[4]=0xBAA00029   chs[6]=0xBAA00031 chs[7]=0xBAA00033   chs[8]=0xBAA00034   chs[9]=0xBAA00032   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_骨精灵" then
   chs[1]=0xBAA00037   chs[2]=0xBAA00037   chs[3]=0xBAA00039 chs[4]=0xBAA00038   chs[6]=0xBAA00040 chs[7]=0xBAA00042   chs[8]=0xBAA00043   chs[9]=0xBAA00041   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_骨精灵_魔棒" then
   chs[1]=0xBAA00037   chs[2]=0xBAA00037   chs[3]=0xBAA00039 chs[4]=0xBAA00038   chs[6]=0xBAA00040 chs[7]=0xBAA00042   chs[8]=0xBAA00043   chs[9]=0xBAA00041   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_骨精灵_爪刺" then
   chs[1]=0xBAA00044   chs[2]=0xBAA00044   chs[3]=0xBAA00046 chs[4]=0xBAA00045   chs[6]=0xBAA00047 chs[7]=0xBAA00049   chs[8]=0xBAA00050   chs[9]=0xBAA00048   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_鬼潇潇" then
   chs[1]=0xBAA00055   chs[2]=0xBAA00055   chs[3]=0xBAA00057 chs[4]=0xBAA00056   chs[6]=0xBAA00058 chs[7]=0xBAA00060   chs[8]=0xBAA00061   chs[9]=0xBAA00059   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_鬼潇潇_伞" then
   chs[1]=0xBAA00055   chs[2]=0xBAA00055   chs[3]=0xBAA00057 chs[4]=0xBAA00056   chs[6]=0xBAA00058 chs[7]=0xBAA00060   chs[8]=0xBAA00061   chs[9]=0xBAA00059   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_鬼潇潇_爪刺" then
   chs[1]=0xBAA00062   chs[2]=0xBAA00062   chs[3]=0xBAA00064 chs[4]=0xBAA00063   chs[6]=0xBAA00065 chs[7]=0xBAA00067   chs[8]=0xBAA00068   chs[9]=0xBAA00066   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_狐美人" then
   chs[1]=0xBAA00071   chs[2]=0xBAA00071   chs[3]=0xBAA00073 chs[4]=0xBAA00072   chs[6]=0xBAA00074 chs[7]=0xBAA00076   chs[8]=0xBAA00077   chs[9]=0xBAA00075   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_狐美人_鞭" then
   chs[1]=0xBAA00071   chs[2]=0xBAA00071   chs[3]=0xBAA00073 chs[4]=0xBAA00072   chs[6]=0xBAA00074 chs[7]=0xBAA00076   chs[8]=0xBAA00077   chs[9]=0xBAA00075   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_狐美人_爪刺" then
   chs[1]=0xBAA00078   chs[2]=0xBAA00078   chs[3]=0xBAA00080 chs[4]=0xBAA00079   chs[6]=0xBAA00081 chs[7]=0xBAA00083   chs[8]=0xBAA00084   chs[9]=0xBAA00082   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_虎头怪" then
   chs[1]=0xBAA00087   chs[2]=0xBAA00087   chs[3]=0xBAA00089 chs[4]=0xBAA00088   chs[6]=0xBAA00090 chs[7]=0xBAA00092   chs[8]=0xBAA00093   chs[9]=0xBAA00091   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_虎头怪_锤" then
   chs[1]=0xBAA00087   chs[2]=0xBAA00087   chs[3]=0xBAA00089 chs[4]=0xBAA00088   chs[6]=0xBAA00090 chs[7]=0xBAA00092   chs[8]=0xBAA00093   chs[9]=0xBAA00091   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_虎头怪_斧钺" then
   chs[1]=0xBAA00094   chs[2]=0xBAA00094   chs[3]=0xBAA00096 chs[4]=0xBAA00095   chs[6]=0xBAA00097 chs[7]=0xBAA00099   chs[8]=0xBAA00100   chs[9]=0xBAA00098   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_巨魔王" then
   chs[1]=0xBAA00110   chs[2]=0xBAA00110   chs[3]=0xBAA00112 chs[4]=0xBAA00111   chs[6]=0xBAA00113 chs[7]=0xBAA00115   chs[8]=0xBAA00116   chs[9]=0xBAA00114   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巨魔王_斧钺" then
   chs[1]=0xBAA00110   chs[2]=0xBAA00110   chs[3]=0xBAA00112 chs[4]=0xBAA00111   chs[6]=0xBAA00113 chs[7]=0xBAA00115   chs[8]=0xBAA00116   chs[9]=0xBAA00114   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巨魔王_刀" then
   chs[1]=0xBAA00103   chs[2]=0xBAA00103   chs[3]=0xBAA00105 chs[4]=0xBAA00104   chs[6]=0xBAA00106 chs[7]=0xBAA00108   chs[8]=0xBAA00109   chs[9]=0xBAA00107   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_龙太子" then
   chs[1]=0xBAA00119   chs[2]=0xBAA00119   chs[3]=0xBAA00121 chs[4]=0xBAA00120   chs[6]=0xBAA00122 chs[7]=0xBAA00124   chs[8]=0xBAA00125   chs[9]=0xBAA00123   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_龙太子_枪矛" then
   chs[1]=0xBAA00119   chs[2]=0xBAA00119   chs[3]=0xBAA00121 chs[4]=0xBAA00120   chs[6]=0xBAA00122 chs[7]=0xBAA00124   chs[8]=0xBAA00125   chs[9]=0xBAA00123   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_龙太子_扇" then
   chs[1]=0xBAA00126   chs[2]=0xBAA00126   chs[3]=0xBAA00128 chs[4]=0xBAA00127   chs[6]=0xBAA00129 chs[7]=0xBAA00131   chs[8]=0xBAA00132   chs[9]=0xBAA00130   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_杀破狼" then
   chs[1]=0xBAA00144   chs[2]=0xBAA00144   chs[3]=0xBAA00146 chs[4]=0xBAA00145   chs[6]=0xBAA00147 chs[7]=0xBAA00149   chs[8]=0xBAA00150   chs[9]=0xBAA00148   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_杀破狼_宝珠" then
   chs[1]=0xBAA00144   chs[2]=0xBAA00144   chs[3]=0xBAA00146 chs[4]=0xBAA00145   chs[6]=0xBAA00147 chs[7]=0xBAA00149   chs[8]=0xBAA00150   chs[9]=0xBAA00148   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_杀破狼_弓弩" then
   chs[1]=0xBAA00137   chs[2]=0xBAA00137   chs[3]=0xBAA00139 chs[4]=0xBAA00138   chs[6]=0xBAA00140 chs[7]=0xBAA00142   chs[8]=0xBAA00143   chs[9]=0xBAA00141   chs[10]="audio/1155.mp3"


   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_神天兵" then
   chs[1]=0xBAA00153   chs[2]=0xBAA00153   chs[3]=0xBAA00155 chs[4]=0xBAA00154   chs[6]=0xBAA00156 chs[7]=0xBAA00158   chs[8]=0xBAA00159   chs[9]=0xBAA00157   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_神天兵_锤" then
   chs[1]=0xBAA00153   chs[2]=0xBAA00153   chs[3]=0xBAA00155 chs[4]=0xBAA00154   chs[6]=0xBAA00156 chs[7]=0xBAA00158   chs[8]=0xBAA00159   chs[9]=0xBAA00157   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_神天兵_枪矛" then
   chs[1]=0xBAA00160   chs[2]=0xBAA00160   chs[3]=0xBAA00162 chs[4]=0xBAA00161   chs[6]=0xBAA00163 chs[7]=0xBAA00165   chs[8]=0xBAA00166   chs[9]=0xBAA00164   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_桃夭夭" then
   chs[1]=0xBAA00171   chs[2]=0xBAA00171   chs[3]=0xBAA00173 chs[4]=0xBAA00172   chs[6]=0xBAA00174 chs[7]=0xBAA00176   chs[8]=0xBAA00177   chs[9]=0xBAA00175   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_桃夭夭_灯笼" then
   chs[1]=0xBAA00171   chs[2]=0xBAA00171   chs[3]=0xBAA00173 chs[4]=0xBAA00172   chs[6]=0xBAA00174 chs[7]=0xBAA00176   chs[8]=0xBAA00177   chs[9]=0xBAA00175   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_桃夭夭_飘带" then
   chs[1]=0xBAA00178   chs[2]=0xBAA00178   chs[3]=0xBAA00180 chs[4]=0xBAA00179   chs[6]=0xBAA00181 chs[7]=0xBAA00183   chs[8]=0xBAA00184   chs[9]=0xBAA00182   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_巫蛮儿" then
   chs[1]=0xBAA00187   chs[2]=0xBAA00187   chs[3]=0xBAA00189 chs[4]=0xBAA00188   chs[6]=0xBAA00190 chs[7]=0xBAA00192   chs[8]=0xBAA00193   chs[9]=0xBAA00191   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巫蛮儿_法杖" then
   chs[1]=0xBAA00187   chs[2]=0xBAA00187   chs[3]=0xBAA00189 chs[4]=0xBAA00188   chs[6]=0xBAA00190 chs[7]=0xBAA00192   chs[8]=0xBAA00193   chs[9]=0xBAA00191   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_巫蛮儿_宝珠" then
   chs[1]=0xBAA00194   chs[2]=0xBAA00194   chs[3]=0xBAA00196 chs[4]=0xBAA00195   chs[6]=0xBAA00197 chs[7]=0xBAA00199   chs[8]=0xBAA00200   chs[9]=0xBAA00198   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_舞天姬" then
   chs[1]=0xBAA00203   chs[2]=0xBAA00203   chs[3]=0xBAA00205 chs[4]=0xBAA00204   chs[6]=0xBAA00206 chs[7]=0xBAA00208   chs[8]=0xBAA00209   chs[9]=0xBAA00207   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_舞天姬_环圈" then
   chs[1]=0xBAA00203   chs[2]=0xBAA00203   chs[3]=0xBAA00205 chs[4]=0xBAA00204   chs[6]=0xBAA00206 chs[7]=0xBAA00208   chs[8]=0xBAA00209   chs[9]=0xBAA00207   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_舞天姬_飘带" then
   chs[1]=0xBAA00210   chs[2]=0xBAA00210   chs[3]=0xBAA00212 chs[4]=0xBAA00211   chs[6]=0xBAA00213 chs[7]=0xBAA00215   chs[8]=0xBAA00216   chs[9]=0xBAA00214   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_逍遥生" then
   chs[1]=0xBAA00228   chs[2]=0xBAA00228   chs[3]=0xBAA00230 chs[4]=0xBAA00229   chs[6]=0xBAA00231 chs[7]=0xBAA00233   chs[8]=0xBAA00234   chs[9]=0xBAA00232   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_逍遥生_剑" then
   chs[1]=0xBAA00228   chs[2]=0xBAA00228   chs[3]=0xBAA00230 chs[4]=0xBAA00229   chs[6]=0xBAA00231 chs[7]=0xBAA00233   chs[8]=0xBAA00234   chs[9]=0xBAA00232   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_逍遥生_扇" then
   chs[1]=0xBAA00221   chs[2]=0xBAA00221   chs[3]=0xBAA00223 chs[4]=0xBAA00222   chs[6]=0xBAA00224 chs[7]=0xBAA00226   chs[8]=0xBAA00227   chs[9]=0xBAA00225   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_玄彩娥" then
   chs[1]=0xBAA00237   chs[2]=0xBAA00237   chs[3]=0xBAA00239 chs[4]=0xBAA00238   chs[6]=0xBAA00240 chs[7]=0xBAA00242   chs[8]=0xBAA00243   chs[9]=0xBAA00241   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_玄彩娥_飘带" then
   chs[1]=0xBAA00237   chs[2]=0xBAA00237   chs[3]=0xBAA00239 chs[4]=0xBAA00238   chs[6]=0xBAA00240 chs[7]=0xBAA00242   chs[8]=0xBAA00243   chs[9]=0xBAA00241   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_玄彩娥_魔棒" then
   chs[1]=0xBAA00262   chs[2]=0xBAA00262   chs[3]=0xBAA00264 chs[4]=0xBAA00263   chs[6]=0xBAA00265 chs[7]=0xBAA00267   chs[8]=0xBAA00268   chs[9]=0xBAA00266   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_偃无师" then
   chs[1]=0xBAA00248   chs[2]=0xBAA00248   chs[3]=0xBAA00250 chs[4]=0xBAA00249   chs[6]=0xBAA00251 chs[7]=0xBAA00253   chs[8]=0xBAA00254   chs[9]=0xBAA00252   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_偃无师_巨剑" then
   chs[1]=0xBAA00248   chs[2]=0xBAA00248   chs[3]=0xBAA00250 chs[4]=0xBAA00249   chs[6]=0xBAA00251 chs[7]=0xBAA00253   chs[8]=0xBAA00254   chs[9]=0xBAA00252   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_偃无师_剑" then
   chs[1]=0xBAA00255   chs[2]=0xBAA00255   chs[3]=0xBAA00257 chs[4]=0xBAA00256   chs[6]=0xBAA00258 chs[7]=0xBAA00260   chs[8]=0xBAA00261   chs[9]=0xBAA00259   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_英女侠" then
   chs[1]=0xBAA00271   chs[2]=0xBAA00271   chs[3]=0xBAA00273 chs[4]=0xBAA00272   chs[6]=0xBAA00274 chs[7]=0xBAA00276   chs[8]=0xBAA00277   chs[9]=0xBAA00275   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_英女侠_鞭" then
   chs[1]=0xBAA00271   chs[2]=0xBAA00271   chs[3]=0xBAA00273 chs[4]=0xBAA00272   chs[6]=0xBAA00274 chs[7]=0xBAA00276   chs[8]=0xBAA00277   chs[9]=0xBAA00275   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_英女侠_双短剑" then
   chs[1]=0xBAA00278   chs[2]=0xBAA00278   chs[3]=0xBAA00280 chs[4]=0xBAA00279   chs[6]=0xBAA00281 chs[7]=0xBAA00283   chs[8]=0xBAA00284   chs[9]=0xBAA00282   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_羽灵神" then
   chs[1]=0xBAA00289   chs[2]=0xBAA00289   chs[3]=0xBAA00291 chs[4]=0xBAA00290   chs[6]=0xBAA00292 chs[7]=0xBAA00294   chs[8]=0xBAA00295   chs[9]=0xBAA00293   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_羽灵神_法杖" then
   chs[1]=0xBAA00289   chs[2]=0xBAA00289   chs[3]=0xBAA00291 chs[4]=0xBAA00290   chs[6]=0xBAA00292 chs[7]=0xBAA00294   chs[8]=0xBAA00295   chs[9]=0xBAA00293   chs[10]="audio/1155.mp3"
elseif ch == "旃檀香·墨黑_羽灵神_弓弩" then
   chs[1]=0xBAA00296   chs[2]=0xBAA00296   chs[3]=0xBAA00298 chs[4]=0xBAA00297   chs[6]=0xBAA00299 chs[7]=0xBAA00301   chs[8]=0xBAA00302   chs[9]=0xBAA00300   chs[10]="audio/1155.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "旃檀香·墨黑_影精灵" then
   chs[1]=0xBAA00310   chs[2]=0xBAA00309   chs[3]=0xBAA00314 chs[4]=0xBAA00313   chs[6]=0xBAA00315 chs[7]=0xBAA00317   chs[8]=0xBAA00318   chs[9]=0xBAA00316   chs[10]="audio/1155.mp3" chs[11]=0xBAA00310 chs[12]=0xBAA00311 chs[13]=0xBAA00312
elseif ch == "旃檀香·墨黑_影精灵_双斧乾" then
   chs[1]=0xBAA00310   chs[2]=0xBAA00309   chs[3]=0xBAA00314 chs[4]=0xBAA00313   chs[6]=0xBAA00315 chs[7]=0xBAA00317   chs[8]=0xBAA00318   chs[9]=0xBAA00316   chs[10]="audio/1155.mp3" chs[11]=0xBAA00310 chs[12]=0xBAA00311 chs[13]=0xBAA00312
elseif ch == "旃檀香·墨黑_影精灵_双斧坤" then
   chs[1]=0xBAA00310   chs[2]=0xBAA00309   chs[3]=0xBAA00314 chs[4]=0xBAA00313   chs[6]=0xBAA00315 chs[7]=0xBAA00317   chs[8]=0xBAA00318   chs[9]=0xBAA00316   chs[10]="audio/1155.mp3" chs[11]=0xBAA00310 chs[12]=0xBAA00311 chs[13]=0xBAA00312
elseif ch == "旃檀香·墨黑_影精灵_爪刺" then
   chs[1]=0xBAA00319   chs[2]=0xBAA00319   chs[3]=0xBAA00321 chs[4]=0xBAA00320   chs[6]=0xBAA00322 chs[7]=0xBAA00324   chs[8]=0xBAA00325   chs[9]=0xBAA00323   chs[10]="audio/1155.mp3"  chs[11]=0xBAA00319  chs[12]=0xBAA00319  chs[13]=0xBAA00319
elseif ch == "旃檀香·墨黑_影精灵_魔棒" then
   chs[1]=0xBAA00326   chs[2]=0xBAA00326   chs[3]=0xBAA00328 chs[4]=0xBAA00327   chs[6]=0xBAA00329 chs[7]=0xBAA00331   chs[8]=0xBAA00332   chs[9]=0xBAA00330   chs[10]="audio/1155.mp3"  chs[11]=0xBAA00326  chs[12]=0xBAA00326  chs[13]=0xBAA00326








   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_剑侠客" then
   chs[1]=0xAABA0001   chs[2]=0xAABA0001   chs[3]=0xAABA0003 chs[4]=0xAABA0002   chs[6]=0xAABA0004 chs[7]=0xAABA0006   chs[8]=0xAABA0007   chs[15]=0xAABA0008 chs[9]=0xAABA0005   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_剑侠客_刀" then
   chs[1]=0xAABA0001   chs[2]=0xAABA0001   chs[3]=0xAABA0003 chs[4]=0xAABA0002   chs[6]=0xAABA0004 chs[7]=0xAABA0006   chs[8]=0xAABA0007   chs[15]=0xAABA0008 chs[9]=0xAABA0005   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_剑侠客_剑" then
   chs[1]=0xAABA0011   chs[2]=0xAABA0011   chs[3]=0xAABA0013 chs[4]=0xAABA0012   chs[6]=0xAABA0014 chs[7]=0xAABA0016   chs[8]=0xAABA0017   chs[15]=0xAABA0018 chs[9]=0xAABA0015   chs[10]="audio/1515.mp3"

  -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_飞燕女" then
   chs[1]=0xAABA0021   chs[2]=0xAABA0021   chs[3]=0xAABA0023 chs[4]=0xAABA0022   chs[6]=0xAABA0024 chs[7]=0xAABA0026   chs[8]=0xAABA0027   chs[9]=0xAABA0025   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_飞燕女_双短剑" then
   chs[1]=0xAABA0031   chs[2]=0xAABA0031   chs[3]=0xAABA0033 chs[4]=0xAABA0032   chs[6]=0xAABA0034 chs[7]=0xAABA0036   chs[8]=0xAABA0037   chs[9]=0xAABA0035   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_飞燕女_环圈" then
   chs[1]=0xAABA0021   chs[2]=0xAABA0021   chs[3]=0xAABA0023 chs[4]=0xAABA0022   chs[6]=0xAABA0024 chs[7]=0xAABA0026   chs[8]=0xAABA0027   chs[9]=0xAABA0025   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_骨精灵" then
   chs[1]=0xAABA0041   chs[2]=0xAABA0041   chs[3]=0xAABA0043 chs[4]=0xAABA0042   chs[6]=0xAABA0044 chs[7]=0xAABA0046   chs[8]=0xAABA0047   chs[9]=0xAABA0045   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_骨精灵_魔棒" then
   chs[1]=0xAABA0041   chs[2]=0xAABA0041   chs[3]=0xAABA0043 chs[4]=0xAABA0042   chs[6]=0xAABA0044 chs[7]=0xAABA0046   chs[8]=0xAABA0047   chs[9]=0xAABA0045   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_骨精灵_爪刺" then
   chs[1]=0xAABA0051   chs[2]=0xAABA0051   chs[3]=0xAABA0053 chs[4]=0xAABA0052   chs[6]=0xAABA0054 chs[7]=0xAABA0056   chs[8]=0xAABA0057   chs[9]=0xAABA0055   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_鬼潇潇" then
   chs[1]=0xAABA0061   chs[2]=0xAABA0061   chs[3]=0xAABA0063 chs[4]=0xAABA0062   chs[6]=0xAABA0064 chs[7]=0xAABA0066   chs[8]=0xAABA0067   chs[9]=0xAABA0065   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_鬼潇潇_伞" then
   chs[1]=0xAABA0061   chs[2]=0xAABA0061   chs[3]=0xAABA0063 chs[4]=0xAABA0062   chs[6]=0xAABA0064 chs[7]=0xAABA0066   chs[8]=0xAABA0067   chs[9]=0xAABA0065   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_鬼潇潇_爪刺" then
   chs[1]=0xAABA0071   chs[2]=0xAABA0071   chs[3]=0xAABA0073 chs[4]=0xAABA0072   chs[6]=0xAABA0074 chs[7]=0xAABA0076   chs[8]=0xAABA0077   chs[9]=0xAABA0075   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_狐美人" then
   chs[1]=0xAABA0081   chs[2]=0xAABA0081   chs[3]=0xAABA0083 chs[4]=0xAABA0082   chs[6]=0xAABA0084 chs[7]=0xAABA0086   chs[8]=0xAABA0087   chs[9]=0xAABA0085   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_狐美人_鞭" then
   chs[1]=0xAABA0081   chs[2]=0xAABA0081   chs[3]=0xAABA0083 chs[4]=0xAABA0082   chs[6]=0xAABA0084 chs[7]=0xAABA0086   chs[8]=0xAABA0087   chs[9]=0xAABA0085   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_狐美人_爪刺" then
   chs[1]=0xAABA0091   chs[2]=0xAABA0091   chs[3]=0xAABA0093 chs[4]=0xAABA0092   chs[6]=0xAABA0094 chs[7]=0xAABA0096   chs[8]=0xAABA0097   chs[9]=0xAABA0095   chs[10]="audio/1515.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_虎头怪" then
   chs[1]=0xAABA0101   chs[2]=0xAABA0101   chs[3]=0xAABA0103 chs[4]=0xAABA0102   chs[6]=0xAABA0104 chs[7]=0xAABA0106   chs[8]=0xAABA0107   chs[9]=0xAABA0105   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_虎头怪_锤" then
   chs[1]=0xAABA0101   chs[2]=0xAABA0101   chs[3]=0xAABA0103 chs[4]=0xAABA0102   chs[6]=0xAABA0104 chs[7]=0xAABA0106   chs[8]=0xAABA0107   chs[9]=0xAABA0105   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_虎头怪_斧钺" then
   chs[1]=0xAABA0111   chs[2]=0xAABA0111   chs[3]=0xAABA0113 chs[4]=0xAABA0112   chs[6]=0xAABA0114 chs[7]=0xAABA0116   chs[8]=0xAABA0117   chs[9]=0xAABA0115   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_巨魔王" then
   chs[1]=0xAABA0131   chs[2]=0xAABA0131   chs[3]=0xAABA0133 chs[4]=0xAABA0132   chs[6]=0xAABA0134 chs[7]=0xAABA0136   chs[8]=0xAABA0137   chs[9]=0xAABA0135   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_巨魔王_斧钺" then
   chs[1]=0xAABA0131   chs[2]=0xAABA0131   chs[3]=0xAABA0133 chs[4]=0xAABA0132   chs[6]=0xAABA0134 chs[7]=0xAABA0136   chs[8]=0xAABA0137   chs[9]=0xAABA0135   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_巨魔王_刀" then
   chs[1]=0xAABA0121   chs[2]=0xAABA0121   chs[3]=0xAABA0123 chs[4]=0xAABA0122   chs[6]=0xAABA0124 chs[7]=0xAABA0126   chs[8]=0xAABA0127   chs[9]=0xAABA0125   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_龙太子" then
   chs[1]=0xAABA0141   chs[2]=0xAABA0141   chs[3]=0xAABA0143 chs[4]=0xAABA0142   chs[6]=0xAABA0144 chs[7]=0xAABA0146   chs[8]=0xAABA0147   chs[9]=0xAABA0145   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_龙太子_枪矛" then
   chs[1]=0xAABA0141   chs[2]=0xAABA0141   chs[3]=0xAABA0143 chs[4]=0xAABA0142   chs[6]=0xAABA0144 chs[7]=0xAABA0146   chs[8]=0xAABA0147   chs[9]=0xAABA0145   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_龙太子_扇" then
   chs[1]=0xAABA0151   chs[2]=0xAABA0151   chs[3]=0xAABA0153 chs[4]=0xAABA0152   chs[6]=0xAABA0154 chs[7]=0xAABA0156   chs[8]=0xAABA0157   chs[9]=0xAABA0155   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_杀破狼" then
   chs[1]=0xAABA0161   chs[2]=0xAABA0161   chs[3]=0xAABA0163 chs[4]=0xAABA0162   chs[6]=0xAABA0164 chs[7]=0xAABA0166   chs[8]=0xAABA0167   chs[9]=0xAABA0165   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_杀破狼_宝珠" then
   chs[1]=0xAABA0161   chs[2]=0xAABA0161   chs[3]=0xAABA0163 chs[4]=0xAABA0162   chs[6]=0xAABA0164 chs[7]=0xAABA0166   chs[8]=0xAABA0167   chs[9]=0xAABA0165   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_杀破狼_弓弩" then
   chs[1]=0xAABA0171   chs[2]=0xAABA0171   chs[3]=0xAABA0173 chs[4]=0xAABA0172   chs[6]=0xAABA0174 chs[7]=0xAABA0176   chs[8]=0xAABA0177   chs[9]=0xAABA0175   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_神天兵" then
   chs[1]=0xAABA0181   chs[2]=0xAABA0181   chs[3]=0xAABA0183 chs[4]=0xAABA0182   chs[6]=0xAABA0184 chs[7]=0xAABA0186   chs[8]=0xAABA0187   chs[9]=0xAABA0185   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_神天兵_锤" then
   chs[1]=0xAABA0181   chs[2]=0xAABA0181   chs[3]=0xAABA0183 chs[4]=0xAABA0182   chs[6]=0xAABA0184 chs[7]=0xAABA0186   chs[8]=0xAABA0187   chs[9]=0xAABA0185   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_神天兵_枪矛" then
   chs[1]=0xAABA0191   chs[2]=0xAABA0191   chs[3]=0xAABA0193 chs[4]=0xAABA0192   chs[6]=0xAABA0194 chs[7]=0xAABA0196   chs[8]=0xAABA0197   chs[9]=0xAABA0195   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_桃夭夭" then
   chs[1]=0xAABA0201   chs[2]=0xAABA0201   chs[3]=0xAABA0203 chs[4]=0xAABA0202   chs[6]=0xAABA0204 chs[7]=0xAABA0206   chs[8]=0xAABA0207   chs[9]=0xAABA0205   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_桃夭夭_灯笼" then
   chs[1]=0xAABA0201   chs[2]=0xAABA0201   chs[3]=0xAABA0203 chs[4]=0xAABA0202   chs[6]=0xAABA0204 chs[7]=0xAABA0206   chs[8]=0xAABA0207   chs[9]=0xAABA0205   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_桃夭夭_飘带" then
   chs[1]=0xAABA0211   chs[2]=0xAABA0211   chs[3]=0xAABA0213 chs[4]=0xAABA0212   chs[6]=0xAABA0214 chs[7]=0xAABA0216   chs[8]=0xAABA0217   chs[9]=0xAABA0215   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_巫蛮儿" then
   chs[1]=0xAABA0231   chs[2]=0xAABA0231   chs[3]=0xAABA0233 chs[4]=0xAABA0232   chs[6]=0xAABA0234 chs[7]=0xAABA0236   chs[8]=0xAABA0234   chs[9]=0xAABA0235   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_巫蛮儿_法杖" then
   chs[1]=0xAABA0231   chs[2]=0xAABA0231   chs[3]=0xAABA0233 chs[4]=0xAABA0232   chs[6]=0xAABA0234 chs[7]=0xAABA0236   chs[8]=0xAABA0234   chs[9]=0xAABA0235   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_巫蛮儿_宝珠" then
   chs[1]=0xAABA0221   chs[2]=0xAABA0221   chs[3]=0xAABA0223 chs[4]=0xAABA0222   chs[6]=0xAABA0224 chs[7]=0xAABA0226   chs[8]=0xAABA0227   chs[9]=0xAABA0225   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_舞天姬" then
   chs[1]=0xAABA0241   chs[2]=0xAABA0241   chs[3]=0xAABA0243 chs[4]=0xAABA0242   chs[6]=0xAABA0244 chs[7]=0xAABA0246   chs[8]=0xAABA0247   chs[9]=0xAABA0245   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_舞天姬_环圈" then
   chs[1]=0xAABA0241   chs[2]=0xAABA0241   chs[3]=0xAABA0243 chs[4]=0xAABA0242   chs[6]=0xAABA0244 chs[7]=0xAABA0246   chs[8]=0xAABA0247   chs[9]=0xAABA0245   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_舞天姬_飘带" then
   chs[1]=0xAABA0251   chs[2]=0xAABA0251   chs[3]=0xAABA0253 chs[4]=0xAABA0252   chs[6]=0xAABA0254 chs[7]=0xAABA0256   chs[8]=0xAABA0257   chs[9]=0xAABA0255   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_逍遥生" then
   chs[1]=0xAABA0261   chs[2]=0xAABA0261   chs[3]=0xAABA0263 chs[4]=0xAABA0262   chs[6]=0xAABA0264 chs[7]=0xAABA0266   chs[8]=0xAABA0267   chs[9]=0xAABA0265   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_逍遥生_剑" then
   chs[1]=0xAABA0261   chs[2]=0xAABA0261   chs[3]=0xAABA0263 chs[4]=0xAABA0262   chs[6]=0xAABA0264 chs[7]=0xAABA0266   chs[8]=0xAABA0267   chs[9]=0xAABA0265   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_逍遥生_扇" then
   chs[1]=0xAABA0271   chs[2]=0xAABA0271   chs[3]=0xAABA0273 chs[4]=0xAABA0272   chs[6]=0xAABA0274 chs[7]=0xAABA0276   chs[8]=0xAABA0277   chs[9]=0xAABA0275   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_玄彩娥" then
   chs[1]=0xAABA0291   chs[2]=0xAABA0291   chs[3]=0xAABA0293 chs[4]=0xAABA0292   chs[6]=0xAABA0294 chs[7]=0xAABA0296   chs[8]=0xAABA0297   chs[9]=0xAABA0295   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_玄彩娥_飘带" then
   chs[1]=0xAABA0291   chs[2]=0xAABA0291   chs[3]=0xAABA0293 chs[4]=0xAABA0292   chs[6]=0xAABA0294 chs[7]=0xAABA0296   chs[8]=0xAABA0297   chs[9]=0xAABA0295   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_玄彩娥_魔棒" then
   chs[1]=0xAABA0281   chs[2]=0xAABA0281   chs[3]=0xAABA0283 chs[4]=0xAABA0282   chs[6]=0xAABA0284 chs[7]=0xAABA0286   chs[8]=0xAABA0287   chs[9]=0xAABA0285   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_偃无师" then
   chs[1]=0xAABA0311   chs[2]=0xAABA0311   chs[3]=0xAABA0313 chs[4]=0xAABA0312   chs[6]=0xAABA0314 chs[7]=0xAABA0316   chs[8]=0xAABA0317   chs[9]=0xAABA0315   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_偃无师_巨剑" then
   chs[1]=0xAABA0311   chs[2]=0xAABA0311   chs[3]=0xAABA0313 chs[4]=0xAABA0312   chs[6]=0xAABA0314 chs[7]=0xAABA0316   chs[8]=0xAABA0317   chs[9]=0xAABA0315   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_偃无师_剑" then
   chs[1]=0xAABA0301   chs[2]=0xAABA0301   chs[3]=0xAABA0303 chs[4]=0xAABA0302   chs[6]=0xAABA0304 chs[7]=0xAABA0306   chs[8]=0xAABA0307   chs[9]=0xAABA0305   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_英女侠" then
   chs[1]=0xAABA0321   chs[2]=0xAABA0321   chs[3]=0xAABA0323 chs[4]=0xAABA0322   chs[6]=0xAABA0324 chs[7]=0xAABA0326   chs[8]=0xAABA0327   chs[9]=0xAABA0325   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_英女侠_鞭" then
   chs[1]=0xAABA0321   chs[2]=0xAABA0321   chs[3]=0xAABA0323 chs[4]=0xAABA0322   chs[6]=0xAABA0324 chs[7]=0xAABA0326   chs[8]=0xAABA0327   chs[9]=0xAABA0325   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_英女侠_双短剑" then
   chs[1]=0xAABA0331   chs[2]=0xAABA0331   chs[3]=0xAABA0333 chs[4]=0xAABA0332   chs[6]=0xAABA0334 chs[7]=0xAABA0336   chs[8]=0xAABA0337   chs[9]=0xAABA0335   chs[10]="audio/1515.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_羽灵神" then
   chs[1]=0xAABA0351   chs[2]=0xAABA0351   chs[3]=0xAABA0353 chs[4]=0xAABA0352   chs[6]=0xAABA0354 chs[7]=0xAABA0356   chs[8]=0xAABA0357   chs[9]=0xAABA0355   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_羽灵神_法杖" then
   chs[1]=0xAABA0351   chs[2]=0xAABA0351   chs[3]=0xAABA0353 chs[4]=0xAABA0352   chs[6]=0xAABA0354 chs[7]=0xAABA0356   chs[8]=0xAABA0357   chs[9]=0xAABA0355   chs[10]="audio/1515.mp3"
elseif ch == "小福兔·月白_羽灵神_弓弩" then
   chs[1]=0xAABA0341   chs[2]=0xAABA0341   chs[3]=0xAABA0343 chs[4]=0xAABA0342   chs[6]=0xAABA0344 chs[7]=0xAABA0346   chs[8]=0xAABA0347   chs[9]=0xAABA0345   chs[10]="audio/1515.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "小福兔·月白_影精灵" then
   chs[1]=0xAABA0382   chs[2]=0xAABA0381   chs[3]=0xAABA0386 chs[4]=0xAABA0385   chs[6]=0xAABA0387 chs[7]=0xAABA0389   chs[8]=0xAABA0390   chs[9]=0xAABA0388   chs[10]="audio/1515.mp3" chs[11]=0xAABA0383 chs[12]=0xAABA0383 chs[13]=0xAABA0384
elseif ch == "小福兔·月白_影精灵_双斧乾" then
   chs[1]=0xAABA0382   chs[2]=0xAABA0381   chs[3]=0xAABA0386 chs[4]=0xAABA0385   chs[6]=0xAABA0387 chs[7]=0xAABA0389   chs[8]=0xAABA0390   chs[9]=0xAABA0388   chs[10]="audio/1515.mp3" chs[11]=0xAABA0383 chs[12]=0xAABA0383 chs[13]=0xAABA0384
elseif ch == "小福兔·月白_影精灵_双斧坤" then
   chs[1]=0xAABA0382   chs[2]=0xAABA0381   chs[3]=0xAABA0386 chs[4]=0xAABA0385   chs[6]=0xAABA0387 chs[7]=0xAABA0389   chs[8]=0xAABA0390   chs[9]=0xAABA0388   chs[10]="audio/1515.mp3" chs[11]=0xAABA0383 chs[12]=0xAABA0383 chs[13]=0xAABA0384

elseif ch == "小福兔·月白_影精灵_爪刺" then
   chs[1]=0xAABA0371   chs[2]=0xAABA0371   chs[3]=0xAABA0373 chs[4]=0xAABA0372   chs[6]=0xAABA0374 chs[7]=0xAABA0376   chs[8]=0xAABA0377   chs[9]=0xAABA0375   chs[10]="audio/1515.mp3"  chs[11]=0xAABA0371  chs[12]=0xAABA0371  chs[13]=0xAABA0371
elseif ch == "小福兔·月白_影精灵_魔棒" then
   chs[1]=0xAABA0361   chs[2]=0xAABA0361   chs[3]=0xAABA0363 chs[4]=0xAABA0362   chs[6]=0xAABA0364 chs[7]=0xAABA0366   chs[8]=0xAABA0367   chs[9]=0xAABA0365   chs[10]="audio/1515.mp3"  chs[11]=0xAABA0361  chs[12]=0xAABA0361  chs[13]=0xAABA0361


   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_剑侠客" then
   chs[1]=0xAAA00004   chs[2]=0xAAA00004   chs[3]=0xAAA00006 chs[4]=0xAAA00007   chs[6]=0xAAA00003 chs[7]=0xAAA00005   chs[8]=0xAAA00336   chs[15]=0xAAA00337 chs[9]=0xAAA00008   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_剑侠客_刀" then
   chs[1]=0xAAA00004   chs[2]=0xAAA00004   chs[3]=0xAAA00006 chs[4]=0xAAA00007   chs[6]=0xAAA00003 chs[7]=0xAAA00005   chs[8]=0xAAA00336   chs[15]=0xAAA00337 chs[9]=0xAAA00008   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_剑侠客_剑" then
   chs[1]=0xAAA00010   chs[2]=0xAAA00010   chs[3]=0xAAA00012 chs[4]=0xAAA00013   chs[6]=0xAAA00009 chs[7]=0xAAA00011   chs[8]=0xAAA00338   chs[15]=0xAAA00339 chs[9]=0xAAA00108   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_飞燕女" then
   chs[1]=0xAAA00016   chs[2]=0xAAA00016   chs[3]=0xAAA00021 chs[4]=0xAAA00023   chs[6]=0xAAA00017 chs[7]=0xAAA00022   chs[8]=0xAAA00019   chs[9]=0xAAA00020   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_飞燕女_双短剑" then
   chs[1]=0xAAA00024   chs[2]=0xAAA00024   chs[3]=0xAAA00025 chs[4]=0xAAA00026   chs[6]=0xAAA00027 chs[7]=0xAAA00028   chs[8]=0xAAA00029   chs[9]=0xAAA00030   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_飞燕女_环圈" then
   chs[1]=0xAAA00016   chs[2]=0xAAA00016   chs[3]=0xAAA00021 chs[4]=0xAAA00023   chs[6]=0xAAA00017 chs[7]=0xAAA00022   chs[8]=0xAAA00019   chs[9]=0xAAA00020   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_骨精灵" then
   chs[1]=0xAAA00033   chs[2]=0xAAA00033   chs[3]=0xAAA00034 chs[4]=0xAAA00035   chs[6]=0xAAA00036 chs[7]=0xAAA00037   chs[8]=0xAAA00038   chs[9]=0xAAA00039   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_骨精灵_魔棒" then
   chs[1]=0xAAA00033   chs[2]=0xAAA00033   chs[3]=0xAAA00034 chs[4]=0xAAA00035   chs[6]=0xAAA00036 chs[7]=0xAAA00037   chs[8]=0xAAA00038   chs[9]=0xAAA00039   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_骨精灵_爪刺" then
   chs[1]=0xAAA00040   chs[2]=0xAAA00040   chs[3]=0xAAA00041 chs[4]=0xAAA00042   chs[6]=0xAAA00043 chs[7]=0xAAA00044   chs[8]=0xAAA00045   chs[9]=0xAAA00046   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_鬼潇潇" then
   chs[1]=0xAAA00049   chs[2]=0xAAA00049   chs[3]=0xAAA00050 chs[4]=0xAAA00051   chs[6]=0xAAA00052 chs[7]=0xAAA00053   chs[8]=0xAAA00054   chs[9]=0xAAA00331   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_鬼潇潇_伞" then
   chs[1]=0xAAA00049   chs[2]=0xAAA00049   chs[3]=0xAAA00050 chs[4]=0xAAA00051   chs[6]=0xAAA00052 chs[7]=0xAAA00053   chs[8]=0xAAA00054   chs[9]=0xAAA00331   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_鬼潇潇_爪刺" then
   chs[1]=0xAAA00057   chs[2]=0xAAA00057   chs[3]=0xAAA00058 chs[4]=0xAAA00059   chs[6]=0xAAA00060 chs[7]=0xAAA00061   chs[8]=0xAAA00062   chs[9]=0xAAA00332   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_狐美人" then
   chs[1]=0xAAA00066   chs[2]=0xAAA00066   chs[3]=0xAAA00067 chs[4]=0xAAA00068   chs[6]=0xAAA00069 chs[7]=0xAAA00070   chs[8]=0xAAA00071   chs[9]=0xAAA00072   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_狐美人_鞭" then
   chs[1]=0xAAA00066   chs[2]=0xAAA00066   chs[3]=0xAAA00067 chs[4]=0xAAA00068   chs[6]=0xAAA00069 chs[7]=0xAAA00070   chs[8]=0xAAA00071   chs[9]=0xAAA00072   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_狐美人_爪刺" then
   chs[1]=0xAAA00073   chs[2]=0xAAA00073   chs[3]=0xAAA00074 chs[4]=0xAAA00075   chs[6]=0xAAA00076 chs[7]=0xAAA00077   chs[8]=0xAAA00078   chs[9]=0xAAA00079   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_影精灵" then
   chs[1]=0xAAA00083   chs[2]=0xAAA00082   chs[3]=0xAAA00084 chs[4]=0xAAA00085   chs[6]=0xAAA00086 chs[7]=0xAAA00087   chs[8]=0xAAA00088   chs[9]=0xAAA00089   chs[10]="audio/1405.mp3" chs[11]=0xAAA00342 chs[12]=0xAAA00342 chs[13]=0xAAA00343
elseif ch == "浮生绡·点黛_影精灵_双斧乾" then
   chs[1]=0xAAA00083   chs[2]=0xAAA00082   chs[3]=0xAAA00084 chs[4]=0xAAA00085   chs[6]=0xAAA00086 chs[7]=0xAAA00087   chs[8]=0xAAA00088   chs[9]=0xAAA00089   chs[10]="audio/1405.mp3" chs[11]=0xAAA00342 chs[12]=0xAAA00342 chs[13]=0xAAA00343
elseif ch == "浮生绡·点黛_影精灵_双斧坤" then
   chs[1]=0xAAA00083   chs[2]=0xAAA00082   chs[3]=0xAAA00084 chs[4]=0xAAA00085   chs[6]=0xAAA00086 chs[7]=0xAAA00087   chs[8]=0xAAA00088   chs[9]=0xAAA00089   chs[10]="audio/1405.mp3" chs[11]=0xAAA00342 chs[12]=0xAAA00342 chs[13]=0xAAA00343

elseif ch == "浮生绡·点黛_影精灵_爪刺" then
   chs[1]=0xAAA00092   chs[2]=0xAAA00092   chs[3]=0xAAA00093 chs[4]=0xAAA00094   chs[6]=0xAAA00095 chs[7]=0xAAA00096   chs[8]=0xAAA00097   chs[9]=0xAAA00098   chs[10]="audio/1405.mp3" chs[11]=0xAAA00092 chs[12]=0xAAA00092 chs[13]=0xAAA00092
elseif ch == "浮生绡·点黛_影精灵_魔棒" then
   chs[1]=0xAAA00101   chs[2]=0xAAA00101   chs[3]=0xAAA00102 chs[4]=0xAAA00103   chs[6]=0xAAA00104 chs[7]=0xAAA00105   chs[8]=0xAAA00106   chs[9]=0xAAA00107   chs[10]="audio/1405.mp3" chs[11]=0xAAA00101 chs[12]=0xAAA00101 chs[13]=0xAAA00101
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_虎头怪" then
   chs[1]=0xAAA00111   chs[2]=0xAAA00111   chs[3]=0xAAA00112 chs[4]=0xAAA00113   chs[6]=0xAAA00114 chs[7]=0xAAA00115   chs[8]=0xAAA00116   chs[9]=0xAAA00117   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_虎头怪_锤" then
   chs[1]=0xAAA00111   chs[2]=0xAAA00111   chs[3]=0xAAA00112 chs[4]=0xAAA00113   chs[6]=0xAAA00114 chs[7]=0xAAA00115   chs[8]=0xAAA00116   chs[9]=0xAAA00117   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_虎头怪_斧钺" then
   chs[1]=0xAAA00118   chs[2]=0xAAA00118   chs[3]=0xAAA00119 chs[4]=0xAAA00120   chs[6]=0xAAA00121 chs[7]=0xAAA00122   chs[8]=0xAAA00123   chs[9]=0xAAA00124   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_巨魔王" then
   chs[1]=0xAAA00134   chs[2]=0xAAA00134   chs[3]=0xAAA00135 chs[4]=0xAAA00136   chs[6]=0xAAA00137 chs[7]=0xAAA00138   chs[8]=0xAAA00139   chs[9]=0xAAA00140   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巨魔王_斧钺" then
   chs[1]=0xAAA00134   chs[2]=0xAAA00134   chs[3]=0xAAA00135 chs[4]=0xAAA00136   chs[6]=0xAAA00137 chs[7]=0xAAA00138   chs[8]=0xAAA00139   chs[9]=0xAAA00140   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巨魔王_刀" then
   chs[1]=0xAAA00127   chs[2]=0xAAA00127   chs[3]=0xAAA00128 chs[4]=0xAAA00129   chs[6]=0xAAA00130 chs[7]=0xAAA00131   chs[8]=0xAAA00132   chs[9]=0xAAA00133   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_龙太子" then
   chs[1]=0xAAA00143   chs[2]=0xAAA00143   chs[3]=0xAAA00144 chs[4]=0xAAA00145   chs[6]=0xAAA00146 chs[7]=0xAAA00147   chs[8]=0xAAA00340   chs[9]=0xAAA00149   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_龙太子_枪矛" then
   chs[1]=0xAAA00143   chs[2]=0xAAA00143   chs[3]=0xAAA00144 chs[4]=0xAAA00145   chs[6]=0xAAA00146 chs[7]=0xAAA00147   chs[8]=0xAAA00340   chs[9]=0xAAA00149   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_龙太子_扇" then
   chs[1]=0xAAA00150   chs[2]=0xAAA00150   chs[3]=0xAAA00155 chs[4]=0xAAA00151   chs[6]=0xAAA00152 chs[7]=0xAAA00153   chs[8]=0xAAA00341   chs[9]=0xAAA00154   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_杀破狼" then
   chs[1]=0xAAA00158   chs[2]=0xAAA00158   chs[3]=0xAAA00159 chs[4]=0xAAA00160   chs[6]=0xAAA00161 chs[7]=0xAAA00162   chs[8]=0xAAA00163   chs[9]=0xAAA00164   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_杀破狼_宝珠" then
   chs[1]=0xAAA00158   chs[2]=0xAAA00158   chs[3]=0xAAA00159 chs[4]=0xAAA00160   chs[6]=0xAAA00161 chs[7]=0xAAA00162   chs[8]=0xAAA00163   chs[9]=0xAAA00164   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_杀破狼_弓弩" then
   chs[1]=0xAAA00167   chs[2]=0xAAA00167   chs[3]=0xAAA00333 chs[4]=0xAAA00168   chs[6]=0xAAA00169 chs[7]=0xAAA00170   chs[8]=0xAAA00166   chs[9]=0xAAA00172   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_神天兵" then
   chs[1]=0xAAA00175   chs[2]=0xAAA00175   chs[3]=0xAAA00176 chs[4]=0xAAA00177   chs[6]=0xAAA00178 chs[7]=0xAAA00179   chs[8]=0xAAA00180   chs[9]=0xAAA00181   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_神天兵_锤" then
   chs[1]=0xAAA00175   chs[2]=0xAAA00175   chs[3]=0xAAA00176 chs[4]=0xAAA00177   chs[6]=0xAAA00178 chs[7]=0xAAA00179   chs[8]=0xAAA00180   chs[9]=0xAAA00181   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_神天兵_枪矛" then
   chs[1]=0xAAA00182   chs[2]=0xAAA00182   chs[3]=0xAAA00183 chs[4]=0xAAA00184   chs[6]=0xAAA00185 chs[7]=0xAAA00186   chs[8]=0xAAA00187   chs[9]=0xAAA00188   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_桃夭夭" then
   chs[1]=0xAAA00191   chs[2]=0xAAA00191   chs[3]=0xAAA00192 chs[4]=0xAAA00193   chs[6]=0xAAA00194 chs[7]=0xAAA00195   chs[8]=0xAAA00196   chs[9]=0xAAA00197   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_桃夭夭_灯笼" then
   chs[1]=0xAAA00191   chs[2]=0xAAA00191   chs[3]=0xAAA00192 chs[4]=0xAAA00193   chs[6]=0xAAA00194 chs[7]=0xAAA00195   chs[8]=0xAAA00196   chs[9]=0xAAA00197   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_桃夭夭_飘带" then
   chs[1]=0xAAA00200   chs[2]=0xAAA00200   chs[3]=0xAAA00201 chs[4]=0xAAA00202   chs[6]=0xAAA00203 chs[7]=0xAAA00204   chs[8]=0xAAA00205   chs[9]=0xAAA00206   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_巫蛮儿" then
   chs[1]=0xAAA00209   chs[2]=0xAAA00209   chs[3]=0xAAA00210 chs[4]=0xAAA00211   chs[6]=0xAAA00212 chs[7]=0xAAA00213   chs[8]=0xAAA00214   chs[9]=0xAAA00215   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巫蛮儿_法杖" then
   chs[1]=0xAAA00209   chs[2]=0xAAA00209   chs[3]=0xAAA00210 chs[4]=0xAAA00211   chs[6]=0xAAA00212 chs[7]=0xAAA00213   chs[8]=0xAAA00214   chs[9]=0xAAA00215   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_巫蛮儿_宝珠" then
   chs[1]=0xAAA00216   chs[2]=0xAAA00216   chs[3]=0xAAA00217 chs[4]=0xAAA00218   chs[6]=0xAAA00219 chs[7]=0xAAA00220   chs[8]=0xAAA00221   chs[9]=0xAAA00222   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_舞天姬" then
   chs[1]=0xAAA00225   chs[2]=0xAAA00225   chs[3]=0xAAA00226 chs[4]=0xAAA00227   chs[6]=0xAAA00228 chs[7]=0xAAA00229   chs[8]=0xAAA00230   chs[9]=0xAAA00231   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_舞天姬_环圈" then
   chs[1]=0xAAA00225   chs[2]=0xAAA00225   chs[3]=0xAAA00226 chs[4]=0xAAA00227   chs[6]=0xAAA00228 chs[7]=0xAAA00229   chs[8]=0xAAA00230   chs[9]=0xAAA00231   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_舞天姬_飘带" then
   chs[1]=0xAAA00234   chs[2]=0xAAA00234   chs[3]=0xAAA00235 chs[4]=0xAAA00236   chs[6]=0xAAA00237 chs[7]=0xAAA00238   chs[8]=0xAAA00239   chs[9]=0xAAA00240   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_逍遥生" then
   chs[1]=0xAAA00243   chs[2]=0xAAA00243   chs[3]=0xAAA00244 chs[4]=0xAAA00245   chs[6]=0xAAA00246 chs[7]=0xAAA00247   chs[8]=0xAAA00248   chs[9]=0xAAA00249   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_逍遥生_剑" then
   chs[1]=0xAAA00243   chs[2]=0xAAA00243   chs[3]=0xAAA00244 chs[4]=0xAAA00245   chs[6]=0xAAA00246 chs[7]=0xAAA00247   chs[8]=0xAAA00248   chs[9]=0xAAA00249   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_逍遥生_扇" then
   chs[1]=0xAAA00252   chs[2]=0xAAA00252   chs[3]=0xAAA00253 chs[4]=0xAAA00254   chs[6]=0xAAA00255 chs[7]=0xAAA00256   chs[8]=0xAAA00257   chs[9]=0xAAA00258   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_玄彩娥" then
   chs[1]=0xAAA00261   chs[2]=0xAAA00261   chs[3]=0xAAA00262 chs[4]=0xAAA00263   chs[6]=0xAAA00264 chs[7]=0xAAA00265   chs[8]=0xAAA00266   chs[9]=0xAAA00267   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_玄彩娥_飘带" then
   chs[1]=0xAAA00261   chs[2]=0xAAA00261   chs[3]=0xAAA00262 chs[4]=0xAAA00263   chs[6]=0xAAA00264 chs[7]=0xAAA00265   chs[8]=0xAAA00266   chs[9]=0xAAA00267   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_玄彩娥_魔棒" then
   chs[1]=0xAAA00270   chs[2]=0xAAA00270   chs[3]=0xAAA00271 chs[4]=0xAAA00272   chs[6]=0xAAA00273 chs[7]=0xAAA00274   chs[8]=0xAAA00275   chs[9]=0xAAA00276   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_偃无师" then
   chs[1]=0xAAA00279   chs[2]=0xAAA00279   chs[3]=0xAAA00280 chs[4]=0xAAA00281   chs[6]=0xAAA00282 chs[7]=0xAAA00283   chs[8]=0xAAA00284   chs[9]=0xAAA00285   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_偃无师_巨剑" then
   chs[1]=0xAAA00279   chs[2]=0xAAA00279   chs[3]=0xAAA00280 chs[4]=0xAAA00281   chs[6]=0xAAA00282 chs[7]=0xAAA00283   chs[8]=0xAAA00284   chs[9]=0xAAA00285   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_偃无师_剑" then
   chs[1]=0xAAA00288   chs[2]=0xAAA00288   chs[3]=0xAAA00289 chs[4]=0xAAA00290   chs[6]=0xAAA00291 chs[7]=0xAAA00292   chs[8]=0xAAA00293   chs[9]=0xAAA00294   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_英女侠" then
   chs[1]=0xAAA00297   chs[2]=0xAAA00297   chs[3]=0xAAA00298 chs[4]=0xAAA00299   chs[6]=0xAAA00300 chs[7]=0xAAA00301   chs[8]=0xAAA00302   chs[9]=0xAAA00312   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_英女侠_鞭" then
   chs[1]=0xAAA00297   chs[2]=0xAAA00297   chs[3]=0xAAA00298 chs[4]=0xAAA00299   chs[6]=0xAAA00300 chs[7]=0xAAA00301   chs[8]=0xAAA00302   chs[9]=0xAAA00312   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_英女侠_双短剑" then
   chs[1]=0xAAA00305   chs[2]=0xAAA00305   chs[3]=0xAAA00306 chs[4]=0xAAA00307   chs[6]=0xAAA00308 chs[7]=0xAAA00309   chs[8]=0xAAA00310   chs[9]=0xAAA00311   chs[10]="audio/1405.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生绡·点黛_羽灵神" then
   chs[1]=0xAAA00315   chs[2]=0xAAA00315   chs[3]=0xAAA00316 chs[4]=0xAAA00317   chs[6]=0xAAA00318 chs[7]=0xAAA00319   chs[8]=0xAAA00320   chs[9]=0xAAA00321   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_羽灵神_法杖" then
   chs[1]=0xAAA00315   chs[2]=0xAAA00315   chs[3]=0xAAA00316 chs[4]=0xAAA00317   chs[6]=0xAAA00318 chs[7]=0xAAA00319   chs[8]=0xAAA00320   chs[9]=0xAAA00321   chs[10]="audio/1405.mp3"
elseif ch == "浮生绡·点黛_羽灵神_弓弩" then
   chs[1]=0xAAA00324   chs[2]=0xAAA00324   chs[3]=0xAAA00325 chs[4]=0xAAA00326   chs[6]=0xAAA00327 chs[7]=0xAAA00328  chs[8]=0xAAA00329   chs[9]=0xAAA00330   chs[10]="audio/1405.mp3"






  elseif ch == "浮生_飞燕女" then
   chs[1]=0xAA000001   chs[2]=0xAA000001   chs[3]=0xAA000003 chs[4]=0xAA000002   chs[6]=0xAA000004 chs[7]=0xAA000006   chs[8]=0xAA000010   chs[9]=0xAA000005   chs[10]="audio/1503.mp3"
elseif ch == "浮生_飞燕女_双短剑" then
   chs[1]=0xAA000011   chs[2]=0xAA000011   chs[3]=0xAA000013 chs[4]=0xAA000012   chs[6]=0xAA000014 chs[7]=0xAA000016 chs[8]=0xAA000020 chs[9]=0xAA000015 chs[10]="audio/1503.mp3"
elseif ch == "浮生_飞燕女_环圈" then
   chs[1]=0xAA000001   chs[2]=0xAA000001   chs[3]=0xAA000003 chs[4]=0xAA000002   chs[6]=0xAA000004 chs[7]=0xAA000006   chs[8]=0xAA000010   chs[9]=0xAA000005   chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_剑侠客" then
   chs[1]=0xAA000101 chs[2]=0xAA000101 chs[3]=0xAA000103 chs[4]=0xAA000102 chs[6]=0xAA000104 chs[7]=0xAA000106 chs[8]=0xAA000376 chs[9]=0xAA000105 chs[15]=0xAA000377 chs[10]="audio/1503.mp3"
elseif ch == "浮生_剑侠客_刀" then
   chs[1]=0xAA000101 chs[2]=0xAA000101 chs[3]=0xAA000103 chs[4]=0xAA000102 chs[6]=0xAA000104 chs[7]=0xAA000106 chs[8]=0xAA000376 chs[9]=0xAA000105 chs[15]=0xAA000377 chs[10]="audio/1503.mp3"
elseif ch == "浮生_剑侠客_剑" then
   chs[1]=0xAA000111 chs[2]=0xAA000111 chs[3]=0xAA000113 chs[4]=0xAA000112 chs[6]=0xAA000114 chs[7]=0xAA000116 chs[8]=0xAA000120 chs[9]=0xAA000115  chs[15]=0xAA000118 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_逍遥生" then
   chs[1]=0xAA000261 chs[2]=0xAA000261  chs[3]=0xAA000263 chs[4]=0xAA000262 chs[6]=0xAA000264 chs[7]=0xAA000266 chs[8]=0xAA000267 chs[9]=0xAA000265 chs[10]="audio/1503.mp3"
elseif ch == "浮生_逍遥生_剑" then
   chs[1]=0xAA000261 chs[2]=0xAA000261  chs[3]=0xAA000263 chs[4]=0xAA000262 chs[6]=0xAA000264 chs[7]=0xAA000266 chs[8]=0xAA000267 chs[9]=0xAA000265 chs[10]="audio/1503.mp3"
elseif ch == "浮生_逍遥生_扇" then
   chs[1]=0xAA000271 chs[2]=0xAA000271 chs[3]=0xAA000273 chs[4]=0xAA000272 chs[6]=0xAA000274 chs[7]=0xAA000276 chs[8]=0xAA000277 chs[9]=0xAA000275 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_英女侠" then
   chs[1]=0xAA000321 chs[2]=0xAA000321 chs[3]=0xAA000323 chs[4]=0xAA000322 chs[6]=0xAA000324 chs[7]=0xAA000326 chs[8]=0xAA000327 chs[9]=0xAA000325 chs[10]="audio/1503.mp3"
elseif ch == "浮生_英女侠_鞭" then
   chs[1]=0xAA000321 chs[2]=0xAA000321 chs[3]=0xAA000323 chs[4]=0xAA000322 chs[6]=0xAA000324 chs[7]=0xAA000326 chs[8]=0xAA000327 chs[9]=0xAA000325 chs[10]="audio/1503.mp3"
elseif ch == "浮生_英女侠_双短剑" then
   chs[1]=0xAA000331 chs[2]=0xAA000331 chs[3]=0xAA000333 chs[4]=0xAA000332 chs[6]=0xAA000334 chs[7]=0xAA000336 chs[8]=0xAA000337 chs[9]=0xAA000335 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_偃无师" then
   chs[1]=0xAA000301 chs[2]=0xAA000301 chs[3]=0xAA000303 chs[4]=0xAA000302 chs[6]=0xAA000304 chs[7]=0xAA000306 chs[8]=0xAA000307 chs[9]=0xAA000305 chs[10]="audio/1503.mp3"
elseif ch == "浮生_偃无师_剑" then
   chs[1]=0xAA000301 chs[2]=0xAA000301 chs[3]=0xAA000303 chs[4]=0xAA000302 chs[6]=0xAA000304 chs[7]=0xAA000306 chs[8]=0xAA000307 chs[9]=0xAA000305 chs[10]="audio/1503.mp3"
elseif ch == "浮生_偃无师_巨剑" then
   chs[1]=0xAA000311 chs[2]=0xAA000311 chs[3]=0xAA000313 chs[4]=0xAA000312 chs[6]=0xAA000314 chs[7]=0xAA000316 chs[8]=0xAA000317 chs[9]=0xAA000315 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_巫蛮儿" then
   chs[1]=0xAA000221 chs[2]=0xAA000221 chs[3]=0xAA000223 chs[4]=0xAA000222 chs[6]=0xAA000224 chs[7]=0xAA000226 chs[8]=0xAA000227 chs[9]=0xAA000225 chs[10]="audio/1503.mp3"
elseif ch == "浮生_巫蛮儿_法杖" then
   chs[1]=0xAA000231 chs[2]=0xAA000231 chs[3]=0xAA000233 chs[4]=0xAA000232 chs[6]=0xAA000234 chs[7]=0xAA000236 chs[8]=0xAA000237 chs[9]=0xAA000235 chs[10]="audio/1503.mp3"
elseif ch == "浮生_巫蛮儿_宝珠" then
   chs[1]=0xAA000221 chs[2]=0xAA000221 chs[3]=0xAA000223 chs[4]=0xAA000222 chs[6]=0xAA000224 chs[7]=0xAA000226 chs[8]=0xAA000227 chs[9]=0xAA000225 chs[10]="audio/1503.mp3"

elseif ch == "浮生_巨魔王" then
   chs[1]=0xAA000121 chs[2]=0xAA000121 chs[3]=0xAA000123 chs[4]=0xAA000122 chs[6]=0xAA000124 chs[7]=0xAA000126 chs[8]=0xAA000127 chs[9]=0xAA000125 chs[10]="audio/1503.mp3"
elseif ch == "浮生_巨魔王_刀" then
   chs[1]=0xAA000121 chs[2]=0xAA000121 chs[3]=0xAA000123 chs[4]=0xAA000122 chs[6]=0xAA000124 chs[7]=0xAA000126 chs[8]=0xAA000127 chs[9]=0xAA000125 chs[10]="audio/1503.mp3"
elseif ch == "浮生_巨魔王_斧钺" then
   chs[1]=0xAA000131 chs[2]=0xAA000131 chs[3]=0xAA000133 chs[4]=0xAA000132 chs[6]=0xAA000134 chs[7]=0xAA000136 chs[8]=0xAA000137 chs[9]=0xAA000135 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_虎头怪" then
   chs[1]=0xAA000081 chs[2]=0xAA000081 chs[3]=0xAA000083 chs[4]=0xAA000082 chs[6]=0xAA000084 chs[7]=0xAA000086 chs[8]=0xAA000087 chs[9]=0xAA000085 chs[10]="audio/1503.mp3"
elseif ch == "浮生_虎头怪_锤" then
   chs[1]=0xAA000081 chs[2]=0xAA000081 chs[3]=0xAA000083 chs[4]=0xAA000082 chs[6]=0xAA000084 chs[7]=0xAA000086 chs[8]=0xAA000087 chs[9]=0xAA000085 chs[10]="audio/1503.mp3"
elseif ch == "浮生_虎头怪_斧钺" then
   chs[1]=0xAA000091 chs[2]=0xAA000091 chs[3]=0xAA000093 chs[4]=0xAA000092 chs[6]=0xAA000094 chs[7]=0xAA000096 chs[8]=0xAA000097 chs[9]=0xAA000095 chs[10]="audio/1503.mp3"

elseif ch == "浮生_狐美人" then
   chs[1]=0xAA000061 chs[2]=0xAA000061 chs[3]=0xAA000063 chs[4]=0xAA000062 chs[6]=0xAA000064 chs[7]=0xAA000066 chs[8]=0xAA000067 chs[9]=0xAA000065 chs[10]="audio/1503.mp3"
elseif ch == "浮生_狐美人_鞭" then
   chs[1]=0xAA000061 chs[2]=0xAA000061 chs[3]=0xAA000063 chs[4]=0xAA000062 chs[6]=0xAA000064 chs[7]=0xAA000066 chs[8]=0xAA000067 chs[9]=0xAA000065 chs[10]="audio/1503.mp3"
elseif ch == "浮生_狐美人_爪刺" then
   chs[1]=0xAA000071 chs[2]=0xAA000071 chs[3]=0xAA000073 chs[4]=0xAA000072 chs[6]=0xAA000074 chs[7]=0xAA000076 chs[8]=0xAA000077 chs[9]=0xAA000075 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_骨精灵" then
   chs[1]=0xAA000021 chs[2]=0xAA000021 chs[3]=0xAA000023 chs[4]=0xAA000022 chs[6]=0xAA000024 chs[7]=0xAA000026 chs[8]=0xAA000030 chs[9]=0xAA000025 chs[10]="audio/1503.mp3"
elseif ch == "浮生_骨精灵_魔棒" then
   chs[1]=0xAA000021 chs[2]=0xAA000021 chs[3]=0xAA000023 chs[4]=0xAA000022 chs[6]=0xAA000024 chs[7]=0xAA000026 chs[8]=0xAA000030 chs[9]=0xAA000025 chs[10]="audio/1503.mp3"
elseif ch == "浮生_骨精灵_爪刺" then
   chs[1]=0xAA000031 chs[2]=0xAA000031 chs[3]=0xAA000033 chs[4]=0xAA000032 chs[6]=0xAA000034 chs[7]=0xAA000036 chs[8]=0xAA000040 chs[9]=0xAA000035 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击2 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_影精灵" then
   chs[1]=0xAA000342 chs[2]=0xAA000341 chs[3]=0xAA000346 chs[4]=0xAA000345 chs[6]=0xAA000347 chs[7]=0xAA000349 chs[8]=0xAA000350 chs[9]=0xAA000348 chs[10]="audio/1503.mp3" chs[11]=0xAA000343 chs[12]=0xAA000343 chs[13]=0xAA000344
elseif ch == "浮生_影精灵_双斧乾" then
   chs[1]=0xAA000342 chs[2]=0xAA000341 chs[3]=0xAA000346 chs[4]=0xAA000345 chs[6]=0xAA000347 chs[7]=0xAA000349 chs[8]=0xAA000350 chs[9]=0xAA000348 chs[10]="audio/1503.mp3" chs[11]=0xAA000343 chs[12]=0xAA000343 chs[13]=0xAA000344
elseif ch == "浮生_影精灵_双斧坤" then
   chs[1]=0xAA000342 chs[2]=0xAA000341 chs[3]=0xAA000346 chs[4]=0xAA000345 chs[6]=0xAA000347 chs[7]=0xAA000349 chs[8]=0xAA000350 chs[9]=0xAA000348 chs[10]="audio/1503.mp3" chs[11]=0xAA000343 chs[12]=0xAA000343 chs[13]=0xAA000344

elseif ch == "浮生_影精灵_魔棒" then
   chs[1]=0xA0000021 chs[2]=0xA0000021 chs[3]=0xA0000023 chs[4]=0xA0000022 chs[6]=0xA0000024 chs[7]=0xA0000026 chs[8]=0xA0000027 chs[9]=0xA0000025 chs[10]="audio/1132.mp3" chs[11]=0xA0000021 chs[12]=0xA0000021 chs[13]=0xA0000021
elseif ch == "浮生_影精灵_爪刺" then
   chs[1]=0xA0000031 chs[2]=0xA0000031 chs[3]=0xA0000033 chs[4]=0xA0000032 chs[6]=0xA0000034 chs[7]=0xA0000036 chs[8]=0xA0000037 chs[9]=0xA0000035 chs[10]="audio/1132.mp3" chs[11]=0xA0000021 chs[12]=0xA0000021 chs[13]=0xA0000021
   -----1 攻击 2 攻击2 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_杀破狼" then
   chs[1]=0xAA000161 chs[2]=0xAA000161 chs[3]=0xAA000163 chs[4]=0xAA000162 chs[6]=0xAA000164 chs[7]=0xAA000166 chs[8]=0xAA000167 chs[9]=0xAA000165 chs[10]="audio/1503.mp3"
elseif ch == "浮生_杀破狼_宝珠" then
   chs[1]=0xAA000161 chs[2]=0xAA000161 chs[3]=0xAA000163 chs[4]=0xAA000162 chs[6]=0xAA000164 chs[7]=0xAA000166 chs[8]=0xAA000167 chs[9]=0xAA000165 chs[10]="audio/1503.mp3"
elseif ch == "浮生_杀破狼_弓弩" then
   chs[1]=0xAA000171 chs[2]=0xAA000171 chs[3]=0xAA000173 chs[4]=0xAA000172 chs[6]=0xAA000174 chs[7]=0xAA000176 chs[8]=0xAA000177 chs[9]=0xAA000175 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_鬼潇潇" then
   chs[1]=0xAA000041 chs[2]=0xAA000041 chs[3]=0xAA000043  chs[4]=0xAA000042 chs[6]=0xAA000044 chs[7]=0xAA000046 chs[8]=0xAA000047 chs[9]=0xAA000045 chs[10]="audio/1503.mp3"
elseif ch == "浮生_鬼潇潇_爪刺" then
   chs[1]=0xAA000051 chs[2]=0xAA000051 chs[3]=0xAA000053 chs[4]=0xAA000052 chs[6]=0xAA000054 chs[7]=0xAA000056 chs[8]=0xAA000057 chs[9]=0xAA000055 chs[10]="audio/1503.mp3"
elseif ch == "浮生_鬼潇潇_伞" then
   chs[1]=0xAA000041 chs[2]=0xAA000041 chs[3]=0xAA000043  chs[4]=0xAA000042 chs[6]=0xAA000044 chs[7]=0xAA000046 chs[8]=0xAA000047 chs[9]=0xAA000045 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_神天兵" then
   chs[1]=0xAA000181 chs[2]=0xAA000181 chs[3]=0xAA000183 chs[4]=0xAA000182 chs[6]=0xAA000184 chs[7]=0xAA000186 chs[8]=0xAA000187 chs[9]=0xAA000185 chs[10]="audio/1503.mp3"
elseif ch == "浮生_神天兵_锤" then
   chs[1]=0xAA000181 chs[2]=0xAA000181 chs[3]=0xAA000183 chs[4]=0xAA000182 chs[6]=0xAA000184 chs[7]=0xAA000186 chs[8]=0xAA000187 chs[9]=0xAA000185 chs[10]="audio/1503.mp3"
elseif ch == "浮生_神天兵_枪矛" then
   chs[1]=0xAA000191 chs[2]=0xAA000191 chs[3]=0xAA000193 chs[4]=0xAA000192 chs[6]=0xAA000194 chs[7]=0xAA000196 chs[8]=0xAA000197 chs[9]=0xAA000195 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_龙太子" then
   chs[1]=0xAA000141 chs[2]=0xAA000141 chs[3]=0xAA000143 chs[4]=0xAA000142 chs[6]=0xAA000144 chs[7]=0xAA000146 chs[8]=0xAA000147 chs[9]=0xAA000145 chs[15]=0xAA000148 chs[10]="audio/1503.mp3"
elseif ch == "浮生_龙太子_枪矛" then
   chs[1]=0xAA000141 chs[2]=0xAA000141 chs[3]=0xAA000143 chs[4]=0xAA000142 chs[6]=0xAA000144 chs[7]=0xAA000146 chs[8]=0xAA000147 chs[9]=0xAA000145 chs[15]=0xAA000148 chs[10]="audio/1503.mp3"
elseif ch == "浮生_龙太子_扇" then
   chs[1]=0xAA000151 chs[2]=0xAA000151 chs[3]=0xAA000153 chs[4]=0xAA000152 chs[6]=0xAA000154 chs[7]=0xAA000156 chs[8]=0xAA000157 chs[9]=0xAA000155 chs[15]=0xAA000158 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_舞天姬" then
   chs[1]=0xAA000241 chs[2]=0xAA000241 chs[3]=0xAA000243 chs[4]=0xAA000242 chs[6]=0xAA000244 chs[7]=0xAA000246 chs[8]=0xAA000247 chs[9]=0xAA000245 chs[10]="audio/1503.mp3"
elseif ch == "浮生_舞天姬_环圈" then
   chs[1]=0xAA000241 chs[2]=0xAA000241 chs[3]=0xAA000243 chs[4]=0xAA000242 chs[6]=0xAA000244 chs[7]=0xAA000246 chs[8]=0xAA000247 chs[9]=0xAA000245 chs[10]="audio/1503.mp3"
elseif ch == "浮生_舞天姬_飘带" then
   chs[1]=0xAA000251 chs[2]=0xAA000251 chs[3]=0xAA000253 chs[4]=0xAA000252 chs[6]=0xAA000254 chs[7]=0xAA000256 chs[8]=0xAA000257 chs[9]=0xAA000255 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_玄彩娥" then
   chs[1]=0xAA000281 chs[2]=0xAA000281 chs[3]=0xAA000283 chs[4]=0xAA000282 chs[6]=0xAA000284 chs[7]=0xAA000286 chs[8]=0xAA000287 chs[9]=0xAA000285 chs[10]="audio/1503.mp3"
elseif ch == "浮生_玄彩娥_魔棒" then
   chs[1]=0xAA000281 chs[2]=0xAA000281 chs[3]=0xAA000283 chs[4]=0xAA000282 chs[6]=0xAA000284 chs[7]=0xAA000286 chs[8]=0xAA000287 chs[9]=0xAA000285 chs[10]="audio/1503.mp3"
elseif ch == "浮生_玄彩娥_飘带" then
   chs[1]=0xAA000291 chs[2]=0xAA000291 chs[3]=0xAA000293 chs[4]=0xAA000292 chs[6]=0xAA000294 chs[7]=0xAA000296 chs[8]=0xAA000297 chs[9]=0xAA000295 chs[10]="audio/1503.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "浮生_羽灵神" then
   chs[1]=0xAA000354 chs[2]=0xAA000354 chs[3]=0xAA000356 chs[4]=0xAA000355 chs[6]=0xAA000357 chs[7]=0xAA000359 chs[8]=0xAA000360 chs[9]=0xAA000358 chs[10]="audio/1503.mp3"
elseif ch == "浮生_羽灵神_法杖" then
   chs[1]=0xAA000364 chs[2]=0xAA000364 chs[3]=0xAA000366 chs[4]=0xAA000365 chs[6]=0xAA000367 chs[7]=0xAA000369 chs[8]=0xAA000370 chs[9]=0xAA000368 chs[10]="audio/1503.mp3"
elseif ch == "浮生_羽灵神_弓弩" then
   chs[1]=0xAA000354 chs[2]=0xAA000354 chs[3]=0xAA000356 chs[4]=0xAA000355 chs[6]=0xAA000357 chs[7]=0xAA000359 chs[8]=0xAA000360 chs[9]=0xAA000358 chs[10]="audio/1503.mp3"

elseif ch == "浮生_桃夭夭" then
   chs[1]=0xAA000201 chs[2]=0xAA000201 chs[3]=0xAA000203 chs[4]=0xAA000202 chs[6]=0xAA000204 chs[7]=0xAA000206 chs[8]=0xAA000207 chs[9]=0xAA000205 chs[10]="audio/1503.mp3"
elseif ch == "浮生_桃夭夭_飘带" then
   chs[1]=0xAA000211 chs[2]=0xAA000211 chs[3]=0xAA000213 chs[4]=0xAA000212 chs[6]=0xAA000214 chs[7]=0xAA000216 chs[8]=0xAA000217 chs[9]=0xAA000215 chs[10]="audio/1503.mp3"
elseif ch == "浮生_桃夭夭_灯笼" then
   chs[1]=0xAA000201 chs[2]=0xAA000201 chs[3]=0xAA000203 chs[4]=0xAA000202 chs[6]=0xAA000204 chs[7]=0xAA000206 chs[8]=0xAA000207 chs[9]=0xAA000205 chs[10]="audio/1503.mp3"

   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
--===========================================================青花瓷================================================================================
elseif ch == "青花瓷_飞燕女" then
   chs[1]=0xA0000001   chs[2]=0xA0000001   chs[3]=0xA0000003 chs[4]=0xA0000002   chs[6]=0xA0000004 chs[7]=0xA0000006   chs[8]=0xA0000010   chs[9]=0xA0000005   chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_飞燕女_双短剑" then
   chs[1]=0xA0000011   chs[2]=0xA0000011   chs[3]=0xA0000013 chs[4]=0xA0000012   chs[6]=0xA0000014 chs[7]=0xA0000016 chs[8]=0xA0000020 chs[9]=0xA0000015 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_飞燕女_环圈" then
   chs[1]=0xA0000001   chs[2]=0xA0000001   chs[3]=0xA0000003 chs[4]=0xA0000002   chs[6]=0xA0000004 chs[7]=0xA0000006   chs[8]=0xA0000010   chs[9]=0xA0000005   chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_剑侠客" then
   chs[1]=0xA0000101 chs[2]=0xA0000101 chs[3]=0xA0000103 chs[4]=0xA0000102 chs[6]=0xA0000104 chs[7]=0xA0000106 chs[8]=0xA0000107 chs[9]=0xA0000105  chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_剑侠客_刀" then
   chs[1]=0xA0000101 chs[2]=0xA0000101 chs[3]=0xA0000103 chs[4]=0xA0000102 chs[6]=0xA0000104 chs[7]=0xA0000106 chs[8]=0xA0000107 chs[9]=0xA0000105  chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_剑侠客_剑" then
   chs[1]=0xA0000111 chs[2]=0xA0000111 chs[3]=0xA0000113 chs[4]=0xA0000112 chs[6]=0xA0000114 chs[7]=0xA0000116 chs[8]=0xA0000117 chs[9]=0xA0000115  chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_逍遥生" then
   chs[1]=0xA0000261 chs[2]=0xA0000261  chs[3]=0xA0000263 chs[4]=0xA0000262 chs[6]=0xA0000264 chs[7]=0xA0000266 chs[8]=0xA0000267 chs[9]=0xA0000265 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_逍遥生_剑" then
   chs[1]=0xA0000261 chs[2]=0xA0000261  chs[3]=0xA0000263 chs[4]=0xA0000262 chs[6]=0xA0000264 chs[7]=0xA0000266 chs[8]=0xA0000267 chs[9]=0xA0000265 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_逍遥生_扇" then
   chs[1]=0xA0000271 chs[2]=0xA0000271 chs[3]=0xA0000273 chs[4]=0xA0000272 chs[6]=0xA0000274 chs[7]=0xA0000276 chs[8]=0xA0000277 chs[9]=0xA0000275 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_英女侠" then
   chs[1]=0xA0000321 chs[2]=0xA0000321 chs[3]=0xA0000323 chs[4]=0xA0000322 chs[6]=0xA0000324 chs[7]=0xA0000326 chs[8]=0xA0000327 chs[9]=0xA0000325 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_英女侠_鞭" then
   chs[1]=0xA0000321 chs[2]=0xA0000321 chs[3]=0xA0000323 chs[4]=0xA0000322 chs[6]=0xA0000324 chs[7]=0xA0000326 chs[8]=0xA0000327 chs[9]=0xA0000325 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_英女侠_双短剑" then
   chs[1]=0xA0000331 chs[2]=0xA0000331 chs[3]=0xA0000333 chs[4]=0xA0000332 chs[6]=0xA0000334 chs[7]=0xA0000336 chs[8]=0xA0000337 chs[9]=0xA0000335 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_偃无师" then
   chs[1]=0xA0000301 chs[2]=0xA0000301 chs[3]=0xA0000303 chs[4]=0xA0000302 chs[6]=0xA0000304 chs[7]=0xA0000306 chs[8]=0xA0000307 chs[9]=0xA0000305 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_偃无师_剑" then
   chs[1]=0xA0000301 chs[2]=0xA0000301 chs[3]=0xA0000303 chs[4]=0xA0000302 chs[6]=0xA0000304 chs[7]=0xA0000306 chs[8]=0xA0000307 chs[9]=0xA0000305 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_偃无师_巨剑" then
   chs[1]=0xA0000311 chs[2]=0xA0000311 chs[3]=0xA0000313 chs[4]=0xA0000312 chs[6]=0xA0000314 chs[7]=0xA0000316 chs[8]=0xA0000317 chs[9]=0xA0000315 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_巫蛮儿" then
   chs[1]=0xA0000221 chs[2]=0xA0000221 chs[3]=0xA0000223 chs[4]=0xA0000222 chs[6]=0xA0000224 chs[7]=0xA0000226 chs[8]=0xA0000227 chs[9]=0xA0000225 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_巫蛮儿_法杖" then
   chs[1]=0xA0000231 chs[2]=0xA0000231 chs[3]=0xA0000233 chs[4]=0xA0000232 chs[6]=0xA0000234 chs[7]=0xA0000236 chs[8]=0xA0000237 chs[9]=0xA0000235 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_巫蛮儿_宝珠" then
   chs[1]=0xA0000221 chs[2]=0xA0000221 chs[3]=0xA0000223 chs[4]=0xA0000222 chs[6]=0xA0000224 chs[7]=0xA0000226 chs[8]=0xA0000227 chs[9]=0xA0000225 chs[10]="audio/1130.mp3"

elseif ch == "青花瓷_巨魔王" then
   chs[1]=0xA0000121 chs[2]=0xA0000121 chs[3]=0xA0000123 chs[4]=0xA0000122 chs[6]=0xA0000124 chs[7]=0xA0000126 chs[8]=0xA0000127 chs[9]=0xA0000125 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_巨魔王_刀" then
   chs[1]=0xA0000121 chs[2]=0xA0000121 chs[3]=0xA0000123 chs[4]=0xA0000122 chs[6]=0xA0000124 chs[7]=0xA0000126 chs[8]=0xA0000127 chs[9]=0xA0000125 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_巨魔王_斧钺" then
   chs[1]=0xA0000131 chs[2]=0xA0000131 chs[3]=0xA0000133 chs[4]=0xA0000132 chs[6]=0xA0000134 chs[7]=0xA0000136 chs[8]=0xA0000137 chs[9]=0xA0000135 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_虎头怪" then
   chs[1]=0xA0000081 chs[2]=0xA0000081 chs[3]=0xA0000083 chs[4]=0xA0000082 chs[6]=0xA0000084 chs[7]=0xA0000086 chs[8]=0xA0000087 chs[9]=0xA0000085 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_虎头怪_锤" then
   chs[1]=0xA0000081 chs[2]=0xA0000081 chs[3]=0xA0000083 chs[4]=0xA0000082 chs[6]=0xA0000084 chs[7]=0xA0000086 chs[8]=0xA0000087 chs[9]=0xA0000085 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_虎头怪_斧钺" then
   chs[1]=0xA0000091 chs[2]=0xA0000091 chs[3]=0xA0000093 chs[4]=0xA0000092 chs[6]=0xA0000094 chs[7]=0xA0000096 chs[8]=0xA0000097 chs[9]=0xA0000095 chs[10]="audio/1130.mp3"

elseif ch == "青花瓷_狐美人" then
   chs[1]=0xA0000061 chs[2]=0xA0000061 chs[3]=0xA0000063 chs[4]=0xA0000062 chs[6]=0xA0000064 chs[7]=0xA0000066 chs[8]=0xA0000067 chs[9]=0xA0000065 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_狐美人_鞭" then
   chs[1]=0xA0000061 chs[2]=0xA0000061 chs[3]=0xA0000063 chs[4]=0xA0000062 chs[6]=0xA0000064 chs[7]=0xA0000066 chs[8]=0xA0000067 chs[9]=0xA0000065 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_狐美人_爪刺" then
   chs[1]=0xA0000071 chs[2]=0xA0000071 chs[3]=0xA0000073 chs[4]=0xA0000072 chs[6]=0xA0000074 chs[7]=0xA0000076 chs[8]=0xA0000077 chs[9]=0xA0000075 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_骨精灵" then
   chs[1]=0xA0000021 chs[2]=0xA0000021 chs[3]=0xA0000023 chs[4]=0xA0000022 chs[6]=0xA0000024 chs[7]=0xA0000026 chs[8]=0xA0000030 chs[9]=0xA0000025 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_骨精灵_魔棒" then
   chs[1]=0xA0000021 chs[2]=0xA0000021 chs[3]=0xA0000023 chs[4]=0xA0000022 chs[6]=0xA0000024 chs[7]=0xA0000026 chs[8]=0xA0000030 chs[9]=0xA0000025 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_骨精灵_爪刺" then
   chs[1]=0xA0000031 chs[2]=0xA0000031 chs[3]=0xA0000033 chs[4]=0xA0000032 chs[6]=0xA0000034 chs[7]=0xA0000036 chs[8]=0xA0000040 chs[9]=0xA0000035 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击2 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_影精灵" then
   chs[1]=0xA0000342 chs[2]=0xA0000341 chs[3]=0xA0000346 chs[4]=0xA0000345 chs[6]=0xA0000347 chs[7]=0xA0000349 chs[8]=0xA0000350 chs[9]=0xA0000348 chs[10]="audio/1130.mp3" chs[11]=0xA0000343 chs[12]=0xA0000343 chs[13]=0xA0000344
elseif ch == "青花瓷_影精灵_双斧乾" then
   chs[1]=0xA0000342 chs[2]=0xA0000341 chs[3]=0xA0000346 chs[4]=0xA0000345 chs[6]=0xA0000347 chs[7]=0xA0000349 chs[8]=0xA0000350 chs[9]=0xA0000348 chs[10]="audio/1130.mp3" chs[11]=0xA0000343 chs[12]=0xA0000343 chs[13]=0xA0000344
elseif ch == "青花瓷_影精灵_双斧坤" then
   chs[1]=0xA0000342 chs[2]=0xA0000341 chs[3]=0xA0000346 chs[4]=0xA0000345 chs[6]=0xA0000347 chs[7]=0xA0000349 chs[8]=0xA0000350 chs[9]=0xA0000348 chs[10]="audio/1130.mp3" chs[11]=0xA0000343 chs[12]=0xA0000343 chs[13]=0xA0000344

elseif ch == "青花瓷_影精灵_魔棒" then
   chs[1]=0xA0000001 chs[2]=0xA0000001 chs[3]=0xA0000003 chs[4]=0xA0000002 chs[6]=0xA0000004 chs[7]=0xA0000006 chs[8]=0xA0000007 chs[9]=0xA0000005 chs[10]="audio/1132.mp3" chs[11]=0xA0000001  chs[12]=0xA0000001  chs[13]=0xA0000001
elseif ch == "青花瓷_影精灵_爪刺" then
   chs[1]=0xA0000011 chs[2]=0xA0000011 chs[3]=0xA0000013 chs[4]=0xA0000012 chs[6]=0xA0000014 chs[7]=0xA0000016 chs[8]=0xA0000017 chs[9]=0xA0000015 chs[10]="audio/1132.mp3" chs[11]=0xA0000001  chs[12]=0xA0000001  chs[13]=0xA0000001
   -----1 攻击 2 攻击2 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_杀破狼" then
   chs[1]=0xA0000161 chs[2]=0xA0000161 chs[3]=0xA0000163 chs[4]=0xA0000162 chs[6]=0xA0000164 chs[7]=0xA0000166 chs[8]=0xA0000167 chs[9]=0xA0000165 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_杀破狼_宝珠" then
   chs[1]=0xA0000161 chs[2]=0xA0000161 chs[3]=0xA0000163 chs[4]=0xA0000162 chs[6]=0xA0000164 chs[7]=0xA0000166 chs[8]=0xA0000167 chs[9]=0xA0000165 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_杀破狼_弓弩" then
   chs[1]=0xA0000171 chs[2]=0xA0000171 chs[3]=0xA0000173 chs[4]=0xA0000172 chs[6]=0xA0000174 chs[7]=0xA0000176 chs[8]=0xA0000177 chs[9]=0xA0000175 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_鬼潇潇" then
   chs[1]=0xA0000041 chs[2]=0xA0000041 chs[3]=0xA0000043  chs[4]=0xA0000042 chs[6]=0xA0000044 chs[7]=0xA0000046 chs[8]=0xA0000047 chs[9]=0xA0000045 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_鬼潇潇_爪刺" then
   chs[1]=0xA0000051 chs[2]=0xA0000051 chs[3]=0xA0000053 chs[4]=0xA0000052 chs[6]=0xA0000054 chs[7]=0xA0000056 chs[8]=0xA0000057 chs[9]=0xA0000055 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_鬼潇潇_伞" then
   chs[1]=0xA0000041 chs[2]=0xA0000041 chs[3]=0xA0000043  chs[4]=0xA0000042 chs[6]=0xA0000044 chs[7]=0xA0000046 chs[8]=0xA0000047 chs[9]=0xA0000045 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_神天兵" then
   chs[1]=0xA0000181 chs[2]=0xA0000181 chs[3]=0xA0000183 chs[4]=0xA0000182 chs[6]=0xA0000184 chs[7]=0xA0000186 chs[8]=0xA0000187 chs[9]=0xA0000185 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_神天兵_锤" then
   chs[1]=0xA0000181 chs[2]=0xA0000181 chs[3]=0xA0000183 chs[4]=0xA0000182 chs[6]=0xA0000184 chs[7]=0xA0000186 chs[8]=0xA0000187 chs[9]=0xA0000185 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_神天兵_枪矛" then
   chs[1]=0xA0000191 chs[2]=0xA0000191 chs[3]=0xA0000193 chs[4]=0xA0000192 chs[6]=0xA0000194 chs[7]=0xA0000196 chs[8]=0xA0000197 chs[9]=0xA0000195 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_龙太子" then
   chs[1]=0xA0000141 chs[2]=0xA0000141 chs[3]=0xA0000143 chs[4]=0xA0000142 chs[6]=0xA0000144 chs[7]=0xA0000146 chs[8]=0xA0000147 chs[9]=0xA0000145 chs[15]=0xA0000148 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_龙太子_枪矛" then
   chs[1]=0xA0000141 chs[2]=0xA0000141 chs[3]=0xA0000143 chs[4]=0xA0000142 chs[6]=0xA0000144 chs[7]=0xA0000146 chs[8]=0xA0000147 chs[9]=0xA0000145 chs[15]=0xA0000148 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_龙太子_扇" then
   chs[1]=0xA0000151 chs[2]=0xA0000151 chs[3]=0xA0000153 chs[4]=0xA0000152 chs[6]=0xA0000154 chs[7]=0xA0000156 chs[8]=0xA0000157 chs[9]=0xA0000155 chs[15]=0xA0000158  chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_舞天姬" then
   chs[1]=0xA0000241 chs[2]=0xA0000241 chs[3]=0xA0000243 chs[4]=0xA0000242 chs[6]=0xA0000244 chs[7]=0xA0000246 chs[8]=0xA0000247 chs[9]=0xA0000245 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_舞天姬_环圈" then
   chs[1]=0xA0000241 chs[2]=0xA0000241 chs[3]=0xA0000243 chs[4]=0xA0000242 chs[6]=0xA0000244 chs[7]=0xA0000246 chs[8]=0xA0000247 chs[9]=0xA0000245 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_舞天姬_飘带" then
   chs[1]=0xA0000251 chs[2]=0xA0000251 chs[3]=0xA0000253 chs[4]=0xA0000252 chs[6]=0xA0000254 chs[7]=0xA0000256 chs[8]=0xA0000257 chs[9]=0xA0000255 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_玄彩娥" then
   chs[1]=0xA0000281 chs[2]=0xA0000281 chs[3]=0xA0000283 chs[4]=0xA0000282 chs[6]=0xA0000284 chs[7]=0xA0000286 chs[8]=0xA0000287 chs[9]=0xA0000285 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_玄彩娥_魔棒" then
   chs[1]=0xA0000281 chs[2]=0xA0000281 chs[3]=0xA0000283 chs[4]=0xA0000282 chs[6]=0xA0000284 chs[7]=0xA0000286 chs[8]=0xA0000287 chs[9]=0xA0000285 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_玄彩娥_飘带" then
   chs[1]=0xA0000291 chs[2]=0xA0000291 chs[3]=0xA0000293 chs[4]=0xA0000292 chs[6]=0xA0000294 chs[7]=0xA0000296 chs[8]=0xA0000297 chs[9]=0xA0000295 chs[10]="audio/1130.mp3"
   -----1 攻击 2 攻击 3 死亡 4 防御 6 待战 7 施法 8 返回 跑去 9 挨打
elseif ch == "青花瓷_羽灵神" then
   chs[1]=0xA0000354 chs[2]=0xA0000354 chs[3]=0xA0000356 chs[4]=0xA0000355 chs[6]=0xA0000357 chs[7]=0xA0000359 chs[8]=0xA0000360 chs[9]=0xA0000358 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_羽灵神_法杖" then
   chs[1]=0xA0000364 chs[2]=0xA0000364 chs[3]=0xA0000366 chs[4]=0xA0000365 chs[6]=0xA0000367 chs[7]=0xA0000369 chs[8]=0xA0000370 chs[9]=0xA0000368 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_羽灵神_弓弩" then
   chs[1]=0xA0000354 chs[2]=0xA0000354 chs[3]=0xA0000356 chs[4]=0xA0000355 chs[6]=0xA0000357 chs[7]=0xA0000359 chs[8]=0xA0000360 chs[9]=0xA0000358 chs[10]="audio/1130.mp3"

elseif ch == "青花瓷_桃夭夭" then
   chs[1]=0xA0000201 chs[2]=0xA0000201 chs[3]=0xA0000203 chs[4]=0xA0000202 chs[6]=0xA0000204 chs[7]=0xA0000206 chs[8]=0xA0000207 chs[9]=0xA0000205 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_桃夭夭_飘带" then
   chs[1]=0xA0000211 chs[2]=0xA0000211 chs[3]=0xA0000213 chs[4]=0xA0000212 chs[6]=0xA0000214 chs[7]=0xA0000216 chs[8]=0xA0000217 chs[9]=0xA0000215 chs[10]="audio/1130.mp3"
elseif ch == "青花瓷_桃夭夭_灯笼" then
   chs[1]=0xA0000201 chs[2]=0xA0000201 chs[3]=0xA0000203 chs[4]=0xA0000202 chs[6]=0xA0000204 chs[7]=0xA0000206 chs[8]=0xA0000207 chs[9]=0xA0000205 chs[10]="audio/1130.mp3"
end
   return chs
end

