local mode = arg[1]
local source = arg[2]
local out_dir = arg[3]
local public_url = arg[4] or ""

package.path = "../GGELUA/ggelua/?.lua;../GGELUA/ggelua/?/?.lua;../GGELUA/ggelua/?/init.lua;" .. package.path
package.cpath = "../GGELUA/lib/?.dll;" .. package.cpath

gge = { isdebug = true }
class = require("GGE.class")

local SDL = require("SDL.SDL")
SDL.IMG_Init()

local function die(message)
  io.stderr:write(tostring(message) .. "\n")
  os.exit(1)
end

local function ensure_dir(dir)
  local win = dir:gsub("/", "\\")
  os.execute('mkdir "' .. win .. '" >nul 2>nul')
end

local function read_file(file)
  local handle = assert(io.open(file, "rb"))
  local data = handle:read("a")
  handle:close()
  return data
end

local function write_file(file, data)
  local handle = assert(io.open(file, "wb"))
  handle:write(data)
  handle:close()
end

local function esc(value)
  value = tostring(value or "")
  value = value:gsub("\\", "\\\\")
  value = value:gsub('"', '\\"')
  value = value:gsub("\n", "\\n")
  value = value:gsub("\r", "\\r")
  return '"' .. value .. '"'
end

local function encode_json(value)
  local value_type = type(value)
  if value_type == "nil" then
    return "null"
  elseif value_type == "boolean" or value_type == "number" then
    return tostring(value)
  elseif value_type == "string" then
    return esc(value)
  elseif value_type == "table" then
    local is_array = true
    local max = 0
    for key in pairs(value) do
      if type(key) ~= "number" or key < 1 or key % 1 ~= 0 then
        is_array = false
        break
      end
      if key > max then max = key end
    end
    local parts = {}
    if is_array then
      for i = 1, max do
        parts[#parts + 1] = encode_json(value[i])
      end
      return "[" .. table.concat(parts, ",") .. "]"
    end
    for key, item in pairs(value) do
      parts[#parts + 1] = esc(key) .. ":" .. encode_json(item)
    end
    table.sort(parts)
    return "{" .. table.concat(parts, ",") .. "}"
  end
  return "null"
end

local function base64_encode(data)
  local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  local out = {}
  for i = 1, #data, 3 do
    local a, b, c = data:byte(i, i + 2)
    local n = a * 65536 + (b or 0) * 256 + (c or 0)
    out[#out + 1] = chars:sub(math.floor(n / 262144) % 64 + 1, math.floor(n / 262144) % 64 + 1)
    out[#out + 1] = chars:sub(math.floor(n / 4096) % 64 + 1, math.floor(n / 4096) % 64 + 1)
    if b then
      out[#out + 1] = chars:sub(math.floor(n / 64) % 64 + 1, math.floor(n / 64) % 64 + 1)
    else
      out[#out + 1] = "="
    end
    if c then
      out[#out + 1] = chars:sub(n % 64 + 1, n % 64 + 1)
    else
      out[#out + 1] = "="
    end
  end
  return table.concat(out)
end

local function save_surface(surface, file)
  if not surface then return false end
  local ok = pcall(function()
    surface:SavePNG(file)
  end)
  return ok
end

local function export_scene(map_id)
  ensure_dir(out_dir)
  local map_path = "assets/scene/" .. tostring(map_id) .. ".map"
  local map = require("gxyq.map")
  local ud, info = map(map_path)
  if not ud or not info then
    die("cannot decode map " .. map_path)
  end

  local colnum = tonumber(info.colnum or 0) or 0
  local rownum = tonumber(info.rownum or 0) or 0
  local mapnum = tonumber(info.mapnum or (colnum * rownum)) or 0
  local tiles = {}
  local masks = {}
  local seen_masks = {}
  local collision = nil

  if ud.GetCell then
    local ok, cells = pcall(function()
      return ud:GetCell()
    end)
    if ok and type(cells) == "string" then
      collision = {
        width = colnum * 16,
        height = rownum * 12,
        cellSize = 20,
        blockedValue = 1,
        encoding = "base64",
        data = base64_encode(cells),
      }
    end
  end

  for tile_id = 0, mapnum - 1 do
    local surface, tile_masks = ud:GetMap(tile_id)
    local col = tile_id % colnum
    local row = math.floor(tile_id / colnum)
    local tile_name = string.format("tile_%04d.png", tile_id)
    local tile_file = out_dir .. "/" .. tile_name
    save_surface(surface, tile_file)
    tiles[#tiles + 1] = {
      id = tile_id,
      col = col,
      row = row,
      x = col * 320,
      y = row * 240,
      width = surface and surface.w or 320,
      height = surface and surface.h or 240,
      url = public_url .. "/" .. tile_name,
    }

    if tile_masks then
      for _, mask in ipairs(tile_masks) do
        local key = tostring(mask.id or (tostring(mask.x) .. "_" .. tostring(mask.y)))
        if not seen_masks[key] then
          local mask_surface = ud:GetMask(mask)
          local mask_name = string.format("mask_%s.png", key)
          local mask_file = out_dir .. "/" .. mask_name
          save_surface(mask_surface, mask_file)
          masks[#masks + 1] = {
            id = key,
            x = tonumber(mask.x or 0) or 0,
            y = tonumber(mask.y or 0) or 0,
            width = tonumber(mask.w or (mask_surface and mask_surface.w) or 0) or 0,
            height = tonumber(mask.h or (mask_surface and mask_surface.h) or 0) or 0,
            url = public_url .. "/" .. mask_name,
          }
          seen_masks[key] = true
        end
      end
    end
  end

  table.sort(masks, function(a, b)
    if a.y == b.y then return tostring(a.id) < tostring(b.id) end
    return a.y < b.y
  end)

  local manifest = {
    type = "scene",
    source = map_path,
    mapId = tonumber(map_id) or map_id,
    width = tonumber(info.width or 0) or 0,
    height = tonumber(info.height or 0) or 0,
    rownum = rownum,
    colnum = colnum,
    mapnum = mapnum,
    masknum = tonumber(info.masknum or #masks) or #masks,
    tileWidth = 320,
    tileHeight = 240,
    collision = collision,
    tiles = tiles,
    masks = masks,
  }
  write_file(out_dir .. "/manifest.json", encode_json(manifest))
  print(encode_json({ ok = true, manifest = public_url .. "/manifest.json", tiles = #tiles, masks = #masks }))
end

local function export_was(relative_path)
  ensure_dir(out_dir)
  local data = read_file("assets/" .. relative_path)
  local tcp = require("gxyq.tcp")
  local ud, info = tcp(data)
  if not ud or not info then
    die("cannot decode was " .. relative_path)
  end

  local groups = tonumber(info.group or 1) or 1
  local frames_per_group = tonumber(info.frame or 1) or 1
  local total = groups * frames_per_group
  local frames = {}

  for frame_id = 0, total - 1 do
    local surface, frame_info = ud:GetFrame(frame_id)
    local frame_name = string.format("frame_%04d.png", frame_id)
    local frame_file = out_dir .. "/" .. frame_name
    save_surface(surface, frame_file)
    frames[#frames + 1] = {
      index = frame_id,
      group = math.floor(frame_id / frames_per_group),
      frame = frame_id % frames_per_group,
      x = frame_info and (tonumber(frame_info.x or 0) or 0) or 0,
      y = frame_info and (tonumber(frame_info.y or 0) or 0) or 0,
      width = surface and surface.w or 0,
      height = surface and surface.h or 0,
      url = public_url .. "/" .. frame_name,
    }
  end

  local manifest = {
    type = "was",
    source = relative_path,
    width = tonumber(info.width or 0) or 0,
    height = tonumber(info.height or 0) or 0,
    groups = groups,
    framesPerGroup = frames_per_group,
    frames = frames,
  }
  write_file(out_dir .. "/manifest.json", encode_json(manifest))
  print(encode_json({ ok = true, manifest = public_url .. "/manifest.json", frames = #frames }))
end

if not mode or not source or not out_dir then
  die("usage: export-assets.lua scene <mapId> <outDir> <publicUrl> | was <relativePath> <outDir> <publicUrl>")
end

if mode == "scene" then
  export_scene(source)
elseif mode == "was" then
  export_was(source)
else
  die("unknown mode " .. tostring(mode))
end
