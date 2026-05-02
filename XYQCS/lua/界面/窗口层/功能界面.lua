--[[
Author: GGELUA
Date: 2025-01-15 01:15:06
Last Modified by: GGELUA
Last Modified time: 2025-01-20 15:38:47
--]]
--[[
Author: GGELUA
Date: 2025-01-15 01:15:06
Last Modified by: GGELUA
Last Modified time: 2025-01-20 11:59:00
--]]
local SDLF = require('SDL.函数')
local 功能界面 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("功能界面",0,0,830,544)
local 当前 = 多开数据.当前
local 按钮组 = {
    { name = '装备升星', x = 149, y = 123, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000012))},
    { name = '宝宝进阶', x = 149+120, y = 123, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000002))},
    { name = '称号极品', x = 149+120+150, y = 126, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000004))},
    { name = 'BOSS', x = 149, y = 241, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000001))},
    { name = '神来VIP', x = 149+140, y = 250, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000010))},
    { name = '充值赞助', x = 149+120+150, y = 250, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000005))},
    { name = '神来抽奖', x = 149+120+150+150, y = 100, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000009))},

}

function 功能界面:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(830, 534)
    if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000007)):显示(0, 0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())

    --self.允许移动 = true
end

function 功能界面:打开()
	self:置窗口()
    self:置可见(true)
end

function 功能界面:刷新()
end

function 功能界面:置窗口()
    local nsf = require('SDL.图像')(830, 544)
    if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/xz/", 0x0D000007)):显示(0, 0)
        置窗口背景("功能界面",0,12,644,544,true):显示(0, 0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end







for i, v in ipairs(按钮组)  do
    local 临时函数 = 功能界面:创建我的按钮(v.tcp, v.name, v.x, v.y)
    function 临时函数:左键弹起(x, y)
        if not 多开数据[当前].__主控.战斗中 then
            if v.name == '装备升星' then
                -- 发送数据(当前 or self and self.当前,222,{事件="升星",事项="打开"})
                多开数据[当前].__UI界面.窗口层.对话栏:打开({ 模型 = "梦幻精灵", 名称 = "梦幻精灵", 对话 = "请问大侠需要对装备或灵饰进行进阶升级吗",选项={"装备进阶","灵饰进阶","我只是路过"}, 回调处理 = 回调处理 })

                多开数据[当前].__UI界面.窗口层.道具行囊:置可见(false)
            elseif v.name == '宝宝进阶' then
                -- if 召唤兽属性.选中召唤兽 and 多开数据[当前].角色信息.宝宝列表[召唤兽属性.选中召唤兽] then
                    发送数据(当前, 3801.4, { 序列 = 1, 操作 = "进阶宝宝" })
                -- end
            elseif v.name == '称号极品' then
                发送数据(当前 or self and self.当前,194,{序号1=1})
            elseif v.name == "BOSS" then
                local 回调处理 = function(i,选项)
                            if 选项[i] == "发起挑战" then
                                发送数据(当前,101.1)
                            elseif 选项[i] == "查看世界排行" then
                                发送数据(当前,101)
                             end
                        end
                        多开数据[当前].__UI界面.窗口层.对话栏:打开({ 模型 = "梦幻精灵", 名称 = "梦幻精灵", 对话 = "世界BOOS挑战赛，展现你实力的时候到了！",选项={"发起挑战","一键强化装备","查看世界排行"}, 回调处理 = 回调处理 })
            elseif v.name == "神来VIP" then
             发送数据(当前 or self and self.当前,207,{显示类=1})
            elseif v.name == "充值赞助" then
                local SDL = require('SDL')
                --SDL.OpenURL("http://59.47.231.78:168/pay/?server=风华正茂&role="..多开数据[当前 or self and self.当前].角色信息.名称.."&roleid="..多开数据[当前 or self and self.当前].角色信息.数字id.."&account="..多开数据[当前 or self and self.当前].角色信息.账号.."")
                SDL.OpenURL("http://www.baidu.com")
            elseif v.name == "神来抽奖" then
             发送数据(当前 or self and self.当前,195,{类型="盲盒抽奖"})
            end
        end
    end
end

local 关闭 = 功能界面:创建我的按钮(__res:取图像(__res:取地址("shape/ui/xz/", 0x0D000008)),0,701,29)--__res:getPNGCC(1,401,0,46,46),"关闭",560,0
function 关闭:左键弹起(x,y)
    功能界面:置可见(false)
end

