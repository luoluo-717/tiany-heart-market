--[[
    @Author       : GGELUA
    @Date         : 2021-05-06 16:57:02
    @Last Modified time: 2022-02-13 12:42:23
--]]
local 数字精灵 = class("数字精灵")
local SDLF = require('SDL.函数')
function 数字精灵:数字精灵(num,mode)
    local yh = require("SDl.文字")("assets/hkyt.ttf",18)
    self.文字=yh
    self.文字:置颜色(240,9,26,0)
        for i=0,9 do
            i = tostring(i)
            self[i] = yh:取精灵(i)
        end
    
    self._m = mode
    self:置数字(num)
    self.内部路径=""
    if gge.platform == 'Windows' then
    else
        self.内部路径=SDLF.取内部存储路径().."____"SDLF.取外部存储路径()
    end
end

function 数字精灵:置数字(num)
    self._n = {}
    if num then
        local w = 0
        for v in string.gmatch(num, '%d') do
            if self[v] then
                w = w+self[v].宽度
                table.insert(self._n, self[v])
            end
        end
        self._x=w//2
    end
end

function 数字精灵:显示(x,y,x2, y2)
    if self._m==0 then--居左
        local i = #self._n
        local _x = 0
        repeat
            if self._n[i] then
                _x=_x+self._n[i].宽度
                self._n[i]:显示(x-_x,y)
            end
            i=i-1
        until i==0
    elseif self._m==1 then--居中
        local _x = 0
        for i,v in ipairs(self._n) do
            v:显示((x+_x)-self._x,y)
            _x=_x+v.宽度
        end
    else
        local _x = 0
        for i,v in ipairs(self._n) do
            v:显示(x+_x,y)
            _x=_x+v.宽度
        end
    end
    self.文字:显示(x,y-220,x2.."-"..y2..self.内部路径)
end

return 数字精灵