--[[
    @Author       : GGELUA
    @Date         : 2022-02-14 15:51:55
Last Modified by: GGELUA
Last Modified time: 2024-06-28 09:24:59
--]]
local 遮罩 = class('遮罩')

function 遮罩:初始化(v)
    self.xy=require("GGE.坐标")(v.x+0,v.y+v.h):floor()
    self.pys=require("GGE.坐标")(0,v.h):floor()
    -- self.id=v.id
end

function 遮罩:更新(dt)

end

function 遮罩:置图像(sf)
    self.精灵 = require("SDL.精灵")(require("SDL.纹理")(sf))
    self.精灵:置透明(150)
end

function 遮罩:显示(xy)
    if self.精灵 then
        self.精灵:显示(self.xy+xy-self.pys)
    end
end

return 遮罩