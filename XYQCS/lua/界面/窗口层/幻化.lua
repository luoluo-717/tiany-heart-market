local 幻化 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("幻化",0,0,727,484)
local 当前 = 多开数据.当前

function 幻化:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(727,484)
    if nsf:渲染开始() then
        置窗口背景("幻化",0,12,720,473,true):显示(0,0)
        __res:getPNGCC(3,694,4,338,273):显示(30,72)
        __res:getPNGCC(3,132,506,55,55):显示(410,72)
        __res:getPNGCC(3,132,506,55,55):显示(613,72)
        __res:getPNGCC(3,132,506,55,55):显示(410,263)
        __res:getPNGCC(3,132,506,55,55):显示(613,263)
        local lssj = 取输入背景(0,0,55,23)
        lssj:显示(410,133)
        lssj:显示(613,133)
        lssj:显示(410,321)
        lssj:显示(613,321)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('体力消耗：'):显示(30,370)
        lssj:显示(115,368)
        字体18:取图像('成功率：'):显示(195,370)
        lssj:显示(305,368)
        字体18:取图像('剩余陨铁：'):显示(30,420)
        lssj:显示(115,418)
        字体18:取图像('强化石消耗：'):显示(195,420)
        lssj:显示(305,418)
        __res:取图像(__res:取地址('shape/dj/',取物品('青龙石')[12])):显示(413,76)
        __res:取图像(__res:取地址('shape/dj/',取物品('白虎石')[12])):显示(617,76)
        __res:取图像(__res:取地址('shape/dj/',取物品('朱雀石')[12])):显示(411,268)
        __res:取图像(__res:取地址('shape/dj/',取物品('玄武石')[12])):显示(617,268)
    end
    self:置精灵(nsf:到精灵())
end

function 幻化:打开()
    self:置可见(true)
    self.道具网格:置物品(多开数据[当前].__主控["道具列表"],{2,204},{1,2,3,4,5,6})
    self.材料网格:置物品(nil)
    self.选中道具 = nil
    self.幻化数据 = {青龙石=0,白虎石=0,朱雀石=0,玄武石=0,陨铁=__取背包物品数量("陨铁")}
    self.成功率 = 0
    self:刷新()
end

function 幻化:刷新(data)
    if data then
        self.道具网格:置物品(data,{2,204},{1,2,3,4,5,6})
        self.材料网格:置物品(nil)
        self.选中道具 = nil
        self.幻化数据 = {青龙石=0,白虎石=0,朱雀石=0,玄武石=0,陨铁=__取背包物品数量("陨铁")}
        self.成功率 = 0
    end
    local nsf = require('SDL.图像')(727,484)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('黑色'))
        字体18:取图像(self.幻化数据.青龙石):显示(425,135)
        字体18:取图像(self.幻化数据.白虎石):显示(628,135)
        字体18:取图像(self.幻化数据.朱雀石):显示(425,323)
        字体18:取图像(self.幻化数据.玄武石):显示(628,323)
        字体18:取图像(20):显示(130,370)
        字体18:取图像(self.成功率):显示(320,370)
        字体18:取图像(self.幻化数据.陨铁):显示(130,420)
        字体18:取图像(self.幻化数据.青龙石+self.幻化数据.白虎石+self.幻化数据.朱雀石+self.幻化数据.玄武石):显示(320,420)
    end   
    self.图像 = nsf:到精灵()
end

local 关闭 = 幻化:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",677,0)

function 关闭:左键弹起(x,y,msg)
    幻化:置可见(false)
end

for i, v in ipairs {
    {name = '自动加入强化石', x = 384 ,y = 409 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(175,41) , font = '自动加入强化石'},
    {name = '确定', x = 591 ,y = 409 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(103,41),  font = '确定'},
    {name = '青龙加', x = 470 ,y = 131 , tcp = __res:getPNGCC(1,641,320,29,29) , lx = '青龙石'},
    {name = '青龙减', x = 378 ,y = 131 , tcp = __res:getPNGCC(1,601,319,29,29) , lx = '青龙石'},
    {name = '白虎加', x = 676 ,y = 131 , tcp = __res:getPNGCC(1,641,320,29,29) , lx = '白虎石'},
    {name = '白虎减', x = 584 ,y = 131 , tcp = __res:getPNGCC(1,601,319,29,29) , lx = '白虎石'},
    {name = '朱雀加', x = 470 ,y = 317 , tcp = __res:getPNGCC(1,641,320,29,29) , lx = '朱雀石'},
    {name = '朱雀减', x = 378 ,y = 317 , tcp = __res:getPNGCC(1,601,319,29,29) , lx = '朱雀石'},
    {name = '玄武加', x = 676 ,y = 317 , tcp = __res:getPNGCC(1,641,320,29,29) , lx = '玄武石'},
    {name = '玄武减', x = 584 ,y = 317 , tcp = __res:getPNGCC(1,601,319,29,29) , lx = '玄武石'},
} do
    local 临时函数 = 幻化:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '自动加入强化石' then
            if 幻化.材料网格.子控件[1]._spr.物品 and 幻化.材料网格.子控件[1]._spr.物品.原始编号 and 幻化.材料网格.子控件[1]._spr.物品.幻化次数 and 幻化.材料网格.子控件[1]._spr.物品.幻化次数 >= 10 then
                幻化.幻化数据.青龙石 = 0
                幻化.幻化数据.白虎石 = 0
                幻化.幻化数据.朱雀石 = 0
                幻化.幻化数据.玄武石 = 0
                for s, k in ipairs{
                    {name = '青龙石' , 数量 = __取背包物品数量("青龙石")},
                    {name = '白虎石' , 数量 = __取背包物品数量("白虎石")},
                    {name = '朱雀石' , 数量 = __取背包物品数量("朱雀石")},
                    {name = '玄武石' , 数量 = __取背包物品数量("玄武石")},
                } do
                    local 强化石消耗 = 幻化.幻化数据.青龙石+幻化.幻化数据.白虎石+幻化.幻化数据.朱雀石+幻化.幻化数据.玄武石
                    if k.数量 ~= 0 then
                        local fhz = k.数量
                        if k.数量 > 40 - 强化石消耗 then
                            fhz = 40 - 强化石消耗
                        end
                        幻化.幻化数据[k.name] = 幻化.幻化数据[k.name] + fhz
                    end
                end
                幻化.成功率 = 幻化.成功率 + (幻化.幻化数据.青龙石+幻化.幻化数据.白虎石+幻化.幻化数据.朱雀石+幻化.幻化数据.玄武石)//2
                if 幻化.成功率>=100 then
                  幻化.成功率=100
                end
                幻化:刷新()
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y元身幻化前10次无需添加强化石')
            end
        elseif v.name == '确定' then
            if 幻化.材料网格.子控件[1]._spr.物品 and 幻化.材料网格.子控件[1]._spr.物品.原始编号 then
                发送数据(当前 or self and self.当前,4502,{序列=幻化.材料网格.子控件[1]._spr.物品.原始编号,材料={青龙石=幻化.幻化数据.青龙石,白虎石=幻化.幻化数据.白虎石,朱雀石=幻化.幻化数据.朱雀石,玄武石=幻化.幻化数据.玄武石}})
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y请选择要幻化的装备')
            end
        end
    end
end

local 道具网格 = 幻化:创建网格("道具网格",30,72,339,272)

function 道具网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.物品 and not self.子控件[a]._spr.物品禁止 then
        local x,y = self.子控件[a]:取坐标()
        local w,h = self.子控件[a]:取宽高()
        if 幻化.选中道具 and self.子控件[幻化.选中道具]._spr.物品 then
            self.子控件[幻化.选中道具]._spr.确定 = nil
        end
        幻化.选中道具 = a
        self.子控件[a]._spr.确定 = true
        self.子控件[a]._spr:详情打开(170,86,w,h,"选择",a)
        幻化.材料网格:置物品(多开数据[当前].__主控["道具列表"][a],1,a)
        if not self.子控件[a]._spr.物品.幻化次数 or self.子控件[a]._spr.物品.幻化次数 < 10 then
            幻化.成功率 = 100
        else
            幻化.成功率 = 80
        end
        幻化:刷新()
    end
end

function 道具网格:置物品(data,zl,fl)
    for i = 1,#self.子控件 do
        if data[i] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i],nil,"道具选择")
            lssj:置总类禁止(zl)
            lssj:置分类禁止(fl)
            lssj:置等级禁止(150,'小')
            lssj:置偏移(10,10)
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end

local 材料网格 = 幻化:创建网格("材料网格",511,190,55,55)

function 材料网格:初始化()
    self:创建格子(55,55,0,0,1,1)
end

function 材料网格:左键弹起(x, y, a, b, msg)
    -- if 符石.开始镶嵌.是否可见 then
    --     if 符石.选中 then
    --         self.子控件[符石.选中]._spr.确定 = nil
    --         符石.选中 = nil
    --     end
    --     self.子控件[a]._spr.确定 = true
    -- end
end

function 材料网格:置物品(data,bh,pid)
    if not bh then
        for i = 1,#self.子控件 do
            local lssj = __材料格子.创建(当前)
            lssj:置物品(data)
            self.子控件[i]:置精灵(lssj)
        end
    else
        local lssj = __材料格子.创建(当前)
        lssj:置物品(data)
        lssj.物品.原始编号 = pid
        self.子控件[bh]:置精灵(lssj)
    end
end