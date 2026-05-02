
local 输入栏 = 多开数据[多开数据.当前].__UI界面.窗口层:创建窗口("输入栏",0,0,390,200)
local 当前 = 多开数据.当前
local function 判断游戏名字(mz)
    if string.find(mz,"[%s%p%c%z%?\\!@#%$%%&%*%(%)%^,%.%+%-/<>;'\"%[%]{}]")~=nil then
        return 1
    elseif string.find(mz,"　")~=nil or string.find(mz, "GM") ~= nil or string.find(mz, "Gm") ~= nil or string.find(mz, "充值") ~= nil or string.find(mz, "gm") ~= nil or string.find(mz, "管理") ~= nil or string.find(mz, "老猫") ~= nil or string.find(mz, "国家") ~= nil or string.find(mz, "主席") ~= nil or string.find(mz, "近平") ~= nil then
        return 1
    end
end
function 输入栏:初始化()
    
end

function 输入栏:打开(类型,对话)
    self:置可见(true,true)
    __置窗口坐标(self)
    local nsf = require('SDL.图像')(390,200)
    if nsf:渲染开始() then
        置窗口背景(类型,0,10,390,190,类型):显示(0,0)
        取输入背景(0,0,310,23):显示(20,93)
        nsf:渲染结束()
    end
    self:置精灵(nsf:到精灵())
    self.输入栏文本:清空()
    self.类型=类型
    self.输入栏文本:置文本("#Y"..对话)
end

local 确定 = 输入栏:创建我的按钮(__res:getPNGCC(1,401,65,175,43,true):拉伸(124,43),"确定",30,140,"确定")

function 确定:左键弹起(x,y,msg)
    if 输入栏.类型 == "帮派宗旨" then
        if 输入栏.内容输入:取文本() == "" then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入您要修改的帮派宗旨！")
        elseif string.len(输入栏.内容输入:取文本()) <= 2  then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/最低帮派名称不能少于1个字符！")
        else
            发送数据(当前 or self and self.当前,6105,{文本=输入栏.内容输入:取文本()})
        end
    elseif 输入栏.类型 == "月饼造句" then
        if 输入栏.内容输入:取文本() == "" then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入您使用月饼所造的句子！")
            return
        elseif string.len(输入栏.内容输入:取文本()) <= 6  then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/你所造句太短了！")
            return
        else
            发送数据(当前 or self and self.当前,68,{文本=输入栏.内容输入:取文本()})
        end
    elseif 输入栏.类型 == "改名" then
        if 输入栏.内容输入:取文本() == "" then
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入您要修改的名称！")
            return
        elseif string.len(输入栏.内容输入:取文本()) <= 4  then
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/最低名称不能少于2个字符！")
            return
        elseif 判断游戏名字(输入栏.内容输入:取文本())==1 then
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/名字不能带有空格或者特殊符号或者敏感词语")
            return
        else
            发送数据(当前 or self and self.当前,71,{名称=输入栏.内容输入:取文本()})
        end
    elseif 输入栏.类型 == "帮派改名" then
        if 输入栏.内容输入:取文本() == "" then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入您要修改的帮派名称！")
            return
        elseif string.len(输入栏.内容输入:取文本()) <= 4  then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/最低帮派名称不能少于3个字符！")
            return
        else
            发送数据(当前 or self and self.当前,6117,{名称=输入栏.内容输入:取文本()})
        end
    elseif 输入栏.类型 == "资金捐献" then
        if tonumber(输入栏.内容输入:取文本()) == nil or tonumber(输入栏.内容输入:取文本()) < 100000 then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/资金捐献每笔最少10W！")
            return
        else
            发送数据(当前 or self and self.当前,6118,{数额=tonumber(输入栏.内容输入:取文本())})
        end
    elseif 输入栏.类型 == "帮费设置" then
        if tonumber(输入栏.内容输入:取文本()) == nil or tonumber(输入栏.内容输入:取文本()) < 0 then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/帮费设置要求必须大于等于0！")
            return
        else
            发送数据(当前 or self and self.当前,6119,{数额=tonumber(输入栏.内容输入:取文本())})
        end
    -- elseif 输入栏.类型 == "物品拆分" then
    --     if tonumber(输入栏.内容输入:取文本()) == nil or tonumber(输入栏.内容输入:取文本()) < 1 then
    --        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入正确得拆分数量！")
    --         return
    --     elseif tonumber(输入栏.内容输入:取文本()) >= self.数据.数量 then
    --        多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/该道具没有那么多的数量供你你拆分！")
    --         return
    --     else
    --         发送数据(当前 or self and self.当前,3745,{数量=tonumber(输入栏.内容输入:取文本()),数据=self.数据})
    --     end
    elseif 输入栏.类型 == "上架角色" then
        -- if tonumber(输入栏.内容输入:取文本()) == nil then
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/暂时不支持角色出售！")
        -- else
        --     发送数据(当前 or self and self.当前,61.1,{价格=})
        -- end
    elseif 输入栏.类型 == "更改宝宝造型" then
        if 输入栏.内容输入:取文本() == "" then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入您需要更改的造型！")
            return
        else
            发送数据(当前 or self and self.当前,5013,{文本=输入栏.内容输入:取文本()})
        end
    elseif 输入栏.类型 == "生死" then
        if tonumber(输入栏.内容输入:取文本()) == nil  then
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请重新填写输入框")
            return
        else
            发送数据(当前 or self and self.当前,6569,{文本=tonumber(输入栏.内容输入:取文本())})
        end

    elseif 输入栏.类型 == "请抄写：" then
        if 输入栏.内容输入:取文本() == "" then
           多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入您需要抄写的句子！")
            return
        else
            发送数据(当前 or self and self.当前,52,{文本=输入栏.内容输入:取文本()})
        end
    elseif 输入栏.类型 == "帮战报名" then
        if tonumber(输入栏.内容输入:取文本()) == nil or tonumber(输入栏.内容输入:取文本()) < 500000 then
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/帮战报名设置要求必须大于等于50W！")
            return
        else
            发送数据(当前 or self and self.当前,6550,{文本=tonumber(输入栏.内容输入:取文本())})
        end
    elseif 输入栏.类型 == "勾魂索" then
        if tonumber(输入栏.内容输入:取文本()) == nil or tonumber(输入栏.内容输入:取文本()) < 1 then
            多开数据[当前 or self and self.当前].__UI弹出.提示框:打开("#Y/请输入对方的ID！")
            return
        else
            发送数据(当前 or self and self.当前,6567 ,{文本=tonumber(输入栏.内容输入:取文本())})
        end
    end
    输入栏:置可见(false)
end

local 取消 = 输入栏:创建我的按钮(__res:getPNGCC(1,401,65,175,43,true):拉伸(124,43),"取消",240,140,"取消")

function 取消:左键弹起(x,y,msg)
    输入栏:置可见(false)
end

local 输入栏文本 = 输入栏:创建我的文本("输入栏文本",18,63,359,36)
function 输入栏文本:初始化()

end

local 内容输入 = 输入栏:创建我的输入("内容输入",25,100,359,36,nil,150,'黑色')