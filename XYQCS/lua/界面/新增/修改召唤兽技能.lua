local 召唤兽技能修改窗口 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("召唤兽技能修改窗口", 0+40, 0, 770, 420)
local 当前=多开数据.当前

function 召唤兽技能修改窗口:初始化()
  self.背景=置窗口背景("召唤兽技能修改", 0, 12, 760, 410, true)
  self.lssj = 取输入背景(0, 0, 95, 23)
  self.召唤兽信息 = nil
  self.技能列表 = {}
  self.技能输入框 = {} 
  self.允许移动=true
  for i=1,36 do
    local 行 = math.floor((i-1) / 6)
    local 列 = (i-1) % 6
    local x = 20 + 列 * 120
    local y = 145 + 行 * 35
    local 技能输入框 = self:创建输入("技能"..i.."输5", x + 22, y + 2, 85, 23)
    function 技能输入框:初始化()
      self:取光标精灵()
      self:置限制字数(20)
      self:置颜色(0,0,0,255)
      self:置文本("")
      self:置可见(false)  
    end
    技能输入框:初始化()
    self.技能输入框[i] = 技能输入框
    self["技能"..i.."输5"] = 技能输入框  
  end
  self.保存按钮 = self:创建我的按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(100,40), "保存技能", 50, 60, "保存修改")
  function self.保存按钮:左键弹起(x, y, msg)
    if not 召唤兽技能修改窗口.角色ID or not 召唤兽技能修改窗口.召唤兽编号 then
      多开数据[当前].__UI界面.窗口层.文本栏.打开(多开数据[当前].__UI界面.窗口层.文本栏, '缺少角色ID或召唤兽编号', 285, 155, 390, 200)
      return
    end
    local 新技能列表 = {}
    for i=1,36 do 
      local 输入框 = 召唤兽技能修改窗口["技能"..i.."输5"]
      if 输入框 then
        local 技能名 = 输入框:取文本()
        if 技能名 ~= "" then
          table.insert(新技能列表, 技能名)
        end
      end
    end
    if #新技能列表 == 0 then
      多开数据[当前].__UI界面.窗口层.文本栏.打开(多开数据[当前].__UI界面.窗口层.文本栏, '技能列表不能为空', 285, 155, 390, 200)
      return
    end
    local 发送的数据 = {  
      id = 召唤兽技能修改窗口.角色ID,
      编号 = 召唤兽技能修改窗口.召唤兽编号,
      技能 = 新技能列表
    }
    
    local 事件 = function()
      发送数据(当前, 7214, 发送的数据)  
      召唤兽技能修改窗口:置可见(false)
    end
    
    local 技能文本 = ""
    for i=1,#新技能列表 do
      技能文本 = 技能文本 .. i .. "." .. 新技能列表[i] .. "  "
      if i % 3 == 0 then
        技能文本 = 技能文本 .. "\n"
      end
    end
    
    local 提示文字 = "确定要修改召唤兽["..召唤兽技能修改窗口.召唤兽编号.."]的技能吗？\n\n新技能列表：\n"..技能文本
    多开数据[当前].__UI界面.窗口层.文本栏.打开(多开数据[当前].__UI界面.窗口层.文本栏, 提示文字, 285, 155, 450, 250, 事件)
  end
 
  self.关闭按钮 = self:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭技能窗口", 646, 0)
  function self.关闭按钮:左键弹起(x, y, msg)
    召唤兽技能修改窗口:置可见(false)
  end
end
function 召唤兽技能修改窗口:打开(召唤兽信息, 角色ID, 召唤兽编号)
  self:置可见(true)
  self.召唤兽信息 = 召唤兽信息
  self.角色ID = 角色ID
  self.召唤兽编号 = 召唤兽编号
  self.技能列表 = {}
  if 召唤兽信息.技能 then
    for i=1,#召唤兽信息.技能 do
      if 召唤兽信息.技能[i] ~= "" then
        table.insert(self.技能列表, 召唤兽信息.技能[i])
      end
    end
  end
  
  self.保存按钮:置坐标(self.宽度//2-100, self.高度-60)
  self.关闭按钮:置坐标(self.宽度-46, 0)
  self.保存按钮:置可见(true)
  self.关闭按钮:置可见(true)
  self:重刷界面()
end

function 召唤兽技能修改窗口:重刷界面()
  local nsf = require("SDL.图像")(self.宽度, self.高度)
  if nsf:渲染开始() then
    self.背景:显示(0, 0)
    字体18:置颜色(212,195,13, 255)
    字体18:取图像("角色ID:"):显示(20, 60)
    字体18:取图像(self.角色ID or ""):显示(100, 60)
    
    字体18:取图像("召唤兽:"):显示(20, 90)
    字体18:取图像(self.召唤兽信息 and self.召唤兽信息.名称 or ""):显示(100, 90)
    for i=1,36 do
      local 行 = math.floor((i-1) / 6)
      local 列 = (i-1) % 6
      local x = 15 + 列 * 120
      local y = 145 + 行 * 35
      字体18:取图像(tostring(i)..":"):显示(x, y)
      self.lssj:显示(x + 20, y - 1)
      local 输入框 = self["技能"..i.."输5"]
      if 输入框 then
        if i <= #self.技能列表 then
          输入框:置文本(self.技能列表[i] or "")
        else
          输入框:置文本("") 
        end
        输入框:置可见(true)
      end
    end
    
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
end