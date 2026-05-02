-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-06-18 20:43:53
-- @Last Modified time  : 2024-06-01 19:54:27
local SDL = require('SDL')
local GGF = require('GGE.函数')
local g = {}
for k, v in pairs(_G) do
    g[k] = v
end
初始环境 = g

if gge.platform == 'Windows' then
    引擎 = require 'SDL.窗口' {
        标题 = 'GGELUA2 v' .. gge.version,
        宽度 = 1280,
        高度 = 720,
        帧率 = 60,
        可调整 = true
    }
else
    引擎 = require 'SDL.窗口' {
        标题 = 'GGELUA2 v' .. gge.version,
        宽度 = 1280,
        高度 = 720,
        帧率 = 30,
    }
end

function 引擎:初始化()
    res = require('GGE.资源')()
    res:添加路径('assets')
    f14 = require('SDL.文字')('assets/simsun.ttc', 14)
    --mp3 = res:取音效('test.mp3') :播放(true, 5000)

    sdl = res:取精灵('SDL.png'):置透明(10)
    webp1 = res:取精灵('1.webp'):置过滤(1)
    webp2 = require('SDL.精灵')('assets/2.webp')

    if gge.platform == 'Windows' or gge.platform == 'Mac OS X' then
        require('desktop/IM')
    elseif gge.platform == 'Android' then
        require('mobile/IM')
        print(require('SDL.函数').取内部存储路径())
        print(require('SDL.函数').取外部存储路径())
    end
end

local 度数 = 0
function 引擎:更新事件(dt, x, y)
    度数 = 度数 + dt * 5
    if 度数 > 359 then
        度数 = 0
    end
    webp1:置旋转(度数, 310, 316)
    if IM then
        IM:更新(dt)
    end
end

function 引擎:渲染事件(dt, x, y)
    if self:渲染开始(255, 255, 255, 255) then
        sdl:显示(0, 0)
        webp1:显示(引擎.宽度2 - 300, 引擎.高度2 - 300)
        webp2:显示(引擎.宽度2 - 300, 引擎.高度2 - 300)
        if IM then
            IM:显示()
        end

        -- self:截图到图像():保存文件("screenshot.png", "PNG")
        -- os.exit()
        self:渲染结束()
    end
end

function 引擎:窗口事件(msg)
    if msg == SDL.WINDOWEVENT_CLOSE then
        引擎:关闭()
    end
end
