多开数据[多开数据.当前].__UI弹出.道具助战详情 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("道具助战详情",0,0,295+68,400)
local 道具助战详情 = 多开数据[多开数据.当前].__UI弹出.道具助战详情
local 当前 = 多开数据.当前
function 道具助战详情:初始化()
end
function 道具助战详情:左键弹起()
  self:置可见(false)
end
function 道具助战详情:打开(数据, x, y, w, h, Button, Button2, Button3, Button4, bh, lx)
  self.pid = bh
  self.lx = lx
  -- print(x,引擎.宽度-295+68)
  if x>引擎.宽度-295-190+60 then
    x=引擎.宽度-295-190 +60
  end
  self.数据 = 数据
  if self.数据 then
    道具助战详情["置坐标"](道具助战详情, x + abbr.py.x+68, y + abbr.py.y)
    local nsf = require("SDL.图像")(295+68, 400)
    if nsf["渲染开始"](nsf) then
      取黑透明背景(0, 0, 290, 390, true):置透明(230):显示(68, 0)
      self.小模型 = __res:getPNGCC(3, 132, 506, 55, 55):显示(13+68,13)--["到精灵"]((__res:getPNGCC(3, 132, 506, 55, 55)))

      local 目录="shape/dj/"
      -- if 锦衣文件完整 and 数据.资源 and (数据.资源=="r3d.dll" or 数据.资源=="nx3d5.dll" or 数据.资源=="nx3d6.dll") then
      --   目录="shape/sys/"
      -- end
      if 数据.颜色区分 then
        __res["取图像"](__res, __res["取地址"](__res, 目录, 数据["小模型资源"])):置颜色(检查是否有物品颜色(数据.属性)):显示(15+68, 15)
      else
        __res["取图像"](__res, __res["取地址"](__res, 目录, 数据["小模型资源"]))["显示"](__res["取图像"](__res, __res["取地址"](__res, 目录, 数据["小模型资源"])), 15+68, 15)
      end
      -- __res["取图像"](__res, __res["取地址"](__res, 目录, 数据["小模型资源"]))["显示"](__res["取图像"](__res, __res["取地址"](__res, 目录, 数据["小模型资源"])), 15+68, 15)
      字体20["置颜色"](字体20, __取颜色("黄色"))
      字体20:取图像(数据.名称):显示(15+68+67, 18)
      nsf["渲染结束"](nsf)
    end
    道具助战详情["置精灵"](道具助战详情, nsf["到精灵"](nsf))
  else
    local nsf = require("SDL.图像")(295+68, 400)
    if nsf["渲染开始"](nsf) then
      取黑透明背景(0, 0, 290, 390, true):显示(0+68, 0)
      nsf["渲染结束"](nsf)
    end
    道具助战详情["置精灵"](道具助战详情, nsf["到精灵"](nsf))
  end
  __道具提示(self.数据,道具助战详情.道具文本)
  local Buttontable = {
    ["使用"] = false,
    ["卸下"] = false,
    -- ["移动"] = false,
    -- ["丢弃"] = false,
    -- ["取出"] = false,
    -- ["存入"] = false,
    -- ["符石"] = false
  }
  -- print(Button,Button2,Button3,Button4)
  local yy={307+30,267+30,227+30,187+30}
  if Button then
    if Button =="丢弃" then
      道具助战详情[Button]["置坐标"](道具助战详情[Button], 3+13+8, 227+100+8)
    elseif Button =="使用" then
      道具助战详情[Button]["置坐标"](道具助战详情[Button], 10+65+155, 307+30)
    else
      道具助战详情[Button]["置坐标"](道具助战详情[Button], 10+73, yy[1])
      table.remove(yy,1)
    end
    道具助战详情[Button]["置可见"](道具助战详情[Button], true)
    Buttontable[Button] = true
  end
  if Button2 then
    if Button2 =="丢弃" then
      道具助战详情[Button2]["置坐标"](道具助战详情[Button2], 3+13+8, 227+100+8)
    elseif Button2 =="使用" then
      道具助战详情[Button2]["置坐标"](道具助战详情[Button2], 10+65+155, 307+30)
    else
      道具助战详情[Button2]["置坐标"](道具助战详情[Button2], 10+73, yy[1])
      table.remove(yy,1)
    end
    道具助战详情[Button2]["置可见"](道具助战详情[Button2], true)
    Buttontable[Button2] = true
  end
  if Button3 then
    if Button3 =="丢弃" then
      道具助战详情[Button3]["置坐标"](道具助战详情[Button3], 3+13+8, 227+100+8)
    elseif Button3 =="使用" then
      道具助战详情[Button3]["置坐标"](道具助战详情[Button3], 10+65+155, 307+30)
    else
      道具助战详情[Button3]["置坐标"](道具助战详情[Button3], 10+73, yy[1])
      table.remove(yy,1)
    end
    道具助战详情[Button3]["置可见"](道具助战详情[Button3], true)
    Buttontable[Button3] = true
  end
  if Button4 then
    if Button4 =="丢弃" then
      道具助战详情[Button4]["置坐标"](道具助战详情[Button4], 3+13+8, 227+100+8)
    elseif Button4 =="使用" then
      道具助战详情[Button4]["置坐标"](道具助战详情[Button4], 10+65+155, 307+30)
    else
      道具助战详情[Button4]["置坐标"](道具助战详情[Button4], 10+73, yy[1])
      table.remove(yy,1)
    end
    道具助战详情[Button4]["置可见"](道具助战详情[Button4], true)
    Buttontable[Button4] = true
  end
  if #yy<=2 then
    道具助战详情.道具文本:置宽高(256, 310-38-55)
  else
    道具助战详情.道具文本:置宽高(256, 310-55)
  end
  for k, v in pairs(Buttontable) do
    if false == v then
      道具助战详情[k]["置可见"](道具助战详情[k], false)
    -- elseif k=="符石" then
    --   道具助战详情.道具文本:置宽高(256, 310-38)
    end
  end
end

local 使用 = 道具助战详情:创建我的按钮(__res:getPNGCC(3, 126, 563, 111, 36, true), "使用", 0, 0, "使用"):置可见(false)
function 使用:左键弹起(x, y, msg)
  local 道具分页递增序列=(多开数据[当前].__UI界面["窗口层"]["助战道具栏"].分页状态-1)*20
  local lx2
  if 2 == 道具助战详情["数据"]["总类"] then
    if 道具助战详情["数据"].分类 <= 19 then
      发送数据(当前 or self and self.当前,2014,{角色="主角",道具=道具助战详情.pid+道具分页递增序列,助战编号=多开数据[当前].__UI界面["窗口层"]["助战道具栏"].助战编号})
    end
  elseif 道具助战详情["数据"].总类 == 30 and 道具助战详情["数据"].分类 == 1 then
      发送数据(当前 or self and self.当前,2013,{角色="主角",编号=道具助战详情.pid+道具分页递增序列,助战编号=多开数据[当前].__UI界面["窗口层"]["助战道具栏"].助战编号})
  else
    if 道具助战详情["数据"].总类=="可使用" or ((道具助战详情["数据"].分类 <=12 or 道具助战详情["数据"].总类==144) and 道具助战详情["数据"].总类~=2) then
      发送数据(当前 or self and self.当前,2013,{编号=道具助战详情.pid+道具分页递增序列,序列=多开数据[当前].__UI界面["窗口层"]["助战道具栏"]["选中召唤兽"],助战编号=多开数据[当前].__UI界面["窗口层"]["助战道具栏"].助战编号})
    end
  end
  道具助战详情["置可见"](道具助战详情, false)
end
local 卸下 = 道具助战详情:创建我的按钮(__res:getPNGCC(3, 126, 563, 111, 36, true), "卸下", 0, 0, "卸下"):置可见(false)
function 卸下:左键弹起(x, y, msg)
  if 多开数据[当前].__UI界面["窗口层"]["助战道具栏"]["是否可见"] then
    if 道具助战详情.lx == "装备" and 道具助战详情["数据"]["分类"] <= 6 then
      发送数据(当前 or self and self.当前,2015,{角色="主角",道具=道具助战详情.pid,助战编号=多开数据[当前].__UI界面["窗口层"]["助战道具栏"].助战编号})
    elseif 道具助战详情.lx == "锦衣" and 道具助战详情["数据"]["分类"] >= 14 and 道具助战详情["数据"]["分类"] <= 19 then
      发送数据(当前 or self and self.当前,2015,{角色="主角",道具=道具助战详情.pid,锦衣=true,助战编号=多开数据[当前].__UI界面["窗口层"]["助战道具栏"].助战编号})
    elseif 道具助战详情.lx == "灵饰" and 道具助战详情["数据"]["分类"] >= 10 and 道具助战详情["数据"]["分类"] <= 13 then
      发送数据(当前 or self and self.当前,2015,{角色="主角",道具=道具助战详情.pid,灵饰=true,助战编号=多开数据[当前].__UI界面["窗口层"]["助战道具栏"].助战编号})
    end
  end
  道具助战详情["置可见"](道具助战详情, false)
end


local 道具文本 = 道具助战详情["创建文本"](道具助战详情, "道具文本", 15+68, 18+55, 256, 230)---38
function 道具文本:初始化()
  self:置文字(字体17)
end
