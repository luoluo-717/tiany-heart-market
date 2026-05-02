
多开数据[多开数据.当前].__UI弹出.赐福保存 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口( "赐福保存", 0, 0, 370, 350)
local 赐福保存 = 多开数据[多开数据.当前].__UI弹出.赐福保存
local 当前 = 多开数据.当前
function 赐福保存:初始化()
  local nsf = require("SDL.图像")(370, 350)
  if nsf:渲染开始() then
    取黑透明背景(0, 0, 370, 350, true):显示(0, 0)
    字体18:置颜色(255, 255, 255)
    字体18:取图像("确定要保存本次赐福效果吗？"):显示(12, 12)
    取白色背景(0, 0, 340, 237, true):显示(12, 45)
  
    字体18:置颜色(0, 0, 0)
    字体18:取图像("原赐福效果"):显示(135, 65)
   
    字体18:置颜色(0, 0, 0)
    字体18:取图像("本次赐福效果"):显示(125, 170)
    nsf:渲染结束()
  end
  self.认证码=nil
  self:置精灵(nsf:到精灵())
end
function 赐福保存:打开(数据)
    self.数据=数据
    self:置可见(true)
    self:置坐标((引擎.宽度 - 380)/2, 引擎.高度 - 450)

    赐福保存.原技能网格:置数据(多开数据[当前 or self and self.当前].角色信息.宝宝列表[数据.bb].丸子技能)
    local 赐福技能={}
    for i=1,#数据.技能 do
        赐福技能[i]={}
        赐福技能[i].名称=数据.技能[i]
        赐福技能[i].生效=false
    end
    for i = 1, #多开数据[当前 or self and self.当前].角色信息.宝宝列表[数据.bb].技能 do
        for j=1,#赐福技能 do
           if 多开数据[当前 or self and self.当前].角色信息.宝宝列表[数据.bb].技能[i] == 赐福技能[j].名称 then
            赐福技能[j].生效=true
           end
        end
    end
  赐福保存.现技能网格:置数据(赐福技能)
end
local 取消 = 赐福保存:创建我的按钮(__res:getPNGCC(3, 126, 563, 111, 36, true), "取消", 15, 300, "取消")
function 取消:左键弹起(x, y, msg)
  赐福保存:置可见(false)
end
local 保存 = 赐福保存:创建我的按钮(__res:getPNGCC(3, 126, 563, 111, 36, true), "保存", 228, 300, "保存")
function 保存:左键弹起(x, y, msg)
  发送数据(当前 or self and self.当前,3903,{bb=赐福保存.数据.bb,认证码=赐福保存.数据.认证码,技能=赐福保存.数据.技能,锁定=赐福保存.数据.锁定技能})
  赐福保存:置可见(false)
end

local 原技能网格 = 赐福保存:创建网格("原技能网格", 30, 90, 300, 250)
function 原技能网格:初始化()
  self:创建格子(75, 70, 5, 5, 1, 4, true)
end

function 原技能网格:置数据(数据)
  for i = 1, #原技能网格.子控件 do
    local lssj = __召唤兽技能格子.创建(当前)
    if 数据 ~=nil and 数据[i] ~=nil then
      lssj:置数据(数据[i].名称, 55, 55, nil, false,not 数据[i].生效)
    else
      lssj:置数据(nil, 55, 55, nil, false,false)
    end
    原技能网格.子控件[i]:置精灵(lssj)
  end
end


local 现技能网格 = 赐福保存:创建网格("现技能网格", 30, 195, 300, 250)
function 现技能网格:初始化()
  self:创建格子(75, 70, 5, 5, 1, 4, true)
end

function 现技能网格:置数据(数据)
  for i = 1, #现技能网格.子控件 do
    local lssj = __召唤兽技能格子.创建(当前)
    if 数据 ~=nil and 数据[i] ~=nil then
      lssj:置数据(数据[i].名称, 55, 55, nil, false,数据)
    else
      lssj:置数据(nil, 55, 55, nil, false,nil)
    end
    现技能网格.子控件[i]:置精灵(lssj)
  end
end
  