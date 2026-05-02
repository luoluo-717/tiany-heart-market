-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-11-14 07:35:21
-- @Last Modified time  : 2023-07-07 08:36:54
local SDL = require('SDL')
local GGF = require('GGE.函数')
local 项目 = 主菜单:创建菜单('项目')

local 新建 = 项目:创建菜单('新建')
do
    local 游戏项目 = 新建:创建菜单项('游戏项目')
    function 游戏项目:左键单击()
        IM '创建游戏项目':置可见(true)
    end

    local 控制台项目 = 新建:创建菜单项('控制台项目')
    function 控制台项目:左键单击()
        IM '创建控制台项目':置可见(true)
    end
end
--==============================================================================
local 创建游戏项目 = IM:创建窗口('创建游戏项目', 20, 30)
do
    function 创建游戏项目:初始化()
        self:置样式(样式_禁止折叠 | 样式_自动宽高)
        --self:置透明(100)
    end

    local 游戏名称 = 创建游戏项目:创建输入('游戏名称')
    local 窗口宽度 = 创建游戏项目:创建输入('窗口宽度'):置禁止(true)
    local 窗口高度 = 创建游戏项目:创建输入('窗口高度'):置禁止(true)
    local 游戏帧率 = 创建游戏项目:创建输入('游戏帧率'):置禁止(true)
    创建游戏项目:分隔线()
    function 创建游戏项目:可见事件(v)
        if v then
            local i = 0
            repeat
                i = i + 1
            until not GGF.判断文件(string.format('./projects/我的游戏%d/.vscode/ggebuild.lua', i))
            游戏名称:置文本('我的游戏' .. i)
        end
    end

    local 确定按钮 = 创建游戏项目:创建按钮('创建')
    function 确定按钮:左键单击()
        if gge.platform ~= 'Windows' then
            return
        end
        local dir = 游戏名称:取文本()
        if dir ~= '' then
            dir = './projects/' .. dir
            GGF.复制目录('./.vscode', dir .. '/.vscode')
            GGF.复制目录('./lua/我的游戏/lua', dir .. '/lua')
            GGF.复制文件('./lua/我的游戏/ggelua.code-workspace', dir .. '/ggelua.code-workspace')
            GGF.复制文件('./lua/我的游戏/ggelua.sublime-project', dir .. '/ggelua.sublime-project')

            os.execute('start ' .. './editor/sublime_text.exe ' .. dir .. '/ggelua.sublime-project')
        end
        创建游戏项目:置可见(false)
    end
end
--==============================================================================
local 创建控制台项目 = IM:创建窗口('创建控制台项目', 20, 30)
do
    function 创建控制台项目:初始化()
        self:置样式(样式_禁止折叠 | 样式_自动宽高)
        --self:置透明(100)
    end

    local 服务名称 = 创建控制台项目:创建输入('服务名称')
    创建控制台项目:分隔线()
    function 创建控制台项目:可见事件(v)
        if v then
            local i = 0
            repeat
                i = i + 1
            until not GGF.判断文件(string.format('./projects/我的控制台%d/.vscode/ggebuild.lua', i))
            服务名称:置文本('我的控制台' .. i)
        end
    end

    local 确定按钮 = 创建控制台项目:创建按钮('创建')
    function 确定按钮:左键单击()
        if gge.platform ~= 'Windows' then
            return
        end
        local dir = 服务名称:取文本()
        if dir ~= '' then
            dir = './projects/' .. dir
            GGF.复制目录('./.vscode', dir .. '/.vscode')
            GGF.复制目录('./lua/我的控制台/lua', dir .. '/lua')
            GGF.复制文件('./lua/我的控制台/ggelua.code-workspace', dir .. '/ggelua.code-workspace')
            GGF.复制文件('./lua/我的控制台/ggelua.sublime-project', dir .. '/ggelua.sublime-project')

            os.execute('start ' .. './editor/sublime_text.exe ' .. dir .. '/ggelua.sublime-project')
        end
        创建控制台项目:置可见(false)
    end
end
--==============================================================================
local 浏览实例 = 项目:创建菜单项('浏览实例')
function 浏览实例:左键单击()
    IM '实例项目窗口':置可见(true)
end

local 浏览我的 = 项目:创建菜单项('浏览我的')
function 浏览我的:左键单击()
    IM '我的项目窗口':置可见(true)
end

--==============================================================================
local 实例项目窗口 = IM:创建窗口('实例项目窗口', 20, 30, 引擎.宽度 - 40, 引擎.高度 - 50)
do
    function 实例项目窗口:初始化()
        self:置样式(样式_禁止折叠)
        --self:置透明(100)
    end

    local 实例查找 = 实例项目窗口:创建输入('实例查找'):置禁止(true)
    实例项目窗口:分隔线()
    local 实例标签 = 实例项目窗口:创建标签('实例标签')


    function getscreenshot(name)
        local screenshot = require('SDL.纹理')(200, 150)
        if screenshot:渲染开始(0x80, 0x80, 0x80, 0xFF) then
            require('SDL.精灵')('assets/screenshot.png'):置拉伸(200, 150, true):显示(0, 0)
            require('SDL.精灵')(0, 0, 0, 200, 20):置颜色(0, 0, 0, 150):显示(0, 130)
            f14:取精灵(name):显示(0, 133)
            screenshot:渲染结束()
        end
        return screenshot
    end

    function 实例项目窗口:可见事件(v)
        if v then
            实例标签:清空()
            for i, v in ipairs {
                { ' 基础 ',    '01-基础' },
                { ' 界面 ',    '02-界面' },
                { ' 核心 ',    '03-核心' },
                { ' 数据库 ', '04-数据库' },
                { ' 例子 ',    '例子' },
                { ' 小游戏 ', '小游戏' },
                { ' 网络 ',    '05-网络' },
            } do
                local 标签 = 实例标签:添加(v[1])
                local 区域 = 标签:创建区域('区域')
                local i = 0
                for file in GGF.遍历目录('./examples/' .. v[2]) do
                    if gge.platform == 'Windows' and file:sub(-15) == 'sublime-project' then
                        i = i + 1
                        file = file:gsub('\\', '/')
                        local name = file:match('(.*)/'):match('.+/(.+)')
                        local 按钮 = 区域:创建纹理按钮('按钮' .. i, 0, 0, 200, 150)
                        function 按钮:左键双击()
                            print(file)
                            os.execute('start ' .. './editor/sublime_text.exe ' .. file)
                        end

                        按钮.tex = getscreenshot(name)
                        按钮:置纹理(按钮.tex)
                        if i % 5 ~= 0 then
                            区域:同行()
                        end
                    elseif file:sub(-14) == 'code-workspace' then
                        i = i + 1
                        file = file:gsub('\\', '/')
                        local name = file:match('(.*)/'):match('.+/(.+)')
                        local 按钮 = 区域:创建纹理按钮('按钮' .. i, 0, 0, 200, 150)
                        function 按钮:左键双击()
                            lfs = require('lfs')
                            print(lfs.currentdir())
                            print('open "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ' .. file)
                            os.execute('open "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ' .. file)
                        end

                        按钮.tex = getscreenshot(name)
                        按钮:置纹理(按钮.tex)
                        if i % 5 ~= 0 then
                            区域:同行()
                        end
                    end
                end
            end
        end
    end
end

--==============================================================================
local 我的项目窗口 = IM:创建窗口('我的项目窗口', 20, 30, 引擎.宽度 - 40, 引擎.高度 - 50)
do
    function 我的项目窗口:初始化()
        self:置样式(样式_禁止折叠)
        --self:置透明(100)
    end

    local 项目查找 = 我的项目窗口:创建输入('项目查找'):置禁止(true)
    我的项目窗口:分隔线()
    local 项目区域 = 我的项目窗口:创建区域('项目区域')


    function getscreenshot(name)
        local screenshot = require('SDL.纹理')(200, 150)
        if screenshot:渲染开始(0x80, 0x80, 0x80, 0xFF) then
            require('SDL.精灵')('assets/screenshot.png'):置拉伸(200, 150, true):显示(0, 0)
            require('SDL.精灵')(0, 0, 0, 200, 20):置颜色(0, 0, 0, 150):显示(0, 130)
            f14:取精灵(name):显示(0, 133)
            screenshot:渲染结束()
        end
        return screenshot
    end

    function 我的项目窗口:可见事件(v)
        if v then
            项目区域:清空()

            local i = 0
            for file in GGF.遍历目录('./projects') do
                if file:sub(-15) == 'sublime-project' then
                    i = i + 1
                    file = file:gsub('\\', '/')
                    local name = file:match('(.*)/'):match('.+/(.+)')
                    local 按钮 = 项目区域:创建纹理按钮('按钮' .. i, 0, 0, 200, 150)
                    function 按钮:左键双击()
                        os.execute('start ' .. './editor/sublime_text.exe ' .. file)
                    end

                    按钮.tex = getscreenshot(name)
                    按钮:置纹理(按钮.tex)
                    if i % 5 ~= 0 then
                        项目区域:同行()
                    end
                end
            end
        end
    end
end
return 项目
