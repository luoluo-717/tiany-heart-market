--[[
    @Author       : GGELUA
    @Date         : 2022-02-13 20:40:36
Last Modified by: GGELUA
Last Modified time: 2023-05-25 16:38:20
--]]
local 窗口层 = 多开数据[多开数据.当前].__UI界面:创建界面("窗口层")
local 当前 = 多开数据.当前
local SDL = require 'SDL'
function 窗口层:初始化()
   
end

function 窗口层:重新初始化() --取消
    for k, v in self:遍历控件() do
        v:置可见(false)
    end
end


function 窗口层:鼠标关闭()
    -- local lsb = {状态提示'}
    -- for _, v in ipairs(lsb) do
    --     if self[v].是否可见 then
    --         self[v]:置可见(false)
    --     end
    -- end
end

function 窗口层:消息事件(msg) --消息事件是协程
    for i, v in ipairs(msg.鼠标) do
        local x, y = v.x, v.y
        if v.button == SDL.BUTTON_LEFT then
            if v.type == SDL.MOUSE_DOWN then
                -- if x < 0 then
                --     break
                -- end
                self.按下 = os.time()
            elseif v.type == SDL.MOUSE_UP and self.按下 then
                self.按下 = false
                -- if x < 0 then
                --     break
                -- end
                self:鼠标关闭()
            end
        elseif v.button == SDL.BUTTON_RIGHT then
            if v.type == SDL.MOUSE_UP then

            end
        end
    end
end
package.loaded["界面/窗口层/人物属性"] = nil
package.loaded["界面/窗口层/人物加点"] = nil
package.loaded["界面/窗口层/人物称谓"] = nil
package.loaded["界面/窗口层/召唤兽属性"] = nil
package.loaded["界面/窗口层/宝宝进化"] = nil
package.loaded["界面/窗口层/召唤兽加点"] = nil
package.loaded["界面/窗口层/召唤兽洗炼"] = nil
package.loaded["界面/窗口层/神兽增加技能"] = nil
package.loaded["界面/窗口层/召唤兽合宠"] = nil
package.loaded["界面/窗口层/召唤兽查看"] = nil
package.loaded["界面/窗口层/弹出/召唤兽选择"] = nil
package.loaded["界面/窗口层/对话栏"] = nil
package.loaded["界面/窗口层/法宝"] = nil
package.loaded["界面/窗口层/战斗法术"] = nil
package.loaded["界面/窗口层/战斗自动法术"] = nil
package.loaded["界面/窗口层/自动法术"] = nil
package.loaded["界面/窗口层/战斗道具"] = nil
package.loaded["界面/窗口层/战斗自动"] = nil
package.loaded["界面/窗口层/战斗召唤"] = nil
package.loaded["界面/窗口层/战斗召唤详情"] = nil
package.loaded["界面/窗口层/战斗灵宝"] = nil
package.loaded["界面/窗口层/弹出/道具详情"] = nil
package.loaded["界面/窗口层/弹出/指引弹出"] = nil
package.loaded["界面/窗口层/弹出/锦衣弹出"] = nil
package.loaded["界面/窗口层/弹出/技能详情"] = nil
package.loaded["界面/弹出/经脉详情"] = nil
package.loaded["界面/窗口层/弹出/重叠弹出"] = nil
package.loaded["界面/窗口层/道具行囊"] = nil
package.loaded["界面/窗口层/弹出/道具选择"] = nil
package.loaded["界面/窗口层/文本栏"] = nil
package.loaded["界面/窗口层/宠物"] = nil
package.loaded["界面/窗口层/商店"] = nil
package.loaded["界面/窗口层/声望商店"] = nil
package.loaded["界面/窗口层/超级传送"] = nil
package.loaded["界面/窗口层/新副本界面"] = nil

package.loaded["界面/窗口层/给予NPC"] = nil
package.loaded["界面/窗口层/给予"] = nil
package.loaded["界面/窗口层/强化给予"] = nil
package.loaded["界面/窗口层/交易"] = nil
package.loaded["界面/窗口层/弹出/队伍弹出"] = nil
package.loaded["界面/窗口层/队伍列表"] = nil
package.loaded["界面/窗口层/队伍请求列表"] = nil
package.loaded["界面/窗口层/阵型选择"] = nil
package.loaded["界面/窗口层/弹出/招募队员"] = nil
package.loaded["界面/窗口层/弹出/单个招募"] = nil
package.loaded["界面/窗口层/小地图"] = nil
package.loaded["界面/窗口层/世界大地图"] = nil
package.loaded["界面/窗口层/东胜神洲"] = nil
package.loaded["界面/窗口层/南瞻部洲"] = nil
package.loaded["界面/窗口层/西牛贺州"] = nil
package.loaded["界面/窗口层/北俱芦洲"] = nil
package.loaded["界面/窗口层/辅助内挂类"] = nil 
package.loaded["界面/窗口层/弹出/小地图筛选"] = nil
package.loaded["界面/窗口层/弹出/小地图寻路"] = nil
package.loaded["界面/窗口层/飞行符"] = nil
package.loaded["界面/新增/新春飞行符"] = nil
package.loaded["界面/新增/召唤兽换造型"] = nil
package.loaded["界面/新增/上古玉魄镶嵌"] = nil
package.loaded["界面/新增/奇袭界面"] = nil
package.loaded["界面/新增/巅峰赛界面"] = nil
package.loaded["界面/新增/武神坛比武"] = nil
package.loaded["界面/新增/巅峰赛赛前备战界面"]  =nil
package.loaded["界面/新增/巅峰赛技能栏"]  =nil
package.loaded["界面/新增/千变万化"]  =nil
package.loaded["界面/新增/千变万化主界面"]  =nil

 
package.loaded["界面/窗口层/合成旗"] = nil
package.loaded["界面/窗口层/消息管理"] = nil
package.loaded["界面/窗口层/消息综合"] = nil
package.loaded["界面/窗口层/弹出/气魔补充"] = nil
package.loaded["界面/窗口层/任务提示"] = nil
package.loaded["界面/窗口层/弹出/状态提示"] = nil
package.loaded["界面/窗口层/技能学习"] = nil
package.loaded["界面/窗口层/帮派创建"] = nil
package.loaded["界面/窗口层/帮派加入"] = nil
package.loaded["界面/窗口层/帮派"] = nil
package.loaded["界面/窗口层/商城"] = nil
package.loaded["界面/窗口层/仓库"] = nil
package.loaded["界面/窗口层/召唤兽仓库"] = nil
package.loaded["界面/窗口层/门派选择"] = nil
package.loaded["界面/窗口层/弹出/快捷技能选择"] = nil
package.loaded["界面/窗口层/弹出/技能选择"] = nil
package.loaded["界面/窗口层/临时背包"] = nil
package.loaded["界面/窗口层/弹出/道具鉴定"] = nil
package.loaded["界面/窗口层/弹出/仓库选择"] = nil
package.loaded["界面/窗口层/长安保卫战"] = nil
package.loaded["界面/窗口层/摊位购买"] = nil
package.loaded["界面/窗口层/摊位出售"] = nil
package.loaded["界面/窗口层/摊位制造"] = nil
package.loaded["界面/窗口层/装备开运"] = nil
package.loaded["界面/窗口层/装备点化"] = nil
package.loaded["界面/窗口层/商会列表"] = nil
package.loaded["界面/窗口层/商会物品"] = nil
package.loaded["界面/窗口层/商会召唤兽"] = nil
package.loaded["界面/窗口层/拍卖系统管理"] = nil
package.loaded["界面/窗口层/装备自选"] = nil
package.loaded["界面/窗口层/灵饰自选"] = nil
package.loaded["界面/窗口层/坊市交易"] = nil
package.loaded["界面/窗口层/道具出售"] = nil
package.loaded["界面/窗口层/系统商会"] = nil
package.loaded["界面/窗口层/存款"] = nil
package.loaded["界面/窗口层/伙伴"] = nil
package.loaded["界面/窗口层/系统设置"] = nil
package.loaded["界面/窗口层/人物修炼"] = nil
package.loaded["界面/窗口层/宠物修炼"] = nil
package.loaded["界面/窗口层/奇经八脉"] = nil
package.loaded["界面/窗口层/打造"] = nil
package.loaded["界面/窗口层/子女查看"] = nil
package.loaded["界面/窗口层/弹出/提示弹出"] = nil
package.loaded["界面/窗口层/弹出/副本提示"] = nil
package.loaded["界面/窗口层/人物染色"] = nil
package.loaded["界面/窗口层/武器染色"] = nil
package.loaded["界面/窗口层/召唤兽染色"] = nil
package.loaded["界面/窗口层/坐骑属性"] = nil
package.loaded["界面/窗口层/坐骑加点"] = nil
package.loaded["界面/窗口层/输入栏"] = nil
package.loaded["界面/窗口层/弹出/玩家信息弹出"] = nil
package.loaded["界面/窗口层/帮派技能栏"] = nil
package.loaded["界面/窗口层/自由技能栏"] = nil
package.loaded["界面/窗口层/修炼学习"] = nil
package.loaded["界面/窗口层/活动指引"] = nil
package.loaded["界面/窗口层/排行榜"] = nil
package.loaded["界面/窗口层/世界排行榜"] = nil
package.loaded["界面/窗口层/比武排行榜"] = nil
package.loaded["界面/窗口层/弹出/成就弹窗"] = nil
package.loaded["界面/窗口层/生死劫"] = nil
package.loaded["界面/窗口层/装备开运"] = nil
package.loaded["界面/窗口层/符石"] = nil
package.loaded["界面/弹出/符石道具选择"] = nil
package.loaded["界面/弹出/镶嵌道具选择"] = nil

package.loaded["界面/窗口层/弹出/神器道具选择"] = nil
package.loaded["界面/窗口层/法宝锻造"] = nil
package.loaded["界面/窗口层/符石合成"] = nil
package.loaded["界面/窗口层/镇妖铃"] = nil
package.loaded["界面/窗口层/潜能果"] = nil
package.loaded["界面/窗口层/宝箱抽奖"] = nil
package.loaded["界面/窗口层/转盘抽奖"] = nil
package.loaded["界面/窗口层/嘉年华转盘抽奖"] = nil

package.loaded["界面/窗口层/每日签到"] = nil
package.loaded["界面/窗口层/自动抓鬼"] = nil
package.loaded["界面/窗口层/点卡寄售"] = nil
package.loaded["界面/窗口层/功能给予"] = nil
package.loaded["界面/窗口层/附魔宝珠"] = nil
package.loaded["界面/窗口层/弹出/打造选择"] = nil
package.loaded["界面/窗口层/弹出/子女弹出"] = nil
package.loaded["界面/窗口层/BOOS挑战"] = nil
package.loaded["界面/窗口层/翻一番"] = nil
package.loaded["界面/窗口层/锦衣进阶"] = nil
package.loaded["界面/窗口层/锦衣焕彩继承"] = nil
package.loaded["界面/窗口层/锦衣技能继承"] = nil

package.loaded["界面/窗口层/锦衣洗练介绍"] = nil

package.loaded["界面/窗口层/发放红包"] = nil
package.loaded["界面/窗口层/收听红包传音"] = nil
package.loaded["界面/窗口层/打开红包传音"] = nil
-- package.loaded["界面/窗口层/剑会天下"] = nil
-- package.loaded["界面/窗口层/剑会匹配"] = nil
package.loaded["界面/新增/剑会天下"] = nil
package.loaded["界面/新增/剑会匹配"] = nil
package.loaded["界面/新增/归墟"] = nil
package.loaded["界面/新增/法宝附灵"] = nil

package.loaded["界面/窗口层/采矿兑换栏"] = nil

package.loaded["界面/窗口层/宠物领养栏"] = nil
package.loaded["界面/窗口层/炼药处理"] = nil
package.loaded["界面/窗口层/附魔"] = nil
package.loaded["界面/窗口层/好友"] = nil
package.loaded["界面/窗口层/在线查询"] = nil
package.loaded["界面/窗口层/弹出/好友弹出"] = nil
package.loaded["界面/窗口层/好友属性"] = nil
package.loaded["界面/窗口层/好友消息"] = nil
package.loaded["界面/窗口层/转换角色"] = nil
package.loaded["界面/窗口层/传音显示"] = nil
package.loaded["界面/窗口层/成长礼包"] = nil
package.loaded["界面/窗口层/乾元丹学习"] = nil
package.loaded["界面/窗口层/藏宝阁/藏宝阁类"] = nil 
package.loaded["界面/窗口层/藏宝阁/藏宝阁上架货币"] = nil 
package.loaded["界面/窗口层/藏宝阁/藏宝阁出售"] = nil 
package.loaded["界面/窗口层/藏宝阁/藏宝阁召唤兽出售"] = nil 

package.loaded["界面/窗口层/藏宝阁/藏宝阁出售寄存"] = nil 
package.loaded["界面/窗口层/藏宝阁/藏宝阁购买寄存"] = nil 
package.loaded["界面/窗口层/藏宝阁/藏宝阁召唤兽出售寄存"] = nil 
package.loaded["界面/窗口层/藏宝阁/藏宝阁召唤兽购买寄存"] = nil 
package.loaded["界面/窗口层/充值系统"] = nil
package.loaded["界面/窗口层/弹出/自由提示"] = nil 
package.loaded["界面/窗口层/幻化"] = nil 
package.loaded["界面/窗口层/合成灵犀玉"] = nil 
package.loaded["界面/窗口层/神器更换五行"] = nil 
package.loaded["界面/窗口层/神器修复"] = nil 
package.loaded["界面/窗口层/唱戏界面"] = nil 
package.loaded["界面/窗口层/唱戏开启"] = nil 

package.loaded["界面/窗口层/法宝选择"] = nil 
package.loaded["界面/窗口层/AI招募"] = nil 
package.loaded["界面/窗口层/收购发布"] = nil 
package.loaded["界面/窗口层/收购出售"] = nil 
package.loaded["界面/窗口层/成就系统"] = nil 
package.loaded["界面/窗口层/弹出/进阶详情"] = nil 
package.loaded["界面/窗口层/弹出/窗口道具"] = nil 
package.loaded["界面/窗口层/弹出/召唤兽更多弹出"] = nil 
package.loaded["界面/窗口层/弹出/道具弹出更多"] = nil 
package.loaded["界面/窗口层/弹出/摆摊弹出更多"] = nil 


package.loaded["界面/窗口层/宝宝进阶"] = nil 
package.loaded["界面/窗口层/自动回收"] = nil 
package.loaded["界面/窗口层/七日排行"] = nil
package.loaded["界面/窗口层/功能界面"] = nil


package.loaded["界面/助战窗口/助战列表"] = nil
package.loaded["界面/助战窗口/助战道具栏"] = nil
package.loaded["界面/助战窗口/助战详情"] = nil
package.loaded["界面/助战窗口/助战技能学习"] = nil
package.loaded["界面/助战窗口/道具助战详情"] = nil
package.loaded["界面/助战窗口/助战宝宝查看"] = nil
package.loaded["界面/助战窗口/助战宝宝加点"] = nil
package.loaded["界面/助战窗口/助战修炼学习"] = nil
package.loaded["界面/助战窗口/助战加点"] = nil
package.loaded["界面/助战窗口/助战更多属性弹出"] = nil
package.loaded["界面/助战窗口/助战创建"] = nil



--超级技能
package.loaded["界面/窗口层/超级技能/宝宝赐福"] = nil 
package.loaded["界面/窗口层/超级技能/赐福bb格子"] = nil 
package.loaded["界面/窗口层/超级技能/召唤兽技能弹出"] = nil 
package.loaded["界面/窗口层/超级技能/召唤兽做丸子"] = nil 
package.loaded["界面/窗口层/弹出/赐福保存"] = nil 
--
package.loaded["界面/窗口层/手机工具"] = nil 

package.loaded["界面/窗口层/商会列表"] = nil 
package.loaded["界面/窗口层/商会物品"] = nil 
package.loaded["界面/窗口层/商会召唤兽"] = nil
package.loaded["界面/窗口层/商会上架道具"] = nil 
package.loaded["界面/窗口层/商会上架召唤兽"] = nil
package.loaded["界面/窗口层/弹出/通用选择弹出"] = nil
package.loaded["界面/窗口层/简单_称号系统"] = nil
package.loaded["界面/窗口层/装备自选"] = nil
package.loaded["界面/窗口层/简单_本命法宝"] = nil
package.loaded["界面/窗口层/无双奖池"] = nil
package.loaded["界面/窗口层/奖池背景"] = nil

package.loaded["界面/窗口层/神来攻略"] = nil
package.loaded["界面/窗口层/灵饰强化"] = nil
package.loaded["界面/窗口层/账号仓库"] = nil
package.loaded["界面/窗口层/仙玉寄售"] = nil 
package.loaded["界面/窗口层/新增/双斧转换类"] = nil
package.loaded["界面/窗口层/新增/双斧转换选择"] = nil
package.loaded["界面/窗口层/新增/首冲奖励"] = nil

package.loaded["界面/窗口层/简单_兽魂系统"] = nil
package.loaded["界面/窗口层/简单_兽魂展示"] = nil
package.loaded["界面/窗口层/新增/一键回收"] = nil
package.loaded["界面/窗口层/新增/账号仓库一键回收"] = nil
package.loaded["界面/窗口层/新增/一键存放过滤"] = nil
package.loaded["界面/窗口层/新增/阵法系统"] = nil
package.loaded["界面/窗口层/新增/玉魄自选"] = nil
package.loaded["界面/窗口层/新增/丸子获超魔诀"] = nil
package.loaded["界面/窗口层/新增/修改召唤兽技能"] = nil
package.loaded["界面/窗口层/新增/交易中心"] = nil

package.loaded["界面/窗口层/新增/会员权益"] = nil
package.loaded["界面/窗口层/新增/阵营内容界面"] = nil
package.loaded["界面/窗口层/新增/阵营选择"] = nil
package.loaded["界面/窗口层/新增/玩法合集"] = nil
package.loaded["界面/窗口层/新增/光武拓印"] = nil

package.loaded["界面/窗口层/新增/镇妖关"] = nil
package.loaded["界面/窗口层/新增/御兽术"] = nil

package.loaded["界面/窗口层/自选系统"] = nil

require("界面/窗口层/手机工具")
require("界面/窗口层/辅助内挂类")
require("界面/窗口层/商会列表")
require("界面/窗口层/商会物品")
require("界面/窗口层/商会召唤兽")
require("界面/窗口层/商会上架召唤兽")
require("界面/窗口层/商会上架道具")
require("界面/窗口层/账号仓库")


require("界面/窗口层/七日排行")
require("界面/窗口层/自动回收")
require("界面/窗口层/宝宝进阶")
require("界面/窗口层/弹出/进阶详情")
require("界面/窗口层/人物属性")
require("界面/窗口层/人物加点")
require("界面/窗口层/人物称谓")
require("界面/窗口层/召唤兽属性")
require("界面/窗口层/宝宝进化")
require("界面/窗口层/召唤兽加点")
require("界面/窗口层/召唤兽洗炼")
require("界面/窗口层/神兽增加技能")
require("界面/窗口层/召唤兽合宠")
require("界面/窗口层/召唤兽查看")
require("界面/窗口层/弹出/召唤兽选择")
require("界面/窗口层/对话栏")
require("界面/窗口层/法宝")
require("界面/窗口层/战斗法术")
require("界面/窗口层/战斗自动法术")
require("界面/窗口层/自动法术")
require("界面/窗口层/战斗道具")
require("界面/窗口层/战斗自动")
require("界面/窗口层/战斗召唤")
require("界面/窗口层/战斗召唤详情")
require("界面/窗口层/战斗灵宝")
require("界面/窗口层/弹出/道具详情")
require("界面/窗口层/弹出/指引弹出")
require("界面/窗口层/弹出/锦衣弹出")
require("界面/窗口层/弹出/技能详情")
require("界面/窗口层/弹出/重叠弹出")
require("界面/窗口层/道具行囊")
require("界面/窗口层/弹出/道具选择")
require("界面/窗口层/文本栏")
require("界面/窗口层/宠物")
require("界面/窗口层/商店")
require("界面/窗口层/声望商店")

require("界面/窗口层/给予NPC")
require("界面/窗口层/给予")
require("界面/窗口层/强化给予")
require("界面/窗口层/交易")
require("界面/窗口层/弹出/队伍弹出")
require("界面/窗口层/队伍列表")
require("界面/窗口层/队伍请求列表")
require("界面/窗口层/AI招募")
require("界面/窗口层/阵型选择")
require("界面/窗口层/弹出/招募队员")
require("界面/窗口层/弹出/单个招募")
require("界面/窗口层/小地图")
require("界面/窗口层/世界大地图")
require("界面/窗口层/东胜神洲")
require("界面/窗口层/南瞻部洲")
require("界面/窗口层/北俱芦洲")
require("界面/窗口层/西牛贺州")
require("界面/窗口层/弹出/小地图筛选")
require("界面/窗口层/弹出/小地图寻路")
require("界面/窗口层/飞行符")
require("界面/新增/新春飞行符")
require("界面/新增/召唤兽换造型")
require("界面/新增/上古玉魄镶嵌")
require("界面/新增/奇袭界面")
require("界面/新增/巅峰赛界面")
require("界面/新增/武神坛比武")
require("界面/新增/千变万化")
require("界面/新增/千变万化主界面")
require("界面/新增/巅峰赛赛前备战界面")
require("界面/新增/巅峰赛技能栏")


require("界面/窗口层/合成旗")
require("界面/窗口层/消息管理")
require("界面/窗口层/消息综合")
require("界面/窗口层/弹出/气魔补充")
require("界面/窗口层/任务提示")
require("界面/窗口层/弹出/状态提示")
require("界面/窗口层/技能学习")
require("界面/窗口层/帮派创建")
require("界面/窗口层/帮派加入")
require("界面/窗口层/帮派")
require("界面/窗口层/商城")
require("界面/窗口层/仓库")
require("界面/窗口层/召唤兽仓库")
require("界面/窗口层/门派选择")
require("界面/窗口层/弹出/快捷技能选择")
require("界面/窗口层/弹出/技能选择")
require("界面/窗口层/临时背包")
require("界面/窗口层/弹出/道具鉴定")
require("界面/窗口层/弹出/仓库选择")
require("界面/窗口层/长安保卫战")
require("界面/窗口层/摊位购买")
require("界面/窗口层/摊位出售")
require("界面/窗口层/摊位制造")
require("界面/窗口层/装备开运")
require("界面/窗口层/装备点化")
require("界面/窗口层/商会列表")
require("界面/窗口层/商会物品")
require("界面/窗口层/商会召唤兽")
require("界面/窗口层/拍卖系统管理")
require("界面/窗口层/装备自选")
require("界面/窗口层/灵饰自选")
require("界面/窗口层/坊市交易")
require("界面/窗口层/道具出售")
require("界面/窗口层/系统商会")
require("界面/窗口层/存款")
require("界面/窗口层/伙伴")
require("界面/窗口层/系统设置")
require("界面/窗口层/人物修炼")
require("界面/窗口层/宠物修炼")
require("界面/窗口层/奇经八脉")
require("界面/窗口层/乾元丹学习")
require("界面/窗口层/打造")
require("界面/窗口层/子女查看")
require("界面/窗口层/弹出/提示弹出")
require("界面/窗口层/弹出/自由提示")
require("界面/窗口层/弹出/副本提示")
require("界面/窗口层/人物染色")
require("界面/窗口层/武器染色")
require("界面/窗口层/召唤兽染色")
require("界面/窗口层/坐骑属性")
require("界面/窗口层/坐骑加点")
require("界面/窗口层/输入栏")
require("界面/窗口层/弹出/玩家信息弹出")
require("界面/窗口层/帮派技能栏")
require("界面/窗口层/自由技能栏")
require("界面/窗口层/修炼学习")
require("界面/窗口层/活动指引")
require("界面/窗口层/排行榜")
require("界面/窗口层/世界排行榜")
require("界面/窗口层/比武排行榜")
require("界面/窗口层/弹出/成就弹窗")
require("界面/窗口层/生死劫")
require("界面/窗口层/装备开运")
require("界面/窗口层/符石")
require("界面/弹出/符石道具选择")
require("界面/弹出/镶嵌道具选择")

require("界面/窗口层/弹出/神器道具选择")
require("界面/窗口层/法宝锻造")
require("界面/窗口层/符石合成")
require("界面/窗口层/镇妖铃")
require("界面/窗口层/潜能果")
require("界面/窗口层/宝箱抽奖")
require("界面/窗口层/转盘抽奖")
require("界面/窗口层/嘉年华转盘抽奖")
require("界面/窗口层/仙玉寄售") 

require("界面/窗口层/每日签到")
require("界面/窗口层/自动抓鬼")
require("界面/窗口层/点卡寄售")
require("界面/窗口层/功能给予")
require("界面/窗口层/附魔宝珠")
require("界面/窗口层/弹出/打造选择")
require("界面/窗口层/弹出/子女弹出")
require("界面/窗口层/BOOS挑战")
require("界面/窗口层/翻一番")
require("界面/窗口层/锦衣进阶")
require("界面/窗口层/锦衣焕彩继承")
require("界面/窗口层/锦衣技能继承")

require("界面/窗口层/锦衣洗练介绍")

require("界面/窗口层/发放红包")
require("界面/窗口层/收听红包传音")
require("界面/窗口层/打开红包传音")
-- require("界面/窗口层/剑会天下")
require("界面/新增/剑会天下")
require("界面/新增/归墟")
require("界面/新增/法宝附灵")

require("界面/窗口层/剑会匹配")
require("界面/窗口层/宠物领养栏")
require("界面/窗口层/采矿兑换栏")

require("界面/窗口层/炼药处理")
require("界面/窗口层/附魔")
require("界面/窗口层/好友")
require("界面/窗口层/在线查询")
require("界面/窗口层/弹出/好友弹出")
require("界面/窗口层/好友属性")
require("界面/窗口层/好友消息")
require("界面/窗口层/转换角色")
require("界面/窗口层/传音显示")
require("界面/窗口层/成长礼包")
require("界面/窗口层/藏宝阁/藏宝阁类")
require("界面/窗口层/藏宝阁/藏宝阁上架货币")
require("界面/窗口层/藏宝阁/藏宝阁出售")
require("界面/窗口层/藏宝阁/藏宝阁召唤兽出售")
require("界面/窗口层/藏宝阁/藏宝阁出售寄存")
require("界面/窗口层/藏宝阁/藏宝阁购买寄存")
require("界面/窗口层/藏宝阁/藏宝阁召唤兽出售寄存")
require("界面/窗口层/藏宝阁/藏宝阁召唤兽购买寄存")
require("界面/窗口层/充值系统")
require("界面/窗口层/幻化")
require("界面/窗口层/功能界面")
require("界面/窗口层/神来攻略")

--助战
require("界面/助战窗口/助战列表")
require("界面/助战窗口/助战道具栏")
require("界面/助战窗口/助战详情")
require("界面/助战窗口/助战技能学习")
require("界面/助战窗口/道具助战详情")
require("界面/助战窗口/助战宝宝查看")
require("界面/助战窗口/助战宝宝加点")
require("界面/助战窗口/助战修炼学习")
require("界面/助战窗口/助战加点")
require("界面/助战窗口/助战更多属性弹出")
require("界面/助战窗口/助战创建")

--超级技能
require("界面/窗口层/超级技能/宝宝赐福")
require("界面/窗口层/超级技能/赐福bb格子")
require("界面/窗口层/超级技能/召唤兽做丸子")
require("界面/窗口层/超级技能/召唤兽技能弹出")
require("界面/窗口层/弹出/赐福保存")
--

require("界面/窗口层/合成灵犀玉")
require("界面/窗口层/神器更换五行")
require("界面/窗口层/神器修复")
require("界面/窗口层/唱戏界面")
require("界面/窗口层/唱戏开启")

require("界面/窗口层/法宝选择")
require("界面/窗口层/收购发布")
require("界面/窗口层/收购出售")
require("界面/窗口层/成就系统")
require("界面/窗口层/弹出/通用选择弹出")
require("界面/窗口层/简单_称号系统")
require("界面/窗口层/装备自选")
require("界面/窗口层/简单_本命法宝")
require("界面/窗口层/无双奖池")
require("界面/窗口层/奖池背景")

require("界面/窗口层/装备强化")
require("界面/窗口层/灵饰强化")
require("界面/窗口层/超级传送")
require("界面/窗口层/新副本界面")

require("界面/窗口层/弹出/窗口道具")
require("界面/窗口层/弹出/召唤兽更多弹出")
require("界面/窗口层/弹出/道具弹出更多")
require("界面/窗口层/弹出/摆摊弹出更多")
require("界面/新增/双斧转换类")
require("界面/新增/双斧转换选择")
require("界面/新增/首冲奖励")

require("界面/窗口层/简单_兽魂系统")
require("界面/窗口层/简单_兽魂展示")
require("界面/新增/一键回收")
require("界面/新增/账号仓库一键回收")
require("界面/新增/一键存放过滤")
require("界面/新增/阵法系统")
require("界面/新增/玉魄自选")
require("界面/新增/丸子获超魔诀")
require("界面/新增/修改召唤兽技能")
require("界面/新增/交易中心")

require("界面/新增/会员权益")
require("界面/新增/阵营内容界面")
require("界面/新增/阵营选择")
require("界面/新增/玩法合集")
require("界面/新增/光武拓印")

require("界面/窗口层/自选系统")
require("界面/弹出/经脉详情")
require("界面/新增/镇妖关")
require("界面/新增/御兽术")
