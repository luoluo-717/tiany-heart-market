--[[
    @Author       : GGELUA
    @Date         : 2022-06-09 15:25:12
    @Last Modified by: GGELUA
    @Last Modified time: 2022-08-31 19:21:07
--]]
local 帮助 = __UI界面.窗口层:创建我的窗口("帮助",0,0,727,484)

function 帮助:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(727,484)
    if nsf:渲染开始() then
        置窗口背景("帮助",0,12,720,473,true):显示(0,0)
        取白色背景(0,0,150,410,true):显示(20,56)
        取灰色背景(0,0,485,410,true):显示(213,56)
    end
    self:置精灵(nsf:到精灵())
end

function 帮助:打开()
    self:置可见(true)
    self.目录:重置()
end

local 关闭 = 帮助:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",677,0)

function 关闭:左键弹起(x,y,msg)
    帮助:置可见(false)
end

local 目录 = 帮助:创建树形列表("目录",37,71,123,387)

function 目录:初始化()
    self:置文字(字体20)
    self:置颜色(__取颜色('黑色'))
    self.行间距 = 10
end

function 目录:重置()
    self:清空()
    for i, v in ipairs{
        { name ='游戏资料' , son = { '界面介绍' , '游戏介绍', '蚩尤邪魂', '堆雪人', '昆仑仙境', '小龟赛跑', '赏金任务', '心魔宝珠', '江湖任务'} } ,
        { name ='玩家攻略' , son = { '游戏须知' , "道具大全" , '门派加点', '新手升级', '装备系统', '宝宝相关', '神兽相关','奇经八脉',"化境说明"} } ,
        { name ='开发动态' , son = { '新功能' } } ,
        { name ='装备大全' , son = { '法宝公式1' , '法宝公式2',"一级符石组合","二级符石组合","三级符石组合","四级符石组合"  } } ,
    } do
        self:添加(v.name)
        for s, k in ipairs(v.son) do
            self._node[#self._node]:添加(k)
            self._node[#self._node]._node[#self._node[#self._node]._node].介绍 = __取帮助文档(v.name,k)
        end
    end
end

function 目录:左键弹起(x, y, i, item, msg)
    if item.介绍 then
        帮助.文本:清空()
        帮助.文本:置文本(item.介绍)
    end
end

local 文本 = 帮助:创建我的文本("文本",234,72,438,374)