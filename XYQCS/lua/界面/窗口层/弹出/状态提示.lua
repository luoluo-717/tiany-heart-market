--[[
Author: GGELUA
Date: 2023-12-01 22:54:48
Last Modified by: GGELUA
Last Modified time: 2024-02-01 18:10:00
--]]
--[[
Author: GGELUA
Date: 2023-11-23 13:23:05
Last Modified by: GGELUA
Last Modified time: 2023-11-26 21:35:09
--]]
多开数据[多开数据.当前].__UI弹出.状态提示 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("状态提示",引擎.宽度-232,引擎.高度-447,234,288)
local 状态提示 = 多开数据[多开数据.当前].__UI弹出.状态提示
local 当前 = 多开数据.当前
function 状态提示:初始化()
    self:置精灵(取黑色背景(0,0,234,100))
end

function 状态提示:打开(data)
    if not self.是否可见 then
        self:置可见(true)
    end
    self.状态文本:清空()
    self.状态文本:置文本('')
    self.状态文本:置文本('#Y'..data[1])
    if data[1] == "摄妖香" then
        self.状态文本:置文本('#Y处于摄妖香状态期间在相应场景不会遇怪') -- ..data[3]..data[5]..data[4]
    elseif data[1] == "红罗羹" or data[1] == "绿芦羹" then
        self.状态文本:置文本('#Y'..data[3]..data[5])
    elseif data[1] == "变身卡" then
        self.状态文本:置文本('#Y当前处于变身状态中') --..data[3]..data[5]..data[4]
    end
end

local 状态文本 = 状态提示:创建我的文本("状态文本",15,15,185,255)
