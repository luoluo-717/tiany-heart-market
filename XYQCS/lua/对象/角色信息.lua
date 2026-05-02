--[[
    @Author       : GGELUA
    @Date         : 2022-02-13 20:23:20
Last Modified by: GGELUA
Last Modified time: 2023-05-26 21:37:05
--]]
local 角色信息 = class('角色信息')

function 角色信息:初始化(当前)
    self.模型= "剑侠客"
    self.坐标=require("GGE.坐标")(116*20,56*20)
    self.名称= "孤城月影"
	self.当前=当前
end

function 角色信息:重置属性(属性)
    for n, v in pairs(属性) do
		if type(n)~="function" and type(n)~="运行父函数" and n~="存档数据" and n~="宝宝列表"  then
			if type(n)=="table" then ----------
				self[n]=zdloadstring(zdtostring(v))
			else
				self[n]=v
			end
		end
	end
    self.坐标:pack(self.地图数据.x,self.地图数据.y)
end

return 角色信息