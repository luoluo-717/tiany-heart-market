local 基类 = require("界面/控件层/基类/物品基类")
local 物品助战格子 = class("物品助战格子", 基类)
function 物品助战格子:初始化(当前)
  self.py = {x = 0, y = 0}
  self.物品禁止 = false
  self.物品遮罩 =__res:getPNGCC(3, 132, 506, 55, 55) 
  self.物品遮罩1 =__res:getPNGCC(7, 938, 112, 50, 50):拉伸(53, 53)
  self.当前 = 当前

end

function 物品助战格子:置物品(数据, 背景, 类型,huise,子类描述)
  self.物品 = nil
  self.确定 = nil
  self.物品禁止 = false
  if 数据 and 0 ~= 数据["名称"] then
    self:取数据(数据)
    local nsf = require("SDL.图像")(55, 55)
    if nsf["渲染开始"](nsf) then
      if "白格子" == 背景 then
        __res:getPNGCC(3, 132, 506, 55, 55)["显示"](__res:getPNGCC(3, 132, 506, 55, 55), 0, 0)
      end
      -- table.print(self.物品)
     -- print(类型)
      if 类型=="装备" then
        self.物品遮罩:显示(0,1)
      elseif 类型=="助战装备" then
        self.物品遮罩1:显示(0,1)
      end
      local 目录="shape/dj/"
      -- if 锦衣文件完整 and self.物品.资源 and (self.物品.资源=="r3d.dll" or self.物品.资源=="nx3d5.dll" or self.物品.资源=="nx3d6.dll") then
      --   目录="shape/sys/"
      -- end
      if 类型=="无需显示数量" or 类型=="无需显示数量11" then
        if huise or self.物品.回合 then
          __res:取图像(__res:取地址(目录, self.物品["小模型资源"])):到灰度():显示(0, 0)
        else
          if self.物品.颜色区分 then
            __res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"])):置颜色(检查是否有物品颜色(self.物品.属性)):显示(0, 0)
          else
            __res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"]))["显示"](__res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"])), 0, 0)
          end
         -- __res:取图像(__res:取地址(目录, self.物品["小模型资源"])):显示(0, 0)
        end
      else
        if self.物品.回合 then
          __res:取图像(__res:取地址(目录, self.物品["小模型资源"])):到灰度():显示(0, 0)
        else
          -- print(self.物品.名称)
          -- __res:取图像(__res:取地址(目录, self.物品["小模型资源"])):显示(0, 0)
          if self.物品.颜色区分 then
            __res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"])):置颜色(检查是否有物品颜色(self.物品.属性)):显示(0, 0)
          else
            __res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"]))["显示"](__res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"])), 0, 0)
          end
        end
        -- __res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"]))["显示"](__res["取图像"](__res, __res["取地址"](__res, 目录, self.物品["小模型资源"])), 0, 0)
        if self.物品["数量"] then
          置轮廓文字(字体18,self.物品["数量"],"黑色","白色",0, -4)
          -- 字体18["置颜色"](字体18, __取颜色("白色"))
          -- 字体18["取描边图像"](字体18, self.物品["数量"])["显示"](字体18["取描边图像"](字体18, self.物品["数量"]), 0, -5)
        end
      end
      if 子类描述 then
        local xq=""
        if self.物品.名称=="魔兽要诀" or self.物品.名称=="高级魔兽要诀"  then
          xq=取兽决缩写(self.物品.附带技能)
        elseif self.物品.名称=="召唤兽内丹" or self.物品.名称=="高级召唤兽内丹" or self.物品.名称=="点化石" then
          if self.物品.特效 then
            xq=self.物品.特效
          end
        end
        if xq~="" then
          __res:getPNGCC(4, 716, 322, 55, 19):显示(0, 45+2-9)
          字体14["置颜色"](字体14, __取颜色("黄色"))
          local tsf = 字体14["取图像"](字体14, xq)
          tsf["显示"](tsf, (55 - tsf["宽度"]) // 2-0, 31+15+2-9)
        end
      elseif self.物品.碎片 then
        __res:getPNGCC(4, 716, 322, 55, 19):显示(0, 45+2-9)
        字体14["置颜色"](字体14, __取颜色("黄色"))
        local tsf = 字体14["取图像"](字体14, "碎片")
        tsf["显示"](tsf, (55 - tsf["宽度"]) // 2-0, 31+15+2-9)
      end
     
      nsf["渲染结束"](nsf)
    end
    self.小模型 = nsf["到精灵"](nsf)
  elseif "白格子" == 背景 then
    self.小模型 = __res:getPNGCC(3, 132, 506, 55, 55)["到精灵"]((__res:getPNGCC(3, 132, 506, 55, 55)))
  end
  self.格子类型 = 类型
end
function 物品助战格子:详情打开(x, y, w, h, lx, bh,助战编号)
  local Button, Button2, Button3, Button4
  
  if "装备" == lx or "灵饰" == lx or "锦衣" == lx then
    Button = "卸下"
  elseif "道具" == lx then
    -- if 2 == self.物品["总类"] and self.物品["分类"] <= 19 then
      Button = "使用"
    -- elseif self.物品.名称=="120无级别礼包" then
      -- Button = "使用"
    -- elseif "坐骑礼包" == self.物品["总类"] or self.物品.总类=="装备礼包" then 
      -- Button = "使用"
    -- end
  end

  多开数据[当前 or self and self.当前].__UI弹出["道具助战详情"]["置可见"](多开数据[当前 or self and self.当前].__UI弹出["道具助战详情"], true, true)
  多开数据[当前 or self and self.当前].__UI弹出["道具助战详情"]["道具文本"]["清空"](多开数据[当前 or self and self.当前].__UI弹出["道具助战详情"]["道具文本"])
  if self.物品禁止 then
    多开数据[当前 or self and self.当前].__UI弹出["道具助战详情"]:打开(self.物品, x-65, y, 360, 360, nil, nil, nil, nil, bh, lx)
  else
    多开数据[当前 or self and self.当前].__UI弹出["道具助战详情"]:打开(self.物品, x-65, y, 360, 360, Button, nil, nil, nil, bh, lx)
  end

 
end
function 物品助战格子:置偏移(x, y)
  self.py = {x = x, y = x}
end
local leixing={道具行囊=1,道具仓库=1,伙伴详情=1,道具选择=1,临时背包=1,附魔宝珠=1,宝宝进阶=1}
function 物品助战格子:显示(x, y)
  if self.小模型 then
    self.小模型["显示"](self.小模型, x + self.py.x, y + self.py.y)
  end
  if self.确定  then
    多开数据[多开数据.当前].__主控["道具选中大"]["显示"](多开数据[多开数据.当前].__主控["道具选中大"], x, y)
  end
  if self.物品禁止 then
    多开数据[多开数据.当前].__主控["物品助战格子禁止"]["显示"](多开数据[多开数据.当前].__主控["物品助战格子禁止"], x + 13, y + 13)
  end
  if self.物品 and self.物品.回合 then
   -- print(self.物品.回合)
    local 数量=string.len(tostring(self.物品.回合))
    for i=1,数量 do
      local 序列=string.sub(self.物品.回合,i,i)+1
      --print(序列)
      if 多开数据[多开数据.当前].__主控["战斗文字"][1][序列]~=nil then
        多开数据[多开数据.当前].__主控["战斗文字"][1][序列]:显示(x + self.py.x+数量*2-数量*1.5+20,y + self.py.y+20)
      end
    end
  end
end
return 物品助战格子
