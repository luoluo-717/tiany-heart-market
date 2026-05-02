-- @Author              : GGELUA
-- @Last Modified by    : baidwwy
-- @Date                : 2022-10-27 13:35:43
-- @Last Modified time  : 2024-05-18 04:44:16

IM = require('IMGUI')(引擎, 'assets/simsun.ttc', 14)

--IM:打开DEMO()

主菜单 = IM:创建主菜单栏('主菜单')

require('desktop/菜单')
require('desktop/项目')
--require('desktop/插件')
require('desktop/关于')


-- if gge.platform == 'desktop' then
--     require('desktop/更新')
-- end



return IM
