--[[
    @Author       : GGELUA
    @Date         : 2022-04-11 09:07:31
    @Last Modified by: GGELUA
    @Last Modified time: 2022-04-11 09:07:32
--]]
-- @Author       : GGELUA
-- @Date         : 2021-09-01 22:40:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2022-03-21 07:01:50

local base = class('base')

function base:初始化()
    self._time = os.time()+300
end

function base:更新时间()
    self._time = os.time()+300
end

function base:检查时间(time)
    return time>self._time
end

return base