
多开数据[多开数据.当前].__UI弹出.窗口道具 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("窗口道具",0,0,370,300)
local 窗口道具 = 多开数据[多开数据.当前].__UI弹出.窗口道具
local 当前 = 多开数据.当前
function 窗口道具:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(370,300)
    if nsf:渲染开始() then
        取黑透明背景(0,0,370,300,true):显示(0,0)
        __res:getPNGCC(3,694,4,338,273):显示(20,14)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中道具 = nil
end

function 窗口道具:打开(数据,内丹,吸附石,快捷镶嵌)
    self:置可见(true)
    self.格子=数据.格子

    -- table.print(数据)
    if 数据[3] == "吸附石" then
        窗口道具.功能分类 = "吸附石"
    elseif not 内丹 and not 吸附石 and not 快捷镶嵌 and 数据 and 数据[2] then
        self.格子 = 数据[1]
        self.功能分类 = 数据[3]
        self.数据 = 数据[2]
        self.符纸总类 = tonumber(self.数据.总类)
        self.符纸分类 = tonumber(self.数据.分类)
        self.符纸子类 = tonumber(self.数据.子类)
    end
    if 内丹 then
        self.功能分类 = "打内丹"
        self.宝宝 = 内丹
    end
    if 快捷镶嵌 then
        self.符纸格子 = 数据.格子
        self.功能分类 = "快捷镶嵌"
    end
    if 窗口道具.功能分类 == "吸附石" then
        self.道具网格:置物品(多开数据[当前].__主控.道具列表,3)
    elseif 窗口道具.功能分类 == "打内丹" then
        self.道具网格:置物品(多开数据[当前].__主控.道具列表,203)
    else
        self.道具网格:置物品(多开数据[当前].__主控.道具列表,2)
    end
end



local 道具网格 = 窗口道具:创建网格("道具网格",20,14,339,272)

function 道具网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and not self.子控件[a]._spr.物品禁止 and self.子控件[a]._spr.物品 then
      local wuping=self.子控件[a]._spr.物品
          发送数据(当前 or self and self.当前,128,{编号=a,格子=窗口道具.格子})
            窗口道具:置可见(false)
    end
  end

function 道具网格:置物品(data,zl,fl)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],nil,"道具选择")
            lssj:置禁止(zl,fl)
            lssj:置偏移(10,10)
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end
