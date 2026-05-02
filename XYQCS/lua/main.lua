local SDL = require('SDL')
local GGF = require('GGE.函数')
if gge.platform == 'Android' then
    SDL.SetHint('SDL_AUDIODRIVER', 'openslES')
    --SDL.SetHint('SDL_AUDIODRIVER', 'android')
end
qz=math.floor
引擎 =
    require 'SDL.窗口' {
        标题 = '天元西游(三端互通)',
        宽度 = 960,
        高度 = 540,
        帧率 = 60,
        --全屏 = true,
        --渲染器 = 'opengl'
    }
function 引擎:初始化()
    require('custom')
    require('UIlayer')
    --FPS = require("fps")(50)
    SDL.MOUSE_MOTION = false
    collectgarbage("generational")
    collectgarbage("incremental")
    --缺少蔬菜 赤金宝箱 黄铜宝箱各类宝箱
    __上次时间 = os.time()
    标签 = require('IM窗口')()
    -- local files = {}
    -- for file in io.popen('dir "assets/scene" /b'):lines() do
    --     table.insert(files, file)
    -- end
    -- local mapFiles = {}
    -- for _, file in ipairs(files) do
    --     if file:match("%.map$") then
    --         table.insert(mapFiles, '"assets/scene/' .. file .. '"')
    --     end
    -- end
    -- local outputFile = io.open("assets/test.txt", "w")
    -- for _, mapFile in ipairs(mapFiles) do
    --     outputFile:write(mapFile .. ",\n")
    -- end
    -- outputFile:close()
end

function 引擎:更新事件(dt, x, y)
    -- if os.time() >= 1706545600 then 
    --     return
    -- end
    if type(dt) == "number" then
        for i = 1, 15 do
            客户端:数据到达()
        end
        if 标签.是否可见 then
            标签:更新(dt, x, y)
        end
        多开数据[多开数据.当前].__UI界面:更新(dt, x, y)
        if 多开数据[多开数据.当前].__主显 then
            多开数据[多开数据.当前].__主显:更新(dt)
        end
        for i = 1, 5 do
            if 多开数据[i] and i ~= 多开数据.当前 then
                -- 多开数据[i].__UI界面:更新(dt,x,y)
                if 多开数据[i].__主显 then
                    多开数据[i].__主显:更新(dt)
                end
            end
        end
        if __获取焦点计时 and os.time() - __获取焦点计时 > 2 then
            if not 客户端:是否已连接(多开数据[多开数据.当前].连接id or 0) and 多开数据[多开数据.当前].__连接信息 and 多开数据[多开数据.当前].__连接信息.登陆成功 then
               -- 客户端:断开(多开数据[多开数据.当前].连接id)
                客户端:重连(多开数据.当前)
            else
                __获取焦点计时 = nil
            end
        end
        -- else
        --     print(dt, x, y)
    end

    local 当前客户端 = 多开数据[多开数据.当前]
    if 当前客户端 and 当前客户端.__连接信息 and 当前客户端.__连接信息.登陆成功 then
        if not self.当前标题 or self.当前标题 ~= 当前客户端.角色信息.名称 then
            for i=1,#服务器表 do
                self:置标题("天元西游(三端互通) (["..服务器表[i].服务组.."] - "..当前客户端.角色信息.名称.." ["..当前客户端.角色信息.数字id.."]) ")
                self.当前标题 = 当前客户端.角色信息.名称
            end
        end
    end

    --collectgarbage()
    if __上次时间 ~= os.time() then
        __上次时间 = os.time()
        if 多开数据[多开数据.当前].__全局自动走路开关 then
            多开数据[多开数据.当前].__全局自动走路秒 = 多开数据[多开数据.当前].__全局自动走路秒 + 1
        end
    end
end

function 引擎:渲染事件(dt, x, y)
    if self:渲染开始() then
        if __重连==0 then
            for i = 1, 5 do
                if 多开数据[i] and 多开数据.当前 ~= i then
                    -- 多开数据[i].__UI界面:显示(x,y)
                    if 多开数据[i].__主显 then
                        多开数据[i].__主显:显示(x, y)
                    end
                end
            end
        else
            多开数据[多开数据.当前].__UI弹出.提示框:打开('#R尝试重新服务器。。。第'..__重连..'次')
        end
        if __获取焦点计时 and os.time() - __获取焦点计时 > 2 then
            if not 客户端:是否已连接(多开数据[多开数据.当前].连接id or 0) and 多开数据[多开数据.当前].__连接信息 and 多开数据[多开数据.当前].__连接信息.登陆成功 then
                客户端:重连(多开数据.当前)
            else
                __获取焦点计时 = nil
            end
        end
        if 多开数据[多开数据.当前].__主显 then
            多开数据[多开数据.当前].__主显:显示(x, y)
        end
        多开数据[多开数据.当前].__UI界面:显示(x, y)

         if 多开数据[多开数据.当前].__主控 then
            if 多开数据[多开数据.当前].__主控["战斗中"] then
                if 显示战斗鼠标 then
                    多开数据[多开数据.当前].__主控.法术鼠标:更新(dt)
                    多开数据[多开数据.当前].__主控.法术鼠标:显示(x, y)
                end
            end
        end



        if 标签.是否可见 then
            标签:显示(x, y)
        end
        --FPS:显示(10,150, x, y)
        self:渲染结束()
    end
end
__重连=0
local 上一个消息 = 0

function 引擎:窗口事件(ev)
    if ev == SDL.WINDOWEVENT_CLOSE then
        引擎:关闭()
    elseif ev == SDL.WINDOWEVENT_FOCUS_LOST then --最小化
        if 多开数据 and 多开数据[多开数据.当前].__连接信息 and 多开数据[多开数据.当前].__连接信息.登陆成功 then
            __失去焦点计时 = os.time()
        end
    elseif ev == SDL.WINDOWEVENT_FOCUS_GAINED then --恢复最小化
        if __失去焦点计时 and os.time() - __失去焦点计时 > 120 then
            print('失去焦点')
            客户端:断开(多开数据[多开数据.当前].连接id)
            if not 客户端:是否已连接(多开数据[多开数据.当前].连接id or 0) then
                
                print('重连')
                客户端:重连(多开数据.当前)
            end
        else
            __失去焦点计时 = nil
        end
        if 多开数据 and 多开数据[多开数据.当前].__连接信息 and 多开数据[多开数据.当前].__连接信息.登陆成功 then
            __获取焦点计时 = os.time()
        end
    elseif ev == SDL.WINDOWEVENT_ENTER then --鼠标进入

    end
end

function 引擎:键盘事件(KEY, KMOD, 状态, 按住)
    if not 状态 then --弹起

    end
    -- if KMOD & SDL.KMOD_LCTRL ~= 0 then
    --     print('左CTRL', 按住)
    -- end
    -- if KMOD & SDL.KMOD_ALT ~= 0 then
    --     print('左右ALT', 按住)
    -- end
end

function 引擎:鼠标事件(KEY, x, y, 按住)
    if KEY == 1025 then

    end
end

function 引擎:输入事件()
end

function 引擎:销毁事件()
end

