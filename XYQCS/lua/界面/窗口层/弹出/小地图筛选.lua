--[[
    @Author       : GGELUA
    @Date         : 2022-04-13 19:53:06
Last Modified by: GGELUA
Last Modified time: 2023-10-07 16:21:37
--]]
local lsb = {   {name = "全部",rgb= "青色"},
                {name = "普通",rgb= "白色"},
                {name = "商业",rgb= "黄色"},
                {name = "特殊",rgb= "绿色"},
                {name = "传送",rgb= "红色"},
                {name = "任务",rgb= "青色"},
                {name = "出口",rgb= "紫色"}
        }
多开数据[多开数据.当前].__UI弹出.小地图筛选 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("小地图筛选",0,0,145,380)
local 小地图筛选 = 多开数据[多开数据.当前].__UI弹出.小地图筛选
local 当前 = 多开数据.当前
function 小地图筛选:初始化()
    local nsf = require('SDL.图像')(145,380)
    if nsf:渲染开始() then
        取黑色背景(0,0,145,380,true):显示(0,0)
        for i=1,#lsb do
            字体18:置颜色(__取颜色(lsb[i].rgb))
            字体18:取图像(lsb[i].name):显示(57,27+((i-1)*54))
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 小地图筛选:打开(x,y)
    -- print(x,y)
    self:置可见(true)
    self:置中心(-x-120,-y+330)
end

function 小地图筛选:重置()
    for i=1,#lsb do
        小地图筛选[lsb[i].name.."按钮"]:置选中(false)
    end
end
for i=1,#lsb do
    local 临时函数 = 小地图筛选:创建我的多选按钮(__res:getPNGCC(2,1172,107,26,26,true),__res:getPNGCC(2,1171,75,26,26,true),lsb[i].name.."按钮",25,24+((i-1)*54))

    function 临时函数:左键弹起(x, y)
        -- print(临时函数.是否选中,lsb[i].name)
        if lsb[i].name == '全部' then
            for _, v in ipairs(lsb) do
                if 临时函数.是否选中 then
                    多开数据[当前].__UI界面.窗口层.小地图.筛选控制[v.name] = false
                    if v.name ~= '全部' then
                        小地图筛选[v.name.."按钮"]:置选中(false)
                    end
                else
                    多开数据[当前].__UI界面.窗口层.小地图.筛选控制[v.name] = true
                    if v.name ~= '全部' then
                        小地图筛选[v.name.."按钮"]:置选中(true)
                    end
                end
            end
        else
            if 临时函数.是否选中 then
                多开数据[当前].__UI界面.窗口层.小地图.筛选控制[lsb[i].name] = false
            else
                多开数据[当前].__UI界面.窗口层.小地图.筛选控制[lsb[i].name] = true
            end
        end
        多开数据[当前].__UI界面.窗口层.小地图:筛选重置()
    end
end