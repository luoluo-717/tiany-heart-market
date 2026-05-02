--[[
    @Author       : GGELUA
    @Date         : 2022-02-13 20:43:31
Last Modified by: GGELUA
Last Modified time: 2023-08-10 21:35:38
--]]
local 右上角 = 多开数据[多开数据.当前].__UI界面.界面层:创建控件("右上角", 670 + abbr.py.x, 0, 280, 370)
local 当前 = 多开数据.当前
function 右上角:初始化()
    local nsf = require('SDL.图像')(280, 65)
    if nsf:渲染开始() then
        -- __res.UI素材[1]:置区域(3,350,234,65):显示(47,2) -- 新春
        __res:getPNGCC(2, 892, 480, 234, 64):显示(48, 2)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 右上角:显示(x, y)

end

function 右上角:重置人物()
    右上角.人物气血条:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息.气血 / 多开数据[当前 or self and self.当前].角色信息.最大气血 * 100))
    右上角.人物魔法条:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息.魔法 / 多开数据[当前 or self and self.当前].角色信息.最大魔法 * 100))
    右上角.人物愤怒条:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息.愤怒 / 150 * 100))
    右上角.人物经验条:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息.当前经验 / 多开数据[当前 or self and self.当前].角色信息.最大经验 * 100))
end

function 右上角:重置召唤兽()
    if 多开数据[当前 or self and self.当前].角色信息.参战宝宝.名称 then
        右上角.召唤兽气血条:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息.参战宝宝.气血 / 多开数据[当前 or self and self.当前].角色信息.参战宝宝
            .最大气血 * 100))
        右上角.召唤兽魔法条:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息.参战宝宝.魔法 / 多开数据[当前 or self and self.当前].角色信息.参战宝宝
            .最大魔法 * 100))
        右上角.召唤兽经验条:置位置(math.floor(多开数据[当前 or self and self.当前].角色信息.参战宝宝.当前经验 /
            多开数据[当前 or self and self.当前].角色信息.参战宝宝.最大经验 * 100))
    else
        右上角.召唤兽气血条:置位置(0)
        右上角.召唤兽魔法条:置位置(0)
        右上角.召唤兽经验条:置位置(0)
    end
end

local 人物头像 = 右上角:创建网格("人物头像", 163, 4, 60, 60)

function 人物头像:初始化()
    self:创建格子(60, 60, 0, 0, 1, 1)
end

function 人物头像:左键弹起(x, y, a, b, msg)
    发送数据(当前 or self and self.当前, 7)
end

function 人物头像:置头像(数据)
    local lssj = __头像格子.创建(当前)
    lssj:置头像(数据, "右上角", 60, 60)
    if 人物头像.子控件 and 人物头像.子控件[1] then
        人物头像.子控件[1]:置精灵(lssj)
    end
    右上角:重置人物()
end

for i, v in ipairs {
    { name = '人物气血条', x = 226, y = 4, w = 54, h = 8, tcp = __res:getPNGCC(1, 375, 314, 54, 8) },
    { name = '人物魔法条', x = 226, y = 13, w = 54, h = 8, tcp = __res:getPNGCC(1, 375, 297, 54, 8) },
    { name = '人物愤怒条', x = 226, y = 23, w = 54, h = 8, tcp = __res:getPNGCC(1, 308, 298, 54, 8) },
    { name = '人物经验条', x = 226, y = 31, w = 54, h = 8, tcp = __res:getPNGCC(1, 307, 315, 54, 8) },
} do
    local 临时函数 = 右上角:创建我的进度(v.tcp, v.name, v.x, v.y, v.w, v.h)
    function 临时函数:左键弹起(x, y)
        多开数据[当前 or self and self.当前].__UI弹出.气魔补充:打开('人物')
    end
end

local 召唤兽头像 = 右上角:创建网格("召唤兽头像", 49, 4, 55, 55)

function 召唤兽头像:初始化()
    self:创建格子(55, 55, 0, 0, 1, 1)
end

function 召唤兽头像:左键弹起(x, y, a, b, msg)
    发送数据(当前 or self and self.当前, 5001)
end

function 召唤兽头像:置头像(数据)
    local lssj = __头像格子.创建(当前)
    lssj:置头像(数据, "右上角", 55, 55)
    if 召唤兽头像.子控件 and 召唤兽头像.子控件[1] then
        召唤兽头像.子控件[1]:置精灵(lssj)
    end
    右上角:重置召唤兽()
end

for i, v in ipairs {
    { name = '召唤兽气血条', x = 106, y = 4, w = 54, h = 8, tcp = __res:getPNGCC(1, 375, 314, 54, 8) },
    { name = '召唤兽魔法条', x = 106, y = 13, w = 54, h = 8, tcp = __res:getPNGCC(1, 375, 297, 54, 8) },
    { name = '召唤兽经验条', x = 106, y = 23, w = 54, h = 8, tcp = __res:getPNGCC(1, 307, 315, 54, 8) },
} do
    local 临时函数 = 右上角:创建我的进度(v.tcp, v.name, v.x, v.y, v.w, v.h)
    function 临时函数:左键弹起(x, y)
        多开数据[当前 or self and self.当前].__UI弹出.气魔补充:打开('召唤兽')
    end
end

-- local 宠物 = 右上角:创建我的按钮(__res.UI素材[1]:复制区域(437,296,38,39),"宠物",4,4) -- 新春
local 宠物 = 右上角:创建我的按钮(__res:getPNGCC(2, 1150, 185, 40, 40), "宠物", 4, 4)

function 宠物:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前, 5006)
end

local 状态网格 = 右上角:创建网格("状态网格", 163, 67, 120, 60)

function 状态网格:初始化()
    self:创建格子(26, 26, 2, 2, 2, 4)
end

function 状态网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr then
        多开数据[当前 or self and self.当前].__UI弹出.状态提示:打开(self.数据[a])
        ------------------------C改
        if self.数据[a][1]=="变身卡"  then
            local 文案 = "确认取消当前变身卡吗？（当前剩余：" .. self.数据[a][5] .. "分钟）"
            local 事件 = function()
                发送数据(当前, 186)
            end
            多开数据[当前].__UI界面.窗口层.文本栏:打开(文案,285,155,390,200,事件)
        end
    end
        ------------------------C改

end

function 状态网格:置数据(data)
    for i = 1, #self.子控件 do
        if data[i] then
            local nsf = require('SDL.图像')(26, 26)
            if nsf:渲染开始() then
                local lssj = __取界面小图标外框(data[i][2])
                __res:取图像(__res:取地址('shape/ui/jm/', lssj[1])):显示(0, 0)
                lssj = __取界面小图标(data[i][6])
                __res:取图像(__res:取地址('shape/ui/jm/', lssj[1])):显示(4, 4)
                nsf:渲染结束()
            end
            self.子控件[i]:置精灵(nsf:到精灵())
        else
            self.子控件[i]:置精灵()
        end
    end
    self.数据 = data
end

function 状态网格:单独置数据(data)
    if self.数据 == nil then self.数据 = {} end
    for i = 1, #self.子控件 do
        if not self.子控件[i]._spr and data[1] then
            local nsf = require('SDL.图像')(26, 26)
            if nsf:渲染开始() then
                local lssj = __取界面小图标外框(data[1][2])
                __res:取图像(__res:取地址('shape/ui/jm/', lssj[1])):显示(0, 0)
                lssj = __取界面小图标(data[1][4])
                __res:取图像(__res:取地址('shape/ui/jm/', lssj[1])):显示(4, 4)
                nsf:渲染结束()
            end
            self.子控件[i]:置精灵(nsf:到精灵())
            self.数据[i] = data
            break
        end
    end
end

local 退出 = 右上角:创建我的按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):拉伸(100, 43), "退出", 130, 100, "退出")
function 退出:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前, 5599, { a = 0 })
end

local 右关闭 = 右上角:创建我的按钮(__res:getPNGCC(2, 1082, 406, 31, 64), "右关闭", 82, 168)
-- local 右关闭 = 右上角:创建我的按钮(__res:getPNGCC(1, 483, 274, 31, 64), "右关闭", 82, 168)---新春

function 右关闭:左键弹起(x, y, msg)
    if 右上角.任务栏.是否可见 then
        右上角.任务栏:置可见(false)
        self:置坐标(240, 168)
    else
        右上角.任务栏:置可见(true)
        self:置坐标(82, 168)
    end
end

local 任务栏 = 多开数据[当前].__UI界面.界面层.右上角:创建控件("任务栏", 80, 67, 205, 300)
function 任务栏:初始化()

end

local 时钟 = 任务栏:创建我的按钮(__res:getPNGCC(2, 1037, 236, 54, 40), "时钟", 34, 51)
-- local 时钟 = 任务栏:创建我的按钮(__res:getPNGCC(1, 522, 274, 58, 40), "时钟", 34, 51)---新春
function 时钟:左键弹起(x, y, msg)

end

local 任务 = 任务栏:创建我的按钮(__res:getPNGCC(2, 1093, 237, 106, 39), "任务", 91, 51)
-- local 任务 = 任务栏:创建我的按钮(__res:getPNGCC(1, 584, 274, 111, 39), "任务", 91, 51)---新春
function 任务:左键弹起(x, y, msg)
    发送数据(当前 or self and self.当前, 10)
end

local 追踪列表 = 任务栏:创建列表("追踪列表", 35, 90, 160, 230)

function 追踪列表:初始化()
    self:置文字(字体16)
    self.行高度 = 90
    self.选中精灵 = nil
    self.焦点精灵 = nil
    self.行间距 = 1
end

local  自动寻路处理 = function (i)
    local 成功
    for k,v in pairs(多开数据[当前].__主显.地图.对象) do
        if i == v.名称 and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长)  then
            local 终点
            if v.X and v.Y then
                终点 = require('GGE.坐标')(v.X*20,v.Y*20):floor()
            elseif v.x and v.y then
                终点 = require('GGE.坐标')(v.x*20,v.y*20):floor()
            end
            if 终点 then
                多开数据[当前].__主显.主角:设置路径(终点)
                return
            end
        end
    end
    多开数据[当前].__UI弹出.提示框:打开('#Y该场景没有此NPC或你不是队长！')
end


function 追踪列表:重置(data)
    local tbsj = {}
    self:清空()
    for i,v in ipairs(data) do
        if v[1] and v[1] ~= "摄妖香" and v[1] ~= "罗羹效果" and v[1] ~= "变身卡" then
            local r = self:添加(v[2])
            r:置精灵(__res:getPNGCC(1, 680, 383, 217, 126):拉伸(200, 90):到精灵())
            local 文本 = r:创建我的文本('追踪文本', 0, 0, 160, 90)
            文本:置文本('#G' .. v[1])
            文本:置文本(v[2])
            r:置可见(true, true)
            function 文本:回调左键弹起(cb, msg)
                local cbc = ""
                for n, m in pairs(cb) do
                    if n == "cb" then
                        cbc = m
                    end
                end
                local lssj = 分割文本(cbc, "*")
                if lssj[3] == "NPC查询" then
                    多开数据[当前].__UI弹出.提示框:打开("#YNPC在#R" .. lssj[2] .."#Y,#R" .. 多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].x .."#Y,#R" .. 多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].y)
                    if 多开数据[当前].角色信息.地图数据.编号 == 多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].地图id and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长) then
                        local xy = require("GGE.坐标")(多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].x * 20,
                        多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].y * 20):floor()
                        多开数据[当前]. __主显.主角:设置路径(xy)
                    else
                        发送数据(当前,1009,{地图=多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].地图id,x=多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].x,y=多开数据[当前].__主控.假人信息[lssj[2]][lssj[1]].y},1)
                    end
                elseif lssj[3] == "临时npc" or lssj[3] == "临时NPC" then
                    多开数据[当前].__UI弹出.提示框:打开("#YNPC在#W" .. 取地图名称(lssj[2]+0) .."#Y(" .. lssj[4] .."," .. lssj[5]..")")
                    if 多开数据[当前].角色信息.地图数据.编号 == lssj[2]+0 and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长) then
                        local xy = require("GGE.坐标")(lssj[4] * 20,
                        lssj[5] * 20):floor()
                        多开数据[当前]. __主显.主角:设置路径(xy)
                    end
                end
            end
        else
            if v[1] == '摄妖香' and v[4] and v[4] > 0 then
                table.insert(tbsj, {
                    "摄妖香",
                    "绿色",
                    "摄妖香剩余:",
                    "分",
                    v[4],
                    "摄妖香"
                })
            elseif v[1] == '罗羹效果' and v[4] then
                if v[4][1] and v[4][1] > 0 then
                    table.insert(tbsj, {
                        "红罗羹",
                        "橙色",
                        "储备气血剩余:",
                        nil,
                        v[4][1],
                        "丹药黄"
                    })
                end
                if v[4][2] and v[4][2] > 0 then
                    table.insert(tbsj, {
                        "八珍玉液",
                        "橙色",
                        "储备气血上限剩余:",
                        nil,
                        v[4][2],
                        "丹药紫"
                    })
                end
                if v[4][3] and v[4][3] > 0 then
                    table.insert(tbsj, {
                        "绿芦羹",
                        "橙色",
                        "储备魔法剩余:",
                        nil,
                        v[4][3],
                        "丹药蓝"
                    })
                end
            elseif v[1] == '变身卡' and v[4] and v[4] > 0 then
                table.insert(tbsj, {
                    "变身卡",
                    "绿色",
                    "变身卡剩余:",
                    "分",
                    v[4],
                    "变身卡"
                })
            end
        end
    end
    右上角.状态网格:置数据(tbsj)
    if 多开数据[当前].角色信息.剧情 and 多开数据[当前].角色信息.地图数据.编号 == 多开数据[当前].角色信息.剧情.地图 and 多开数据[当前].角色信息.剧情.附加.战斗 == nil then
        for k, v in pairs(多开数据[当前].__主显.地图.对象) do
            if ggetype(v) == "NPC" then
                if v.pid == 多开数据[当前].角色信息.剧情.编号 then
                    v:置任务(true)
                else
                    v:置任务(false)
                end
            end
        end
    elseif 多开数据[当前].角色信息.剧情 and 多开数据[当前].角色信息.地图数据.编号 == 多开数据[当前].角色信息.剧情.地图 and 多开数据[当前].角色信息.剧情.附加.战斗 ~= nil then
        for k, v in pairs(多开数据[当前].__主显.地图.对象) do
            if ggetype(v) == "NPC" then
                if v.pid == 多开数据[当前].角色信息.剧情.编号 then
                    v:置任战(true)
                else
                    v:置任战(false)
                end
            end
        end
    end
end

function 追踪列表:左键弹起(x, y, i, item, msg)
    --任务提示.任务文本:添加文本(self.子控件[i]._spr.数据[2])
end