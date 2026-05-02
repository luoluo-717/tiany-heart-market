local 动作 = require('对象/基类/动作')
local lsb = {   {name = "锦衣显示",rgb= "白色"},
                {name = "屏蔽玩家",rgb= "白色"},
                {name = "关闭遮罩",rgb= "白色"},
                {name = "屏蔽摊位",rgb= "白色"},
                {name = "显示变身造型",rgb= "白色"},
                {name = "显示坐骑",rgb= "白色"},
                {name = "轮盘移动",rgb= "白色"},


        }

local 系统设置 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("系统设置",0,0,725,485)
local 当前 = 多开数据.当前
function 系统设置:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(725,485)
    if nsf:渲染开始() then
        置窗口背景("系统设置",0,12,719,473,true):显示(0,0)
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像('音乐音量'):显示(30,72)
        字体18:取图像('游戏音效'):显示(30,122)
        -- 字体18:取图像('界面风格:'):显示(30,170)
        字体18:取图像('锦衣显示'):显示(310,68)
        字体18:取图像('屏蔽玩家'):显示(310,122)
        字体18:取图像('关闭遮罩(多开建议关闭)'):显示(310,172)
        字体18:取图像('屏蔽摊位'):显示(310,222)
        字体18:取图像('显示变身造型'):显示(310,277)
        字体18:取图像('显示坐骑'):显示(310,332)
        字体18:取图像('轮盘移动'):显示(310,387)

        
        
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 系统设置:打开()
    self:置可见(true)
    self:重置()
end

function 系统设置:重置()
    local nsf = require('SDL.图像')(725,485)
    if nsf:渲染开始() then
        字体18:置颜色(__取颜色('白色'))
        字体18:取图像(__res.配置.音乐音量):显示(158,72)
        字体18:取图像(__res.配置.音效音量):显示(158,122)
        nsf:渲染结束()
    end
    if __res.配置.锦衣 == 1 then
        系统设置.锦衣显示按钮:置选中(true)
    else
        系统设置.锦衣显示按钮:置选中(false)
    end
    if __res.配置.轮盘移动 == 1 then
        系统设置.轮盘移动按钮:置选中(true)
    else
        系统设置.轮盘移动按钮:置选中(false)
    end

    if __res.配置.屏蔽玩家 == 1 then
        系统设置.屏蔽玩家按钮:置选中(true)
    else
        系统设置.屏蔽玩家按钮:置选中(false)
    end
    if __res.配置.关闭遮罩 == 1 then
        系统设置.关闭遮罩按钮:置选中(true)
    else
        系统设置.关闭遮罩按钮:置选中(false)
    end

    if __res.配置.显示坐骑 == 1 then
        系统设置.显示坐骑按钮:置选中(true)
    else
        系统设置.显示坐骑按钮:置选中(false)
    end

    
    if __res.配置.屏蔽摊位 == 1 then
        系统设置.屏蔽摊位按钮:置选中(true)
    else
        系统设置.屏蔽摊位按钮:置选中(false)
    end
    
    if __res.配置.显示变身造型 == 1 then
        系统设置.显示变身造型按钮:置选中(true)
    else
        系统设置.显示变身造型按钮:置选中(false)
    end
    self.图像 = nsf:到精灵()
end

local 关闭 = 系统设置:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",675,0)

function 关闭:左键弹起(x,y,msg)
    系统设置:置可见(false)
end

for i=1,#lsb do
    local 临时函数 = 系统设置:创建我的多选按钮(__res:getPNGCC(2,1172,107,26,26,true),__res:getPNGCC(2,1171,75,26,26,true),lsb[i].name.."按钮",280,60+((i-1)*54))
    function 临时函数:左键弹起(x, y)
        if lsb[i].name == '锦衣显示' then
            if 临时函数.是否选中 then
                __res.配置.锦衣 = 0
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            else
                __res.配置.锦衣 = 1
                __res:写出文件("configure.txt", zdtostring(__res.配置))

            end
            多开数据[当前].__主显.主角:置模型()
        elseif lsb[i].name == '显示坐骑' then
            if 临时函数.是否选中 then
                __res.配置.显示坐骑 = 0
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            else
                __res.配置.显示坐骑 = 1
                __res:写出文件("configure.txt", zdtostring(__res.配置))

            end
            多开数据[当前].__主显.主角:置模型()

        elseif lsb[i].name == '轮盘移动' then
            if 临时函数.是否选中 then
                __res.配置.轮盘移动 = 0
            else
                __res.配置.轮盘移动 = 1
            end
            __res:写出文件("configure.txt", zdtostring(__res.配置))
            
            if __res.配置.轮盘移动 == 1 then
                多开数据[当前].__UI界面["界面层"]["轮盘移动"]:置可见(true, true)
            else
                多开数据[当前].__UI界面["界面层"]["轮盘移动"]:置可见(false, false)
            end

       elseif lsb[i].name == '屏蔽玩家' then
            if 临时函数.是否选中 then
                __res.配置.屏蔽玩家 = 0
            else
                __res.配置.屏蔽玩家 = 1
            end
        elseif lsb[i].name == '关闭遮罩' then
            if 临时函数.是否选中 then
                __res.配置.关闭遮罩 = 0
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            else
                __res.配置.关闭遮罩 = 1
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            end
        elseif lsb[i].name == '屏蔽摊位' then
            if 临时函数.是否选中 then
                __res.配置.屏蔽摊位 = 0
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            else
                __res.配置.屏蔽摊位 = 1
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            end
        elseif lsb[i].name == '自动入队' then
            if 临时函数.是否选中 then
                __res.配置.自动入队 = 0
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            else
                __res.配置.自动入队 = 1
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            end
        elseif lsb[i].name == '显示变身造型' then
            if 临时函数.是否选中 then
                __res.配置.显示变身造型 = 0
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            else
                __res.配置.显示变身造型 = 1
                __res:写出文件("configure.txt", zdtostring(__res.配置))
            end
            多开数据[当前].__主显.主角:更改模型(多开数据[当前].__主显.主角)
        end
    end
end

for i, v in ipairs {
    {name = '自动回收', x = 437 ,y = 414 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '自动回收'},
    {name = '退出游戏', x = 573 ,y = 414 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '退出游戏'},
    {name = '保存配置', x = 301 ,y = 414 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '保存配置'},
    {name = '开启多开', x = 165 ,y = 414 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '开启多开'},
    {name = '传音红包', x = 25 ,y = 414 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '传音红包'},
    {name = '清空包裹', x = 25 ,y = 414-55 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(125,43) ,  font = '清空包裹'},

    {name = '音乐音量加', x = 100 ,y = 62 , tcp = __res:getPNGCC(4,970,6,44,44,true)},
    {name = '音乐音量减', x = 200 ,y = 62 , tcp = __res:getPNGCC(4,1018,5,44,45,true)},
    {name = '音效音量加', x = 100 ,y = 112 , tcp = __res:getPNGCC(4,970,6,44,44,true)},
    {name = '音效音量减', x = 200 ,y = 112 , tcp = __res:getPNGCC(4,1018,5,44,45,true)},
} do
    local 临时函数 = 系统设置:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '自动回收' then
            发送数据(当前,109)
        elseif v.name == '退出游戏' then
            -- 引擎:关闭()
            标签:关闭窗口()
        elseif v.name == '开启多开' then
            标签:开启多开()
        elseif v.name == '清空包裹' then
        local 事件 = function()
          发送数据(当前,3787)
        end
        local wb = "你确定要把背包的道具全部清空么？清空道具背包后道具无法找回！"
        多开数据[多开数据.当前].__UI界面.窗口层.文本栏.打开(多开数据[多开数据.当前].__UI界面.窗口层.文本栏, wb, 285, 155, 390, 200, 事件)

        elseif v.name == '传音红包' then
            多开数据[当前].__UI界面.窗口层.发放红包:打开(内容)
        elseif v.name == '保存配置' then
            __res:写出文件("configure.txt",zdtostring(__res.配置))
        elseif v.name == '音乐音量减' and __res.配置.音乐音量 <= 95 then
            __res.配置.音乐音量 = __res.配置.音乐音量 + 5
            if 多开数据[当前].__主控.音乐 then
                多开数据[当前].__主控.音乐:置音量(__res.配置.音乐音量)
            end
        elseif v.name == '音乐音量加' and __res.配置.音乐音量 >= 5 then
            __res.配置.音乐音量 = __res.配置.音乐音量 - 5
            if 多开数据[当前].__主控.音乐 then
                多开数据[当前].__主控.音乐:置音量(__res.配置.音乐音量)
            end
        elseif v.name == '音效音量减' and __res.配置.音效音量 <= 95 then
            __res.配置.音效音量 = __res.配置.音效音量 +5
        elseif v.name == '音效音量加' and __res.配置.音效音量 >= 5 then
            __res.配置.音效音量 = __res.配置.音效音量 -5
        end
        系统设置:重置()
    end
end
-- function 系统设置:刷新选页()
--     系统设置.选择界面:我的按钮置文字(系统设置.选择界面,__res:getPNGCC(2, 795, 885, 372, 116, true):拉伸(80, 35),全局界面风格)
-- end
-- for i, v in ipairs {
--     { name = '选择界面', x =130, y = 62+100, tcp = __res:getPNGCC(2, 795, 885, 372, 116, true):拉伸(80, 35),font =全局界面风格},
-- } do
--     local 临时函数 = 系统设置:创建我的按钮(v.tcp, v.name, v.x, v.y,v.font)
--     function 临时函数:左键弹起(x, y)
--         if v.name == '选择界面' then
--             if 多开数据[当前].__UI弹出.通用选择弹出.是否可见 then
--                 多开数据[当前].__UI弹出.通用选择弹出:置可见(false)
--             else
--                 多开数据[当前].__UI弹出.通用选择弹出:打开(x, y,'界面切换',{'经典','水晶','国韵'})
--             end
--         end
--     end
-- end
