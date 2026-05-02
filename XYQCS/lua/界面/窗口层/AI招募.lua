local AI招募 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("AI招募",0,0,774,484)
local 当前 = 多开数据.当前
function AI招募:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(774,484)
    if nsf:渲染开始() then
        置窗口背景("AI招募",0,12,766,473,true):显示(0,0)
        取灰色背景(0,0,753,375,true):显示(7,55)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function AI招募:打开(数据)
    self:置可见(true)
    self.招募数据 = 数据[2] or {}
    self.假人数据 = {}
    for i,v in ipairs(数据[1]) do
        self.假人数据[#self.假人数据+1] = {
            门派=v.门派,
            编号=i,
            名称=v.模型,
            模型=v.模型,
            染色组=v.染色组,
            染色方案=v.染色方案,
            装备={},
            锦衣={}
        }
        if 多开数据[当前].角色信息.等级 < 89 then
            self.假人数据[#self.假人数据].等级 = 69
        elseif 多开数据[当前].角色信息.等级 < 109 then
            self.假人数据[#self.假人数据].等级 = 89
        elseif 多开数据[当前].角色信息.等级 < 129 then
            self.假人数据[#self.假人数据].等级 = 109
        elseif 多开数据[当前].角色信息.等级 < 155 then
            self.假人数据[#self.假人数据].等级 = 129
        elseif 多开数据[当前].角色信息.等级 < 175 then
            self.假人数据[#self.假人数据].等级 = 155
        else
            self.假人数据[#self.假人数据].等级 = 175
        end
          local 武器 = v.武器数据[math.random(1,#v.武器数据)]
          if 武器 then
              local 武器数据 = 取物品(武器) 
              if 武器数据 and 武器数据[2]==2 and 武器数据[3]==3 then
                  self.假人数据[#self.假人数据].装备 = {名称=武器,总类=2,子类=武器数据[4],分类=3,等级=120}
            end
        end
    end
    self:重置(self.假人数据)
end

function AI招募:重置(数据)
    self.选中 = nil
    self.队员网格:置数据(数据)
end

function AI招募:刷新(数据)
    self.招募数据 = 数据[2] or {}
    self:重置(self.假人数据)
end

local 关闭 = AI招募:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",724,0)

function 关闭:左键弹起(x,y,msg)
    AI招募:置可见(false)
end

local 队员网格 = AI招募:创建网格("队员网格",17,60,740,370)

function 队员网格:初始化()
    self:创建格子(143,180,0,5,3,5,true,15)
end

function 队员网格:左键弹起(x, y, a, b, msg)
    if AI招募.选中 then
        self.子控件[AI招募.选中]._spr.确定 = nil
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        AI招募.选中 = a
        self.子控件[a]._spr.确定 = true
        if AI招募.招募数据[a] then
            AI招募.同意按钮:我的按钮置文字(AI招募.同意按钮,__res:getPNGCC(2,487,802,150,43,true):拉伸(116,37),"遣散")
        else
            AI招募.同意按钮:我的按钮置文字(AI招募.同意按钮,__res:getPNGCC(2,487,802,150,43,true):拉伸(116,37),"招募")
        end
        
    end
end

function 队员网格:置数据(数据)
    for i = 1,#队员网格.子控件 do
        local lssj = __AI队伍格子.创建(当前)
        lssj:置数据(数据[i],AI招募.招募数据,i)
        队员网格.子控件[i]:置精灵(lssj)
    end
end

for i, v in ipairs {
    {name = '同意按钮', font = '招募', x = 626 ,y = 435 , tcp = __res:getPNGCC(2,487,802,150,43,true):拉伸(116,37)},
} do
    local  临时函数 = AI招募:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '同意按钮' then
            if AI招募.选中 and 队员网格.子控件[AI招募.选中]._spr.数据 then
                发送数据(当前 or self and self.当前,217,AI招募.假人数据[AI招募.选中])
            end
        end
    end
end