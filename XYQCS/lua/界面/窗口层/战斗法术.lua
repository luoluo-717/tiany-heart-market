--[[
    @Author       : GGELUA
    @Date         : 2022-03-04 00:30:34
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:36:33
--]]
local SDL = require('SDL')
local 战斗法术 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("战斗法术",130 + abbr.py.x, 20 + abbr.py.y,365,438)
local 当前 = 多开数据.当前
function 战斗法术:初始化()
    __置窗口坐标(self,'右')
end
function 战斗法术:打开(data,lx,冷却,如意神通,黎魂,追加法术)
    self:置可见(true)
    多开数据[当前].__UI界面.界面层.战斗界面:置可见(false)
    if lx == '角色' then
        self.类型 = '人物'
    elseif lx == 'bb' then
        self.类型 = '召唤兽'
        if fl == '子女' then
            self.类型 = '子女'
        else
            self.类型 = '召唤兽'
        end
    end
    self:置技能(data,冷却,如意神通)
    self.选中 = nil
    ---------------------------------------------------C改
    if 黎魂 then self.黎魂=黎魂 end
    self.九黎已使用次数 = 0
    local 单位编号 = 多开数据[当前].__UI界面.界面层.战斗界面.单位编号[多开数据[当前].__UI界面.界面层.战斗界面.操作对象]
    local 战斗指令 = 多开数据[当前].__UI界面.界面层.战斗界面
    if 战斗指令 and 战斗指令.九黎多次 then
        local 九黎记录 = 战斗指令.九黎多次[单位编号]
        if 九黎记录 then
            if type(九黎记录) == "table" and #九黎记录 > 0 then
                self.九黎已使用次数 = #九黎记录
            end
        end
    end
    self.参战单位 = 多开数据[当前].__战斗主控.战斗单位
    self.操作对象愤怒 = 多开数据[当前].__UI界面.界面层.战斗界面.参战单位[单位编号].愤怒
    self.操作对象门派 = 多开数据[当前].__UI界面.界面层.战斗界面.参战单位[单位编号].门派
    self.操作对象黎魂 = 多开数据[当前].__UI界面.界面层.战斗界面.参战单位[单位编号].黎魂
    local 剩余黎魂次数 = 0
    if self.操作对象黎魂 then
        剩余黎魂次数 = self.操作对象黎魂 - self.九黎已使用次数
        if 剩余黎魂次数 < 0 then
            剩余黎魂次数 = 0
        end
    end

    local nsf = require('SDL.图像')(354,438)
    if nsf:渲染开始(0,0,0,0) then
        __res:getPNGCC(2,0,63,354,396):拉伸(354,408):显示(0,10)
        local 宽度 = 字体20:取宽度("法术")
        字体20:置颜色(255,255,255)
        if 多开数据[当前].__UI界面.界面层.战斗界面.命令类型 == "特技" then
            字体20:取图像("特技"):显示(354/2-宽度/2,0+22)
            字体18:取图像("当前愤怒："..self.操作对象愤怒.."/150"):显示(103,60)
        else
            字体20:取图像("法术"):显示(354/2-宽度/2,0+22)
            if self.操作对象黎魂 and self.操作对象门派=="九黎城" then
                字体18:置颜色(__取颜色('白色'))
                字体18:取图像("还可操作："..剩余黎魂次数.."次"):显示(128,60)
            end
        end
        字体18:置颜色(__取颜色('黄色'))
        字体18:取图像('提示：点击技能按钮两次使用技能'):显示(40,388)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())

    ---------------------------------------------------C改

end

local 关闭 = 战斗法术:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",318,0)

function 关闭:左键弹起(x,y,msg)
    多开数据[当前].__UI界面.窗口层.战斗法术:置可见(false)
    多开数据[当前].__UI界面.界面层.战斗界面:重置()
    多开数据[当前].__UI界面.界面层.战斗界面:置可见(true)
end

local 技能网格 = 战斗法术:创建网格("技能网格",18,80,325,300)

function 技能网格:初始化()
    self:创建格子(100,100,7,12,9,3,true)
end

function 技能网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and 战斗法术.技能数据 and 战斗法术.技能数据[a] and not 战斗法术.技能数据[a].剩余冷却回合 and not 战斗法术.技能数据[a].不可选择 then
        if not 战斗法术.选中 or 战斗法术.选中 ~= a then
            战斗法术.选中 = a
        else
            多开数据[当前].__UI界面.窗口层.战斗法术:置可见(false)
            多开数据[当前].__UI界面.界面层.战斗界面:置可见(true)
            多开数据[当前].__UI界面.界面层.战斗界面:设置法术参数(self.子控件[a].技能信息,战斗法术.法术类型)
        end
    end
end

function 战斗法术:置技能(data, 冷却, 如意神通)
    self.技能数据 = data
    for i = 1, #技能网格.子控件 do
        if self.技能数据[i] then
            local nsf = require('SDL.图像')(100, 100)
            local lssc = 取技能信息(self.技能数据[i].名称)
            local 门派=多开数据[当前].__UI界面.界面层.战斗界面.参战单位[多开数据[当前].__UI界面.界面层.战斗界面.单位编号[ 多开数据[当前].__UI界面.界面层.战斗界面.操作对象]].门派
            local tux = require("SDL.图像")
            if nsf:渲染开始() then
                nsf:渲染清除(0, 0, 0, 255)
                if lssc[9] then
                    if self.技能数据[i].剩余冷却回合 then
                        if self:技能在如意神通中(self.技能数据[i].名称, 如意神通) then
                            __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(55, 55):显示(20, 20)
                        else
                            __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(55, 55):到灰度():显示(20, 20)
                            self.技能数据[i].不可选择 = true
                        end
                    else
                        if self:技能在如意神通中(self.技能数据[i].名称, 如意神通) then
                            __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(55, 55):显示(20, 20)
                        else
                            __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(55, 55):到灰度():显示(20, 20)
                            self.技能数据[i].不可选择 = true
                        end
                    end
                else
                    if self.技能数据[i].剩余冷却回合 then
                      if lssc[10] then
                        tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[门派].."/"..__jingmaimiaoshu[self.技能数据[i].名称]..".jpg"):到灰度():拉伸(55, 55):显示(20,20)
                      else
                        __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(55, 55):到灰度():显示(20, 20)
                      end
                        self.技能数据[i].不可选择 = true
                    else
                      if lssc[10] then
                        tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[门派].."/"..__jingmaimiaoshu[self.技能数据[i].名称]..".jpg"):拉伸(55, 55):显示(20,20)
                      else
                        __res:取图像(__res:取地址('shape/jn/', lssc[7])):拉伸(55, 55):显示(20, 20)
                      end
                    end
                end

                

                多开数据[当前].__主控.公用蒙版2:显示(-4, -3)
                local 宽度 = 字体20:取宽度(self.技能数据[i].名称)
                字体18:置颜色(255, 255, 255)
                字体18:取图像(self.技能数据[i].名称):显示(100/2-宽度/2, 80)
                if self.技能数据[i].剩余冷却回合 and not 如意神通 then----------CC改显示技能冷却
                    字体25:置颜色(__取颜色("白色"))
                    local A
                    if self.技能数据[i].剩余冷却回合>9 then
                        A=0
                    elseif self.技能数据[i].剩余冷却回合>99 then
                        A=-3
                    else
                        A=6
                    end
                    字体25:取图像(self.技能数据[i].剩余冷却回合):显示(33+A,35)
                end
                nsf:渲染结束()
            end

            local sc = nsf:到精灵()
            -- sc:置混合(2)
            技能网格.子控件[i]:置精灵(sc)
            技能网格.子控件[i].技能信息 = self.技能数据[i]
        else
            技能网格.子控件[i]:置精灵()
        end
    end
end



function 战斗法术:技能在如意神通中(技能名称, 如意神通)
    for _, v in ipairs(如意神通) do
        if v == 技能名称 then
            return true
        end
    end
    return false
end
