if gge.isdebug and os.getenv('LOCAL_LUA_DEBUGGER_VSCODE') == '1' then
    package.loaded['lldebugger'] = assert(loadfile(os.getenv('LOCAL_LUA_DEBUGGER_FILEPATH')))()
    require('lldebugger').start()
end

local SDL = require('SDL')

引擎 = require 'SDL.窗口' {
    标题 = 'GGELUA_窗口',
    宽度 = 800,
    高度 = 600,
    帧率 = 60, 
}

function 引擎:初始化()

end

function 引擎:更新事件(dt, x, y)

end

function 引擎:渲染事件(dt, x, y)
    if self:渲染开始(0x70, 0x70, 0x70) then
        self:渲染结束()
    end
end

function 引擎:窗口事件(ev, ...)
    if ev == SDL.WINDOWEVENT_CLOSE then
        引擎:关闭()
    end
end

function 引擎:键盘事件(KEY, KMOD, 状态, 按住)
end

function 引擎:鼠标事件(ev, x, y, key)
end

function 引擎:输入事件()
end

function 引擎:手柄事件()
end

function 引擎:销毁事件()
end
