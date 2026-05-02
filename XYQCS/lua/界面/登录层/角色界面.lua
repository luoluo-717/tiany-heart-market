--[[
    @Author       : GGELUA
    @Date         : 2022-02-10 20:51:52
Last Modified by: GGELUA
Last Modified time: 2023-11-07 12:00:53
--]]
local 选中
local 角色界面 = 多开数据[多开数据.当前].__UI界面.登录层:创建控件("角色界面",92+abbr.py2.x,50+abbr.py2.y,960,540)
local 当前 = 多开数据.当前
function 角色界面:初始化()
    self.信息背景 = __res:取精灵('shape/ui/xj/89C23A51.was')
    self.选择角色 = __res:取精灵('shape/ui/xj/CA43E749.was')
    self.角色列表 = {}
end

function 角色界面:显示(x, y)
    self.信息背景:显示(312+abbr.py2.x,432+abbr.py2.y)
    self.选择角色:显示(408+abbr.py2.x,64+abbr.py2.y)
    if 选中 then
        字体18:显示(388+abbr.py2.x,441+abbr.py2.y,self.角色列表[选中].名称)
        字体18:显示(559+abbr.py2.x,441+abbr.py2.y,self.角色列表[选中].id)
        字体18:显示(388+abbr.py2.x,483+abbr.py2.y,self.角色列表[选中].等级)
        字体18:显示(559+abbr.py2.x,483+abbr.py2.y,self.角色列表[选中].门派)
    end
end

function 角色界面:打开(sj)
    选中 = nil
    self:置可见(true, true)
    self.角色列表 = sj
    self.角色网格:置数据(self.角色列表)
    self.下一步:置可见(false)
end

local 角色网格 = 角色界面:创建网格("角色网格",320-80,130-65,316,265)

function 角色网格:初始化()
    self:创建格子(104, 132, 3, 2, 2, 3)
    self.最后点击时间 = 0
    self.最后点击索引 = 0
    self.点击次数 = 0
end
function 角色网格:左键弹起(x, y, a, b, msg)
    if self.最后点击索引 == a then
        if os.clock() - self.最后点击时间 < 0.5 then
            self.点击次数 = self.点击次数 + 1
        else
            self.点击次数 = 1
        end
    else
        self.点击次数 = 1
    end
    self.最后点击时间 = os.clock()
    self.最后点击索引 = a
    if self.点击次数 == 2 then
        self.点击次数 = 0
        if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
            if 选中 and self.子控件[选中]._spr.确定 then
                self.子控件[选中]._spr.确定 = nil
            end
            选中 = a
            self.子控件[选中]._spr.确定 = true
            发送数据(当前, 4, { 选中 = a, 数字id = 角色界面.角色列表[a].id })
            多开数据[当前].__连接信息.数字id = 角色界面.角色列表[a].id
            return
        end
    end
    if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
        if 选中 and self.子控件[选中]._spr.确定 then
            self.子控件[选中]._spr.确定 = nil
        end
        选中 = a
        self.子控件[选中]._spr.确定 = true
        角色界面.创建:置可见(false)
        角色界面.下一步:置可见(true)
    end
end
-- function 角色网格:左键弹起(x, y, a, b, msg)
--     if self.子控件[a] and self.子控件[a]._spr and self.子控件[a]._spr.数据 then
--         if 选中 and self.子控件[选中]._spr.确定 then
--             self.子控件[选中]._spr.确定 = nil
--         end
--         选中 = a
--         self.子控件[选中]._spr.确定 = true
--         角色界面.创建:置可见(false)
--         角色界面.下一步:置可见(true)
--     end
-- end

function 角色网格:置数据(数据)
    for i = 1, #角色网格.子控件 do
        local lssj = __角色选择格子.创建(当前)
        lssj:置数据(数据[i], 55, 110)
        角色网格.子控件[i]:置精灵(lssj)
    end
end

local 上一步 = 角色界面:创建我的was按钮('shape/ui/xj/611107AA.was', "上一步",630,330)

function 上一步:左键弹起(x, y, msg)
    if 选中 ~= nil then

    end
end

local 下一步 = 角色界面:创建我的was按钮('shape/ui/xj/51A45362.was', "下一步",630,380)

function 下一步:左键弹起(x, y, msg)
    if 选中 ~= nil then
        发送数据(当前 or self and self.当前, 4, { 选中 = 选中, 数字id = 角色界面.角色列表[选中].id })
        多开数据[当前].__连接信息.数字id = 角色界面.角色列表[选中].id
    end
end

local 创建 = 角色界面:创建我的was按钮('shape/ui/xj/75D9CC0E.was', "创建",630,380)

function 创建:左键弹起(x, y, msg)
    角色界面:置可见(false)
    多开数据[当前].__UI界面.登录层.创建界面:置可见(true, true)
end
