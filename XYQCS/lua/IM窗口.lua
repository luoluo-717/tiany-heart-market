local 标签层 = class('标签层')
local SDL = require 'SDL'
function 标签层:初始化()
    self.是否可见 = false
    self.标签组 = {}
    local nsf = require('SDL.图像')(引擎.宽度,40)
    if nsf:渲染开始() then
        取黑透明背景(0,0,引擎.宽度,40,true):拉伸(引擎.宽度,26):置透明(220):显示(0,0)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    for i=1,5 do
        if 多开数据[i] then
            self.标签组[i] = __res:getPNGCC(1,449,28,174,30,true):拉伸(180,22):到精灵()
        end
    end
    self.加 = __res:getPNGCC(1,641,320,29,29):拉伸(22,22):到精灵()
end

function 标签层:开启多开()
    self.是否可见 = true
    self:重置左右坐标()
end

function 标签层:关闭窗口()
    local 当前 = 多开数据.当前
    local mb = 0
    for i=1,5 do
        if 多开数据[i] and i ~= 当前 then
            mb = i
            break
        end
    end
    if mb == 0 then
        引擎:关闭()
    else
        if 多开数据[当前] then
            if 多开数据[当前].连接id then
                客户端:断开(多开数据[当前].连接id)
            end
            多开数据[多开数据.当前].__UI界面:清空消息()
        end
        多开数据.当前 = mb
        多开数据[多开数据.当前].__UI界面:清空消息()
        多开数据[当前]=nil
        self:重置()
        self.标签组[mb]:置高亮(true)
    end
end

function 标签层:重置()
    self.标签组 = {}
    local nsf = require('SDL.图像')(引擎.宽度,40)
    if nsf:渲染开始() then
        取黑透明背景(0,0,引擎.宽度,40,true):拉伸(引擎.宽度,26):置透明(220):显示(0,0)
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
    for i=1,5 do
        if 多开数据[i] then
            self.标签组[i] = __res:getPNGCC(1,449,28,174,30,true):拉伸(180,22):到精灵()
        end
    end
    self.加 = __res:getPNGCC(1,641,320,29,29):拉伸(22,22):到精灵()
    self:重置左右坐标()
end

function 标签层:重置左右坐标()
    for i=1,5 do
        if 多开数据[i] then
            多开数据[i].__UI界面.界面层.右上角:置坐标(670+abbr.py.x,28)
            多开数据[i].__UI界面.界面层.左上角:置坐标(10,28)
            多开数据[i].__UI界面.界面层.队伍栏:置坐标(350+abbr.py.x,28)
            多开数据[i].__UI弹出.快捷技能选择:置坐标(0,28)
        end
    end
end

function 标签层:更新(dt,x,y)

end

function 标签层:显示(x,y)
    self.图像:显示(-1,-2)
    local xx = 0
    for i=1,5 do
        if 多开数据[i] then
            xx = xx + 1
            self.标签组[i]:显示(0+xx*180-180,1)
            if 多开数据[i].角色信息 and 多开数据[i].角色信息.名称 then
                字体16:置颜色(__取颜色('白色'))
                字体16:显示(50+xx*180-180,5,多开数据[i].角色信息.名称)
            end
        end
    end
    self.加:显示(0+xx*180+15,0)
end

function 标签层:快速上号(v,选中)
    local dq = 0
    for i=1,5 do
        if 多开数据[i] == nil then
            dq = i
            break
        end
    end
    if dq ~= 0 then
        local 之前 = 多开数据.当前
        初始化多开(dq)
        self:重置()
        self.标签组[dq]:置高亮(true)
        多开数据[dq].__连接信息.IP = 多开数据[之前].__连接信息.IP
        多开数据[dq].__连接信息.端口 = 多开数据[之前].__连接信息.端口
        if 客户端:连接(多开数据[dq].__连接信息.IP,多开数据[dq].__连接信息.端口) then
            多开数据[dq].__UI界面.登录层.更新界面:置可见(false)
            快速登陆处理 = {dq,"1".."*-*"..__res.配置.账号.."*-*"..__res.配置.密码.."*-*".."安卓",选中,v.id,之前}
            -- 发送数据(dq,1,"1".."*-*"..__res.配置.账号.."*-*"..__res.配置.密码.."*-*".."安卓")
            -- 发送数据(dq,4,{选中=选中,数字id=v.id})
            -- 多开数据[dq].__连接信息.数字id = v.id
            -- self:切换窗口(之前)
            return true
        else
            多开数据[dq].__UI弹出.提示框:打开('#Y你已经无法开启更多的账号了')
            return nil
        end    
    end
end

function 标签层:切换窗口(i)
    self.标签组[i]:置高亮(true)
    多开数据[多开数据.当前].__UI界面:清空消息()
    多开数据.当前 = i
    if 多开数据[多开数据.当前] == nil then
        self:关闭窗口()
        return
    end
    多开数据[多开数据.当前].__UI界面:清空消息()
    for n=1,5 do
        if n ~= i and self.标签组[n] then
            self.标签组[n]:置高亮(false)
        end
    end
    return true
end

function 标签层:消息事件(t)
    if t.鼠标 and self.是否可见 then
        for _, v in ipairs(t.鼠标) do
            if v.type == SDL.MOUSE_UP then
                if v.button == SDL.BUTTON_LEFT then
                    if self.加:检查点(v.x, v.y) then
                        local dq = 0
                        for i=1,5 do
                            if 多开数据[i] == nil then
                                dq = i
                                break
                            end
                        end
                        if dq ~= 0 then
                            初始化多开(dq)
                            self:重置()
                            self.标签组[dq]:置高亮(true)
                            多开数据.当前 = dq
                            多开数据[多开数据.当前].__UI界面.登录层.更新界面:置可见(false)
                            多开数据[多开数据.当前].__UI界面.登录层.选择大区:置可见(true,true)
                        end
                        return true
                    else
                        for i=1,5 do
                            if self.标签组[i] and self.标签组[i]:检查点(v.x, v.y) then
                                return self:切换窗口(i)
                            end
                        end
                    end
                end
            end
        end
    end
end

return 标签层