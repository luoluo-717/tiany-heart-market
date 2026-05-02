--[[
    @Author       : GGELUA
    @Date         : 2022-04-14 06:58:40
Last Modified by: GGELUA
Last Modified time: 2023-11-07 13:01:39
--]]
local 飞行符 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("飞行符",163 + abbr.py2.x, 116 + abbr.py2.y,660,310)
local 当前 = 多开数据.当前
function 飞行符:初始化()
    -- __置窗口坐标(self)
    self:置精灵(__res:取精灵(__res:取地址('shape/ui/dt/',0x516749F4)))
end

function 飞行符:打开(新春)
    self.新春=新春
    self:置可见(true)
end

local 关闭 = 飞行符:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",610,0)

function 关闭:左键弹起(x,y,msg)
    飞行符:置可见(false)
end
local 飞行传送点={
  [1]=1001,
  [2]=1001,
  [3]=1501,
  [4]=1092,
  [5]=1070,
  [6]=1040,
  [7]=1226,
  [8]=1208,
}
for i, v in ipairs {
    {name = '长安城', x = 378 ,y = 83 , tcp = 0xDB61AD29},
    {name = '建邺城', x = 425 ,y = 191 , tcp = 0x3D561594},
    {name = '傲来国', x = 574 ,y = 244 , tcp = 0x6BD8F1C8},
    {name = '长寿村', x = 208 ,y = 17 , tcp = 0xC5C5FE46},
    {name = '西凉女国', x = 203 ,y = 85 , tcp = 0x29622DDB},
    {name = '宝象国', x = 186 ,y = 161 , tcp = 0x491E6B4C},
    {name = '朱紫国', x = 249 ,y = 224 , tcp = 0x549B2B83},
} do
    local  临时函数 = 飞行符:创建我的was按钮(__res:取动画(__res:取地址('shape/ui/dt/',v.tcp)),v.name,v.x,v.y)

    function 临时函数:左键弹起(x, y)
        if 飞行符.新春 then
        print("新春")

        多开数据[多开数据.当前].__UI界面.窗口层.新春飞行符:打开(飞行传送点[i + 1])
        
        else
        发送数据(当前 or self and self.当前,3706,{序列=i+1})
        print("飞行符")

        end
        飞行符:置可见(false)
    end
end