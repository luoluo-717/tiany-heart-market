-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-11-14 07:36:55
-- @Last Modified time  : 2023-06-19 15:19:31

local GGF = require('GGE.函数')
local host = 'ggelua.oss-cn-shenzhen.aliyuncs.com'
local http = require('HPSocket.HttpClient')()

local function 下载文件(file, fun)
    if not http:是否连接() then
        http:连接(host, 80) --bug 重连后收不到
    end

    if http:是否连接() then
        if fun then
            http.进度事件 = function(_, p)
                fun(p)
            end
        else
            http.进度事件 = nil
        end

        local data = http:GET(file)

        return data
    end
end

local function 取需要下载文件()
    local new = 下载文件('updata/list')
    local old = GGF.读入文件('./updata/list')
    --print(new, old)
    if new and old then
        local tnew = require('lua.serpent').load(new)
        local told = require('lua.serpent').load(old)
        if not tnew or not told then
            return
        end
        local ret = {}
        for file, md5 in pairs(tnew) do
            if not told[file] or told[file] ~= md5 then
                ret[file] = md5
            end
        end
        return ret, new
    end
end

local function 开始下载()
    local ret, list = 取需要下载文件()
    if not ret or not next(ret) then
        return
    end
    local 下载窗口 = IM:创建模态窗口('正在下载')
    function 下载窗口:初始化()
        self:置样式(自动宽高 | 关闭按钮)
    end

    local 文本 = 下载窗口:创建文本('文件')
    local 进度 = 下载窗口:创建进度('进度')

    下载窗口:置可见(true)
    for file, md5 in pairs(ret) do
        print(file)
        文本:置文本(file)
        local data = 下载文件(file, function(p)
            进度.位置 = p * 100
        end)
        if data and GGF.MD5(data) == md5 then
            GGF.写出文件('./updata/' .. file, data)
        else
            return
        end
    end

    GGF.写出文件('./updata/list', list)
    local bat = {
        '@echo off',
        'taskkill /f /im lua.exe >NUL 2>NUL',
        'taskkill /f /im sublime_text.exe >NUL 2>NUL',
        'taskkill /f /im plugin_host-3.3.exe >NUL 2>NUL',
        'taskkill /f /im plugin_host-3.8.exe >NUL 2>NUL',
        'taskkill /f /im ggelua.exe >NUL 2>NUL',
        'taskkill /f /im ggeluac.exe >NUL 2>NUL',
    }
    for file, md5 in pairs(ret) do
        table.insert(bat, string.format('move /y updata\\%s %s', file:gsub('/', '\\'), file:gsub('/', '\\')))
    end
    table.insert(bat, 'start ggelua.exe')
    table.insert(bat, 'exit')
    GGF.写出文件('./updata/up.bat', table.concat(bat, '\n'))
    os.execute('start updata\\up.bat')
end

local function 检查更新()
    local ver = 下载文件('updata/ver')
    --print(ver)
    if ver and ver > gge.version then
        local 版本更新 = IM:创建模态窗口('版本更新')
        function 版本更新:初始化()
            self:置样式(自动宽高 | 关闭按钮)
        end

        版本更新:创建文本('发现新版本(v%s)，是否需要更新？', ver)
        版本更新:分隔线()
        local 确定按钮 = 版本更新:创建按钮('更新', 0, 0, 100, 0)
        function 确定按钮:左键单击()
            版本更新:置可见(false)
            开始下载()
        end

        版本更新:同行()
        local 取消按钮 = 版本更新:创建按钮('取消', 0, 0, 100, 0)
        function 取消按钮:左键单击()
            版本更新:置可见(false)
        end

        版本更新:置可见(true)
    end
end

-- coroutine.xpcall(检查更新)
