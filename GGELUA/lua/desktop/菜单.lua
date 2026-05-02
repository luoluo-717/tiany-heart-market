-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-11-14 07:34:54
-- @Last Modified time  : 2022-11-14 07:41:49
local 菜单 = 主菜单:创建菜单('菜单')

local 设置 = 菜单:创建菜单项('设置')
设置:置禁止(true)
function 设置:左键单击()

end

菜单:分隔线()
local 退出 = 菜单:创建菜单项('退出')
function 退出:左键单击()
    引擎:关闭()
end

return 菜单
