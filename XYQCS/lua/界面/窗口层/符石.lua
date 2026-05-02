local 符石镶嵌 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("符石镶嵌",60,0,398,510)
local 当前 = 多开数据.当前

function 符石镶嵌:初始化()
  local nsf = require("SDL.图像")(415, 515)
  if nsf["渲染开始"](nsf) then
    置窗口背景("符石镶嵌", 0, 16, 393, 495, true):显示(0, 0)
    取属性背景(0, 0, 370, 126+12, true):显示(10, 345-23-12)
    取灰色背景(0, 0, 373, 260-12, true):显示(10, 69-14)
    
  end
  self:置精灵(nsf["到精灵"](nsf))
  self.物品 = {}
  self.物品2 = nil
  self.可镶嵌 = false
  self.可清空 = false
  self.动效开关 =false
  self.装备 = nil
  self.发送数据={}
end
local format = string.format
local 关闭 = 符石镶嵌["创建我的按钮"](符石镶嵌, __res:getPNGCC(1, 401, 0, 46, 46), "关闭", 355, 0)
function 关闭:左键弹起(x, y, msg)
  符石镶嵌["置可见"](符石镶嵌, false)
end
function 符石镶嵌:打开(data, pid)
  self:置可见(true)
  self.翻转星石:置可见(false)
  self:刷新符石(data)
  self.镶嵌:置禁止(true)
  self.还原:置禁止(true)
  if self.装备 and self.装备.星位组 then
    self.星石网格:置可见(true)  -- 已开星位：显示网格
  else
    self.星石网格:置可见(false) -- 未开星位：隐藏网格
  end
end


-- function 符石镶嵌:刷新符石(数据,是否)
--     self.选中符石 = nil
--     self.选中星石 = nil
--     self.装备 = 数据  -- 记录当前装备数据
--     self:装备展示(self.装备.名称)  -- 展示装备外观
--     self.不可替换 = nil
--     self.介绍文本:清空()  -- 清空介绍文本
--     self.介绍文本2:清空()
--     self.发送数据 = {}  -- 重置发送数据
    
--     -- 显示装备基础信息
--     self.介绍文本2:置文本(format("#Y/"..self.装备.名称))
--     self.介绍文本2:置文本(format("#G/开运孔数：%s", self.装备.开运孔数.当前.."孔/"..self.装备.开运孔数.上限.."孔"))
    
--     -- 创建符石网格（根据开运孔数）
--     self.符石网格:创建格子(55, 55, 0, 15, 1, self.装备.开运孔数.当前)
--     self.临时符石 = {}  -- 重置临时符石表（存储当前操作的符石数据）
    
--     -- 重置星石相关状态
--     self.星石网格:置物品(nil)  -- 清空星石网格旧数据
--     self.翻转星石:置可见(false)  -- 默认隐藏翻转按钮
    
--     -- 核心逻辑：以星位组（self.装备.星位组）作为“是否开孔”的判断依据
--     if self.装备.星位组 then
--         -- 场景1：星位组存在 → 已开孔（无论是否有星石数据）
--         -- 处理1-5号符石（普通符石）
--         if self.装备.星位 ~= nil then
--             for n = 1, 5 do
--                 if self.装备.星位[n] ~= nil then
--                     -- 拼接符石属性文本
--                     local 组合语句 = "#G符石："
--                     local 计数 = 1
--                     for k, v in pairs(self.装备.星位[n].符石属性) do
--                         if 计数 == 1 then
--                             组合语句 = 组合语句..k.." +"..v.." "
--                         else
--                             组合语句 = 组合语句..k.." +"..v
--                         end
--                         计数 = 计数 + 1
--                     end
--                     self.介绍文本2:置文本(组合语句)
                    
--                     -- 缓存符石数据到临时表
--                     self.临时符石[n] = self.装备.星位[n]
--                     local wwewq1 = __物品格子["创建"](当前)
--                     wwewq1:取数据(self.装备.星位[n])
--                     self.临时符石[n].子类 = wwewq1.物品.子类
--                     self.临时符石[n].颜色 = wwewq1.物品.颜色
--                     self.临时符石[n].符石属性 = wwewq1.物品.符石属性
--                 end
--             end
--             -- 显示符石到网格
--             self.符石网格:置物品(self.装备.星位)
--         end
        
--         -- 处理6号星石（特殊星石）
--         if self.装备.星位 and self.装备.星位[6] ~= nil then
--             -- 有星石时：显示星石属性
--             self.装备.星位[6].类型 = self.装备.星位[6].阴阳
--             local 临时属性 = ""
--             for k, v in pairs(self.装备.星位[6].符石属性) do
--                 临时属性 = k.." +"..v
--             end
--             self.介绍文本2:置文本("#G/星位: "..临时属性)
--             self.装备.星位[6].sx = 临时属性
--             self.临时符石[6] = self.装备.星位[6]
--             self.星石网格:置物品(self.装备.星位[6])  -- 显示星石
--             self.翻转星石:置可见(true)  -- 显示翻转按钮
            
--             -- 显示星石相互合属性
--             if self.装备.星位[6].相互 ~= nil then
--                 local 临时属性 = ""
--                 for k, v in pairs(self.装备.星位[6].相互) do
--                     临时属性 = k.." +"..v
--                 end
--                 self.介绍文本2:置文本("#G/星相互合: "..临时属性)
--             end
--         else
--             -- 无星石时：显示“已开”（明确已开孔但未镶嵌）
--             self.介绍文本2:置文本("#G/星位: 已开")
--             self.星石网格:置物品(nil)  -- 显示空格子
--         end
        
--     else
--         -- 场景2：星位组不存在 → 未开孔
--         self.介绍文本2:置文本("#G/星位: 未开孔")
--         self.星石网格:置物品(nil)  -- 清空星石网格
--     end
    
--     -- 显示符石组合信息（如果有）
--     if self.装备.星位 ~= nil and self.装备.星位.组合 ~= nil then
--         self.介绍文本2:置文本(format("#X/符石组合： %s", self.装备.星位.组合))
--         self.介绍文本2:置文本(format("#X/门派条件： %s", self.装备.星位.门派 or "无"))
--         self.介绍文本2:置文本(format("#X/部位条件： %s", 取符石部位(self.装备.星位.部位)))
--         self.介绍文本2:置文本(format("#X/%s", 取符石组合说明(self.装备.星位.组合, self.装备.星位.组合等级)))
--     end
-- end
function 符石镶嵌:刷新符石(数据,是否)
    self.选中符石 = nil
    self.选中星石 = nil
    self.装备 = 数据  -- 记录当前装备数据
    self:装备展示(self.装备.名称)  -- 展示装备外观
    self.不可替换 = nil
    self.介绍文本:清空()  -- 清空介绍文本
    self.介绍文本2:清空()
    self.发送数据 = {}  -- 重置发送数据
    
    -- 显示装备基础信息
    self.介绍文本2:置文本(format("#Y/"..self.装备.名称))
    self.介绍文本2:置文本(format("#G/开运孔数：%s", self.装备.开运孔数.当前.."孔/"..self.装备.开运孔数.上限.."孔"))
    
    -- 创建符石网格（根据开运孔数）
    self.符石网格:创建格子(55, 55, 0, 15, 1, self.装备.开运孔数.当前)
    self.临时符石 = {}  -- 重置临时符石表（存储当前操作的符石数据）
    
    -- 重置星石相关状态
    self.星石网格:置物品(nil)  -- 清空星石网格旧数据
    self.翻转星石:置可见(false)  -- 默认隐藏翻转按钮
    
    -- 处理符石（1-5号位置），这部分与星位组无关，只要有开运孔就可以镶嵌符石
    if self.装备.星位 ~= nil then
        for n = 1, 5 do
            if self.装备.星位[n] ~= nil then
                -- 拼接符石属性文本
                local 组合语句 = "#G符石："
                local 计数 = 1
                for k, v in pairs(self.装备.星位[n].符石属性) do
                    if 计数 == 1 then
                        组合语句 = 组合语句..k.." +"..v.." "
                    else
                        组合语句 = 组合语句..k.." +"..v
                    end
                    计数 = 计数 + 1
                end
                self.介绍文本2:置文本(组合语句)
                
                -- 缓存符石数据到临时表
                self.临时符石[n] = self.装备.星位[n]
                local wwewq1 = __物品格子["创建"](当前)
                wwewq1:取数据(self.装备.星位[n])
                self.临时符石[n].子类 = wwewq1.物品.子类
                self.临时符石[n].颜色 = wwewq1.物品.颜色
                self.临时符石[n].符石属性 = wwewq1.物品.符石属性
            end
        end
        -- 显示符石到网格
        self.符石网格:置物品(self.装备.星位)
    end
    
    -- 处理星石（6号位置），这部分需要判断星位组
    if self.装备.星位组 then
        -- 星位组存在，表示已经开了星位
        if self.装备.星位 and self.装备.星位[6] ~= nil then
            -- 有星石时：显示星石属性
            self.装备.星位[6].类型 = self.装备.星位[6].阴阳
            local 临时属性 = ""
            for k, v in pairs(self.装备.星位[6].符石属性) do
                临时属性 = k.." +"..v
            end
            self.介绍文本2:置文本("#G/星位: "..临时属性)
            self.装备.星位[6].sx = 临时属性
            self.临时符石[6] = self.装备.星位[6]
            self.星石网格:置物品(self.装备.星位[6])  -- 显示星石
            self.翻转星石:置可见(true)  -- 显示翻转按钮
            
            -- 显示星石相互合属性
            if self.装备.星位[6].相互 ~= nil then
                local 临时属性 = ""
                for k, v in pairs(self.装备.星位[6].相互) do
                    临时属性 = k.." +"..v
                end
                self.介绍文本2:置文本("#G/星相互合: "..临时属性)
            end
        else
            -- 无星石时：显示“已开”（明确已开孔但未镶嵌）
            self.介绍文本2:置文本("#G/星位: 已开")
            self.星石网格:置物品(nil)  -- 显示空格子
        end
    else
        -- 场景2：星位组不存在 → 未开孔
        self.介绍文本2:置文本("#G/星位: 未开孔")
        self.星石网格:置物品(nil)  -- 清空星石网格
    end
    
    -- 显示符石组合信息（如果有）
    if self.装备.星位 ~= nil and self.装备.星位.组合 ~= nil then
        self.介绍文本2:置文本(format("#X/符石组合： %s", self.装备.星位.组合))
        self.介绍文本2:置文本(format("#X/门派条件： %s", self.装备.星位.门派 or "无"))
        self.介绍文本2:置文本(format("#X/部位条件： %s", 取符石部位(self.装备.星位.部位)))
        self.介绍文本2:置文本(format("#X/%s", 取符石组合说明(self.装备.星位.组合, self.装备.星位.组合等级)))
    end
end


-- function 符石镶嵌:符石预览()
--   self.选中符石=nil
--   self.选中星石=nil
--   self.不可替换=nil
--   -- 发送数据(3699)
--   self.介绍文本:清空()
--   self.介绍文本2:清空()
--   self.介绍文本2:置文本(format("#Y/"..self.装备.名称))
--   self.介绍文本2:置文本(format("#G/开运孔数：%s",self.装备.开运孔数.当前.."孔/"..self.装备.开运孔数.上限.."孔"))
--   local 物品表 = {}
--   local 等级计算 = 0
--   for i=1,5 do
--       if self.临时符石[i]~=nil then
--         -- print(11111111)
--         -- table.print(self.临时符石[i])
--           物品表[i]={}
--           物品表[i].颜色=self.临时符石[i].颜色
--           等级计算 = 等级计算 + self.临时符石[i].子类
--           local  组合语句="#G符石："
--           local 计数 = 1
--           for k,v in pairs(self.临时符石[i].符石属性) do
--               if 计数 == 1 then
--                   组合语句=组合语句..k.." +"..v.." "
--               else
--                   组合语句=组合语句..k.." +"..v
--               end
--               计数=计数+1
--           end
--           self.介绍文本2:置文本(组合语句)
--       end
--   end
--   if self.装备.星位组 then
--     if self.装备.星位~=nil and self.临时符石[6] ~= nil then
--       -- table.print(self.临时符石[6])
--     --     local 临时属性 = ""
--     --     for k,v in pairs(self.临时符石[6].符石属性) do
--     --         临时属性 = k.." +"..v
--     --     end
--     --     self.介绍文本2:置文本("#G/星位: "..临时属性)
--     --     if 等级计算~=0 then
--     --         if 等级计算%2==0 then
--     --             if self.临时符石[6].阴阳==2 then
--     --                  self.介绍文本2:置文本("#G/星相互合: "..取星位相互(self.装备.分类).." +2")
--     --             end
--     --         else
--     --             if self.临时符石[6].阴阳==1 then
--     --                 self.介绍文本2:置文本("#G/星相互合: "..取星位相互(self.装备.分类).." +2")
--     --             end
--     --         end
--     --     end
--     -- else
--         self.介绍文本2:置文本("#G/星位: 已开")
--     end
--   end
--   local 临时组合 = 取星位组合(物品表)
--   if 临时组合~=nil then
--     self.介绍文本2:置文本(format("#X/符石组合： %s",临时组合.组合))
--     self.介绍文本2:置文本(format("#X/门派条件： %s",临时组合.门派 or "无"))
--     self.介绍文本2:置文本(format("#X/部位条件： %s",取符石部位(临时组合.部位)))
--     self.介绍文本2:置文本(format("#X/%s",取符石组合说明(临时组合.组合,临时组合.等级)))
--   end
-- end
function 符石镶嵌:符石预览()
  self.选中符石=nil
  self.选中星石=nil
  self.不可替换=nil
  -- 发送数据(3699)
  self.介绍文本:清空()
  self.介绍文本2:清空()
  self.介绍文本2:置文本(format("#Y/"..self.装备.名称))
  self.介绍文本2:置文本(format("#G/开运孔数：%s",self.装备.开运孔数.当前.."孔/"..self.装备.开运孔数.上限.."孔"))
  local 物品表 = {}
  local 等级计算 = 0
  for i=1,5 do
      if self.临时符石[i]~=nil then
          物品表[i]={}
          物品表[i].颜色=self.临时符石[i].颜色
          等级计算 = 等级计算 + self.临时符石[i].子类
          local  组合语句="#G符石："
          local 计数 = 1
          for k,v in pairs(self.临时符石[i].符石属性) do
              if 计数 == 1 then
                  组合语句=组合语句..k.." +"..v.." "
              else
                  组合语句=组合语句..k.." +"..v
              end
              计数=计数+1
          end
          self.介绍文本2:置文本(组合语句)
      end
  end
  -- 星石部分，只有当星位组存在时才显示
  if self.装备.星位组 then
    if self.临时符石[6] ~= nil then
      -- 如果有星石，显示星石属性
      local 临时属性 = ""
      for k,v in pairs(self.临时符石[6].符石属性) do
          临时属性 = k.." +"..v
      end
      self.介绍文本2:置文本("#G/星位: "..临时属性)
      -- 星相互合的计算
      if 等级计算~=0 then
          if 等级计算%2==0 then
              if self.临时符石[6].阴阳==2 then
                   self.介绍文本2:置文本("#G/星相互合: "..取星位相互(self.装备.分类).." +2")
              end
          else
              if self.临时符石[6].阴阳==1 then
                  self.介绍文本2:置文本("#G/星相互合: "..取星位相互(self.装备.分类).." +2")
              end
          end
      end
    else
        self.介绍文本2:置文本("#G/星位: 已开")
    end
  else
      self.介绍文本2:置文本("#G/星位: 未开孔")
  end
  local 临时组合 = 取星位组合(物品表)
  if 临时组合~=nil then
    self.介绍文本2:置文本(format("#X/符石组合： %s",临时组合.组合))
    self.介绍文本2:置文本(format("#X/门派条件： %s",临时组合.门派 or "无"))
    self.介绍文本2:置文本(format("#X/部位条件： %s",取符石部位(临时组合.部位)))
    self.介绍文本2:置文本(format("#X/%s",取符石组合说明(临时组合.组合,临时组合.等级)))
  end
end

function 符石镶嵌:新增符石(dj,djwz,lx) --符石道具选择["道具"][xuanz], xuanz)
  -- table.print(self.临时符石)
  if lx=="符石" then
    if self.临时符石[self.选中符石] then
      for i=1,5 do
        if self.临时符石[i]~=nil and self.临时符石[i].wz==djwz then --判断和道具位置是否一致
          self.临时符石[i]=self.装备.星位[i]
          self.临时符石[i].wz=nil
          if self.装备.星位[i] then
            -- print(self.选中符石,i)
            local wwewq1 = __物品格子["创建"](当前)
            -- table.print(self.装备.星位[i])
            wwewq1:取数据(self.装备.星位[i])
            -- table.print(wwewq1)
            self.临时符石[i].子类=wwewq1.物品.子类
            self.临时符石[i].颜色=wwewq1.物品.颜色
            self.临时符石[i].符石属性=wwewq1.物品.符石属性
            self.发送数据[i]=nil
            break
          end
        end
      end
    end
    self.临时符石[self.选中符石]=dj
    self.临时符石[self.选中符石].wz=djwz
    self.发送数据[self.选中符石]={背包类型="道具",物品id=djwz,方式="镶嵌"}
    -- table.print( self.临时符石)
    self:按钮逻辑()
    self:符石预览()
    self.符石网格:置物品(self.临时符石)
  elseif lx=="星石" then
    if dj.名称=="未激活的星石" then
      多开数据[当前].__UI弹出["提示框"]:打开("#Y/该星石尚为激活不能镶嵌")
      return
    end
    if dj.子类 == self.装备.分类 then
      self.临时符石[6]=dj
      self.临时符石[6].wz=djwz
      -- local wwewq1 = __物品格子["创建"]()
      --       -- table.print(self.装备.星位[i])
      --       wwewq1:取数据(self.装备.星位[6])
      --       -- table.pr6nt(wwewq1)
      --       self.临时符石[6].子类=wwewq1.物品.子类
      --       self.临时符石[6].颜色=wwewq1.物品.颜色
      --       self.临时符石[6].符石属性=wwewq1.物品.符石属性
      self.发送数据[6]={背包类型="道具",物品id=djwz,方式="镶嵌"}
      self:按钮逻辑()
      self:符石预览()
      self.星石网格:置物品(self.临时符石[6])
    else
      多开数据[当前].__UI弹出["提示框"]:打开("#Y/这个装备不可以镶嵌这个星石")
    end
  end
end

function 符石镶嵌:按钮逻辑()
  if not 判断是否为空表(self.发送数据) then
      self.可镶嵌 = true
      self.可清空 = true
      self.镶嵌:置禁止(false)
      self.还原:置禁止(false)
      if self.发送数据[6] then
        self.翻转星石:置可见(false)
      end
  else
      self.可镶嵌 = false
      self.可清空 = false
      self.镶嵌:置禁止(true)
      self.还原:置禁止(true)
      if self.装备.星位 and self.装备.星位[6] then
        self.翻转星石:置可见(true)
      end
  end
end







function 符石镶嵌:装备展示(data)
  local nsf = require("SDL.图像")(726, 484)
  if ItemData[data] then 
    local ziyuan=ItemData[data].wp_13
    if nsf["渲染开始"](nsf) then
      local gezi=__res:getPNGCC(3, 132, 506, 55, 55)
      for i = 1, self.装备.开运孔数.当前 do
        gezi:显示(25-15+(i)*70-55,355-23+50)
      end
      
      -- 关键修复：根据当前装备的星位组和星石数据显示，不依赖旧数据
      if self.装备.星位组 then  -- 仅当前装备有星位组才显示星石格子
        字体18["置颜色"](字体18, __取颜色("黄色"))
        if self.装备.星位 and self.装备.星位[6] ~= nil then
          字体18["取图像"](字体18, "星石："):显示(25-15+(3)*70-55-60,355-23-12+15)
          gezi:显示(25-15+(3)*70-55,355-23-12)
        else
          字体18["取图像"](字体18, "星石： 已开"):显示(25-15+(3)*70-55-60,355-23-12+15)
          gezi:显示(25-15+(3)*70-55,355-23-12)
        end
      else  -- 无星位组，显示未开孔
        字体18["置颜色"](字体18, __取颜色("黄色"))
        字体18["取图像"](字体18, "星石，未开孔"):显示(25-15+(3)*70-55-60,355-23-12+15)
      end
      
      __res["取图像"](__res, __res["取地址"](__res, "shape/dj/", ziyuan))["显示"](__res["取图像"](__res, __res["取地址"](__res, "shape/dj/", ziyuan)), 26, 119)
    end
    self.图像 = nsf["到精灵"](nsf)
  end
end


local 符石网格 = 符石镶嵌["创建网格"](符石镶嵌, "符石网格", 25, 356-23+50, 370, 55)

function 符石网格:左键弹起(x, y, a, b, msg)
  if self.子控件[a]._spr then
    if 符石镶嵌["选中符石"] then
      self.子控件[符石镶嵌["选中符石"]]._spr["确定"] = nil
    end
    符石镶嵌["选中符石"] = a
    self.子控件[a]._spr["确定"] = true
    if self.子控件[a]._spr["物品"] then
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 10, 0, w, h, "无操作", a)
    end
  end
  if 符石镶嵌["选中星石"] and 符石镶嵌.星石网格.子控件[符石镶嵌["选中星石"]]._spr then
    符石镶嵌.星石网格.子控件[符石镶嵌["选中星石"]]._spr["确定"] = nil
  end
  符石镶嵌["选中星石"]=nil
end

function 符石网格:置物品(fushi, bh, pid)
  for i = 1, #self.子控件 do
    -- if fushi[i] then
      local lssj = __材料格子["创建"](当前)
      lssj:置物品(fushi[i], "符石")
      self.子控件[i]["置精灵"](self.子控件[i], lssj)
  end
end

local 星石网格 = 符石镶嵌["创建网格"](符石镶嵌, "星石网格", 25+210-74+5, 356-23+50-72+12-3, 370, 55)
function 星石网格:初始化()
  self:创建格子(55, 55, 0, 15, 1, 1)
end
function 星石网格:左键弹起(x, y, a, b, msg)
  if 符石镶嵌["选中符石"] and 符石镶嵌.符石网格.子控件[符石镶嵌["选中符石"]] and 符石镶嵌.符石网格.子控件[符石镶嵌["选中符石"]]._spr then
    符石镶嵌.符石网格.子控件[符石镶嵌["选中符石"]]._spr["确定"] = nil
  end
  符石镶嵌["选中符石"]=nil
  符石镶嵌["选中星石"]=a
  if self.子控件[a]._spr then
    self.子控件[a]._spr["确定"] = true
    if self.子控件[a]._spr["物品"] then
      self.子控件[a]._spr["详情打开"](self.子控件[a]._spr, 10, 0, w, h, "无操作", a)
    end
  end
end

function 星石网格:置物品(xingshi, bh, pid)
  local lssj = __材料格子["创建"](当前)
  -- table.print(xingshi)
  lssj:置物品(xingshi, "符石")
  self.子控件[1]["置精灵"](self.子控件[1], lssj)
end


for i, v in ipairs({
  {
    name = "镶嵌",
    x = 114-102,
    y = 457,
    tcp = __res:getPNGCC(3, 536, 345, 126, 43, true)["拉伸"](__res:getPNGCC(3, 536, 345, 126, 43, true), 115, 43),
    font = "镶嵌"
  },
  {
    name = "还原",
    x = 263-126,
    y = 457,
    tcp = __res:getPNGCC(3, 536, 345, 126, 43, true)["拉伸"](__res:getPNGCC(3, 536, 345, 126, 43, true), 115, 43),
    font = "还原"
  },
  {
    name = "添加符石",
    x = 263,
    y = 457,
    tcp = __res:getPNGCC(3, 126, 563, 111, 36, true)["拉伸"](__res:getPNGCC(3, 126, 563, 111, 36, true), 115, 43),
    font = "添加符石"
  },
  {
    name = "翻转星石",
    x = 263-24,
    y = 457-165+34,
    tcp = __res:getPNGCC(3, 126, 563, 111, 36, true)["拉伸"](__res:getPNGCC(3, 126, 563, 111, 36, true), 115, 43),
    font = "翻转星石"
  },
}) do
  local 临时函数 = 符石镶嵌["创建我的按钮"](符石镶嵌, v.tcp, v.name, v.x, v.y, v.font)
 function  临时函数:左键弹起(x, y)
    if v.name == "添加符石" then
      if 符石镶嵌["选中符石"] then 
        多开数据[当前].__UI弹出["符石道具选择"]:打开("符石", 符石镶嵌["选中符石"])
      elseif 符石镶嵌["选中星石"] then 
        多开数据[当前].__UI弹出["符石道具选择"]:打开("星石", 符石镶嵌["选中星石"])
      else
        符石镶嵌["选中符石"]=1
        多开数据[当前].__UI弹出["符石道具选择"]:打开("符石", 符石镶嵌["选中符石"])
      end
    elseif v.name == "还原" then
      符石镶嵌:刷新符石(符石镶嵌.装备)
      符石镶嵌:按钮逻辑()
    elseif v.name == "镶嵌" then
      发送数据(当前 or self and self.当前,3801,{内容=符石镶嵌.发送数据})
      符石镶嵌.发送数据={}
      符石镶嵌:按钮逻辑()
    elseif v.name == "翻转星石" then
      发送数据(当前 or self and self.当前,3802)
    end
  end
end




local 介绍文本 = 符石镶嵌["创建文本"](符石镶嵌, "介绍文本", 170, 69, 206, 220)
function 介绍文本:初始化()
end

local 介绍文本2 = 符石镶嵌["创建文本"](符石镶嵌, "介绍文本2", 170, 69, 206, 220)
function 介绍文本2:初始化()
end