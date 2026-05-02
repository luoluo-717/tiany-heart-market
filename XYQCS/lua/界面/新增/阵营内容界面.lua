


-- local 阵营内容界面 = 多开数据[多开数据.当前].__UI界面["窗口层"]["创建我的窗口"](多开数据[多开数据.当前].__UI界面["窗口层"], "阵营内容界面", 170 + abbr.py.x,abbr.py.y, 695, 800)
local 阵营内容界面 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("阵营内容界面", 170 + abbr.py.x,abbr.py.y, 695, 800)

local 当前 =  多开数据.当前

function 阵营内容界面:初始化()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    nsf:填充颜色(0, 0, 0, 1)
    nsf["渲染结束"](nsf)
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.允许移动=true
end

local data 
local 助战选中=0 
local NPC页面=1 
function 阵营内容界面:打开(数据)
    data = 数据  -- 挂载到实例上，方便后续访问
    self.商品 = data.商品  -- 赋值商品数据
    self.签到道具=data.签到奖励
    local 页面名称 = "页面"..data.页面
    self.种类 = 页面名称
    self:置可见(true)
    local 页面类型 = {"页面1","页面2","页面3","页面4","页面5","页面6","页面7","页面8","页面9","页面10"}
    for k, v in pairs(页面类型) do 
        local 目标页面 = 阵营内容界面[v]
        if v == 页面名称 then 
            目标页面:置可见(true)
            目标页面:重置()  -- 重置当前页面（确保控件已初始化）
            -- 3. 仅当前页面是页面6时，才给道具网格置物品
            if v == "页面6" and 目标页面.道具网格 and 目标页面.签到道具网格 and  目标页面.今天签到网格 then
                local 已签到次数 = data.角色数据.历史贡献与签到.次数 or 0  -- 玩家已签到次数
                local 当前可领索引 = 已签到次数 + 1  -- 当前可领物品索引
                local 当前可领物品 = self.签到道具[当前可领索引] or {}  -- 当前可领物品
                目标页面.道具网格:置物品(self.商品)
                目标页面.签到道具网格:置物品(self.签到道具)
                目标页面.今天签到网格:置物品(当前可领物品)

            end
        else 
            目标页面:置可见(false)
        end
    end 
end

function 阵营内容界面:显示(x, y)
  if self.数据 then 
  self.数据["显示"](self.数据, x, y)
  end
end

function 阵营内容界面:刷新(数据)
  if 数据.页面==4.5 then
    data.助战数据=数据
    local 页面= "页面10"
    self.种类=页面
    for k ,v in pairs(仓库种类) do 
      if v==页面 then 
         阵营内容界面[页面]["置可见"](阵营内容界面[页面],阵营内容界面[页面]== 阵营内容界面[页面], not 阵营内容界面[页面])
      else 
          阵营内容界面[v]["置可见"](阵营内容界面[v],阵营内容界面[v], false)
      end
    end 
    阵营内容界面[页面]["重置"](阵营内容界面[页面])
  else 
    data=数据
    阵营内容界面[阵营内容界面.种类]["重置"](阵营内容界面[阵营内容界面.种类])
  end
end
local 页面1 = 阵营内容界面["创建控件"](阵营内容界面, "页面1", 0, 0, 850, 520)
function 页面1:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面1:重置()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)
    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
    end
    local 每日任务={"每日签到","捐献经验:5000W","捐献银子:5000W","击杀20个斥候海妖","献上贡品:20个","挑战海妖大王"}
    local 阵营任务={"达成1000贡献值","达成2000贡献值","达成3000贡献值","达成5000贡献值","达成8000贡献值","达成10000贡献值"}
    
    for i = 1,6 do 
      if data.角色数据.阵营=="覆海帮" then
        require("SDL.图像")("assets/shape/slzz/hb.png"):显示(5, 15+i*50)
        require("SDL.图像")("assets/shape/slzz/hb.png"):显示(325, 15+i*50)
      else
        require("SDL.图像")("assets/shape/slzz/lb.png"):显示(5, 15+i*50)
        require("SDL.图像")("assets/shape/slzz/lb.png"):显示(325, 15+i*50)
      end
      if data.角色数据.每日任务[i] ~=nil and  data.角色数据.每日任务[i] ==true then
        require("SDL.图像")("assets/shape/slzz/wctp.png"):显示(140, 20+i*50)
       else
        require("SDL.图像")("assets/shape/slzz/gthtp.png"):显示(140, 20+i*50)
       end
       if data.角色数据.历史任务[i] ~=nil and  data.角色数据.历史任务[i] ==true then
        require("SDL.图像")("assets/shape/slzz/wctp.png"):显示(140+320, 20+i*50)
       else
        require("SDL.图像")("assets/shape/slzz/gthtp.png"):显示(140+320, 20+i*50)
       end
    end 
    local xx=0 
    local yy = 0
    for i = 1,6 do 
      字体16["置颜色"](字体16, __取颜色("黑色"))
      字体16["取图像"](字体16, 每日任务[i])["显示"](字体16["取图像"](字体16, 每日任务[i]), 60+(xx*95), 85+yy*50)
      字体16["取图像"](字体16, 阵营任务[i])["显示"](字体16["取图像"](字体16, 阵营任务[i]), 380+(xx*95), 85+yy*50)
        yy=yy+1
        if yy==6 then
          xx=xx+1
          yy=0
        end
    end
    字体18:置颜色(__取颜色('白色'))
		字体18:取图像("【当前贡献值】\n        "..data.角色数据.贡献值):显示(223, 50)
		字体18:取图像("【每日任务】\n每个100贡献值"):显示(223, 100)

      nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面1:显示(x,y)
    if self.图像 then 
    self.图像["显示"](self.图像, x, y)
    end
end
local xx=0 
local yy = 0
for i = 1, 12 do 
    local 临时函数 = 页面1["创建我的多选按钮"](页面1, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25), i .. "双龙任务按钮", 190+xx*320, 90+yy*50,"完成")
    function  临时函数:左键弹起(x, y)
      if i<7 then 
        发送数据(当前,219,{序号1=2,选中=i})
      else 
        发送数据(当前,219,{序号1=3,选中=i-6})
      end 
    end
    yy=yy+1
    if yy==6 then
      xx=xx+1
      yy=0
   end
end
local 关闭 = 页面1["创建我的按钮"](页面1, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end




local 页面2 = 阵营内容界面["创建控件"](阵营内容界面, "页面2", 0, 0, 850, 520)
function 页面2:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面2:重置()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)
    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
    end
    local dz={0x0741d4a2,0x0DD3305F,0x19545A75,0x51105074,0xb09d20f5,0xFFF1B4CE,0x07870048,0xF26A689A,0x206394EF,0x3944ABFA}

    for i = 1,5 do 
      if data.角色数据.阵营=="覆海帮" then
        require("SDL.图像")("assets/shape/slzz/hb.png"):显示(10+5, 15+i*70-30)
        require("SDL.图像")("assets/shape/slzz/hb.png"):显示(10+325, 15+i*70-30)
      else
        require("SDL.图像")("assets/shape/slzz/lb.png"):显示(10+5, 15+i*70-30)
        require("SDL.图像")("assets/shape/slzz/lb.png"):显示(10+325, 15+i*70-30)
      end
        require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(10+5, 20+i*70-30)
        require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(10+325, 20+i*70-30)
        -- __res["取图像"](__res, "shape/dj/"..dz[i]..".was"):显示(10+10, 25+i*70-30) 
        -- __res["取图像"](__res, "shape/dj/"..dz[i+5]..".was"):显示(10+330, 25+i*70-30) 
        __res["取图像"](__res, __res["取地址"](__res, "shape/dj/", dz[i+5])):显示(10+330, 25+i*70-30)
    end 
    __res["取图像"](__res, __res["取地址"](__res, "shape/dj/", 0xADE9E51F)):显示(10+10,65)
    __res["取图像"](__res, __res["取地址"](__res, "shape/dj/", 0x75C819F9)):显示(10+10,65+70)
    __res["取图像"](__res, __res["取地址"](__res, "shape/dj/", 0x57FBB583)):显示(10+10,65+70*2)
    __res["取图像"](__res, __res["取地址"](__res, "shape/dj/", 0x51105074)):显示(10+10,65+70*3)
    __res["取图像"](__res, __res["取地址"](__res, "shape/dj/", 0x8E128374)):显示(10+10,65+70*4)


    local 物品1={"海妖的贡品","海妖精气","海妖精魄","海妖灵兵","海妖王的灵元"}
    local 物品2={"牡丹花","桃运花","紫兰花","百合花","玫瑰花"}
    local 介绍1={"增加3点贡献度","增加10点贡献度","增加20点贡献度","增加50点贡献度","增加100点贡献度"}
    local 介绍2={"增加1点好感","增加3点好感","增加5点好感","增加7点好感","增加10点好感"}
    local xx=0 
    local yy = 0
    for i = 1,5 do 
      字体14["置颜色"](字体14, __取颜色("白色"))
      字体14["取图像"](字体14, 物品1[i])["显示"](字体14["取图像"](字体14, 物品1[i]), 80, 30+i*70-30)
      字体14["取图像"](字体14, 物品2[i])["显示"](字体14["取图像"](字体14, 物品2[i]), 400, 30+i*70-30)
      字体14["取图像"](字体14, 介绍1[i])["显示"](字体14["取图像"](字体14, 介绍1[i]), 80, 50+i*70-30)
      字体14["取图像"](字体14, 介绍2[i])["显示"](字体14["取图像"](字体14, 介绍2[i]), 400, 50+i*70-30)
 
      字体14["取图像"](字体14, "拥有"..data.角色数据.活动物品.物品[i].."个,阵营库存:"..data.系统数据[data.角色数据.阵营].阵营物品[i].."个")["显示"](字体14["取图像"](字体14, "拥有"..data.角色数据.活动物品.物品[i].."个,阵营库存:"..data.系统数据[data.角色数据.阵营].阵营物品[i].."个"), 190, 50+i*70-30)
      字体14["取图像"](字体14, "拥有:"..data.角色数据.活动物品.礼物[i])["显示"](字体14["取图像"](字体14, "拥有:"..data.角色数据.活动物品.礼物[i]), 510, 50+i*70-30)
    
    end
      nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面2:显示(x,y)
    if self.图像 then 
    self.图像["显示"](self.图像, x, y)
    end
end

for i = 1, 5 do 
    local 临时函数 = 页面2["创建我的多选按钮"](页面2, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25), i .. "双龙任务上交", 175, 60+i*70-70,"上交")
    function  临时函数:左键弹起(x, y)
      发送数据(当前,219,{序号1=5,选中=i})
    end
end
for i = 1, 5 do 
    local 临时函数 = 页面2["创建我的多选按钮"](页面2, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25), i .. "双龙任务出售", 175+50, 60+i*70-70,"出售")
    function  临时函数:左键弹起(x, y)
      发送数据(当前,219,{序号1=6,选中=i})
    end
end
for i = 1, 5 do 
    local 临时函数 = 页面2["创建我的多选按钮"](页面2, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 44, 25), i .. "双龙任务购买", 175+100, 60+i*70-70,"购买")
    function  临时函数:左键弹起(x, y)
      发送数据(当前,219,{序号1=7,选中=i})
    end
end
local 关闭 = 页面2["创建我的按钮"](页面2, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end





local 页面3 = 阵营内容界面["创建控件"](阵营内容界面, "页面3", 0, 0, 850, 520)
function 页面3:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面3:重置()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)
    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
    end
    __res:getPNGCC(1, 682, 386, 219, 126, true):拉伸(600, 360):显示(10, 40)
    local sf="失败"
    if   data.系统数据[data.角色数据.阵营].周胜利==true then
      sf="胜利"
    end
    字体16["置颜色"](字体16, __取颜色("黄色"))
    字体16["取图像"](字体16, "上周阵营胜负：")["显示"](字体16["取图像"](字体16, "上周阵营胜负："), 20, 50)
    字体16["取图像"](字体16, "阵营贡献对比：")["显示"](字体16["取图像"](字体16, "阵营贡献对比："), 20, 50+70)
    字体16["取图像"](字体16, "阵营剩余物品：")["显示"](字体16["取图像"](字体16, "阵营剩余物品："), 20, 50+140)
    字体16["取图像"](字体16, "我的阵营贡献：")["显示"](字体16["取图像"](字体16, "我的阵营贡献："), 20, 50+210)
    字体16["取图像"](字体16, "我的活动积分：")["显示"](字体16["取图像"](字体16, "我的活动积分："), 20, 50+280)
    字体14["置颜色"](字体14, __取颜色("青色"))
    字体14["取图像"](字体14, "当前阵营上周比试："..sf.."！")["显示"](字体14["取图像"](字体14, "当前阵营上周比试："..sf.."！"), 130, 50)
    local xxx=0
    local yyy=0
    local 占领情况={"已占领","已占领","已占领","已占领","已占领","已占领","已占领"}

    for i = 1,7 do 
        if data.系统数据[data.角色数据.阵营].阵营占领[i]== false then
           占领情况[i]="未占领"
        end
        字体14["置颜色"](字体14, __取颜色("青色"))
        字体14["取图像"](字体14, "海底"..i.."层："..占领情况[i])["显示"](字体14["取图像"](字体14, "海底"..i.."层："..占领情况[i]), 20+xxx*120, 70+yyy*20)
        xxx=xxx+1
        if xxx>3 then xxx=0 yyy=yyy+1 end
    end
    字体14["取图像"](字体14, "当前阵营总贡献："..data.系统数据[data.角色数据.阵营].阵营贡献)["显示"](字体14["取图像"](字体14, "当前阵营总贡献："..data.系统数据[data.角色数据.阵营].阵营贡献), 130, 115)
    字体14["置颜色"](字体14, __取颜色("黄色"))
    字体14["取图像"](字体14, "四海龙宫进度")["显示"](字体14["取图像"](字体14, "四海龙宫进度"), 60, 140)
    字体14["取图像"](字体14, "V S")["显示"](字体14["取图像"](字体14, "V S"), 60+205, 140)
    字体14["取图像"](字体14, "覆海帮进度")["显示"](字体14["取图像"](字体14, "覆海帮进度"), 60+350, 140)
    字体14["置颜色"](字体14, __取颜色("红色"))
    字体14["取图像"](字体14, data.系统数据.四海龙宫.阵营贡献)["显示"](字体14["取图像"](字体14, data.系统数据.四海龙宫.阵营贡献), 85, 160)
    字体14["取图像"](字体14, data.系统数据.覆海帮.阵营贡献)["显示"](字体14["取图像"](字体14, data.系统数据.覆海帮.阵营贡献), 85+350, 160)
    字体14["置颜色"](字体14, __取颜色("青色"))
    local xxxx=0
    local yyyy=0
    local 物品1={"海妖的贡品","海妖精气","海妖精魄","海妖灵兵","海妖王的灵元"}
    for i = 1, 5 do
        字体14["取图像"](字体14, ""..物品1[i]..":剩余"..data.系统数据[data.角色数据.阵营].阵营物品[i].."个")["显示"](字体14["取图像"](字体14, ""..物品1[i]..":剩余"..data.系统数据[data.角色数据.阵营].阵营物品[i].."个"), 20+xxxx*150, 210+yyyy*20)
        xxxx=xxxx+1
        if xxxx>2 then xxxx=0 yyyy=yyyy+1 end
    end
    字体14["取图像"](字体14, "当前阵营贡献值："..data.角色数据.贡献值.."   当前职位："..data.角色数据.当前职位)["显示"](字体14["取图像"](字体14, "当前阵营贡献值："..data.角色数据.贡献值.."   当前职位："..data.角色数据.当前职位), 20, 280)
    字体14["取图像"](字体14, "当前阵营积分："..data.角色数据.活动积分)["显示"](字体14["取图像"](字体14, "当前阵营积分："..data.角色数据.活动积分), 20, 350)
    字体14["置颜色"](字体14, __取颜色("黑色"))
      nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面3:显示(x,y)
    if self.图像 then 
    self.图像["显示"](self.图像, x, y)
    end
end

local 关闭 = 页面3["创建我的按钮"](页面3, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end



local 页面4 = 阵营内容界面["创建控件"](阵营内容界面, "页面4", 0, 0, 850, 520)
function 页面4:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面4:重置()
  local 技能名称={
    四海龙宫={[1]="东海腾龙", [2]="西瀛啸龙",[3]="南洋望龙",[4]="北溟潜龙",[5]="东海腾龙", [6]="西瀛啸龙",[7]="南洋望龙",[8]="北溟潜龙",[9]="东海腾龙", [10]="西瀛啸龙",[11]="南洋望龙",[12]="北溟潜龙",[13]="东海腾龙", [14]="西瀛啸龙",[15]="南洋望龙",[16]="北溟潜龙"},
    覆海帮={[1]="纵横四海",[2]="英雄本色",[3]="最佳拍档",[4]="末路狂花",[5]="纵横四海",[6]="英雄本色",[7]="最佳拍档",[8]="末路狂花",[9]="纵横四海",[10]="英雄本色",[11]="最佳拍档",[12]="末路狂花",[13]="纵横四海",[14]="英雄本色",[15]="最佳拍档",[16]="末路狂花"},}

  self.页面4技能网格:置数据(技能名称[data.角色数据.阵营])
  if data.角色数据.增益技能.名称~="无" then
    for i =1,4 do 
      阵营内容界面.页面4[i .. "双龙任务开技能"]:置可见(false)
    end
    阵营内容界面.页面4["双龙修炼技能"]:置可见(true)
    阵营内容界面.页面4["双龙突破技能"]:置可见(true)
    阵营内容界面.页面4["双龙切换技能"]:置可见(true)
  else 
      阵营内容界面.页面4["双龙修炼技能"]:置可见(false)
      阵营内容界面.页面4["双龙突破技能"]:置可见(false)
      阵营内容界面.页面4["双龙切换技能"]:置可见(false)
      for i =1,4 do 
        阵营内容界面.页面4[i .. "双龙任务开技能"]:置可见(true)
        阵营内容界面.页面4[i .. "双龙助战技能"]:置可见(false)

      end
  end 

  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)
    local pyy=0
    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
      require("SDL.图像")("assets/shape/slzz/qjt.png"):显示(0,pyy)
      require("SDL.图像")("assets/shape/slzz/hsh.png"):显示(135,pyy)
      require("SDL.图像")("assets/shape/slzz/yjlm.png"):显示(135*2,pyy)
      require("SDL.图像")("assets/shape/slzz/bbt.png"):显示(135*3,pyy)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
      require("SDL.图像")("assets/shape/slzz/dh.png"):显示(0,10)
      require("SDL.图像")("assets/shape/slzz/xh.png"):显示(135,15)
      require("SDL.图像")("assets/shape/slzz/nh.png"):显示(135*2,20)
      require("SDL.图像")("assets/shape/slzz/bh.png"):显示(135*3,0)
    end
    字体14["置颜色"](字体14, __取颜色("黄色"))
    字体14["取图像"](字体14, ""..data.角色数据.增益技能.经验值.."  /  "..data.角色数据.增益技能.等级*5000)["显示"](字体14["取图像"](字体14, ""..data.角色数据.增益技能.经验值.."  /  "..data.角色数据.增益技能.等级*5000), 375, 345)
      nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end

for i = 1, 4 do 
  local 临时函数 = 页面4["创建我的多选按钮"](页面4, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 75, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 75, 25), i .. "双龙任务开技能", 45+(i-1)*135, 365,"启用流派")
  function  临时函数:左键弹起(x, y)
    发送数据(当前,219,{序号1=8,选中=i})
  end
end
local 临时函数 = 页面4["创建我的多选按钮"](页面4, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25), "双龙修炼技能", 400, 365,"修炼")
function  临时函数:左键弹起(x, y)
  发送数据(当前,219,{序号1=9,选中=1})
end
local 临时函数 = 页面4["创建我的多选按钮"](页面4, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25), "双龙突破技能", 450, 365,"突破")
function  临时函数:左键弹起(x, y)
  发送数据(当前,219,{序号1=9,选中=2})
end
local 临时函数 = 页面4["创建我的多选按钮"](页面4, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25), "双龙切换技能", 500, 365,"切换")
function  临时函数:左键弹起(x, y)
  发送数据(当前,219,{序号1=9,选中=3})
end

-- for i = 1, 4 do 
--   local 临时函数 = 页面4["创建我的多选按钮"](页面4, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 75, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 75, 25), i .. "双龙助战技能", 15+(i-1)*80, 365,i.."号助战")
--   function  临时函数:左键弹起(x, y)
--     助战选中=i
--     发送数据(当前,219,{序号1=21,选中=i})
--   end
-- end
function 页面4:显示(x,y)
    if self.图像 then 
    self.图像["显示"](self.图像, x, y)
    end
end


local 页面4技能网格 = 页面4["创建网格"](页面4, "页面4技能网格", 65, 165, 600, 600)
function 页面4技能网格:初始化()
  self:创建格子(40, 40, 12,  95, 4, 4)
end
function 页面4技能网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr.数据 then
    self.子控件[a]._spr:详情打开(x, y)
  end
end
function 页面4技能网格:置数据(数据)
  local 技能名称1={
    ["东海腾龙"]=1,["西瀛啸龙"]=2,["南洋望龙"]=2,["北溟潜龙"]=4,
    ["纵横四海"]=1,["英雄本色"]=2,["最佳拍档"]=3,["末路狂花"]=4
}
  for i = 1, #页面4技能网格.子控件 do
    local lssj = __召唤兽技能格子.创建(当前)
    -- (数据, w, h, lx, 认证,cjjn,灰色)
    if data.角色数据.增益技能.名称=="无" then
    lssj:置数据(数据[i], 40, 40,nil,nil,nil,true)
    else 
        if i==技能名称1[data.角色数据.增益技能.名称]+12 and data.角色数据.增益技能.等级>=4  then
          lssj:置数据(数据[i], 40, 40)
        elseif i==技能名称1[data.角色数据.增益技能.名称]+8 and data.角色数据.增益技能.等级>=3  then
          lssj:置数据(数据[i], 40, 40)
        elseif i==技能名称1[data.角色数据.增益技能.名称]+4 and data.角色数据.增益技能.等级>=2 then
          lssj:置数据(数据[i], 40, 40)
        elseif i==技能名称1[data.角色数据.增益技能.名称] then
            lssj:置数据(数据[i], 40, 40)
        else 
          lssj:置数据(数据[i], 40, 40,nil,nil,nil,true)
        end 
    end
    页面4技能网格.子控件[i]:置精灵(lssj)
  end
end


local 关闭 = 页面4["创建我的按钮"](页面4, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end




local 页面5 = 阵营内容界面["创建控件"](阵营内容界面, "页面5", 0, 0, 850, 520)
function 页面5:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面5:重置()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    -- 原有背景、阵营相关渲染逻辑（不变，直接保留）
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)
    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
      local xx=0
      local yy=0 
      for i =1,6 do 
      __res:getPNGCC(1, 682, 386, 219, 126, true):拉伸(150, 150):显示(xx*190+40, 40+yy*190)
      xx=xx+1 
      if xx==3 then xx=0 yy=yy+1 end 
      end 
      字体14["置颜色"](字体14, __取颜色("蓝色"))
      字体14["取图像"](字体14, "覆海先锋")["显示"](字体14["取图像"](字体14, "覆海先锋"),62, 145)
      require("SDL.图像")("assets/shape/slzz/zczk.png"):显示(15+190, 120)
      require("SDL.图像")("assets/shape/slzz/pqyh.png"):显示(15+190*2, 120)
      require("SDL.图像")("assets/shape/slzz/qjfy.png"):显示(15, 310)
      require("SDL.图像")("assets/shape/slzz/fzbz.png"):显示(15+190, 310)
      require("SDL.图像")("assets/shape/slzz/wlcq.png"):显示(15+190*2, 310)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
      local xx=0
      local yy=0 
      for i =1,6 do 
      __res:getPNGCC(1, 682, 386, 219, 126, true):拉伸(150, 150):显示(xx*190+40, 40+yy*190)
      xx=xx+1 
      if xx==3 then xx=0 yy=yy+1 end 
      end 
    字体14["置颜色"](字体14, __取颜色("蓝色"))
    字体14:取图像("四海先锋"):显示(62, 145)
    require("SDL.图像")("assets/shape/slzz/fzly.png"):显示(15+190, 120)
    require("SDL.图像")("assets/shape/slzz/qtlw.png"):显示(15+190*2, 120)
    require("SDL.图像")("assets/shape/slzz/cyld.png"):显示(15, 310)
    require("SDL.图像")("assets/shape/slzz/dkls.png"):显示(15+190, 310)
    require("SDL.图像")("assets/shape/slzz/shlz.png"):显示(15+190*2, 310)
    end
    local xx=0
    local yy=0 
    for i =1,6 do 
    字体14["置颜色"](字体14, __取颜色("绿色"))
    字体14["取图像"](字体14, data.名称)["显示"](字体14["取图像"](字体14, data.名称),xx*190+75, 170+yy*190)
    xx=xx+1 
    if xx==3 then xx=0 yy=yy+1 end 
    end 
    字体14["置颜色"](字体14, __取颜色("红色"))
    local 双龙职位={["四海卫兵"]=1,["四海先锋"]=2,["风泽龙裔"]=3,["擎天龙王"]=4,["沧瀛龙帝"]=5,["断空龙神"]=6,["四海龙尊"]=7,["覆海卫兵"]=1,["覆海先锋"]=2,["蛰虺战狂"]=3,["盘虬英豪"]=4,["潜蛟风云"]=5,["伏螭霸主"]=6,["卧龙传奇"]=7}
    local 需求贡献={[1]=1000,[2]=2000,[3]=3000,[4]=5000,[5]=8000,[6]=10000,[7]=99999}
    字体14["取图像"](字体14, "当前职位："..data.角色数据.当前职位.."，距离下一职位需要达成："..(需求贡献[双龙职位[data.角色数据.当前职位]]).."点贡献值，当前贡献值："..data.角色数据.贡献值)["显示"](字体14["取图像"](字体14, "当前职位："..data.角色数据.当前职位.."，距离下一职位需要达成："..(需求贡献[双龙职位[data.角色数据.当前职位]]).."点贡献值，当前贡献值："..data.角色数据.贡献值),15, 200)
    nsf["渲染结束"](nsf)
  end
  local 隐藏武器的锦衣 = {
    "青花瓷月白", "龙行玉泽", "萌龙咆哮", "胖胖龙", "黑麒麟", "锦鲤",
    "青花瓷月黑", "灼灼韶华", "齐天大圣月白", "齐天大圣月黑"
  }
  local 允许武器 = true
  local 锦衣名称 = nil
  local lssj_角色模型 = nil  -- 角色基础模型（含锦衣）
  self.wqsj = nil  -- 主武器
  self.fwqsj = nil
  self.cwdh1=nil
  if data.锦衣 then
    锦衣名称 = type(data.锦衣) == "string" and data.锦衣 or data.锦衣.名称
    for _, 名称 in ipairs(隐藏武器的锦衣) do
      if 锦衣名称 == 名称 then
        允许武器 = false
        break
      end
    end
    if 允许武器 then
      local 武器类型 = data.武器数据 and 多开数据[当前].__主控.取武器子类(data.武器数据.子类) or nil
      lssj_角色模型 = 取模型(data.模型, nil, nil, 锦衣名称, 武器类型)
    else
      lssj_角色模型 = 取祥瑞模型(data.模型, 锦衣名称)
    end
    -- 加载角色基础动画（身体）
    self.cwdh1 = __res:取动画2(__res:取地址('shape/mx/zj/', lssj_角色模型[1])):置方向(1):置循环(true)
  else
    -- 无锦衣：直接加载角色基础模型
    lssj_角色模型 = 取模型(data.模型)
    self.cwdh1 = __res:取动画2(__res:取地址('shape/mx/', lssj_角色模型[1])):置方向(1):置循环(true)
    -- 角色自身染色（如果有）
    if data.染色组 and data.染色方案 and data.染色方案 ~= 0 then
      __res:置染色(self.cwdh1, data.染色方案, data.染色组[1], data.染色组[2], data.染色组[3])
    end
  end
  -- 3. 加载主武器（允许武器时才加载）
  if 允许武器 and data.武器数据 then
    -- 取主武器附加名称（子类+等级+名称）
    local 主武器附加名 = 多开数据[当前].__主控:取武器附加名称(
      data.武器数据.子类, 
      data.武器数据.等级 or data.武器数据.级别限制,  -- 兼容等级/级别限制
      data.武器数据.名称
    )
    -- 加载主武器模型
    local lssj_主武器 = 取模型(主武器附加名 .. "_" .. data.模型)
    self.wqsj = __res:取动画2(__res:取地址('shape/mx/', lssj_主武器[1])):置方向(1):置循环(true)
    -- 主武器染色（如果有）
    if data.武器数据.染色组 and data.武器数据.染色方案 and data.武器数据.染色方案 ~= 0 then
      __res:置染色(self.wqsj, data.武器数据.染色方案, data.武器数据.染色组[1], data.武器数据.染色组[2])
    end
  end

  -- 4. 加载副武器（仅子类911时加载，且允许武器）
  if 允许武器 and data.副武器数据 and data.副武器数据.名称 and data.副武器数据.子类 == 911 then
    -- 取副武器附加名称
    local 副武器附加名 = 多开数据[当前].__主控:取武器附加名称(
      data.副武器数据.子类,
      data.副武器数据.等级 or data.副武器数据.级别限制,
      data.副武器数据.名称
    )
    -- 加载副武器模型
    local lssj_副武器 = 取模型(副武器附加名 .. "_" .. data.模型)
    self.fwqsj = __res:取动画2(__res:取地址('shape/mx/', lssj_副武器[1])):置方向(1):置循环(true)
    -- 副武器染色（如果有）
    if data.副武器数据.染色组 and data.副武器数据.染色方案 and data.副武器数据.染色方案 ~= 0 then
      __res:置染色(self.fwqsj, data.副武器数据.染色方案, data.副武器数据.染色组[1], data.副武器数据.染色组[2])
    end
  end

  self.图像 = nsf["到精灵"](nsf)
end

function 页面5:更新(dt)
  if self.cwdh1 then 
      self.cwdh1["更新"](self.cwdh1, dt)
  end 
  if self.wqsj then
    self.wqsj["更新"](self.wqsj, dt)
  end 
  if self.fwqsj then
    self.fwqsj["更新"](self.fwqsj, dt)
  end 
end
-- function 页面5:显示(x,y)
--     if self.图像 then 
--       self.图像["显示"](self.图像, x, y)    

--       if self.cwdh1 then 
--         local xx=0
--         local yy=0 
--           for i =1,6 do
--           self.cwdh1["显示"](self.cwdh1, xx*190+265, 130+yy*190)
--           xx=xx+1 
--           if xx==3 then xx=0 yy=yy+1 end 
--           end
--         end

--         if self.wqsj   then 
--         local xx=0
--         local yy=0 
--           for i =1,6 do
--           self.wqsj["显示"](self.wqsj, xx*190+265, 130+yy*190)
--           xx=xx+1 
--           if xx==3 then xx=0 yy=yy+1 end 
--           end
--         end

--         if self.fwqsj   then 
--         local xx=0
--         local yy=0 
--           for i =1,6 do
--           self.fwqsj["显示"](self.fwqsj, xx*190+265, 130+yy*190)
--           xx=xx+1 
--           if xx==3 then xx=0 yy=yy+1 end 
--           end
--         end
--     end
-- end
function 页面5:显示(x,y)
    if self.图像 then 
        self.图像["显示"](self.图像, x, y)    
        if self.cwdh1 then 
            local xx=0
            local yy=0 
            for i =1,6 do
                local 相对X = xx*190 -80
                local 相对Y = 130 + yy*190
                local 最终X = 阵营内容界面.x + x + 相对X
                local 最终Y = 阵营内容界面.y + y + 相对Y
                self.cwdh1["显示"](self.cwdh1, 最终X, 最终Y)
                xx=xx+1 
                if xx==3 then 
                    xx=0 
                    yy=yy+1 
                end 
            end
        end
        if self.wqsj then 
            local xx=0
            local yy=0 
            for i =1,6 do
                local 相对X = xx*190 -80
                local 相对Y = 130 + yy*190
                local 最终X = 阵营内容界面.x + x + 相对X
                local 最终Y = 阵营内容界面.y + y + 相对Y
                self.wqsj["显示"](self.wqsj, 最终X, 最终Y)
                xx=xx+1 
                if xx==3 then xx=0 yy=yy+1 end 
            end
        end

        if self.fwqsj then 
            local xx=0
            local yy=0 
            for i =1,6 do
                local 相对X = xx*190 -80
                local 相对Y = 130 + yy*190
                local 最终X = 阵营内容界面.x + x + 相对X
                local 最终Y = 阵营内容界面.y + y + 相对Y
                self.fwqsj["显示"](self.fwqsj, 最终X, 最终Y)
                xx=xx+1 
                if xx==3 then xx=0 yy=yy+1 end 
            end
        end
    end
end



local 关闭 = 页面5["创建我的按钮"](页面5, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end






local 页面6 = 阵营内容界面["创建控件"](阵营内容界面, "页面6", 0, 0, 600, 800)
function 页面6:初始化()  
    local nsf = require("SDL.图像")(600, 800)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面6:重置()
  local nsf = require("SDL.图像")(600, 800)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 530, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 530, true), 0, 0)
    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
    end
    local xx=0
    local yy=0 
    for i =1,4 do 
    __res:getPNGCC(1, 682, 386, 219, 126, true):拉伸(120, 130):显示(35+(i-1)*140, 40)
    end 
    local dz={0x0EFA5E53,0x04694A50,0x2EA1E8D7,0xA8D17C1B,0x45874129,0x196F1418,0x4EFB0BE7,0x45874128
    ,0x45874127,0xB914F9E5,0x3944ABFA,0x0db96887,0xd6363dd6,0x9E0260D7,0x9E0260D7,0x04694A50}
    for i =1,16 do 
      require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(12+xx*70, 180+yy*100)
      xx=xx+1
      if xx>=8 then xx=0 yy=yy+1 end
    end 

    字体16["置颜色"](字体16, __取颜色("绿色"))
    字体16["取图像"](字体16, "派遣到敌方阵营")["显示"](字体16["取图像"](字体16, "派遣到敌方阵营"),35, 70)
    字体16["取图像"](字体16, "进行捣乱敌方")["显示"](字体16["取图像"](字体16, "进行捣乱敌方"),35, 90)
    字体16["取图像"](字体16, "10分钟未清理则")["显示"](字体16["取图像"](字体16, "10分钟未清理则"),35, 110)
    字体16["取图像"](字体16, "扣除每个*5贡献值")["显示"](字体16["取图像"](字体16, "扣除每个*5贡献值"),35, 130)
    字体16["取图像"](字体16, "派遣到敌方阵营")["显示"](字体16["取图像"](字体16, "派遣到敌方阵营"),35+140, 70)
    字体16["取图像"](字体16, "进行捣乱敌方")["显示"](字体16["取图像"](字体16, "进行捣乱敌方"),35+140, 90)
    字体16["取图像"](字体16, "5分钟未清理则")["显示"](字体16["取图像"](字体16, "5分钟未清理则"),35+140, 110)
    字体16["取图像"](字体16, "扣除每个*8点贡献值")["显示"](字体16["取图像"](字体16, "扣除每个*8点贡献值"),35+140, 130)
    字体16["取图像"](字体16, "派放到敌方阵营")["显示"](字体16["取图像"](字体16, "派放到敌方阵营"),35+280, 70)
    字体16["取图像"](字体16, "进行捣乱敌方,宝箱")["显示"](字体16["取图像"](字体16, "进行捣乱敌方,宝箱"),35+280, 90)
    字体16["取图像"](字体16, "真假参半,拾取到")["显示"](字体16["取图像"](字体16, "真假参半,拾取到"),35+280, 110)
    字体16["取图像"](字体16, "假宝箱扣除5积分")["显示"](字体16["取图像"](字体16, "假宝箱扣除5积分"),35+280, 130)
    字体16["取图像"](字体16, "与5点贡献值")["显示"](字体16["取图像"](字体16, "与5点贡献值"),35+280, 150)
    字体16["取图像"](字体16, "派遣到己方阵营")["显示"](字体16["取图像"](字体16, "派遣到己方阵营"),35+420, 70)
    字体16["取图像"](字体16, "每个宝箱都将获得")["显示"](字体16["取图像"](字体16, "每个宝箱都将获得"),35+420, 90)
    字体16["取图像"](字体16, "3点活动积分与")["显示"](字体16["取图像"](字体16, "3点活动积分与"),35+420, 110)
    字体16["取图像"](字体16, "3点贡献值")["显示"](字体16["取图像"](字体16, "3点贡献值"),35+420, 130)
    字体16["取图像"](字体16, "当前活动积分："..data.角色数据.活动积分)["显示"](字体16["取图像"](字体16, "当前活动积分："..data.角色数据.活动积分),35+420-270, 130+235)

      nsf["渲染结束"](nsf)
    end

    self.图像 = nsf["到精灵"](nsf)
end

for i, v in ipairs({
  {
    name = "派遣虾兵",
    x = 40,
    y = 42,
    tcp = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    tcp2 = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    font = "派遣虾兵"
  },
  {
    name = "派遣蟹将",
    x = 40+140,
    y = 42,
    tcp = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    tcp2 = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    font = "派遣蟹将"
  },
  {
    name = "赝品宝箱",
    x = 40+280,
    y = 42,
    tcp = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    tcp2 = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    font = "赝品宝箱"
  },
  {
    name = "发放宝箱",
    x = 40+420,
    y = 42,
    tcp = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    tcp2 = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
    font = "发放宝箱"
  },
}) do
  local 临时函数 = 页面6["创建我的单选按钮"](页面6, v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
   function  临时函数:左键弹起(x, y)
  发送数据(当前,219,{序号1=10,选中=i})
  end
end


local 临时函数 = 页面6["创建我的单选按钮"](页面6, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25), "双龙补签", 350, 505,"我要补签")
function  临时函数:左键弹起(x, y)
  发送数据(当前,219,{序号1=11,选中=2})
end
local 临时函数 = 页面6["创建我的单选按钮"](页面6, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25), "双龙签到", 350, 475,"我要签到")
function  临时函数:左键弹起(x, y)
  发送数据(当前,219,{序号1=11,选中=1})
end

页面6.道具网格 = 页面6["创建网格"](页面6, "道具网格", 15, 180, 550, 155)
function 页面6.道具网格:左键弹起(x, y, a, b, msg)
  if 页面6["材料位置"] and self.子控件[页面6["材料位置"]] then
    self.子控件[页面6["材料位置"]]._spr["确定"] = nil
  end
  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
   self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", a)
  end
end
function 页面6.道具网格:置物品(data)
  -- 解析函数：*后的数字作为积分消耗，物品数量固定为1
  local function 解析物品字符串(str)
    if type(str) ~= "string" then return nil end
    -- 提取物品名称和积分消耗（*后的数字）
    local 名称, 积分消耗 = string.match(str, "(.+)%*(%d+)")
    if 名称 and 积分消耗 then
      return {
        名称 = 名称,
        数量 = 1,  -- 兑换数量固定为1（可根据需求修改）
        积分消耗 = tonumber(积分消耗),  -- *后的数字作为积分消耗
        原始数据 = str  -- 保留原始字符串
      }
    end
    return nil  -- 格式错误返回空
  end

  页面6.材料位置 = nil
  页面6.物品数据列表 = {}  -- 存储所有解析后的物品数据

  -- 数据校验
  if not data or type(data) ~= "table" then
    data = {}
    print("商品数据为空，使用空数组")
  end

  self:创建格子(70, 100, 0, 0, 2, 8) 
  for i = 1, 16 do
    local 原始数据 = data[i]
    local 物品数据 = 解析物品字符串(原始数据)
    页面6.物品数据列表[i] = 物品数据  -- 存储到页面6，供按钮调用

    if 物品数据 then
      local lssj = __物品格子["创建"](当前)
      -- 物品格子显示：名称+数量（1个）
      lssj["置物品"](lssj, 物品数据, 物品数据.数量, "无双奖池")
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
      -- print("加载物品：", 物品数据.名称, "位置：", i, "消耗积分：", 物品数据.积分消耗)
    else
      self.子控件[i]["置精灵"](self.子控件[i])
      -- print(原始数据 and "物品格式错误（需符合'名称*积分'）" or "空格子", "位置：", i)
    end
  end
end
local x1=0
local y1=0 
for i = 1, 16 do 
  local 临时函数 = 页面6["创建我的单选按钮"](页面6, 
    __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25),
    __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25),
    i .. "双龙兑换物品", 20+x1*70, 235+y1*100, "兑换"
  )

  function 临时函数:左键弹起(x, y)
    -- 获取当前物品数据
    local 物品数据 = 页面6.物品数据列表[i]
    if not 物品数据 then
      print("无有效物品，无法兑换：位置", i)
      return
    end
    local 确认文案 = string.format(
      "是否兑换【%s】？\n将消耗 %d 点活动积分",
      物品数据.名称,  -- 物品名称（如"技能书"）
      物品数据.积分消耗  -- *后的数字（如500）
    )
    local 兑换事件 = function()
      发送数据(当前, 1503, {
        数量 = 物品数据.数量,  -- 固定为1（或根据需求修改）
        商品 = 物品数据.原始数据,  -- 原始字符串（如"技能书*500"）
        类型 = "阵营兑换",
        位置 = i,
        积分消耗 = 物品数据.积分消耗  -- 额外传递积分消耗（供后端校验）
      })
    end
    多开数据[当前].__UI界面.窗口层.文本栏:打开(确认文案, 285, 155, 390, 200, 兑换事件)
  end

  x1=x1+1 
  if x1==8 then x1=0 y1=y1+1 end
end




页面6.签到道具网格 = 页面6["创建网格"](页面6, "签到道具网格", 15, 395, 550, 50)
页面6.签到分页数据 = {
  当前页码 = 1,
  每页数量 = 8,
  总道具数 = 0,
  总页数 = 0,
  完整数据 = {}
}
页面6.当前页天数坐标 = {}  -- 存储当前页天数和对应坐标，用于显示文字

-- 分页按钮创建（保持你的原有写法）
local 上一页按钮 = 页面6["创建我的单选按钮"](
  页面6,
  __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
  __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
  "上一页",
  440, 475,
  "上一页"
)
页面6.上一页按钮 = 上一页按钮

local 下一页按钮 = 页面6["创建我的单选按钮"](
  页面6,
  __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
  __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 90, 25),
  "下一页",
  440, 505,
  "下一页"
)
页面6.下一页按钮 = 下一页按钮
function 页面6.签到道具网格:左键弹起(x, y, a, b, msg)
  if 页面6["材料位置"] and self.子控件[页面6["材料位置"]] then
    self.子控件[页面6["材料位置"]]._spr["确定"] = nil
  end
  local 分页数据 = 页面6.签到分页数据
  local 实际道具索引 = (分页数据.当前页码 - 1) * 分页数据.每页数量 + a
  local 道具数据 = 分页数据.完整数据[实际道具索引]

  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", 实际道具索引)
  end
end
function 页面6:渲染当前页签到道具()
  local 分页数据 = 页面6.签到分页数据
  local 网格 = 页面6.签到道具网格
  local 完整数据 = 分页数据.完整数据
  页面6.当前页天数坐标 = {}
  local 起始索引 = (分页数据.当前页码 - 1) * 分页数据.每页数量 + 1
  local 结束索引 = math.min(分页数据.当前页码 * 分页数据.每页数量, 分页数据.总道具数)
  网格:创建格子(70, 100, 0, 0, 1, 8)
  for 格子索引 = 1, 8 do
    local 道具索引 = 起始索引 + 格子索引 - 1  -- 道具索引 = 天数（1-60）
    local 原始道具表 = 完整数据[道具索引]
    local 物品数据 = nil
    if 原始道具表 and type(原始道具表) == "table" then
      物品数据 = {
        名称 = 原始道具表.名称 or "未知道具",
        数量 = 原始道具表.数量 or 1,
        积分消耗 = 0,
        原始数据 = 原始道具表
      }
    end
    if 物品数据 then
      local lssj = __物品格子["创建"](当前)
      lssj["置物品"](lssj, 物品数据, 物品数据.数量, "签到奖池", nil, "白格子")
      网格.子控件[格子索引]["置精灵"](网格.子控件[格子索引], lssj)
    else
      网格.子控件[格子索引]["置精灵"](网格.子控件[格子索引])
    end

    -- 存储当前格子的天数和坐标（用于后续显示文字）
    if 道具索引 <= 60 then  -- 只存储1-60天的有效数据
      table.insert(页面6.当前页天数坐标, {
        天数 = 道具索引,
        x = 15 + (格子索引 - 1) * 70,  -- 格子x坐标（相对页面）
        y = 400  -- 格子y坐标（相对页面）
      })
    end
  end
end

页面6.今天签到网格 = 页面6["创建网格"](页面6, "今天签到网格", 60, 473, 60, 60)
function 页面6.今天签到网格:左键弹起(x, y, a, b, msg)
  if 页面6["材料位置"] and self.子控件[页面6["材料位置"]] then
    self.子控件[页面6["材料位置"]]._spr["确定"] = nil
  end
  local 已签到次数 = (data.角色数据.历史贡献与签到.次数 or 0)
  local 实际道具索引 = 已签到次数 + 1
  local 道具数据 = 页面6.签到分页数据.完整数据[实际道具索引] or {}

  if self.子控件[a]._spr and self.子控件[a]._spr["物品"] and not self.子控件[a]._spr["物品"].物品禁止 then
    self.子控件[a]._spr["确定"] = true
    self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 293, 35, w, h, "选择", 实际道具索引)
  end
end
function 页面6.今天签到网格:置物品(data)
  local function 解析签到物品(原始道具表)
    if 原始道具表 and type(原始道具表) == "table" then
      return {
        名称 = 原始道具表.名称 or "未知道具",
        数量 = 原始道具表.数量 or 1,
        原始数据 = 原始道具表,
        小动画 = 原始道具表.小动画 or nil
      }
    end
    return nil
  end
  self:创建格子(70, 100, 0, 0, 1, 1)
  local 物品数据 = 解析签到物品(data)
  if 物品数据 then
    local lssj = __物品格子["创建"](当前)
    lssj["置物品"](lssj, 物品数据, 物品数据.数量, "签到奖池", nil, "白格子")
    self.子控件[1]["置精灵"](self.子控件[1], lssj)  -- 固定第1个格子
  else
    self.子控件[1]["置精灵"](self.子控件[1])  -- 空道具清空格子
  end
end




-- 上一页点击事件（保持你的原有写法）
function 上一页按钮:左键弹起(x, y)
  local 分页数据 = 页面6.签到分页数据
  if 分页数据.当前页码 > 1 then
    分页数据.当前页码 = 分页数据.当前页码 - 1
    页面6:渲染当前页签到道具()
  end
end

-- 下一页点击事件（保持你的原有写法）
function 下一页按钮:左键弹起(x, y)
  local 分页数据 = 页面6.签到分页数据
  if 分页数据.当前页码 < 分页数据.总页数 then
    分页数据.当前页码 = 分页数据.当前页码 + 1
    页面6:渲染当前页签到道具()
  end
end
local 双龙特权 = 页面6:创建我的was按钮(__res:取地址('shape/pic/',0xA1000000),"双龙特权",290, 465)
function 双龙特权:左键弹起(x, y)
    多开数据[当前].__UI弹出.提示框:打开("#Y/开启阵营签到会员，每次签到都将获得以下特权\n#G/[签到50%几率免费不消耗积分]\n#G/[每日签到额外获得5000W两银子]\n#G/[每日签到额外获得5000W经验]\n#G/[每日签到额外必定额外获得88点活动积分返还")
end

function 页面6.签到道具网格:置物品(data)
  local 分页数据 = 页面6.签到分页数据
  分页数据.完整数据 = data or {}
  分页数据.总道具数 = #分页数据.完整数据
  分页数据.总页数 = math.ceil(分页数据.总道具数 / 分页数据.每页数量)
  页面6:渲染当前页签到道具()
end
function 页面6:显示(x,y)
    if self.图像 then 
      self.图像["显示"](self.图像, x, y)
    end
    字体16:置颜色(255, 255, 255)
    -- 字体16:显示(x+300, y+455, 页面6.签到分页数据.当前页码 .. "/////" .. 页面6.签到分页数据.总页数)
    字体16:显示(x+260, y+510, "已签到"..(data.角色数据.历史贡献与签到.次数 or 0).."天")
    字体15:显示(x+35, y+466, "今")
    字体15:显示(x+35, y+466+17, "天")
    字体15:显示(x+35, y+466+17*2, "奖")
    字体15:显示(x+35, y+466+17*3, "励")
    字体15:显示(x+120, y+470, "签到消耗188点活动积分")
    字体15:显示(x+120, y+490, "补签消耗188点活动积分")

    字体16:置颜色(255, 200, 0)  -- 黄色醒目，不与背景重叠
    for _, 天数信息 in ipairs(页面6.当前页天数坐标 or {}) do
      local 文字x = x + 天数信息.x + 6  -- 格子x + 20（水平居中，适配"第X天"字数）
      local 文字y = y + 天数信息.y + 47  -- 格子y + 网格高度(50) + 3像素间距
      字体16:显示(文字x, 文字y, "第" .. 天数信息.天数 .. "天")
    end
end

local 关闭 = 页面6["创建我的按钮"](页面6, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end



local 页面7 = 阵营内容界面["创建控件"](阵营内容界面, "页面7", 0, 0, 850, 520)
function 页面7:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面7:重置()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 500, 350, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 500, 350, true), 0, 0)
   取白色背景(0, 0, 490, 200, true)["显示"](取白色背景(0, 0, 490, 200, true), 5, 35)
    for i =1, 5 do 
    require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(15+i*100-100, 175)
    end 
    if data.角色数据.宠物.幻化模型~="无" then 
        require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(15, 250)
        local 头像1={0x01004901,0x01004901,0x01004901,0x01004901,0x01004901}
        __res["取图像"](__res, __res["取地址"](__res, "shape/mx/", 头像1[data.角色数据.宠物.幻化序号])):显示(10+10, 260)
        -- __res["取图像"](__res, "shape/mx/"..头像1[data.角色数据.宠物.幻化序号]..".was"):显示(10+10, 260) 
        __res:getPNGCC(1, 552, 0, 101, 23):显示(74 , 250)
        __res:getPNGCC(1, 552, 0, 101, 23):拉伸(160, 23):显示(15 , 305)
        local 宠物名称={"小猪","强盗沙狸","哮天犬","狐狸","雪蛙"}
        字体14["置颜色"](字体14, __取颜色("黑色"))
        字体14["取图像"](字体14, 宠物名称[data.角色数据.宠物.幻化序号])["显示"](字体14["取图像"](字体14, 宠物名称[data.角色数据.宠物.幻化序号]),85, 255)
        字体14["取图像"](字体14, data.角色数据.宠物.当前经验.." / "..data.角色数据.宠物.升级经验)["显示"](字体14["取图像"](字体14, data.角色数据.宠物.当前经验.." / "..data.角色数据.宠物.升级经验),60, 310)
        require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(220, 260)
        require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(300, 260)
        require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(380, 260)
        __res["取图像"](__res, __res["取地址"](__res, "shape/jn/", 0x3FC666BA)):显示(226, 266)
        __res["取图像"](__res, __res["取地址"](__res, "shape/jn/", 0x2D685412)):显示(306, 266)
        __res["取图像"](__res, __res["取地址"](__res, "shape/jn/", 0x83A054A5)):显示(386, 266)

        -- __res["取图像"](__res, "shape/jn/3FC666BA.was"):显示(226, 266) 
        -- __res["取图像"](__res, "shape/jn/2D685412.was"):显示(306, 266)
        -- __res["取图像"](__res, "shape/jn/83A054A5.was"):显示(386, 266)
        if data.角色数据.宠物.选中加成 then 
          __res:getPNGCC(3, 1124, 677, 59, 60):显示(230-14+(data.角色数据.宠物.选中加成-1)*80 , 270-14)
          local A
          if data.角色数据.宠物.选中加成==1 then
                A="伤害与灵力"
          elseif data.角色数据.宠物.选中加成==2 then
                A="防御与速度"
          else
                A="封印命中等级与治疗能力与固定伤害"
          end
          多开数据[当前].__UI弹出.提示框:打开("#Y/当前选中技能后，触发加成：增加#R/"..(data.角色数据.宠物.等级*2).."点#Y"..A)
        end
      end

     nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
    local 模型1={0x01005103,0x01005103,0x01005103,0x01005103,0x01005103}
    if data.角色数据.宠物.幻化模型~="无" then 
      self.cwdh2=__res["取动画2"](__res, __res["取地址"](__res, "shape/mx/",模型1[data.角色数据.宠物.幻化序号]))["置循环"](__res["取动画2"](__res, __res["取地址"](__res, "shape/mx/",模型1[data.角色数据.宠物.幻化序号])), true)
    end
end




function 页面7:更新(dt)
  if self.cwdh2 then 
  self.cwdh2["更新"](self.cwdh2, dt)
  end
end

function 页面7:显示(x,y)
  if self.图像 then 
  self.图像["显示"](self.图像, x, y)  
  end
  if self.cwdh2 then 
    self.cwdh2["显示"](self.cwdh2, 400, 130)   
  end  
end
-- for i = 1, 4 do 
--   local 临时函数 = 页面7["创建我的多选按钮"](页面7, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 85, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 85, 25), i .. "皮皮龙助战", 400, 10+i*35,i.."号助战")
--   function  临时函数:左键弹起(x, y)
--     发送数据(当前,219,{序号1=20,选中=i})
--   end
-- end

for i = 1, 3 do 
  local 临时函数 = 页面7["创建我的多选按钮"](页面7, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 50, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 50, 25), i .. "皮皮龙选中", 145+i*80, 320,"选中")
  function  临时函数:左键弹起(x, y)
    发送数据(当前,219,{序号1=13,选中=i})
  end
end

local  ppl野猪头像= 页面7["创建我的was按钮"](页面7, __res["取地址"](__res, "shape/mx/", 0x01011158), "ppl野猪头像", 23, 185)
function  ppl野猪头像:左键弹起(x, y, msg)
  发送数据(当前,219,{序号1=12,选中=1})
end
local  ppl强盗头像= 页面7["创建我的was按钮"](页面7,  __res["取地址"](__res, "shape/mx/", 0x01004901), "ppl强盗头像", 123, 185)
function  ppl强盗头像:左键弹起(x, y, msg)
  发送数据(当前,219,{序号1=12,选中=2})
end
local  ppl哮天犬头像= 页面7["创建我的was按钮"](页面7,  __res["取地址"](__res, "shape/mx/", 0x01004901), "ppl哮天犬头像", 223, 185)
function  ppl哮天犬头像:左键弹起(x, y, msg)
  发送数据(当前,219,{序号1=12,选中=3})
end
local  ppl狐狸头像= 页面7["创建我的was按钮"](页面7,  __res["取地址"](__res, "shape/mx/", 0x01004901), "ppl狐狸头像", 323, 185)
function  ppl狐狸头像:左键弹起(x, y, msg)
  发送数据(当前,219,{序号1=12,选中=4})
end
local  ppl蛙头像= 页面7["创建我的was按钮"](页面7,  __res["取地址"](__res, "shape/mx/", 0x01004901), "ppl蛙头像", 423, 185)
function  ppl蛙头像:左键弹起(x, y, msg)
  发送数据(当前,219,{序号1=12,选中=5})
end

for i, v in ipairs({
  {
    name = "跟随",
    x = 75,
    y = 275, 
    tcp = __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),
    tcp2 = __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),
    font = "跟随"
  },
  {
    name = "隐藏",
    x = 135,
    y = 275,
    tcp = __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),
    tcp2 = __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),
    font = "隐藏"
  },
  {
    name = "锻炼皮皮龙",
    x = 15,
    y = 330,
    tcp = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 160, 25),
    tcp2 = __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 160, 25),
    font = "锻炼皮皮龙"
  },
}) do
  local 临时函数 = 页面7["创建我的单选按钮"](页面7, v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
   function  临时函数:左键弹起(x, y)
    if v.name == "跟随" then
      发送数据(当前,219,{序号1=14,选中=2})
    elseif v.name == "隐藏" then
      发送数据(当前,219,{序号1=14,选中=1})
    else 
      发送数据(当前,219,{序号1=15})
    end 
  end
end






local 页面8 = 阵营内容界面["创建控件"](阵营内容界面, "页面8", 0, 0, 850, 520)
function 页面8:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面8:重置()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)

    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
    end
    字体15:置颜色(__取颜色("绿色"))
    字体15:取图像("每次清空消耗"..data.清空冷却.."仙玉"):显示(413,285)
    local xx=0
    local yy=0 
  --   for i =1,4 do 
  --   __res:getPNGCC(1, 682, 386, 219, 126, true):拉伸(120, 130):显示(35+(i-1)*140, 40)
  --   end 
  
  local txsc={
    [1]={[1]=0x01010389,[2]=0x01010852,[3]=0xAA204001,[4]=0xAA213201,[5]=0xAA213301,[6]=0xAA206601},
    [2]={[1]=0x01010903,[2]=0xAA213701,[3]=0xAA210401,[4]=0x01010954,[5]=0x01010037,[6]=3615876352},
    [3]={[1]=0x01010167,[2]=0x01011634,[3]=0x01010627,[4]=0xAA207701,[5]=0xAA215501,[6]=0x01011610},
    [4]={[1]=0x01010097,[2]=0x01010920,[3]=0xAA100501,[4]=0x01007309,[5]=0xAA205801,[6]=0x01010389},
    [5]={[1]=0x01007909,[2]=0x01010281,[3]=0xAA102201,[4]=0xAA102601,[5]=0xAA100701,[6]=0x01011658},
    [6]={[1]=0xAA207801,[2]=0xA1000004,[3]=0xAA213501,[4]=0xAA215801,[5]=0x01011572,[6]=0xA1000001},
    [7]={[1]=0xAA213801,[2]=0xAA102501,[3]=0x01010241,[4]=0x01010516,[5]=0x01011124,[6]=0x01011754},
  }
  字体16["置颜色"](字体16, __取颜色("绿色"))
   for i =1,6 do 
      require("SDL.图像")("assets/shape/slzz/gz1.png"):显示(30+xx*265, 60+yy*60)
    --  __res["取图像"](__res, "shape/mx/"..txsc[NPC页面][i]..".was"):显示(35+xx*265, 65+yy*60) 
      __res["取图像"](__res, __res["取地址"](__res, "shape/mx/", txsc[NPC页面][i])):显示(35+xx*265, 65+yy*60)

  
      if data.角色数据.好感NPC[NPC页面] and data.角色数据.好感NPC[NPC页面][i] then
        local 序列=math.floor(data.角色数据.好感NPC[NPC页面][i]/(NPC页面*100/6))+1
        if 序列>6 then 
          序列=6 
        end
        local NPC关系={"素未谋面","情同手足","推心置腹","患难与共","同舟共济","肝肠寸断"}
        字体16["取图像"](字体16, "好感度:"..data.角色数据.好感NPC[NPC页面][i].."/"..NPC页面*100)["显示"](字体16["取图像"](字体16, "好感度:"..data.角色数据.好感NPC[NPC页面][i].."/"..NPC页面*100),100+xx*265, 60+yy*60)
        字体16["取图像"](字体16, "关系:"..NPC关系[序列])["显示"](字体16["取图像"](字体16, "关系:"..NPC关系[序列]),200+xx*265, 60+yy*60)
      else 
        字体16["取图像"](字体16, "好感度:0/"..NPC页面*100)["显示"](字体16["取图像"](字体16, "好感度:0/"..NPC页面*100),100+xx*265, 60+yy*60)
        字体16["取图像"](字体16, "关系:素未谋面")["显示"](字体16["取图像"](字体16, "关系:素未谋面"),200+xx*265, 60+yy*60)
      end 
      xx=xx+1
      if xx>=2 then xx=0 yy=yy+1 end
  end 

    字体16["置颜色"](字体16, __取颜色("绿色"))
    local NPC达成=0
    for i = 1,6 do
      if  data.角色数据.好感NPC[NPC页面] and data.角色数据.好感NPC[NPC页面][i]>=NPC页面*100 then NPC达成=NPC达成+1  end
    end
    字体16:取图像("加成取最高计算"):显示(220, 350)
    字体16["取图像"](字体16, "本页达成目标："..NPC达成.."/6 ，此页NPC达成加成：全属性增加"..(NPC页面*2).."%")["显示"](字体16["取图像"](字体16, "本页达成目标："..NPC达成.."/6 ，此页NPC达成加成：全属性增加"..(NPC页面*2).."%"),120, 320)
    if data.捐赠时间 and data.捐赠时间-os.time()>0 then
      字体16["取图像"](字体16, "当前还需 "..(data.捐赠时间-os.time()).." 秒后，可继续捐赠")["显示"](字体16["取图像"](字体16, "当前还需 "..(data.捐赠时间-os.time()).." 秒后，可继续捐赠"),100, 255)
    else
      字体16["取图像"](字体16, "当前还需 0 秒后，可继续捐赠")["显示"](字体16["取图像"](字体16, "当前还需 0 秒后，可继续捐赠"),100, 255)
    end
    字体16["置颜色"](字体16, __取颜色("黑色"))


      nsf["渲染结束"](nsf)
    end

    self.图像 = nsf["到精灵"](nsf)
end

local x1=0
local y1=0 
for i = 1, 6 do 
  local 临时函数 = 页面8["创建我的多选按钮"](页面8, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25), i .. "NPC送礼", 100+x1*265, 80+y1*60,"送礼")
  function  临时函数:左键弹起(x, y)
    发送数据(当前,219,{序号1=16,选中=i,序列=NPC页面})
  end
  x1=x1+1 
  if x1==2 then x1=0 y1=y1+1 end
end
local x1=0
local y1=0 
for i = 1, 6 do 
  local 临时函数 = 页面8["创建我的多选按钮"](页面8, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25), i .. "NPC交谈", 150+x1*265, 80+y1*60,"交谈")
  function  临时函数:左键弹起(x, y)
    发送数据(当前,219,{序号1=17,选中=i,序列=NPC页面})
  end
  x1=x1+1 
  if x1==2 then x1=0 y1=y1+1 end
end
local x1=0
local y1=0 
for i = 1, 6 do 
  local 临时函数 = 页面8["创建我的多选按钮"](页面8, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 45, 25), i .. "NPC捐赠", 200+x1*265, 80+y1*60,"捐赠")
  function  临时函数:左键弹起(x, y)
    发送数据(当前,219,{序号1=18,选中=i,序列=NPC页面})
  end
  x1=x1+1 
  if x1==2 then x1=0 y1=y1+1 end
end


-- for i = 1, 4 do 
--   local 临时函数 = 页面8["创建我的多选按钮"](页面8, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 80, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 80, 25), i .. "NPC助战按钮", 120+i*90, 280,i.."号助战")
--   function  临时函数:左键弹起(x, y)
--     发送数据(当前,219,{序号1=19,选中=i,序列=NPC页面})
--   end
-- end
local 清空冷却 = 页面8:创建我的单选按钮(__res:getPNGCC(1, 449, 28, 174, 35, true):拉伸(80,25), __res:getPNGCC(1, 449, 28, 174, 35, true):拉伸(80,25), "清空冷却",329, 280, "清空冷却")
function 清空冷却:左键按下(消息, x, y)
      发送数据(当前,219,{序号1=23})
end

local 临时函数 = 页面8["创建我的多选按钮"](页面8, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25), "NPC上一页", 130, 280,"上一页")
function  临时函数:左键弹起(x, y)
  NPC页面=NPC页面-1
  if NPC页面<1 then NPC页面=1 end
  阵营内容界面["页面8"]["重置"](阵营内容界面["页面8"])
end
local 临时函数 = 页面8["创建我的多选按钮"](页面8, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25), "NPC下一页", 130+90, 280,"下一页")
function  临时函数:左键弹起(x, y)
  NPC页面=NPC页面+1
  if NPC页面>7 then NPC页面=7 end
  阵营内容界面["页面8"]["重置"](阵营内容界面["页面8"])
end

-- local 临时函数 = 页面8["创建我的多选按钮"](页面8, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 80, 25), "双龙签到", 480, 365,"我要签到")
-- function  临时函数:左键弹起(x, y)
--   发送数据(当前,219,{序号1=11,选中=1})
-- end


function 页面8:显示(x,y)
    if self.图像 then 
    self.图像["显示"](self.图像, x, y)   
    end
end
local 关闭 = 页面8["创建我的按钮"](页面8, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end

local 关闭 = 页面7["创建我的按钮"](页面7, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 470, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end






local 页面9 = 阵营内容界面["创建控件"](阵营内容界面, "页面9", 0, 0, 850, 520)
function 页面9:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面9:重置()
  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)

    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
    end
    字体16["置颜色"](字体16, __取颜色("白色"))
    local 达成任务={"派遣虾兵到敌方阵营","派遣蟹将到敌方阵营","派发赝品宝箱到敌方阵营","发放宝箱到己方阵营","回收物品到阵营商场","锻炼皮皮龙"}
    local xx=0
    local yy=0
    local 达成数量={[1]=2,[2]=4,[3]=6,[4]=8,[5]=10,[6]=10}
    for i = 1,6 do 
      if data.角色数据.阵营=="覆海帮" then
        require("SDL.图像")("assets/shape/slzz/hb.png"):显示(10+xx*300, 55+yy*80)
      else
        require("SDL.图像")("assets/shape/slzz/lb.png"):显示(10+xx*300, 55+yy*80)
      end
      字体16["取图像"](字体16, 达成任务[i])["显示"](字体16["取图像"](字体16, 达成任务[i]),65+xx*300, 75+yy*80)
      local 上限=data.角色数据.达成任务[i]+2 if 上限>10 then 上限=10 end
      字体16["取图像"](字体16, "".. data.角色数据.达成任务[i].."/"..达成数量[math.floor(data.角色数据.达成任务[i]/2+1)])["显示"](字体16["取图像"](字体16, "".. data.角色数据.达成任务[i].."/"..达成数量[math.floor(data.角色数据.达成任务[i]/2+1)]),65+xx*300, 95+yy*80)
      yy=yy+1
      if yy>=3 then yy=0 xx=xx+1 end
    end 
    字体16["取图像"](字体16,"每达成一项目标都将增加150点贡献值")["显示"](字体16["取图像"](字体16,"每达成一项目标都将增加150点贡献值"),120, 320)
      
    字体16["置颜色"](字体16, __取颜色("黑色"))
      nsf["渲染结束"](nsf)
    end

    self.图像 = nsf["到精灵"](nsf)
end


function 页面9:显示(x,y)
    if self.图像 then 
    self.图像["显示"](self.图像, x, y)   
    end
end
local 关闭 = 页面9["创建我的按钮"](页面9, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end







local 页面10 = 阵营内容界面["创建控件"](阵营内容界面, "页面10", 0, 0, 850, 520)
function 页面10:初始化()  
    local nsf = require("SDL.图像")(600, 600)
    if nsf["渲染开始"](nsf) then
       nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end
function 页面10:重置()
  local 技能名称={
    四海龙宫={[1]="东海腾龙", [2]="西瀛啸龙",[3]="南洋望龙",[4]="北溟潜龙",[5]="东海腾龙", [6]="西瀛啸龙",[7]="南洋望龙",[8]="北溟潜龙",[9]="东海腾龙", [10]="西瀛啸龙",[11]="南洋望龙",[12]="北溟潜龙",[13]="东海腾龙", [14]="西瀛啸龙",[15]="南洋望龙",[16]="北溟潜龙"},
    覆海帮={[1]="纵横四海",[2]="英雄本色",[3]="最佳拍档",[4]="末路狂花",[5]="纵横四海",[6]="英雄本色",[7]="最佳拍档",[8]="末路狂花",[9]="纵横四海",[10]="英雄本色",[11]="最佳拍档",[12]="末路狂花",[13]="纵横四海",[14]="英雄本色",[15]="最佳拍档",[16]="末路狂花"},}

  self.页面10技能网格:置数据(技能名称[data.角色数据.阵营])
  if data.助战数据.角色数据.增益技能.名称~="无" then
    阵营内容界面.页面10["双龙修炼技能"]:置可见(true)
    阵营内容界面.页面10["双龙突破技能"]:置可见(true)
    阵营内容界面.页面10["双龙切换技能"]:置可见(true)
  else 
      阵营内容界面.页面10["双龙修炼技能"]:置可见(false)
      阵营内容界面.页面10["双龙突破技能"]:置可见(false)
      阵营内容界面.页面10["双龙切换技能"]:置可见(false)
  end 

  local nsf = require("SDL.图像")(600, 600)
  if nsf["渲染开始"](nsf) then
    置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true)["显示"](置窗口背景(data.角色数据.阵营, 0, 12, 570, 385, true), 0, 0)
    local pyy=0
    if data.角色数据.阵营=="覆海帮" then
      require("SDL.图像")("assets/shape/slzz/hbj1.png"):显示(5, 35)
      require("SDL.图像")("assets/shape/slzz/qjt.png"):显示(0,pyy)
      require("SDL.图像")("assets/shape/slzz/hsh.png"):显示(135,pyy)
      require("SDL.图像")("assets/shape/slzz/yjlm.png"):显示(135*2,pyy)
      require("SDL.图像")("assets/shape/slzz/bbt.png"):显示(135*3,pyy)
    else
      require("SDL.图像")("assets/shape/slzz/lbj1.png"):显示(5, 35)
      require("SDL.图像")("assets/shape/slzz/dh.png"):显示(0,10)
      require("SDL.图像")("assets/shape/slzz/xh.png"):显示(135,15)
      require("SDL.图像")("assets/shape/slzz/nh.png"):显示(135*2,20)
      require("SDL.图像")("assets/shape/slzz/bh.png"):显示(135*3,0)
    end
    字体14["置颜色"](字体14, __取颜色("黄色"))
    字体14["取图像"](字体14, ""..data.助战数据.角色数据.增益技能.经验值.."  /  "..data.助战数据.角色数据.增益技能.等级*5000)["显示"](字体14["取图像"](字体14, ""..data.助战数据.角色数据.增益技能.经验值.."  /  "..data.助战数据.角色数据.增益技能.等级*5000), 375, 345)
      nsf["渲染结束"](nsf)
    end
    self.图像 = nsf["到精灵"](nsf)
end

local 临时函数 = 页面10["创建我的多选按钮"](页面10, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25), "双龙修炼技能", 400, 365,"修炼")
function  临时函数:左键弹起(x, y)
  if 助战选中~=0 then 
    发送数据(当前,219,{序号1=22,选中=1,序列=助战选中})
  end 
end
local 临时函数 = 页面10["创建我的多选按钮"](页面10, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25), "双龙突破技能", 450, 365,"突破")
function  临时函数:左键弹起(x, y)
  if 助战选中~=0 then 
    发送数据(当前,219,{序号1=22,选中=2,序列=助战选中})
  end 
end
local 临时函数 = 页面10["创建我的多选按钮"](页面10, __res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25),__res:getPNGCC(1, 449, 28, 174, 35, true)["拉伸"](__res:getPNGCC(1, 449, 28, 174, 35, true), 45, 25), "双龙切换技能", 500, 365,"切换")
function  临时函数:左键弹起(x, y)
  if 助战选中~=0 then 
    发送数据(当前,219,{序号1=22,选中=3,序列=助战选中})
  end 
end

for i = 1, 4 do 
  local 临时函数 = 页面10["创建我的多选按钮"](页面10, __res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 75, 25),__res:getPNGCC(3, 511, 11, 117, 43, true)["拉伸"](__res:getPNGCC(3, 511, 11, 117, 43, true), 75, 25), i .. "双龙助战技能", 15+(i-1)*80, 365,i.."号助战")
  function  临时函数:左键弹起(x, y)
    助战选中=i
    发送数据(当前,219,{序号1=21,选中=i})
  end
end
function 页面10:显示(x,y)
    if self.图像 then 
    self.图像["显示"](self.图像, x, y)
    end
end


local 页面10技能网格 = 页面10["创建网格"](页面10, "页面10技能网格", 65, 165, 600, 600)
function 页面10技能网格:初始化()
  self:创建格子(40, 40, 12,  95, 4, 4)
end
function 页面10技能网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr.数据 then
    self.子控件[a]._spr:详情打开(x, y)
  end
end
function 页面10技能网格:置数据(数据)
  local 技能名称1={
    ["东海腾龙"]=1,["西瀛啸龙"]=2,["南洋望龙"]=2,["北溟潜龙"]=4,
    ["纵横四海"]=1,["英雄本色"]=2,["最佳拍档"]=3,["末路狂花"]=4
}
  for i = 1, #页面10技能网格.子控件 do
    local lssj = __召唤兽技能格子.创建(当前)
    -- (数据, w, h, lx, 认证,cjjn,灰色)
    if 数据[i] then 
        if data.助战数据.角色数据.增益技能.名称=="无" then
        lssj:置数据(数据[i], 40, 40,nil,nil,nil,true)
        else 
            if i==技能名称1[data.助战数据.角色数据.增益技能.名称]+12 and data.助战数据.角色数据.增益技能.等级>=4  then
              lssj:置数据(数据[i], 40, 40)
            elseif i==技能名称1[data.助战数据.角色数据.增益技能.名称]+8 and data.助战数据.角色数据.增益技能.等级>=3  then
              lssj:置数据(数据[i], 40, 40)
            elseif i==技能名称1[data.助战数据.角色数据.增益技能.名称]+4 and data.助战数据.角色数据.增益技能.等级>=2 then
              lssj:置数据(数据[i], 40, 40)
            elseif i==技能名称1[data.助战数据.角色数据.增益技能.名称] then
                lssj:置数据(数据[i], 40, 40)
            else 
              lssj:置数据(数据[i], 40, 40,nil,nil,nil,true)
            end 
        end
      end 
    页面10技能网格.子控件[i]:置精灵(lssj)
  end
end


local 关闭 = 页面10["创建我的按钮"](页面10, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 550, 0)
function 关闭:左键弹起(x, y, msg)
  阵营内容界面["置可见"](阵营内容界面, false)
end

