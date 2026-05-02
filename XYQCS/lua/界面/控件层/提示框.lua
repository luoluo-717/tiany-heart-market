--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-08-10 00:34:17
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2025-11-27 12:46:05
FilePath: \XYQCS\lua\界面\控件层\提示框.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
多开数据[多开数据.当前].__UI弹出.提示框 = 多开数据[多开数据.当前].__UI界面:创建弹出控件("提示框",0,0)
local 提示框 = 多开数据[多开数据.当前].__UI弹出.提示框
local 当前 = 多开数据.当前
function 提示框:初始化()
    __置窗口坐标(self)
end

function 提示框:更新()
    if self.关闭时间 and self.关闭时间 <= os.time() then
        self.关闭时间 = nil
        self:置可见(false)
    end
end

function 提示框:左键弹起(x,y,msg)
    self.关闭时间 = nil
    self:置可见(false)
end

function 提示框:打开(数据)
    self.提示文本:清空()
    local w , h = self.提示文本:置文本(数据)
    self.关闭时间 = os.time() + 5
    self:置可见(true,true)
    self:置精灵(__res:getPNGCC(2,230,965,402,51):拉伸(w+20 , h+10):到精灵())
    self:置中心(w/2,-h/2)
    self:置宽高(w+20 , h+10)
end

local 提示文本 = 提示框:创建文本("提示文本",10,5,390,100)
function 提示文本:初始化()

end

