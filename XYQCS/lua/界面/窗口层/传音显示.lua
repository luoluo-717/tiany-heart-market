--[[
Author: GGELUA
Date: 2023-12-25 09:32:26
Last Modified by: GGELUA
Last Modified time: 2023-12-28 08:56:11
--]]
--[[
Author: GGELUA
Date: 2023-12-20 08:06:42
Last Modified by: GGELUA
Last Modified time: 2023-12-22 10:12:21
--]]
--[[
Author: GGELUA
Date: 2023-12-18 10:25:04
Last Modified by: GGELUA
Last Modified time: 2023-12-18 10:34:44
--]]
local 传音显示 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("传音显示",10,180+abbr.py.y,270,90)
local 当前 = 多开数据.当前
function 传音显示:初始化()
    local nsf = require('SDL.图像')(960+abbr.py.x,252)
    if nsf:渲染开始(0,0,0,0) then
        __res:取图像(__res:取地址("shape/ui/xz/", 0x18361072)):显示(0,0)
        __res:取图像(__res:取地址("shape/ui/xz/", 0x18361288)):显示(5,5)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.外框 =  __res:取动画(__res:取地址("shape/ui/xz/", 0x18363065)):取动画(1):播放(true)
end

function 传音显示:更新(dt)
    self.外框:更新(dt)
    if os.time() > self.计时开始 + 5 then
        self:置可见(false)
    end
end

function 传音显示:显示(x,y)
    self.外框:显示(x+0,y+0)
    self.外框:显示(x+0,y+80)
end

function 传音显示:打开(内容,频道)
    self.计时开始 = os.time()
    self.聊天文本:清空()
    self.聊天文本:置文本('#W'..内容) 
    self:置可见(true)
end

local 聊天文本 = 传音显示:创建我的文本("聊天文本",20,5,240,80,true)

function 聊天文本:初始化()

end
function 聊天文本:回调左键弹起(cb,msg)
    local cbc = ""
    for n, m in pairs(cb) do
        if n == "cb" then
            cbc = m
        end
    end
    local lssj = 分割文本(cbc, "*")
    if lssj[3] == "道具" then
        for i,v in ipairs(多开数据[当前].__UI界面.界面层.左下角.广播数据) do
            if lssj[3] == v.索引类型 and lssj[1] == v.名称  and lssj[2] == v.识别码 then
                local lssj = __商店格子.创建(当前)
                lssj:置物品(v)
                lssj:详情打开(200,86,w,h)
                break
            end
        end
    elseif lssj[3] == "召唤兽" then
        for i,v in ipairs(多开数据[当前].__UI界面.界面层.左下角.广播数据) do
            if lssj[3] == v.索引类型 and lssj[1] == v.名称  and lssj[2] == v.认证码 then
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(v)
                break
            end
        end
    elseif lssj[3] == "玩家信息" then
        多开数据[当前 or self and self.当前].__UI弹出.玩家信息弹出:打开({名称=lssj[1],模型=lssj[2],玩家ID=lssj[3],门派="未知"})
    end
end
