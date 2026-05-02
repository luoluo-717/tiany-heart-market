-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-11-14 07:31:54
-- @Last Modified time  : 2024-05-31 11:04:23
local SDL = require('SDL')
local 关于 = 主菜单:创建菜单('关于')


local 赞助 = 关于:创建菜单项('赞助')
function 赞助:左键单击()
    SDL.OpenURL('https://afdian.net/a/GGELUA')
end

local 更新日志 = 关于:创建菜单项('更新日志'):置禁止(true)
function 更新日志:左键单击()

end

local 关于GGELUA = 关于:创建菜单项('关于GGELUA2')
function 关于GGELUA:左键单击()
    IM '关于GGELUA2':置可见(true)
end

local 关于窗口 = IM:创建窗口('关于GGELUA2', 100, 100, 400, 400)
function 关于窗口:初始化()
    self:置样式(样式_禁止折叠 | 样式_禁止调整)
    --self:置透明(100)
end

-- 关于窗口: 创建文本('GGELUA2 v%s', gge.version)
-- 关于窗口:分隔线()
关于窗口:创建文本('GGELUA2 是baidwwy基于SDL2和Lua制作的2D免费跨平台游戏引擎。')
关于窗口:分隔线()
local 标签 = 关于窗口:创建标签('标签')

local 起源 = 标签:添加('起源')
local 容器 = 起源:创建容器('容器')
do
    容器:创建文本('2022年 GGELUA2首次发布。')
    容器:创建文本('2020年 由于跨平台需求，GGELUA2开始基于SDL2开发。')
    容器:创建文本('2019年 由于剑孤寒停止更新，GGELUA1也停止更新。')
    容器:创建文本('2014年 由于EM停止更新，GGELUA1开始基于剑孤寒的Galaxy2D开发。')
    容器:创建文本('2013年 我开始学习C语言，HGE，Lua。')
    容器:创建文本('2009年 我开始学习JK的Edgame Maker。')
end

local 特别感谢 = 标签:添加('特别感谢')
local 容器 = 特别感谢:创建容器('容器')
do
    容器:创建文本('JK - 创世者')
    容器:创建文本('wangdali - 网易资源')
    容器:创建文本('银狐 - 亦徒亦友亦师')
    容器:创建文本('追风 - 问道资源')
    容器:创建文本("Don't know - 大话旧地图")
    容器:创建文本('winter - 多益资源')
    容器:创建文本('月下飞扬 - 传奇世界资源')
    容器:创建文本('风吹吹 - 大佬')
    容器:创建文本('海风 - 投资')
    容器:创建文本('蔓延 - 投资')
    容器:创建文本('鲈鱼 - 投资')
    容器:创建文本('怪我太厉害 - 投资')
    容器:创建文本('爱发电所有的赞助者')
end

return 关于
