多开数据[多开数据.当前].__UI弹出.双斧转换选择 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("双斧转换选择", 0, 0, 400, 400)
local 双斧转换选择 = 多开数据[多开数据.当前].__UI弹出.双斧转换选择
local 当前 = 多开数据.当前

function 双斧转换选择:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(400, 400)
    if nsf:渲染开始() then
        取黑透明背景(0, 0, 400, 400, true):显示(0, 0)
        __res:getPNGCC(3, 694, 4, 338, 273):显示(30, 30)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中道具 = nil
end

function 双斧转换选择:打开(目标窗口)
    self:置可见(true)
    self.目标窗口 = 目标窗口  -- 存储双斧转换类的引用
    if self.页 == nil then
        self.页 = 1
    else
        self.页 = 双斧转换选择.页
    end
    for i = 1, 4 do
        if self.页 == i then
            self.扩展格子["包裹" .. i]:置选中(true)
        end
    end

    for i = 1, 4 do
        双斧转换选择.扩展格子["包裹" .. i]:置可见(true)
    end
    self.道具网格:置物品(多开数据[当前].__主控.道具列表)
end
local 扩展格子 = 双斧转换选择:创建控件("扩展格子", 40, 350, 320, 40)
for i, v in ipairs({
    { name = '包裹1', x = 5, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), 
      tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "1" },
    { name = '包裹2', x = 80, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), 
      tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "2" },
    { name = '包裹3', x = 155, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), 
      tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "3" },
    { name = '包裹4', x = 230, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), 
      tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "4" },
}) do
    local 临时函数 = 扩展格子:创建我的单选按钮(v.tcp, v.tcp1, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '包裹1' then
            双斧转换选择.页 = 1
            双斧转换选择.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹2' then
            双斧转换选择.页 = 2
            双斧转换选择.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹3' then
            双斧转换选择.页 = 3
            双斧转换选择.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹4' then
            双斧转换选择.页 = 4
            双斧转换选择.道具网格:置物品(多开数据[当前].__主控.道具列表)
        end
    end
end
local 道具网格 = 双斧转换选择:创建网格("道具网格", 30, 30, 340, 300)

function 道具网格:初始化()
    self:创建格子(67, 67, 0, 0, 4, 5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and not self.子控件[a]._spr.物品禁止 and self.子控件[a]._spr.物品 then
        local 道具格子 = self.子控件[a].真实编号 or a
        local 物品信息 = self.子控件[a]._spr.物品
        if 物品信息.总类 == 2 and (物品信息.分类 == 3 or 物品信息.分类 == 4) then
            if 双斧转换选择.目标窗口 then
                双斧转换选择.目标窗口["选中道具"] = 道具格子
                双斧转换选择.目标窗口["材料网格"]["置物品"](双斧转换选择.目标窗口["材料网格"], 物品信息, 1, 道具格子)
                双斧转换选择.目标窗口["重置"](双斧转换选择.目标窗口)
            end
            双斧转换选择:置可见(false)
        else
            多开数据[当前].__UI弹出.提示框:打开("#Y请选择双斧类装备！")
        end
    end
end

function 道具网格:置物品(data, zl, fl)
    for i = 1, #self.子控件 do
        if data[i + 双斧转换选择.页 * 20 - 20] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i + 双斧转换选择.页 * 20 - 20], nil, "双斧转换选择")
            lssj:置偏移(10, 10)
            self.子控件[i].真实编号 = i + 双斧转换选择.页 * 20 - 20
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end