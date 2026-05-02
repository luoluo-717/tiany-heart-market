
local 无双奖池 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("无双奖池",80+67 + abbr.py.x, 20 + abbr.py.y,696, 492)
local 当前=多开数据.当前
多开数据[当前].抽中物品列表 = 多开数据[当前].抽中物品列表 or {}
function 无双奖池:初始化()
  local nsf = require("SDL.图像")(696, 492)
  if nsf["渲染开始"](nsf) then
      置窗口背景("奖池抽奖", 0, 12, 696,480, true):显示(0, 0)
      取白色背景(0, 0, 250, 420, true)["显示"](取白色背景(0, 0, 250, 420, true), 420, 50)
      self.浅蓝=  __res:取图像(__res:取地址('shape/pic/', 0xA9000002))
      self.黄色=  __res:取图像(__res:取地址('shape/pic/', 0xA9000001))
      self.紫色=  __res:取图像(__res:取地址('shape/pic/', 0xA9000003))
      self.动画=  __res:取图像(__res:取地址('shape/pic/', 0xA0000036))

      -- self.动画 = __res:取动画(__res:取地址('shape/pic/', 0xA0000036)):取动画(1):播放(true)
      local 白格子背景=__res:取图像(__res:取地址("shape/ui/", 0x1f73d092))
      local is = 0
      for h=1,5 do
        for l=1,6 do
          is = is + 1
          白格子背景:显示((l-1)* 65 + 23,(h-1) * 85 + 60)
        end
      end

      for h=1,2 do
        for l=1,3 do
          is = is + 1
          白格子背景:显示((l-1)* 80 + 434,(h-1) * 95 + 65)
        end
      end

  end
  self.允许移动 = true
  self:置精灵(nsf["到精灵"](nsf))
end

function 无双奖池:打开(内容)
  self:置可见(true)
  self.剩余次数 = 内容.剩余次数
  self.道具 = 内容.道具
  self.保底道具=内容.幸运币道具
  self.道具网格:置物品(self.道具)
  self.保底道具网格:置物品(self.保底道具)

  self:sdfsdaa()
end

-- function 无双奖池:更新(dt)
--   self.动画:更新(dt)
-- end

function 无双奖池:sdfsdaa()
 self:重置数据()
end

function 无双奖池:重置数据()
  local nsf = require("SDL.图像")(700, 500)
  if nsf["渲染开始"](nsf) then
      字体14["置颜色"](字体14,__取颜色("黑色"))
      local 剩余次数1=1000-self.剩余次数.累计次数
        if 剩余次数1<0 then 剩余次数1=0 end
          字体14:取图像("本轮距离领取保底还差："..剩余次数1.." 次"):显示(435, 365+30)
          -- 字体14:取图像("历史总抽奖次数为："..self.剩余次数.历史次数.." 次"):显示(435, 365+30)
          字体14:取图像("当前剩余可抽奖次数：\n "..self.剩余次数.次数.." 次"):显示(435, 370+40)
          local xx=0
          local yy=0
          local lssj = 取输入背景(0, 0, 30, 20)
          for n = 1, #self.道具 do
              if self.道具[n].是否稀有== 3 then
                  self.紫色:显示(24+xx*65,61+yy*85)
                  self.动画:显示(21+xx*65,56+yy*85)
              elseif self.道具[n].是否稀有== 2 then
                  self.黄色:显示(24+xx*65,61+yy*85)
              else
                  self.浅蓝:显示(24+xx*65,61+yy*85)
              end
              lssj:显示(45+xx*65,115+yy*85)
              字体14:取图像(self.道具[n].剩余数量):显示(48+xx*65,117+yy*85)
              字体15:取图像("剩余"):显示(15+xx*65,118+yy*85)
              xx=xx+1
              if xx > 5 then
                  xx=0
                  yy=yy+1
              end
          end
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf["到精灵"](nsf)
end
function 无双奖池:刷新(数据)
  self.剩余次数 = 数据.剩余次数
  self.道具 = 数据.道具
  self:sdfsdaa()
  if 数据.抽中物品列表 and #数据.抽中物品列表 > 0 then
    多开数据[当前].抽中物品列表 = 数据.抽中物品列表
    多开数据[当前].__UI界面.窗口层.奖池背景:打开()
  end

end

local 道具网格 = 无双奖池["创建网格"](无双奖池, "道具网格", 20, 55, 400, 400)
function 道具网格:左键弹起(x, y, a, b, msg)
  if 无双奖池["材料位置"] and self.子控件[无双奖池["材料位置"]] then
    self.子控件[无双奖池["材料位置"]]._spr["确定"] = nil
  end
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
   self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", a)
  end
end
function 道具网格:置物品(data)
  无双奖池["材料位置"] = nil
  self:创建格子(65, 85, 0, 0,6, 6)
  for i = 1, #self.子控件 do
    if data[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], nil, "无双奖池")
      lssj["置偏移"](lssj, 5, 5)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end



local 保底道具网格 = 无双奖池["创建网格"](无双奖池, "保底道具网格", 430, 62, 245, 200)
function 保底道具网格:左键弹起(x, y, a, b, msg)
  if 无双奖池["材料位置"] and self.子控件[无双奖池["材料位置"]] then
    self.子控件[无双奖池["材料位置"]]._spr["确定"] = nil
  end
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
   self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", a)
  end
end
function 保底道具网格:置物品(data)
  无双奖池["材料位置"] = nil
  self:创建格子(80, 95, 0, 0,3, 3)
  for i = 1, #self.子控件 do
    if data[i] then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, data[i], nil, "无双奖池")
      lssj["置偏移"](lssj, 5, 5)
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
    end
  end
end
for i, v in ipairs {
    {name = '兑换1', x = 431 ,y = 122 ,tcp=__res:getPNGCC(1,449,28,174,35,true):拉伸(60,30) , font = '兑换', 序号 = 1},
    {name = '兑换2', x = 431+80 ,y = 122 ,tcp=__res:getPNGCC(1,449,28,174,35,true):拉伸(60,30) , font = '兑换', 序号 = 2},
    {name = '兑换3', x = 431+80*2 ,y = 122 ,tcp=__res:getPNGCC(1,449,28,174,35,true):拉伸(60,30) , font = '兑换', 序号 = 3},
    {name = '兑换4', x = 431 ,y = 122+95 ,tcp=__res:getPNGCC(1,449,28,174,35,true):拉伸(60,30) , font = '兑换', 序号 = 4},
    {name = '兑换5', x = 431+80 ,y = 122+95 ,tcp=__res:getPNGCC(1,449,28,174,35,true):拉伸(60,30) , font = '兑换', 序号 = 5},
    {name = '兑换6', x = 431+80*2 ,y = 122+95 ,tcp=__res:getPNGCC(1,449,28,174,35,true):拉伸(60,30) , font = '兑换', 序号 = 6},
} do
    local 临时函数 = 无双奖池:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        local 目标道具 = 无双奖池.保底道具 and 无双奖池.保底道具[v.序号]
        if not 目标道具 then
            多开数据[当前].__UI界面.窗口层.文本栏:打开("该道具暂未解锁或已兑换！",285,155,390,200)
            return
        end
        local 技能参数 = "随机"
        if (目标道具.名称 == "超级魔兽要诀" or 目标道具.名称 == "特殊魔兽要诀") and 目标道具.附带技能 then
            技能参数 = 目标道具.附带技能
        end
        local 确认文案 = "是否需要消耗1个幸运币兑换【"..目标道具.名称.."】？"
        local 兑换事件 = function()
            发送数据(当前, 300.4, {兑换 = 目标道具.名称, 参数 = 技能参数})
        end
        多开数据[当前].__UI界面.窗口层.文本栏:打开(确认文案,285,155,390,200,兑换事件)
    end
end


local 开始抽奖 = 无双奖池:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(110, 35), "开始抽奖", 425, 430, "开始抽奖")
function  开始抽奖:左键弹起(x, y)
  发送数据(当前,300.1,{次数=1})

end


local 十连抽奖 = 无双奖池:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(110, 35), "十连抽奖", 555, 430, "十连抽奖")
function  十连抽奖:左键弹起(x, y)
  发送数据(当前,300.2,{次数=10})
end
local 领取幸运币 = 无双奖池:创建我的按钮(__res:getPNGCC(3, 2, 507, 124, 41, true):拉伸(110, 35), "领取幸运币", 555, 320, "领取幸运币")
function 领取幸运币:左键弹起(x, y, msg)
  发送数据(当前,300.3)
end


local 关闭 = 无双奖池["创建我的按钮"](无双奖池, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 355+29-23+290, 0)
function 关闭:左键弹起(x, y, msg)
  无双奖池["置可见"](无双奖池, false)
end