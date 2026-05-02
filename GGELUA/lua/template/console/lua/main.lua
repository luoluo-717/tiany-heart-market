if gge.isdebug and os.getenv('LOCAL_LUA_DEBUGGER_VSCODE') == '1' then
    package.loaded['lldebugger'] = assert(loadfile(os.getenv('LOCAL_LUA_DEBUGGER_FILEPATH')))()
    require('lldebugger').start()
end

引擎 = require('GOL')("Server")

按秒 = 引擎:定时(
    1000,
    function(ms)
        --引擎:print(os.time()) --写日志
        --引擎:ERROR('错误日志') 
        return ms
    end
)

gge.onerror = function (err)
    print('错误处理函数')
    引擎:ERROR(err) 
end