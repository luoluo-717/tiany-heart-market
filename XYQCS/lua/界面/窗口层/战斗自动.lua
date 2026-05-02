local 战斗自动 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("战斗自动", 0, 150, 440, 450)
local 当前 = 多开数据.当前 
local 门派 = { 大唐官府 = 0xAAAA0001, 化生寺 = 0xAAAA0002, 女儿村 = 0XAAAA0003, 天机城 = 0XAAAA0004, 神木林 = 0XAAAA0005, 天宫 = 0XAAAA0006, 龙宫 = 0XAAAA0007, 五庄观 = 0XAAAA0008, 普陀山 = 0XAAAA0009, 凌波城 = 0XAAAA0010, 女魃墓 = 0XAAAA0011, 无底洞 = 0XAAAA0012, 花果山 = 0XAAAA0013, 阴曹地府 = 0XAAAA0014, 魔王寨 = 0XAAAA0015, 狮驼岭 = 0XAAAA0016, 盘丝洞 = 0XAAAA0017, 方寸山 = 0XAAAA0018,九黎城=0XAAAA0020 }
function 战斗自动:初始化()
  local nsf = require("SDL.图像")(380, 450)
  if nsf:渲染开始() then
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
--   self.允许移动=true
end

local 战斗自动栏=战斗自动:创建控件('战斗自动栏',0,0,440, 450)

function 战斗自动栏:初始化()
    local nsf = require("SDL.图像")(380, 450)
    if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/xz/", 0xAAB00014)):显示(0,120)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 战斗自动栏:重置()
    local nsf = require("SDL.图像")(380, 450)
    if nsf:渲染开始() then
        __res:取图像(__res:取地址("shape/ui/xz/", 0xAAB00014)):显示(0,120)
        for i,v in ipairs(self.玩家组) do
            if self.玩家组[i].门派 then
                self.玩家组[i].门派:显示(-145+i*60-60,15)
            end
        end
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 战斗自动栏:刷新自动战斗(内容)
    self.自动数据={}
    for n=1,#内容 do
        多开数据[当前].__战斗主控.战斗单位[内容[n].id].自动战斗=内容[n].自动开关
        多开数据[当前].__战斗主控.战斗单位[内容[n].id].自动指令=内容[n].自动指令
        if 多开数据[当前].__战斗主控.战斗单位[内容[n].id].单位类型 == "角色" then
            self.自动数据[#self.自动数据+1] = {内容[n].id}
        else
            self.自动数据[#self.自动数据][2] = 内容[n].id
        end
    end
    战斗自动:置可见(true)
    self:重置自动战斗()
end

function 战斗自动栏:重置自动战斗()
    local tux = require("SDL.图像")
    self.玩家组 = {}
    for i=1,5 do
        if self.自动数据[i] then
            local 编号=self.自动数据[i][1]
            self.玩家组[i]={[1]={编号=编号}}
            if 门派[多开数据[当前].__战斗主控.战斗单位[编号].数据.门派] then
                self.玩家组[i].门派=__res:取图像(__res:取地址('shape/ui/xz/',门派[多开数据[当前].__战斗主控.战斗单位[编号].数据.门派]))
            end
            local tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)
            if 多开数据[当前].__战斗主控.战斗单位[编号].自动指令 and 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.类型 == '法术' then
                for i, v in ipairs(多开数据[当前].__战斗主控.战斗单位[编号].主动技能) do
                    if v.名称 == 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.参数 then
                        local lssc = 取技能信息(v.名称)
                        if lssc[10] then
                            tcp = tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[多开数据[当前].__战斗主控.战斗单位[编号].数据.门派].."/"..__jingmaimiaoshu[v.名称]..".jpg"):拉伸(35, 35)
                        else
                            tcp = __res:取图像(__res:取地址('shape/jn/',lssc[8])):拉伸(35,35)
                        end
                        break
                    end
                end
            elseif 多开数据[当前].__战斗主控.战斗单位[编号].自动指令 and 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.类型 == "防御" then
                tcp = __res:getPNGCC(2,329,3,54,54):拉伸(35,35)
            elseif 多开数据[当前].__战斗主控.战斗单位[编号].自动指令 and 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.类型 == "道具" then
                tcp = __res:getPNGCC(2,521,3,54,54):拉伸(35,35)
            end
            self["人物"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
            self["人物"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
            self["人物"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
            if 多开数据[当前].__战斗主控.战斗单位[编号].自动战斗 then
                local tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00005), 2)
                self["自动"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
                self["自动"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
                self["自动"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
                self["自动"..i]:置精灵(tcp)
            else
                local tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00005), 1)
                self["自动"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
                self["自动"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
                self["自动"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
                self["自动"..i]:置精灵(tcp)
            end
            if 多开数据[当前].__战斗主控.战斗单位[编号].智能施法 then
                local tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 2)
                self["智能施法"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
                self["智能施法"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
                self["智能施法"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
                self["智能施法"..i]:置精灵(tcp)
            else
                local tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 1)
                self["智能施法"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
                self["智能施法"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
                self["智能施法"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
                self["智能施法"..i]:置精灵(tcp)
            end
          if self.自动数据[i][2] then
              local tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)
              local 编号 = self.自动数据[i][2]
              self.玩家组[i][2]={编号=编号}
              if 多开数据[当前].__战斗主控.战斗单位[编号].自动指令 and 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.类型 == '法术' then
                  for i, v in ipairs(多开数据[当前].__战斗主控.战斗单位[编号].主动技能) do
                      if v.名称 == 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.参数 then
                          local lssc = 取技能信息(v.名称)
                            if lssc[10] then
                                tcp = tux("assets/shape/pic/jingmai/jmk/"..__jingmaimiaoshu[多开数据[当前].__战斗主控.战斗单位[编号].数据.门派].."/"..__jingmaimiaoshu[v.名称]..".jpg"):拉伸(35, 35)
                            else
                                tcp = __res:取图像(__res:取地址('shape/jn/',lssc[8])):拉伸(35,35)
                            end
                      end
                  end
              elseif 多开数据[当前].__战斗主控.战斗单位[编号].自动指令 and 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.类型 == "防御" then
                  tcp = __res:getPNGCC(2,329,3,54,54):拉伸(35,35)
              elseif 多开数据[当前].__战斗主控.战斗单位[编号].自动指令 and 多开数据[当前].__战斗主控.战斗单位[编号].自动指令.类型 == "道具" then
                  tcp = __res:getPNGCC(2,521,3,54,54):拉伸(35,35)
              end
              self["宠物"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
              self["宠物"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
              self["宠物"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
          end
      end
  end
  self:重置()
end

local 关闭 = 战斗自动:创建我的按钮(__res:取图像(__res:取地址("shape/ui/xz/", 0xAAB00003)),"",308,120)
function 关闭:左键弹起(x,y,msg)
    战斗自动.战斗自动栏:置可见(not 战斗自动.战斗自动栏.是否可见)
    if 战斗自动.战斗自动栏.是否可见 then
        self:置坐标(308,120)
    else
        self:置坐标(1,120)
    end
end

function 战斗自动栏:更新智能(内容)
    local 编号 = 内容.编号
	if 多开数据[当前].__战斗主控.战斗单位[编号] then
        多开数据[当前].__战斗主控.战斗单位[编号].智能施法=内容[1]
		for i=1,5 do
			if self.玩家组[i][1].编号 == 编号 then
                if 内容[1] then
                    local tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 2)
                    self["智能施法"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
                    self["智能施法"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
                    self["智能施法"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
                    self["智能施法"..i]:置精灵(tcp)
                else
                    local tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 1)
                    self["智能施法"..i]:置正常精灵(tcp:到精灵():置中心(0, 0))
                    self["智能施法"..i]:置按下精灵(tcp:到精灵():置中心(-1, -1))
                    self["智能施法"..i]:置经过精灵(tcp:到精灵():置中心(0, 0))
                    self["智能施法"..i]:置精灵(tcp)
                end
				break
			end
		end
	end
end

for i, v in ipairs {

  {name = '宠物1', bh = 1, x = 75-65,y = 374-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '人物1', bh = 1, x = 75-65,y = 291-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '自动1', bh = 1,x = 75-65+40 ,y = 291-155-10 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00005), 1)},
  {name = '智能施法1', bh = 1,x = 75-65 ,y = 291-155+45 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 1)},

  {name = '宠物2', bh = 2, x = 135-65,y = 374-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '人物2', bh = 2, x = 135-65,y = 291-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '自动2', bh = 2,x = 135-65+40 ,y = 291-155-10 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00005), 1)},
  {name = '智能施法2', bh = 2,x = 135-65 ,y = 291-155+45 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 1)},

  {name = '宠物3', bh = 3, x = 195-65,y = 374-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '人物3', bh = 3, x = 195-65,y = 291-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '自动3', bh = 3,x = 195-65+40 ,y = 291-155-10 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00005), 1)},
  {name = '智能施法3', bh = 3,x = 195-65 ,y = 291-155+45 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 1)},

  {name = '宠物4', bh = 4, x = 255-65,y = 374-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '人物4', bh = 4, x = 255-65,y = 291-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '自动4', bh = 4,x = 255-65+40 ,y = 291-155-10 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00005), 1)},
  {name = '智能施法4', bh = 4,x = 255-65 ,y = 291-155+45 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 1)},

  {name = '宠物5', bh = 5, x = 315-65,y = 374-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '人物5', bh = 5, x = 315-65,y = 291-155 , tcp = __res:getPNGCC(2,780,3,54,54):拉伸(35,35)},
  {name = '自动5', bh = 5,x = 315-65+40 ,y = 291-155-10 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00005), 1)},
  {name = '智能施法5', bh = 5,x = 315-65 ,y = 291-155+45 , tcp = 取图像指定帧(__res:取地址("shape/ui/xz/", 0xAAB00018), 1)},

  {name = '批量自动', x = 315-65-30 ,y = 291-155+45+80 , tcp = __res:getPNGCC(3, 2, 507, 124, 41, true):置拉伸(85,25),MC='一键自动'},
  {name = '退出战斗', x = 30+85 ,y = 291-155+45+80 , tcp = __res:getPNGCC(3, 2, 507, 124, 41, true):置拉伸(85,25),MC='退出战斗'},

} do
    local  临时函数 = 战斗自动栏:创建我的按钮(v.tcp,v.name,v.x,v.y,v.MC)
    function 临时函数:左键弹起(x, y)
        if v.name == '退出战斗' then
            发送数据(当前 or self and self.当前, 6002)
        elseif v.name == '批量自动' then
            if #战斗自动栏.自动数据 > 0 then
                local 编号 = 战斗自动栏.自动数据[1][1]
                if 多开数据[当前].__战斗主控.战斗单位[编号] then
                    local 开关 = 多开数据[当前].__战斗主控.战斗单位[编号].自动战斗
                    if 开关 then
                        for i=1,#战斗自动栏.自动数据 do
                            local bh = 战斗自动栏.自动数据[i][1]
                            if 多开数据[当前].__战斗主控.战斗单位[bh] and 多开数据[当前].__战斗主控.战斗单位[bh].自动战斗 then
                                发送数据(当前,5507,{编号=bh})
                            end
                        end
                    else
                        for i=1,#战斗自动栏.自动数据 do
                            local bh = 战斗自动栏.自动数据[i][1]
                            if 多开数据[当前].__战斗主控.战斗单位[bh] and not 多开数据[当前].__战斗主控.战斗单位[bh].自动战斗 then
                                发送数据(当前,5507,{编号=bh})
                            end
                        end
                    end
                    
                end
            end
        else
            if v.bh then
                if string.find(v.name,"宠物") then
                    local 编号 = (战斗自动.战斗自动栏.自动数据[v.bh] or {})[2]
                    if 编号 then
                        if 多开数据[当前].__战斗主控.战斗单位[编号] and 多开数据[当前].__战斗主控.战斗单位[编号].数据.类型 ~= "角色" then
                            多开数据[当前].__UI界面.窗口层.战斗自动法术:打开(多开数据[当前].__战斗主控.战斗单位[编号].主动技能,"bb",多开数据[当前].__战斗主控.战斗单位[编号].数据.id,编号)
                        end
                    else
                        多开数据[当前].__UI弹出.提示框:打开("#Y该位置没有宠物.....")
                    end
                elseif string.find(v.name,"智能施法") then
                    local 编号 = (战斗自动.战斗自动栏.自动数据[v.bh] or {})[1]
                    if 编号 then
                        发送数据(当前,5513,{编号=编号})
                    end
                elseif string.find(v.name,"自动") then
                    local 编号 = (战斗自动.战斗自动栏.自动数据[v.bh] or {})[1]
                    if 编号 then
                        发送数据(当前,5507,{编号=编号})
                    end
                else
                    local 编号 = (战斗自动.战斗自动栏.自动数据[v.bh] or {})[1]
                    if 编号 then
                        if 多开数据[当前].__战斗主控.战斗单位[编号] and 多开数据[当前].__战斗主控.战斗单位[编号].数据.类型 == "角色" then
                            多开数据[当前].__UI界面.窗口层.战斗自动法术:打开(多开数据[当前].__战斗主控.战斗单位[编号].主动技能,"人物",多开数据[当前].__战斗主控.战斗单位[编号].数据.id,编号,多开数据[当前].__战斗主控.战斗单位[编号].如意神通)
                        end
                    end
                end
            end
        end
    end


end
