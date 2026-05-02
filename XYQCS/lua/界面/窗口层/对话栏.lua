--[[
    @Author       : GGELUA
    @Date         : 2022-02-26 12:21:15
Last Modified by: GGELUA
Last Modified time: 2023-07-08 11:21:53
--]]
local 对话栏 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("对话栏", 0, 0, 引擎.宽度, 引擎.高度)
local 当前 = 多开数据.当前
function 对话栏:初始化()
    local nsf = require('SDL.图像')(960 + abbr.py.x, 引擎.高度)
    if nsf:渲染开始(0, 0, 0, 0) then
        __res:getPNGCC(2, 0, 1022, 100, 252):显示(0, 387+ abbr.py.y)
        __res:getPNGCC(2, 100, 1022, 892, 252):平铺(760 + abbr.py.x, 252):显示(100, 387+ abbr.py.y)
        __res:getPNGCC(2, 992, 1022, 100, 252):显示(860 + abbr.py.x, 387+ abbr.py.y)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    
end
function 对话栏:头像偏移(名称)
	if 名称 == "食铁兽" then
		return 0, -26
	elseif 名称 == "蜃气妖" or 名称 == "进阶蜃气妖" then
		return -100, -218
	elseif 名称 == "修罗傀儡鬼" then
		return -100, -277
	elseif 名称 == "机关人人形" then
		return 0, -16
	end
	return 0, 0  
end
function 对话栏:显示(x, y)
	local 偏移x, 偏移y = self:头像偏移(self.头像名称)
    if self.头像 then
        self.头像:显示(0+ 偏移x, 385 + abbr.py.y - self.头像.高度 + 偏移y)
    end
    if self.名称 then
        self.名称:显示(20, 359 + abbr.py.y)
    end
end

function 对话栏:打开(数据)
    if not 数据.对话 then return end
    对话栏:置可见(true)
    self:置头像名称(数据.模型, 数据.名称)
    table.print(数据)
    self:置对话选项(数据.对话, 数据.选项, 数据.下一页)
    self.回调处理 = 数据.回调处理
    self.选中名称 = 数据.选中名称
    self.名称缓存 = 数据.名称
    self.fujia = 数据.附加事件
end

function 对话栏:置头像名称(头像, 名称,下一页)
    self.头像 = nil
    self.名称 = nil
    self.头像名称=nil

    if 名称 and 名称 ~= "" then
        local nsf = require('SDL.图像')(960 + abbr.py.x, 引擎.高度)
        if nsf:渲染开始(0, 0, 0, 0) then
            __res:getPNGCC(1, 448, 0, 20, 28):显示(0, 0)
            __res:getPNGCC(1, 20 + 448, 0, 45, 28):平铺(160, 28):显示(20, 0)
            __res:getPNGCC(1, 81 + 448, 0, 20, 28):显示(180, 0)
            local 宽度 = 字体20:取宽度(名称)
            字体20:置颜色(250, 250, 10)
            字体20:取图像(名称):显示(200 / 2 - 宽度 / 2, 4)
            if 下一页 then
                字体20:取图像("点击此处继续对话！"):显示(200 / 2 - 宽度 / 2 + 350, 75)
            end
            nsf:渲染结束()
        end
        self.名称 = nsf:到精灵()
    end
  if 头像 and 头像~="" then
    local lssc = 取头像(头像)
    if lssc then
        self.头像 = __res:取精灵(__res:取地址('shape/mx/', lssc[4]))
        self.头像名称=头像
    end
end
    self.名称缓存 = 名称
end

function 对话栏:置对话选项(对话, 选项, 下一页)
    对话栏.对话文本:清空()
    对话栏.对话文本:置文本(对话 or "")
    对话栏.选项缓存 = 选项 or {}
    对话栏.下一页 = 下一页
    if #对话栏.选项缓存 == 0 then
        对话栏.选项控件:置可见(false)
    else
        对话栏.选项控件:置可见(true)
        对话栏.选项控件:重置()
        对话栏.选项控件.选项网格:选项加入()
    end

end

function 对话栏:左键弹起(x, y, msg)
    if #对话栏.选项缓存 == 0 and 对话栏.下一页 then
        对话栏:置头像名称(对话栏.下一页[1] or '天兵', 对话栏.下一页[2] or '天兵',1)
        对话栏:置对话选项(对话栏.下一页[3], 对话栏.下一页[4], 对话栏.下一页[5])
    else
        self:置可见(false)
    end
end



local 关闭 = 对话栏:创建我的按钮(__res:getPNGCC(2, 8, 935, 44, 25), "关闭", 916 + abbr.py.x, 388 + abbr.py.y)

function 关闭:左键弹起(x, y, msg)
    对话栏:置可见(false)
end

local 对话文本 = 对话栏:创建我的文本("对话文本", 15, 400 + abbr.py.y, 930 + abbr.py.x, 130)
function 对话文本:初始化()

end

local 选项控件 = 对话栏:创建控件('选项控件',705 + abbr.py.x, 35 + abbr.py.y, 255, 355)
function 选项控件:重置()
    local nsf = require('SDL.图像')(255,355)
    if nsf:渲染开始() then
        __res:getPNGCC(2, 1, 572, 255, 355):显示(0,0)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())

end


local 选项网格 = 对话栏.选项控件:创建网格("选项网格", 10, 43, 255, 276)
function 选项网格:选项加入()
    self:创建格子(305, 70, 0, 0, #对话栏.选项缓存, 1, true)
    
    local 有效按钮数 = 0
    for i, v in ipairs(self.子控件) do
        if 对话栏.选项缓存[i] and 对话栏.选项缓存[i] ~= "" then
            local 按钮 = v:创建我的按钮(__res:getPNGCC(2, 1, 962, 225, 62, true), "按1钮" .. i, 0, 10, 对话栏.选项缓存[i]) 
            function 按钮:左键单击(x, y, msg)
                对话栏:对话事件处理(对话栏.选项缓存[i], i)
            end
            v:置可见(true, true)
            v.可视 = true
            有效按钮数 = 有效按钮数 + 1
        else
            v:置可见(false, true)
        end
    end
    local 当前Y = 0
    for i, v in ipairs(self.子控件) do
        if v.可视 then
            v.y = 当前Y
            当前Y = 当前Y + 70
        end
    end
end

local teshushij={}
teshushij["开启（花费0仙玉）"]=1
teshushij["开启（花费60仙玉）"]=1
teshushij["开启（花费120仙玉）"]=1
teshushij["开启（花费240仙玉）"]=1
teshushij["开启（花费480仙玉）"]=1
teshushij["开启（花费960仙玉）"]=1
teshushij["开启（花费1920仙玉）"]=1
teshushij["开启（花费3840仙玉）"]=1
teshushij["开启（花费7680仙玉）"]=1
teshushij["开启（花费15360仙玉）"]=1
function 对话栏:对话事件处理(事件,i)
    if 事件 == "不了不了" or 事件 == "算了算了" or 事件 == "太贵了我没钱" or 事件 == "我随便逛逛 不好意思" or 事件 == "我只是来看看" or 事件 == "我只是看看" or 事件 == "只是路过" or 事件 == "我只是路过" or 事件 == "我只是随便看看" or 事件 == "我还要逛逛" or 事件 == "我点错了" or 事件 == "我什么也不想做" or 事件 == "我保留意见" or 事件 == "我什么都不想做" or 事件 == "没什么，我只是看看" or 事件 == "我们后会有期" or 事件 == "稍等。" then
        对话栏:置可见(false)
    elseif 事件 == "我要吸附魔兽要诀" then
        发送数据(当前 or self and self.当前, 3759, {兽诀格子 = 多开数据[多开数据.当前].__UI弹出.道具鉴定.选中兽决})
        多开数据[多开数据.当前].__UI弹出.道具鉴定.选中兽决 = nil
        对话栏:置可见(false)
    elseif 事件 == "炼制灵犀之屑" then
        发送数据(当前 or self and self.当前, 6202)
    elseif 事件 == "合成灵犀玉" then
        发送数据(当前 or self and self.当前, 6218)
        对话栏:置可见(false)
    elseif 事件 == "更换神器五行" then
        发送数据(当前 or self and self.当前, 6201)
        对话栏:置可见(false)
    elseif 事件 == "F1" or 事件 == "F2" or 事件 == "F3" or 事件 == "F4" or 事件 == "F5" or 事件 == "F6" or 事件 == "F7" or 事件 == "F8" then
		发送数据(当前 or self and self.当前,11.1,{位置=事件,类型=4})
        对话栏:置可见(false)
		return 0
    elseif teshushij[事件] then
		发送数据(当前 or self and self.当前,6603,{bh=多开数据[多开数据.当前].__UI界面["窗口层"].翻一番.临时编号})
		对话栏["置可见"](对话栏, false)
		return 0
    elseif 事件 == "打开翻一番" then
		发送数据(当前 or self and self.当前,6602)
		对话栏["置可见"](对话栏, false)
		return 0
	elseif 事件 == "确定领取" then
		发送数据(当前 or self and self.当前,6604)
		对话栏["置可见"](对话栏, false)
		多开数据[多开数据.当前].__UI界面["窗口层"].翻一番:结束游戏()
		return 0

    elseif 事件 == "法系神兽" or 事件 == "物理神兽" then
        local 物法
        if 事件 == "法系神兽" then
            物法 = "法系"
        else
            物法 = nil
        end
        发送数据(当前 or self and self.当前, 40, { 对话栏.选中名称, 物法 })
        对话栏:置可见(false)
        -- elseif 事件 == "打开物品仓库" then
        --     发送数据(当前 or self and self.当前,97.1)
        --     对话栏:置可见(false)
        -- elseif 事件 == "打开召唤兽仓库" then
        --     发送数据(当前 or self and self.当前,97.2)
        --     对话栏:置可见(false)
    elseif 事件 == "乾元丹学习" then
        对话栏:置可见(false)
        多开数据[当前].__UI界面.窗口层.乾元丹学习:打开()
    elseif 事件 == "切磋" or 事件 == "单挑" then
		if PK选中玩家==0 then
			tp.常规提示:打开("#Y/先看下他是不是队长吧")
			return 0
		end
		if 事件 == "切磋" then
			发送数据(当前 or self and self.当前, 6561,{序列=PK选中玩家})
		elseif 事件 == "单挑" then
			发送数据(当前 or self and self.当前, 6562,{序列=PK选中玩家})
		end
        对话栏:置可见(false)

    elseif 事件 == "购买共享仓库" then
        发送数据(当前 or self and self.当前,8004)
        对话栏["置可见"](对话栏, false)
        return 0
    elseif 事件 == "购买召唤兽共享仓库" then
        发送数据(当前 or self and self.当前,8009)
        对话栏["置可见"](对话栏, false)
        return 0 

    elseif 事件 == "一键强化装备" then    
        对话栏:置可见(false)    
        多开数据[当前].__UI界面.窗口层.对话栏:打开({ 模型 = "梦幻精灵", 名称 = "1", 对话 = "一键强化将对所有装备进行附魔!消耗5000w银子",选项={"确定一键强化装备"}})                              
    elseif 事件 == "确定一键强化装备" then
		发送数据(当前 or self and self.当前,179)
        对话栏:置可见(false)
    elseif 事件 == "是" then
        发送数据(当前 or self and self.当前, 105)
        对话栏:置可见(false)
    elseif 对话栏.名称缓存 == "装备点化" then
        发送数据(当前 or self and self.当前, 3760, { 点化 = 事件 })
    elseif 对话栏.名称缓存 == "天赋符" then
        if 事件 ~= "我再想想" then
			对话栏.fujia.事件 = 事件
			发送数据(当前 or self and self.当前, 3814,对话栏.fujia)
		end
		对话栏.fujia=nil
		对话栏:置可见(false)
		return 0
    elseif 事件 == "下一页" then
        if 对话栏.下一页 then
            对话栏:置头像名称(对话栏.下一页[1] or '天兵', 对话栏.下一页[2] or '天兵')
            对话栏:置对话选项(对话栏.下一页[3], 对话栏.下一页[4], 对话栏.下一页[5])
        else
            对话栏.下一页 = nil
        end
    elseif 对话栏.回调处理 then
        对话栏.回调处理(i, 对话栏.选项缓存)
        对话栏:置可见(false)
    else
        发送数据(当前 or self and self.当前, 1502, { 事件, 多开数据[当前 or self and self.当前].角色信息.地图数据.编号, 对话栏.名称缓存, nil })
        对话栏:置可见(false)
    end
end