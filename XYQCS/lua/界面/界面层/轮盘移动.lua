-- @Author: baidwwy
-- @Date:   2024-01-12 23:42:48
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-30 23:42:47
--[[
Author: GGELUA
Date: 2023-11-06 22:21:32
Last Modified by: GGELUA
Last Modified time: 2023-11-09 22:17:35
--]]
-- @Author              : GGELUA
local qzb={-90,-60,-30,0,30,60,90} --武神二爷轮盘
local jzydck={"人物属性","人物加点","召唤兽属性","召唤兽加点","召唤兽洗炼","召唤兽合宠","召唤兽查看","对话栏","道具行囊","文本栏","商城","仓库","队伍列表"} --轮盘禁止移动窗口
local SDL = require("SDL")
local 轮盘移动 = 多开数据[多开数据.当前].__UI界面["界面层"]["创建控件"](多开数据[多开数据.当前].__UI界面["界面层"], "轮盘移动", 10, 170 + abbr.py.y, 400
    , 370)
local 当前=多开数据.当前

function 轮盘移动:初始化()
    self.记录=true
    self.记录xy=require("GGE.坐标")(0, 0):floor()--{x=0,y=0}
    self.移动time=0
    self.按下time=0
    self.轮盘背景 = __res["取精灵"](__res, "shape/pic/878ad342.was")
    self.轮盘中 = __res["取精灵"](__res, "shape/pic/37f98228.was")
    self.lpbjxy=require("GGE.坐标")(200, 380):floor()
    self.lpbjxy.ax=false
    self.lpzxy=require("GGE.坐标")(200, 380):floor()
    self.lpzxy.ax=false
end

function 轮盘移动:显示(x, y)
    if not 多开数据[当前].__主控["战斗中"] then
        if self:轮盘可移动() then
            self:轮盘移动()
        end
        self.轮盘背景["显示"](self.轮盘背景, self.lpbjxy.x, self.lpbjxy.y)
        self.轮盘中["显示"](self.轮盘中, self.lpzxy.x, self.lpzxy.y)
    end
end

function 轮盘移动:轮盘可移动()
    local fh=true
    for n=1,#jzydck do
        if 多开数据[当前].__UI界面["窗口层"][jzydck[n]]  and 多开数据[当前].__UI界面["窗口层"][jzydck[n]]["是否可见"] then
            fh=false
            break
        end
    end
    return fh
end

function 轮盘移动:轮盘移动() 
    if  多开数据[当前].__UI界面["界面层"]["msg"] and 多开数据[当前].__主显["主角"] and (not 多开数据[当前].__主显["主角"]["是否组队"] or 多开数据[当前].__主显["主角"]["是否队长"]) and not 多开数据[当前].__主显["主角"]["是否摆摊"] and not 多开数据[当前].__主控["战斗中"] then
        local msg=多开数据[当前].__UI界面["界面层"].msg
        for i, v in ipairs(msg["鼠标"]) do
            local x, y = v.x, v.y
            if v.state==SDL.BUTTON_LEFT then
                self.按下time=self.按下time+1
            else
                self.按下time=0
            end
            if v.state==SDL.BUTTON_LEFT and self.记录 and self.按下time>5 then
                self.记录xy=require("GGE.坐标")(x, y):floor()
                self.lpbjxy.x=x
                self.lpbjxy.y=y
                self.lpzxy.x= x
                self.lpzxy.y= y
                self.记录=false
            elseif v.state==0 and self.记录==false then
                self.记录=true
                self.lpbjxy.ax=false
                self.lpzxy.ax=false
                self.按下time=0
            end
            if v.state==SDL.BUTTON_LEFT and self.记录==false then
                self.移动time=self.移动time+1
                self.lpbjxy.ax=true
                self.lpzxy.ax=true
                self.lpzxy.x= x
                self.lpzxy.y= y
                local jlxy=require("GGE.坐标")(x, y)
                local 距离 = self.lpzxy["取距离"](jlxy, self.记录xy)
                if 距离>80 then
                    local pos = self.记录xy
                    local angle = 360 / 30
                    local 弧度=pos:取角度(x, y) --360度
                    local pxy = pos:取距离坐标(100, math.rad((弧度/12)*angle)) --rad角度转弧度
                    self.lpzxy.x= pxy.x
                    self.lpzxy.y= pxy.y
                end
                if self.移动time >= 10 and 距离>35 then
                    local axy = self:取轮盘坐标(self.lpzxy.x,self.lpzxy.y)
                    local xy = require("GGE.坐标")(axy.x, axy.y):floor() - 多开数据[当前].__主显["屏幕坐标"]
                    多开数据[当前].__主显["主角"]["设置路径"](多开数据[当前].__主显["主角"], xy) --武神二爷移动
                    self.移动time=0
                end
            end
            if not self.lpbjxy.ax then
                self.lpbjxy.x = 200
                self.lpbjxy.y = 380
            end
            if not self.lpzxy.ax then
                self.lpzxy.x = 200
                self.lpzxy.y = 380
            end
        end
    end
end

function 轮盘移动:取轮盘坐标(x,y) --武神二爷轮盘
    local axy={}
    local gax= x - self.记录xy.x
    local gay= y - self.记录xy.y
    axy.x=多开数据[当前].__主显["主角"].中间.x + gax
    axy.y=多开数据[当前].__主显["主角"].中间.y + gay
    return axy
end
