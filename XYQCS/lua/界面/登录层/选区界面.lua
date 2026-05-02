
local 选中
local 选区界面 = 多开数据[多开数据.当前].__UI界面.登录层:创建控件("选择大区",92+abbr.py2.x,73+abbr.py2.y,808,413)
local 当前 = 多开数据.当前
function 选区界面:初始化()
    self:置精灵(__res:取精灵('shape/ui/xq/1000261.was'))
    --self.默认=__res:取精灵('shape/ui/xq/2E588160.was')
    --self.默认服务器=__res:取精灵('shape/ui/xq/40FD8B71.was')
    self.右背景=__res:取精灵('shape/ui/xq/3961AD58.was')
    self.新区=__res:取动画('shape/ui/xq/5286B0B5.was'):取动画(1):播放(true)
    --self.默认x=__res:取精灵('shape/ui/xq/19243A82.was')
    --self.小区=__res:取精灵('shape/ui/xq/BD57A592.was')
    self.大区=__res:取精灵('shape/ui/xq/D330CE3F.was')
    --self.大区选中=__res:取精灵('shape/ui/xq/F5674AFF.was')
    self.测试 = __res:取精灵(__res:取地址('shape/ui/jm/',0x1000370)):置区域(100,100,500,500)
end
function 选区界面:更新(dt)
    self.新区:更新(dt)
end
function 选区界面:显示(x,y)
    self.右背景:显示(758+abbr.py2.x,73+abbr.py2.y)
    self.新区:显示(780+abbr.py2.x,266+abbr.py2.y)
    for i=1,#服务器表 do
        self.大区:显示(20+(75*(i-1))+92+abbr.py2.x,20+73+abbr.py2.y)
    end
end

for i=1,#服务器表 do
    local 临时函数名=选区界面:创建我的单选按钮14(__res:取图像('shape/ui/xq/D330CE3F.was'),__res:取图像('shape/ui/xq/F5674AFF.was'),服务器表[i].服务组,20+(75*(i-1)),20,服务器表[i].服务组)
    -- function 临时函数名:初始化()
    --     --self:置精灵(__res:取精灵('shape/ui/xq/D330CE3F.was'))
    --     self:置正常精灵()
    --     self:置按下精灵(__res:取精灵('shape/ui/xq/F5674AFF.was'))
    --     --self:置经过精灵(__res:取精灵('shape/ui/xq/F5674AFF.was'))
    --     self:置选中正常精灵()
    --     self:置文字(字体14,0,0)
    -- end
    function 临时函数名:左键按下(消息,x,y)
        -- print(消息)
       
        if 消息 then
            for s=1,#服务器表 do
                选区界面[服务器表[s].服务组]:置选中(false)
            end
            选中=i
            -- print(i)
            选区界面[服务器表[选中].服务组]:置选中(true)
        end
    end
end

local 进入游戏 = 选区界面:创建我的was按钮('shape/ui/1000258.was',"进入游戏",666,317)

function 进入游戏:左键弹起(x,y,msg)
    if 选中 then
        if not 客户端:连接(服务器表[选中].IP,服务器表[选中].端口) then
            print("连接失败")  
        else
            多开数据[当前].__连接信息.IP = 服务器表[选中].IP
            多开数据[当前].__连接信息.端口 = 服务器表[选中].端口
            选区界面:置可见(false)
            多开数据[当前].__UI界面.登录层.登录游戏:置可见(true,true)
        end
    end
end

local 退出游戏 = 选区界面:创建我的was按钮('shape/ui/1000247.was',"退出游戏",666,370)


function 退出游戏:左键按下(消息,x,y)
    -- if 消息 then
    --     引擎:关闭()
    -- end
    标签:关闭窗口()
end