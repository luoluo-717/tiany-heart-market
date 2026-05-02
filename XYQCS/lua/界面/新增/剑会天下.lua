local 剑会天下 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("剑会天下",0,0,630,320)
local 当前 = 多开数据.当前
local dwzy = {"1A23FA12","1A23FA13","1A23FA14","1A23FA15","1A23FA16","1A23FA17","1A23FA18"}
function 剑会天下:初始化()
  local nsf = require("SDL.图像")(632, 325)
  if nsf["渲染开始"](nsf) then
     -- __res:getPNGCC(5, 0, 0, 683, 450):显示(0,5)
    --__res:getPNGCC(5, 0, 581, 328, 175) 单挑
    --__res:getPNGCC(5, 331, 581, 329, 162) 选择模式
     --__res:getPNGCC(5, 663, 581, 203, 81) 排行榜
      --__res:getPNGCC(5, 869, 581, 203, 80) 玩法介绍
    __res["取图像"](__res, "shape/mewas/1A23FA02.was"):显示(0,0)
      -- __res["取图像"](__res, "shape/mewas/1A23FA01.was"):显示(0,0)
  end
  self:置精灵(nsf["到精灵"](nsf))
end

function 剑会天下:打开(内容)
  self:加载数据(内容)
  self:置可见(true)
  self.jiemiankongjian_1:置可见(true)
  self.jiemiankongjian_2:置可见(false)
  self.匹配 = false
end

function 剑会天下:重载()
  self:置可见(true)
  self.jiemiankongjian_1:置可见(false)
  self.jiemiankongjian_2:置可见(true)
  self.匹配 = false
end

function 剑会天下:加载数据(内容)
	self.胜率="100%"
	if 内容 then
	    self.当前积分 = 内容.积分 or 1200
	    -- self.胜率=(string.format("%.2f", 1/1)*100).."%"
	    if 内容.失败==0 then
	    	self.胜率="100%"
	    else
	    	self.胜率=(string.format("%.2f", 内容.胜利/(内容.失败+内容.胜利))*100).."%"
	    end
	end
	if self.当前积分<1100 then
	    self.升级积分=1200
    	self.当前段位=1
    	self.剑会称谓="剑会天下·新秀"
    elseif self.当前积分<1200 then
	    self.升级积分=1300
    	self.当前段位=2
    	self.剑会称谓="剑会天下·新秀"
    elseif self.当前积分<1299 then
    	self.升级积分=1400
    	self.当前段位=3
    	self.剑会称谓="剑会天下·新秀"
    elseif self.当前积分<1399 then
    	self.升级积分=1499
    	self.当前段位=4
    	self.剑会称谓="剑会天下·百战"
	elseif self.当前积分<1499 then
		self.升级积分=1499
		self.当前段位=5
		self.剑会称谓="剑会天下·千胜"
	elseif self.当前积分<1899 then
		self.升级积分=1899
		self.当前段位=6
		self.剑会称谓="剑会天下·万军"
	elseif self.当前积分>=1900 then
		self.升级积分=1900
		self.当前段位=7
		self.剑会称谓="剑会天下·神话"
	-- 	self.剑会称谓="剑会天下·英雄"
	-- 	self.剑会称谓="剑会天下·传说"
	-- else
	-- 	self.剑会称谓="剑会天下·神话"
	end
end


local jiemiankongjian_1 = 剑会天下["创建我的控件"](剑会天下, "jiemiankongjian_1", 5, 5,  600, 300+15)
local 选择模式 = jiemiankongjian_1["创建我的按钮"](jiemiankongjian_1, __res:getPNGCC(5, 331, 581, 329, 162,true), "选择模式", 32, 76)
function 选择模式:左键弹起(x, y, msg)
  剑会天下.jiemiankongjian_1:置可见(false)
  剑会天下.jiemiankongjian_2:置可见(true)
  剑会天下.jiemiankongjian_2:shuaxintux()
end

local 排行榜 = jiemiankongjian_1["创建我的按钮"](jiemiankongjian_1, __res:getPNGCC(5, 663, 581, 203, 81,true), "排行榜", 32+344, 76-15)--##
function 排行榜:左键弹起(x, y, msg)

end

local 玩法介绍 = jiemiankongjian_1["创建我的按钮"](jiemiankongjian_1, __res:getPNGCC(5, 869, 581, 203, 80,true), "玩法介绍", 32+344, 76+89)


local jiemiankongjian_2 = 剑会天下["创建我的控件"](剑会天下, "jiemiankongjian_2", 5, 5,  600, 300+15)
function jiemiankongjian_2:初始化()
  local nsf = require("SDL.图像")(596, 300)
  if nsf["渲染开始"](nsf) then
    __res["取图像"](__res, "shape/mewas/1A23FA10.was"):显示(36-5,108-5)
    __res["取图像"](__res, "shape/mewas/1A23FA06.was"):显示(40-5,40-5)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
end

function jiemiankongjian_2:shuaxintux()
  local nsf = require("SDL.图像")(596, 300)
  if nsf["渲染开始"](nsf) then
    local lssj = 取头像(多开数据[当前 or self and self.当前].角色信息.模型)
    __res["取图像"](__res, __res["取地址"](__res, "shape/mx/", lssj[2])):显示(44-5,44-5)
    字体16["置颜色"](字体16, 139,33,31)
    字体16:取图像(多开数据[当前 or self and self.当前].角色信息.名称):置混合(0):显示(100-5, 45-5)
    字体16:取图像("等级:"..多开数据[当前 or self and self.当前].角色信息.等级):置混合(0):显示(100-5, 75-5)
    -- 字体16:取图像("积分："..多开数据[当前 or self and self.当前].剑会天下.当前积分):置混合(0):显示(290-5, 45-5)
    -- 字体16:取图像("胜率："..多开数据[当前 or self and self.当前].剑会天下.胜率):置混合(0):显示(460-5, 45-5)
    -- 字体16:取图像("当前段位:"..多开数据[当前 or self and self.当前].剑会天下.剑会称谓):置混合(0):显示(65-9, 115-5)
    if 剑会天下.当前积分>=1900 then
      字体16:取图像("剑会积分:"..剑会天下.当前积分):置混合(0):显示(150-61-5, 260-2)
    else
      字体16:取图像("剑会积分:"..剑会天下.当前积分.."/"..剑会天下.升级积分):置混合(0):显示(150-61-5, 260-5)
    end
    __res["取图像"](__res, "shape/mewas/"..dwzy[剑会天下.当前段位]..".was"):显示(90-3, 133-2)
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf["到精灵"](nsf)
end
local 单挑按钮 = jiemiankongjian_2["创建我的按钮"](jiemiankongjian_2, __res:getPNGCC(5, 0, 581, 328, 175,true), "单挑按钮", 260-3, 108-5)
function 单挑按钮:左键弹起(x, y, msg)
  if 多开数据[当前].角色信息.地图数据.编号==2013 then
    -- if __主显["主角"] and (not __主显["主角"]["是否组队"] and not __主显["主角"]["是否队长"]) then
        -- if not self.已发送 and (not 多开数据[self.当前].__主显.主角.是否组队 or 多开数据[self.当前].__主显.主角.是否队长) then
      if 多开数据[当前].__主显.主角  and (not 多开数据[当前].__主显.主角.是否组队 or not 多开数据[self.当前].__主显.主角.是否队长) then

      剑会天下.人数 = 1
      发送数据(当前 or self and self.当前,6580,{人数=1,模式="单挑模式"})
      print(6580)
    else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y该模式禁止组队。')
    end
  else
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y当前地图禁止排位。')
  end
end
local 获取物品按钮 = jiemiankongjian_2["创建我的按钮"](jiemiankongjian_2, __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(117, 33), "获取物品按钮", 290-5, 75-13,"获取物品")
function 获取物品按钮:左键弹起(x, y, msg)
  多开数据[当前].__UI界面.窗口层.对话栏:打开("","活动属性设置","您希望设置哪部分活动属性呢？",{"战斗物品设置","变身效果设置","路过路过"})

end
local 领取称谓 = jiemiankongjian_2["创建我的按钮"](jiemiankongjian_2, __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(117, 33), "领取称谓", 290-5+135, 75-13,"领取称谓")
function 领取称谓:左键弹起(x, y, msg)
  发送数据(当前 or self and self.当前,6583)
end

local 返回按钮 = jiemiankongjian_2:创建我的按钮(__res:getPNGCC(1, 449, 28, 174, 35, true):拉伸(125,28), "返回按钮", 476, 295-10, "返回首页")
function 返回按钮:左键弹起(x, y, msg)
  剑会天下.jiemiankongjian_1:置可见(true)
  剑会天下.jiemiankongjian_2:置可见(false)

end

local rxzy = {"1A23FA19","1A23FA20","1A23FA21","1A23FA22","1A23FA23","1A23FA24","1A23FA25","1A23FA26","1A23FA27","1A23FA28","1A23FA29","1A23FA30","1A23FA31","1A23FA32","1A23FA33","1A23FA34","1A23FA35","1A23FA36"}
local rx = {
	飞燕女 = 1,
	骨精灵 = 2,
	鬼潇潇 = 3,
	狐美人 = 4,
	虎头怪 = 5,
	剑侠客 = 6,
	巨魔王 = 7,
	龙太子 = 8,
	杀破狼 = 9,
	神天兵 = 10,
	巫蛮儿 = 11,
	舞天姬 = 12,
	逍遥生 = 13,
	玄彩娥 = 14,
	偃无师 = 15,
	英女侠 = 16,
	羽灵神 = 17,
	桃夭夭 = 18,
	影精灵 = 2,

}

local 关闭 = 剑会天下["创建我的按钮"](剑会天下, __res:getPNGCC(5, 903, 60, 37, 37), "关闭", 500+89, 0)
function 关闭:左键弹起(x, y, msg)
  剑会天下["置可见"](剑会天下, false)
end