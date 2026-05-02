--[[
Author: GGELUA
Date: 2023-11-08 21:33:34
Last Modified by: GGELUA
Last Modified time: 2023-11-09 11:14:59
--]]
--[[
Author: GGELUA
Date: 2023-07-05 16:55:33
Last Modified by: GGELUA
Last Modified time: 2023-08-10 22:32:07
--]]
local 基类 = require("界面/控件层/基类/物品基类")
local 物品格子 = class("物品格子", 基类)
function 物品格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.当前=当前
  self.物品禁止 = false
  -----------------------------------C改
  self.物品遮罩 =__res:getPNGCC(3, 132, 506, 55, 55) 
  self.物品遮罩1 =__res:getPNGCC(3, 132, 506, 55, 55):拉伸(53, 53)
  -----------------------------------C改

end

function 物品格子:置物品(数据, 背景, 类型,mc,类型2)
  self.物品 = nil
  self.确定 = nil
  self.物品禁止 = false
  if 数据 and 0 ~= 数据.名称 then
    self:取数据(数据)
    for n, v in pairs(数据) do
      self.物品[n]=v
    end
    local 返回值 = 取同名物品(self.物品.名称, self.物品.子类, self.物品.类型, self.物品.等级)
    if not 判断是否为空表(返回值) then
      self.物品.资源 = 返回值[5] or 返回值[1]
      self.物品.小模型资源 = 返回值[2]
      
      if 返回值[5] then
        self.物品.url = 返回值[1]
        self.物品.小模型资源 = 返回值[4]
      end
      self.物品.大模型资源 = 返回值[3]
      if 返回值[6] then
        self.物品.pyz = 返回值[6] --动态
      end
    end
    
    local nsf = require("SDL.图像")(240, 55)
    if nsf:渲染开始() then
      if "白格子" == 背景 then
        __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
      elseif "黄格子" == 背景 then
        __res:取图片("shape/pic/huanggezi.png"):显示(0, 0)
      end
      if 类型2=="白格子" then
        __res:getPNGCC(3, 132, 506, 55, 55):显示(0, 0)
      end
      

      if 类型=="装备" then
        self.物品遮罩:显示(0,1)
      elseif 类型=="助战装备" then
        self.物品遮罩1:显示(0,1)
      end
      if self.物品.名称=="上古玉魄·阴" and 类型=="上古玉魄" then
          __res:取图像(__res:取地址("shape/dj/", 0x10000104)):显示(0, 0)
      elseif self.物品.名称=="上古玉魄·阳" and 类型=="上古玉魄"  then
          __res:取图像(__res:取地址("shape/dj/", 0x10000103)):显示(0, 7)
      else 
          __res:取图像(__res:取地址("shape/dj/", self.物品.小模型资源)):显示(0, 0)
      end
      if self.物品.数量 and 类型~="无需显示数量" then
        字体182:置颜色(__取颜色("白色"))
        if self.物品 and type(self.物品.数量) == "number" and self.物品.数量 > 1 then
          字体182:取图像(self.物品.数量):显示(0, -4)
        end
      end
      if self.物品.名称 == "魔兽要诀" or self.物品.名称 == "超级魔兽要诀" or self.物品.名称 == "高级魔兽要诀" or self.物品.名称 == "特殊魔兽要诀" then
        if self.物品.附带技能~= nil then
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.附带技能):显示(0, 37)
        end
      elseif self.物品.名称 == "鬼谷子" then
        if self.物品.子类~= nil then
          物品格子字体:置颜色(__取颜色("黄色"))
          多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.子类):显示(6, 37)
        end
      elseif self.物品.名称=="海妖的贡品" or  self.物品.名称=="海妖精气"  or  self.物品.名称=="海妖灵兵"    or  self.物品.名称=="海妖王的灵元"    or  self.物品.名称=="海妖精魄"  or  self.物品.名称=="阵营-百合花"   or  self.物品.名称=="阵营-玫瑰花"   or  self.物品.名称=="阵营-牡丹花"   or  self.物品.名称=="阵营-桃运花"  or  self.物品.名称=="阵营-紫兰花"  or  self.物品.名称=="海妖王的灵气" or  self.物品.名称=="双龙之战礼包"  or  self.物品.名称=="朋友的礼盒" or  self.物品.名称=="远古恶蛟的灵魄"    then
          物品格子字体:置颜色(__取颜色("黄色"))
          多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像("双龙之战"):显示(0, 37)
      elseif self.物品.名称 == "九眼天珠" or self.物品.名称 == "三眼天珠" or self.物品.名称 == "天眼珠" then
        if self.物品.等级~= nil then
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.等级.."/"..self.物品.灵气):显示(6, 37)
        end
      elseif self.物品.名称 == "玄灵珠·破军" then
        if self.物品.等级~= nil then
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.等级):显示(0, 37)
        物品格子字体:取图像("级破军"):显示(8, 37)
        end
      elseif self.物品.名称 == "玄灵珠·回春" then
        if self.物品.等级~= nil then
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.等级):显示(0, 37)
        物品格子字体:取图像("级回春"):显示(8, 37)
        end
      elseif self.物品.名称 == "玄灵珠·噬魂" then
        if self.物品.等级~= nil then
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.等级):显示(0, 37)
        物品格子字体:取图像("级噬魂"):显示(8, 37)
        end
      elseif self.物品.名称 == "玄灵珠·空灵" then
        if self.物品.等级~= nil then
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.等级):显示(0, 37)
        物品格子字体:取图像("级空灵"):显示(8, 37)
        end
      elseif self.物品.名称 == "特殊兽决·碎片" or self.物品.名称 == "观照万象碎片"  or self.物品.名称 == "特效宝珠碎片" or self.物品.名称 == "装备属性石碎片" or self.物品.名称 == "数值洗练石碎片"
       or self.物品.名称 == "属性洗练石碎片" or self.物品.名称 == "灵饰洗练石碎片" or self.物品.名称 == "灵饰属性石碎片" or self.物品.名称 == "装备词条石碎片" or self.物品.名称 == "词条洗练石碎片"
       or self.物品.名称 == "词条属性石碎片"or self.物品.名称 == "超级技能·碎片" then
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像("碎片"):显示(12, 37)
      elseif self.物品.名称 == "制造指南书" then
        if self.物品.特效~= nil then
        local it = 多开数据[self.当前].__主控:取武器子类(self.物品.特效)
        物品格子字体:置颜色(__取颜色("黄色"))
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        -- 物品格子字体:取图像(it):显示(12, 37)
        if self.物品.子类>=100 then
        物品格子字体:取图像(self.物品.子类.." "..it):显示(-1, 37)
        else
        物品格子字体:取图像(self.物品.子类.." "..it):显示(5, 37)
        end
        end
      elseif self.物品.名称 == "百炼精铁" then
        if self.物品.子类~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.子类):显示(12, 37)
        end
      elseif self.物品.名称 == "召唤兽内丹"  then
      if self.物品.特效~=nil then 
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.特效):显示(12, 37)
      end
      elseif self.物品.名称 == "高级召唤兽内丹"  then
      if self.物品.特效~=nil then 
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        物品格子字体:取图像(self.物品.特效):显示(4, 37)
      end
      elseif self.物品.名称 == "钟灵石"  then
      if self.物品.特性~=nil then 
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        if self.物品.特性=="163" or  self.物品.特性=="心源" then
          物品格子字体:取图像(self.物品.特性):显示(12, 37)
         else
          物品格子字体:取图像(self.物品.特性):显示(-4, 37)
        end
      end
      elseif self.物品.名称=="九转金丹"  then
        if self.物品.阶品~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.阶品.."品"):显示(5, 37)
        end
      elseif self.物品.名称=="上古锻造图策"  then
        if self.物品.等级~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.等级):显示(14, 20)
          物品格子字体:取图像(self.物品.种类):显示(12, 37)
        end
      elseif self.物品.名称=="炼妖石"  then
        if self.物品.等级~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        if self.物品.等级<105 then
          物品格子字体:取图像(self.物品.等级):显示(16, 37)
        else
          物品格子字体:取图像(self.物品.等级):显示(12, 37)
        end
        end
      elseif  self.物品.名称=="钨金" or self.物品.名称=="珍珠"  or self.物品.名称=="附魔宝珠" then
        if self.物品.等级~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.等级):显示(12, 37)
        end
      elseif self.物品.名称=="未激活的符石" then
        if self.物品.颜色~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.颜色):显示(12, 37)
        end


      elseif self.物品.名称=="未激活的星石" then
        if self.物品.子类~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(取星石部位(self.物品.子类)):显示(12, 37)
        end


      elseif self.物品.名称=="红色合成旗" then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像("长安城"):显示(3, 37)
      elseif self.物品.名称=="黄色合成旗" then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像("傲来国"):显示(3, 37)
      elseif self.物品.名称=="蓝色合成旗" then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像("长寿村"):显示(3, 37)
      elseif self.物品.名称=="绿色合成旗" then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像("大唐境外"):显示(0, 37)
      elseif self.物品.名称=="白色合成旗" then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像("建邺城"):显示(3, 37)
      elseif self.物品.名称=="星辉石" or self.物品.名称=="黑宝石"  or self.物品.名称=="红玛瑙"  or self.物品.名称=="太阳石"  or self.物品.名称=="月亮石"  or self.物品.名称=="光芒石"  or self.物品.名称=="舍利子" then
        if self.物品.等级~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        if self.物品.等级>=10 then
          物品格子字体:取图像(self.物品.等级.."级"):显示(8, 37)
        else
          物品格子字体:取图像(self.物品.等级.."级"):显示(13, 37)
        end
        end
      elseif self.物品.名称=="灵犀玉" then
        if self.物品.特性~=nil then
          多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.特性):显示(10, 37)
        end
      elseif self.物品.名称=="精魄灵石" then
        if self.物品.等级~=nil then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.等级.."级"..self.物品.特效):显示(-1, 37)
        end
      elseif self.物品.名称=="本命法宝门派秘籍" then
        if self.物品.门派~=nil then
         多开数据[self.当前].__主控.物品灰图:显示(-15,37)
          物品格子字体:取图像(self.物品.门派):显示(3, 37)
        end

      elseif self.物品.名称=="强化符"  then
        多开数据[self.当前].__主控.物品灰图:显示(-15,37)
        if self.物品.技能== "嗜血" then
          物品格子字体:取图像("体力符"):显示(5, 37)
        end
        if self.物品.技能== "轻如鸿毛" then
          物品格子字体:取图像("魔法符"):显示(5, 37)
        end
        if self.物品.技能== "拈花妙指" then
          物品格子字体:取图像("速度符"):显示(5, 37)
        end
        if self.物品.技能== "一气化三清" then
          物品格子字体:取图像("魔力符"):显示(5, 37)
        end
        if self.物品.技能== "龙附" then
          物品格子字体:取图像("伤害符"):显示(5, 37)
        end
        if self.物品.技能== "盘丝舞" then
          物品格子字体:取图像("防御符"):显示(5, 37)
        end
        if self.物品.技能== "魔王护持" then
          物品格子字体:取图像("气血符"):显示(5, 37)
        end
        if self.物品.技能== "浩然正气" then
          物品格子字体:取图像("法防符"):显示(5, 37)
        end
        if self.物品.技能== "莲华妙法" then
          物品格子字体:取图像("法伤符"):显示(5, 37)
        end
        if self.物品.技能== "神力无穷" then
          物品格子字体:取图像("愤怒符"):显示(5, 37)
        end
        if self.物品.技能== "尸气漫天" then
          物品格子字体:取图像("耐力符"):显示(5, 37)
        end
        if self.物品.技能== "担山赶月" then
          物品格子字体:取图像("力量符"):显示(5, 37)
        end
        if self.物品.技能== "神木呓语" then
          物品格子字体:取图像("法伤结果"):显示(0, 37)
        end
        if self.物品.技能== "元阳护体" then
          物品格子字体:取图像("气血回复"):显示(0, 37)
        end
        if self.物品.技能== "穿云破空" then
          物品格子字体:取图像("伤害结果"):显示(0, 37)
        end
        if self.物品.技能== "神兵护法" then
          物品格子字体:取图像("命中符"):显示(5, 37)
        end
      end
      if mc then
        字体16:置颜色(0,0,0)
        if 数据.重点 then
          if  类型 == "已收购网格" then
            字体16:取图像(数据.重点):显示(56, 0)
            字体16:取图像(数据.名称):显示(56, 20)
            字体16:取图像(数据.单价):显示(156, 20)
          else
            字体16:取图像(数据.名称.."("..数据.重点..")"):显示(56, 20)
          end
        else
          字体16:取图像(数据.名称):显示(56, 20)
        end
      end
      nsf:渲染结束()
    end
    self.小模型 = nsf:到精灵()
  elseif "白格子" == 背景 then
    self.小模型 = __res:getPNGCC(3, 132, 506, 55, 55):到精灵()
  end
  self.格子类型 = 类型
end

function 物品格子:详情打开(x, y, w, h, lx, bh)
  local Button, Button2, Button3, Button4
  if "灵饰" == lx then
    Button = "卸下"
  elseif "装备" == lx then
    Button = "卸下"
  elseif "饰品" == lx then
    Button = "卸下"
  elseif "宝宝饰品" == lx then
    Button = "卸下"
  elseif "锦衣" == lx then
    Button = "卸下"
    -- Button2= "升级"---C改
  elseif "上古玉魄" == lx then
    Button = "卸下"
  elseif "卸下女娲符" == lx then
    Button = "卸下"

  elseif "宝宝进阶1" == lx then
    Button = "使用"
  elseif "宝宝进阶2" == lx then
    Button = "取下"
  elseif "锦衣背包" == lx then
    Button = "穿戴"
    Button2 = "移动"

  elseif "道具" == lx then
    if self.物品.总类 == "上古玉魄" then
      Button = "使用"
      Button2 = "移动"
      Button3 = "丢弃"
      Button4 = "镶嵌"
    elseif 2 ~= self.物品.总类 and ((self.物品.分类 and self.物品.分类 <= 12) or self.物品.总类 == 147 or 106 == self.物品.总类) then
      Button = "使用"
      Button2 = "丢弃"
      Button3 = "移动"
      -- Button4 = "丢弃"
    elseif 2 == self.物品.总类 and self.物品.分类 <= 6 then
      Button = "使用"
      Button2 = "丢弃"
      Button3 = "移动"
      Button4 = "符石"
    elseif 2 == self.物品.总类 and self.物品.分类 > 6 then
      Button = "使用"
      Button2 = "丢弃"
      Button3 = "移动"
      -- Button4 = "丢弃"
    else
      Button = "使用"
      Button2 = "丢弃"
      Button3 = "移动"
      -- Button4 = "丢弃"
    end
  elseif "选择" == lx then
  elseif "法宝" == lx then
    Button = "移动"
  elseif "装备法宝" == lx then
    Button = "卸下"
  elseif "装备灵宝" == lx then
    Button = "卸下"
  end
  if "宝宝进阶1" == lx or "宝宝进阶2" == lx then 
    多开数据[当前 or self and self.当前].__UI弹出.bb进阶详情:置可见( true, true)
    多开数据[当前 or self and self.当前].__UI弹出.bb进阶详情.道具文本:清空() 
    if self.物品.名称=="高级清灵仙露" or self.物品.名称=="中级清灵仙露" or self.物品.名称=="初级清灵仙露" then
       多开数据[当前 or self and self.当前].__UI弹出.bb进阶详情:打开(self.物品, x, y, 360, 360, Button, Button2, Button3, Button4, bh, lx)
    else
       多开数据[当前 or self and self.当前].__UI弹出.bb进阶详情:打开(self.物品, x, y, 360, 360, nil, nil, nil, nil, bh, lx)
    end
    return
  end
  多开数据[当前 or self and self.当前].__UI弹出.道具详情:置可见(true, true)
  多开数据[当前 or self and self.当前].__UI弹出.道具详情.道具文本:清空()
  多开数据[当前 or self and self.当前].__UI弹出.道具详情:打开(self.物品, x, y, 360, 360, Button, Button2, Button3, Button4, bh, lx)
end

function 物品格子:置偏移(x, y)
  self.py = {x = x, y = x}
end

function 物品格子:显示(x, y)
  if self.小模型 then
    self.小模型["显示"](self.小模型, x + self.py.x, y + self.py.y)
end
  if self.确定 and (self.格子类型 == "道具行囊"  or self.格子类型 == "锦衣背包" or self.格子类型 == "道具仓库" or self.格子类型 == "翻一番" or self.格子类型 == "商会道具"  or self.格子类型 == "道具选择" or self.格子类型 == "临时背包" or self.格子类型 == "奖励网格") then
    多开数据[self.当前].__主控.道具选中大:显示(x, y)
  elseif self.确定 and (self.格子类型 == "战斗道具"  or self.格子类型 == "收购道具" or self.格子类型 == "账号仓库" or self.格子类型 == "一键存放过滤" or self.格子类型 == "已收购网格") then
    多开数据[self.当前].__主控.道具选中小:显示(x, y)
  end
  if self.物品禁止 then
    多开数据[self.当前].__主控.物品格子禁止:显示(x + 8, y + 8)
  end
end

return 物品格子
