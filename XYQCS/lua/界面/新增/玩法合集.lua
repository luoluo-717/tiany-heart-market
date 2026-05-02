--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-11-12 12:24:52
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-11-12 12:28:06
FilePath: \XYQCS\lua\界面\新增\玩法合集.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]

local 玩法合集 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("玩法合集",80+67 + abbr.py.x, 20 + abbr.py.y,696, 492)
local 当前=多开数据.当前
function 玩法合集:初始化()
  local nsf = require("SDL.图像")(696, 492)
  if nsf["渲染开始"](nsf) then
      置窗口背景("玩法合集", 0, 12, 680,460, true):显示(0, 0)
      取白色背景(0,0,660,405,true):显示(10,53)

      require("SDL.图像")("assets/shape/slzz/wf2.png"):显示(20, 90)
      require("SDL.图像")("assets/shape/slzz/wf5.png"):显示(20+315, 90)
      require("SDL.图像")("assets/shape/slzz/wf4.png"):显示(20, 90+130)
      require("SDL.图像")("assets/shape/slzz/wf1.png"):显示(20+315, 90+130)
      require("SDL.图像")("assets/shape/slzz/wf6.png"):显示(20, 90+130*2)
      require("SDL.图像")("assets/shape/slzz/wf3.png"):显示(20+315, 90+130*2)
    for i =1,3 do
      require("SDL.图像")("assets/shape/slzz/lb.png"):显示(100, 103+(i-1)*128)
      require("SDL.图像")("assets/shape/slzz/hb.png"):拉伸(206,60):显示(100+315, 103+(i-1)*128)
    end

      字体16:置颜色(__取颜色("黑色"))
      字体16:取图像("双龙之战玩法合集页面，用于方便玩家快捷操作参与活动。"):显示(141,70)
      字体16:置颜色(__取颜色("白色"))
      字体16:取图像("每日玩法任务"):显示(158,130)
      字体16:取图像("商店回收购买"):显示(158,130+128)
      字体16:取图像("阵营贡献玩法"):显示(158,130+128*2)

      字体16:取图像("职位与积分兑换"):显示(158+322,130)
      字体16:取图像("皮皮龙养成玩法"):显示(158+322,130+128)
      字体16:取图像("阵营NPC好感度加成"):显示(158+322,130+128*2)
      

     

  end
  self.允许移动 = true
  self:置精灵(nsf["到精灵"](nsf))
end

function 玩法合集:打开()
  self:置可见(true)
  self:sdfsdaa()
end

function 玩法合集:sdfsdaa()
 self:重置数据()
end

function 玩法合集:重置数据()
  local nsf = require("SDL.图像")(700, 500)
  if nsf["渲染开始"](nsf) then
      字体14["置颜色"](字体14,__取颜色("黑色"))
    nsf["渲染结束"](nsf)
  end
  self.图像 = nsf["到精灵"](nsf)
end
for i, v in ipairs {
    {name = "每日任务", x = 100 ,y = 155 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '每日任务',zz=1},
    {name = "达成任务", x = 100+100 ,y = 155 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '达成任务',zz=2},

    {name = "打开商店", x = 100 ,y = 155+128 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '打开商店',zz=3},
    {name = "阵营战况", x = 100+100 ,y = 155+128 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '阵营战况',zz=10},

    {name = "领取俸禄", x = 100 ,y = 155+128*2 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '领取俸禄',zz=5},
    {name = "职位区分", x = 100+100 ,y = 155+128*2 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '职位区分',zz=4},

    {name = "职位权限", x = 100+335 ,y = 155 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '职位权限',zz=6},
    {name = "宠物养成", x = 100+335  ,y = 155+128 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = '宠物养成',zz=7},
    {name = "NPC赠礼", x = 100+335  ,y = 155+128*2 , tcp = __res:getPNGCC(1,449,28,174,35,true):拉伸(98,35) , font = 'NPC赠礼',zz=8},


} do
    local 临时函数 = 玩法合集:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        发送数据(当前,219,{序号1=4,选中=v.zz})
    end
end


local 关闭 = 玩法合集["创建我的按钮"](玩法合集, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 645, 0)
function 关闭:左键弹起(x, y, msg)
  玩法合集["置可见"](玩法合集, false)
end