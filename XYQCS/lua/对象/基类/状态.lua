--[[
    @Author       : GGELUA
    @Date         : 2022-04-12 21:26:33
Last Modified by: GGELUA
Last Modified time: 2023-07-27 22:13:51
--]]
local 状态 = class('状态')
local SDL = require 'SDL'
function 状态:初始化(t,当前)
    self.当前 = 当前
    self.名称 = t.名称
    self.历劫 = t.历劫

    if t.月卡 and t.月卡.生效 and os.time() - t.月卡.到期时间 <= 0 then
        self.月卡=true
    end

    self:置名称(t.名称)
    self:置称谓(t.当前称谓 or t.称谓)
     if t.当前称谓 then
        self:置称谓(t.当前称谓)
        
    end
    self._addon = {}
    self:置队长(t.队长)
    self:置战斗(t.战斗开关)
    self:置摆摊(t.摊位名称)
    self:置收购(t.收购摊位名称)
end


function 状态:置名称(v)
    if v then
        if self.月卡 then
            self._name = 名字17:置颜色(255,20,147,255):取我的投影精灵(v,29,36,15,160)
        else
            名字17:置颜色(多开数据[self.当前].__主控:取名称颜色(v,self.历劫,ggetype(self),self.pk))
            self._name = 名字17:取我的投影精灵(v,29,36,15,160)
        end
        self._name:置中心(self._name.宽度 // 2, -15)
    end
end

function 状态:置称谓(v)
  self._title=nil
  self.当前称谓=""
  if v and "无" ~= v and "" ~= v then
          self.当前称谓=v
          if v=="山雨欲来风满楼" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000049)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="人生若只如初见" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000043)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="何事秋风悲画扇" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000044)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="秋水共长天一色" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000045)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
             elseif v=="落霞与孤鹜齐飞" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000046)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
             elseif v=="天涯何处无芳草" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000047)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="多情却被无情恼" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000048)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
             elseif v=="情逢何必曾相识" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000050)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="自称臣是酒中仙" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000051)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="心有灵犀一点通" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000052)):取动画(1):播放(true) 
              self._title:置中心(3, -65)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="威震天下" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000000)):取动画(1):播放(true) 
              self._title:置中心(3, -44)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            
            elseif v=="精锐组冠军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000056)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="精锐组亚军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000058)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="精锐组季军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000057)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)


            elseif v=="神威组冠军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000053)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="神威组亚军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000055)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="神威组季军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000054)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)

            elseif v=="天科组冠军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000059)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="天科组亚军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000061)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="天科组季军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000060)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)

            elseif v=="天元组冠军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000062)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="天元组亚军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000064)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="天元组季军" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000063)):取动画(1):播放(true) 
              self._title:置中心(83, -15)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)

            elseif v=="神豪" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000065)):取动画(1):播放(true) 
              self._title:置中心(0, -40)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="傲视群雄唯我独尊" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x10000066)):取动画(1):播放(true) 
              self._title:置中心(0, -40)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-23)
            elseif v=="苍茫三界主沉浮" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x00000127)):取动画(1):播放(true) 
              self._title:置中心(-3, -20)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-13)
            elseif v=="一举成名天下惊" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x00000128)):取动画(1):播放(true) 
              self._title:置中心(2, -23)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-13)
            elseif v=="独步西游若等闲" then
              self._title =__res:取动画(__res:取地址("shape/ui/xz/",0x00000129)):取动画(1):播放(true) 
              self._title:置中心(4, -25)
              self._name:置中心(self._name.宽度 // 2, -self._name.高度-13)
          else
             
            --   if v=="虹光" then
            --     self._title = 技能字体:置颜色(255, 1, 1, 255):取投影精灵(v,0,0,0,120)
            --   elseif v=="云影" then
            --       self._title = 技能字体:置颜色(0,0,240, 255):取投影精灵(v,0,0,0,120)

            --   elseif v=="彩虹霸主" or  v=="帮战之星"  then
            --       self._title = 技能字体:置颜色(255, 1, 255, 255):取投影精灵(v,0,0,0,120)
            --   else
             self._title = 字体18:置颜色(110, 161, 211, 255):取投影精灵(v,0,0,0,120)
            --   end
              self._title:置中心(self._title.宽度 // 2, -self._title.高度+3)
              self._name:置中心(self._name.宽度 // 2, -self._title.高度-self._name.高度)
          end 
  else
      self._name:置中心(self._name.宽度 // 2,-self._name.高度+3)
  end
end

function 状态:置状态(k, v)
    if v then
        self._addon[k] = 多开数据[self.当前].__主控[k]
        self._addon[k]:置中心(0, 100)
    else
        self._addon[k] = nil
    end
end

function 状态:置队长(v)
    self.是否队长 = v
    self:置状态('队长令牌', v)
end

function 状态:置战斗(v)
    self.是否战斗 = v
    self:置状态('战斗令牌', v)
end

function 状态:置任务(v)
    self.是否任务 = v
    self:置状态('任务令牌', v)
end

function 状态:置任战(v)
    self.是否任战 = v
    self:置状态('任战令牌', v)
end

function 状态:置摆摊(v)
    self.是否摆摊 = v
    if not v then
        self.store = nil
    else

        local nsf = require('SDL.图像')(108,24)
        if nsf:渲染开始() then
            多开数据[self.当前].__主显.摊位:显示(0,0)
            local 宽度 = 字体16:取宽度(v)
            字体16:置颜色(8,108,240)
            字体16:取图像(v):显示(108/2-宽度/2,3)
            nsf:渲染结束()
        end
        self.store = nsf:到精灵()
        self.store:置中心(108/2,120)
    end
end

function 状态:置收购(v)
    self.是否收购 = v
    if not v then
        self.sstore = nil
    else
        local nsf = require('SDL.图像')(108,24)
        if nsf:渲染开始() then
            多开数据[self.当前].__主显.收购:显示(0,0)
            -- 多开数据[self.当前].__主显.摊位:显示(0,0)

            local 宽度 = 字体16:取宽度(v)
            字体16:置颜色(8,108,240)
            字体16:取图像(v):显示(108/2-宽度/2,3)
            nsf:渲染结束()
        end
        self.sstore = nsf:到精灵()
        self.sstore:置中心(108/2,120)
    end
end

function 状态:更新(dt)
    -- if self._shout then
    --     self._shout:更新(dt)
    -- end
    -- if self._title then
    --     self._title:更新(dt)
    -- end
    for k, v in pairs(self._addon) do
        v:更新(dt)
    end
    if self.当前称谓 and  self.当前称谓~="无" and  self.当前称谓~="" and (self.当前称谓=="初入三界" or self.当前称谓=="人生若只如初见" or self.当前称谓=="何事秋风悲画扇" 
    or self.当前称谓=="秋水共长天一色"  or self.当前称谓=="落霞与孤鹜齐飞" or self.当前称谓=="天涯何处无芳草" or self.当前称谓=="多情却被无情恼" or self.当前称谓=="情逢何必曾相识"
    or self.当前称谓=="自称臣是酒中仙" or self.当前称谓=="心有灵犀一点通" or self.当前称谓=="威震天下" or self.当前称谓=="神威组冠军" or self.当前称谓=="神威组亚军" or self.当前称谓=="神威组季军"
    or self.当前称谓=="精锐组冠军" or self.当前称谓=="精锐组亚军" or self.当前称谓=="精锐组季军" or self.当前称谓=="天科组冠军"  or self.当前称谓=="天科组亚军" or self.当前称谓=="天科组季军"
    or self.当前称谓=="天元组冠军" or self.当前称谓=="天元组亚军" or self.当前称谓=="天元组季军" or self.当前称谓=="神豪" or self.当前称谓=="傲视群雄唯我独尊" or self.当前称谓=="苍茫三界主沉浮"
    or self.当前称谓=="独步西游若等闲" or self.当前称谓=="一举成名天下惊" ) then
    self._title:更新(dt)
    end
end

function 状态:显示底层(xy)

end

function 状态:显示(xy)
    if self._title then
        self._title:显示(xy)
    end
    if self._name then
        self._name:显示(xy)
    end
    for k, v in pairs(self._addon) do
        v:显示(xy)
    end
end

function 状态:显示顶层(xy)
    if self.store then --摆摊
        self.store:显示(xy)
    elseif self.sstore then --摆摊
        self.sstore:显示(xy)
    end
    if self._shout then
        self._shout:显示(xy) --喊话
    end
end

function 状态:消息事件(t)
    if self.是否摆摊 then
        for _, v in ipairs(t.鼠标) do
            if v.type == SDL.MOUSE_UP then
                if v.button == SDL.BUTTON_LEFT then
                    if self.store and self.store:检查点(v.x, v.y) then
                        v.type = nil
                        self.store:置高亮(true)
                        t.摆摊 = self
                    end
                end
            -- elseif v.type == SDL.MOUSE_UP then --右键
            --     if v.button == SDL.BUTTON_RIGHT or v.clicks == 2 then
            --         if self.store:检查点(v.x, v.y) then
            --             v.type = nil
            --             self.store:灰度()
            --             t.摆摊 = self
            --         end
            --     end
            end
        end
    elseif self.是否收购 then
        for _, v in ipairs(t.鼠标) do
            if v.type == SDL.MOUSE_UP then
                if v.button == SDL.BUTTON_LEFT then
                    if self.sstore and self.sstore:检查点(v.x, v.y) then
                        v.type = nil
                        self.sstore:置高亮(true)
                        t.收购 = self
                    end
                end
            -- elseif v.type == SDL.MOUSE_UP then --右键
            --     if v.button == SDL.BUTTON_RIGHT or v.clicks == 2 then
            --         if self.store:检查点(v.x, v.y) then
            --             v.type = nil
            --             self.store:灰度()
            --             t.摆摊 = self
            --         end
            --     end
            end
        end
    end
end

return 状态