--[[
    @Author       : GGELUA
    @Date         : 2022-02-10 10:58:04
Last Modified by: GGELUA
Last Modified time: 2023-11-05 15:28:39
--]]
local 登录层 = 多开数据[多开数据.当前].__UI界面:创建界面("登录层")
-- local pyx = -1100
local pyx = -780
local zhed = 100

local py2 = 0
local 当前 = 多开数据.当前
function 登录层:初始化()
    self:置精灵(__res:取精灵('shape/ui/1000307.was'):置区域(0,0,引擎.宽度,引擎.高度))
    self.背景 = __res["取精灵"](__res, "shape/ui/EB3FD8C3.was")
    self.ZHED1 = __res["取精灵"](__res, "shape/ui/EC1A0419.was")
    self.ZHED2 = __res["取精灵"](__res, "shape/ui/EC1A0419.was")
	self.标题背景 = __res:取精灵('shape/ui/ABBA0001.was')
    self.猴子=__res:取动画('shape/ui/DC739617.was'):取动画(1):播放(true)
    self.八戒=__res:取动画('shape/ui/22E6E35C.was'):取动画(1):播放(true)
    self.唐僧=__res:取动画('shape/ui/16CC1B46.was'):取动画(1):播放(true)
    self.沙僧=__res:取动画('shape/ui/D8632D20.was'):取动画(1):播放(true)
    self._dt = 0
    self.FPS = 1/60
end
-- function 登录层:更新(dt)
--     self.猴子:更新(dt)
--     self.八戒:更新(dt)
--     self.唐僧:更新(dt)
--     self.沙僧:更新(dt)
--     self._dt = self._dt + dt
--     if self._dt >= self.FPS then
--         self._dt = self._dt - self.FPS
--         py2 = py2 +1
--         if py2 == 5 then
--             py2=0
--             pyx = pyx +1
--             if pyx == -30 then
--                 pyx = -1100
--             end
--         end
--     end
-- end
function 登录层:更新(dt)
    self.猴子:更新(dt)
    self.八戒:更新(dt)
    self.唐僧:更新(dt)
    self.沙僧:更新(dt)
    self._dt = self._dt + dt
    if self._dt >= self.FPS then
        self._dt = self._dt - self.FPS
        -- py2 = py2 + 1
        -- if 2 == py2 then
        --     py2 = 0
            pyx = pyx + 0.3
            zhed= zhed+0.5
            if pyx >= -30 then
                pyx = -780
            end
            if zhed >= 1100 then
                zhed = 100
            end
        -- end
    end
end
function 登录层:显示(x,y)
    self.背景:显示(0 + pyx, 520)
    self.猴子:显示(250,440)
    self.八戒:显示(360,440)
    self.唐僧:显示(490,440)
    self.沙僧:显示(630,430)
    self.ZHED1["显示"](self.ZHED1, 0 + zhed, 570)
    self.ZHED2["显示"](self.ZHED2, 0 + zhed-1100, 570)
    self.标题背景:显示(引擎.宽度/2-195,-40)
    
end    

package.loaded["界面/登录层/登录界面"] = nil
package.loaded["界面/登录层/注册界面"] = nil
package.loaded["界面/登录层/更新界面"] = nil
package.loaded["界面/登录层/选区界面"] = nil
package.loaded["界面/登录层/角色界面"] = nil
package.loaded["界面/登录层/创建界面"] = nil
require("界面/登录层/登录界面")
require("界面/登录层/注册界面")
require("界面/登录层/选区界面")
require("界面/登录层/角色界面")
require("界面/登录层/创建界面")
require("界面/登录层/更新界面")
