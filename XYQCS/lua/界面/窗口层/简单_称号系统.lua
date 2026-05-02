
local 简单_称号系统 = 多开数据[多开数据.当前].__UI界面["窗口层"]["创建我的窗口"](多开数据[多开数据.当前].__UI界面["窗口层"], "简单_称号系统", 138 + abbr.py.x, 17 + abbr.py.y, 695, 496)
local 当前=多开数据.当前
function 简单_称号系统:初始化()
  local nsf = require("SDL.图像")(695, 500)
  if nsf["渲染开始"](nsf) then
    置窗口背景("称谓修炼", 0, 12, 550, 500, true)["显示"](置窗口背景("称谓修炼", 0, 12, 550, 500, true), 0, 0)
    取白色背景(0, 0, 223, 200, true)["显示"](取白色背景(0, 0, 223, 200, true), 17, 60-15)
    取白色背景(0, 0, 223, 225, true)["显示"](取白色背景(0, 0, 223, 225, true), 17, 270-15)
    取白色背景(0, 0, 277, 225, true)["显示"](取白色背景(0, 0, 277, 225, true), 250, 270-15)
 
   for i = 1 , 4 do 
    __res:getPNGCC(3, 133, 507, 56, 56)["显示"](__res:getPNGCC(3, 133, 507, 56, 56), 200+i*65, 60+320)
   end 
   __res:getPNGCC(3, 133, 507, 56, 56)["显示"](__res:getPNGCC(3, 133, 507, 56, 56), 265+90, 160+115)
  字体18["置颜色"](字体18, __取颜色("白色"))
  __res["取图像"](__res, "shape/dj/ABBCAC12.was"):显示(357, 167+110) 
  __res["取图像"](__res, "shape/dj/ABBCAC17.was"):显示(265+65, 167+115+100) 
  __res["取图像"](__res, "shape/dj/ABBCAC19.was"):显示(265+130, 167+115+100) 
  __res["取图像"](__res, "shape/dj/ABBCAC10.was"):显示(265+195, 167+115+100) 
  __res["取图像"](__res, "shape/dj/ABBCAC14.was"):显示(265, 167+115+100) 
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.模型格子 = __UI模型格子["创建"](当前)
end
local data 
local zhsxz 
local cwzzid
local 称号总类={"人生若只如初见","何事秋风悲画扇","秋水共长天一色","落霞与孤鹜齐飞","天涯何处无芳草",
		"多情却被无情恼","山雨欲来风满楼","相逢何必曾相识","自称臣是酒中仙","心有灵犀一点通"}
local 称号属性={[1]="#R/防御+10#R/速度+10#R/抵抗封印等级+10#R/固定伤害+10#R/治疗能力+5",
    [2]="#R/伤害+25#R/速度+25#R/封印命中等级+25#R/固定伤害+15#R/治疗能力+10",
    [3]="#R/法防+30#R/灵力+30#R/法术暴击等级+30#R/固定伤害+20#R/治疗能力+15",
    [4]="#R/伤害+60#R/法防+60#R/物理暴击等级+60#R/固定伤害+25#R/治疗能力+20",
    [5]="#R/灵力+80#R/防御+80#R/封印命中等级+80#R/固定伤害+30#R/治疗能力+25",
    [6]="#R/物理暴击等级+120#R/气血回复效果+120#R/法术伤害结果+120#R/固定伤害+35#R/治疗能力+30",
    [7]="#R/法术暴击等级+150#R/抗法术暴击等级+150#R/气血+150#R/固定伤害+40#R/治疗能力+35",
    [8]="#R/伤害+180#R/狂暴等级+180#R/躲避+180#R/固定伤害+45#R/治疗能力+40",
    [9]="#R/灵力+220#R/法防+220#R/最大魔法+220#R/固定伤害+50#R/治疗能力+45",
    [10]="#R/速度+300#R/封印命中等级+300#R/气血+500#R/固定伤害+100#R/治疗能力+100"}
function 简单_称号系统:刷新(数据)
  data=数据
  简单_称号系统.技能["重置"](简单_称号系统.技能)
  if 数据.助战id then
    cwzzid = 数据.助战id
  end
end
function 简单_称号系统:打开(数据)
  self:置可见(true)
  if 数据.助战id then
    cwzzid = 数据.助战id
  end
  data=数据
  self.头像网格["置头像"](self.头像网格, 称号总类)
  self.模型格子["清空"](self.模型格子)
  local mxsj={
    模型=数据.模型,
    装备= {},
    锦衣= {},
  }
  self.模型格子:置数据(mxsj, "角色", 120, 175)
  zhsxz=0
end
function 简单_称号系统:更新(dt)
  self.模型格子["更新"](self.模型格子, dt)
end
function 简单_称号系统:显示(x, y)
  self.模型格子["显示"](self.模型格子, x, y)
end
local 头像网格 = 简单_称号系统["创建网格"](简单_称号系统, "头像网格", 30, 12+250, 250, 210)
function 头像网格:初始化()
end
function 头像网格:左键弹起(x, y, a, b, msg)
  zhsxz=a
  简单_称号系统.技能["重置"](简单_称号系统.技能)
  简单_称号系统["技能"]["置可见"](简单_称号系统["技能"],简单_称号系统["技能"]== 简单_称号系统["技能"], not 简单_称号系统["技能"])

  多开数据[多开数据.当前].__UI弹出.提示框:打开(""..称号属性[a])

end
function 头像网格:置头像(数据)
    self:创建格子(250, 57, 3, 0, #数据, 1, true)
    for i = 1, #头像网格["子控件"] do
      local lssj = __称号展示格子["创建"]()
      lssj["置头像"](lssj, 数据[i],i)
      头像网格["子控件"][i]["置精灵"](头像网格["子控件"][i], lssj)
    end
end
local 技能 = 简单_称号系统:创建控件("技能", 0, 60, 600, 375)
function 技能:初始化()
  local nsf = require("SDL.图像")(600, 375)
  if nsf:渲染开始() then
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
end
function 技能:更新(dt)
  if self.cwdh then
    self.cwdh["更新"](self.cwdh, dt)
    self.cwdh1["更新"](self.cwdh1, dt)
    self.cwj["更新"](self.cwj, dt)
    self.cwh["更新"](self.cwh, dt)
    self.cws["更新"](self.cws, dt)
    self.cwt["更新"](self.cwt, dt)
    self.cwl["更新"](self.cwl, dt)
  end
end
function 技能:显示(x, y)
  if self.cwdh then
    self.cwdh["显示"](self.cwdh, x+12+20+85, y+16+120+38)
    self.cwdh1["显示"](self.cwdh1, x+400, y+130)
    self.数据["显示"](self.数据, x, y)
    self.cwj["显示"](self.cwj, x+325, y+40)
    self.cwh["显示"](self.cwh, x+325-15, y+40+60)
    self.cwl["显示"](self.cwl, x+325+60, y+40-45)
    self.cws["显示"](self.cws, x+325+120, y+40)
    self.cwt["显示"](self.cwt, x+325+135, y+40+60)
  end
end
function 技能:重置()
  if zhsxz and zhsxz~=0 then
    local nsf = require("SDL.图像")(600, 375)
    if nsf:渲染开始() then
      字体18:置颜色(20, 255, 130)
      字体18["取图像"](字体18, data["名称"])["显示"](字体18["取图像"](字体18, data["名称"]), 102, 135+20)
      字体18["取图像"](字体18, "当前等级："..data.称号数据.当前等级)["显示"](字体18["取图像"](字体18, "当前等级："..data.称号数据.当前等级), 25, 0)
      __res:getPNGCC(1, 400, 109, 185, 17)["显示"](__res:getPNGCC(1, 400, 109, 185, 17), 300, 155)
      nsf:渲染结束()
    end
    self.数据 = nsf:到精灵()
    local cwmx={
            [1]="10000043",[2]="10000044",[3]="10000045",[4]="10000046",[5]="10000047"
          ,[6]="10000048",[7]="10000049",[8]="10000050",[9]="10000051",[10]="10000052"
     
    }
    self.cwdh = __res["取动画"](__res, "shape/ui/xz/"..cwmx[zhsxz]..".was")["取动画"](__res["取动画"](__res,
    "shape/ui/xz/"..cwmx[zhsxz]..".was"), 1)["播放"](__res["取动画"](__res, "shape/ui/xz/"..cwmx[zhsxz]..".was")["取动画"](__res[
    "取动画"](__res, "shape/ui/xz/"..cwmx[zhsxz]..".was"), 1), true)
    lssj = 取战斗模型(data.模型)
    self.cwdh1=__res["取动画2"](__res, __res["取地址"](__res, "shape/jn/", lssj[7]))["置循环"](__res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", lssj[7])), true)
    local cwmx1={
      [1]="ABBBAC11",[2]="ABBBAC12",[3]="ABBBAC13",[4]="ABBBAC14",[5]="ABBBAC15"
      
    }
    self.cwj= __res["取动画"](__res, "shape/jn/"..cwmx1[1]..".was")["取动画"](__res["取动画"](__res,
    "shape/jn/"..cwmx1[1]..".was"), 1)["播放"](__res["取动画"](__res, "shape/jn/"..cwmx1[1]..".was")["取动画"](__res[
    "取动画"](__res, "shape/jn/"..cwmx1[1]..".was"), 1), true)
    self.cws= __res["取动画"](__res, "shape/jn/"..cwmx1[3]..".was")["取动画"](__res["取动画"](__res,
    "shape/jn/"..cwmx1[3]..".was"), 1)["播放"](__res["取动画"](__res, "shape/jn/"..cwmx1[3]..".was")["取动画"](__res[
    "取动画"](__res, "shape/jn/"..cwmx1[3]..".was"), 1), true)
    self.cwh= __res["取动画"](__res, "shape/jn/"..cwmx1[4]..".was")["取动画"](__res["取动画"](__res,
    "shape/jn/"..cwmx1[4]..".was"), 1)["播放"](__res["取动画"](__res, "shape/jn/"..cwmx1[4]..".was")["取动画"](__res[
    "取动画"](__res, "shape/jn/"..cwmx1[4]..".was"), 1), true)
    self.cwt= __res["取动画"](__res, "shape/jn/"..cwmx1[5]..".was")["取动画"](__res["取动画"](__res,
    "shape/jn/"..cwmx1[5]..".was"), 1)["播放"](__res["取动画"](__res, "shape/jn/"..cwmx1[5]..".was")["取动画"](__res[
    "取动画"](__res, "shape/jn/"..cwmx1[5]..".was"), 1), true)
    self.cwl= __res["取动画"](__res, "shape/jn/"..cwmx1[2]..".was")["取动画"](__res["取动画"](__res,
    "shape/jn/"..cwmx1[2]..".was"), 1)["播放"](__res["取动画"](__res, "shape/jn/"..cwmx1[2]..".was")["取动画"](__res[
    "取动画"](__res, "shape/jn/"..cwmx1[2]..".was"), 1), true)
    简单_称号系统.技能["经验条"]["置位置"](简单_称号系统.技能["经验条"], math.floor(data.称号数据["当前经验"] / data.称号数据["突破经验"] * 100))
    简单_称号系统.技能["经验条"]["置可见"](简单_称号系统.技能["经验条"], true)
  end
end

local 经验条 = 技能["创建进度"](技能, "经验条", 301, 156, 183, 16)
function 经验条:初始化()
self:置精灵(__res:getPNGCC(1, 587, 108, 183, 16)["到精灵"]((__res:getPNGCC(1, 587, 108, 183, 16))))
end
function 经验条:显示(x, y)
字体18:置颜色(__取颜色("浅黑"))
字体18["显示"](字体18, x+80 , y , string.format("%s/%s", data.称号数据["当前经验"], data.称号数据["突破经验"]))
end

local 关闭 = 简单_称号系统["创建我的按钮"](简单_称号系统, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 505, 0)
function 关闭:左键弹起(x, y, msg)
  简单_称号系统["置可见"](简单_称号系统, false)
end




for i, v in ipairs({
    {
      name = "添加1",
      x =240+ 25,
      y = 125+320,
      tcp =  __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(50, 22),
      tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(50, 22),
      font = "添加"
    },
    {
      name = "添加2",
      x =240+ 90,
      y = 125+320,
      tcp =  __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(50, 22),
      tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(50, 22),
      font = "添加"
    },
    {
      name = "添加3",
      x =240+ 155,
      y = 125+320,
      tcp =  __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(50, 22),
      tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(50, 22),
      font = "添加"
    },
    {
      name = "添加4",
      x =240+ 220,
      y = 125+320,
      tcp =  __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(50, 22),
      tcp2 = __res:getPNGCC(3, 390, 12, 118, 43, true):拉伸(50, 22),
      font = "添加"
    },
    {
      name = "修炼",
      x =240+ 30,
      y = 220+115,
      tcp =  __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(85, 22),
      tcp2 = __res:getPNGCC(3, 511, 11, 117, 43, true):拉伸(85, 22),
      font = "修炼"
    },
    {
      name = "佩戴",
      x =150,
      y = 50,
      
      tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(85, 22),
      tcp2 = __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(85, 22),
      font = "佩戴"
    },
    {
      name = "突破",
      x =240+ 170,
      y = 220+115,
      tcp =  __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(85, 22),
      tcp2 = __res:getPNGCC(3, 880, 331, 86, 37, true):拉伸(85, 22),
      font = "突破"
    },
    
  }) do
    local 临时函数 = 简单_称号系统["创建我的按钮"](简单_称号系统, v.tcp, v.name, v.x, v.y, v.font)
   function  临时函数:左键弹起(x, y)
      if v.name == "添加1"  then 
        if zhsxz and zhsxz ~=0 then 
       
              if cwzzid then
                发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=1,助战id=cwzzid})
              else
                发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=1})
              end
      end
      elseif v.name == "添加2"  then 
        if zhsxz and zhsxz ~=0 then 
          if cwzzid then
            发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=2,助战id=cwzzid})
          else
            发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=2})
          end
      end
      elseif v.name == "添加3"  then 
        if zhsxz and zhsxz ~=0 then 
          if cwzzid then
            发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=3,助战id=cwzzid})
          else
            发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=3})
          end
      end
      elseif v.name == "添加4"  then 
        if zhsxz and zhsxz ~=0 then 
          if cwzzid then
            发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=4,助战id=cwzzid})
          else
            发送数据(当前 or 多开数据.当前,194,{序号1=4,选中=4})
          end
        end
      elseif v.name == "修炼"  then 
        if zhsxz and zhsxz ~=0 then 
          if cwzzid then
            发送数据(当前 or 多开数据.当前,194,{序号1=2,选中=zhsxz,助战id=cwzzid})
          else
            发送数据(当前 or 多开数据.当前,194,{序号1=2,选中=zhsxz})
          end
        end
      elseif v.name == "突破"  then 
        if zhsxz and zhsxz ~=0 then 
          if cwzzid then
            发送数据(当前 or 多开数据.当前,194,{序号1=3,选中=zhsxz,助战id=cwzzid})
          else
            发送数据(当前 or 多开数据.当前,194,{序号1=3,选中=zhsxz})
          end
        end
      elseif v.name == "佩戴"  then 
        if zhsxz and zhsxz ~=0 then 
          if cwzzid then
            发送数据(当前 or 多开数据.当前,194,{序号1=5,选中=zhsxz,助战id=cwzzid})
          else
            发送数据(当前 or 多开数据.当前,194,{序号1=5,选中=zhsxz})
          end
        end
      end 
    end
  end