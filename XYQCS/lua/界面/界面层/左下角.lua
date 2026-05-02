
local 左下角 = 多开数据[多开数据.当前].__UI界面.界面层:创建控件("左下角",10,320-167+abbr.py.y,400,220+167)
local 当前 = 多开数据.当前
function 左下角:初始化()
    local nsf = require('SDL.图像')(482,378)
    if nsf:渲染开始() then
        __res.UI素材[1]:复制区域(298,369,373,167):显示(-60,54+167)
        -- __res.UI素材[1]:复制区域(0,417,297,30):显示(0,31) --新春
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    self.消息缓存 = {
        xt={},
        sj={},
        dq={},
        sl={},
        cy={},
        cw={},
        bp={},
        dw={},
        hd={},
    }
    self.广播数据 = {}
end

function 左下角:显示(x,y)
    self.图像:显示(x,y)
end
local 拓展按钮 = 左下角:创建我的按钮(__res:取图像(__res:取地址("shape/pic/", 0xacc00001)), "拓展按钮", 120, 1+167)
function 拓展按钮:左键弹起(x, y, msg)
    左下角.拓展界面:置可见(not 左下角.拓展界面.是否可见)
end

local 拓展界面 = 左下角:创建控件("拓展界面", 1, 63, 300, 275)
function 拓展界面:初始化()
    if __res.配置.屏蔽玩家 == 1 then
        self.屏蔽玩家:置选中(true)
    else
        self.屏蔽玩家:置选中(false)
    end
    if __res.配置.屏蔽摊位 == 1 then
        self.屏蔽摊位:置选中(true)
    else
        self.屏蔽摊位:置选中(false)
    end
    if __res.配置.轮盘移动 == 1 then
        self.轮盘移动:置选中(true)
    else
        self.轮盘移动:置选中(false)
    end

end
-- local 屏蔽玩家 = 拓展界面:创建我的多选按钮(__res:取图像(__res:取地址("shape/pic/", 0xacc00007)), __res:取图像(__res:取地址("shape/pic/", 0xacc00004)), "屏蔽玩家", 180, 3)
local 屏蔽玩家 = 拓展界面:创建我的多选按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(100,30), __res:getPNGCC(1, 963, 495, 175, 43, true):置拉伸(100,30),"屏蔽玩家", 70, 3, "屏蔽玩家")

左下角显示玩家=true
function 屏蔽玩家:左键弹起(x, y, msg)
    左下角显示玩家=屏蔽玩家["是否选中"]
    __res.配置.屏蔽玩家 = 左下角显示玩家 and 0 or 1
    __res:写出文件("configure.txt", zdtostring(__res.配置))
end
-- local 屏蔽摊位 = 拓展界面:创建我的多选按钮(__res:取图像(__res:取地址("shape/pic/", 0xacc00002)), __res:取图像(__res:取地址("shape/pic/", 0xacc00005)), "屏蔽摊位", 180, 3+77*1)
local 屏蔽摊位 = 拓展界面:创建我的多选按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(100,30), __res:getPNGCC(1, 963, 495, 175, 43, true):置拉伸(100,30),"屏蔽摊位", 175, 3, "屏蔽摊位")
左下角显示摊位=true
function 屏蔽摊位:左键弹起(x, y, msg)
    左下角显示摊位=屏蔽摊位["是否选中"]
    __res.配置.屏蔽摊位 = 左下角显示摊位 and 0 or 1
    __res:写出文件("configure.txt", zdtostring(__res.配置))
end
-- local 隐藏界面 =拓展界面:创建我的多选按钮(__res:取图像(__res:取地址("shape/pic/", 0xacc00003)), __res:取图像(__res:取地址("shape/pic/", 0xacc00006)), "隐藏界面", 180, 3+77*2)
local 隐藏界面 = 拓展界面:创建我的多选按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(100,30), __res:getPNGCC(1, 963, 495, 175, 43, true):置拉伸(100,30),"隐藏界面", 70, 35, "隐藏界面")
左下角显示界面=true
function 隐藏界面:左键弹起(x, y, msg)
    左下角显示界面=隐藏界面["是否选中"]
    多开数据[当前].__UI界面.界面层.左上角:置可见(左下角显示界面)
    多开数据[当前].__UI界面.界面层.右下角:置可见(左下角显示界面)
    多开数据[当前].__UI界面.界面层.右上角:置可见(左下角显示界面)
end

local 轮盘移动 = 拓展界面:创建我的多选按钮(__res:getPNGCC(1, 401, 65, 175, 43, true):置拉伸(100,30), __res:getPNGCC(1, 963, 495, 175, 43, true):置拉伸(100,30),"轮盘移动", 175, 35, "轮盘移动")
左下角显示轮盘=true
function 轮盘移动:左键弹起(x, y, msg)
    左下角显示轮盘=轮盘移动["是否选中"]
    __res.配置.轮盘移动 = 左下角显示轮盘 and 0 or 1
    __res:写出文件("configure.txt", zdtostring(__res.配置))
    if __res.配置.轮盘移动 == 1 then
        多开数据[当前].__UI界面["界面层"]["轮盘移动"]:置可见(true, true)
    else
        多开数据[当前].__UI界面["界面层"]["轮盘移动"]:置可见(false, false)
    end
end

-- local 频道 = 左下角:创建我的按钮(__res.UI素材[1]:复制区域(186,272,51,52),"频道",6,1+167) --新春
local 频道 = 左下角:创建我的按钮(__res:getPNGCC(2,1096,181,50,51),"频道",6,1+167)

function 频道:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.消息管理:打开(左下角.消息缓存)
end

-- --local 虎头 = 左下角:创建我的按钮(__res.UI素材[1]:复制区域(248,275,51,51),"虎头",66,2) --新春
-- local 虎头 = 左下角:创建我的按钮(__res:getPNGCC(2,1041,184,50,50),"虎头",66,2)
-- function 虎头:左键弹起(x,y,msg)
--     if not 多开数据[当前].__全局自动走路开关 then
--         if 多开数据[当前].__主显.场景最低等级 then
--             多开数据[当前].__全局自动走路开关 = true
--             多开数据[当前].__全局自动走路秒 = 0
--            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y自动挂机已开启！')
--         else
--            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/自动挂机开启失败!当前场景不属于野外区.....")
--         end
--     else
--         多开数据[当前].__全局自动走路开关 = false
--         多开数据[当前].__全局自动走路秒 = 0
--        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y自动挂机已关闭！')
--     end
-- end

local 快捷传送 = 左下角:创建我的按钮(__res:getPNGCC(2,1041,184,50,50),"快捷传送",66,2+167)
function 快捷传送:左键弹起(消x, y, msg)
  多开数据[当前].__UI界面.窗口层.超级传送:打开()
end

local 聊天文本 = 左下角:创建我的文本("聊天文本",5,70+167,290,130,true)

function 聊天文本:初始化()
    --self:置文本("#900#b#R红色测试闪烁#b#G绿色测试#B蓝色测试#W白色测试#Y黄色测试#K黑色测试#H黑色测试#L黑色测试#S黑色测试#Z黑色测试#N黑色测试#R#m(回调测试)回调测试#m#u下划线#u")
    --self:置文本("ht|虾将军*龙宫*npc查询/")
    --self:置文本("#[aaa$bbb$ccc#]")

end

function 聊天文本:添加文本(文本,频道)
    if self._max > 1500 then
        self:清空()
        左下角.消息缓存 = {
            xt={},
            sj={},
            dq={},
            sl={},
            cy={},
            cw={},
            bp={},
            dw={},
            hd={},
        }
    end
    if not 频道 or not __频道表[频道] then 
        频道 = "dq"
    end
    table.insert( 左下角.消息缓存[频道],文本)
    if not 文本 then
        文本 = " "
    end
    self:置文本('#'..__频道表[频道]..文本)
    -- if 多开数据[当前].__UI界面.窗口层.消息管理[频道].是否选中 then
        多开数据[当前].__UI界面.窗口层.消息管理.聊天文本:添加文本(文本,频道) 
    -- end
    self._py = -self._max
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
        for i,v in ipairs(左下角.广播数据) do
            if lssj[3] == v.索引类型 and lssj[1] == v.名称  and lssj[2] == v.识别码 then
                local lssj = __商店格子.创建(当前)
                lssj:置物品(v)
                lssj:详情打开(200,86,w,h)
                break
            end
        end
    elseif lssj[3] == "召唤兽" then
        for i,v in ipairs(左下角.广播数据) do
            if lssj[3] == v.索引类型 and lssj[1] == v.名称  and lssj[2] == v.认证码 then
                多开数据[当前].__UI界面.窗口层.召唤兽查看:打开(v)
                break
            end
        end
    elseif lssj[3] == "玩家信息" then
        多开数据[当前 or self and self.当前].__UI弹出.玩家信息弹出:打开({名称=lssj[1],模型=lssj[2],玩家ID=lssj[3],门派="未知"})
    end
end 

