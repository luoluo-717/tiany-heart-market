--[[
    @Author       : GGELUA
    @Date         : 2022-02-13 01:19:53
Last Modified by: GGELUA
Last Modified time: 2023-11-09 21:56:38
--]]
local SDL = require('SDL')
function 取游戏时间()
    return SDL.GetTicks()
end
-- 无锦衣模型={影精灵=1}
function zdtostring (t)
	if t then
		local mark={}
		local assign={}
		local function ser_table(tbl,parent)
			mark[tbl]=parent
			local tmp={}
			for k,v in pairs(tbl) do
				local key= type(k)=="number" and string.format("[%s]", k) or k--string.format("[%q]", k)
				if type(v)=="table" then
					local dotkey= parent.. key
					if mark[v] then
						table.insert(assign,string.format("%s='%s'", dotkey,mark[v]))
					else
						table.insert(tmp, string.format("%s=%s", key,ser_table(v,dotkey)))
					end
				elseif type(v) == "string" then
					table.insert(tmp, string.format("%s=%q", key,v))
				elseif type(v) == "number" or type(v) == "boolean" then
					table.insert(tmp, string.format("%s=%s", key,v))
				end
			end
			return string.format("{%s}", table.concat(tmp,","))
		end
		return string.format("do local ret=%s%s return ret end", ser_table(t,"ret"),table.concat(assign," "))
	end
	return "do local ret={} return ret end"
end
function DeepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
function zdtostrings(t)
	if t then
		local mark={}
		local assign={}
		local function ser_table(tbl,parent)
			mark[tbl]=parent
			local tmp={}
			for k,v in pairs(tbl) do
				local key= type(k)=="number" and string.format("[%s]", k) or k--string.format("[%q]", k)
				if tonumber(key) then
					key = "["..key.."]"
				end
				-- print(key,parent)
				if type(v)=="table" then
					local dotkey= parent.. key
					if mark[v] then
						table.insert(assign,string.format("%s='%s'", dotkey,mark[v]))
					else
						table.insert(tmp, string.format("%s=%s", key,ser_table(v,dotkey)))
					end
				elseif type(v) == "string" then
					table.insert(tmp, string.format("%s=%q", key,v))
				elseif type(v) == "number" or type(v) == "boolean" then
					table.insert(tmp, string.format("%s=%s", key,v))
				end
			end
			return string.format("{%s}", table.concat(tmp,","))
		end
		return string.format("do local ret=%s%s return ret end", ser_table(t,"ret"),table.concat(assign," "))
	end
	return "do local ret={} return ret end"
end


function zdloadstring (t)
	if t then
		local f =  load(t)
		if f then
			return f()
		end
	end
end

function table.print (root)
	local print = print
	local tconcat = table.concat
	local tinsert = table.insert
	local srep = string.rep
	local type = type
	local pairs = pairs
	local tostring = tostring
	local next = next
	local cache = {  [root] = "." }
	local function _dump(t,space,name)
		local temp = {}
		for k,v in pairs(t) do
			local key = tostring(k)
			if cache[v] then
				tinsert(temp,"." .. key .. " {" .. cache[v].."}")
			elseif type(v) == "table" then
				local new_key = name .. "." .. key
				cache[v] = new_key
				tinsert(temp,"." .. key .. _dump(v,space .. (next(t,k) and "|" or " " ).. srep(" ",#key),new_key))
			else
				tinsert(temp,"." .. key .. " [" .. tostring(v).."]")
			end
		end
		return tconcat(temp,"\n"..space)
	end
	print(_dump(root, "",""))
	print('-------------------------------------')
end
function 复制表(t) --FIXME loop
    local r = {}
    if type(t) == 'table' then
        for k, v in pairs(t) do
            local tp = type(v)
            if tp == 'table' then
                r[k] = 复制表(v)
            elseif tp == 'string' or tp == 'number' or tp == 'boolean' then
                r[k] = v
            end
        end
    end
    return r
end

tablecopy = 复制表

function 分割文本(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end

function 生成XY(x,y)
    local f ={}
    f.x = tonumber(x) or 0
    f.y = tonumber(y) or 0
    setmetatable(f,{
    __add = function (a,b)
        return 生成XY(a.x + b.x,a.y + b.y)
    end,
    __sub = function (a,b)
        return 生成XY(a.x - b.x,a.y - b.y)
    end
    })
    return f
end

function direction4(角)
	local 方向 = 0
	if(角 >0 and 角 < 91) then
		方向 = 0 --"东北"
	elseif(角 > 90 and 角 < 181) then
		方向 = 1 --"西北"
	elseif(角 > 180 and 角 < 271) then
		方向 = 2 --"西南"
	elseif(角 > 270 or  角 == 0) then
		方向 = 3 --"东南"
	end
	return 方向+1
end

function direction8(角,t) --取八方向
	local 方向 = 0
	if(角 > 157 and 角 < 203) then
		方向 = 5 --"左"
	elseif(角 >202 and 角 < 248) then
		方向 = 2 --"左上"
	elseif(角 > 247 and 角 < 293) then
		方向 = 6 --"上"
	elseif(角 > 292 and 角 < 338) then
		方向 = 3 --"右上"
	elseif(角 > 337 or 角 < 24 ) then
		方向 = 7        --"右"
	elseif( 角 > 23 and 角 < 69 ) then
		方向 = 0       --"右下"
	elseif(角 > 68 and 角 < 114 )then
		方向 = 4 --"下"
	elseif(角 > 113 ) then
		方向 = 1 --"左下"
	end
	if t then
		方向 = direction48(方向)
	end
	return 方向 + 1
end

function direction48(d) --取四至八方向
	n = 0
	if d == 0 or d == 4 then
		n = 0
	elseif d == 1 or d == 5 then
		n = 1
	elseif d == 2 or d == 6 then
		n = 2
	elseif d == 3 or d == 7 then
		n = 3
	end
	return n
end

function test1( ... )
	local  c1 = collectgarbage("count")
	print("最开始,Lua的内存为",c1)
  	collectgarbage();--为了有干净的环境,先把可以收集的其他垃圾赶走先
  	local c2 = collectgarbage("count")
 	 print("现在内存为:",c2)
end

function 判断是否为空表(t)
    return _G.next( t ) == nil
end