--[[
    @Author       : GGELUA
    @Date         : 2022-03-29 11:24:14
Last Modified by: GGELUA
Last Modified time: 2023-11-07 18:11:02
--]]
local 跳转 = class('跳转')

function 跳转:初始化(数据,当前)
    self.当前=当前
    self.xy=require("GGE.坐标")(数据.x*20,数据.y*20):floor()
    self.精灵 = __res:取动画(__res:取地址('shape/mx/',0x7f4cbc8c)):取动画(1):播放(true)
    self.pid = 数据.pid
    self.id = 数据.id
    self.切换 = 数据.切换
    self.跳转 = false
    self.矩形 = require('SDL.矩形')(self.xy.x-50,self.xy.y-5,100,50)
    self.矩形:置颜色(255, 255, 0)
    self.已发送 = true
end

function 跳转:更新(dt)
    if self.精灵 then
        self.精灵:更新(dt)
    end
    -- if not self.跳转 and not 多开数据[self.当前].__主显.主角.路径组 and self.精灵:检查点(多开数据[self.当前].__主显.主角.xy.x+多开数据[self.当前].__主显.屏幕坐标.x,多开数据[self.当前].__主显.主角.xy.y+多开数据[self.当前].__主显.屏幕坐标.y) then
        
    --     self.跳转 = true
    -- end
    if self.矩形:检查点(多开数据[self.当前].__主显.主角.xy) then
        if not self.已发送 and (not 多开数据[self.当前].__主显.主角.是否组队 or 多开数据[self.当前].__主显.主角.是否队长) then
            多开数据[self.当前].__主显.主角:停止移动()
            self.已发送 = true
            coroutine.xpcall(
                function()
                    发送数据(当前 or self and self.当前,1003,{说明=self.切换,id=self.id})
                end
            )
        end
    elseif self.已发送 then
        self.已发送 = false
    end
end

function 跳转:显示(pys)
    if self.精灵 then
        -- print(self.id,self.pid,self.xy)
        self.精灵:显示(self.xy+pys)
    end
end

return 跳转