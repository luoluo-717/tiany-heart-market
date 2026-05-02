local 助战列表 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("助战列表",引擎.宽度/2-300,50,683+20,455)

local 当前 =  多开数据.当前
-- function 助战列表:初始化()
--   local nsf = require("SDL.图像")(683+20, 455)
--   local lssj = huang取输入背景(0, 0, 115, 23)
--   if nsf["渲染开始"](nsf) then
--     huang置窗口背景("邀请小号", 0, 12, 616, 313+17+50, true):置透明(240):显示(0, 0)
--     for i=1,5 do
--       local jx = 11+(i-1)*120
--       __res:getPNGCC(7, 286, 487, 114, 142):显示(jx,53)
--       for n=0,3 do
--         lssj:显示(jx,211+n*24+20-30)
--       end
--     end
--   end
--   self:置精灵(nsf["到精灵"](nsf))
-- end
function 助战列表:初始化()
  local nsf = require("SDL.图像")(683+20, 455)
  local lssj = 取输入背景(0, 0, 115, 23)
  if nsf["渲染开始"](nsf) then
    置窗口背景("邀请小号", 0, 12, 616, 313+30, true):置透明(240):显示(0, 0)
    for i=1,5 do
      local jx = 11+(i-1)*120
      __res:getPNGCC(3, 375, 388, 145, 149):拉伸(115,140):显示(jx,53)
      for n=0,3 do
        lssj:显示(jx,211+n*24+20-30)
      end
    end
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.允许移动=true
end


function 助战列表:打开(内容)
  self:置可见(true)
  self.列表=内容

  self.zhuzhanwangge:置数据()
end



function 助战列表:更新在线1(内容)
  for i=1,4 do
		if 内容[i] then
			-- self.列表[i]=内容[i]
		end
	end
end

function 助战列表:更新在线(内容)
  for i=1,5 do
		if 内容[i] then
			self.列表[i]=内容[i]
		end
	end
  self.zhuzhanwangge:置数据()
end
local zhuzhanwangge = 助战列表["创建网格"](助战列表, "zhuzhanwangge", 0, 53, 740, 290+46)
function zhuzhanwangge:初始化()
  -- self:创建格子(328, 140, 0, 0, 3, 2,true)
end
function zhuzhanwangge:左键弹起(x, y, a, b, msg)
  -- if self.子控件[a]._spr["数据"] then
  --   助战列表["选中"] = a
  --   self.子控件[a]._spr["确定"] = true
  -- end
end

-- function zhuzhanwangge:置数据()
--   self:创建格子(167, 280+46, 0, -47, 1, 5)
--   for i, v in ipairs(self.子控件) do
--     if 助战列表.列表[i] then
--       local lssj = __助战模型["创建"](当前)
--       lssj["置数据"](lssj, 助战列表.列表[i], i, sfzd)
--       local 设置按钮 = self.子控件[i]["创建我的按钮"](self.子控件[i], __res:getPNGCC(7, 202, 63, 35, 35):拉伸(32, 32), "设置按钮" .. i, 81+8, 15-11+7)
--       function 设置按钮:左键单击(x, y, msg)
--         发送数据(当前,2004,{助战编号=i})
--       end

--       local 组队按钮 = self.子控件[i]["创建我的按钮"](self.子控件[i], __res:getPNGCC(7, 0, 209, 118, 28):拉伸(95, 32), "组队按钮" .. i, 81-60, 50+44+150+6,"邀请组队"):置禁止((not 助战列表.列表[i].在线 or 助战列表.列表[i].在线=="在  线")==false )
--       function 组队按钮:左键单击(x, y, msg)
--         				-- 发送数据(当前,4017,{id=助战列表.列表[i].id})
      
--         if 助战列表.列表[i].在线=="在  线" then
-- 					local 事件 = function()
-- 						发送数据(当前,2002,{助战编号=i})
-- 					end
--           多开数据[多开数据.当前].__UI界面.窗口层.文本栏:打开("确定将在线小号#R "..助战列表.列表[i].名称.."#W 邀请进队伍吗？", 285, 155, 390, 200, 事件)
-- 				else
-- 					发送数据(当前,2002,{助战编号=i})
-- 				end
--       end
--       -- if 助战列表.列表[i].在线=="队伍中" then
--         -- local 切换为队长 = self.子控件[i]["创建我的按钮16"](self.子控件[i], __res:getPNGCC(7, 0, 242, 120, 29):拉伸(95,30), "切换队长" .. i, 81-60, 50+44+150+6+42, "切换队长")--self.子控件[i]["创建我的按钮"](self.子控件[i],__res:getPNGCC(1, 626, 28, 58, 34, true):拉伸(95, 32), "切换队长" .. i, 81-60, 50+44+150+6+39,"切换队长")
--         -- function 切换为队长:左键单击(x, y, msg)
--           -- local 事件 = function()
--             -- 发送数据(当前,2019,{助战编号=i})
--             -- 助战列表:关闭所有助战界面()
--           -- end
--           -- 多开数据[多开数据.当前].__UI界面.窗口层.文本栏:打开("确定将小号#R "..助战列表.列表[i].名称.."#W 切换为队长吗？", 285, 155, 390, 200, 事件)
--         -- end
--       -- end
--       -- self.jux=require('SDL.矩形')(0, 0, 328, 140)--{272, 17+13,29, 29}
--       v:置可见(true, true)
--       zhuzhanwangge["子控件"][i]["置精灵"](zhuzhanwangge["子控件"][i], lssj)
--     end
--   end
-- end
function zhuzhanwangge:置数据()
  self:创建格子(167, 280+46, 0, -47, 1, 5)
  for i, v in ipairs(self.子控件) do
    if 助战列表.列表[i] then
      local lssj = __助战模型["创建"](当前)
      lssj["置数据"](lssj, 助战列表.列表[i], i, sfzd)
      
      local 设置按钮 = self.子控件[i]["创建我的按钮"](self.子控件[i], __res:getPNGCC(7, 202, 63, 35, 35):拉伸(32, 32), "设置按钮" .. i, 81+8, 15-11+7)
      设置按钮["左键单击"] = function(按钮, x, y, msg)
        发送数据(当前,2004,{助战编号=i})
      end

      local 组队按钮 = self.子控件[i]["创建我的按钮"](self.子控件[i], __res:getPNGCC(7, 0, 209, 118, 28):拉伸(95, 32), "组队按钮" .. i, 81-60, 50+44+150+6,"邀请组队")
      组队按钮:置禁止((not 助战列表.列表[i].在线 or 助战列表.列表[i].在线=="在  线")==false )
      组队按钮["左键单击"] = function(按钮, x, y, msg)
        if 助战列表.列表[i].在线=="在  线" then
          local 事件 = function()
            发送数据(当前,2002,{助战编号=i})
          end
          多开数据[多开数据.当前].__UI界面.窗口层.文本栏:打开("确定将在线小号#R "..助战列表.列表[i].名称.."#W 邀请进队伍吗？", 285, 155, 390, 200, 事件)
        else
          发送数据(当前,2002,{助战编号=i})
        end
      end
      
      v:置可见(true, true)
      zhuzhanwangge["子控件"][i]["置精灵"](zhuzhanwangge["子控件"][i], lssj)
    else
      local 创建按钮 = self.子控件[i]["创建我的按钮"](self.子控件[i], __res:getPNGCC(7, 0, 209, 118, 28):拉伸(95, 32), "创建按钮" .. i, 81-60, 50+44+150+6,"创建助战")
      创建按钮["左键单击"] = function(按钮, x, y, msg)
        多开数据[当前].__UI界面.窗口层.助战创建:打开()
        助战列表:置可见(false)
      end
      v:置可见(true, true)
    end
  end
end



function 助战列表:关闭所有助战界面()
 多开数据[多开数据.当前].__UI界面["窗口层"].助战列表:置可见(false)
 多开数据[多开数据.当前].__UI界面["窗口层"].助战详情:置可见(false)
 多开数据[多开数据.当前].__UI界面["窗口层"].助战加点:置可见(false)
--  多开数据[多开数据.当前].__UI界面["窗口层"].助战经脉:置可见(false)
 多开数据[多开数据.当前].__UI界面["窗口层"].助战道具栏:置可见(false)
 多开数据[多开数据.当前].__UI界面["窗口层"].助战仓库:置可见(false)
 多开数据[多开数据.当前].__UI界面["窗口层"].助战技能学习:置可见(false)
 多开数据[多开数据.当前].__UI界面["窗口层"].助战修炼学习:置可见(false)
 多开数据[多开数据.当前].__UI界面["窗口层"].助战宝宝查看:置可见(false)
多开数据[多开数据.当前].__UI界面["窗口层"].助战宝宝加点:置可见(false)
end

local 关闭 = 助战列表:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 616-35, 0)
function 关闭:左键弹起(x, y, msg)
  助战列表["置可见"](助战列表, false)
end