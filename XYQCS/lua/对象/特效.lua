--[[
Author: GGELUA
Date: 2023-11-06 09:21:20
Last Modified by: GGELUA
Last Modified time: 2023-11-10 14:42:03
--]]
-- @Author              : GGELUA
-- @Last Modified by    : GGELUA
-- @Date                : 2022-11-02 01:27:45
-- @Last Modified time  : 2022-11-02 23:55:32
local 特效 = class("特效")
function 特效:初始化(t)
    self.xy = require("GGE.坐标")(t.x * 20, t.y * 20):floor()
    self.精灵 = __res:取动画(__res:取地址("shape/mapani/", t.切换)):取动画(1):播放(true)
    self.pid = t.pid
    self.id = t.id
end

function 特效:更新(dt)
    if self.精灵 then
        self.精灵:更新(dt)
    end
end

function 特效:显示(pys)
    if self.精灵 then
        self.精灵:显示(self.xy + pys)
    end
end

return 特效
