--[[
    @Author       : GGELUA
    @Date         : 2022-04-12 21:26:23
Last Modified by: GGELUA
Last Modified time: 2023-05-26 12:52:27
--]]
local 动作 = class('动作')
local ggf = require('GGE.函数')
local 转换子类={
  ["剑侠客"]="刀",
  ["逍遥生"]="剑",
  ["飞燕女"]="环圈",
  ["英女侠"]="鞭",
  ["龙太子"]="枪矛",
  ["巨魔王"]="刀",
  ["虎头怪"]="锤",
  ["狐美人"]="鞭",
  ["骨精灵"]="魔棒",
  ["神天兵"]="枪矛",
  ["舞天姬"]="环圈",
  ["玄彩娥"]="魔棒",
  ["偃无师"]="剑",
  ["巫蛮儿"]="法杖",
  ["鬼潇潇"]="爪刺",
  ["羽灵神"]="法杖",
  ["影精灵"]="魔棒",


}

动作.模型表 = { '静立', '行走' }
function 动作:初始化(t, 当前)
    self.当前 = 当前
    self.模型 = t.模型
    self.变身数据 = t.变身数据
    self.坐骑 = t.坐骑
    -- self.锦衣 = t.锦衣
    self.锦衣 = {}
    self.光环 = {}
    if t.装备 then
        self.武器 = t.装备[3]
    elseif t.武器 then
        self.武器 = t.武器
        if t.武器子类 then
            self.武器子类 = t.武器子类
        end
    end
    if t.装备 and t.装备[4] and t.装备[4].子类 == 911 then
        self.副武器={名称=t.装备[4].名称,子类=t.装备[4].子类,级别限制 = t.装备[4].级别限制 or t.装备[4].等级}
    elseif t.副武器 then
        if ItemData[t.副武器] then
            self.副武器={名称=t.副武器,子类=__quwuqizilei(t.副武器)}
        elseif t.副武器.名称 then
            self.副武器={名称=t.副武器.名称,子类=(t.副武器.子类 or __quwuqizilei(t.副武器.名称)),级别限制=t.副武器["级别限制"] or t.副武器.等级}
        end
    end
    if self.副武器 then
        table.print(self.副武器)
    end
    if t.锦衣 then
		if ItemData[t.锦衣] then --只是单纯的武器名称
			self.锦衣[1]=t.锦衣
		elseif t.锦衣[1] then
			self.锦衣 = t["锦衣"]
		end
	end
    if t.光环 then
		if ItemData[t.光环] then --只是单纯的武器名称
			self.锦衣[3]=t.光环
		elseif t.锦衣[3] then
			self.锦衣[3] = t["光环"]
		end
	end

    self.饰品 = t.显示饰品
    self.染色组 = t.染色组
    self.染色方案 = t.染色方案
    self.炫彩组 = t.炫彩组
    self.炫彩 = t.炫彩
    if t.地图数据 and t.地图数据.方向 then
        self.方向 = t.地图数据.方向 + 1
    elseif t.方向 then
        self.方向 = t.方向 + 1
    else
        self.方向 = 1
    end
    self.动作 = self.模型表[1]
    self.cur_action = {}
    self:置模型()
    self.飞行高度 = 0

end

function 动作:Set当前(当前)
    self.当前 = 当前
end

function 动作:更改模型(t)
    self.模型 = t.模型
    self.变身数据 = t.变身数据
    self.坐骑 = t.坐骑
    self.锦衣 = t.锦衣
    if t.装备 then
        self.武器 = t.装备[3]
    elseif t.武器 then
        self.武器 = t.武器
        if t.武器子类 then
            self.武器子类 = t.武器子类
        end
    end
    if t.装备 and t.装备[4] and t.装备[4].子类 == 911 then
        self.副武器={名称=t.装备[4].名称,子类=t.装备[4].子类,级别限制 = t.装备[4].级别限制 or t.装备[4].等级}
    elseif t.副武器 then
        if ItemData[t.副武器] then
            self.副武器={名称=t.副武器,子类=__quwuqizilei(t.副武器)}
        elseif t.副武器.名称 then
            self.副武器={名称=t.副武器.名称,子类=(t.副武器.子类 or __quwuqizilei(t.副武器.名称)),级别限制=t.副武器["级别限制"] or t.副武器.等级}
        end
    end
    self.饰品 = t.显示饰品
    self.染色组 = t.染色组
    self.染色方案 = t.染色方案
    self.炫彩组 = t.炫彩组
    self.炫彩 = t.炫彩
    self:置模型()
end

function 动作:置锦衣(t)
    self.锦衣 = t
    self:置模型()
end

function 动作:判断一体坐骑(卸下)
    if not 卸下 then
		if  self.变身数据 == nil and self.坐骑 and self.坐骑.模型 and 一体坐骑表[self.坐骑.模型] and __res.配置.显示坐骑==1  then
			self:yitizuoqi(self.模型,self.坐骑.模型)
			return true
		end
	end
end

function 动作:置模型()
    local 无素材 = false
    self.actions = {}
    self.body = {}
    self.arms = {}
    self.Mount = {}
    self.MountAcc = {}
    self.GuangH = {}
    self.fwqsc={}
    self.halo = {}
    self.guanghuan=nil
    self.footprint = {}
    local 允许武器 = true
    local lssj
    local 修正武器子类=false
    
    if self.锦衣 and self.锦衣[2] and self.副武器 and self.副武器.子类==911 then
        修正武器子类=true
    end
    if not self.变身数据 or __res.配置.显示变身造型 ~= 1 then
        if 锦衣文件完整 then
            self.置光环(self)
            self.置足迹(self)
        end
        if 坐骑文件完整 and self:判断一体坐骑(卸下) then
            return
        end
            
        if self.锦衣 and self.锦衣[1]  and  __res.配置.锦衣 == 1 then
            local 锦衣名称 = self.锦衣[1].名称
            if type(self.锦衣[1]) == "string" then
                锦衣名称 = self.锦衣[1]
            end
            if 锦衣名称 and (string.find(锦衣名称,"青花瓷月白") or string.find(锦衣名称,"胖胖龙") or string.find(锦衣名称,"黑麒麟")or string.find(锦衣名称,"锦鲤")
                or string.find(锦衣名称,"青花瓷月黑")or string.find(锦衣名称,"灼灼韶华") or string.find(锦衣名称,"龙行玉泽") or string.find(锦衣名称,"萌龙咆哮") or string.find(锦衣名称,"齐天大圣月白")or string.find(锦衣名称,"齐天大圣月黑") ) then
                允许武器 = false
                lssj =取祥瑞模型(self.模型,锦衣名称)
            else
                local 武器类型 = nil
                if self.武器 then 
                    if self.模型=="影精灵" and self.锦衣[2] and self.武器.子类==910 then
                        self.武器.子类=8
                        修正武器子类=true
                    end
                    武器类型 = 多开数据[self.当前].__主控:取武器子类(self.武器.子类)

                    if self.锦衣 and self.锦衣[2] and self.锦衣[2].名称=="恶魔棘刺" then
                        武器类型 = 转换子类[self.模型]
                    end
                end
                if self.武器 then
                    lssj = 取普通锦衣模型(锦衣名称, self.模型, self.武器.子类)
                else
                    lssj = 取普通锦衣模型(锦衣名称, self.模型)
                end
            end
        end
        if lssj and lssj[1] then
            table.print(lssj)
            local paths,dz,dz2 =  __res:取地址('shape/mx/zj/', lssj[1])
            self.Mount.静立 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/zj/', lssj[2])
            self.Mount.行走 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            if self.副武器 and self.副武器.子类==911 and 允许武器 and not 修正武器子类 then
                m = self.副武器.名称
                local lssj1 = 取模型(m .. "_" .. self.模型)
                 local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj1[1])
                 self.fwqsc.静立 = __res:取动画2(paths):置循环(true)
                 if paths == 'shape/FCD58523.was' then
                     table.insert(__下载数据,{dz})
                     --table.insert(__下载数据,{dz2})
                     无素材 = true
                 end
                 local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj1[2])
                 self.fwqsc.行走 = __res:取动画2(paths):置循环(true)
                 if paths == 'shape/FCD58523.was' then
                     table.insert(__下载数据,{dz})
                     --table.insert(__下载数据,{dz2})
                     无素材 = true
                 end
             end
            if self.武器 and 允许武器 then
                if self.模型=="影精灵" and self.锦衣[2] and self.武器.子类==910 then
                    self.武器.子类=8
                    修正武器子类=true
                end
                local m = 多开数据[self.当前].__主控:取武器子类(self.武器.子类) or self.武器子类
                local 资源='shape/mx/'
                if self.武器.级别限制 then self.武器.等级 = self.武器.级别限制 end
                    m = 多开数据[self.当前].__主控:取武器附加名称(self.武器.子类, self.武器.等级,  self.武器.名称) or self.武器
                    lssj = 取模型(m .. "_" .. self.模型)
                if self.锦衣 and self.锦衣[2] and self.锦衣[2].名称 then
                    if self.锦衣[2].名称=="恶魔棘刺" then
                        lssj = 取普通武器装扮(self.锦衣[2].名称,self.模型)
                    else
                        lssj = 取普通武器装扮(self.锦衣[2].名称,self.模型,self.武器.子类)
                    end
                    资源='shape/mx/zj3/'
                end
                local paths,dz,dz2 =  __res:取地址(资源, lssj[1])
                self.arms.静立 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
                local paths,dz,dz2 =  __res:取地址(资源, lssj[2])
                self.arms.行走 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
            end
        elseif self.坐骑 and self.坐骑.模型 and 坐骑库(self.模型, self.坐骑.模型, self.坐骑.饰品 or "空", self.坐骑.饰品2 or "空")  and not 一体坐骑表[self.坐骑.模型] and __res.配置.显示坐骑==1  then
            lssj = 坐骑库(self.模型, self.坐骑.模型, self.坐骑.饰品 or "空", self.坐骑.饰品2 or "空")
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj.坐骑站立)
            self.Mount.静立 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj.坐骑行走)
            self.Mount.行走 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            if lssj.坐骑饰品站立 and lssj.坐骑饰品行走 then
                local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj.坐骑饰品站立)
                self.MountAcc.静立 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
                local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj.坐骑饰品行走)
                self.MountAcc.行走 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj.人物站立)
            self.actions.静立 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj.人物行走)
            self.actions.行走 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
        elseif self.武器 then
            local m = 多开数据[self.当前].__主控:取武器子类(self.武器.子类) or self.武器子类
            lssj = 取模型(self.模型, m)
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
            self.actions.静立 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[2])
            self.actions.行走 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            if self.武器 and 允许武器 then
                if self.模型=="影精灵" and self.锦衣[2] and self.武器.子类==910 then
                    self.武器.子类=8
                    修正武器子类=true
                end
                local 资源='shape/mx/'
                local m = 多开数据[self.当前].__主控:取武器子类(self.武器.子类) or self.武器子类
                if self.武器.级别限制 then self.武器.等级 = self.武器.级别限制 end
                m = 多开数据[self.当前].__主控:取武器附加名称(self.武器.子类, self.武器.等级,  self.武器.名称) or self.武器
                lssj = 取模型(m .. "_" .. self.模型)

                if self.锦衣 and self.锦衣[2] and self.锦衣[2].名称 then
                    资源='shape/mx/zj3/'
                    if self.锦衣[2].名称=="恶魔棘刺" then
                        lssj = 取普通武器装扮(self.锦衣[2].名称,self.模型)
                    else
                        lssj = 取普通武器装扮(self.锦衣[2].名称,self.模型,self.武器.子类)
                    end
                end

                local paths,dz,dz2 =  __res:取地址(资源, lssj[1])
                self.arms.静立 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
                local paths,dz,dz2 =  __res:取地址(资源, lssj[2])
                self.arms.行走 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
            --     if 武器 and 武器.染色方案  then
			-- 	self.置调色(self)
			-- end
            end
            
            if self.副武器 and self.副武器.子类==911 and not 修正武器子类 then--
                m = self.副武器.名称
                local lssj1 = 取模型(m .. "_" .. self.模型)
                 local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj1[1])
                 self.fwqsc.静立 = __res:取动画2(paths):置循环(true)
                 if paths == 'shape/FCD58523.was' then
                     table.insert(__下载数据,{dz})
                     --table.insert(__下载数据,{dz2})
                     无素材 = true
                 end
                 local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj1[2])
                 self.fwqsc.行走 = __res:取动画2(paths):置循环(true)
                 if paths == 'shape/FCD58523.was' then
                     table.insert(__下载数据,{dz})
                     --table.insert(__下载数据,{dz2})
                     无素材 = true
                 end
             end
        else
            if self.模型 == nil then self.模型 = "火星人" end
            lssj = 取模型(self.模型)
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
            self.actions.静立 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[2])
            self.actions.行走 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            lssj = 取模型(self.模型 .. "_身体")
            if lssj[2] and lssj[1] then
                local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
                self.body.静立 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
                local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[2])
                self.body.行走 = __res:取动画2(paths):置循环(true)
                if paths == 'shape/FCD58523.was' then
                    table.insert(__下载数据,{dz})
                    table.insert(__下载数据,{dz2})
                    无素材 = true
                end
            end
            if self.饰品 then
                lssj = 取模型(self.模型 .. "_饰品")
                if lssj[2] and lssj[1] then
                    local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
                    self.arms.静立 = __res:取动画2(paths):置循环(true)
                    if paths == 'shape/FCD58523.was' then
                        table.insert(__下载数据,{dz})
                        table.insert(__下载数据,{dz2})
                        无素材 = true
                    end
                    local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[2])
                    self.arms.行走 = __res:取动画2(paths):置循环(true)
                    if paths == 'shape/FCD58523.was' then
                        table.insert(__下载数据,{dz})
                        table.insert(__下载数据,{dz2})
                        无素材 = true
                    end
                end
            else
                lssj = 取模型(self.模型 .. "_装饰")
                if lssj[2] and lssj[1] then
                    local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
                    self.arms.静立 = __res:取动画2(paths):置循环(true)
                    if paths == 'shape/FCD58523.was' then
                        table.insert(__下载数据,{dz})
                        table.insert(__下载数据,{dz2})
                        无素材 = true
                    end
                    local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[2])
                    self.arms.行走 = __res:取动画2(paths):置循环(true)
                    if paths == 'shape/FCD58523.was' then
                        table.insert(__下载数据,{dz})
                        table.insert(__下载数据,{dz2})
                        无素材 = true
                    end
                end
            end
        end
        if self.炫彩 then
            -- self.置炫彩调色(self)
        elseif self.染色方案 then
            self.置调色(self)
        end
    else
        lssj = 取模型(self.变身数据)
        local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
        self.actions.静立 = __res:取动画2(paths):置循环(true)
        self.actions.行走 = __res:取动画2(__res:取地址('shape/mx/', lssj[2])):置循环(true)
        lssj = 取模型(self.变身数据 .. "_身体")
        if lssj[2] and lssj[1] then
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
            self.body.静立 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[2])
            self.body.行走 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
        end
        lssj = 取模型(self.变身数据 .. "_装饰")
        if lssj[2] and lssj[1] then
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[1])
            self.arms.静立 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
            local paths,dz,dz2 =  __res:取地址('shape/mx/', lssj[2])
            self.arms.行走 = __res:取动画2(paths):置循环(true)
            if paths == 'shape/FCD58523.was' then
                table.insert(__下载数据,{dz})
                table.insert(__下载数据,{dz2})
                无素材 = true
            end
        end
    end
    lssj = nil
   
    if 无素材 then
        __下载数据[#__下载数据][2] = self
        coroutine.wrap(function ()
            httpdata:检查更新()
        end)()
    end
    self:置动作(self.动作)
    self:置方向(self.方向)
end

function 动作:置光环()
    if self.锦衣 and self.锦衣[3] then
        local lssj = 取光环(self.锦衣[3]["名称"] or self.锦衣[3])
        self.halo["静立"] = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", lssj[1]))["置循环"](__res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", lssj[1])), true)
        self.halo["行走"] = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", lssj[2]))["置循环"](__res["取动画2"](__res, __res["取地址"](__res, "shape/mx/", lssj[2])), true)
        self.guanghuan=true
    end
end
function 动作:置足迹()
    if self.锦衣 and self.锦衣[4] then
        local lssj = 取足迹(self.锦衣[4]["名称"] or self.锦衣[4])
        self.footprint["静立"] = __res["取动画2"](__res, __res["取地址"](__res, "shape/mx/zj2/", lssj[1]))["置循环"](__res["取动画2"](__res, __res["取地址"](__res, "shape/mx/zj2/", lssj[1])), true)
        self.footprint["行走"] = self.footprint["静立"]
    end
end

function 动作:yitizuoqi()
    self.actions["静立"] = __res:取动画2(__res:取地址("shape/zuoqi/", 一体坐骑表[self.坐骑.模型][self.模型].站)):置循环(true)
    self.actions["行走"] = __res:取动画2(__res:取地址("shape/zuoqi/", 一体坐骑表[self.坐骑.模型][self.模型].跑)):置循环(true)
    self:置动作(self.动作)
    self:置方向(self.方向)
end

function 动作:置调色()
    if self.变身数据 or self.锦衣 and self.锦衣[1]  and __res.配置.锦衣 == 1 then
        return
    end
    local dz = { "静立", "行走" }
    for i, v in ipairs(dz) do
        if self.actions[v] and self.染色组[1] ~= 0 and self.染色组[2] ~= 0 and self.染色组[3] ~= 0 then
            __res:置染色(self.actions[v], self.染色方案, self.染色组[1], self.染色组[2], self.染色组[3])
        end
        if self.body[v] and self.染色组[1] ~= 0 and self.染色组[2] ~= 0 then
            __res:置染色(self.body[v], self.染色方案, self.染色组[1], self.染色组[2])
        end
        if self.arms[v] and self.武器 and self.武器.染色组 and self.武器.染色组[1] ~= 0 and self.武器.染色组[2] ~= 0 then
            __res:置染色(self.arms[v], self.武器.染色方案, self.武器.染色组[1], self.武器.染色组[2])
        end
    end
end

function 动作:置炫彩调色()
    if self.变身数据 or self.锦衣 and self.锦衣[1] then
        return
    end
    local dz = { "静立", "行走" }
    local rsid = self.炫彩组[1][1].R ..
        self.炫彩组[1][1].G ..
        self.炫彩组[1][1].B ..
        self.炫彩组[1][2].R ..
        self.炫彩组[1][2].G .. self.炫彩组[1][2].B .. self.炫彩组[1][3].R ..
        self.炫彩组[1][3].G .. self.炫彩组[1][3].B
    local rsid = tonumber(self.炫彩组[1][1].R .. self.炫彩组[1][1].G .. self.炫彩组[1][1].B) +
        tonumber(self.炫彩组[1][2].R .. self.炫彩组[1][2].G .. self.炫彩组[1][2].B) +
        tonumber(self.炫彩组[1][3].R .. self.炫彩组[1][3].G .. self.炫彩组[1][3].B)
    for i, v in ipairs(dz) do
        if self.actions[v] then
            self.actions[v]:炫彩调色(self.wpal, 16843008, self.炫彩组, rsid)
        end
        if self.body[v] then
            self.body[v]:炫彩调色(self.wpal, 16843008, self.炫彩组, rsid)
        end
    end
end

function 动作:置动作(v)
    self.cur_action = {}
    self.动作 = v
    local 加入数据 = ggf.insert(self.cur_action)
    if self.halo[v] then
        加入数据(self.halo[v])
    end
    -- if self.GuangH[v] then
    --     加入数据(self.GuangH[v])
    -- end
    if v=="行走" and self.footprint[v] then
        加入数据(self.footprint[v])
    end

    if self.Mount[v] then
        self.Mount[v].坐骑动画 = true
        加入数据(self.Mount[v])
    end
    if self.MountAcc[v] then
        加入数据(self.MountAcc[v])
    end
    if self.fwqsc[v] then
        加入数据(self.fwqsc[v])
    end
    if self.actions[v] then
        加入数据(self.actions[v])
    end
    if self.body[v] then
        加入数据(self.body[v])
    end
    if self.arms[v] then
        加入数据(self.arms[v])
    end
end

local function 置当前(self, k, ...)
    if self.cur_action then
        self.cur_action[k](self.cur_action, ...)
    end
end

local function 置所有(self, k, ...)
    for _, v in pairs(self.Mount) do
        v[k](v, ...)
    end
    for _, v in pairs(self.MountAcc) do
        v[k](v, ...)
    end
    for _, v in pairs(self.footprint) do
        v[k](v, ...)
    end
    for _, v in pairs(self.actions) do
        v[k](v, ...)
        self:处理坐骑修正(v)
    end
    for _, v in pairs(self.body) do
        v[k](v, ...)
    end
    for _, v in pairs(self.fwqsc) do
        v[k](v, ...)
    end
   
    for _, v in pairs(self.arms) do
        v[k](v, ...)
    end
    for _, v in pairs(self.halo) do
        v[k](v, ...)
    end
    -- for _, v in pairs(self.GuangH) do
    --     v[k](v, ...)
    -- end
    return self
end

function 动作:处理坐骑修正(v)
    v.坐骑修正 = nil
    if self.坐骑 and self.坐骑.模型 then
        local 坐骑修正 = {}
        坐骑修正.x, 坐骑修正.y = 坐骑补差(self.方向, self.坐骑.模型, self.模型)
        v.坐骑修正 = require("GGE.坐标")(坐骑修正.x, 坐骑修正.y)
    end
end

function 动作:置方向(v)
    self.方向 = v
    置所有(self, '置方向', v)
end

function 动作:取方向()
    return self.方向
end

function 动作:取高亮()
    return self.cur_action and self.cur_action:取高亮()
end

function 动作:置高亮(...)
    置所有(self, '置高亮', ...)
    return self
end

function 动作:置颜色(...)
    置所有(self, '置颜色', ...)
    return self
end

function 动作:帧同步()
    置当前(self, '置首帧')
    置当前(self, '播放')
    return self
end

function 动作:播放()
    置当前(self, '播放')
    return self
end

function 动作:置首帧()
    置当前(self, '置首帧')
    return self
end

function 动作:置尾帧()
    置当前(self, '置尾帧')
    return self
end

function 动作:置循环(...)
    置当前(self, '置循环', ...)
    return self
end

function 动作:更新(dt)
    for _, v in ipairs(self.cur_action) do
        v:更新(dt)
    end
end
function 动作:显示(xy,feixing)------C改飞行
    if self.guanghuan then
        for _, v in ipairs(self.cur_action) do
            v:显示(xy)
        end
        if not feixing then
            多开数据[self.当前].__主显.影子:显示(xy)
        end
    else
        if not feixing then
            多开数据[self.当前].__主显.影子:显示(xy)
        end
        for _, v in ipairs(self.cur_action) do
            v:显示(xy)
        end
    end
end


function 动作:检查点(x, y)
    for _, v in ipairs(self.cur_action) do
        if v:检查点(x, y) then
            return true
        end
    end
end

function 动作:检查透明(x, y)
    local r = false
    for _, v in ipairs(self.cur_action) do
        if not r then
            r = v:检查透明(x, y)
        end
    end
    return r
end

return 动作
