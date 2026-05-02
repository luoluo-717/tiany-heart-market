--[[
    @Author       : GGELUA
    @Date         : 2022-02-13 20:40:11
Last Modified by: GGELUA
Last Modified time: 2023-05-26 13:27:43
--]]
local SDL = require 'SDL'
local 界面层 = 多开数据[多开数据.当前].__UI界面:创建界面("界面层")
local 当前 = 多开数据.当前
function 界面层:初始化()
    -- __res["配置"]["轮盘移动"]=0

end

function 界面层:显示(x,y)
    if self.图像 then
        self.图像:显示(x,y)
    end
    
end

function 界面层:左键按下(x,y)

end

function 界面层:左键弹起(x,y)
    
end

function 界面层:消息事件(msg) --消息事件是协程
    if 多开数据[当前] == nil then return end
    self.msg=msg
    if 多开数据[当前].__UI界面["界面层"]["轮盘移动"]["焦点"] then
        多开数据[当前].__UI界面["界面层"]["轮盘移动"]["焦点"]=false
    end

    if not 多开数据[当前].__主控.战斗中 then
        for i, v in pairsi(多开数据[当前].__主显.显示表) do
            if v.消息事件 then
                v:消息事件(msg, x, y)
            end
        end
    end
    for i, v in ipairs(msg.鼠标) do
        local x, y = v.x, v.y
        if v.button == SDL.BUTTON_LEFT then
            if v.type == SDL.MOUSE_DOWN then
                if x < 0 then
                    break
                end
                self.按下 = os.time()
            elseif v.type == SDL.MOUSE_UP and self.按下 then
                self.按下 = false
                if x < 0 then
                    break
                end
                if not 多开数据[当前].__主控.战斗中 and not self.返回.是否可见 then
                    if 多开数据[当前].__主显.主角 and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长) and not 多开数据[当前].__主显.主角.是否摆摊 and not 多开数据[当前].__主显.主角.是否收购 and __res["配置"]["轮盘移动"]==0 then
                        local xy = require('GGE.坐标')(x, y) - 多开数据[当前].__主显.屏幕坐标
                        多开数据[当前].__主显.主角:设置路径(xy)
                        if 多开数据[当前].__UI界面.窗口层.对话栏.是否可见 then
                            多开数据[当前].__UI界面.窗口层.对话栏:置可见(false)
                        end
                    end
                elseif self.战斗界面.是否可见 and not 多开数据[当前].__UI界面.窗口层.战斗法术.是否可见 and not 多开数据[当前].__UI界面.窗口层.战斗道具.是否可见 then
                    for k,v in pairs(多开数据[当前].__战斗主控.战斗单位) do
                        if v:检查点(x, y) then
                            local 允许选择=false
                            if (not self.战斗界面.命令类型 or self.战斗界面.命令类型 == "攻击" ) and self.战斗界面:取类型选择(v.敌我) then
                                允许选择 = true
                            elseif self.战斗界面.命令类型=="保护" and self.战斗界面:取类型选择(v.敌我,k) then
                                允许选择 = true
                            elseif self.战斗界面.命令类型 == "法术" and v.敌我 == 2 and self.战斗界面:取类型选择(v.敌我) and (self.战斗界面.法术名称 == "后发制人" or not skill增益[self.战斗界面.法术名称]) and not skill恢复[self.战斗界面.法术名称] and (skill减益[self.战斗界面.法术名称] or skill封印[self.战斗界面.法术名称] or skill法攻[self.战斗界面.法术名称] or skill物攻[self.战斗界面.法术名称] or self.战斗界面.法术名称 == "后发制人" or self.战斗界面.法术名称 == "煞气诀" ) then
                                允许选择 = true     
                            elseif self.战斗界面.命令类型 == "法术" and v.敌我 == 1 and (skill恢复[self.战斗界面.法术名称] or skill增益[self.战斗界面.法术名称] or self.战斗界面.法术名称 == "煞气诀") and not skill减益[self.战斗界面.法术名称] and not skill封印[self.战斗界面.法术名称] and not skill法攻[self.战斗界面.法术名称] and not skill物攻[self.战斗界面.法术名称]  then--友方
                                允许选择 = true
                            elseif self.战斗界面.命令类型 == "道具" and self.战斗界面:取类型选择(v.敌我) then
                                允许选择=true
                            elseif self.战斗界面.命令类型 == "灵宝" and self.战斗界面:取类型选择(v.敌我) then
                                允许选择=true
                            elseif self.战斗界面.命令类型=="捕捉" and self.战斗界面:取类型选择(v.敌我,k) then
                                允许选择=true
                            elseif self.战斗界面.命令类型=="指挥" and v.敌我 == 2 then

                            end
                            if 允许选择 then
                                if self.战斗界面.奇袭命令下达 then
                                    self.战斗界面:设置奇袭指令(k)
                                else
                                    self.战斗界面:设置指令(k)
                                end
                                break
                            else
                                多开数据[当前].__UI弹出.提示框:打开("名称："..v.名称.."\n气血："..v.气血.."\n魔法："..(v.魔法 or 0).."\n愤怒："..(v.愤怒 or 0).."\n护盾："..(v.护盾 or 0))
                                break
                            end
                            print("我点击战斗中的目标了")
                        end
                    end
                end
            end
        elseif v.button == SDL.BUTTON_RIGHT then
            if v.type == SDL.MOUSE_UP then

            end
        elseif not v.button and self.按下 and not 多开数据[当前].__主控.战斗中 and not self.返回.是否可见 then
            if v.type == SDL.MOUSE_MOTION then
                if x < 0 then
                    break
                end
                if 多开数据[当前].__主显.主角 and (not 多开数据[当前].__主显.主角.是否组队 or 多开数据[当前].__主显.主角.是否队长) and not 多开数据[当前].__主显.主角.是否摆摊 and not 多开数据[当前].__主显.主角.是否收购 then
                    local xy = require('GGE.坐标')(x, y) - 多开数据[当前].__主显.屏幕坐标
                    多开数据[当前].__主显.主角:设置路径(xy)
                end
            end
        end
    end
end

function 界面层:重置(lx,cz)
    self.图像 = nil
    self.类型 = nil
    if lx == "给予" or lx == "攻击" or lx == "组队" or lx == "交易" then
        self.左上角:置可见(false)
        self.右上角:置可见(false)
        self.左下角:置可见(false)
        self.右下角:置可见(false)
        self.返回:置可见(true,true)
        self.轮盘移动:置可见(false)

        local nsf = require('SDL.图像')(引擎.宽度,引擎.高度)
        
        if nsf:渲染开始() then
            nsf:渲染清除(3,0,0,150)
            local kd =字体18:取宽度("请选择"..lx.."对象")
            __res.UI素材[2]:复制区域(230,964,402,51):拉伸(kd+20,28):显示(引擎.宽度/2-(kd+20)/2,85)
            字体18:置颜色(255,255,255)
            字体18:取图像("请选择"..lx.."对象"):显示(引擎.宽度/2-kd/2,90)
            nsf:渲染结束()
        end
        self.图像 = nsf:到精灵()
        self.类型 = lx
    else
        self.左上角:置可见(true,true)
        self.右上角:置可见(true,true)
        self.左下角:置可见(true,true)
        local 快捷可见 = self.右下角.快捷技能控件.是否可见
        self.右下角:置可见(true,true)
        self.右下角.快捷技能控件:置可见(快捷可见)
        self.队伍栏:置可见(true,true)
        if __res["配置"]["轮盘移动"]==1 then
            self.轮盘移动:置可见(true,true)  -- 修改这里
        end
        if 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==1573 or 多开数据[当前 or self and self.当前].角色信息.地图数据.编号==1574 then
            self.右下角.玩法合集:置可见(true)
        else
            self.右下角.玩法合集:置可见(false)
        end
        if not 多开数据[当前].__主控.已购买 then
            self.左上角.首冲按钮:置可见(true)
        else
            self.左上角.首冲按钮:置可见(false)
        end
        
        self.左下角.拓展界面:置可见(false)
        self.左上角.退出观战:置可见(false)

        if self.左上角.功能栏.是否可见 then
            self.左上角.功能栏:置可见(false)
            self.左上角.左关闭:置坐标(10,85)
        else
            self.左上角.功能栏:置可见(true)
            self.左上角.左关闭:置坐标(465,85)
        end
        if self.右上角.任务栏.是否可见 then
            self.右上角.任务栏:置可见(false)
            self.右上角.右关闭:置坐标(240,210)
        else
            self.右上角.任务栏:置可见(true)
            self.右上角.右关闭:置坐标(82,210)
        end
        if cz then
            self.左上角.时辰按钮:重置(1)
            self.右上角.人物头像:置头像(多开数据[当前 or self and self.当前].角色信息)
            self.右上角.召唤兽头像:置头像(多开数据[当前 or self and self.当前].角色信息.参战宝宝)
        end
        self.右上角.退出:置可见(false)
        self.返回:置可见(false)
        self:置精灵(nil)
    end
end

function 界面层:进入战斗()
    self.右下角:置可见(false)
    if self.右上角.任务栏.是否可见 then
        self.右上角.任务栏:置可见(false)
    end
    self.右上角.右关闭:置可见(false)
    self.队伍栏:置可见(false)
    if 多开数据[当前].__战斗主控.观战开关 then
        self.左上角.退出观战:置可见(true)
    else
        self.左上角.退出观战:置可见(false)
    end
    if 多开数据[当前].__UI界面.窗口层.战斗自动.自动战斗 then
       多开数据[当前].__UI界面.窗口层.战斗自动:置可见(true)
       多开数据[当前].__UI界面.窗口层.战斗自动:重置()
    end
    print(多开数据[当前].__战斗主控.观战开关)
end

function 界面层:退出战斗()
    self.右下角:置可见(true)
    if  self.右上角.右关闭:取坐标() - self.右上角:取坐标() == 240 then
        self.右上角.右关闭:置可见(true)
    else
        self.右上角.任务栏:置可见(true)
        self.右上角.右关闭:置可见(true)
    end
    self.队伍栏:置可见(true)
    多开数据[当前].__UI界面.界面层.战斗界面:置可见(false)
    多开数据[当前].__UI界面.界面层.右上角.退出:置可见(false)
    多开数据[当前].__UI界面.窗口层.战斗自动:置可见(false)
    多开数据[当前].__主显.主角:置战斗(false)
end

local 返回 = 多开数据[当前].__UI界面.界面层:创建控件("返回",860+abbr.py.x,440+abbr.py.y,56,56)
function 返回:初始化()

end
local 返回按钮 = 返回:创建我的按钮(__res.UI素材[2]:复制区域(973,1,56,56),"返回按钮",0,0)


function 返回按钮:左键弹起(x,y,msg)
    界面层:重置(nil)
end

package.loaded["界面/界面层/左上角"] = nil
package.loaded["界面/界面层/右上角"] = nil
package.loaded["界面/界面层/左下角"] = nil
package.loaded["界面/界面层/右下角"] = nil
package.loaded["界面/界面层/战斗界面"] = nil
package.loaded["界面/界面层/队伍栏"] = nil
package.loaded["界面/界面层/IM窗口"] = nil
package.loaded["界面/界面层/轮盘移动"] = nil
require("界面/界面层/左上角")
require("界面/界面层/右上角")
require("界面/界面层/左下角")
require("界面/界面层/右下角")
require("界面/界面层/战斗界面")
require("界面/界面层/队伍栏")
require("界面/界面层/轮盘移动") --武神二爷轮盘

全局界面风格="经典"
function 全局切换界面()
    --__UI界面.界面层.底图框:初始化按钮位置()
    --__UI界面.界面层.左上角:qiehuan(全局界面风格)--时辰
    多开数据[当前].__UI界面.界面层.左上角:qiehuan(全局界面风格)
    -- 多开数据[当前].__UI界面.界面层.右下角:qiehuan(全局界面风格)--底图框
    多开数据[当前].__UI界面.界面层.右上角:qiehuan(全局界面风格)
    --__UI界面.界面层.消息框:qiehuan(全局界面风格)--消息框
    --__UI界面.界面层.右上角:qiehuan(全局界面风格)--人物框
    --tp.窗口.快捷技能栏:qiehuan(全局界面风格)
end
-- 全局切换界面()---C改




