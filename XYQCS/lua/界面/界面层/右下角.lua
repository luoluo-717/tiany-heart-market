local 右下角 = 多开数据[多开数据.当前].__UI界面.界面层:创建控件("右下角",295+abbr.py.x,400+abbr.py.y,705,140)
local 当前 = 多开数据.当前
function 右下角:初始化()

end

function 右下角:重置界面()
  self:置可见(true, true)
  self.快捷技能控件:置可见(__res.配置["快捷技能"]==1)
  self.临时道具网格:置可见(__主控.临时背包闪烁)
end


-- local 隐藏 = 右下角:创建我的按钮(__res.UI素材[1]:复制区域(568,203,50,56),"隐藏",576,70) -- 新春
local 隐藏 = 右下角:创建我的按钮(__res:getPNGCC(2,1122,419,49,48),"隐藏",576,70)

function 隐藏:左键弹起(x,y,msg)
    if 右下角.功能栏.是否可见 then
        右下角.功能栏:置可见(false)
    else
        右下角.功能栏:置可见(true)
    end
end


local 背包 = 右下角:创建我的按钮(__res.UI素材[1]:复制区域(720, 140, 52, 44),"背包",40+50+70*6, 8)
function 背包:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前,8000,{仓库类型="宝石"})
end


local 玩法合集 = 右下角:创建我的was按钮(__res:取地址('shape/pic/',0xA0000037),"玩法合集",40+50+70*5, 0)
function 玩法合集:左键弹起(x, y, msg)
    多开数据[当前].__UI界面.窗口层.玩法合集:打开()
end



local 好友 = 右下角:创建我的按钮(__res.UI素材[1]:复制区域(516,202,46,47),"好友",580,5)

function 好友:左键弹起(x,y,msg)
    if 多开数据[当前].__UI界面.窗口层.好友.是否可见 then
        多开数据[当前].__UI界面.窗口层.好友.关闭:左键弹起()
      else
        发送数据(当前,6956)
      end
end

function 好友:显示(x, y)
    if self.消息提醒 then
        多开数据[当前].__主控.消息提醒:显示(x, y)
    end
end

local 临时功能栏 = 多开数据[当前].__UI界面.界面层.右下角:创建控件("临时功能栏",0,0,705,75)
function 临时功能栏:初始化()
    self:置可见(false)
end

-- local 临时道具 = 临时功能栏:创建我的按钮(__res:getPNGCC(2, 521, 3, 54, 54),"临时道具",500,0) --169

-- function 临时道具:左键弹起(x,y,msg)
--     发送数据(当前,3749,{方式="索取"})
-- end



local 功能栏 = 多开数据[当前].__UI界面.界面层.右下角:创建控件("功能栏",0,66,705,75)
function 功能栏:初始化()

end

local 商城 = 功能栏:创建我的按钮(__res:getPNGCC(2, 985, 125, 59, 52),"商城",50,3)

function 商城:左键弹起(x,y,msg)
    发送数据(当前 or self and self.当前, 29)
end



local 系统 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(4,201,44,50),"系统",114,3) --2

function 系统:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.系统设置:打开()
end

local 攻击 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(52,202,44,47),"攻击",169,5) --59

function 攻击:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.界面层:重置("攻击")
end

local 给予 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(103,201,45,50),"给予",227,4) --114

function 给予:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.界面层:重置("给予")
end



local 帮派 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(214,200,44,51),"帮派",283,1) --227

function 帮派:左键弹起(x,y,msg)
    发送数据(当前 or self and self.当前,36)

end

-- local 法术 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(417, 203, 45, 48), "法术", 10+50+70*5, 6+20)
local 法术 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(417,203,45,48),"法术",453,6)

function 法术:左键弹起(x, y, msg)
  右下角.快捷技能控件:打开()
end

local 快捷技能控件 = 右下角:创建控件("快捷技能控件", 45, 0)
function 快捷技能控件:初始化()
  -- print("快捷技能",__res.配置["快捷技能"],__res.配置["快捷技能"]==1)
  self:置可见(__res.配置["快捷技能"]==1)
end
function 快捷技能控件:打开()
  if self.是否可见 then
    self:置可见(false)
    __res.配置["快捷技能"]=0
    __res["写出文件"](__res, "configure.txt", zdtostring(__res["配置"]))
    return
  end
  self:置可见(true)
  __res.配置["快捷技能"]=1
  __res["写出文件"](__res, "configure.txt", zdtostring(__res["配置"]))
  self.技能网格:重置()
end
local 技能网格 = 快捷技能控件:创建网格("技能网格", 10, 10, 520, 55)
function 技能网格:初始化()
  快捷技能控件:置精灵(__res:getPNGCC(2, 230, 964, 402, 51, true):拉伸(530, 75):到精灵())
  快捷技能控件:置中心(45, -10)
end
function 技能网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr then
    发送数据(当前 or self and self.当前,13, {
      序列 = a
    })
  end
end
function 技能网格:重置()
  self:创建格子(55, 55, 0, 10, 1, 8)
  for i, v in ipairs(self.子控件) do
    if 多开数据[当前].角色信息.快捷技能[i] then
      local lssj = 取技能信息(多开数据[当前].角色信息.快捷技能[i].名称, 多开数据[当前].角色信息.门派)
      v:置精灵(__res:取图像(__res:取地址("shape/jn/", lssj[7])):拉伸(55, 55):到精灵())
      local 按钮 = v:创建我的按钮(__res:getPNGCC(1, 713, 283, 27, 20), "按钮" .. i, 27, 0)
      function 按钮:左键弹起(x, y)
        发送数据(当前 or self and self.当前,92, {
          位置 = i,
          名称 = 多开数据[多开数据.当前].角色信息.快捷技能[i].名称
        })
      end
      v:置可见(true, true)
    else
      local 按钮 = v:创建我的按钮(__res:getPNGCC(1, 536, 314, 54, 54), "添加快捷技能", 0, 0)
      function 按钮:左键弹起(x, y)
        -- __UI弹出.快捷技能选择:打开(i)
        --  多开数据.__UI弹出.快捷技能选择:打开(i)
        多开数据[多开数据.当前].__UI弹出.快捷技能选择:打开(i)
      end
      v:置可见(true, true)
    end
  end
end
-- local 绘卷 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(314,201,46,50),"绘卷",283,3)

-- function 绘卷:左键弹起(x,y,msg)

-- end

local 成就 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(365,202,45,47),"成就",340,6)

function 成就:左键弹起(x,y,msg)
    发送数据(当前,6308)
end

local 组队 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(266,201,44,49),"组队",396,5)

function 组队:显示(x,y)
    if self.消息提醒 then
        多开数据[当前].__主控.消息提醒:显示(x,y)
    end
end

function 组队:左键弹起(x,y,msg)
    if 多开数据[当前].__主显.主角.是否队长 or 多开数据[当前].__主显.主角.是否组队 then
        发送数据(当前 or self and self.当前,4001)
    else
       多开数据[当前 or self and self.当前].__UI弹出.队伍弹出:打开()
    end
end

-- local 法术 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(417,203,45,48),"法术",453,6)

-- function 法术:左键弹起(x,y,msg)
--     右下角.快捷技能控件:置可见(not 右下角.快捷技能控件.是否可见)
--     右下角.快捷技能控件.技能网格:重置()
-- end

local 道具 = 功能栏:创建我的按钮(__res.UI素材[1]:复制区域(469,203,45,48),"道具",509,5)

function 道具:左键弹起(x,y,msg)
    if not 多开数据[当前].__UI界面.窗口层.道具行囊.是否可见 then
        发送数据(当前 or self and self.当前,3699)
    end
end

-- local 快捷技能控件 = 右下角:创建控件('快捷技能控件',530,55,530,75)
-- function 快捷技能控件:初始化()
--     self:置可见(false)
-- end


-- local 技能网格 = 快捷技能控件:创建网格("技能网格",10,10,530,55)
-- function 技能网格:初始化()
--     self.技能 = {}
-- end

-- function 技能网格:左键弹起(x, y, a, b, msg)
--     if self.子控件[a] and self.子控件[a]._spr then
--         发送数据(当前 or self and self.当前,13,{序列=self.技能[a].位置,类型=self.技能[a].类型})
--     end
-- end


-- function 技能网格:重置()
--     self.技能 = {}
--     for i,v in pairs(多开数据[当前 or self and self.当前].角色信息.快捷技能) do
--         self.技能[#self.技能+1] = v
--         self.技能[#self.技能].位置 = i
--     end
--     -- if #self.技能 < 8 then
--     --     快捷技能控件:置中心(100+#self.技能*56,55)
--     --     self:创建格子(55,55,0,10,1,#self.技能+1)
--     --     快捷技能控件:置精灵(取灰黑背景(0,0,(#self.技能 + 1 )*65+10,75):到精灵())
--     -- else
--     --     快捷技能控件:置中心(50+#self.技能*56,55)
--     --     self:创建格子(55,55,0,10,1,#self.技能)
--     --     快捷技能控件:置精灵(取灰黑背景(0,0,#self.技能*65+10,75):到精灵())
--     -- end
--     for i, v in ipairs(self.子控件) do
--         if self.技能[i] then
--             local lssj = 取技能信息(self.技能[i].名称) 
--             v:置精灵(__res:取图像(__res:取地址('shape/jn/',lssj[7])):拉伸(55,55):到精灵())
--             local 按钮 = v:创建我的按钮(__res:getPNGCC(1,713,283,27,20),'按钮'..i,27,0) 
--             function 按钮:左键弹起(x, y)
--                 发送数据(当前 or self and self.当前,11.1,{位置=技能网格.技能[i].位置,名称=技能网格.技能[i].名称})
--             end
--             v:置可见(true,true)
--         else
--             if i == #self.技能 + 1 then
--                 local 按钮 = v:创建我的按钮(__res:getPNGCC(1,536,314,54,54),'添加快捷技能',0,0) 
--                 function 按钮:左键弹起(x, y)
--                     for n=1,8 do
--                         if 多开数据[当前 or self and self.当前].角色信息.快捷技能[n] == nil then    
--                            多开数据[当前 or self and self.当前].__UI弹出.快捷技能选择:打开(n)
--                             break
--                         end
--                     end
--                 end
--                -- v:置可见(true,true)
--             else
--                 v:置精灵()
--             end
--         end
--     end
-- end