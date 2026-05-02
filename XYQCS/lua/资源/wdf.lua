
local SDL = require('SDL')
local GGF = require('GGE.函数')
local wdf = class('wdf')

function wdf:初始化(file)
    self.path = file
    self.wdf = require('gxyq.wdf')(file)
    self.list = self.wdf:GetList()
end

function wdf:取数据(path)
    local r = path
    if type(path) == 'string' then
        r = self:是否存在(path)
    end
    if type(r) == 'table' and r.wdf then
        return r.wdf:GetData(r.id)
    end
end

function wdf:是否存在(path)
    local hash = gge.hash(path)
    return self.list[hash]
end

-- function wdf:导出(path)
--     if not GGF['判断文件']('assets/' .. path) then
--         if path:sub(-3) == 'map' then
--             GGF['复制文件']('res/' .. path, 'assets/' .. path)
--         else
--             local name, hash = gge.utf8togbk(path):match('(%w+)/(.+)')
--             if name and _WDFS[name] and hash then
--                 if hash:sub(1, 2) == '0x' then
--                     hash = tonumber(hash:match('(.+)%.%w%w%w'))
--                 else
--                     hash = _HASH(hash)
--                 end
--                 local r = _WDFS[name][hash]
--                 if r then
--                     if not GGF['判断文件']('../out/' .. path) and not path:find('/0x') then
--                         print('out', path)
--                         GGF['写出文件']('../out/' .. path, r.wdf:GetData(r.id))
--                     end
--                     path = string.format('%s/0x%08X.%s', name, hash, path:sub(-3))
--                     if not GGF['判断文件']('assets/' .. path) then
--                         print('assets', path)
--                         GGF['写出文件']('assets/' .. path, r.wdf:GetData(r.id))
--                         return path
--                     end
--                 end
--             end
--         end
--     end
--     return path
-- end

-- function wdf:解压(src, dst)
--     local wdf = require('gxyq.wdf')(src)
--     for _, v in pairs(wdf:GetList()) do
--         print('解压', string.format('%s/%x.was', dst, v.hash))
--         __res:写出文件(string.format('%s/%x.was', dst, v.hash), wdf:GetData(v.id))
--     end
-- end

return wdf
