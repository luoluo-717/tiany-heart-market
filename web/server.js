const http = require("node:http");
const fs = require("node:fs");
const fsp = require("node:fs/promises");
const path = require("node:path");
const crypto = require("node:crypto");
const { spawn } = require("node:child_process");
const { TextDecoder } = require("node:util");

const ROOT = __dirname;
const PROJECT_ROOT = path.resolve(ROOT, "..");
const PUBLIC_DIR = path.join(ROOT, "public");
const DATA_DIR = path.join(ROOT, "data");
const GENERATED_DIR = path.join(PUBLIC_DIR, "generated");
const SOURCE_ROOT = path.join(PROJECT_ROOT, "XYQCS");
const ASSETS_DIR = path.join(SOURCE_ROOT, "assets");
const LUA_DATA_DIR = path.join(SOURCE_ROOT, "lua", "数据");
const SERVICE_DIR = path.join(PROJECT_ROOT, "服务端");
const ACCOUNT_DIR = path.join(SERVICE_DIR, "data");
const LUA_EXE = path.join(PROJECT_ROOT, "GGELUA", "lua.exe");
const EXPORT_SCRIPT = path.join(ROOT, "tools", "export-assets.lua");
const USERS_FILE = path.join(DATA_DIR, "users.json");
const STATIC_RUNTIME = process.env.STATIC_RUNTIME === "1";
const CHANGAN_MAP_ID = 1001;
const TILE_SCALE = 20;
const DEFAULT_SPAWN = { mapId: CHANGAN_MAP_ID, x: 250 * TILE_SCALE, y: 170 * TILE_SCALE, direction: 0 };
const ROLE_MODELS = [
  "剑侠客",
  "逍遥生",
  "飞燕女",
  "英女侠",
  "龙太子",
  "巨魔王",
  "虎头怪",
  "狐美人",
  "骨精灵",
  "神天兵",
  "舞天姬",
  "玄彩娥",
  "偃无师",
  "巫蛮儿",
  "羽灵神",
  "杀破狼",
  "桃夭夭",
];

const decoder = new TextDecoder("gb18030");
const sessions = new Map();
const renderJobs = new Map();
const staticPreload = {
  enabled: process.env.PRELOAD_STATIC === "1",
  running: false,
  ready: process.env.PRELOAD_STATIC !== "1",
  startedAt: null,
  completedAt: null,
  totalFiles: 0,
  loadedFiles: 0,
  totalBytes: 0,
  loadedBytes: 0,
  criticalUrls: [],
  error: "",
};

const MIME = {
  ".html": "text/html; charset=utf-8",
  ".css": "text/css; charset=utf-8",
  ".js": "text/javascript; charset=utf-8",
  ".json": "application/json; charset=utf-8",
  ".png": "image/png",
  ".jpg": "image/jpeg",
  ".jpeg": "image/jpeg",
  ".webp": "image/webp",
  ".svg": "image/svg+xml; charset=utf-8",
  ".ico": "image/x-icon",
  ".map": "application/octet-stream",
  ".was": "application/octet-stream",
  ".wdf": "application/octet-stream",
  ".mp3": "audio/mpeg",
  ".wav": "audio/wav",
};

function readText(file, encoding = "utf8") {
  try {
    const buffer = fs.readFileSync(file);
    return encoding === "gb18030" ? decoder.decode(buffer) : buffer.toString("utf8");
  } catch {
    return "";
  }
}

function listFiles(dir) {
  const files = [];
  const stack = [dir];
  while (stack.length) {
    const current = stack.pop();
    let entries = [];
    try {
      entries = fs.readdirSync(current, { withFileTypes: true });
    } catch {
      continue;
    }
    for (const entry of entries) {
      const full = path.join(current, entry.name);
      if (entry.isDirectory()) {
        stack.push(full);
      } else if (entry.isFile()) {
        files.push(full);
      }
    }
  }
  return files;
}

function listExistingFiles(dirs) {
  const files = [];
  for (const dir of dirs) {
    if (fs.existsSync(dir)) files.push(...listFiles(dir));
  }
  return [...new Set(files)];
}

function toUrlPath(relativePath) {
  return relativePath.split(path.sep).join("/").split("/").map(encodeURIComponent).join("/");
}

function toPosixPath(value) {
  return String(value || "").split(path.sep).join("/");
}

function json(res, status, payload) {
  res.writeHead(status, {
    "Content-Type": "application/json; charset=utf-8",
    "Cache-Control": "no-store",
  });
  res.end(JSON.stringify(payload));
}

async function parseJsonBody(req) {
  const chunks = [];
  for await (const chunk of req) chunks.push(chunk);
  if (!chunks.length) return {};
  return JSON.parse(Buffer.concat(chunks).toString("utf8"));
}

function readIni(file) {
  const data = {};
  let section = "default";
  for (const rawLine of readText(file, "gb18030").split(/\r?\n/)) {
    const line = rawLine.trim();
    if (!line || line.startsWith(";") || line.startsWith("#")) continue;
    const sectionMatch = line.match(/^\[(.+)]$/);
    if (sectionMatch) {
      section = sectionMatch[1];
      data[section] = data[section] || {};
      continue;
    }
    const pair = line.match(/^([^=]+)=(.*)$/);
    if (!pair) continue;
    data[section] = data[section] || {};
    data[section][pair[1].trim()] = pair[2].trim();
  }
  return data;
}

function stripLineComments(text) {
  return text
    .split(/\r?\n/)
    .map((line) => {
      let quote = "";
      for (let i = 0; i < line.length - 1; i += 1) {
        const char = line[i];
        if ((char === "\"" || char === "'") && line[i - 1] !== "\\") {
          quote = quote === char ? "" : quote || char;
        }
        if (!quote && char === "-" && line[i + 1] === "-") {
          return line.slice(0, i);
        }
      }
      return line;
    })
    .join("\n");
}

function parseLuaValue(value) {
  if (value == null) return null;
  const raw = String(value).trim();
  if (!raw || raw === "nil") return null;
  if (raw === "true") return true;
  if (raw === "false") return false;
  if (/^0x[0-9a-f]+$/i.test(raw)) return Number.parseInt(raw, 16);
  if (/^-?\d+(?:\.\d+)?$/.test(raw)) return Number(raw);
  const double = raw.match(/^"([\s\S]*)"$/);
  if (double) return double[1].replace(/\\"/g, "\"").replace(/\\n/g, "\n");
  const single = raw.match(/^'([\s\S]*)'$/);
  if (single) return single[1].replace(/\\'/g, "'").replace(/\\n/g, "\n");
  return raw;
}

function parseFields(body) {
  const fields = {};
  const source = stripLineComments(body);
  const re = /(?:\["([^"]+)"\]|([A-Za-z_\u4e00-\u9fff][\w\u4e00-\u9fff]*))\s*=\s*("(?:\\.|[^"])*"|'(?:\\.|[^'])*'|0x[0-9a-fA-F]+|-?\d+(?:\.\d+)?|true|false|nil|[^,\n}]+)/g;
  for (const match of source.matchAll(re)) {
    fields[match[1] || match[2]] = parseLuaValue(match[3]);
  }
  return fields;
}

function textField(fields, ...keys) {
  for (const key of keys) {
    const value = fields[key];
    if (value !== undefined && value !== null && value !== "") return String(value);
  }
  return "";
}

function numberField(fields, fallback, ...keys) {
  for (const key of keys) {
    const value = fields[key];
    if (typeof value === "number" && Number.isFinite(value)) return value;
    if (typeof value === "string" && /^-?\d+(?:\.\d+)?$/.test(value)) return Number(value);
  }
  return fallback;
}

function boolField(fields, ...keys) {
  return keys.some((key) => fields[key] === true);
}

function extractLuaAssignments(text, tableName) {
  const source = stripLineComments(text);
  const assignments = [];
  let cursor = 0;
  const marker = `${tableName}[`;
  while (cursor < source.length) {
    const start = source.indexOf(marker, cursor);
    if (start < 0) break;
    const indexStart = start + marker.length;
    const indexEnd = source.indexOf("]", indexStart);
    if (indexEnd < 0) break;
    const index = source.slice(indexStart, indexEnd).trim();
    const open = source.indexOf("{", indexEnd);
    if (open < 0) break;
    let depth = 0;
    let quote = "";
    let close = -1;
    for (let i = open; i < source.length; i += 1) {
      const char = source[i];
      if ((char === "\"" || char === "'") && source[i - 1] !== "\\") {
        quote = quote === char ? "" : quote || char;
      }
      if (quote) continue;
      if (char === "{") depth += 1;
      if (char === "}") {
        depth -= 1;
        if (depth === 0) {
          close = i;
          break;
        }
      }
    }
    if (close < 0) break;
    assignments.push({ index, body: source.slice(open + 1, close) });
    cursor = close + 1;
  }
  return assignments;
}

function extractIndexedAssignments(text) {
  const source = stripLineComments(text);
  const assignments = [];
  let cursor = 0;
  while (cursor < source.length) {
    const match = /\[\s*([^\]]+)\s*\]\s*=\s*\{/.exec(source.slice(cursor));
    if (!match) break;
    const start = cursor + match.index;
    const open = start + match[0].length - 1;
    let depth = 0;
    let quote = "";
    let close = -1;
    for (let i = open; i < source.length; i += 1) {
      const char = source[i];
      if ((char === "\"" || char === "'") && source[i - 1] !== "\\") {
        quote = quote === char ? "" : quote || char;
      }
      if (quote) continue;
      if (char === "{") depth += 1;
      if (char === "}") {
        depth -= 1;
        if (depth === 0) {
          close = i;
          break;
        }
      }
    }
    if (close < 0) break;
    assignments.push({ index: match[1].trim(), body: source.slice(open + 1, close) });
    cursor = close + 1;
  }
  return assignments;
}

function splitMapBlocks(text) {
  const blocks = [];
  let current = null;
  for (const line of text.split(/\r?\n/)) {
    const trimmed = line.trim();
    if (trimmed.startsWith("--")) continue;
    const match = line.match(/^\s*(?:if|elseif)\s+(.+?)\s+then\b(.*)$/);
    if (match) {
      if (current) blocks.push(current);
      current = {
        condition: match[1].trim(),
        comment: (match[2].match(/--\s*(.*)$/) || [])[1] || "",
        lines: [],
      };
      continue;
    }
    if (current) current.lines.push(line);
  }
  if (current) blocks.push(current);
  return blocks;
}

function idsFromCondition(condition) {
  const ids = new Set();
  for (const match of condition.matchAll(/地图ID\s*==\s*(\d+)|(\d+)\s*==\s*地图ID/g)) {
    ids.add(Number(match[1] || match[2]));
  }
  for (const match of condition.matchAll(/地图ID\s*>=\s*(\d+)\s+and\s+地图ID\s*<=\s*(\d+)/g)) {
    const start = Number(match[1]);
    const end = Number(match[2]);
    for (let id = start; id <= end; id += 1) ids.add(id);
  }
  return [...ids];
}

function addToMapList(target, key, value) {
  if (!target.has(key)) target.set(key, []);
  target.get(key).push(value);
}

function normalizeHash(value) {
  if (typeof value !== "number" || !Number.isFinite(value) || value <= 0) return "";
  return Math.trunc(value).toString(16).toLowerCase();
}

function buildAssetIndex() {
  const files = [];
  const byStem = new Map();
  const extStats = {};
  const folderStats = {};

  for (const full of listFiles(ASSETS_DIR)) {
    const stat = fs.statSync(full);
    const relative = path.relative(ASSETS_DIR, full);
    const relUrl = toUrlPath(relative);
    const ext = path.extname(full).slice(1).toLowerCase() || "none";
    const top = relative.includes(path.sep) ? relative.split(path.sep)[0] : "root";
    const stem = path.basename(full, path.extname(full)).toLowerCase();
    const item = {
      name: path.basename(full),
      relativePath: relative.split(path.sep).join("/"),
      folder: top,
      ext,
      size: stat.size,
      url: `/source-assets/${relUrl}`,
    };
    files.push(item);
    extStats[ext] = (extStats[ext] || 0) + 1;
    folderStats[top] = (folderStats[top] || 0) + 1;
    if (!byStem.has(stem)) byStem.set(stem, item);
  }

  return { files, byStem, extStats, folderStats };
}

function parseMapTables() {
  const text = readText(path.join(LUA_DATA_DIR, "场景数据.lua"));
  const names = new Map();
  const aliases = new Map();
  const bgm = new Map();

  for (const match of text.matchAll(/mapdmc\[(\d+)\]\s*=\s*"([^"]+)"/g)) {
    names.set(Number(match[1]), match[2]);
  }
  for (const match of text.matchAll(/mapdid\[(\d+)\]\s*=\s*(\d+)/g)) {
    aliases.set(Number(match[1]), Number(match[2]));
  }
  for (const match of text.matchAll(/mapbgm\[(\d+)\]\s*=\s*(\d+)/g)) {
    bgm.set(Number(match[1]), Number(match[2]));
  }
  for (let id = 3000; id <= 3150; id += 1) {
    if (!names.has(id)) names.set(id, `雁塔地宫${id - 3000 + 1}层`);
  }
  return { names, aliases, bgm };
}

function parseModels(assetIndex) {
  const text = readText(path.join(LUA_DATA_DIR, "模型数据.lua"));
  const models = new Map();
  const re = /SuoyouModel\["([^"]+)"\]\s*=\s*\{([\s\S]*?)\}/g;
  for (const match of text.matchAll(re)) {
    const name = match[1].trim();
    const fields = parseFields(match[2]);
    const hashes = {};
    const assets = {};
    for (const [key, value] of Object.entries(fields)) {
      const hash = normalizeHash(value);
      if (!hash) continue;
      hashes[key] = hash;
      const asset = assetIndex.byStem.get(hash);
      if (asset) assets[key] = asset;
    }
    models.set(name, { name, hashes, assets });
  }
  return models;
}

function parseHashLiteral(raw) {
  const value = String(raw || "").trim();
  if (/^0x[0-9a-f]+$/i.test(value)) return Number.parseInt(value, 16);
  if (/^\d+$/.test(value)) return Number(value);
  return 0;
}

function parseRoleDisplayModels(assetIndex) {
  const text = stripLineComments(readText(path.join(LUA_DATA_DIR, "模型数据.lua")));
  const models = new Map();
  const re = /(?:if|elseif)\s+ch\s*==\s*"([^"]+)"\s+then([\s\S]*?)(?=\s*elseif\s+ch\s*==|\nend\b)/g;
  for (const match of text.matchAll(re)) {
    const name = match[1].trim();
    if (!ROLE_MODELS.includes(name) || models.has(name)) continue;
    const values = {};
    for (const item of match[2].matchAll(/chs\[(\d+)\]\s*=\s*(0x[0-9a-fA-F]+|\d+)/g)) {
      const hash = normalizeHash(parseHashLiteral(item[2]));
      const asset = hash && assetIndex.byStem.get(hash);
      if (asset) values[item[1]] = asset;
    }
    if (values["1"] || values["2"]) {
      models.set(name, {
        name,
        stand: values["1"] || values["2"] || null,
        walk: values["2"] || values["1"] || null,
      });
    }
  }
  return models;
}

function parseNpcs(models) {
  const text = readText(path.join(LUA_DATA_DIR, "场景npc.lua"));
  const byMap = new Map();
  let total = 0;

  for (const block of splitMapBlocks(text)) {
    const ids = idsFromCondition(block.condition);
    if (!ids.length) continue;
    for (const assignment of extractLuaAssignments(block.lines.join("\n"), "假人")) {
      const fields = parseFields(assignment.body);
      const modelName = textField(fields, "模型", "造型");
      const npc = {
        id: Number.isFinite(Number(assignment.index)) ? Number(assignment.index) : assignment.index,
        name: textField(fields, "名称") || `NPC ${assignment.index}`,
        title: textField(fields, "称谓"),
        model: modelName,
        x: numberField(fields, 0, "X", "x"),
        y: numberField(fields, 0, "Y", "y"),
        direction: numberField(fields, 0, "方向"),
        eventId: fields["事件ID"] ?? null,
        event: textField(fields, "执行事件", "事件"),
        miniMapColor: numberField(fields, 0, "小地图名称颜色"),
        flags: {
          task: boolField(fields, "任务显示"),
          variant: boolField(fields, "变异"),
          ornament: boolField(fields, "显示饰品"),
        },
        modelAsset: models.get(modelName) || null,
        source: "XYQCS/lua/数据/场景npc.lua",
      };
      for (const mapId of ids) {
        addToMapList(byMap, mapId, { ...npc, mapId });
        total += 1;
      }
    }
  }

  for (const list of byMap.values()) {
    list.sort((a, b) => Number(a.id) - Number(b.id));
  }
  return { byMap, total };
}

function parseTeleports() {
  const text = readText(path.join(LUA_DATA_DIR, "传送数据.lua"));
  const teleportsByMap = new Map();
  const labelsByMap = new Map();
  let totalTeleports = 0;
  let totalLabels = 0;

  for (const block of splitMapBlocks(text)) {
    const ids = idsFromCondition(block.condition);
    if (!ids.length) continue;
    const content = block.lines.join("\n");
    for (const assignment of extractLuaAssignments(content, "传送")) {
      const fields = parseFields(assignment.body);
      const item = {
        id: Number.isFinite(Number(assignment.index)) ? Number(assignment.index) : assignment.index,
        x: numberField(fields, 0, "x", "X"),
        y: numberField(fields, 0, "y", "Y"),
        target: textField(fields, "切换", "名称"),
        source: "XYQCS/lua/数据/传送数据.lua",
      };
      for (const mapId of ids) {
        addToMapList(teleportsByMap, mapId, { ...item, mapId });
        totalTeleports += 1;
      }
    }
    for (const assignment of extractLuaAssignments(content, "传送名称")) {
      const fields = parseFields(assignment.body);
      const item = {
        id: Number.isFinite(Number(assignment.index)) ? Number(assignment.index) : assignment.index,
        x: numberField(fields, 0, "x", "X"),
        y: numberField(fields, 0, "y", "Y"),
        name: textField(fields, "名称"),
        levelFont: boolField(fields, "等级字体"),
        redFont: boolField(fields, "是否红字作"),
        source: "XYQCS/lua/数据/传送数据.lua",
      };
      for (const mapId of ids) {
        addToMapList(labelsByMap, mapId, { ...item, mapId });
        totalLabels += 1;
      }
    }
  }
  return { teleportsByMap, labelsByMap, totalTeleports, totalLabels };
}

function parseEffects() {
  const text = readText(path.join(LUA_DATA_DIR, "场景特效.lua"));
  const effectsByMap = new Map();
  let total = 0;
  for (const block of splitMapBlocks(text)) {
    const ids = idsFromCondition(block.condition);
    if (!ids.length) continue;
    for (const assignment of extractLuaAssignments(block.lines.join("\n"), "特效表")) {
      const fields = parseFields(assignment.body);
      const item = {
        id: Number.isFinite(Number(assignment.index)) ? Number(assignment.index) : assignment.index,
        x: numberField(fields, 0, "x", "X"),
        y: numberField(fields, 0, "y", "Y"),
        switchId: fields["切换"] ?? null,
        resource: textField(fields, "资源"),
        source: "XYQCS/lua/数据/场景特效.lua",
      };
      for (const mapId of ids) {
        addToMapList(effectsByMap, mapId, { ...item, mapId });
        total += 1;
      }
    }
  }
  return { effectsByMap, total };
}

function dataFilesSummary() {
  return listFiles(LUA_DATA_DIR)
    .filter((file) => /\.(lua|txt|ini)$/i.test(file))
    .map((file) => {
      const stat = fs.statSync(file);
      return {
        name: path.basename(file),
        relativePath: path.relative(SOURCE_ROOT, file).split(path.sep).join("/"),
        size: stat.size,
      };
    })
    .sort((a, b) => a.relativePath.localeCompare(b.relativePath, "zh-CN"));
}

function buildCatalog() {
  const assetIndex = buildAssetIndex();
  const mapTables = parseMapTables();
  const models = parseModels(assetIndex);
  const roleModelAssets = parseRoleDisplayModels(assetIndex);
  const npcCatalog = parseNpcs(models);
  const teleportCatalog = parseTeleports();
  const effectCatalog = parseEffects();
  const sceneFiles = new Map();

  for (const file of assetIndex.files) {
    if (file.folder !== "scene" || file.ext !== "map") continue;
    const id = Number(path.basename(file.name, ".map"));
    if (Number.isFinite(id)) sceneFiles.set(id, file);
  }

  const mapIds = new Set([CHANGAN_MAP_ID]);

  const maps = [...mapIds]
    .sort((a, b) => a - b)
    .map((id) => {
      const baseId = mapTables.aliases.get(id) || id;
      const asset = sceneFiles.get(id) || sceneFiles.get(baseId) || null;
      return {
        id,
        name: mapTables.names.get(id) || mapTables.names.get(baseId) || `地图 ${id}`,
        baseMapId: baseId,
        bgmId: mapTables.bgm.get(id) || mapTables.bgm.get(baseId) || null,
        hasRawMap: Boolean(asset),
        rawAsset: asset,
        npcCount: (npcCatalog.byMap.get(id) || []).length,
        teleportCount: (teleportCatalog.teleportsByMap.get(id) || []).length,
        labelCount: (teleportCatalog.labelsByMap.get(id) || []).length,
        effectCount: (effectCatalog.effectsByMap.get(id) || []).length,
      };
    });

  return {
    createdAt: new Date().toISOString(),
    assetIndex,
    mapTables,
    models,
    roleModelAssets,
    npcCatalog,
    teleportCatalog,
    effectCatalog,
    dataFiles: dataFilesSummary(),
    maps,
    mapsById: new Map(maps.map((item) => [item.id, item])),
    stats: {
      maps: maps.length,
      rawSceneFiles: sceneFiles.has(CHANGAN_MAP_ID) ? 1 : 0,
      npcs: (npcCatalog.byMap.get(CHANGAN_MAP_ID) || []).length,
      teleports: (teleportCatalog.teleportsByMap.get(CHANGAN_MAP_ID) || []).length,
      labels: (teleportCatalog.labelsByMap.get(CHANGAN_MAP_ID) || []).length,
      effects: (effectCatalog.effectsByMap.get(CHANGAN_MAP_ID) || []).length,
      models: models.size,
      assets: assetIndex.files.length,
      dataFiles: dataFilesSummary().length,
      folders: assetIndex.folderStats,
      extensions: assetIndex.extStats,
    },
  };
}

let catalog = buildCatalog();

function sceneBounds(npcs, teleports, labels, effects) {
  const points = [...npcs, ...teleports, ...labels, ...effects];
  const maxX = Math.max(48, ...points.map((item) => Number(item.x) || 0));
  const maxY = Math.max(36, ...points.map((item) => Number(item.y) || 0));
  return {
    tileScale: 20,
    width: Math.ceil((maxX + 24) * 20),
    height: Math.ceil((maxY + 18) * 20),
    maxTileX: Math.ceil(maxX + 24),
    maxTileY: Math.ceil(maxY + 18),
  };
}

function scenePayload(mapId = CHANGAN_MAP_ID) {
  const requestedId = Number(mapId);
  const id = requestedId === CHANGAN_MAP_ID ? requestedId : CHANGAN_MAP_ID;
  const map = catalog.mapsById.get(id) || {
    id,
    name: `地图 ${id}`,
    baseMapId: id,
    bgmId: null,
    hasRawMap: false,
    rawAsset: null,
    npcCount: 0,
    teleportCount: 0,
    labelCount: 0,
    effectCount: 0,
  };
  const npcs = catalog.npcCatalog.byMap.get(id) || [];
  const teleports = catalog.teleportCatalog.teleportsByMap.get(id) || [];
  const labels = catalog.teleportCatalog.labelsByMap.get(id) || [];
  const effects = catalog.effectCatalog.effectsByMap.get(id) || [];
  const displayMap = id === CHANGAN_MAP_ID ? { ...map, name: "天元市集" } : map;
  return {
    map: {
      ...displayMap,
      bounds: sceneBounds(npcs, teleports, labels, effects),
      rawAssetUrl: displayMap.rawAsset?.url || null,
      rawAssetSize: displayMap.rawAsset?.size || 0,
    },
    npcs,
    teleports,
    labels,
    effects,
  };
}

function listAccounts() {
  try {
    return fs
      .readdirSync(ACCOUNT_DIR, { withFileTypes: true })
      .filter((entry) => entry.isDirectory())
      .map((entry) => entry.name)
      .filter((name) => !name.includes("假人"));
  } catch {
    return [];
  }
}

function readAccount(account) {
  const ini = readIni(path.join(ACCOUNT_DIR, account, "账号信息.txt"));
  return ini["账号配置"] || {};
}

function parseRoleTable(account, roleId) {
  const file = path.join(ACCOUNT_DIR, account, String(roleId), "角色.txt");
  const text = readText(file, "gb18030");
  const mapBlock = (text.match(/地图数据\s*=\s*\{([^}]+)\}/) || [])[1] || "";
  const mapFields = parseFields(mapBlock);
  const roleFields = parseFields(text);
  const sect = (text.match(/门派\s*=\s*\{\s*\[1\]\s*=\s*"([^"]+)"/) || [])[1] || "";
  const roleName = textField(roleFields, "名称");
  return {
    id: Number(roleId),
    account,
    name: roleName && roleName !== "无" ? roleName : `${account}-${roleId}`,
    title: textField(roleFields, "当前称谓", "称谓") || "初入江湖",
    gender: textField(roleFields, "性别") || "未知",
    model: textField(roleFields, "造型", "模型") || "剑侠客",
    sect: sect || textField(roleFields, "门派") || "无门派",
    level: numberField(roleFields, 0, "等级"),
    hp: numberField(roleFields, 0, "气血"),
    maxHp: numberField(roleFields, 200, "最大气血"),
    mp: numberField(roleFields, 0, "魔法"),
    maxMp: numberField(roleFields, 160, "最大魔法"),
    attack: numberField(roleFields, 0, "伤害"),
    defense: numberField(roleFields, 0, "防御"),
    speed: numberField(roleFields, 0, "速度"),
    silver: numberField(roleFields, 0, "银子"),
    reserve: numberField(roleFields, 0, "储备"),
    exp: numberField(roleFields, 0, "当前经验", "经验"),
    position: {
      mapId: numberField(mapFields, 1003, "编号"),
      x: numberField(mapFields, 400, "x"),
      y: numberField(mapFields, 420, "y"),
      direction: numberField(mapFields, 0, "方向"),
    },
    inventory: readInventory(account, roleId),
    pets: readPets(account, roleId),
  };
}

function readInventory(account, roleId) {
  const file = path.join(ACCOUNT_DIR, account, String(roleId), "道具.txt");
  const text = readText(file, "gb18030");
  return extractIndexedAssignments(text)
    .map((assignment) => {
      const fields = parseFields(assignment.body);
      return {
        id: Number.isFinite(Number(assignment.index)) ? Number(assignment.index) : assignment.index,
        name: textField(fields, "名称") || `道具 ${assignment.index}`,
        count: numberField(fields, 1, "数量"),
        type: textField(fields, "分类", "总类", "子类") || "物品",
        tradeLocked: boolField(fields, "不可交易", "专用"),
      };
    })
    .slice(0, 120);
}

function readPets(account, roleId) {
  const file = path.join(ACCOUNT_DIR, account, String(roleId), "召唤兽.txt");
  const text = readText(file, "gb18030");
  return extractIndexedAssignments(text)
    .map((assignment) => {
      const fields = parseFields(assignment.body);
      return {
        id: Number.isFinite(Number(assignment.index)) ? Number(assignment.index) : assignment.index,
        name: textField(fields, "名称") || `召唤兽 ${assignment.index}`,
        model: textField(fields, "模型"),
        level: numberField(fields, 0, "等级"),
      };
    })
    .slice(0, 80);
}

function firstRoleId(account) {
  try {
    const roles = fs
      .readdirSync(path.join(ACCOUNT_DIR, account), { withFileTypes: true })
      .filter((entry) => entry.isDirectory() && /^\d+$/.test(entry.name))
      .map((entry) => Number(entry.name))
      .sort((a, b) => a - b);
    return roles[0] || 101;
  } catch {
    return 101;
  }
}

function cleanText(value, fallback, maxLength = 24) {
  const text = String(value || "").trim().replace(/[<>]/g, "");
  return (text || fallback).slice(0, maxLength);
}

function cleanUsername(value) {
  return String(value || "")
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9_\-@.]/gi, "")
    .slice(0, 32);
}

function readUsers() {
  try {
    const db = JSON.parse(fs.readFileSync(USERS_FILE, "utf8"));
    return db && typeof db === "object" && db.users ? db : { users: {} };
  } catch {
    return { users: {} };
  }
}

async function writeUsers(db) {
  await fsp.mkdir(DATA_DIR, { recursive: true });
  await fsp.writeFile(USERS_FILE, JSON.stringify(db, null, 2), "utf8");
}

function hashPassword(password, salt) {
  return crypto.createHash("sha256").update(`${salt}:${password}`).digest("hex");
}

function passwordRecord(password) {
  const salt = crypto.randomBytes(16).toString("hex");
  return { salt, hash: hashPassword(password, salt) };
}

function verifyPassword(user, password) {
  return Boolean(user?.password?.salt && user?.password?.hash === hashPassword(password, user.password.salt));
}

function availableRoleModels() {
  const models = ROLE_MODELS.filter((name) => catalog.roleModelAssets?.has(name) || catalog.models.has(name));
  return models.length ? models : ROLE_MODELS;
}

function normalizeRoleModel(model) {
  const models = availableRoleModels();
  return models.includes(model) ? model : models[0] || "剑侠客";
}

function randomRoleModel() {
  const models = availableRoleModels();
  return models[Math.floor(Math.random() * models.length)] || "剑侠客";
}

function makeRole(account, roleName, model) {
  return {
    id: 1,
    account,
    name: cleanText(roleName, account || "访客", 12),
    title: "初入市集",
    gender: "未设定",
    model: normalizeRoleModel(model),
    sect: "无门派",
    level: 1,
    hp: 200,
    maxHp: 200,
    mp: 160,
    maxMp: 160,
    attack: 20,
    defense: 20,
    speed: 220,
    silver: 0,
    reserve: 0,
    exp: 0,
    position: { ...DEFAULT_SPAWN },
    inventory: [],
    pets: [],
  };
}

async function persistUserRole(session) {
  const account = session.role?.account;
  if (!account || account === "guest") return;
  const db = readUsers();
  const user = db.users[account];
  if (!user) return;
  user.role = {
    ...session.role,
    position: { mapId: CHANGAN_MAP_ID, x: session.x, y: session.y, direction: session.role.position?.direction || 0 },
  };
  user.updatedAt = new Date().toISOString();
  await writeUsers(db);
}

function createSession(role) {
  const token = `${Date.now().toString(36)}${Math.random().toString(36).slice(2)}`;
  const position = { ...DEFAULT_SPAWN, ...(role.position || {}), mapId: CHANGAN_MAP_ID };
  const sessionRole = { ...role, position };
  sessions.set(token, {
    role: sessionRole,
    mapId: CHANGAN_MAP_ID,
    x: position.x,
    y: position.y,
    logs: ["进入 天元市集"],
  });
  return token;
}

function requireSession(req) {
  const token = req.headers["x-session-token"];
  return token && sessions.has(token) ? sessions.get(token) : null;
}

async function persistSession(account, session) {
  await fsp.mkdir(DATA_DIR, { recursive: true });
  await fsp.writeFile(
    path.join(DATA_DIR, `${account}.session.json`),
    JSON.stringify(
      {
        account,
        roleId: session.role.id,
        mapId: session.mapId,
        x: session.x,
        y: session.y,
        savedAt: new Date().toISOString(),
      },
      null,
      2
    ),
    "utf8"
  );
}

function paginate(items, query, page = 1, pageSize = 80) {
  const q = String(query || "").trim().toLowerCase();
  const filtered = q
    ? items.filter((item) => JSON.stringify(item).toLowerCase().includes(q))
    : items;
  const safePageSize = Math.max(1, Math.min(300, Number(pageSize) || 80));
  const safePage = Math.max(1, Number(page) || 1);
  const start = (safePage - 1) * safePageSize;
  return {
    page: safePage,
    pageSize: safePageSize,
    total: filtered.length,
    items: filtered.slice(start, start + safePageSize),
  };
}

function toPosix(relativePath) {
  return relativePath.split(path.sep).join("/");
}

function publicUrl(...parts) {
  return `/${parts.map((part) => encodeURIComponent(String(part))).join("/")}`;
}

function generatedName(value) {
  return String(value || "asset")
    .replace(/\.[^.]+$/, "")
    .replace(/[^a-z0-9_-]+/gi, "_")
    .replace(/_+/g, "_")
    .replace(/^_+|_+$/g, "")
    .slice(0, 120) || "asset";
}

async function readJsonFile(file) {
  return JSON.parse(await fsp.readFile(file, "utf8"));
}

function runOnce(key, task) {
  if (renderJobs.has(key)) return renderJobs.get(key);
  const job = task().finally(() => renderJobs.delete(key));
  renderJobs.set(key, job);
  return job;
}

function runExporter(args, timeoutMs = 120000) {
  return new Promise((resolve, reject) => {
    const child = spawn(LUA_EXE, [EXPORT_SCRIPT, ...args], {
      cwd: SOURCE_ROOT,
      windowsHide: true,
    });
    let stdout = "";
    let stderr = "";
    const timer = setTimeout(() => {
      child.kill();
      reject(new Error(`资源导出超时: ${args.join(" ")}`));
    }, timeoutMs);
    child.stdout.on("data", (chunk) => {
      stdout += chunk.toString("utf8");
    });
    child.stderr.on("data", (chunk) => {
      stderr += chunk.toString("utf8");
    });
    child.once("error", (error) => {
      clearTimeout(timer);
      reject(error);
    });
    child.once("close", (code) => {
      clearTimeout(timer);
      if (code === 0) {
        resolve(stdout.trim());
        return;
      }
      reject(new Error((stderr || stdout || `资源导出失败，退出码 ${code}`).trim()));
    });
  });
}

async function ensureSceneRender(scene) {
  const rawAsset = scene.map.rawAsset;
  if (!rawAsset) return null;
  const baseMapId = scene.map.baseMapId || scene.map.id;
  const dir = path.join(GENERATED_DIR, "scenes", String(baseMapId));
  const manifestFile = path.join(dir, "manifest.json");
  if (STATIC_RUNTIME) {
    const manifest = await readJsonFile(manifestFile);
    if (!manifest?.tiles?.length) {
      throw new Error(`静态部署缺少场景预编译资源：${baseMapId}`);
    }
    return {
      manifestUrl: publicUrl("generated", "scenes", baseMapId, "manifest.json"),
      ...manifest,
    };
  }
  const sourceFile = path.join(ASSETS_DIR, rawAsset.relativePath);
  const key = `scene:${baseMapId}`;
  await runOnce(key, async () => {
    let needsExport = true;
    try {
      const [manifestStat, sourceStat] = await Promise.all([fsp.stat(manifestFile), fsp.stat(sourceFile)]);
      needsExport = manifestStat.mtimeMs < sourceStat.mtimeMs;
      if (!needsExport) {
        const existingManifest = await readJsonFile(manifestFile);
        needsExport = !existingManifest?.collision?.data;
      }
    } catch {
      needsExport = true;
    }
    if (!needsExport) return;
    await fsp.mkdir(dir, { recursive: true });
    await runExporter([
      "scene",
      String(baseMapId),
      toPosix(path.relative(SOURCE_ROOT, dir)),
      publicUrl("generated", "scenes", baseMapId),
    ], 180000);
  });
  return {
    manifestUrl: publicUrl("generated", "scenes", baseMapId, "manifest.json"),
    ...(await readJsonFile(manifestFile)),
  };
}

function pickNpcWas(npc) {
  const assets = npc.modelAsset?.assets;
  if (!assets) return null;
  return assets["站立"] || assets["行走"] || assets["静立"] || Object.values(assets).find((asset) => asset.ext === "was") || null;
}

async function ensureWasRender(asset) {
  if (!asset || asset.ext !== "was") return null;
  const name = generatedName(asset.relativePath);
  const dir = path.join(GENERATED_DIR, "was", name);
  const manifestFile = path.join(dir, "manifest.json");
  if (STATIC_RUNTIME) {
    const manifest = await readJsonFile(manifestFile).catch(() => null);
    if (!manifest?.frames?.length) return null;
    return {
      manifestUrl: publicUrl("generated", "was", name, "manifest.json"),
      ...manifest,
    };
  }
  const sourceFile = path.join(ASSETS_DIR, asset.relativePath);
  const key = `was:${asset.relativePath}`;
  await runOnce(key, async () => {
    let needsExport = true;
    try {
      const [manifestStat, sourceStat] = await Promise.all([fsp.stat(manifestFile), fsp.stat(sourceFile)]);
      needsExport = manifestStat.mtimeMs < sourceStat.mtimeMs;
    } catch {
      needsExport = true;
    }
    if (!needsExport) return;
    await fsp.mkdir(dir, { recursive: true });
    await runExporter([
      "was",
      asset.relativePath,
      toPosix(path.relative(SOURCE_ROOT, dir)),
      publicUrl("generated", "was", name),
    ], 60000);
  });
  return {
    manifestUrl: publicUrl("generated", "was", name, "manifest.json"),
    ...(await readJsonFile(manifestFile)),
  };
}

async function renderPayload(mapId) {
  const scene = scenePayload(mapId);
  const renderedScene = await ensureSceneRender(scene);
  const uniqueWas = new Map();
  for (const npc of scene.npcs) {
    const asset = pickNpcWas(npc);
    if (asset) uniqueWas.set(asset.relativePath, asset);
  }

  const wasManifests = new Map();
  for (const [relativePath, asset] of uniqueWas.entries()) {
    wasManifests.set(relativePath, await ensureWasRender(asset));
  }

  const npcSprites = {};
  for (const npc of scene.npcs) {
    const asset = pickNpcWas(npc);
    if (!asset) continue;
    const manifest = wasManifests.get(asset.relativePath);
    if (!manifest) continue;
    npcSprites[npc.id] = {
      source: asset.relativePath,
      direction: Number(npc.direction || 0),
      manifest,
    };
  }

  return {
    ok: true,
    mapId: scene.map.id,
    baseMapId: scene.map.baseMapId,
    scene: renderedScene,
    npcSprites,
    decoded: {
      scene: Boolean(renderedScene),
      npcSpriteFiles: wasManifests.size,
    },
  };
}

function pickModelWas(modelName, preferredAction) {
  const roleAssets = catalog.roleModelAssets?.get(modelName);
  if (roleAssets) {
    if (String(preferredAction).includes("行走")) return roleAssets.walk || roleAssets.stand || null;
    return roleAssets.stand || roleAssets.walk || null;
  }
  const model = catalog.models.get(modelName);
  const assets = model?.assets || {};
  const entries = Object.entries(assets).filter(([, asset]) => asset?.ext === "was");
  const byAction = (needle) => entries.find(([key]) => key.includes(needle))?.[1] || null;
  return byAction(preferredAction) || byAction("行走") || byAction("站立") || entries[0]?.[1] || null;
}

async function modelRenderPayload(modelName) {
  const model = normalizeRoleModel(modelName);
  const standAsset = pickModelWas(model, "站立");
  const walkAsset = pickModelWas(model, "行走") || standAsset;
  const stand = await ensureWasRender(standAsset);
  const walk = walkAsset?.relativePath === standAsset?.relativePath ? stand : await ensureWasRender(walkAsset);
  return {
    ok: true,
    model,
    sprites: {
      stand: stand ? { source: standAsset.relativePath, manifest: stand } : null,
      walk: walk ? { source: walkAsset.relativePath, manifest: walk } : null,
    },
  };
}

async function precompileRuntimeAssets() {
  const scene = await renderPayload(CHANGAN_MAP_ID);
  const roleModels = availableRoleModels();
  const roles = [];
  for (const model of roleModels) {
    roles.push(await modelRenderPayload(model));
  }
  await fsp.mkdir(GENERATED_DIR, { recursive: true });
  await fsp.writeFile(
    path.join(GENERATED_DIR, "runtime-ready.json"),
    JSON.stringify(
      {
        ok: true,
        generatedAt: new Date().toISOString(),
        mapId: CHANGAN_MAP_ID,
        scene: {
          tiles: scene.scene?.tiles?.length || 0,
          masks: scene.scene?.masks?.length || 0,
          npcSpriteFiles: scene.decoded.npcSpriteFiles,
        },
        roles: roles.map((item) => ({
          model: item.model,
          standFrames: item.sprites.stand?.manifest?.frames?.length || 0,
          walkFrames: item.sprites.walk?.manifest?.frames?.length || 0,
        })),
      },
      null,
      2
    ),
    "utf8"
  );
  return { scene, roles };
}

async function handleApi(req, res, url) {
  if (url.pathname === "/api/preload/status" && req.method === "GET") {
    if (staticPreload.enabled && !staticPreload.running && !staticPreload.ready) {
      preloadStaticResources().catch((error) => {
        staticPreload.error = error.message;
        staticPreload.running = false;
      });
    }
    json(res, 200, staticPreloadPayload());
    return;
  }

  if (url.pathname === "/api/bootstrap" && req.method === "GET") {
    json(res, 200, {
      title: "天元市集",
      version: "web-light-tiany-1.0.0",
      source: {
        projectRoot: PROJECT_ROOT,
        assetsRoot: ASSETS_DIR,
        luaDataRoot: LUA_DATA_DIR,
        legacyClientRequired: false,
      },
      defaultMapId: CHANGAN_MAP_ID,
      roleModels: availableRoleModels(),
      stats: catalog.stats,
      maps: catalog.maps.map(({ rawAsset, ...map }) => map),
      generatedAt: catalog.createdAt,
    });
    return;
  }

  if (url.pathname === "/api/catalog/reload" && req.method === "POST") {
    catalog = buildCatalog();
    json(res, 200, { ok: true, stats: catalog.stats, generatedAt: catalog.createdAt });
    return;
  }

  if (url.pathname === "/api/assets" && req.method === "GET") {
    json(
      res,
      200,
      paginate(
        catalog.assetIndex.files,
        url.searchParams.get("q"),
        url.searchParams.get("page"),
        url.searchParams.get("pageSize")
      )
    );
    return;
  }

  if (url.pathname === "/api/data-files" && req.method === "GET") {
    json(res, 200, { files: catalog.dataFiles });
    return;
  }

  if (url.pathname === "/api/search" && req.method === "GET") {
    const query = String(url.searchParams.get("q") || "").trim().toLowerCase();
    const mapMatches = query
      ? catalog.maps.filter((map) => `${map.id} ${map.name}`.toLowerCase().includes(query)).slice(0, 60)
      : catalog.maps.slice(0, 60);
    const npcMatches = [];
    if (query) {
      for (const [mapId, npcs] of catalog.npcCatalog.byMap.entries()) {
        for (const npc of npcs) {
          if (`${npc.name} ${npc.title} ${npc.model} ${mapId}`.toLowerCase().includes(query)) {
            npcMatches.push({ ...npc, mapName: catalog.mapsById.get(mapId)?.name || `地图 ${mapId}` });
            if (npcMatches.length >= 80) break;
          }
        }
        if (npcMatches.length >= 80) break;
      }
    }
    json(res, 200, { maps: mapMatches, npcs: npcMatches });
    return;
  }

  const renderSceneMatch = url.pathname.match(/^\/api\/render\/scene\/(\d+)$/);
  if (renderSceneMatch && req.method === "GET") {
    json(res, 200, await renderPayload(Number(renderSceneMatch[1])));
    return;
  }

  if (url.pathname === "/api/render/model" && req.method === "GET") {
    json(res, 200, await modelRenderPayload(String(url.searchParams.get("model") || "")));
    return;
  }

  const sceneMatch = url.pathname.match(/^\/api\/scene\/(\d+)$/);
  if (sceneMatch && req.method === "GET") {
    json(res, 200, { ok: true, ...scenePayload(Number(sceneMatch[1])) });
    return;
  }

  if ((url.pathname === "/api/auth/enter" || url.pathname === "/api/auth/login") && req.method === "POST") {
    const body = await parseJsonBody(req);
    const username = cleanUsername(body.username);
    const password = String(body.password || "");
    if (!username || password.length < 3) {
      json(res, 400, { ok: false, message: "请输入账号和至少 3 位密码" });
      return;
    }

    const db = readUsers();
    let user = db.users[username];
    let changed = false;
    if (user) {
      if (!verifyPassword(user, password)) {
        json(res, 401, { ok: false, message: "账号或密码不正确" });
        return;
      }
    } else {
      user = {
        username,
        password: passwordRecord(password),
        createdAt: new Date().toISOString(),
        role: null,
      };
      db.users[username] = user;
      changed = true;
    }

    if (!user.role) {
      user.role = makeRole(username, body.roleName || username, body.model);
      changed = true;
    }

    if (changed) await writeUsers(db);
    const token = createSession(user.role);
    const session = sessions.get(token);
    json(res, 200, {
      ok: true,
      token,
      role: session.role,
      world: scenePayload(CHANGAN_MAP_ID),
      logs: session.logs,
      created: changed,
      singleRole: true,
    });
    return;
  }

  if (url.pathname === "/api/auth/guest" && req.method === "POST") {
    const body = await parseJsonBody(req);
    const suffix = Math.random().toString(36).slice(2, 6).toUpperCase();
    const role = makeRole("guest", body.roleName || `访客${suffix}`, randomRoleModel());
    role.id = 0;
    role.title = "访客模式";
    const token = createSession(role);
    json(res, 200, { ok: true, token, role: sessions.get(token).role, world: scenePayload(CHANGAN_MAP_ID), logs: sessions.get(token).logs });
    return;
  }

  if (url.pathname === "/api/world" && req.method === "GET") {
    const session = requireSession(req);
    if (!session) {
      json(res, 401, { ok: false, message: "未登录" });
      return;
    }
    json(res, 200, {
      ok: true,
      role: { ...session.role, position: { mapId: session.mapId, x: session.x, y: session.y, direction: session.role.position?.direction || 0 } },
      ...scenePayload(session.mapId),
      logs: session.logs,
    });
    return;
  }

  if (url.pathname === "/api/player/move" && req.method === "POST") {
    const session = requireSession(req);
    if (!session) {
      json(res, 401, { ok: false, message: "未登录" });
      return;
    }
    const body = await parseJsonBody(req);
    const scene = scenePayload(Number(body.mapId || session.mapId));
    session.mapId = scene.map.id;
    session.x = Math.max(0, Math.min(scene.map.bounds.width, Number(body.x || session.x)));
    session.y = Math.max(0, Math.min(scene.map.bounds.height, Number(body.y || session.y)));
    session.role.position.direction = Number(body.direction ?? session.role.position?.direction ?? 0);
    session.logs.unshift(`移动到 ${scene.map.name} (${Math.round(session.x / 20)}, ${Math.round(session.y / 20)})`);
    session.logs = session.logs.slice(0, 50);
    session.role.position = { mapId: session.mapId, x: session.x, y: session.y, direction: session.role.position?.direction || 0 };
    if (session.role.account !== "guest") await persistUserRole(session);
    json(res, 200, {
      ok: true,
      position: { mapId: session.mapId, x: session.x, y: session.y, direction: session.role.position.direction || 0 },
      logs: session.logs,
    });
    return;
  }

  if (url.pathname === "/api/npc/talk" && req.method === "POST") {
    const session = requireSession(req);
    if (!session) {
      json(res, 401, { ok: false, message: "未登录" });
      return;
    }
    const body = await parseJsonBody(req);
    const mapId = CHANGAN_MAP_ID;
    const npc = (catalog.npcCatalog.byMap.get(mapId) || []).find((item) => String(item.id) === String(body.id));
    if (!npc) {
      json(res, 404, { ok: false, message: "NPC不存在" });
      return;
    }
    session.logs.unshift(`对话 ${npc.name}`);
    session.logs = session.logs.slice(0, 50);
    json(res, 200, {
      ok: true,
      npc,
      dialog: {
        speaker: npc.name,
        text: `${npc.name}｜${npc.title || npc.model || "场景NPC"}｜事件：${npc.event || "不执行"}`,
        options: ["查看模型", "定位", "离开"],
      },
      logs: session.logs,
    });
    return;
  }

  if (url.pathname === "/api/player/save" && req.method === "POST") {
    const session = requireSession(req);
    if (!session) {
      json(res, 401, { ok: false, message: "未登录" });
      return;
    }
    if (session.role.account !== "guest") await persistUserRole(session);
    json(res, 200, { ok: true, message: "Web存档已保存" });
    return;
  }

  json(res, 404, { ok: false, message: "API not found" });
}

function isInside(root, target) {
  const relative = path.relative(root, target);
  return relative === "" || (!relative.startsWith("..") && !path.isAbsolute(relative));
}

async function warmFile(file) {
  await new Promise((resolve, reject) => {
    const stream = fs.createReadStream(file, { highWaterMark: 1024 * 1024 });
    stream.on("data", () => {});
    stream.on("error", reject);
    stream.on("end", resolve);
  });
}

function criticalSceneUrls() {
  const manifestFile = path.join(GENERATED_DIR, "scenes", String(CHANGAN_MAP_ID), "manifest.json");
  const manifest = JSON.parse(readText(manifestFile) || "{}");
  const tiles = manifest.tiles || [];
  const masks = manifest.masks || [];
  const spawn = DEFAULT_SPAWN;
  const rect = {
    left: spawn.x - 760,
    right: spawn.x + 760,
    top: spawn.y - 560,
    bottom: spawn.y + 560,
  };
  const visible = (item) => !(item.x > rect.right || item.y > rect.bottom || item.x + item.width < rect.left || item.y + item.height < rect.top);
  return [...tiles.filter(visible), ...masks.filter(visible)].map((item) => item.url).filter(Boolean);
}

async function preloadStaticResources() {
  if (!staticPreload.enabled || staticPreload.running || staticPreload.ready) return;
  staticPreload.running = true;
  staticPreload.startedAt = new Date().toISOString();
  staticPreload.error = "";
  try {
    staticPreload.criticalUrls = criticalSceneUrls();
    const files = listExistingFiles([
      path.join(GENERATED_DIR, "scenes", String(CHANGAN_MAP_ID)),
      path.join(GENERATED_DIR, "was"),
      path.join(PUBLIC_DIR, "assets", "audio"),
      path.join(PUBLIC_DIR, "assets", "home"),
      path.join(PUBLIC_DIR, "assets", "fonts"),
    ]);
    const stats = files.map((file) => {
      try {
        return { file, size: fs.statSync(file).size };
      } catch {
        return null;
      }
    }).filter(Boolean);
    staticPreload.totalFiles = stats.length;
    staticPreload.totalBytes = stats.reduce((sum, item) => sum + item.size, 0);
    for (const item of stats) {
      await warmFile(item.file);
      staticPreload.loadedFiles += 1;
      staticPreload.loadedBytes += item.size;
    }
    staticPreload.ready = true;
    staticPreload.completedAt = new Date().toISOString();
  } catch (error) {
    staticPreload.error = error.message;
  } finally {
    staticPreload.running = false;
  }
}

function staticPreloadPayload() {
  const progress = staticPreload.totalBytes
    ? Math.round((staticPreload.loadedBytes / staticPreload.totalBytes) * 100)
    : staticPreload.ready
    ? 100
    : 0;
  return {
    enabled: staticPreload.enabled,
    ready: staticPreload.ready,
    running: staticPreload.running,
    progress,
    totalFiles: staticPreload.totalFiles,
    loadedFiles: staticPreload.loadedFiles,
    totalBytes: staticPreload.totalBytes,
    loadedBytes: staticPreload.loadedBytes,
    criticalUrls: staticPreload.criticalUrls,
    startedAt: staticPreload.startedAt,
    completedAt: staticPreload.completedAt,
    error: staticPreload.error,
  };
}

async function serveFile(req, res, root, relativePath, cacheControl = "no-cache") {
  const target = path.normalize(path.join(root, relativePath));
  if (!isInside(root, target)) {
    res.writeHead(403, { "Content-Type": "text/plain; charset=utf-8" });
    res.end("Forbidden");
    return;
  }
  try {
    const stat = await fsp.stat(target);
    if (!stat.isFile()) throw new Error("not file");
    const ext = path.extname(target).toLowerCase();
    res.writeHead(200, {
      "Content-Type": MIME[ext] || "application/octet-stream",
      "Content-Length": stat.size,
      "Cache-Control": cacheControl,
    });
    if (req.method === "HEAD") {
      res.end();
      return;
    }
    fs.createReadStream(target).pipe(res);
  } catch {
    res.writeHead(404, { "Content-Type": "text/plain; charset=utf-8" });
    res.end("Not found");
  }
}

async function serveStatic(req, res, url) {
  if (url.pathname.startsWith("/source-assets/")) {
    const relative = decodeURIComponent(url.pathname.slice("/source-assets/".length));
    await serveFile(req, res, ASSETS_DIR, relative, "public, max-age=31536000, immutable");
    return;
  }
  const relative = url.pathname === "/" ? "index.html" : decodeURIComponent(url.pathname.slice(1));
  const publicRelative = toPosixPath(relative);
  const immutable =
    publicRelative.startsWith("generated/") ||
    publicRelative.startsWith("assets/audio/") ||
    publicRelative.startsWith("assets/home/") ||
    publicRelative.startsWith("assets/fonts/");
  const cacheControl = immutable ? "public, max-age=31536000, immutable" : "no-cache";
  await serveFile(req, res, PUBLIC_DIR, relative, cacheControl);
}

function createServer() {
  return http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, "http://127.0.0.1");
      if (url.pathname.startsWith("/api/")) {
        await handleApi(req, res, url);
        return;
      }
      await serveStatic(req, res, url);
    } catch (error) {
      json(res, 500, { ok: false, message: error.message });
    }
  });
}

function listen(port) {
  const host = process.env.HOST || "0.0.0.0";
  const server = createServer();
  server.once("error", (error) => {
    if (error.code === "EADDRINUSE" && port < 8100) {
      listen(port + 1);
      return;
    }
    console.error(error);
    process.exit(1);
  });
  server.listen(port, host, () => {
    console.log(`Tiany Web game is running at http://127.0.0.1:${port}`);
    console.log(`Loaded ${catalog.stats.maps} maps, ${catalog.stats.npcs} NPCs, ${catalog.stats.assets} assets.`);
  });
}

async function start() {
  if (process.env.PRECOMPILE !== "0") {
    console.log("Precompiling Tiany runtime assets...");
    const ready = await precompileRuntimeAssets();
    console.log(
      `Runtime ready: ${ready.scene.scene?.tiles?.length || 0} tiles, ` +
        `${ready.scene.scene?.masks?.length || 0} masks, ${ready.roles.length} role models.`
    );
  }
  if (process.argv.includes("--precompile-only")) return;
  listen(Number(process.env.PORT || 8080));
  preloadStaticResources().catch((error) => {
    staticPreload.error = error.message;
    staticPreload.running = false;
  });
}

start().catch((error) => {
  console.error(error);
  process.exit(1);
});
