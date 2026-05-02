--[[
    @Author       : GGELUA
    @Date         : 2022-05-09 17:55:56
Last Modified by: GGELUA
Last Modified time: 2023-10-15 18:32:18
--]]
local 乾元丹学习 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("乾元丹学习", 0, 0, 751, 510)
local 当前 = 多开数据.当前

local function 取乾元丹消耗(等级)
  local cc = 0
  local vv = 0
  if 等级 == 1 then
    cc = 2234
  elseif 等级 == 2 then
    cc = 2785
  elseif 等级 == 3 then
    cc = 3453
  elseif 等级 == 4 then
    cc = 4252
  elseif 等级 == 5 then
    cc = 5192
  elseif 等级 == 6 then
    cc = 6285
  elseif 等级 == 7 then
    cc = 7542
  elseif 等级 == 8 then
    cc = 9150
  elseif 等级 == 9 then
    cc = 11000
  end
  if 等级 == 1 then
    vv = 447
  elseif 等级 == 2 then
    vv = 557
  elseif 等级 == 3 then
    vv = 691
  elseif 等级 == 4 then
    vv = 850
  elseif 等级 == 5 then
    vv = 1038
  elseif 等级 == 6 then
    vv = 1257
  elseif 等级 == 7 then
    vv = 1508
  elseif 等级 == 8 then
    vv = 1820
  elseif 等级 == 9 then
    vv = 2344
  end
  return { 经验 = cc * 10000, 金钱 = vv * 10000 }
end

local function 乾元丹所需等级(数量)
  local sl = { 69, 89, 109, 129, 155, 159, 164, 168, 171 }
  for n = 1, #sl do
    if 数量 == n then
      return sl[n]
    end
  end
  return 69
end

function 乾元丹学习:初始化()
  __置窗口坐标(self)
  local nsf = require('SDL.图像')(595, 410)
  if nsf:渲染开始() then
    __res:取图像(__res:取地址("shape/ui/xz/", 0xA0000001)):显示(150, 25)
    nsf:渲染结束()
  end
  self:置精灵(nsf:到精灵())
end

function 乾元丹学习:打开()
  self:置可见(true)
  self:刷新()
end

function 乾元丹学习:刷新()
  self.数据 = 多开数据[当前 or self and self.当前].角色信息
  local nsf = require('SDL.图像')(580, 400)
  if nsf:渲染开始() then
    字体16:置颜色(0, 0, 0)
    字体16:取图像(取乾元丹消耗(1).经验):显示(290, 127)
    字体16:取图像(取乾元丹消耗(1).金钱):显示(290, 157)
    字体16:置颜色(__取颜色("黄色"))
    字体16:取图像(self.数据.当前经验):显示(475, 127)
    字体16:置颜色(__取银子颜色(self.数据.银子))
    字体16:取图像(self.数据.银子):显示(475, 157)
    字体16:置颜色(__取颜色("黄色"))
    字体16:取图像(self.数据.存银):显示(230, 187)
    字体16:取图像(self.数据.储备):显示(475, 187)
    字体16:取图像(乾元丹所需等级(self.数据.QYD.已换乾元丹 + 1) .. "级"):显示(330, 217)
    字体16:取图像(self.数据.QYD.可换乾元丹):显示(535, 217)
    字体16:取图像(self.数据.QYD.已用乾元丹):显示(330, 247)

    nsf:渲染结束()
  end
  self.图像 = nsf:到精灵()
end

local 关闭 = 乾元丹学习:创建我的按钮(__res:getPNGCC(1, 401, 0, 46, 46), "关闭", 580, 20)

function 关闭:左键弹起(x, y, msg)
  乾元丹学习:置可见(false)
end

for i, v in ipairs {
  { name = '炼化乾元丹', x = 410, y = 243, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x01000002)):拉伸(100, 22), font = '炼化乾元丹' },
  { name = '切换方案', x = 405, y = 339, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x01000002)):拉伸(85, 22), font = '切换方案' },
  { name = '查看', x = 497, y = 339, tcp = __res:取图像(__res:取地址("shape/ui/xz/", 0x01000002)):拉伸(85, 22), font = '查看' },
} do
  local 临时函数 = 乾元丹学习:创建我的按钮(v.tcp, v.name, v.x, v.y, v.font, nil, 3)
  function 临时函数:左键弹起(x, y)
    if v.name == '炼化乾元丹' then
      if 乾元丹学习.数据.QYD.可换乾元丹 > 0 then
        发送数据(当前 or self and self.当前, 34)
      else
        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开('#Y当前可炼化乾元丹不足')
      end
    elseif v.name == '查看' then
      乾元丹学习:置可见(false)
      多开数据[当前 or self and self.当前].__UI界面.窗口层.奇经八脉:打开()
    elseif v.name == "切换方案" then
      乾元丹学习:置可见(false)
      多开数据[当前 or self and self.当前].__UI界面.窗口层.奇经八脉:打开()
    end
  end
end
