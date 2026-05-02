
多开数据[多开数据.当前].__UI弹出.道具鉴定 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("道具鉴定",0,0,370,340)
local 道具鉴定 = 多开数据[多开数据.当前].__UI弹出.道具鉴定
local 当前 = 多开数据.当前
function 道具鉴定:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(370,340)
    if nsf:渲染开始() then
        取黑透明背景(0,0,370,340,true):显示(0,0)
        __res:getPNGCC(3,694,4,338,273):显示(20,14)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.选中道具 = nil
end

function 道具鉴定:打开(数据,内丹,吸附石,快捷镶嵌)
    self:置可见(true)
    if self.页==nil then
    self.页=1
    else
    self.页=道具鉴定.页
    end
     for i=1,4 do
        if self.页==i then
        self.扩展格子["包裹"..i]:置选中(true)
        end
    end

    for i = 1, 4 do
        道具鉴定.扩展格子["包裹" .. i]:置可见(true)
    end

    -- table.print(数据)
    if 数据[3] == "吸附石" then
        道具鉴定.功能分类 = "吸附石"
    elseif not 内丹 and not 吸附石 and not 快捷镶嵌 and 数据 and 数据[2] then
        self.符纸格子 = 数据[1]
        self.功能分类 = 数据[3]
        self.数据 = 数据[2]
        self.符纸总类 = tonumber(self.数据.总类)
        self.符纸分类 = tonumber(self.数据.分类)
        self.符纸子类 = tonumber(self.数据.子类)
    elseif 数据[3] == "光武拓印" then
        道具鉴定.功能分类 = "光武拓印"

    end
    if 内丹 then
        self.功能分类 = "打内丹"
        self.宝宝 = 内丹
    end
    if 快捷镶嵌 then
        self.符纸格子 = 数据.格子
        self.功能分类 = "快捷镶嵌"
    end
    if 道具鉴定.功能分类 == "吸附石" then
        self.道具网格:置物品(多开数据[当前].__主控.道具列表,3)
    elseif 道具鉴定.功能分类 == "打内丹" then
        self.道具网格:置物品(多开数据[当前].__主控.道具列表,203)
    elseif 道具鉴定.功能分类 == "光武拓印" then
        self.道具网格:置物品(多开数据[当前].__主控.道具列表,3)

    else
        self.道具网格:置物品(多开数据[当前].__主控.道具列表,2)
    end
end

local 扩展格子 = 道具鉴定:创建控件("扩展格子", 30, 300, 300, 50)

for i, v in ipairs {
    { name = '包裹1', x = 5, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "1" },
    { name = '包裹2', x = 65+15, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "2" },
    { name = '包裹3', x = 125+30, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "3" },
    { name = '包裹4', x = 185+45, y = 0, tcp = __res:getPNGCC(3, 1069, 1156, 60, 37, true):置拉伸(70, 35), tcp1 = __res:getPNGCC(3, 1069, 1116, 60, 37, true):置拉伸(70, 35), font = "4" },
} do
    local 临时函数 = 扩展格子:创建我的单选按钮(v.tcp, v.tcp1, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '包裹1' then
            道具鉴定.页 = 1
            道具鉴定.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹2' then
            道具鉴定.页 = 2
            道具鉴定.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹3' then
            道具鉴定.页 = 3
            道具鉴定.道具网格:置物品(多开数据[当前].__主控.道具列表)
        elseif v.name == '包裹4' then
            道具鉴定.页 = 4
            道具鉴定.道具网格:置物品(多开数据[当前].__主控.道具列表)
        end
    end
end



local 道具网格 = 道具鉴定:创建网格("道具网格",20,14,339,272)

function 道具网格:初始化()
    self:创建格子(67,67,0,0,4,5)
end

function 道具网格:左键弹起(x, y, a, b, msg)
    if self.子控件[a] and self.子控件[a]._spr and not self.子控件[a]._spr.物品禁止 and self.子控件[a]._spr.物品 then
        if 道具鉴定.功能分类 == "光武拓印" then
            if self.子控件[a]._spr.物品.总类 == 2 and self.子控件[a]._spr.物品.分类 == 3 or self.子控件[a]._spr.物品.子类 == 911 then
                local 道具格子 = self.子控件[a].真实编号 or a
                道具鉴定:置可见(false)
                发送数据(当前, 3781, {道具格子 = 道具格子})
                self.页=道具鉴定.页
            else
                多开数据[当前].__UI弹出.提示框:打开("#Y请选择武器进行光武拓印！")
            end

    elseif self.子控件[a]._spr.物品.总类 == 2 then
            if 道具鉴定.功能分类 == "鉴定" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 == false then
                    if 道具鉴定.符纸总类 == 111 then
                        if 道具鉴定.数据.等级 >= self.子控件[a]._spr.物品.等级 then
                            if 道具鉴定.符纸分类 == 1 and (self.子控件[a]._spr.物品.分类 == 3 or self.子控件[a]._spr.物品.分类 == 4) then
                                if self.子控件[a]._spr.物品.专用提示 then
                                    道具鉴定:置可见(false)
                                    多开数据[当前 or self and self.当前].__UI弹出.提示弹出:打开('#W恭喜！这物品可能变为特有装备，#Y特有装备只能由你本人使用#W，你需要将它鉴定成特有装备吗？',3758,{类型="装备鉴定",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码},3738,{类型="装备鉴定",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                                    return
                                end
                                发送数据(当前 or self and self.当前,3738,{类型="装备鉴定",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                                道具鉴定:置可见(false)
                            elseif 道具鉴定.符纸分类 == 2 and (self.子控件[a]._spr.物品.分类 == 1 or  self.子控件[a]._spr.物品.分类 == 2 or self.子控件[a]._spr.物品.分类 == 5 or self.子控件[a]._spr.物品.分类 == 6) then
                                if self.子控件[a]._spr.物品.专用提示 then
                                    道具鉴定:置可见(false)
                                    多开数据[当前 or self and self.当前].__UI弹出.提示弹出:打开('#W恭喜！这物品可能变为特有装备，#Y特有装备只能由你本人使用#W，你需要将它鉴定成特有装备吗？',3758,{类型="装备鉴定",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码},3738,{类型="装备鉴定",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                                    return
                                end
                                发送数据(当前 or self and self.当前,3738,{类型="装备鉴定",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                                道具鉴定:置可见(false)
                            elseif 道具鉴定.符纸分类 == 3 and (self.子控件[a]._spr.物品.分类 == 10 or self.子控件[a]._spr.物品.分类 == 11 or self.子控件[a]._spr.物品.分类 == 12 or self.子控件[a]._spr.物品.分类 == 13) then
                                发送数据(当前 or self and self.当前,3738,{类型="灵饰鉴定",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                                道具鉴定:置可见(false)
                            else
                               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这个符纸不能鉴定这件装备！")
                            end
                        else
                            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这个符纸的能力不足以鉴定这件装备！")
                        end
                    else
                        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y该装备还没有鉴定！")
                    end
                else
                    if 道具鉴定.符纸总类 == 5 then
                        发送数据(当前 or self and self.当前,3738,{类型="钟灵石",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 101 then
                        发送数据(当前 or self and self.当前,3738,{类型="强化符",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 180 then
                        发送数据(当前 or self and self.当前,3738,{类型="特技书",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 181 then
                        发送数据(当前 or self and self.当前,3738,{类型="特效宝珠",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 182 then
                        发送数据(当前 or self and self.当前,3738,{类型="超简易宝珠",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 183 then
                        发送数据(当前 or self and self.当前,3738,{类型="愤怒符",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 184 then
                        发送数据(当前 or self and self.当前,3738,{类型="不磨符",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)

                    elseif 道具鉴定.符纸总类 == 188 then
                        发送数据(当前 or self and self.当前,3738,{类型="灵箓",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 189 then
                        发送数据(当前 or self and self.当前,3738,{类型="淬灵石",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    elseif 道具鉴定.符纸总类 == 196 then
                        发送数据(当前 or self and self.当前,3738,{类型="凤纹灵坠",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这件装备已经鉴定过了！")
                        道具鉴定:置可见(false)
                    end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页
                end
            elseif 道具鉴定.功能分类 == "附魔" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 <= 6 then
                        发送数据(当前 or self and self.当前,3738,{类型="装备附魔",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这件装备不可以附魔！")
                        道具鉴定:置可见(false)
                    end
                else
                    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end 
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "词条" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 <= 6 then
                        发送数据(当前 or self and self.当前,3738,{类型="装备词条",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这件装备不可以做词条操作！")
                        道具鉴定:置可见(false)
                    end
                else
                    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "属性洗练" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 == 3 or self.子控件[a]._spr.物品.分类 == 4 then
                        发送数据(当前 or self and self.当前,3738,{类型="属性洗练",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这件装备不可以做词条操作！")
                        道具鉴定:置可见(false)
                    end
                else
                    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "灵饰洗练" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 >= 10 and self.子控件[a]._spr.物品.分类 <= 13 then
                        发送数据(当前 or self and self.当前,3738,{类型="灵饰洗练",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这件装备不可以做词条操作！")
                        道具鉴定:置可见(false)
                    end
                else
                    多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "武器专属" and self.子控件[a]._spr.物品.总类 == 2 then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 == 3  then
                        发送数据(当前 or self and self.当前,3738,{类型="武器专属",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y只有武器才可以进行操作")
                        道具鉴定:置可见(false)
                    end
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页
            elseif 道具鉴定.功能分类 == "焕彩石" and self.子控件[a]._spr.物品.总类 == 2 then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 >= 15 and self.子控件[a]._spr.物品.分类 <=19  then
                        发送数据(当前 or self and self.当前,3738,{类型="焕彩石",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y只有锦衣才可以进行操作")
                        道具鉴定:置可见(false)
                    end
                end    
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页


            elseif 道具鉴定.功能分类 == "施法特效符" and self.子控件[a]._spr.物品.总类 == 2 then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 == 3  then
                        发送数据(当前 or self and self.当前,3738,{类型="施法特效符",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y只有武器才可以进行操作")
                        道具鉴定:置可见(false)
                    end
                end     
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "特性宝珠" and self.子控件[a]._spr.物品.总类 == 2 then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 == 1 or self.子控件[a]._spr.物品.分类 == 2 or self.子控件[a]._spr.物品.分类 == 3 or self.子控件[a]._spr.物品.分类 == 4 or self.子控件[a]._spr.物品.分类 == 5 or self.子控件[a]._spr.物品.分类 == 6 then
                        发送数据(当前 or self and self.当前,3738,{类型="特性宝珠",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)
                    else
                        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y只有装备才可以进行特性操作")
                        道具鉴定:置可见(false)
                    end
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "灵饰点化" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 == 10 or self.子控件[a]._spr.物品.分类 == 11 or self.子控件[a]._spr.物品.分类 == 12 or self.子控件[a]._spr.物品.分类 == 13 then
                        发送数据(当前 or self and self.当前,3738,{类型="灵饰点化",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)  
                    else
                        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y灵箓只能点化灵饰！")
                        道具鉴定:置可见(false)
                    end
                else
                   多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "灵饰淬灵" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 == 10 or self.子控件[a]._spr.物品.分类 == 11 or self.子控件[a]._spr.物品.分类 == 12 or self.子控件[a]._spr.物品.分类 == 13 then
                        发送数据(当前 or self and self.当前,3738,{类型="灵饰淬灵",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)  
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y淬灵石只能吸取灵饰！")
                        道具鉴定:置可见(false)
                    end
                else
                   多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "灵饰灵石" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 == 10 or self.子控件[a]._spr.物品.分类 == 11 or self.子控件[a]._spr.物品.分类 == 12 or self.子控件[a]._spr.物品.分类 == 13 then
                        发送数据(当前 or self and self.当前,3738,{类型="灵饰灵石",道具格子=self.子控件[a].真实编号 or a,符纸格子=道具鉴定.符纸格子,识别码=道具鉴定.识别码,识别码2=self.子控件[a]._spr.物品.识别码})
                        道具鉴定:置可见(false)  
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#钟灵石只能使用在灵饰上")
                        道具鉴定:置可见(false)
                    end
                else
                   多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

            elseif 道具鉴定.功能分类 == "快捷镶嵌" then
                if self.子控件[a]._spr.物品.鉴定 ~= nil and  self.子控件[a]._spr.物品.鉴定 then
                    if self.子控件[a]._spr.物品.分类 <= 6 then
                        发送数据(当前 or self and self.当前,128,{编号=a,格子=道具鉴定.符纸格子})
                        道具鉴定:置可见(false)
                    else
                       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y这件装备不可以附魔！")
                        道具鉴定:置可见(false)
                    end
                else
                   多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请先鉴定装备！")
                    道具鉴定:置可见(false)
                end
            end
                    多开数据[当前].__主控["播放特效音乐"](多开数据[当前].__主控,取音效("鉴定"))
                    self.页=道具鉴定.页

        elseif 道具鉴定.功能分类 == "打内丹" and self.子控件[a]._spr.物品.总类 == 203 then
            发送数据(当前 or self and self.当前,5014,{类型="宝宝打内丹",道具格子=self.子控件[a].真实编号 or a,bb = 道具鉴定.宝宝})
            道具鉴定:置可见(false)
            self.页=道具鉴定.页
        elseif 道具鉴定.功能分类 == "吸附石" then
            if self.子控件[a]._spr.物品.名称 == "魔兽要诀" or self.子控件[a]._spr.物品.名称 == "高级魔兽要诀" then
                道具鉴定.选中兽决 = self.子控件[a].真实编号 or a
                多开数据[当前].__UI界面.窗口层.对话栏:打开({
                    模型 = "普陀_接引仙女",
                    名称 = "吸附石",
                    对话 = "吸附石可直接吸附消耗魔兽要诀来获得对应的点化石。有一定概率失败，失败后会损失吸附石。（魔兽要诀不会损失）",
                    选项 = { "我要吸附魔兽要诀", "取消" },
                })
            else
                多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y我不认识这个技能哦")
            end
            道具鉴定:置可见(false)
            self.页=道具鉴定.页

        end
    end
end

function 道具网格:置物品(data,zl,fl)
    for i = 1,#self.子控件 do
        if data[i + 道具鉴定.页 * 20 - 20] then
            local lssj = __物品格子.创建(当前)
            lssj:置物品(data[i + 道具鉴定.页 * 20 - 20],nil,"道具选择")
            -- lssj:置禁止(zl,fl)
            lssj:置偏移(10,10)
            self.子控件[i].真实编号 = i + 道具鉴定.页 * 20 - 20
            self.子控件[i]:置精灵(lssj)
        else
            self.子控件[i]:置精灵()
        end
    end
end
