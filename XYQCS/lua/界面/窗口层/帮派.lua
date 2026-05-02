
local 帮派 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("帮派",0,0,823,514)
local 当前 = 多开数据.当前
local function 排序(a,b)
    return a.权限值>b.权限值
end
function 帮派:初始化()
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(823,514)
    if nsf:渲染开始() then
        置窗口背景("我的帮派",0,12,813,502,true):显示(0,0)
        取灰色背景(0, 0, 775, 332, true):显示(18,110)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

function 帮派:打开(data,nz)
    self:置可见(true)
    self.基础:置选中(true)
    self.成员控件:置可见(false)
    self.技能控件:置可见(false)
    self.建筑控件:置可见(false)
    self.数据 = data
    self.权限 = 1
    self.内政要求 = nz or 30000
    self.建筑情况 = {}
    for k,v in pairs(self.数据.帮派建筑) do
        self.建筑情况[#self.建筑情况+1] = v
        self.建筑情况[#self.建筑情况].名称 = k
    end
    自定义系统处理("bpjnxh")
    自定义系统处理("bpxlxh")
    self:人员排序(data)
    self:重置(data)
end

function 帮派:人员排序(data)
    for i, v in pairs(data.成员数据) do
        v.权限值 = 0
        if v.在线 then
            v.权限值 = v.权限值  + 1
        end
        if v.职务 == "帮主" then
            v.权限值 = v.权限值  + 10
            if i == 多开数据[当前 or self and self.当前].角色信息.数字id then
                self.权限 = 5
            end
        elseif v.职务 == "副帮主" then
            v.权限值 = v.权限值  + 8
        elseif v.职务 == "左护法" or v.职务 == "右护法" then
            v.权限值 = v.权限值  + 6
        elseif v.职务 == "长老" then
            v.权限值 = v.权限值  + 4  
        elseif v.职务 == "堂主" then
            v.权限值 = v.权限值  + 2
        end      
        if v.职务 ~= "帮主" and i == 多开数据[当前 or self and self.当前].角色信息.数字id then
            self.权限 = 999
        end
    end
    local 临时成员数据 = {}
    for i,v in pairs(data.成员数据) do
        临时成员数据[#临时成员数据+1] = v
    end
    table.sort(临时成员数据,排序)
    self.数据.成员数据 = 临时成员数据
end

local 关闭 = 帮派:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",773,0)

function 关闭:左键弹起(x,y,msg)
    帮派:置可见(false)
    self.图像 = nil
    self.数据 = nil
end

function 帮派:重置(data)
    local nsf = require('SDL.图像')(823,514)
    if nsf:渲染开始() then
        local lssj = 取输入背景(0, 0, 140, 23)
        for _, v in ipairs{
            {name = '帮 派 名' , dy = '帮派名称' ,  x = 40 , y = 132},
            {name = '帮派编号' , dy = '帮派编号' ,  x = 290 , y = 132},
            {name = '帮派规模' , dy = '帮派规模' ,  x = 540 , y = 132},
            {name = '创 始 人' , dy = '帮派创始人' ,  x = 40 , y = 184 },
            {name = '成员数量' , dy = '成员数量' ,  x = 290 , y = 184 },
            {name = '繁 荣 度' , dy = '繁荣度' ,  x = 540 , y = 184 },
            {name = '现任帮主' , dy = '现任帮主' ,  x = 40 , y = 236 },
            {name = '掌控区域' , dy = '掌控区域' ,  x =  290, y = 236 },
            {name = '研 究 力' , dy = '研究力' ,  x = 540 , y = 236 },
            {name = '帮派资金' , dy = '帮派资金' ,  x = 40 , y = 288 },
            {name = '管辖社区' , dy = '管辖社区' ,  x = 290 , y = 288 },
            {name = '安 定 度' , dy = '安定度' ,  x = 540 , y = 288 },
            {name = '储 备 金' , dy = '储备金' ,  x = 40 , y = 340 },
            {name = '训 练 力' , dy = '训练力' ,  x = 290 , y = 340 },
            {name = '人 气 度' , dy = '人气度' ,  x = 540 , y = 340 },
            {name = '同盟帮派' , dy = '同盟帮派' ,  x = 40 , y = 392 },
            {name = '敌对帮派' , dy = '敌对帮派' ,  x = 290 , y = 392 },
            {name = '行 动 力' , dy = '行动力' ,  x = 540 , y = 392 },
        }
        do
            字体18:置颜色(__取颜色('白色'))
            字体18:取图像(v.name):显示(v.x,v.y)
            lssj:显示(v.x+90,v.y-2)
            字体18:置颜色(__取颜色('浅黑'))
            if data[v.dy] ~= "" then
                if v.dy == "成员数量" then
                    字体18:取图像(data[v.dy].当前 .. "/" .. data[v.dy].上限):显示(v.x+100,v.y+2)
                elseif v.dy == "现任帮主" then
                    字体18:取图像(data[v.dy].名称):显示(v.x+100,v.y+2)
                elseif v.dy == "帮派资金" then
                    字体18:取图像(data[v.dy].当前 .. "/" .. data[v.dy].上限):显示(v.x+100,v.y+2)
                elseif v.dy == "同盟帮派" then
                    字体18:取图像(data[v.dy].名称 or '无'):显示(v.x+100,v.y+2)
                elseif v.dy == "敌对帮派" then
                    字体18:取图像(data[v.dy].名称 or '无'):显示(v.x+100,v.y+2)
                else
                    字体18:取图像(data[v.dy] or '无'):显示(v.x+100,v.y+2)
                end
            else
                字体18:取图像('无'):显示(v.x+100,v.y+2)
            end
        end
        nsf:渲染结束()
    end
    self.图像 = nsf:到精灵()
end

for i, v in ipairs {
    {name = '基础', x = 15 ,y = 63 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(98,41) , font = '基础'},
    {name = '成员', x = 15 + 100 ,y = 63 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(98,41) , font = '成员'},
    {name = '技能', x = 15 + 200 ,y = 63 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(98,41) , font = '技能'},
    {name = '建筑', x = 15 + 300 ,y = 63 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41), tcp2 = __res:getPNGCC(3,390,12,118,43,true):拉伸(98,41) , font = '建筑'},
} do
    local  临时函数 = 帮派:创建我的单选按钮(v.tcp,v.tcp2,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '基础' then
            帮派.成员控件:置可见(false)
            帮派.技能控件:置可见(false)
            帮派.建筑控件:置可见(false)
            帮派:重置(帮派.数据)
        elseif v.name == '成员' then
            帮派.图像 = nil
            帮派.成员控件:重置()
            帮派.成员控件:置可见(true)
            帮派.技能控件:置可见(false)
            帮派.建筑控件:置可见(false)
        elseif v.name == '技能' then
            帮派.图像 = nil
            帮派.成员控件:置可见(false)
            帮派.建筑控件:置可见(false)
            帮派.技能控件:重置()
            帮派.技能控件:置可见(true)
        elseif v.name == '建筑' then
            帮派.图像 = nil
            帮派.成员控件:置可见(false)
            帮派.技能控件:置可见(false)
            帮派.建筑控件:重置()
            帮派.建筑控件:置可见(true)
        end
    end
end

local 建筑控件 = 帮派:创建控件('建筑控件',18,110,775, 370)

function 建筑控件:初始化()
    self.建筑选中 = nil
end

function 建筑控件:重置()
    local nsf = require('SDL.图像')(823,514)
    if nsf:渲染开始() then
        取白色背景(0, 0, 250, 135,true):显示(530,120)
        local lssj = 取输入背景(0, 0, 140, 23)
        for _, v in ipairs{
            {name = '金 库 数' , dy = '金库' ,  x = 40 , y = 125},
            {name = '书 院 数' , dy = '书院' ,  x = 40 , y = 160},
            {name = '兽 室 数' , dy = '兽室' ,  x = 40 , y = 195},
            {name = '厢 房 数' , dy = '厢房' ,  x = 40 , y = 230 },
            {name = '药 房 数' , dy = '药房' ,  x = 40 , y = 265 },
            {name = '仓 库 数' , dy = '仓库' ,  x = 40 , y = 300 },
            {name = '药品增加' , dy = '药品增加量' ,  x = 40 , y = 335 },
            {name = '当前资材' , dy = '当前' ,  x =  40, y = 370 },
            {name = '最大资材' , dy = '上限' ,  x = 40 , y = 405 },

            {name = '物价指数' , dy = '物价指数' ,  x = 290 , y = 125 },
            {name = '修理指数' , dy = '修理指数' ,  x = 290 , y = 160 },
            {name = '守护等级' , dy = '守护兽等级' ,  x = 290 , y = 195 },
            {name = '帮派迷宫' , dy = '帮派迷宫' ,  x = 290 , y = 230 },
            {name = '当前内政' , dy = '当前内政' ,  x = 290 , y = 265 },
            {name = '百 草 谷' , dy = '人气度' ,  x = 290 , y = 300 },
            {name = '维护费用' , dy = '当前维护费' ,  x = 290 , y = 335 },
            {name = '维护时间' , dy = '维护时间' ,  x = 290 , y = 370 },

            {name = '所需资金' , dy = '' ,  x = 540 , y = 265 },
            {name = '所需进度' , dy = '' ,  x = 540 , y = 300 },
            {name = '所需繁荣' , dy = '' ,  x = 540 , y = 335 },
            {name = '所需人气' , dy = '' ,  x = 540 , y = 370 },
        }
        do
            字体16:置颜色(__取颜色('白色'))
            字体16:取图像(v.name):显示(v.x,v.y)
            lssj:显示(v.x+90,v.y-2)
            字体16:置颜色(__取颜色('浅黑'))
            if _ <= 6 then
                字体16:取图像(帮派.数据.帮派建筑[v.dy].数量):显示(v.x+100,v.y+2)
            elseif _==8 or _==9 then
                字体16:取图像(帮派.数据.帮派资材[v.dy]):显示(v.x+100,v.y+2)
            elseif 帮派.数据[v.dy] then
                字体16:取图像(帮派.数据[v.dy]):显示(v.x+100,v.y+2)
            elseif _ == 19 then
                字体16:取图像(帮派.内政要求):显示(v.x+100,v.y+2)
            else
                字体16:取图像("无"):显示(v.x+100,v.y+2)
            end
        end
        nsf:渲染结束()
    end
    帮派.图像 = nsf:到精灵()
    self.建筑列表:重置(帮派.数据.帮派建筑)
end

local 建筑列表 = 建筑控件:创建列表("建筑列表",520,20,230,120)

function 建筑列表:初始化()
    self:置文字(字体16)
    self.行高度 = 30
    self.行间距 = 0
    建筑控件.建筑选中 = nil
end

function 建筑列表:重置(data)
    self:清空()
    for _, v in pairs(data) do
        local nsf = require('SDL.图像')(347,30)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(_):显示(25,10)
            if 帮派.数据.当前内政 == _ then
                字体16:置颜色(__取颜色('红色'))
                字体16:取图像("研究中"):显示(125,10)
            end
            nsf:渲染结束()
        end
        local r = self:添加()
        r.内政名称 = _
        r:置精灵(nsf:到精灵())
    end
    建筑控件.建筑选中 = nil
end

function 建筑列表:左键弹起(x, y, i, item, msg)
    建筑控件.建筑选中 = i
end

for i, v in ipairs {
    {name = '研究建筑', x = 400 ,y = 295 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,35) , font = '研究建筑'},
    {name = '提升规模', x = 520 ,y = 295 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,35),  font = '提升规模'},
    --{name = '快速提升', x = 640 ,y = 295 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,35),  font = '快速提升'},

} do
    local 临时函数 = 建筑控件:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '研究建筑' then
            if 建筑控件.建筑选中 then
                发送数据(当前 or self and self.当前,42,帮派.建筑情况[建筑控件.建筑选中])
            else
               多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请点选你要操作的建筑！")
            end
        elseif v.name == '提升规模' then
            发送数据(当前 or self and self.当前,43)
        -- elseif v.name == '快速提升' then
        --     发送数据(当前 or self and self.当前,6116)
        end
    end
end

local 技能控件 = 帮派:创建控件('技能控件',18,110,775, 370)

function 技能控件:初始化()
end

function 技能控件:重置()
    local nsf = require('SDL.图像')(823,514)
    if nsf:渲染开始() then
        取白色背景(0, 0, 350, 150,true):显示(40,120)
        取白色背景(0, 0, 350, 150,true):显示(40,285)
        取白色背景(0, 0, 360, 140,true):显示(415,120)
        取白色背景(0, 0, 360, 90,true):显示(415,285)
        for _, v in ipairs{
            {name = '技能' , dy = '帮派名称' ,  x = 50+15 , y = 125},
            {name = '当前等级' , dy = 'id' ,  x = 150+15 , y = 125},
            {name = '上限等级' , dy = '职位' ,  x = 235+15 , y = 125},
            {name = '修炼' , dy = '状态' ,  x = 50+15 , y = 290},
            {name = '当前等级' , dy = '名称' ,  x = 150+15 , y = 290 },
            {name = '上限等级' , dy = 'id' ,  x = 235+15 , y = 290 },
            {name = '研究项目' , dy = '状态' ,  x = 50+15+377 , y = 295},
            {name = '要求经验' , dy = '名称' ,  x = 50+15+377 , y = 345 },
            {name = '当前经验' , dy = 'id' ,  x = 50+15+377 , y = 320 },
        }
        do
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v.name or '无'):显示(v.x,v.y)
        end
        nsf:渲染结束()
    end
    帮派.图像 = nsf:到精灵()
    self.辅助列表:重置(帮派.数据.技能数据)
    self.修炼列表:重置(帮派.数据.修炼数据)
    self.技能介绍:清空()
    self.项目名称 = nil
    self.当前经验 = nil
    self.经验上限 = nil
    self.修炼选中 = nil
end

function 技能控件:显示(x,y)
    字体16:置颜色(__取颜色('浅黑'))
    字体16:显示(x+530,y+185,self.项目名称 or "")
    字体16:显示(x+530,y+210,self.当前经验 or "")
    字体16:显示(x+530,y+235,self.经验上限 or "")
end

local 辅助列表 = 技能控件:创建列表("辅助列表",24,35,347,125)

function 辅助列表:初始化()
    self:置文字(字体16)
    self.行高度 = 30
    self.行间距 = 0
end

function 辅助列表:重置(data)
    self:清空()
    for _, v in pairs(data) do
        local nsf = require('SDL.图像')(347,30)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(_):显示(25,10)
            字体16:取图像(v.当前):显示(140,10)
            字体16:取图像(v.上限):显示(230,10)
            if 帮派.数据.研究技能 == _ then
                字体16:置颜色(__取颜色('红色'))
                字体16:取图像("研究中"):显示(270,10)
            end
            nsf:渲染结束()
        end
        local r = self:添加()
        r.name = _
        r.exp = v.当前经验
        r.level = v.当前
        r:置精灵(nsf:到精灵())
    end
end

function 辅助列表:左键弹起(x, y, i, item, msg)
    local 介绍 = 取技能信息(self.子控件[i].name)
    技能控件.技能介绍:清空()
    技能控件.技能介绍:置文本('#R'..self.子控件[i].name.."\n#W"..(介绍[1] or "未知数据"))
    技能控件.项目名称 = self.子控件[i].name
    技能控件.当前经验 = self.子控件[i].exp
    技能控件.经验上限 = (自定义系统.bpjnxh[self.子控件[i].level + 1] or {}).消耗经验 or "上限"
    技能控件.修炼列表:置选中()
    技能控件.修炼选中 = nil
    技能控件.辅助选中 = self.子控件[i].name
end

local 修炼列表 = 技能控件:创建列表("修炼列表",24,200,347,125)

function 修炼列表:初始化()
    self:置文字(字体16)
    self.行高度 = 30
    self.行间距 = 0
end

function 修炼列表:重置(data)
    self:清空()
    for _, v in pairs(data) do
        local nsf = require('SDL.图像')(347,30)
        if nsf:渲染开始() then
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(_):显示(25,10)
            字体16:取图像(v.当前):显示(140,10)
            字体16:取图像(v.上限):显示(230,10)
            if 帮派.数据.研究修炼 == _ then
                字体16:置颜色(__取颜色('红色'))
                字体16:取图像("研究中"):显示(270,10)
            end
            nsf:渲染结束()
        end
        local r = self:添加()
        r.name = _
        r.exp = v.当前经验
        r.level = v.当前
        r:置精灵(nsf:到精灵())
    end
end

function 修炼列表:左键弹起(x, y, i, item, msg)
    技能控件.辅助列表:置选中()
    技能控件.项目名称 = self.子控件[i].name
    技能控件.当前经验 = self.子控件[i].exp
    技能控件.经验上限 = (自定义系统.bpxlxh[self.子控件[i].level + 1] or {}).消耗经验 or "上限"
    技能控件.辅助选中 = nil
    技能控件.技能介绍:清空()
    技能控件.修炼选中 = self.子控件[i].name
end

for i, v in ipairs {
    {name = '研究技能', x = 400 ,y = 275 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41) , font = '研究技能'},
    {name = '提升等级', x = 520 ,y = 275 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41),  font = '提升等级'},
   -- {name = '快速提升', x = 640 ,y = 275 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41),  font = '快速提升'},

} do
    local 临时函数 = 技能控件:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if not 技能控件.项目名称 then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请再次点选你要操作的技能！")
        else
            if v.name == '研究技能' then
                多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y已满，无需研究！")
                -- if 技能控件.修炼选中 then
                --     发送数据(当前 or self and self.当前,6109,{名称=技能控件.修炼选中})
                -- elseif 技能控件.辅助选中 then
                --     发送数据(当前 or self and self.当前,6108,{名称=技能控件.辅助选中})
                -- end
            elseif v.name == '提升等级' then
                多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y已满，无需研究！")
                -- if 技能控件.修炼选中 then
                --     发送数据(当前 or self and self.当前,6111,{名称=技能控件.修炼选中})
                -- elseif 技能控件.辅助选中 then
                --     发送数据(当前 or self and self.当前,6110,{名称=技能控件.辅助选中})
                -- end
            -- elseif v.name == '快速提升' then
            --     if 技能控件.修炼选中 then
            --         发送数据(当前 or self and self.当前,6115,{名称=技能控件.修炼选中})
            --     elseif 技能控件.辅助选中 then
            --         发送数据(当前 or self and self.当前,6114,{名称=技能控件.辅助选中})
            --     end
            end
        end
    end
end


local 技能介绍 = 技能控件:创建我的文本("技能介绍",400,20,335,120)

local 成员控件 = 帮派:创建控件('成员控件',18,110,775, 332)

function 成员控件:重置()
    local nsf = require('SDL.图像')(823,514)
    if nsf:渲染开始() then
        取白色背景(0, 0, 350, 310,true):显示(40,120)
        取白色背景(0, 0, 210, 310,true):显示(415,120)
        for _, v in ipairs{
            {name = '名称' , dy = '帮派名称' ,  x = 52+15 , y = 127},
            {name = 'I D' , dy = 'id' ,  x = 152+15 , y = 127},
            {name = '职位' , dy = '职位' ,  x = 237+15 , y = 127},
            {name = '状态' , dy = '状态' ,  x = 335+15 , y = 127},
            {name = '申请人' , dy = '名称' ,  x = 420+15 , y = 127 },
            {name = 'ID' , dy = 'id' ,  x = 520+15 , y = 127 },
        }
        do
            字体18:置颜色(__取颜色('浅黑'))
            字体18:取图像(v.name or '无'):显示(v.x,v.y)
        end
        nsf:渲染结束()
    end
    帮派.图像 = nsf:到精灵()
    if 帮派.数据 then
        self.成员列表:重置(帮派.数据.成员数据)
        self.申请列表:重置(帮派.数据.申请人员 or {})
    end
    帮派.成员选中 = nil
    帮派.申请选中 = nil
    self.任命职位:置禁止(帮派.权限 < 2)
    self.逐出帮派:置禁止(帮派.权限 < 3)
    self.允许加入:置禁止(帮派.权限 < 2)
    self.清空列表:置禁止(帮派.权限 < 3)
end

local 成员列表 = 成员控件:创建列表("成员列表",24,54,347,255)

function 成员列表:初始化()
    self:置文字(字体20)
    self.行高度 = 50
    self.行间距 = 0
end

function 成员列表:重置(data)
    self:清空()
    local function 排序 (a,b)
        return a.权限值 > b.权限值
    end
    table.sort(data,排序)
    for _, v in pairs(data) do
        local nsf = require('SDL.图像')(347,50)
        if nsf:渲染开始() then
            if _%2 == 1 then
                --nsf:填充颜色(167,164,199,255)
            end
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v.名称):显示(12,15)
            字体16:取图像(v.id):显示(110,15)
            字体16:取图像(v.职务):显示(210,15)
            字体16:取图像(v.在线 and "在线" or "离线"):显示(310,15)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 成员列表:左键弹起(x, y, i, item, msg)
    帮派.成员选中 = i
end

local 申请列表 = 成员控件:创建列表("申请列表",399,54,207,255)

function 申请列表:初始化()
    self:置文字(字体20)
    self.行高度 = 50
    self.行间距 = 0
end

function 申请列表:重置(data)
    self:清空()
    for _, v in ipairs(data) do
        local nsf = require('SDL.图像')(207,50)
        if nsf:渲染开始() then
            if _%2 == 1 then
                --nsf:填充颜色(167,164,199,255)
            end
            字体16:置颜色(__取颜色('浅黑'))
            字体16:取图像(v.名称):显示(10,15)
            字体16:取图像(v.数字id):显示(123,15)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 申请列表:左键弹起(x, y, i, item, msg)
    帮派.申请选中 = i
end

local 任命选择 = 多开数据[当前].__UI界面:创建弹出窗口('任命选择', 586, 130, 139, 312)
function 任命选择:初始化()
    local nsf = require('SDL.图像')(139,312)
    if nsf:渲染开始() then
        取黑色背景(0, 0, 139, 312, true):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end

local 帮派职位 ={"帮主","副帮主","左护法","右护法","长老","堂主","帮众","商人"}

local 职位列表 = 任命选择:创建列表("职位列表",0,0,137,310)
function 职位列表:初始化()
    self:置文字(字体20)
    self.行高度 = 50
    self.行间距 = 0
    for _, v in ipairs(帮派职位) do
        local nsf = require('SDL.图像')(137,310)
        if nsf:渲染开始() then
            if _%2 == 1 then

            end
            字体16:置颜色(__取颜色('白色'))
            字体16:取图像(v):显示(10,15)
            nsf:渲染结束()
        end
        local r = self:添加()
        r:置精灵(nsf:到精灵())
    end
end

function 职位列表:左键弹起(x, y, i, item, msg)
    if 帮派.成员选中 then
        发送数据(当前 or self and self.当前,41,{对方数据=帮派.数据.成员数据[帮派.成员选中],类型="任命职位",职位=帮派职位[i]})
    else
       多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y请再次选择你要操作的对象！")
    end 
    任命选择:置可见(false)
end

for i, v in ipairs {
    {name = '任命职位', x = 636 ,y = 15 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41) , font = '任命职位'},
    {name = '逐出帮派', x = 636 ,y = 15 + 67 * 1 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41),  font = '逐出帮派'},
    {name = '退出帮派', x = 636 ,y = 15 + 67 * 2 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41),  font = '退出帮派'},
    {name = '允许加入', x = 636 ,y = 15 + 67 * 3 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41),  font = '允许加入'},
    {name = '清空列表', x = 636 ,y = 15 + 67 * 4 , tcp = __res:getPNGCC(3,511,11,117,43,true):拉伸(98,41),  font = '清空列表'},
} do
    local 临时函数 = 成员控件:创建我的按钮(v.tcp,v.name,v.x,v.y,v.font)
    function 临时函数:左键弹起(x, y)
        if v.name == '任命职位' then
            任命选择:置可见(true)
        elseif v.name == '逐出帮派' then
            if 帮派.成员选中 then
                发送数据(当前 or self and self.当前,41,{对方数据=帮派.数据.成员数据[帮派.成员选中],类型="逐出帮派"})
            end
        elseif v.name == '退出帮派' then
            local 回调处理 = function(i,选项)
                if 选项[i] == "确定" then
                    发送数据(当前 or self and self.当前,37.1)
                end
            end
            if 帮派.权限 == 5 then
                多开数据[当前].__UI界面.窗口层.对话栏:打开({ 模型 = "梦幻精灵", 名称 = "梦幻精灵", 对话 = "你现在是帮派的帮主，如果你退出帮派，#Y你的帮派会因此#R解散#W，请谨慎选择，你确定要退出帮派吗？",选项={"确定","我再考虑考虑"}, 回调处理 = 回调处理 })
            else
                发送数据(当前 or self and self.当前,37.2)
            end
            帮派.关闭:左键弹起()
        elseif v.name == '允许加入' then
            if 帮派.申请选中 then
                发送数据(当前 or self and self.当前,41,{对方数据=帮派.数据.申请人员[帮派.申请选中],类型="同意加入"})
                table.remove(帮派.数据.申请人员,帮派.申请选中)
                帮派.成员控件.申请列表:重置(帮派.数据.申请人员 or {})
                帮派.申请选中=nil
            end
        elseif v.name == '清空列表' then
            if 帮派.申请选中 then
                发送数据(当前 or self and self.当前,40)
                帮派.申请选中=nil
            end
        end
    end
end