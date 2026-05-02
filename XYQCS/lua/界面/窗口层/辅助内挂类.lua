 
local 辅助内挂类 = 多开数据[多开数据.当前].__UI界面.窗口层:创建我的窗口("辅助内挂类",150,40,780,460)
local 当前 = 多开数据.当前
辅助内挂类.全选状态 = false
function 辅助内挂类:初始化()
    self.允许移动 = true
    
end
 
function 辅助内挂类:打开(data)
        self:置可见(true)
        self.开通 = data.vip
		self.明雷表 = data.mlb
		self.活动表 = data.hdb
		self.抓鬼表 = data.zgb
		self.玩家表 = data.data
        self.明雷数量=#self.明雷表
        self.活动数量=#self.活动表
        self.抓鬼数量 =#self.抓鬼表
       
        self.界面=1
        self.开始挂 = false
        self:更新显示()
        self.明雷列表:置可见(true)
        self.抓鬼列表:置可见(false)
        self.活动列表:置可见(false)
        self:变更勾选(data.data)

        self:更新全选按钮文字()
end

function 辅助内挂类:检查是否有勾选()
    if self.界面 == 1 then -- 明雷（多选）
        for i=1,#self.玩家表.明雷 do
            if self.玩家表.明雷[i] then
                return true
            end
        end
    end
    return false
end

-- 新增：更新全选按钮文字
function 辅助内挂类:更新全选按钮文字()
    local 有勾选 = self:检查是否有勾选()
    self.全选状态 = 有勾选
    self.全部勾选按钮:我的按钮置文字(
        self.全部勾选按钮,
        __res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),
        有勾选 and "全部取消" or "全部勾选"
    )
end


local 明雷列表 = 辅助内挂类:创建列表("明雷列表",24,35,600,400)
local xx=0 
local yy = 0
for i = 1, 16 do
    local 临时函数 = 明雷列表:创建我的多选按钮( __res:getPNGCC(2, 1172, 107, 26, 26, true), __res:getPNGCC(2, 1171, 75, 26, 26, true), i .. "明雷",10+xx*160,60+yy*35)
    function  临时函数:左键弹起(x, y)
                 if 辅助内挂类.玩家表.明雷[i] then
            辅助内挂类.玩家表.明雷[i] = false

       else
           辅助内挂类.玩家表.明雷[i] = true
         
       end
      发送数据(当前 or self and self.当前, 551,辅助内挂类.玩家表)
      辅助内挂类:更新全选按钮文字()
    end
    xx=xx+1 
    if xx== 4 then 
        xx=0 
        yy=yy+1 
    end 
end
local 活动列表 = 辅助内挂类:创建列表("活动列表",24,35,600,400)
local xx=0 
local yy = 0
for i = 1, 2 do   ---------活动挂机数量位置 对应你服务端得数量
    local 临时函数 = 活动列表:创建我的多选按钮( __res:getPNGCC(2, 1172, 107, 26, 26, true), __res:getPNGCC(2, 1171, 75, 26, 26, true), i .. "活动",10+xx*160,60+yy*35)
    function  临时函数:左键弹起(x, y)
        if 辅助内挂类.玩家表.活动[i] then
            辅助内挂类.玩家表.活动[i] = false
       else
        辅助内挂类.玩家表.活动[i] = true
         for an=1,#辅助内挂类.玩家表.活动 do
             if an ~= i then
                辅助内挂类.玩家表.活动[an] = false
             end
         end
       end
      发送数据(当前 or self and self.当前, 551,辅助内挂类.玩家表)

    end
    xx=xx+1 
    if xx== 4 then 
        xx=0 
        yy=yy+1 
    end 
end
local 抓鬼列表 = 辅助内挂类:创建列表("抓鬼列表",24,35,600,400)
local xx=0 
local yy = 0
for i = 1, 2 do
    local 临时函数 = 抓鬼列表:创建我的多选按钮( __res:getPNGCC(2, 1172, 107, 26, 26, true), __res:getPNGCC(2, 1171, 75, 26, 26, true), i .. "抓鬼",10+xx*160,60+yy*35)
    function  临时函数:左键弹起(x, y)
        if 辅助内挂类.玩家表.抓鬼[i] then
            辅助内挂类.玩家表.抓鬼[i] = false
        else
        辅助内挂类.玩家表.抓鬼[i] = true
         for an=1,#辅助内挂类.玩家表.抓鬼 do
             if an ~= i then
                辅助内挂类.玩家表.抓鬼[an] = false
             end
         end
       end
        发送数据(当前  or self and self.当前,551,辅助内挂类.玩家表)
    end
    xx=xx+1 
    if xx== 4 then 
        xx=0 
        yy=yy+1 
    end 
end

function 辅助内挂类:变更勾选(数据)
    table.print(self.玩家表.活动)
	 self.玩家表 = 数据
	 for n=1,#self.明雷表 do
         self.明雷列表[n .. "明雷"]:置选中(self.玩家表.明雷[n])
 	 end
	for n=1,#self.活动表 do
        self.活动列表[n .. "活动"]:置选中(self.玩家表.活动[n])
	end
	for n=1,#self.抓鬼表 do
        self.抓鬼列表[n .. "抓鬼"]:置选中(self.玩家表.抓鬼[n])
	end

    self:更新全选按钮文字()
end
 
function 辅助内挂类:更新显示(data)
       local nsf = require('SDL.图像')(680,460)
    if nsf:渲染开始() then
        置窗口背景("辅助内挂类",100,16,675,430,true):显示(0,0)
        local xx=0 
        local yy = 0
        字体20:置颜色(__取颜色('白色'))
        if self.界面==1 then
            for  i = 1,self.明雷数量 do
           字体20:取图像(self.明雷表[i].名称):显示(45+24+xx*160,62+35+yy*35)
              xx=xx+1 
               if xx== 4 then 
               xx=0 
               yy=yy+1 
                end 
                end
         elseif self.界面==2 then
                for  i = 1,self.活动数量 do
                字体20:取图像(self.活动表[i].名称):显示(45+24+xx*160,62+35+yy*35)
                    xx=xx+1 
                   if xx== 4 then 
                     xx=0 
                     yy=yy+1 
                    end 
                 end
           elseif self.界面==3 then
                    for  i = 1,self.抓鬼数量 do
                    字体20:取图像(self.抓鬼表[i].名称):显示(45+24+xx*160,62+35+yy*35)
                        xx=xx+1 
                       if xx== 4 then 
                         xx=0 
                         yy=yy+1 
                        end 
              
                      end         
        end
           字体181:取图像("注意:勾选后自动保存配置，点击开始挂机后。在哪个界面点开始挂机，只\n会进行该界面的挂机功能。\n关闭界面立即停止挂机，收起界面不会停止挂机。"):显示(50, 300)
        if self.开通 then
            字体181:置颜色(__取颜色("白色"))
            字体181:取图像("挂机功能:"):显示(50, 60)
            字体181:置颜色(__取颜色("绿色"))
            字体181:取图像("已开通"):显示(130, 60)
        else
            字体181:置颜色(__取颜色("白色"))
            字体181:取图像("挂机功能:"):显示(30, 60)
            字体181:置颜色(__取颜色("红色"))
            字体181:取图像("未开通"):显示(130, 60)
        end
         nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
end
for i, v in ipairs {
    { name = '场景', x = 674, y = 58, tcp = __res:getPNGCC(1, 686, 0, 54, 98, true), tcp2 = __res:getPNGCC(1, 1132, 0, 54, 99, true), font = "场\n景\n挂\n机" },
    { name = '活动', x =674, y = 162, tcp = __res:getPNGCC(1, 686, 0, 54, 98, true), tcp2 = __res:getPNGCC(1, 1132, 0, 54, 99, true), font = "活\n动\n挂\n机" },
    -- { name = '抓鬼', x =674, y = 266, tcp = __res:getPNGCC(1, 686, 0, 54, 98, true), tcp2 = __res:getPNGCC(1, 737, 0, 54, 99, true), font = "抓\n鬼\n系\n列" },
  
} do
    local 临时函数 = 辅助内挂类:创建我的单选按钮(v.tcp, v.tcp2, v.name, v.x, v.y, v.font)
    function 临时函数:左键弹起(x, y)
        if v.name=="场景" then
          辅助内挂类.界面=1
         辅助内挂类.明雷列表:置可见(true)
         辅助内挂类.抓鬼列表:置可见(false)
         辅助内挂类.活动列表:置可见(false)
         辅助内挂类.全部勾选按钮:置可见(true)
        elseif v.name=="活动" then
            辅助内挂类.界面=2
          辅助内挂类.明雷列表:置可见(false)
          辅助内挂类.抓鬼列表:置可见(false)
          辅助内挂类.活动列表:置可见(true)
         辅助内挂类.全部勾选按钮:置可见(false)

        elseif v.name=="抓鬼" then
            辅助内挂类.明雷列表:置可见(false)
            辅助内挂类.抓鬼列表:置可见(true)
            辅助内挂类.活动列表:置可见(false)
         辅助内挂类.全部勾选按钮:置可见(false)

         辅助内挂类.界面=3
        end
         辅助内挂类:更新显示()
         辅助内挂类:更新全选按钮文字()
    end
end


local 关闭 = 辅助内挂类:创建我的按钮(__res:getPNGCC(1,401,0,46,46),"关闭",653,0)

function 关闭:左键弹起(x,y,msg)
    辅助内挂类:置可见(false)
    if 辅助内挂类.置精灵 then
        辅助内挂类:置精灵(nil)  -- 释放精灵资源
    end
    self.图像 = nil
    self.数据 = nil
end

辅助内挂类.全部勾选按钮 = 辅助内挂类:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"全部勾选",150,375,"全部勾选")
function 辅助内挂类.全部勾选按钮:左键弹起(x, y)
    local 目标状态 = not 辅助内挂类.全选状态 -- 反转当前状态（全选→取消，取消→全选）
    if 辅助内挂类.界面 == 1 then -- 明雷（多选）
        for i=1,#辅助内挂类.玩家表.明雷 do
            辅助内挂类.玩家表.明雷[i] = 目标状态
            辅助内挂类.明雷列表[i .. "明雷"]:置选中(目标状态)
        end
    end
    发送数据(当前 or self and self.当前, 551, 辅助内挂类.玩家表)
    if not 目标状态 and 辅助内挂类.开始挂 then
        辅助内挂类.开始挂 = false
        辅助内挂类.开始挂机:重置()
        发送数据(当前 or self and self.当前, 552, {界面=辅助内挂类.界面,变更=辅助内挂类.开始挂})
        多开数据[当前].__UI弹出.提示框:打开("#Y/已全部取消勾选，自动停止挂机。")
    end
    辅助内挂类:更新全选按钮文字()
end


local 开始挂机 = 辅助内挂类:创建我的按钮(__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"开始挂机",400,375,"开始挂机")
function  开始挂机:左键弹起(x, y)
    辅助内挂类.开始挂 = not 辅助内挂类.开始挂
    辅助内挂类.开始挂机:重置()
		发送数据(当前 or self and self.当前,552,{界面=辅助内挂类.界面,变更=辅助内挂类.开始挂})
 end
 function 开始挂机:重置(sj)
    if not 辅助内挂类.开始挂 then
        辅助内挂类:我的按钮置文字( self,__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"开始挂机")
   else

       辅助内挂类:我的按钮置文字(self,__res:getPNGCC(3,2,507,124,41,true):拉伸(123,41),"停止挂机")
   end

 end
 function 辅助内挂类:变更挂机文字(sj)
	if sj~=nil then  
		self.开始挂 = sj
	end
   self.开始挂机:重置()

end