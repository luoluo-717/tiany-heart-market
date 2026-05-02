--[[
Author: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
Date: 2025-12-23 13:13:36
LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
LastEditTime: 2026-01-01 03:35:15
FilePath: \XYQCS\lua\界面\窗口层\弹出\召唤兽更多弹出.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
多开数据[多开数据.当前].__UI弹出.召唤兽更多弹出 = 多开数据[多开数据.当前].__UI界面:创建弹出窗口("召唤兽更多弹出", 339+70+30, 200 + abbr.py.y, 170, 320)----背景坐标
local 召唤兽更多弹出 = 多开数据[多开数据.当前].__UI弹出.召唤兽更多弹出
local 当前 = 多开数据.当前
function 召唤兽更多弹出:初始化()
  self:置精灵(取黑色背景(0, 0, 150, 260))
end
function 召唤兽更多弹出:打开()
  if self.是否可见 then
    self:置可见(false)
  else
    self:置可见(true)
  end
end
local lsan = {
  "鉴 定",
  "放 生",
  -- "锦 衣",
  "兽 魂",
  "进 化",




  -- "组队平台"
}
for i = 1, #lsan do
  local 临时函数 = 召唤兽更多弹出["创建我的按钮"](召唤兽更多弹出, __res:getPNGCC(2, 368, 906, 126, 52, true), lsan[i] .. "按钮", 12, 11 + (i - 1) * 60, lsan[i])
  function  临时函数:左键弹起(x, y, msg)
    if "鉴 定" == lsan[i] then
      if 多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽]~=nil then
        local 内丹开孔进度=0
    if 多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].内丹 and 多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].内丹.开孔进度 then
      内丹开孔进度=多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].内丹.开孔进度
    end
        多开数据[多开数据.当前].__UI弹出.提示框:打开("#Y/这只召唤兽还可以用喂食#G"..多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].元宵.可用.."#Y个元宵，#G"..多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].元宵.炼兽真经.."#Y本炼兽珍经，#G"..多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].元宵.如意丹.."#Y个如意丹，#G"..多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].元宵.千金露.."#Y个千金露，#G"..多开数据[当前 or self and self.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].元宵.水晶糕.."#Y个水晶糕。内丹开孔进度：#G"..内丹开孔进度)
      end
      elseif "进 化" == lsan[i] then
        多开数据[当前].__UI界面.窗口层.宝宝进化:打开()
      -- if 多开数据[当前].__UI界面.窗口层.召唤兽属性.选中召唤兽 and 多开数据[当前].角色信息.宝宝列表[多开数据[当前].__UI界面.窗口层.召唤兽属性.选中召唤兽] then
      --   发送数据(当前, 3801.4, { 序列 = 多开数据[当前].__UI界面.窗口层.召唤兽属性.选中召唤兽, 操作 = "进化宝宝" })
      -- end

      -- elseif "锦 衣" == lsan[i] then
      -- if 多开数据[当前].__UI界面.窗口层.召唤兽属性.选中召唤兽 and 多开数据[多开数据.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽] then
      --   local 事件 = function()
      --     发送数据(当前,207.2, {
      --       序列 = 多开数据[多开数据.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].认证码
      --     })
      --   end
      --    local wb = "少侠！要切换召唤兽锦衣造型吗"
      --   多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)
      -- end
    elseif "兽 魂" == lsan[i] then
      发送数据(当前,194.1,{序号1=1})

    elseif "放 生" == lsan[i] then
      if 多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽 and 多开数据[多开数据.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽] then
        local 事件 = function()
          发送数据(当前,5005, {
            序列 = 多开数据[当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].认证码
          })
        end
        local wb = "真的要放生#Y/" .. 多开数据[当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].等级 .. "级的#R/" .. 多开数据[多开数据.当前].角色信息.宝宝列表[多开数据[多开数据.当前].__UI界面["窗口层"].召唤兽属性.选中召唤兽].名称 .. "#W/吗?"
        -- 多开数据[多开数据.当前].__UI界面.窗口层.文本栏.打开(__UI界面.窗口层.文本栏, wb, 285, 155, 390, 200, 事件)
        多开数据[当前].__UI界面.窗口层.文本栏:打开(wb, 285, 155, 390, 200, 事件)

      end
    end
    召唤兽更多弹出["置可见"](召唤兽更多弹出, false)
  end
end