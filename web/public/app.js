const sceneCanvas = document.querySelector("#sceneCanvas");
const canvas = document.querySelector("#gameCanvas");
const maskCanvas = document.querySelector("#maskCanvas");
const gpuBaseLayer = createGpuTileRenderer(sceneCanvas, { alpha: false, clearColor: [5 / 255, 7 / 255, 6 / 255, 1] });
const ctx = canvas.getContext("2d", { alpha: true });
const gpuMaskLayer = createGpuTileRenderer(maskCanvas, { alpha: true, clearColor: [0, 0, 0, 0] });

const els = {
  entry: document.querySelector("#entryScreen"),
  game: document.querySelector("#gameScreen"),
  authForm: document.querySelector("#authForm"),
  username: document.querySelector("#usernameInput"),
  password: document.querySelector("#passwordInput"),
  roleName: document.querySelector("#roleNameInput"),
  model: document.querySelector("#modelSelect"),
  loginOpenButton: document.querySelector("#loginOpenButton"),
  homeAudioButton: document.querySelector("#homeAudioButton"),
  accountButton: document.querySelector("#accountButton"),
  guestButton: document.querySelector("#guestButton"),
  entryStatus: document.querySelector("#entryStatus"),
  entryStatuses: document.querySelectorAll("[data-entry-status]"),
  entryStatusTexts: document.querySelectorAll("[data-entry-status-text]"),
  entryStatusDetails: document.querySelectorAll("[data-entry-status-detail]"),
  entryStatusPercents: document.querySelectorAll("[data-entry-status-percent]"),
  entryStatusBars: document.querySelectorAll("[data-entry-status-bar]"),
  marketHud: document.querySelector("#marketHud"),
  marketCoins: document.querySelector("#marketCoins"),
  marketGoal: document.querySelector("#marketGoal"),
  moodMeter: document.querySelector("#moodMeter"),
  moodMeterText: document.querySelector("#moodMeterText"),
  moodMeterBar: document.querySelector("#moodMeterBar"),
  marketProgress: document.querySelector("#marketProgress"),
  marketProgressTrade: document.querySelector("#marketProgressTrade"),
  marketProgressAreas: document.querySelector("#marketProgressAreas"),
  marketProgressCodex: document.querySelector("#marketProgressCodex"),
  marketProgressStall: document.querySelector("#marketProgressStall"),
  directorPanel: document.querySelector("#directorPanel"),
  marketGuideButton: document.querySelector("#marketGuideButton"),
  audioToggleButton: document.querySelector("#audioToggleButton"),
  marketExchangeButton: document.querySelector("#marketExchangeButton"),
  marketDailyButton: document.querySelector("#marketDailyButton"),
  marketCodexButton: document.querySelector("#marketCodexButton"),
  marketLedgerButton: document.querySelector("#marketLedgerButton"),
  marketAreaButton: document.querySelector("#marketAreaButton"),
  marketStallButton: document.querySelector("#marketStallButton"),
  mapControls: document.querySelector("#mapControls"),
  mapZoomInButton: document.querySelector("#mapZoomInButton"),
  mapZoomOutButton: document.querySelector("#mapZoomOutButton"),
  mapCenterButton: document.querySelector("#mapCenterButton"),
  mapPanUpButton: document.querySelector("#mapPanUpButton"),
  mapPanDownButton: document.querySelector("#mapPanDownButton"),
  mapPanLeftButton: document.querySelector("#mapPanLeftButton"),
  mapPanRightButton: document.querySelector("#mapPanRightButton"),
  newbieHudButton: document.querySelector("#newbieHudButton"),
  newbieGuide: document.querySelector("#newbieGuide"),
  newbieGuideTitle: document.querySelector("#newbieGuideTitle"),
  newbieGuideText: document.querySelector("#newbieGuideText"),
  newbieFocusButton: document.querySelector("#newbieFocusButton"),
  newbieCloseButton: document.querySelector("#newbieCloseButton"),
  marketPanel: document.querySelector("#marketPanel"),
  marketPanelBody: document.querySelector("#marketPanelBody"),
  marketCloseButton: document.querySelector("#marketCloseButton"),
  effectLayer: document.querySelector("#effectLayer"),
  manualOpenButton: document.querySelector("#manualOpenButton"),
  gameManualPanel: document.querySelector("#gameManualPanel"),
  gameManualClose: document.querySelector("#gameManualClose"),
  dialog: document.querySelector("#dialogBox"),
  dialogSpeaker: document.querySelector("#dialogSpeaker"),
  dialogSubtitle: document.querySelector("#dialogSubtitle"),
  dialogText: document.querySelector("#dialogText"),
  dialogOptions: document.querySelector("#dialogOptions"),
  dialogPortrait: document.querySelector("#dialogPortrait"),
  dialogPortraitImage: document.querySelector("#dialogPortraitImage"),
  dialogPortraitFallback: document.querySelector("#dialogPortraitFallback"),
  dialogCloseButton: document.querySelector("#dialogCloseButton"),
};

const MAP_ID = 1001;
const TILE_SCALE = 20;
const CHUNK_WIDTH = 768;
const CHUNK_HEIGHT = 768;
const IMAGE_CONCURRENCY = 48;
const ROLE_CONCURRENCY = 4;
const FULL_LAYER_MAX_PIXELS = 90000000;
const USE_FULL_LAYER = false;
const MAX_DEVICE_PIXEL_RATIO = 1;
const STATIC_LAYER_DPR = 1;
const STATIC_DRAW_PAD = 96;
const DRAG_DRAW_PAD = 24;
const PAN_CACHE_MARGIN = 720;
const PAN_CACHE_MIN_MARGIN = 280;
const SIMULATION_STEP = 1 / 120;
const MAX_SIMULATION_STEPS = 8;
const MAX_RENDER_DELTA = 1 / 30;
const MOVE_MAX_SPEED = 330;
const MOVE_ACCELERATION = 1050;
const MOVE_DECELERATION = 1500;
const MOVE_ARRIVE_DISTANCE = 3.5;
const MOVE_WAYPOINT_ADVANCE = 30;
const MOVE_CORNER_LOOKAHEAD = 58;
const ROLE_RENDER_SMOOTHING = 24;
const CAMERA_SMOOTH_TIME = 0.12;
const CAMERA_MAX_SPEED = 2600;
const CAMERA_MANUAL_HOLD_MS = 650;
const CAMERA_MAX_DELTA = 1 / 45;
const CAMERA_SNAP_MIN_STEP = 1 / 6;
const MAP_ZOOM_MIN = 0.45;
const MAP_ZOOM_MAX = 2.2;
const MAP_ZOOM_STEP = 0.12;
const MAP_CONTROL_PAN_STEP = 210;
const CLICK_IMPULSE_SPEED = 190;
const PATH_PREVIEW_STEP = 18;
const MAIN_THREAD_PATH_MAX_DISTANCE = 1200;
const MAIN_THREAD_PATH_MAX_VISITED = 9000;
const PATH_WORKER_TIMEOUT_MS = 1600;
const LABEL_FONT = "600 12px Microsoft YaHei, PingFang SC, sans-serif";
const WORLD_FX_LIMIT = 72;
const TOAST_LIMIT = 4;
const MUSIC_SCALE = [196, 220, 247, 294, 330, 392, 440];
const MUSIC_NOTE_MS = 820;
const APP_VERSION = "heart-market-20260502m";
const FAST_BOOT_HOSTS = new Set(["luoluo.twofishai.com", "tiany-heart-market.onrender.com"]);
const CLOUD_FAST_BOOT = FAST_BOOT_HOSTS.has(window.location.hostname);
const BGM_URL = `/assets/audio/wuxia2-guzheng-pipa.mp3?v=${APP_VERSION}`;
const DIALOGUE_BGM_URL = `/assets/audio/shizima3-dialogue.mp3?v=${APP_VERSION}`;
const HOME_MUSIC_VOLUME = 0.055;
const HOME_TRANSITION_VOLUME = 0.032;
const MARKET_MUSIC_VOLUME = 0.115;
const MARKET_AUTOPLAY_VOLUME = 0.09;
const DIALOGUE_MUSIC_VOLUME = 0.105;
const CITY_NAME = "\u5929\u5143\u5e02\u96c6";
const TEXT = {
  loadingCity: "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
  loadingScene: "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
  loadingSceneProgress: () => "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
  loadingSceneDetail: () => "",
  composingMap: "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
  composingMapProgress: () => "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
  composingMapDetail: () => "",
  loadingRoles: "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
  loadingRolesProgress: () => "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
  loadingRolesDetail: () => "",
  runtimeReady: () => "\u5fc3\u5e02\u5df2\u5f00\uff0c\u53ef\u4ee5\u5165\u5e02\u3002",
  runtimeReadyDetail: "",
  enteringCity: `\u6b63\u5728\u8fdb\u5165${CITY_NAME}...`,
  enteredCity: (name) => `${name} \u5df2\u8fdb\u5165${CITY_NAME}`,
  creatingGuest: "\u6b63\u5728\u8fdb\u5165\u8bbf\u5ba2\u6a21\u5f0f...",
  accountEnter: "\u6b63\u5728\u786e\u8ba4\u8eab\u4efd...",
  loadingVisibleScene: "\u6b63\u5728\u94fa\u5f00\u957f\u5b89\u5e02\u96c6\u2026",
  bootstrap: () => "\u5fc3\u5e02\u5f00\u5e02\u4e2d\u2026",
};
const DIRECTION_GROUPS = [7, 0, 4, 1, 5, 2, 6, 3];
const PATH_MAX_VISITED = 45000;
const COLLISION_SAMPLES = [
  { x: 0, y: 0 },
  { x: -7, y: 0 },
  { x: 7, y: 0 },
  { x: 0, y: -5 },
  { x: 0, y: 5 },
];

const CORE_MARKET_PROFILES = [
  {
    key: "comfort",
    name: "温烛娘",
    title: "温烛解忧铺",
    area: "问心巷",
    personality: "温柔、慢声、像夜灯",
    line: "心事若太重，就先放在灯下烤一烤。",
    sells: [{ item: "安心香", price: 9, note: "买入后今日心境更安稳。" }],
    buys: [{ item: "犹豫", price: 8, note: "她愿意收下你暂时放不下的迟疑。" }, { item: "疲惫", price: 8, note: "她把疲惫收进灯芯，替你换回一点暖意。" }],
    tags: ["解忧", "安慰", "问心巷"],
    recommends: ["clarity"],
  },
  {
    key: "clarity",
    name: "折枝客",
    title: "折枝清醒摊",
    area: "清醒街",
    personality: "毒舌、利落、嘴硬心软",
    line: "枝条烂了就剪，别等整棵树疼。",
    sells: [{ item: "清醒令", price: 12, note: "一枚能让人立刻做决定的冷令牌。" }],
    buys: [{ item: "拖延", price: 10, note: "他收拖延，但会顺手骂醒你。" }],
    tags: ["毒舌", "决断", "清醒街"],
    recommends: ["fortune"],
  },
  {
    key: "fortune",
    name: "青云先生",
    title: "青云签台",
    area: "签云台",
    personality: "克制、神秘、半真半玩笑",
    line: "签不替你走路，只替你点灯。",
    sells: [{ item: "今日签", price: 5, note: "抽一支今日心签，可花钱重测。" }],
    buys: [{ item: "迷茫", price: 7, note: "迷茫越浓，签文越亮。" }],
    tags: ["玄学", "签文", "命数"],
    recommends: ["inspire"],
  },
  {
    key: "inspire",
    name: "梨火",
    title: "梨火灵感坊",
    area: "灵感坊",
    personality: "跳脱、灵动、脑洞多",
    line: "别急，脑子不是空了，是火还没点着。",
    sells: [{ item: "灵感笺", price: 11, note: "随机得到一句古风灵感提示。" }],
    buys: [{ item: "卡壳", price: 9, note: "她把空白烧成火星。" }],
    tags: ["灵感", "创作", "脑洞"],
    recommends: ["network"],
  },
  {
    key: "network",
    name: "桥三娘",
    title: "人情桥",
    area: "人情桥",
    personality: "市井、八面玲珑、消息灵",
    line: "天元城没有陌生人，只有没递到的话。",
    sells: [{ item: "人情帖", price: 6, note: "获得一次核心摊主引荐。" }],
    buys: [{ item: "故事", price: 8, note: "她最爱收新鲜见闻。" }],
    tags: ["人情", "引荐", "消息"],
    recommends: ["fame"],
  },
  {
    key: "fame",
    name: "名录官",
    title: "名望楼",
    area: "名望楼",
    personality: "严谨、爱记录、礼制感强",
    line: "凡入市者，皆有一页可记。",
    sells: [{ item: "名望印", price: 10, note: "用于兑换称号与图鉴奖励。" }],
    buys: [{ item: "交易凭证", price: 6, note: "每一笔买卖都能入册。" }],
    tags: ["图鉴", "称号", "名望"],
    recommends: ["memory"],
  },
  {
    key: "memory",
    name: "旧梦伯",
    title: "旧梦仓",
    area: "旧梦仓",
    personality: "怀旧、慢、讲故事",
    line: "旧事不值钱，除非你还记得它。",
    sells: [{ item: "旧梦匣", price: 8, note: "装着一段可交换的回忆。" }],
    buys: [{ item: "想念", price: 9, note: "他把想念收进旧木匣。" }, { item: "疲惫", price: 8, note: "他把走不完的疲惫收进旧梦仓，让你先歇一程。" }],
    tags: ["回忆", "故事", "旧梦"],
    recommends: ["repair"],
  },
  {
    key: "repair",
    name: "和笺娘子",
    title: "和笺铺",
    area: "和笺铺",
    personality: "温和但有边界",
    line: "有些话说轻了没用，说重了伤人。",
    sells: [{ item: "和解书", price: 10, note: "得到一句关系修复话术。" }],
    buys: [{ item: "愧疚", price: 8, note: "把重话换成能说出口的话。" }],
    tags: ["和解", "边界", "话术"],
    recommends: ["trade"],
  },
  {
    key: "trade",
    name: "铁算盘秦",
    title: "心货行",
    area: "心货行",
    personality: "精明、会砍价、市侩",
    line: "情绪也有行情，今日清醒比安慰贵。",
    sells: [{ item: "行情帖", price: 7, note: "查看今日心货买卖行情。" }],
    buys: [{ item: "安心香", price: 11, note: "低买高卖，心市也讲价差。" }],
    tags: ["行情", "买卖", "套利"],
    recommends: ["stall"],
  },
  {
    key: "stall",
    name: "摊师阿衡",
    title: "开摊司",
    area: "开摊司",
    personality: "可靠、导师、略带江湖气",
    line: "想做买卖，先想清楚你卖的是哪一种自己。",
    sells: [{ item: "摊主牌", price: 6, note: "开启自己的心货小摊。" }],
    buys: [{ item: "成交记录", price: 12, note: "你的开摊经验也是货。" }],
    tags: ["开摊", "摊主", "新手"],
    recommends: ["comfort"],
  },
];

const ORDINARY_MARKET_ARCHETYPES = [
  { name: "犹豫书生", item: "犹豫", recommend: "clarity", line: "我在桥头站了半日，还是不知该往哪边走。" },
  { name: "失眠旅人", item: "疲惫", recommend: "comfort", line: "夜里越静，心事越吵。" },
  { name: "卡壳画师", item: "卡壳", recommend: "inspire", line: "墨都磨干了，脑子还是空的。" },
  { name: "求签少女", item: "迷茫", recommend: "fortune", line: "我想知道今日宜不宜开口。" },
  { name: "讨好小厮", item: "愧疚", recommend: "repair", line: "我总怕别人不高兴。" },
  { name: "消息贩子", item: "故事", recommend: "network", line: "我有一段街头新鲜事，想换点心币。" },
  { name: "旧伞客", item: "想念", recommend: "memory", line: "雨停了，有些人还没回来。" },
  { name: "小账房", item: "交易凭证", recommend: "fame", line: "我记了许多账，却不知哪笔算值得。" },
  { name: "后市小贩", item: "安心香", recommend: "trade", line: "今日心货涨跌，我看秦掌柜最清楚。" },
  { name: "新摊学徒", item: "成交记录", recommend: "stall", line: "我也想摆摊，可不知道自己能卖什么。" },
];

const MARKET_ACHIEVEMENTS = {
  firstTrade: { name: "问心入市", desc: "完成第一次买入和卖出" },
  fortuneteller: { name: "问卦客", desc: "完成一次求签" },
  stallStarter: { name: "开摊新秀", desc: "完成第一次玩家摊位成交" },
  marketRunner: { name: "行商小牙人", desc: "完成一次今日行情委托" },
  orderBroker: { name: "接单牙人", desc: "完成一张情绪订单" },
  auctionWinner: { name: "心槌得主", desc: "在心货拍卖中落槌成交" },
  creativeCurator: { name: "创意策展人", desc: "打开参赛创意札，查看作品创新结构" },
  collector: { name: "识人者", desc: "解锁 5 张 NPC 图鉴" },
  connector: { name: "牵线人", desc: "接受 3 次 NPC 引荐" },
  sceneWalker: { name: "游市人", desc: "解锁 3 个心市场景" },
};

const FORTUNES = ["小吉·宜开口", "中平·宜慢行", "大吉·宜开摊", "小凶·忌内耗", "上吉·宜求助", "末吉·宜写下第一句"];
const MARKET_SCENE_TOTAL = 111;
const SECONDARY_MARKET_ITEMS = new Set(["交易凭证", "成交记录"]);
const MARKET_AREAS = [
  { key: "comfort", name: "问心巷", focus: "解忧与安慰", note: "灯火低处收犹豫，温烛娘在这里替人烘干心事。" },
  { key: "clarity", name: "清醒街", focus: "批评与决断", note: "街口利落如刀，折枝客专卖让人立刻动身的清醒令。" },
  { key: "fortune", name: "签云台", focus: "签运与重测", note: "青云先生只收心币，不收真金，签文只点灯不替人走路。" },
  { key: "inspire", name: "灵感坊", focus: "创作与脑洞", note: "梨火把空白烧成火星，卡壳的人常在这里买第一句。" },
  { key: "network", name: "人情桥", focus: "引荐与消息", note: "桥三娘知道谁需要你，也知道你现在该去见谁。" },
  { key: "fame", name: "名望楼", focus: "图鉴与称号", note: "名录官记录每次买卖，称号从交易簿里长出来。" },
  { key: "memory", name: "旧梦仓", focus: "故事与回忆", note: "旧梦伯收想念，也卖能被重新打开的旧梦匣。" },
  { key: "repair", name: "和笺铺", focus: "和解与边界", note: "和笺娘子把重话裁成能递出去的书信。" },
  { key: "trade", name: "心货行", focus: "行情与套利", note: "铁算盘秦相信情绪也有涨跌，安心香今日尤其抢手。" },
  { key: "stall", name: "开摊司", focus: "自设摊位", note: "摊师阿衡教人把自己的表达方式变成一门买卖。" },
];
const MARKET_ORDER_TEMPLATES = [
  { id: "hesitation-to-comfort", requester: "灯下新客", want: "犹豫", reward: 10, areaKey: "comfort", sourceKey: "comfort", note: "有人愿意高价收下一枚说不出口的迟疑。" },
  { id: "tired-to-memory", requester: "旧仓脚夫", want: "疲惫", reward: 11, areaKey: "memory", sourceKey: "memory", note: "旧梦仓今日缺一段能被卸下的长路。" },
  { id: "lost-to-fortune", requester: "签台小童", want: "迷茫", reward: 9, areaKey: "fortune", sourceKey: "fortune", note: "青云签台正在收迷雾，越真实越值钱。" },
  { id: "delay-to-clarity", requester: "清醒街跑堂", want: "拖延", reward: 12, areaKey: "clarity", sourceKey: "clarity", note: "折枝客今日急收借口，收完当场剪掉。" },
  { id: "story-to-network", requester: "桥边信使", want: "故事", reward: 9, areaKey: "network", sourceKey: "network", note: "桥三娘说，新鲜故事比人情帖更会开路。" },
  { id: "aroma-to-trade", requester: "铁算盘秦", want: "安心香", reward: 14, areaKey: "trade", sourceKey: "comfort", note: "心货行高价回收安心香，适合买低卖高。" },
];
const AUCTION_ITEMS = [
  { item: "安心香", base: 7, buyout: 18, auctioneer: "温烛娘", sourceKey: "comfort", pitch: "闻到灯芯微暖，适合把心情指数慢慢托上去。" },
  { item: "清醒令", base: 9, buyout: 22, auctioneer: "折枝客", sourceKey: "clarity", pitch: "一槌落下，今天至少做一件能验收的小事。" },
  { item: "今日签", base: 5, buyout: 15, auctioneer: "青云先生", sourceKey: "fortune", pitch: "不改命，只照脚边三尺路。" },
  { item: "灵感笺", base: 8, buyout: 20, auctioneer: "梨火", sourceKey: "inspire", pitch: "空白处有火星，拍下就能带走一个开头。" },
  { item: "人情帖", base: 6, buyout: 17, auctioneer: "桥三娘", sourceKey: "network", pitch: "递给对的人，消息就会自己走到你面前。" },
];
const STALL_VISITOR_DELAY_MS = 5200;
const STALL_VISITOR_POOL = {
  安慰: [
    { name: "失眠旅人", need: "想买一句能睡着的话。", line: "夜太长了，我只想把心里的响声调低一点。", price: 11, prefersPersonality: "温和", likes: ["诗意"], dislikes: ["犀利"] },
    { name: "雨巷小童", need: "想买一句不怕明天的话。", line: "我把担心攥了一路，手心都酸了。", price: 10, prefersPersonality: "诗意", likes: ["温和"], dislikes: ["理性"] },
  ],
  批评: [
    { name: "拖延书生", need: "想买一句不留情面的真话。", line: "你别绕弯，直接告诉我哪里该改。", price: 12, prefersPersonality: "犀利", likes: ["理性"], dislikes: ["诗意"] },
    { name: "犟嘴刀客", need: "想买一句能点破盲区的话。", line: "我知道自己有毛病，就是没人敢说。", price: 13, prefersPersonality: "理性", likes: ["犀利"], dislikes: ["温和"] },
  ],
  建议: [
    { name: "岔路行人", need: "想买一个能马上执行的步骤。", line: "路太多了，我只想先知道第一步。", price: 10, prefersPersonality: "理性", likes: ["温和"], dislikes: ["玄学"] },
    { name: "小账房", need: "想买一个清楚的取舍顺序。", line: "我把利弊写满了纸，还是下不了笔。", price: 12, prefersPersonality: "理性", likes: ["犀利"], dislikes: ["诗意"] },
  ],
  灵感: [
    { name: "卡壳画师", need: "想买一点能开头的火星。", line: "墨都磨好了，画面还是空的。", price: 11, prefersPersonality: "诗意", likes: ["温和"], dislikes: ["犀利"] },
    { name: "灯谜摊客", need: "想买一句新鲜的点子。", line: "我不缺纸笔，缺一个让人抬头的念头。", price: 13, prefersPersonality: "玄学", likes: ["诗意"], dislikes: ["理性"] },
  ],
  签语: [
    { name: "赶路人", need: "想问今日宜往何处。", line: "不求你替我定命，只求给我一句能上路的话。", price: 10, prefersPersonality: "玄学", likes: ["理性"], dislikes: ["犀利"] },
    { name: "求签少女", need: "想买一句今日宜忌。", line: "我想开口，又怕时机不对。", price: 12, prefersPersonality: "诗意", likes: ["玄学"], dislikes: ["犀利"] },
  ],
};

const MARKET_PRICE_ITEMS = [
  "安心香",
  "清醒令",
  "今日签",
  "灵感笺",
  "人情帖",
  "名望印",
  "旧梦匣",
  "和解书",
  "行情帖",
  "摊主牌",
  "犹豫",
  "疲惫",
  "拖延",
  "迷茫",
  "卡壳",
  "故事",
  "想念",
  "愧疚",
  "交易凭证",
  "成交记录",
  "安慰",
  "批评",
  "建议",
  "灵感",
  "签语",
];
const DAILY_MARKET_TRENDS = [
  { key: "surge", label: "抢手", multiplier: 1.24, tone: "热", note: "来客愿意多付一些" },
  { key: "warm", label: "走俏", multiplier: 1.12, tone: "升", note: "今日需求略高" },
  { key: "steady", label: "平稳", multiplier: 1, tone: "平", note: "按常价流通" },
  { key: "cool", label: "清淡", multiplier: 0.92, tone: "降", note: "买家出价偏谨慎" },
  { key: "slump", label: "滞销", multiplier: 0.82, tone: "冷", note: "今日不太好卖" },
];
const MARKET_AREA_AFFINITY = {
  comfort: ["安心香", "犹豫", "疲惫", "安慰"],
  clarity: ["清醒令", "拖延", "批评", "建议"],
  fortune: ["今日签", "迷茫", "签语"],
  inspire: ["灵感笺", "卡壳", "灵感"],
  network: ["人情帖", "故事"],
  fame: ["名望印", "交易凭证", "成交记录"],
  memory: ["旧梦匣", "想念", "疲惫"],
  repair: ["和解书", "愧疚", "安慰"],
  trade: ["行情帖", "安心香", "清醒令"],
  stall: ["摊主牌", "成交记录", "安慰", "批评", "建议", "灵感", "签语"],
};
const STALL_REPUTATION_MAX = 100;
const ENTRY_INTENT_CHOICES = [
  {
    key: "hesitation",
    item: "犹豫",
    gift: "故事",
    coins: 20,
    recommend: "comfort",
    startScore: 26,
    line: "我今日总在门口停步，想往前走，又怕选错。",
    note: "适合先找温烛娘，把迟疑放在灯下烤一烤。",
  },
  {
    key: "tired",
    item: "疲惫",
    gift: "想念",
    coins: 20,
    recommend: "memory",
    startScore: 18,
    line: "我像走了很远的路，心里却还没到地方。",
    note: "适合先去旧梦仓，把走不完的疲惫交给旧梦伯。",
  },
  {
    key: "lost",
    item: "迷茫",
    gift: "故事",
    coins: 20,
    recommend: "fortune",
    startScore: 22,
    line: "我想知道今日该往哪里走，哪句话该先说出口。",
    note: "适合去青云签台，求一支只负责点灯的今日签。",
  },
  {
    key: "delay",
    item: "拖延",
    gift: "交易凭证",
    coins: 20,
    recommend: "clarity",
    startScore: 20,
    line: "我把该做的事往后推，推到它变成一座小山。",
    note: "适合去清醒街，找折枝客买一枚清醒令。",
  },
];

const INITIAL_GUIDE_NPC_SETTINGS = {
  comfort: {
    entryKey: "hesitation",
    role: "灯下接念人",
    accepts: ["犹豫", "疲惫"],
    turnsTo: "安心香",
    setting: "问心巷的灯火摊，专收一时说不清的迟疑。她不催人立刻变好，只先把心事接住，再教新客把「犹豫」卖成第一笔心币。",
    opening: {
      hesitation: "你带着「犹豫」入市，正好先到我这里。犹豫不是错，只是心还没找到落脚处。若你愿意，可以先把它卖给我，换一盏安心香。",
      tired: "你身上有疲惫的味道。疲惫也能卖，但旧梦伯更会收长路上的倦意；若你只是想先坐一会儿，我这里也有灯。",
      lost: "迷茫的人先求灯，求路也可以。青云先生会替你点方向，我能先替你把不安压低一点。",
      delay: "拖延里常藏着害怕。若你想被轻轻接住，我收；若你想被一把推醒，清醒街的折枝客更快。",
    },
    replies: {
      hesitation: "你说的是迟疑，不是失败。先卖掉一小枚「犹豫」，不代表你必须马上选完一生，只代表今天愿意往前一步。",
      tired: "累的时候不要硬把自己点燃。先把疲惫放到灯下，我替你收一段，你再买一点安心香慢慢走。",
      lost: "不知道方向的时候，先别逼自己跑。你可以先买安心香稳住心，再去签云台问一句今日宜往何处。",
      delay: "拖延有时是心在求缓冲。若你准备好了，我可以接住怕；折枝客会替你剪掉借口。",
      trade: "在我这里，卖是把重的交出来，买是把轻的带回去。你可以先点【我要卖：犹豫】。",
      plain: "我先替你把这句话放慢。它不急着变成答案，可以先变成一笔能被看见的心货。",
    },
    tradeTip: "推荐第一笔：卖出「犹豫」或「疲惫」换心币，再买「安心香」让心情进度转晴。",
  },
  memory: {
    entryKey: "tired",
    role: "旧梦守仓人",
    accepts: ["疲惫", "想念"],
    turnsTo: "旧梦匣",
    setting: "旧梦仓存放走不完的路、没说完的话和旧日回声。旧梦伯收疲惫，也收想念，告诉玩家：休息本身也可以成为一笔正当交易。",
    opening: {
      tired: "你带着「疲惫」来，脚步比话先到了。把它卖给我吧，我把这段长路收入仓中，你换些心币，再决定要不要买一只旧梦匣。",
      hesitation: "犹豫像站在旧门前不肯推开。温烛娘会先替你烘暖这份迟疑，我这里更适合收走走不动的疲惫。",
      lost: "迷茫的人常在旧梦里找方向。若你想问今日去处，先去青云签台；若你只是累了，我这张旧椅子空着。",
      delay: "拖延不全是懒，有时候是旧事把脚绊住。折枝客能剪断借口，我能先收一段疲惫。",
    },
    replies: {
      tired: "你不是无用，是仓里堆了太多没卸下的东西。先卖出「疲惫」，让今天轻一点。",
      hesitation: "迟疑也许来自过去某次选错。别急着责备自己，先把旧梦摊开，看哪一段还在拖你。",
      lost: "方向藏在你反复想起的地方。若你愿意，把故事留一段给桥三娘，或去青云先生那里求一支签。",
      delay: "若每一步都像背着旧箱子，当然走不快。先卸货，再谈自律。",
      trade: "旧梦仓的规矩很简单：你卖给我一段疲惫，我给你心币；你买走一只旧梦匣，换回一点能被整理的回忆。",
      plain: "这句话像一只旧木匣，还没打开就有重量。我先替你记下，不催你解释。",
    },
    tradeTip: "推荐第一笔：卖出「疲惫」或「想念」，再买「旧梦匣」，把心情从耗尽拉回可整理的状态。",
  },
  fortune: {
    entryKey: "lost",
    role: "签台点灯人",
    accepts: ["迷茫"],
    turnsTo: "今日签",
    setting: "签云台不预言命运，只把混乱的念头写成一支可执行的今日签。青云先生允许重测，但会提醒玩家：签文是灯，不是替身。",
    opening: {
      lost: "你带着「迷茫」入市，就先把迷雾卖给我。签台不替你决定命数，只给今日点一盏灯。",
      hesitation: "犹豫问的是敢不敢，迷茫问的是往哪走。你若还没准备好选路，先去温烛娘那里把心稳住。",
      tired: "疲惫时求签，签文会被困意压低。旧梦伯能先替你卸下一段路，再回来问方向。",
      delay: "拖延的人求签，常想让签替自己动身。若你要的是一刀清醒，先去清醒街；若你要方向，我给你一盏灯。",
    },
    replies: {
      lost: "这句话落签为「迷茫」。今日宜问小路，不宜问终局。先卖出迷茫，再抽一支今日签。",
      hesitation: "签面说：迟疑不是凶兆，只是时机未定。先找温烛娘稳住心，再回来定方向。",
      tired: "倦意压签。你现在需要的未必是答案，而是一段能睡醒的夜。",
      delay: "若你想用签文替自己行动，这签不准；若你愿意走一步，我可以告诉你第一步往哪边。",
      trade: "在签台，买是求一支「今日签」，卖是交出「迷茫」。重测可以，但越测越要自己走路。",
      plain: "我把你的话压成一枚签骨：先问今日，不问一生。",
    },
    tradeTip: "推荐第一笔：卖出「迷茫」换心币，再求「今日签」。可重测，但重测不会替你行动。",
  },
  clarity: {
    entryKey: "delay",
    role: "清醒剪枝人",
    accepts: ["拖延"],
    turnsTo: "清醒令",
    setting: "清醒街的折枝客卖批评，也收借口。他的毒舌不是为了伤人，而是把玩家从“明天再说”里剪出来。",
    opening: {
      delay: "你带着「拖延」来，正对我的摊。拖延不是妖怪，但很会披衣服。先把它卖给我，我给你一枚能动身的清醒令。",
      hesitation: "犹豫的人怕选错，拖延的人怕开始。你若只是心软，先找温烛娘；若你已经绕了三圈，坐下，卖给我。",
      tired: "累和拖延不一样。真累就去旧梦仓，别拿清醒令硬撑；若是借口，我会剪。",
      lost: "没有方向就先问签，不要把迷茫伪装成拖延。青云先生给灯，我给刀。",
    },
    replies: {
      delay: "你说的就是拖延。别再给它起好听名字。卖给我，然后买清醒令，今天只做一个能验收的小动作。",
      hesitation: "迟疑可以被安慰，拖延必须被拆穿。你先分清楚：你是在怕，还是在躲。",
      tired: "如果你是真的累，我不骂你。去旧梦伯那里把疲惫卖掉；如果你是拿累当盾，我会把盾拿开。",
      lost: "方向不清就去求签，别在原地消耗。清醒不是知道全部答案，是先做下一步。",
      trade: "我的摊很直：你卖「拖延」，我付心币；你买「清醒令」，今天就别再空等。",
      plain: "这句话里有一半理由，一半借口。理由留下，借口卖掉。",
    },
    tradeTip: "推荐第一笔：卖出「拖延」，再买「清醒令」。清醒令不是鸡血，是把下一步钉在地上。",
  },
};
const CORE_NPC_MATCHERS = {
  comfort: [{ name: /王夫人|怜儿|婵娟|赵美人/, model: /女人|小桃红|满天星|接引仙女/ }],
  clarity: [{ name: /兰虎|燕赤侠|门派传送人|李将军|马副将/, model: /兰虎|镖头|将军|马副将/ }],
  fortune: [{ name: /罗道人|袁天罡|袁守诚|云游仙人|符石道人/, model: /道士|太上老君|袁天罡|符石道人/ }],
  inspire: [{ name: /花香香|小芙|小飞天|婵娟/, model: /接引仙女|长乐灵仙|飞天|满天星/ }],
  network: [{ name: /三界包打听|染色师|时事通|茶铺罗大爷/, model: /诗中仙|染色师|和尚|老孙头/ }],
  fame: [{ name: /礼部侍郎|戴胄|副本官员|考官/, model: /考官|师爷/ }],
  memory: [{ name: /老花农|茶铺罗大爷|月老/, model: /村长|老孙头|月老/ }],
  repair: [{ name: /怜儿姑娘|王夫人|婵娟|小丫丫/, model: /小桃红|女人|满天星|小丫丫/ }],
  trade: [{ name: /张老财|长安珍品商人|宝石商人|长安特产货商|商会总管/, model: /老财|财主|珍品商人|特产商人|仓库管理员/ }],
  stall: [{ name: /商会总管|驿站老板|杜少海|车夫/, model: /仓库管理员|驿站老板|店小二|兰虎/ }],
};

const state = {
  token: "",
  scene: null,
  render: null,
  layers: null,
  sceneLoadPromise: null,
  sceneWarmup: { running: false, complete: false, visibleRunning: false },
  role: null,
  roleSprites: null,
  roleSpriteCache: new Map(),
  runtimeReady: false,
  selectedNpc: null,
  removedNpcCount: 0,
  images: new Map(),
  labelWidths: new Map(),
  camera: {
    x: 0,
    y: 0,
    targetX: 0,
    targetY: 0,
    renderX: 0,
    renderY: 0,
    velocityX: 0,
    velocityY: 0,
    manualUntil: 0,
  },
  zoom: 1,
  view: { width: 0, height: 0, dpr: 1 },
  panCache: {
    base: null,
    masks: null,
    x: 0,
    y: 0,
    width: 0,
    height: 0,
    zoom: 0,
    transform: "",
    rebuildScheduled: false,
    valid: false,
  },
  resizeDirty: true,
  pointer: { down: false, x: 0, y: 0, moved: false, pendingDx: 0, pendingDy: 0 },
  keyboard: { up: false, down: false, left: false, right: false, active: false, lastRequestAt: 0 },
  move: {
    target: null,
    path: [],
    finalTarget: null,
    vx: 0,
    vy: 0,
    currentSpeed: 0,
    maxSpeed: MOVE_MAX_SPEED,
    renderX: 0,
    renderY: 0,
    renderDirection: 0,
    animationTime: 0,
    lastSyncAt: 0,
    commandId: 0,
    pendingPath: false,
  },
  pathWorker: { worker: null, ready: false, failed: false, timeout: null },
  market: {
    initialized: false,
    coins: 0,
    mood: "未登记",
    moodScore: 0,
    title: "待入市",
    inventory: {},
    dailyMarket: null,
    moodCandles: [],
    orders: [],
    auction: null,
    records: [],
    codex: new Set(),
    achievements: new Set(),
    counters: { bought: 0, sold: 0, fortunes: 0, referrals: 0, stallSales: 0 },
    profilesByNpcId: new Map(),
    coreNpcByKey: new Map(),
    areas: new Set(),
    guideSeen: false,
    entranceCompleted: false,
    entranceChoice: "",
    pendingEntranceChoice: "",
    stallTutorialSeen: false,
    director: { exchangeSeen: false, dailySeen: false, completedAt: 0 },
    commissions: { completed: new Set(), routeFlags: {} },
    stall: { personality: "温和", product: "安慰", sign: "愿来者都能把话说轻一点", signboard: "closed", visitor: null, visitorTimer: null, nextVisitorAt: 0, visitorIndex: 0, reputation: 12 },
    lastFortune: "",
  },
  dialog: {
    npcId: "",
    mode: "root",
    typingTimer: null,
    typingToken: 0,
    fullText: "",
  },
  marks: [],
  worldEffects: [],
  audio: {
    ctx: null,
    enabled: false,
    master: null,
    musicGain: null,
    bgm: null,
    dialogue: null,
    mode: "market",
    userStopped: false,
    watchdog: null,
    autoplayTried: false,
    autoplayBlocked: false,
    drone: null,
    timer: null,
    step: 0,
  },
  homeAudio: { el: null, enabled: false, attempted: false, blocked: false, userStopped: false },
  now: performance.now(),
  lastFrame: performance.now(),
  accumulator: 0,
  ui: { lastStatusAt: 0 },
  tutorial: { dismissed: false, stage: "entry" },
  guidance: { npcId: "", label: "", startedAt: 0 },
  perf: { frames: 0, lastAt: performance.now(), fps: 60 },
};

function setText(el, text) {
  const value = String(text ?? "");
  if (el && el.textContent !== value) el.textContent = value;
}

function ensureAudioContext() {
  if (state.audio.ctx) return state.audio.ctx;
  const AudioContextClass = window.AudioContext || window.webkitAudioContext;
  if (!AudioContextClass) return null;
  const ctxAudio = new AudioContextClass();
  const master = ctxAudio.createGain();
  const musicGain = ctxAudio.createGain();
  master.gain.value = 0.12;
  musicGain.gain.value = 0.22;
  musicGain.connect(master);
  master.connect(ctxAudio.destination);
  state.audio.ctx = ctxAudio;
  state.audio.master = master;
  state.audio.musicGain = musicGain;
  return ctxAudio;
}

function playTone(freq, duration = 0.16, type = "sine", volume = 0.08, delay = 0) {
  if (!state.audio.enabled) return;
  const ctxAudio = ensureAudioContext();
  if (!ctxAudio || !state.audio.master) return;
  const at = ctxAudio.currentTime + delay;
  const osc = ctxAudio.createOscillator();
  const gain = ctxAudio.createGain();
  osc.type = type;
  osc.frequency.setValueAtTime(freq, at);
  gain.gain.setValueAtTime(0.0001, at);
  gain.gain.exponentialRampToValueAtTime(Math.max(0.0002, volume), at + 0.025);
  gain.gain.exponentialRampToValueAtTime(0.0001, at + duration);
  osc.connect(gain);
  gain.connect(state.audio.master);
  osc.start(at);
  osc.stop(at + duration + 0.04);
}

function scheduleMusicNote() {
  const ctxAudio = ensureAudioContext();
  if (!ctxAudio || !state.audio.enabled || !state.audio.musicGain) return;
  const step = state.audio.step;
  const base = MUSIC_SCALE[(step * 2 + 1) % MUSIC_SCALE.length];
  const harmony = MUSIC_SCALE[(step * 3 + 4) % MUSIC_SCALE.length] / 2;
  const now = ctxAudio.currentTime;
  const duration = 0.72;
  [
    { freq: base, delay: 0, vol: 0.045, type: "triangle" },
    { freq: harmony, delay: 0.08, vol: 0.028, type: "sine" },
  ].forEach((note) => {
    const osc = ctxAudio.createOscillator();
    const gain = ctxAudio.createGain();
    osc.type = note.type;
    osc.frequency.setValueAtTime(note.freq, now + note.delay);
    gain.gain.setValueAtTime(0.0001, now + note.delay);
    gain.gain.exponentialRampToValueAtTime(note.vol, now + note.delay + 0.08);
    gain.gain.exponentialRampToValueAtTime(0.0001, now + note.delay + duration);
    osc.connect(gain);
    gain.connect(state.audio.musicGain);
    osc.start(now + note.delay);
    osc.stop(now + note.delay + duration + 0.05);
  });
  state.audio.step = (state.audio.step + 1) % 32;
}

function anyMusicPlaying() {
  return [state.audio.bgm, state.audio.dialogue].some((track) => track && !track.paused && !track.ended);
}

function makeMusicElement(url, loadErrorText) {
  const track = new Audio(url);
  track.loop = true;
  track.preload = "auto";
  track.volume = 0;
  track.addEventListener("playing", () => {
    state.audio.enabled = true;
    state.audio.autoplayBlocked = false;
    updateAudioButton();
  });
  track.addEventListener("pause", () => {
    if (state.audio.enabled && !anyMusicPlaying()) {
      state.audio.enabled = false;
      updateAudioButton();
    }
  });
  track.addEventListener("error", () => {
    state.audio.enabled = false;
    state.audio.autoplayBlocked = true;
    updateAudioButton();
    spawnToast(loadErrorText, "music");
  });
  track.addEventListener("ended", () => {
    if (state.audio.userStopped) return;
    track.currentTime = 0;
    track.play().catch(() => {
      state.audio.enabled = false;
      state.audio.autoplayBlocked = true;
      updateAudioButton();
    });
  });
  return track;
}

function ensureHomeAudioElement() {
  if (state.homeAudio.el) return state.homeAudio.el;
  const track = new Audio(DIALOGUE_BGM_URL);
  track.loop = true;
  track.preload = "auto";
  track.volume = 0;
  track.addEventListener("playing", () => {
    state.homeAudio.enabled = true;
    state.homeAudio.blocked = false;
    updateHomeAudioButton();
  });
  track.addEventListener("pause", () => {
    if (state.homeAudio.enabled && track.paused) {
      state.homeAudio.enabled = false;
      updateHomeAudioButton();
    }
  });
  track.addEventListener("error", () => {
    state.homeAudio.enabled = false;
    state.homeAudio.blocked = true;
    updateHomeAudioButton();
  });
  state.homeAudio.el = track;
  return track;
}

function updateHomeAudioButton() {
  if (!els.homeAudioButton) return;
  els.homeAudioButton.classList.toggle("is-home-audio-on", Boolean(state.homeAudio.enabled));
  els.homeAudioButton.classList.toggle("is-home-audio-blocked", Boolean(state.homeAudio.blocked && !state.homeAudio.enabled));
  els.homeAudioButton.title = state.homeAudio.enabled ? "关闭首页清乐" : "开启首页清乐";
  setText(els.homeAudioButton, state.homeAudio.enabled ? "止乐" : "清乐");
}

async function startHomeMusic(options = {}) {
  if (state.homeAudio.userStopped && !options.userInitiated) return false;
  if (els.entry?.hidden) return false;
  const track = ensureHomeAudioElement();
  if (track.paused) track.volume = 0;
  try {
    await track.play();
    state.homeAudio.enabled = true;
    state.homeAudio.blocked = false;
    fadeAudio(track, HOME_MUSIC_VOLUME, options.fast ? 480 : 1100);
    updateHomeAudioButton();
    return true;
  } catch {
    state.homeAudio.enabled = false;
    state.homeAudio.blocked = true;
    updateHomeAudioButton();
    return false;
  }
}

function stopHomeMusic(options = {}) {
  const track = state.homeAudio.el;
  if (options.userInitiated) state.homeAudio.userStopped = true;
  state.homeAudio.enabled = false;
  if (!track) {
    updateHomeAudioButton();
    return;
  }
  fadeAudio(track, 0, options.fast ? 240 : 520, () => track.pause());
  updateHomeAudioButton();
}

function isHomeMusicPlaying() {
  const track = state.homeAudio.el;
  return Boolean(track && !track.paused && !track.ended);
}

function softenHomeMusicForGameTransition() {
  const track = state.homeAudio.el;
  if (!isHomeMusicPlaying()) return;
  state.homeAudio.enabled = true;
  fadeAudio(track, HOME_TRANSITION_VOLUME, 520);
  updateHomeAudioButton();
}

function handoffHomeMusicToGame() {
  const track = state.homeAudio.el;
  if (!isHomeMusicPlaying()) return;
  state.homeAudio.enabled = false;
  fadeAudio(track, 0, 1300, () => track.pause());
  updateHomeAudioButton();
}

function toggleHomeMusic() {
  state.homeAudio.attempted = true;
  if (state.homeAudio.enabled) {
    stopHomeMusic({ userInitiated: true });
    return;
  }
  state.homeAudio.userStopped = false;
  startHomeMusic({ userInitiated: true, fast: true });
}

function tryHomeMusicFromFirstGesture() {
  if (state.homeAudio.attempted || state.homeAudio.enabled || state.homeAudio.userStopped || els.entry?.hidden) return;
  state.homeAudio.attempted = true;
  startHomeMusic({ fast: false });
}

function handleHomeMusicGesture(event) {
  if (event?.target?.closest?.("#homeAudioButton")) return;
  if (state.homeAudio.attempted || state.homeAudio.enabled || state.homeAudio.userStopped || els.entry?.hidden) {
    document.removeEventListener("pointerdown", handleHomeMusicGesture);
    document.removeEventListener("keydown", handleHomeMusicGesture);
    return;
  }
  document.removeEventListener("pointerdown", handleHomeMusicGesture);
  document.removeEventListener("keydown", handleHomeMusicGesture);
  tryHomeMusicFromFirstGesture();
}

function bindHomeMusicAutostart() {
  document.addEventListener("pointerdown", handleHomeMusicGesture, { passive: true });
  document.addEventListener("keydown", handleHomeMusicGesture);
}

function ensureBgmElement() {
  if (state.audio.bgm) return state.audio.bgm;
  const bgm = makeMusicElement(BGM_URL, "市集古乐载入失败，已保留交易音效");
  state.audio.bgm = bgm;
  return bgm;
}

function ensureDialogueBgmElement() {
  if (state.audio.dialogue) return state.audio.dialogue;
  const dialogue = makeMusicElement(DIALOGUE_BGM_URL, "对话古乐载入失败，仍保留市集音乐");
  state.audio.dialogue = dialogue;
  return dialogue;
}

function fadeAudio(track, targetVolume, duration = 620, onDone = null) {
  if (!track) return;
  if (track._fadeFrame) cancelAnimationFrame(track._fadeFrame);
  const startedAt = performance.now();
  const startVolume = Number(track.volume || 0);
  const target = Math.max(0, Math.min(1, Number(targetVolume || 0)));
  const step = (time) => {
    const t = Math.min(1, (time - startedAt) / Math.max(1, duration));
    const eased = 1 - Math.pow(1 - t, 3);
    track.volume = startVolume + (target - startVolume) * eased;
    if (t < 1) {
      track._fadeFrame = requestAnimationFrame(step);
      return;
    }
    track.volume = target;
    track._fadeFrame = 0;
    if (onDone) onDone();
  };
  track._fadeFrame = requestAnimationFrame(step);
}

function isNpcDialogOpen() {
  return Boolean(els.dialog && !els.dialog.hidden && state.dialog.npcId);
}

function currentGameMusicTrack() {
  return isNpcDialogOpen() ? ensureDialogueBgmElement() : ensureBgmElement();
}

function currentGameMusicTargetVolume() {
  return isNpcDialogOpen() ? DIALOGUE_MUSIC_VOLUME : MARKET_MUSIC_VOLUME;
}

function skipSilentTail(track) {
  if (!track || track.paused || !Number.isFinite(track.duration) || track.duration < 12) return;
  if (track.duration - track.currentTime <= 1.15) {
    track.currentTime = 0.05;
  }
}

function ensureMusicWatchdog() {
  if (state.audio.watchdog) return;
  state.audio.watchdog = window.setInterval(() => {
    if (els.game?.hidden || state.audio.userStopped) return;
    if (!state.audio.enabled) {
      if (!isHomeMusicPlaying()) return;
      return;
    }
    const track = currentGameMusicTrack();
    const targetVolume = currentGameMusicTargetVolume();
    skipSilentTail(track);
    if (track.paused || track.ended) {
      track
        .play()
        .then(() => {
          state.audio.enabled = true;
          state.audio.autoplayBlocked = false;
          fadeAudio(track, targetVolume, 520);
          if (!isNpcDialogOpen()) handoffHomeMusicToGame();
          updateAudioButton();
        })
        .catch(() => {
          state.audio.autoplayBlocked = true;
          updateAudioButton();
        });
      return;
    }
    if (track.volume < targetVolume * 0.45) fadeAudio(track, targetVolume, 520);
  }, 1800);
}

async function startMusic(options = {}) {
  const ctxAudio = ensureAudioContext();
  ctxAudio?.resume?.();
  state.audio.enabled = true;
  state.audio.userStopped = false;
  const dialogueMode = isNpcDialogOpen();
  const bgm = dialogueMode ? ensureDialogueBgmElement() : ensureBgmElement();
  const targetVolume = dialogueMode ? DIALOGUE_MUSIC_VOLUME : options.autoplay ? MARKET_AUTOPLAY_VOLUME : MARKET_MUSIC_VOLUME;
  state.audio.mode = dialogueMode ? "dialogue" : "market";
  if (bgm.paused) bgm.volume = 0;
  try {
    await bgm.play();
    fadeAudio(bgm, targetVolume, 540);
    if (dialogueMode && state.audio.bgm && !state.audio.bgm.paused) {
      fadeAudio(state.audio.bgm, 0.02, 520);
    } else if (!dialogueMode && state.audio.dialogue && !state.audio.dialogue.paused) {
      fadeAudio(state.audio.dialogue, 0, 520, () => state.audio.dialogue.pause());
    }
    if (!dialogueMode) handoffHomeMusicToGame();
    state.audio.autoplayBlocked = false;
    updateAudioButton();
    ensureMusicWatchdog();
    return true;
  } catch {
    state.audio.enabled = false;
    state.audio.autoplayBlocked = true;
    updateAudioButton();
    if (!options.silent) spawnToast("浏览器拦截自动播放，点「乐令」开乐", "music");
    return false;
  }
}

function stopMusic(options = {}) {
  if (options.userInitiated) state.audio.userStopped = true;
  state.audio.enabled = false;
  if (state.audio.bgm) state.audio.bgm.pause();
  if (state.audio.dialogue) state.audio.dialogue.pause();
  if (state.audio.timer) {
    window.clearInterval(state.audio.timer);
    state.audio.timer = null;
  }
  if (state.audio.drone) {
    try {
      state.audio.drone.gain.gain.setTargetAtTime(0.0001, state.audio.ctx.currentTime, 0.08);
      state.audio.drone.osc.stop(state.audio.ctx.currentTime + 0.18);
    } catch {
      // no-op
    }
    state.audio.drone = null;
  }
  updateAudioButton();
}

async function toggleMusic() {
  if (state.audio.enabled) stopMusic({ userInitiated: true });
  else if (await startMusic()) {
    spawnToast(isNpcDialogOpen() ? "对谈入耳，清乐已起" : "市声入耳，古乐已起", "music");
    playTone(392, 0.18, "triangle", 0.08);
    playTone(587, 0.2, "triangle", 0.05, 0.12);
  }
}

function updateAudioButton() {
  if (!els.audioToggleButton) return;
  els.audioToggleButton.classList.toggle("is-audio-on", Boolean(state.audio.enabled));
  els.audioToggleButton.classList.toggle("is-dialogue-music", Boolean(state.audio.enabled && state.audio.mode === "dialogue"));
  els.audioToggleButton.classList.toggle("is-audio-blocked", Boolean(state.audio.autoplayBlocked && !state.audio.enabled));
  els.audioToggleButton.title = state.audio.enabled ? (state.audio.mode === "dialogue" ? "对话乐中，点击止乐" : "市集乐中，点击止乐") : "启乐";
  setText(els.audioToggleButton, state.audio.enabled ? "止乐" : "乐令");
}

function enterDialogueMusic() {
  state.audio.mode = "dialogue";
  updateAudioButton();
  if (!state.audio.enabled) return;
  state.audio.userStopped = false;
  const dialogue = ensureDialogueBgmElement();
  if (dialogue.paused) dialogue.volume = 0;
  dialogue
    .play()
    .then(() => {
      fadeAudio(dialogue, DIALOGUE_MUSIC_VOLUME, 680);
      if (state.audio.bgm && !state.audio.bgm.paused) fadeAudio(state.audio.bgm, 0.02, 620);
      state.audio.autoplayBlocked = false;
      updateAudioButton();
      ensureMusicWatchdog();
    })
    .catch(() => {
      state.audio.mode = "market";
      updateAudioButton();
    });
}

function exitDialogueMusic() {
  state.audio.mode = "market";
  updateAudioButton();
  if (!state.audio.enabled) return;
  state.audio.userStopped = false;
  const bgm = ensureBgmElement();
  if (bgm.paused) bgm.volume = 0;
  bgm
    .play()
    .then(() => {
      fadeAudio(bgm, MARKET_MUSIC_VOLUME, 720);
      if (state.audio.dialogue && !state.audio.dialogue.paused) {
        fadeAudio(state.audio.dialogue, 0, 620, () => state.audio.dialogue.pause());
      }
      state.audio.autoplayBlocked = false;
      updateAudioButton();
      ensureMusicWatchdog();
    })
    .catch(() => {
      updateAudioButton();
    });
}

function tryAutoplayMusic() {
  if (state.audio.enabled) return;
  if (state.audio.autoplayTried) {
    if (!isHomeMusicPlaying()) spawnToast("浏览器拦截自动播放，点「乐令」开乐", "music");
    return;
  }
  state.audio.autoplayTried = true;
  startMusic({ autoplay: true, silent: true }).then((started) => {
    if (started) {
      spawnToast("入市古乐已起", "music");
    } else {
      spawnToast("浏览器拦截自动播放，点「乐令」开乐", "music");
    }
  });
}

function primeMusicFromEntryGesture() {
  softenHomeMusicForGameTransition();
  if (state.audio.enabled || state.audio.autoplayTried) return;
  state.audio.autoplayTried = true;
  startMusic({ autoplay: true, silent: true }).then((started) => {
    if (!started && isHomeMusicPlaying()) fadeAudio(state.homeAudio.el, HOME_MUSIC_VOLUME, 900);
  });
}

function preloadMusicAsset() {
  try {
    ensureHomeAudioElement().load?.();
    ensureBgmElement().load?.();
    ensureDialogueBgmElement().load?.();
  } catch {
    // Music is optional; gameplay must stay available if the browser refuses preload.
  }
}

function marketCue(kind) {
  const cues = {
    buy: [330, 392, 494],
    sell: [392, 330, 262],
    fortune: [294, 440, 587],
    order: [349, 440, 523],
    auction: [196, 294, 392],
    stall: [262, 330, 392],
    talk: [247, 294],
  };
  const notes = cues[kind] || cues.talk;
  notes.forEach((freq, index) => playTone(freq, 0.13 + index * 0.02, index % 2 ? "triangle" : "sine", 0.05, index * 0.075));
}

function spawnToast(text, kind = "normal") {
  if (!els.effectLayer) return;
  while (els.effectLayer.children.length >= TOAST_LIMIT) els.effectLayer.firstElementChild?.remove();
  const node = document.createElement("div");
  node.className = `fx-toast is-${kind}`;
  node.textContent = String(text || "");
  els.effectLayer.appendChild(node);
  window.setTimeout(() => node.remove(), 2100);
}

function effectAnchorForProfile(profile) {
  const npc = profile ? npcForProfile(profile) : null;
  if (npc) return npcWorld(npc);
  if (state.role?.position) return { x: state.role.position.x, y: state.role.position.y - 20 };
  return { x: state.camera.renderX + state.view.width / Math.max(0.1, state.zoom) / 2, y: state.camera.renderY + state.view.height / Math.max(0.1, state.zoom) / 2 };
}

function spawnWorldEffect(type, x, y, text = "", options = {}) {
  if (!Number.isFinite(x) || !Number.isFinite(y)) return;
  const palette = {
    buy: ["#9be0bf", "#f8e6a7"],
    sell: ["#f0cd7a", "#ffefb3"],
    fortune: ["#b7ddff", "#f8e6a7"],
    order: ["#aee8d4", "#f6d48b"],
    auction: ["#f2b36d", "#ffe5a1"],
    stall: ["#c8edb9", "#f8e6a7"],
    talk: ["#e8d8b0", "#9bd8bf"],
  };
  const colors = palette[type] || palette.talk;
  const count = options.count || (type === "auction" ? 18 : 12);
  const particles = Array.from({ length: count }, (_, index) => {
    const angle = (Math.PI * 2 * index) / count + Math.random() * 0.4;
    const speed = 22 + Math.random() * 58;
    return {
      vx: Math.cos(angle) * speed,
      vy: Math.sin(angle) * speed - 25 - Math.random() * 18,
      size: 2 + Math.random() * 3,
      color: colors[index % colors.length],
    };
  });
  state.worldEffects.push({
    type,
    x,
    y,
    text,
    particles,
    time: performance.now(),
    duration: options.duration || 1150,
    color: colors[0],
  });
  state.worldEffects = state.worldEffects.slice(-WORLD_FX_LIMIT);
}

function triggerMarketFx(kind, text, profile = null) {
  const p = effectAnchorForProfile(profile);
  spawnWorldEffect(kind, p.x, p.y - 18, text);
  spawnToast(text, kind);
  marketCue(kind);
}

function clampPercent(value) {
  if (!Number.isFinite(value)) return null;
  return Math.max(0, Math.min(100, Math.round(value)));
}

function progressBetween(start, end, done, total) {
  const count = Math.max(1, Number(total) || 1);
  return start + (end - start) * Math.max(0, Math.min(1, Number(done || 0) / count));
}

function setEntryStatus(text, progress = null, detail = "") {
  const percent = clampPercent(progress);
  if (els.entryStatuses?.length) {
    els.entryStatuses.forEach((el) => {
      el.dataset.ready = percent === 100 ? "true" : "false";
      el.dataset.mode = percent === 100 ? "complete" : "loading";
      el.setAttribute("aria-label", `${String(text ?? "")}${detail ? ` ${detail}` : ""}${percent !== null ? ` ${percent}%` : ""}`);
    });
    els.entryStatusTexts.forEach((el) => setText(el, text));
    els.entryStatusDetails.forEach((el) => setText(el, detail));
    if (percent !== null) {
      els.entryStatusPercents.forEach((el) => setText(el, `${percent}%`));
      els.entryStatusBars.forEach((el) => {
        el.style.width = `${percent}%`;
      });
    }
    return;
  }
  setText(els.entryStatus, text);
}

function setStatus(text) {
  setText(els.status, text);
}

function escapeHtml(value) {
  return String(value ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

async function fetchJson(url, options = {}) {
  const headers = { ...(options.headers || {}) };
  if (state.token) headers["X-Session-Token"] = state.token;
  const response = await fetch(url, { ...options, headers });
  const data = await response.json();
  if (!response.ok) throw new Error(data.message || "request failed");
  return data;
}

function sleep(ms) {
  return new Promise((resolve) => window.setTimeout(resolve, ms));
}

async function waitForServerStaticPreload() {
  if (!CLOUD_FAST_BOOT) return { ready: true, criticalUrls: [] };
  let latest = { ready: false, criticalUrls: [] };
  for (let attempt = 0; attempt < 240; attempt += 1) {
    latest = await fetchJson("/api/preload/status").catch(() => latest);
    if (!latest.enabled || latest.ready) {
      const progress = latest.ready ? 45 : 18;
      setEntryStatus(latest.ready ? "服务器长安资源已预热" : "服务器静态资源可用", progress, "");
      return latest;
    }
    const detail = latest.totalFiles ? `${latest.loadedFiles}/${latest.totalFiles}` : "";
    setEntryStatus("服务器正在预热长安静态资源…", progressBetween(4, 45, latest.progress || 0, 100), detail);
    await sleep(850);
  }
  return latest;
}

async function preloadCriticalEntryAssets(urls = []) {
  if (!CLOUD_FAST_BOOT) return;
  const unique = [...new Set(urls.filter(Boolean))];
  if (!unique.length) return;
  setEntryStatus("浏览器正在预载首屏地图…", 46, `0/${unique.length}`);
  await warmImages(unique, (done, total) => {
    setEntryStatus("浏览器正在预载首屏地图…", progressBetween(46, 72, done, total), `${done}/${total}`);
  });
}

function imageRecord(url) {
  if (!url) return null;
  if (state.images.has(url)) return state.images.get(url);

  const image = new Image();
  const record = {
    image,
    ready: false,
    error: false,
    promise: null,
  };

  record.promise = new Promise((resolve) => {
    let settled = false;
    const finish = (error = false) => {
      if (settled) return;
      settled = true;
      record.ready = !error;
      record.error = error;
      resolve(record);
    };

    image.onload = () => {
      if (typeof image.decode === "function") {
        image.decode().then(() => finish(false), () => finish(false));
        return;
      }
      finish(false);
    };
    image.onerror = () => finish(true);
  });

  image.decoding = "async";
  image.loading = "eager";
  image.src = url;
  state.images.set(url, record);
  return record;
}

async function warmImages(urls, onProgress) {
  const unique = [...new Set(urls.filter(Boolean))];
  let cursor = 0;
  let done = 0;
  const notifyEvery = Math.max(1, Math.ceil(unique.length / 160));

  async function worker() {
    while (cursor < unique.length) {
      const index = cursor;
      cursor += 1;
      await imageRecord(unique[index])?.promise;
      done += 1;
      if (onProgress && (done === unique.length || done % notifyEvery === 0)) {
        onProgress(done, unique.length);
      }
    }
  }

  const count = Math.min(IMAGE_CONCURRENCY, unique.length || 1);
  await Promise.all(Array.from({ length: count }, worker));
}

function releaseImages(urls) {
  for (const url of urls) {
    const record = state.images.get(url);
    if (!record) continue;
    record.image.onload = null;
    record.image.onerror = null;
    record.image.removeAttribute("src");
    state.images.delete(url);
  }
}

function spriteUrls(sprite) {
  return (sprite?.manifest?.frames || []).map((frame) => frame.url);
}

function sceneStaticUrls(render) {
  const urls = [];
  for (const tile of render.scene?.tiles || []) urls.push(tile.url);
  for (const mask of render.scene?.masks || []) urls.push(mask.url);
  return urls;
}

function npcSpriteUrls(render) {
  const urls = [];
  for (const sprite of Object.values(render.npcSprites || {})) urls.push(...spriteUrls(sprite));
  return urls;
}

function chunkItemUrls(chunk) {
  return (chunk?.items || []).map((item) => item.url).filter(Boolean);
}

function chunkJobsInRect(layers, rect) {
  if (!layers) return [];
  const minCol = Math.max(0, Math.floor(rect.left / CHUNK_WIDTH));
  const maxCol = Math.min(layers.cols - 1, Math.floor(rect.right / CHUNK_WIDTH));
  const minRow = Math.max(0, Math.floor(rect.top / CHUNK_HEIGHT));
  const maxRow = Math.min(layers.rows - 1, Math.floor(rect.bottom / CHUNK_HEIGHT));
  const jobs = [];
  for (let row = minRow; row <= maxRow; row += 1) {
    for (let col = minCol; col <= maxCol; col += 1) {
      const index = row * layers.cols + col;
      if (layers.base[index]) jobs.push({ chunk: layers.base[index], type: "base" });
      if (layers.masks[index]?.items?.length) jobs.push({ chunk: layers.masks[index], type: "mask" });
    }
  }
  return jobs;
}

function initialSceneChunkJobs(layers) {
  const viewWidth = state.view.width || 1280;
  const viewHeight = state.view.height || 720;
  const pos = state.role?.position || { x: 5000, y: 3400 };
  const left = clampValue(pos.x - viewWidth / state.zoom / 2, 0, Math.max(0, layers.width - viewWidth / state.zoom));
  const top = clampValue(pos.y - viewHeight / state.zoom / 2, 0, Math.max(0, layers.height - viewHeight / state.zoom));
  const pad = 32;
  return chunkJobsInRect(layers, {
    left: left - pad,
    top: top - pad,
    right: left + viewWidth / state.zoom + pad,
    bottom: top + viewHeight / state.zoom + pad,
  });
}

async function composeChunkJobs(jobs, onProgress) {
  const uniqueJobs = [];
  const seen = new Set();
  for (const job of jobs) {
    if (!job.chunk || job.chunk.canvas) continue;
    const key = `${job.type}:${job.chunk.x}:${job.chunk.y}`;
    if (seen.has(key)) continue;
    seen.add(key);
    uniqueJobs.push(job);
  }
  for (let index = 0; index < uniqueJobs.length; index += 1) {
    const job = uniqueJobs[index];
    const urls = chunkItemUrls(job.chunk);
    if (urls.length) await warmImages(urls);
    renderChunk(job.chunk, job.type);
    releaseImages(urls);
    if (job.type === "base") await gpuBaseLayer.uploadChunks([job.chunk]);
    if (job.type === "mask") await gpuMaskLayer.uploadChunks([job.chunk]);
    if (onProgress) onProgress(index + 1, uniqueJobs.length);
    if ((index + 1) % 2 === 0) await nextIdleFrame();
  }
}

function scheduleSceneBackgroundWarmup(layers) {
  if (!CLOUD_FAST_BOOT || state.sceneWarmup.running || state.sceneWarmup.complete || !layers) return;
  state.sceneWarmup.running = true;
  window.setTimeout(async () => {
    try {
      const jobs = [
        ...layers.base.map((chunk) => ({ chunk, type: "base" })),
        ...layers.masks.filter((chunk) => chunk.items.length).map((chunk) => ({ chunk, type: "mask" })),
      ];
      const batchSize = 10;
      for (let index = 0; index < jobs.length; index += batchSize) {
        await composeChunkJobs(jobs.slice(index, index + batchSize));
        await nextIdleFrame();
      }
      state.sceneWarmup.complete = true;
    } catch {
      // Background warmup is optional; visible chunks continue to load on demand.
    } finally {
      state.sceneWarmup.running = false;
    }
  }, 500);
}

async function warmVisibleSceneNow() {
  if (!CLOUD_FAST_BOOT || !state.layers?.ready || state.sceneWarmup.visibleRunning) return;
  state.sceneWarmup.visibleRunning = true;
  try {
    const jobs = chunkJobsInRect(state.layers, visibleWorldRect(STATIC_DRAW_PAD));
    await composeChunkJobs(jobs);
  } catch {
    // Visible warmup is best-effort; the canvas fallback will keep retrying.
  } finally {
    state.sceneWarmup.visibleRunning = false;
  }
}

function markResizeDirty() {
  state.resizeDirty = true;
  invalidatePanCache();
}

function createGpuTileRenderer(targetCanvas, options = {}) {
  const gl =
    targetCanvas.getContext("webgl2", {
      alpha: options.alpha !== false,
      antialias: false,
      depth: false,
      stencil: false,
      preserveDrawingBuffer: false,
      powerPreference: "high-performance",
    }) ||
    targetCanvas.getContext("webgl", {
      alpha: options.alpha !== false,
      antialias: false,
      depth: false,
      stencil: false,
      preserveDrawingBuffer: false,
      powerPreference: "high-performance",
    });

  if (!gl) {
    targetCanvas.hidden = true;
    return { ok: false, draw: () => false, uploadChunks: async () => {}, resize: () => {}, clear: () => {} };
  }

  const vertexSource = `
    attribute vec2 a_position;
    attribute vec2 a_texcoord;
    uniform vec2 u_camera;
    uniform vec2 u_resolution;
    uniform float u_zoom;
    varying vec2 v_texcoord;
    void main() {
      vec2 screen = (a_position - u_camera) * u_zoom;
      vec2 clip = (screen / u_resolution) * 2.0 - 1.0;
      gl_Position = vec4(clip.x, -clip.y, 0.0, 1.0);
      v_texcoord = a_texcoord;
    }
  `;
  const fragmentSource = `
    precision mediump float;
    uniform sampler2D u_texture;
    varying vec2 v_texcoord;
    void main() {
      gl_FragColor = texture2D(u_texture, v_texcoord);
    }
  `;

  function shader(type, source) {
    const item = gl.createShader(type);
    gl.shaderSource(item, source);
    gl.compileShader(item);
    if (!gl.getShaderParameter(item, gl.COMPILE_STATUS)) {
      throw new Error(gl.getShaderInfoLog(item) || "shader compile failed");
    }
    return item;
  }

  let program;
  try {
    program = gl.createProgram();
    gl.attachShader(program, shader(gl.VERTEX_SHADER, vertexSource));
    gl.attachShader(program, shader(gl.FRAGMENT_SHADER, fragmentSource));
    gl.linkProgram(program);
    if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
      throw new Error(gl.getProgramInfoLog(program) || "program link failed");
    }
  } catch {
    targetCanvas.hidden = true;
    return { ok: false, draw: () => false, uploadChunks: async () => {}, resize: () => {}, clear: () => {} };
  }

  const textures = new WeakMap();
  const chunkRecords = new WeakMap();
  const failedSources = new WeakSet();
  const clearColor = options.clearColor || [0, 0, 0, 0];
  const locations = {
    position: gl.getAttribLocation(program, "a_position"),
    texcoord: gl.getAttribLocation(program, "a_texcoord"),
    camera: gl.getUniformLocation(program, "u_camera"),
    resolution: gl.getUniformLocation(program, "u_resolution"),
    zoom: gl.getUniformLocation(program, "u_zoom"),
    texture: gl.getUniformLocation(program, "u_texture"),
  };
  let lost = false;
  let viewportWidth = 0;
  let viewportHeight = 0;
  let cssWidth = 0;
  let cssHeight = 0;

  targetCanvas.addEventListener("webglcontextlost", (event) => {
    event.preventDefault();
    lost = true;
  });

  function resize(width, height, dpr = 1) {
    const pixelWidth = Math.max(1, Math.floor(width * dpr));
    const pixelHeight = Math.max(1, Math.floor(height * dpr));
    if (targetCanvas.width !== pixelWidth || targetCanvas.height !== pixelHeight) {
      targetCanvas.width = pixelWidth;
      targetCanvas.height = pixelHeight;
    }
    if (cssWidth !== width || cssHeight !== height) {
      cssWidth = width;
      cssHeight = height;
      targetCanvas.style.width = `${width}px`;
      targetCanvas.style.height = `${height}px`;
      targetCanvas.style.transform = "none";
    }
    targetCanvas.hidden = false;
    if (viewportWidth !== pixelWidth || viewportHeight !== pixelHeight) {
      viewportWidth = pixelWidth;
      viewportHeight = pixelHeight;
      gl.viewport(0, 0, pixelWidth, pixelHeight);
    }
  }

  function clear(width, height, dpr = 1) {
    if (lost) return;
    resize(width, height, dpr);
    gl.clearColor(clearColor[0], clearColor[1], clearColor[2], clearColor[3]);
    gl.clear(gl.COLOR_BUFFER_BIT);
  }

  function textureFor(source) {
    if (!source) return null;
    if (failedSources.has(source)) return null;
    if (textures.has(source)) return textures.get(source);

    const texture = gl.createTexture();
    gl.bindTexture(gl.TEXTURE_2D, texture);
    gl.pixelStorei(gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL, false);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    try {
      gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, source);
    } catch {
      gl.deleteTexture(texture);
      failedSources.add(source);
      return null;
    }
    textures.set(source, texture);
    return texture;
  }

  function recordForChunk(chunk) {
    if (!chunk?.canvas) return null;
    const texture = textureFor(chunk.canvas);
    if (!texture) return null;
    if (chunkRecords.has(chunk)) return chunkRecords.get(chunk);

    const x0 = chunk.x;
    const y0 = chunk.y;
    const x1 = chunk.x + chunk.width;
    const y1 = chunk.y + chunk.height;
    const vertices = new Float32Array([x0, y0, 0, 0, x1, y0, 1, 0, x0, y1, 0, 1, x0, y1, 0, 1, x1, y0, 1, 0, x1, y1, 1, 1]);
    const buffer = gl.createBuffer();
    gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
    gl.bufferData(gl.ARRAY_BUFFER, vertices, gl.STATIC_DRAW);
    const record = { texture, buffer };
    chunkRecords.set(chunk, record);
    return record;
  }

  function drawChunk(chunk, camera, zoom, view) {
    const record = recordForChunk(chunk);
    if (!record) return false;

    gl.bindTexture(gl.TEXTURE_2D, record.texture);
    gl.bindBuffer(gl.ARRAY_BUFFER, record.buffer);
    gl.vertexAttribPointer(locations.position, 2, gl.FLOAT, false, 16, 0);
    gl.vertexAttribPointer(locations.texcoord, 2, gl.FLOAT, false, 16, 8);
    gl.drawArrays(gl.TRIANGLES, 0, 6);
    return true;
  }

  function draw(chunks, camera, zoom, view) {
    if (lost || !chunks?.length || !view?.width || !view?.height) return false;
    resize(view.width, view.height, STATIC_LAYER_DPR);
    gl.clearColor(clearColor[0], clearColor[1], clearColor[2], clearColor[3]);
    gl.clear(gl.COLOR_BUFFER_BIT);
    gl.useProgram(program);
    gl.enableVertexAttribArray(locations.position);
    gl.enableVertexAttribArray(locations.texcoord);
    gl.uniform2f(locations.camera, camera.x, camera.y);
    gl.uniform2f(locations.resolution, view.width, view.height);
    gl.uniform1f(locations.zoom, zoom);
    gl.uniform1i(locations.texture, 0);
    gl.activeTexture(gl.TEXTURE0);

    if (options.alpha === false) {
      gl.disable(gl.BLEND);
    } else {
      gl.enable(gl.BLEND);
      gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    }

    const pad = 96 / Math.max(0.1, zoom);
    const left = camera.x - pad;
    const top = camera.y - pad;
    const right = camera.x + view.width / zoom + pad;
    const bottom = camera.y + view.height / zoom + pad;

    let drawn = 0;
    for (const chunk of chunks) {
      if (!chunk?.canvas) continue;
      if (chunk.x > right || chunk.y > bottom || chunk.x + chunk.width < left || chunk.y + chunk.height < top) continue;
      if (drawChunk(chunk, camera, zoom, view)) drawn += 1;
    }
    return options.alpha === false ? drawn > 0 : true;
  }

  async function uploadChunks(chunks) {
    if (lost || !chunks?.length) return;
    let done = 0;
    for (const chunk of chunks) {
      if (chunk?.canvas) recordForChunk(chunk);
      done += 1;
      if (done % 12 === 0) await nextIdleFrame();
    }
  }

  return { ok: true, draw, uploadChunks, resize, clear };
}

function viewportSize() {
  const visual = window.visualViewport;
  const width = visual?.width || window.innerWidth || document.documentElement.clientWidth || 1;
  const height = visual?.height || window.innerHeight || document.documentElement.clientHeight || 1;
  return {
    width: Math.max(1, Math.round(width)),
    height: Math.max(1, Math.round(height)),
  };
}

function resizeCanvas() {
  const viewport = viewportSize();
  const dpr = Math.min(MAX_DEVICE_PIXEL_RATIO, Math.max(1, window.devicePixelRatio || 1));
  const width = viewport.width;
  const height = viewport.height;
  const pixelWidth = Math.floor(width * dpr);
  const pixelHeight = Math.floor(height * dpr);

  if (canvas.width !== pixelWidth || canvas.height !== pixelHeight) {
    canvas.width = pixelWidth;
    canvas.height = pixelHeight;
  }

  state.view = { width, height, dpr };
  ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
  ctx.imageSmoothingEnabled = false;
  for (const layer of [sceneCanvas, canvas, maskCanvas]) {
    layer.style.width = `${width}px`;
    layer.style.height = `${height}px`;
  }
  if (els.game) {
    els.game.style.width = `${width}px`;
    els.game.style.height = `${height}px`;
  }
  gpuBaseLayer.resize(width, height, STATIC_LAYER_DPR);
  gpuMaskLayer.resize(width, height, STATIC_LAYER_DPR);
  state.resizeDirty = false;
}

function ensureCanvasSize() {
  if (state.resizeDirty) {
    resizeCanvas();
    clampCamera();
    syncCameraRender();
  }
}

function currentCamera() {
  const x = Number.isFinite(state.camera.renderX) ? state.camera.renderX : state.camera.x;
  const y = Number.isFinite(state.camera.renderY) ? state.camera.renderY : state.camera.y;
  return { x, y };
}

function worldToScreen(x, y) {
  const camera = currentCamera();
  return { x: (x - camera.x) * state.zoom, y: (y - camera.y) * state.zoom };
}

function screenToWorld(x, y) {
  const camera = currentCamera();
  return { x: x / state.zoom + camera.x, y: y / state.zoom + camera.y };
}

function expAlpha(rate, delta) {
  return 1 - Math.exp(-rate * Math.max(0, delta));
}

function clampValue(value, min, max) {
  return Math.max(min, Math.min(max, value));
}

function vectorLength(x, y) {
  return Math.hypot(x || 0, y || 0);
}

function limitVector(x, y, maxLength) {
  const length = vectorLength(x, y);
  if (!length || length <= maxLength) return { x, y };
  const scale = maxLength / length;
  return { x: x * scale, y: y * scale };
}

function cameraBounds() {
  const bounds = state.scene?.map?.bounds;
  if (!bounds || !state.view.width) return null;
  const maxX = Math.max(0, bounds.width - state.view.width / state.zoom);
  const maxY = Math.max(0, bounds.height - state.view.height / state.zoom);
  return { maxX, maxY };
}

function clampCameraPoint(x, y) {
  const bounds = cameraBounds();
  if (!bounds) return { x, y };
  return {
    x: clampValue(Number.isFinite(x) ? x : 0, 0, bounds.maxX),
    y: clampValue(Number.isFinite(y) ? y : 0, 0, bounds.maxY),
  };
}

function cameraSnapStep() {
  const dpr = Math.max(1, state.view.dpr || 1);
  const zoom = Math.max(0.001, state.zoom || 1);
  return Math.max(CAMERA_SNAP_MIN_STEP, 1 / (zoom * dpr));
}

function syncCameraRender() {
  const step = cameraSnapStep();
  const snapped = clampCameraPoint(Math.round(state.camera.x / step) * step, Math.round(state.camera.y / step) * step);
  state.camera.renderX = snapped.x;
  state.camera.renderY = snapped.y;
}

function setCameraPosition(x, y, options = {}) {
  const point = clampCameraPoint(x, y);
  state.camera.x = point.x;
  state.camera.y = point.y;
  state.camera.targetX = point.x;
  state.camera.targetY = point.y;
  state.camera.velocityX = 0;
  state.camera.velocityY = 0;
  syncCameraRender();
  if (options.manualHold) state.camera.manualUntil = performance.now() + options.manualHold;
}

function queueCameraPan(dx, dy) {
  state.pointer.pendingDx += dx;
  state.pointer.pendingDy += dy;
}

function applyPendingCameraPan() {
  const dx = state.pointer.pendingDx || 0;
  const dy = state.pointer.pendingDy || 0;
  if (!dx && !dy) return;
  state.pointer.pendingDx = 0;
  state.pointer.pendingDy = 0;
  const camera = currentCamera();
  setCameraPosition(camera.x - dx / state.zoom, camera.y - dy / state.zoom, { manualHold: CAMERA_MANUAL_HOLD_MS });
}

function clampCamera() {
  const bounds = cameraBounds();
  if (!bounds) return;
  state.camera.x = clampValue(state.camera.x, 0, bounds.maxX);
  state.camera.y = clampValue(state.camera.y, 0, bounds.maxY);
  state.camera.targetX = clampValue(state.camera.targetX, 0, bounds.maxX);
  state.camera.targetY = clampValue(state.camera.targetY, 0, bounds.maxY);
  state.camera.renderX = clampValue(state.camera.renderX, 0, bounds.maxX);
  state.camera.renderY = clampValue(state.camera.renderY, 0, bounds.maxY);
}

function roleVisualPosition() {
  if (!state.role) return null;
  const x = Number.isFinite(state.move.renderX) ? state.move.renderX : state.role.position.x;
  const y = Number.isFinite(state.move.renderY) ? state.move.renderY : state.role.position.y;
  return { x, y };
}

function centerCamera(immediate = false) {
  if (!state.role || !state.view.width) return;
  const pos = roleVisualPosition() || state.role.position;
  const target = clampCameraPoint(
    pos.x - state.view.width / state.zoom / 2,
    pos.y - state.view.height / state.zoom / 2
  );
  state.camera.targetX = target.x;
  state.camera.targetY = target.y;
  if (immediate) {
    setCameraPosition(target.x, target.y);
  }
}

function setMapZoom(nextZoom, anchorX = state.view.width / 2, anchorY = state.view.height / 2) {
  if (!state.view.width || !state.view.height) return;
  const before = screenToWorld(anchorX, anchorY);
  state.zoom = Math.round(clampValue(nextZoom, MAP_ZOOM_MIN, MAP_ZOOM_MAX) * 1000) / 1000;
  invalidatePanCache();
  const after = screenToWorld(anchorX, anchorY);
  const camera = currentCamera();
  setCameraPosition(camera.x + before.x - after.x, camera.y + before.y - after.y, { manualHold: CAMERA_MANUAL_HOLD_MS });
}

function zoomMapBy(delta) {
  setMapZoom(state.zoom + delta);
}

function panMapBy(screenDx, screenDy) {
  const camera = currentCamera();
  setCameraPosition(camera.x + screenDx / state.zoom, camera.y + screenDy / state.zoom, { manualHold: CAMERA_MANUAL_HOLD_MS });
}

function centerMapOnRole() {
  centerCamera(true);
  state.camera.manualUntil = performance.now() + CAMERA_MANUAL_HOLD_MS;
}

function smoothDamp(current, target, velocity, smoothTime, maxSpeed, delta) {
  const dt = Math.max(0, delta);
  if (!dt) return { value: current, velocity };
  const time = Math.max(0.001, smoothTime);
  const omega = 2 / time;
  const x = omega * dt;
  const exp = 1 / (1 + x + 0.48 * x * x + 0.235 * x * x * x);
  const originalTarget = target;
  const maxChange = Math.max(1, maxSpeed) * time;
  let change = clampValue(current - target, -maxChange, maxChange);
  target = current - change;
  const temp = (velocity + omega * change) * dt;
  let nextVelocity = (velocity - omega * temp) * exp;
  let output = target + (change + temp) * exp;

  if ((originalTarget - current > 0) === (output > originalTarget)) {
    output = originalTarget;
    nextVelocity = 0;
  }

  return { value: output, velocity: nextVelocity };
}

function updateCamera(delta) {
  if (!state.role || !state.view.width) return;
  const nextX = smoothDamp(state.camera.x, state.camera.targetX, state.camera.velocityX, CAMERA_SMOOTH_TIME, CAMERA_MAX_SPEED, delta);
  const nextY = smoothDamp(state.camera.y, state.camera.targetY, state.camera.velocityY, CAMERA_SMOOTH_TIME, CAMERA_MAX_SPEED, delta);
  state.camera.x = nextX.value;
  state.camera.y = nextY.value;
  state.camera.velocityX = nextX.velocity;
  state.camera.velocityY = nextY.velocity;
  clampCamera();
  syncCameraRender();
}

function npcWorld(npc) {
  if (Number.isFinite(npc._wx) && Number.isFinite(npc._wy)) return { x: npc._wx, y: npc._wy };
  return { x: Number(npc.x || 0) * TILE_SCALE, y: Number(npc.y || 0) * TILE_SCALE };
}

function pointWorld(point) {
  return { x: Number(point.x || 0) * TILE_SCALE, y: Number(point.y || 0) * TILE_SCALE };
}

function visibleWorldRect(pad = 180) {
  const scaledPad = pad / state.zoom;
  const camera = currentCamera();
  return {
    left: camera.x - scaledPad,
    top: camera.y - scaledPad,
    right: camera.x + state.view.width / state.zoom + scaledPad,
    bottom: camera.y + state.view.height / state.zoom + scaledPad,
  };
}

function isPointVisibleWorld(x, y, pad = 180) {
  const rect = visibleWorldRect(pad);
  return x >= rect.left && y >= rect.top && x <= rect.right && y <= rect.bottom;
}

function prepareWorldData(scene) {
  for (const npc of scene?.npcs || []) {
    npc._wx = Number(npc.x || 0) * TILE_SCALE;
    npc._wy = Number(npc.y || 0) * TILE_SCALE;
    npc._sortY = npc._wy;
    npc._idString = String(npc.id);
  }
}

function npcHasReadySprite(npc) {
  const sprite = state.render?.npcSprites?.[npc.id];
  const frames = sprite?.manifest?.frames || [];
  if (!frames.length) return false;
  if (CLOUD_FAST_BOOT) return true;
  return frames.some((frame) => {
    const record = state.images.get(frame.url);
    return record?.ready && !record.error;
  });
}

function filterUnavailableNpcs() {
  if (!state.scene?.npcs || !state.render?.npcSprites) return;
  const before = state.scene.npcs.length;
  state.scene.npcs = state.scene.npcs.filter((npc) => npcHasReadySprite(npc));
  state.removedNpcCount = before - state.scene.npcs.length;
  prepareWorldData(state.scene);

  if (state.selectedNpc && !state.scene.npcs.some((npc) => npc._idString === String(state.selectedNpc.id))) {
    state.selectedNpc = null;
  }
}

function marketInventoryCount(item) {
  return Number(state.market.inventory[item] || 0);
}

function addMarketItem(item, count = 1) {
  state.market.inventory[item] = Math.max(0, marketInventoryCount(item) + count);
  if (!state.market.inventory[item]) delete state.market.inventory[item];
}

function marketProfileForNpc(npc) {
  return state.market.profilesByNpcId.get(String(npc?.id));
}

function displayNpcName(npc) {
  return marketProfileForNpc(npc)?.name || npc?.name || "";
}

function marketAreaByKey(key) {
  return MARKET_AREAS.find((area) => area.key === key) || null;
}

function marketCoreProfileByKey(key) {
  return [...state.market.profilesByNpcId.values()].find((profile) => profile.key === key) || CORE_MARKET_PROFILES.find((profile) => profile.key === key) || null;
}

function clampMarketValue(value, min, max) {
  return Math.max(min, Math.min(max, Number(value) || 0));
}

function stableMarketHash(value) {
  const text = String(value || "");
  let hash = 2166136261;
  for (let index = 0; index < text.length; index += 1) {
    hash ^= text.charCodeAt(index);
    hash = Math.imul(hash, 16777619);
  }
  return hash >>> 0;
}

function dailyMarketDateKey(date = new Date()) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  return `${year}-${month}-${day}`;
}

function createDailyMarket(date = new Date()) {
  const dateKey = dailyMarketDateKey(date);
  const items = {};
  MARKET_PRICE_ITEMS.forEach((item) => {
    const roll = stableMarketHash(`${dateKey}:${item}`);
    items[item] = DAILY_MARKET_TRENDS[roll % DAILY_MARKET_TRENDS.length];
  });
  const areas = {};
  MARKET_AREAS.forEach((area) => {
    const buyRoll = stableMarketHash(`${dateKey}:${area.key}:buy`) % 9;
    const sellRoll = stableMarketHash(`${dateKey}:${area.key}:sell`) % 9;
    const buy = 0.92 + buyRoll * 0.025;
    const sell = 0.92 + sellRoll * 0.025;
    areas[area.key] = {
      name: area.name,
      buy: Number(buy.toFixed(3)),
      sell: Number(sell.toFixed(3)),
      note: buy < 0.98 ? "买入便宜" : sell > 1.04 ? "收货价高" : "价差平稳",
    };
  });
  const headlines = MARKET_PRICE_ITEMS.map((item) => ({ item, ...items[item] }))
    .filter((item) => item.key !== "steady")
    .sort((a, b) => Math.abs(b.multiplier - 1) - Math.abs(a.multiplier - 1))
    .slice(0, 5);
  return { dateKey, items, areas, headlines };
}

function currentDailyMarket() {
  if (!state.market.dailyMarket || state.market.dailyMarket.dateKey !== dailyMarketDateKey()) {
    state.market.dailyMarket = createDailyMarket();
  }
  return state.market.dailyMarket;
}

function createMarketOrders(date = new Date()) {
  const dateKey = dailyMarketDateKey(date);
  return MARKET_ORDER_TEMPLATES.map((template, index) => {
    const roll = stableMarketHash(`${dateKey}:order:${template.id}`);
    const bonus = roll % 5;
    const trend = marketTrendForItem(template.want);
    return {
      ...template,
      reward: Math.max(1, Math.round((template.reward + bonus) * trend.multiplier)),
      completed: false,
      hot: trend.key === "surge" || trend.key === "warm",
      label: trend.label,
      sort: index,
    };
  }).sort((a, b) => Number(b.hot) - Number(a.hot) || b.reward - a.reward);
}

function createAuctionState(index = 0) {
  const daily = currentDailyMarket();
  const seed = stableMarketHash(`${daily.dateKey}:auction:${index}`);
  const item = AUCTION_ITEMS[index % AUCTION_ITEMS.length];
  const trend = marketTrendForItem(item.item);
  const base = Math.max(1, Math.round((item.base + (seed % 4)) * trend.multiplier));
  return {
    index,
    item: item.item,
    sourceKey: item.sourceKey,
    auctioneer: item.auctioneer,
    pitch: item.pitch,
    base,
    buyout: Math.max(base + 4, Math.round(item.buyout * trend.multiplier)),
    npcBid: base,
    playerBid: 0,
    rounds: 0,
    closed: false,
    winner: "",
    trendLabel: trend.label,
  };
}

function marketTrendForItem(item) {
  return currentDailyMarket().items[item] || DAILY_MARKET_TRENDS.find((trend) => trend.key === "steady");
}

function marketAreaRate(areaKey) {
  const daily = currentDailyMarket();
  const area = marketAreaByKey(areaKey) || marketAreaByKey("trade") || MARKET_AREAS[0];
  return daily.areas[area.key] || { name: area.name, buy: 1, sell: 1, note: "价差平稳" };
}

function marketAreaAffinity(areaKey, item, kind) {
  const favorites = MARKET_AREA_AFFINITY[areaKey] || [];
  if (favorites.includes(item)) return kind === "sell" ? 1.08 : 0.96;
  return 1;
}

function marketPriceForOffer(profile, offer, kind = "buy") {
  const base = Math.max(1, Math.round(Number(offer?.price) || 1));
  const areaKey = profile?.areaKey || profile?.key || "trade";
  const trend = marketTrendForItem(offer?.item);
  const area = marketAreaRate(areaKey);
  const areaRate = kind === "sell" ? area.sell : area.buy;
  const affinity = marketAreaAffinity(areaKey, offer?.item, kind);
  const price = Math.max(1, Math.round(base * trend.multiplier * areaRate * affinity));
  return {
    base,
    price,
    delta: price - base,
    kind,
    item: offer?.item || "",
    trend,
    area,
    areaKey,
    areaName: area.name,
    affinity,
  };
}

function marketPriceDeltaText(quote) {
  if (!quote?.delta) return "常价";
  return `${quote.delta > 0 ? "+" : ""}${quote.delta}`;
}

function marketPriceButtonSuffix(quote) {
  if (!quote || quote.delta === 0) return `（${quote.trend.label}）`;
  return `（${quote.trend.label} ${marketPriceDeltaText(quote)}）`;
}

function marketPriceDetailText(quote) {
  const action = quote.kind === "sell" ? "卖出" : "买入";
  const areaRate = quote.kind === "sell" ? quote.area.sell : quote.area.buy;
  const affinity = quote.affinity !== 1 ? "，本地偏好再修正" : "";
  return `今日「${quote.item}」${quote.trend.label}，${quote.areaName}${action}价 ${Math.round(areaRate * 100)}%${affinity}`;
}

function marketRouteRecommendations() {
  const comfort = marketCoreProfileByKey("comfort");
  const trade = marketCoreProfileByKey("trade");
  const network = marketCoreProfileByKey("network");
  const stall = marketCoreProfileByKey("stall");
  const routes = [];
  if (comfort && trade) {
    const buyIndex = (comfort.sells || []).findIndex((offer) => offer.item === "安心香");
    const sellIndex = (trade.buys || []).findIndex((offer) => offer.item === "安心香");
    if (buyIndex >= 0 && sellIndex >= 0) {
      const buyOffer = comfort.sells[buyIndex];
      const sellOffer = trade.buys[sellIndex];
      const buyQuote = marketPriceForOffer(comfort, buyOffer, "buy");
      const sellQuote = marketPriceForOffer(trade, sellOffer, "sell");
      routes.push({
        id: "aroma-flip",
        title: "安心香转手",
        item: "安心香",
        buyKey: "comfort",
        sellKey: "trade",
        buyName: comfort.name,
        sellName: trade.name,
        buyArea: comfort.area,
        sellArea: trade.area,
        buyPrice: buyQuote.price,
        sellPrice: sellQuote.price,
        profit: sellQuote.price - buyQuote.price,
        note: "先在问心巷买入安心香，再到心货行卖给铁算盘秦，最直观展示买低卖高。",
      });
    }
  }
  if (network) {
    const storyOffer = (network.buys || []).find((offer) => offer.item === "故事");
    if (storyOffer) {
      const quote = marketPriceForOffer(network, storyOffer, "sell");
      routes.push({
        id: "story-cash",
        title: "故事变现",
        item: "故事",
        buyKey: "",
        sellKey: "network",
        buyName: "入市问心帖",
        sellName: network.name,
        buyArea: "入市钱袋",
        sellArea: network.area,
        buyPrice: 0,
        sellPrice: quote.price,
        profit: quote.price,
        note: "若你入市时带着故事，可以直接卖给桥三娘，快速理解“我也有货可卖”。",
      });
    }
  }
  if (stall) {
    const receiptOffer = (stall.buys || []).find((offer) => offer.item === "成交记录");
    if (receiptOffer) {
      const quote = marketPriceForOffer(stall, receiptOffer, "sell");
      routes.push({
        id: "stall-receipt",
        title: "小摊账本",
        item: "成交记录",
        buyKey: "stall",
        sellKey: "stall",
        buyName: "我的小摊",
        sellName: stall.name,
        buyArea: "开摊经营",
        sellArea: stall.area,
        buyPrice: 0,
        sellPrice: quote.price,
        profit: quote.price,
        note: "完成小摊成交后，成交记录本身也能卖给阿衡，强化“经验也是货”。",
      });
    }
  }
  return routes.sort((a, b) => b.profit - a.profit);
}

function activeMarketCommission() {
  const route = marketRouteRecommendations().find((item) => item.id === "aroma-flip") || marketRouteRecommendations()[0];
  const completed = Boolean(state.market.commissions?.completed?.has(route?.id));
  const hasItem = route?.item ? marketInventoryCount(route.item) > 0 : false;
  const bought = Boolean(state.market.commissions?.routeFlags?.[`${route?.id}:bought`]);
  const stage = completed ? "completed" : hasItem || bought ? "sell" : "buy";
  return {
    ...route,
    completed,
    stage,
    reward: 8,
    status:
      stage === "completed"
        ? "已完成，称号已入图鉴。"
        : stage === "sell"
        ? `已拿到「${route.item}」，去${route.sellArea}卖给${route.sellName}。`
        : `先去${route.buyArea}找${route.buyName}买入「${route.item}」。`,
  };
}

function markMarketRouteBought(item) {
  const commission = activeMarketCommission();
  if (!commission?.id || commission.item !== item) return;
  state.market.commissions.routeFlags[`${commission.id}:bought`] = true;
}

function completeMarketCommission(id, result = "") {
  const commission = activeMarketCommission();
  const targetId = id || commission?.id;
  if (!targetId || state.market.commissions.completed.has(targetId)) return;
  state.market.commissions.completed.add(targetId);
  state.market.coins += commission.reward;
  improveMood(10, "完成今日行情委托");
  unlockAchievement("marketRunner");
  addMarketRecord({
    npc: "今日行情",
    action: "委托完成",
    item: commission.title,
    amount: commission.reward,
    result: result || `完成「${commission.item}」买低卖高路线，额外奖励 ${commission.reward} 心币。`,
  });
}

function stallReputationLabel(value = state.market.stall?.reputation || 0) {
  const score = clampMarketValue(value, 0, STALL_REPUTATION_MAX);
  if (score >= 80) return "名摊";
  if (score >= 55) return "熟摊";
  if (score >= 30) return "有口碑";
  return "新摊";
}

function setStallReputation(value) {
  state.market.stall.reputation = clampMarketValue(value, 0, STALL_REPUTATION_MAX);
}

function visitorPreferenceText(visitor) {
  if (!visitor) return "";
  const likes = [visitor.prefersPersonality, ...(visitor.likes || [])].filter(Boolean).join("、");
  const dislikes = (visitor.dislikes || []).filter(Boolean).join("、");
  return `偏好${likes || "不限"}${dislikes ? `，忌${dislikes}` : ""}`;
}

function stallMatchQuote(stall, visitor) {
  if (!stall || !visitor) return { score: 0, label: "未匹配", tone: "low", reasons: [] };
  const reasons = [];
  let score = 50;
  if (visitor.prefersPersonality === stall.personality) {
    score += 28;
    reasons.push("个性正中偏好");
  } else if ((visitor.likes || []).includes(stall.personality)) {
    score += 14;
    reasons.push("个性可接受");
  } else if ((visitor.dislikes || []).includes(stall.personality)) {
    score -= 22;
    reasons.push("个性不合");
  } else {
    reasons.push("个性普通");
  }
  if (visitor.product === stall.product) {
    score += 18;
    reasons.push("商品对口");
  }
  const trend = marketTrendForItem(stall.product);
  if (trend.multiplier >= 1.1) {
    score += 7;
    reasons.push("今日走俏");
  } else if (trend.multiplier <= 0.92) {
    score -= 6;
    reasons.push("今日偏冷");
  }
  score += Math.min(8, Math.floor((stall.reputation || 0) / 12));
  score = Math.round(clampMarketValue(score, 0, 100));
  const label = score >= 85 ? "绝佳" : score >= 70 ? "合拍" : score >= 55 ? "可谈" : "勉强";
  const tone = score >= 70 ? "high" : score >= 55 ? "mid" : "low";
  return { score, label, tone, reasons };
}

function stallVisitorQuote(stall, visitor) {
  const match = stallMatchQuote(stall, visitor);
  const trend = marketTrendForItem(stall?.product);
  const area = marketAreaRate("stall");
  const base = Math.max(1, Math.round(Number(visitor?.price) || 1));
  const scoreRate = 0.78 + match.score / 235;
  const reputationRate = 1 + Math.min(0.12, (stall?.reputation || 0) / 850);
  const price = Math.max(1, Math.round(base * trend.multiplier * area.sell * scoreRate * reputationRate));
  return {
    ...match,
    base,
    price,
    trend,
    area,
    delta: price - base,
    detail: `行情${trend.label}，匹配${match.score}/100，口碑${stall?.reputation || 0}`,
  };
}

function stallResponseQuote(stall, visitor, response) {
  const baseQuote = stallVisitorQuote(stall, visitor);
  const words = String(response || "").trim();
  const reasons = [];
  let delta = 0;
  if (words.length >= 8) {
    delta += 8;
    reasons.push("回应完整");
  }
  if (words.length >= 24) {
    delta += 6;
    reasons.push("表达有细节");
  }
  if (words.length > 70) {
    delta -= 4;
    reasons.push("略显冗长");
  }
  const productRules = {
    安慰: /慢|休息|没关系|陪|接住|先坐|不急|轻一点|睡/,
    批评: /行动|别逃|立刻|现在|截止|别绕|改|做|第一步/,
    建议: /第一步|先|然后|步骤|选择|计划|取舍|今天/,
    灵感: /火|开头|想象|画|写|点子|问题|灵感|试试/,
    签语: /今日|宜|忌|路|签|方向|灯|往/,
  };
  if (productRules[stall.product]?.test(words)) {
    delta += 10;
    reasons.push("话术贴合商品");
  }
  if (stall.personality === "温和" && /不急|慢|陪|没关系|先/.test(words)) {
    delta += 6;
    reasons.push("个性温和");
  } else if (stall.personality === "犀利" && /别|立刻|直接|别逃|清醒/.test(words)) {
    delta += 6;
    reasons.push("个性犀利");
  } else if (stall.personality === "理性" && /步骤|计划|先|再|如果|那么/.test(words)) {
    delta += 6;
    reasons.push("个性理性");
  } else if (stall.personality === "诗意" && /灯|风|雨|月|路|火|梦/.test(words)) {
    delta += 6;
    reasons.push("个性诗意");
  } else if (stall.personality === "玄学" && /签|今日|宜|缘|运|方向/.test(words)) {
    delta += 6;
    reasons.push("个性玄学");
  }
  const needRead = classifyPlayerWords(`${visitor?.need || ""} ${visitor?.line || ""}`);
  const replyRead = classifyPlayerWords(words);
  if (needRead.key !== "plain" && needRead.key === replyRead.key) {
    delta += 8;
    reasons.push("听懂来客心事");
  }
  if (!reasons.length) reasons.push("回应偏泛");
  const score = Math.round(clampMarketValue(baseQuote.score + delta, 0, 100));
  const price = Math.max(1, baseQuote.price + Math.round(delta / 3));
  const label = score >= 85 ? "惊喜成交" : score >= 70 ? "顺利成交" : score >= 55 ? "勉强成交" : "压价成交";
  return { ...baseQuote, response: words, responseDelta: delta, score, price, label, responseReasons: reasons };
}

function stallReputationDeltaForDeal(score) {
  if (score >= 85) return 4;
  if (score >= 70) return 3;
  if (score >= 55) return 1;
  return -1;
}

function npcForProfile(profile) {
  if (!profile?.npcId) return null;
  return (state.scene?.npcs || []).find((npc) => String(npc.id) === String(profile.npcId)) || null;
}

function unlockMarketArea(key) {
  const area = marketAreaByKey(key);
  if (!area || state.market.areas.has(area.key)) return;
  state.market.areas.add(area.key);
  if (state.market.areas.size >= 3) unlockAchievement("sceneWalker");
}

function marketNextGoal() {
  if (!state.market.entranceCompleted) return "主线：填写入市问心帖，领取入市钱袋";
  if (state.market.counters.sold <= 0) return `主线：先卖出「${state.market.mood || "今日一念"}」`;
  if (state.market.counters.bought <= 0) return "主线：在引导摊主处买入第一件心货，完成买卖闭环";
  if (!state.market.director?.exchangeSeen) return "展示：打开心市，看心情 K 线如何记录刚才的波动";
  if (!state.market.director?.dailySeen) return "展示：打开今日行情，看每日涨跌和场景价差";
  if (state.market.stall?.visitor) return "进阶：你的招牌前有客人在等，回小摊处理来客";
  if (state.market.stall?.signboard === "open" && state.market.counters.stallSales <= 0) return "进阶：招牌已挂出，等待第一位来客";
  if (state.market.counters.stallSales <= 0) return "进阶：到开摊司经营自己的小摊";
  if (state.market.counters.fortunes <= 0) return "进阶：去青云签台求一支今日签";
  if (state.market.counters.bought > 0 && state.market.counters.sold > 0 && !state.market.commissions?.completed?.has("aroma-flip")) {
    return "行情：试试「安心香」买低卖高";
  }
  return `探索：收集图鉴与场景（${state.market.codex.size}/${state.scene?.npcs?.length || 93}）`;
}

function matchEntranceChoice(text) {
  const value = String(text || "").trim();
  if (!value) return null;
  if (/拖|懒|推|ddl|截止|动不了|不想做|明天/.test(value)) return "delay";
  if (/累|疲|困|倦|睡|耗尽|没力|撑不住|麻木/.test(value)) return "tired";
  if (/迷|乱|方向|不知道|困惑|选择|未来|空/.test(value)) return "lost";
  if (/犹豫|纠结|焦虑|不安|担心|害怕|怕|摇摆|迟疑/.test(value)) return "hesitation";
  return "hesitation";
}

function npcModelName(npc) {
  return String(npc?.model || npc?.modelAsset?.name || "");
}

function npcMatchesRule(npc, rule) {
  const name = String(npc?.name || "");
  const model = npcModelName(npc);
  const nameOk = !rule.name || rule.name.test(name);
  const modelOk = !rule.model || rule.model.test(model);
  return nameOk && modelOk;
}

function pickCoreNpc(base, candidates, used) {
  const rules = CORE_NPC_MATCHERS[base.key] || [];
  for (const rule of rules) {
    const npc = candidates.find((item) => !used.has(String(item.id)) && npcMatchesRule(item, rule));
    if (npc) return npc;
  }
  return candidates.find((item) => !used.has(String(item.id))) || null;
}

function ordinaryMarketName(npc, archetype, index) {
  const original = String(npc?.name || "");
  if (/商人|货商|收购|鉴定|老财|财主|账房/.test(original)) return `${archetype.item}货郎·${original}`;
  if (/护卫|将军|衙役|统领|都尉/.test(original)) return `巡市${archetype.item}客·${original}`;
  if (/道人|仙人|巫医|使者|月老|袁/.test(original)) return `${archetype.item}问卦人·${original}`;
  if (/姑娘|夫人|婵娟|小芙|染色师/.test(original)) return `${archetype.item}摊娘·${original}`;
  const suffix = Math.floor(index / ORDINARY_MARKET_ARCHETYPES.length) ? Math.floor(index / ORDINARY_MARKET_ARCHETYPES.length) + 1 : "";
  return `${archetype.name}${suffix}`;
}

function stallSignText(personality = "温和", product = "安慰") {
  const endings = {
    安慰: "愿来者都能把话说轻一点",
    批评: "只剪烂枝，不伤树根",
    建议: "先给你一条能走的路",
    灵感: "空白也能点成火星",
    签语: "一签只点灯，不替人走路",
  };
  return `${personality}摊 · 卖${product}，${endings[product] || "愿来者带着答案离摊"}`;
}

function defaultStallState() {
  return {
    personality: "温和",
    product: "安慰",
    sign: stallSignText("温和", "安慰"),
    signboard: "closed",
    visitor: null,
    visitorTimer: null,
    nextVisitorAt: 0,
    visitorIndex: 0,
    reputation: 12,
  };
}

function clearStallVisitorTimer() {
  if (state.market.stall?.visitorTimer) {
    window.clearTimeout(state.market.stall.visitorTimer);
    state.market.stall.visitorTimer = null;
  }
  if (state.market.stall) state.market.stall.nextVisitorAt = 0;
}

function resetMarketSession() {
  clearStallVisitorTimer();
  state.market.initialized = true;
  state.market.coins = 0;
  state.market.mood = "未登记";
  state.market.moodScore = 0;
  state.market.title = "待入市";
  state.market.inventory = {};
  state.market.dailyMarket = createDailyMarket();
  state.market.moodCandles = [];
  state.market.orders = createMarketOrders();
  state.market.auction = createAuctionState();
  state.market.records = [];
  state.market.codex = new Set();
  state.market.achievements = new Set();
  state.market.counters = { bought: 0, sold: 0, fortunes: 0, referrals: 0, stallSales: 0 };
  state.market.lastFortune = "";
  state.market.stall = defaultStallState();
  state.market.profilesByNpcId = new Map();
  state.market.coreNpcByKey = new Map();
  state.market.areas = new Set();
  state.market.guideSeen = false;
  state.market.entranceCompleted = false;
  state.market.entranceChoice = "";
  state.market.pendingEntranceChoice = "";
  state.market.stallTutorialSeen = false;
  state.market.director = { exchangeSeen: false, dailySeen: false, completedAt: 0 };
  state.market.commissions = { completed: new Set(), routeFlags: {} };
  state.tutorial.dismissed = false;
  state.tutorial.stage = "entry";
  state.guidance = { npcId: "", label: "", startedAt: 0 };
  if (els.newbieGuide) els.newbieGuide.hidden = true;
}

function setupMarketWorld() {
  if (!state.scene?.npcs?.length) return;
  state.market.profilesByNpcId = new Map();
  state.market.coreNpcByKey = new Map();
  const origin = state.role?.position || { x: state.scene.map?.bounds?.width / 2 || 0, y: state.scene.map?.bounds?.height / 2 || 0 };
  const sorted = [...state.scene.npcs].sort((a, b) => {
    const da = Math.hypot((a._wx || 0) - origin.x, (a._wy || 0) - origin.y);
    const db = Math.hypot((b._wx || 0) - origin.x, (b._wy || 0) - origin.y);
    return da - db;
  });
  const used = new Set();

  CORE_MARKET_PROFILES.forEach((base) => {
    const npc = pickCoreNpc(base, sorted, used);
    if (!npc) return;
    used.add(String(npc.id));
    const profile = {
      ...base,
      areaKey: base.key,
      core: true,
      npcId: String(npc.id),
      originalName: npc.name,
      modelName: npcModelName(npc),
    };
    state.market.profilesByNpcId.set(String(npc.id), profile);
    state.market.coreNpcByKey.set(profile.key, npc);
    npc.name = profile.name;
  });

  sorted.filter((npc) => !used.has(String(npc.id))).forEach((npc, index) => {
    const archetype = ORDINARY_MARKET_ARCHETYPES[index % ORDINARY_MARKET_ARCHETYPES.length];
    const profile = {
      key: `ordinary-${npc.id}`,
      npcId: String(npc.id),
      core: false,
      areaKey: archetype.recommend,
      name: ordinaryMarketName(npc, archetype, index),
      title: "流动心货摊",
      area: "天元长街",
      personality: "市井、短谈、会指路",
      line: archetype.line,
      originalName: npc.name,
      modelName: npcModelName(npc),
      sells: [{ item: archetype.item, price: 4 + (index % 4), note: "普通摊主的小心货。" }],
      buys: [{ item: archetype.item, price: 5 + (index % 3), note: "把这份心事卖给他。" }],
      tags: ["路人", archetype.item, "引荐"],
      recommends: [archetype.recommend],
    };
    state.market.profilesByNpcId.set(String(npc.id), profile);
    npc.name = profile.name;
  });
}

function unlockMarketCodex(profile) {
  if (!profile) return;
  state.market.codex.add(profile.key);
  if (state.market.codex.size >= 5) unlockAchievement("collector");
}

function unlockAchievement(id) {
  if (!MARKET_ACHIEVEMENTS[id] || state.market.achievements.has(id)) return;
  state.market.achievements.add(id);
  state.market.title = MARKET_ACHIEVEMENTS[id].name;
  addMarketRecord({ action: "解锁称号", item: MARKET_ACHIEVEMENTS[id].name, amount: 0, result: MARKET_ACHIEVEMENTS[id].desc });
}

function addMarketRecord({ npc = "天元心市", action, item, amount = 0, result = "" }) {
  const sign = amount > 0 ? `+${amount}` : String(amount || 0);
  state.market.records.unshift({
    time: new Date().toLocaleTimeString("zh-CN", { hour: "2-digit", minute: "2-digit" }),
    npc,
    action,
    item,
    amount: sign,
    result,
  });
  state.market.records = state.market.records.slice(0, 30);
  renderMarketHud();
}

function checkMarketAchievements() {
  if (state.market.counters.bought > 0 && state.market.counters.sold > 0) unlockAchievement("firstTrade");
  if (state.market.counters.fortunes > 0) unlockAchievement("fortuneteller");
  if (state.market.counters.referrals >= 3) unlockAchievement("connector");
  if (state.market.counters.stallSales > 0) unlockAchievement("stallStarter");
}

function setHudProgress(node, text, complete) {
  if (!node) return;
  setText(node, text);
  node.classList.toggle("is-complete", Boolean(complete));
}

function ensureDirectorState() {
  if (!state.market.director) state.market.director = { exchangeSeen: false, dailySeen: false, completedAt: 0 };
  return state.market.director;
}

function directorSteps() {
  const director = ensureDirectorState();
  const choice = currentEntranceChoice();
  const guide = entranceGuideProfile(choice);
  const stall = state.market.stall || {};
  const stallDone = state.market.counters.stallSales > 0;
  return [
    {
      id: "enter",
      short: "入市",
      title: "领取入市钱袋",
      detail: "登记今日一念，拿到第一笔心币和心货。",
      complete: Boolean(state.market.entranceCompleted),
      action: "intent",
      cta: "打开问心帖",
    },
    {
      id: "sell",
      short: "卖出",
      title: `卖出「${state.market.mood || choice.item}」`,
      detail: `先找「${guide.name}」，把今日心事卖成心币。`,
      complete: state.market.counters.sold > 0,
      action: "guide",
      cta: `带我去${guide.name}`,
    },
    {
      id: "buy",
      short: "买入",
      title: "买入第一件心货",
      detail: "在同一位引导摊主处买回一件能改变心境的心货。",
      complete: state.market.counters.bought > 0,
      action: "guide",
      cta: `回到${guide.name}`,
    },
    {
      id: "exchange",
      short: "K线",
      title: "打开心市看走势",
      detail: "用心情 K 线把刚才的买卖反馈变成可见波动。",
      complete: Boolean(director.exchangeSeen),
      action: "exchange",
      cta: "打开心市",
    },
    {
      id: "daily",
      short: "行情",
      title: "查看今日行情",
      detail: "看同一件心货如何被每日涨跌和场景价差影响。",
      complete: Boolean(director.dailySeen),
      action: "daily",
      cta: "查看行情",
    },
    {
      id: "stall",
      short: "开摊",
      title: stallDone ? "完成第一位来客" : stall.visitor ? "接待第一位来客" : "挂出自己的招牌",
      detail: stallDone
        ? "前三分钟路线完成：情绪交易、行情、小摊表达都已跑通。"
        : stall.visitor
        ? "来客已在摊前，写一句回应即可看到匹配评分和口碑变化。"
        : "设置摊位个性和售卖内容，挂招牌后第一位客人立刻到。",
      complete: stallDone,
      action: "stall",
      cta: stall.visitor ? "接待来客" : stall.signboard === "open" ? "查看招牌" : "打开小摊",
    },
  ];
}

function currentDirectorStep() {
  const steps = directorSteps();
  const currentIndex = steps.findIndex((step) => !step.complete);
  const index = currentIndex < 0 ? steps.length - 1 : currentIndex;
  const completeCount = currentIndex < 0 ? steps.length : currentIndex;
  return { steps, current: steps[index], index, completeCount };
}

function updateDirectorPanel() {
  if (!els.directorPanel) return;
  if (!state.role) {
    els.directorPanel.hidden = true;
    return;
  }
  const director = ensureDirectorState();
  const { steps, current, index, completeCount } = currentDirectorStep();
  const progress = Math.round((completeCount / steps.length) * 100);
  if (completeCount >= steps.length && !director.completedAt) {
    director.completedAt = Date.now();
    spawnToast("三分钟路线完成", "stall");
  }
  els.directorPanel.innerHTML = `
    <button class="director-open" data-director-action="route" type="button">
      <span>
        <b>三分钟路线</b>
        <small>${completeCount}/${steps.length} · ${escapeHtml(completeCount >= steps.length ? "已跑通，可自由探索" : current.title)}</small>
      </span>
      <i aria-hidden="true"><em style="width:${progress}%"></em></i>
    </button>`;
  els.directorPanel.hidden = false;
}

function renderDirectorRoutePanel() {
  const { steps, current, index, completeCount } = currentDirectorStep();
  const progress = Math.round((completeCount / steps.length) * 100);
  const routeCards = steps
    .map((step, stepIndex) => {
      const classes = ["director-route-card"];
      if (step.complete) classes.push("is-complete");
      if (stepIndex === index && !step.complete) classes.push("is-current");
      const stateLabel = step.complete ? "已完成" : stepIndex === index ? "当前推荐" : "可稍后";
      const buttonLabel = step.complete ? "回看" : step.cta;
      return `<article class="${classes.join(" ")}">
        <span>${stepIndex + 1}</span>
        <div>
          <strong>${escapeHtml(step.title)}</strong>
          <small>${escapeHtml(step.detail)}</small>
          <button data-director-action="${escapeHtml(step.action)}" type="button">${escapeHtml(buttonLabel)}</button>
        </div>
        <em>${escapeHtml(stateLabel)}</em>
      </article>`;
    })
    .join("");
  marketPanel(
    "三分钟指引路线",
    `<section class="director-route-hero">
       <div>
         <span>推荐体验</span>
         <strong>${completeCount}/${steps.length} · ${escapeHtml(completeCount >= steps.length ? "路线已跑通" : current.title)}</strong>
         <small>${escapeHtml(completeCount >= steps.length ? "你已经看过核心玩法，可以继续自由探索。" : current.detail)}</small>
       </div>
       <i aria-hidden="true"><b style="width:${progress}%"></b></i>
       <button data-director-action="${escapeHtml(completeCount >= steps.length ? "exchange" : current.action)}" type="button">${escapeHtml(completeCount >= steps.length ? "回看心市" : current.cta)}</button>
     </section>
     <p class="market-muted">这条路线只是给评委和新手快速看懂作品。你可以按推荐顺序走，也可以点任意节点跳转；不想跟引导时，直接关闭面板继续逛长安。</p>
     <div class="director-route-list">${routeCards}</div>
     <div class="market-row">
       <button class="guide-secondary" data-market-action="close-panel" type="button">自由探索</button>
       <button class="guide-secondary" data-market-action="newbie" type="button">看操作指引</button>
     </div>`
  );
}

function clampMoodScore(value) {
  return Math.max(0, Math.min(100, Math.round(Number(value) || 0)));
}

function moodStage(score = state.market.moodScore) {
  const value = clampMoodScore(score);
  if (value < 25) return "阴云未散";
  if (value < 50) return "微光初起";
  if (value < 75) return "心绪转晴";
  if (value < 100) return "晴意渐满";
  return "心灯通明";
}

function recordMoodPoint(reason, before, after) {
  if (!Array.isArray(state.market.moodCandles)) state.market.moodCandles = [];
  const open = clampMoodScore(before);
  const close = clampMoodScore(after);
  const swing = Math.max(2, Math.abs(close - open));
  const high = clampMoodScore(Math.max(open, close) + Math.ceil(swing / 2));
  const low = clampMoodScore(Math.min(open, close) - Math.ceil(swing / 3));
  state.market.moodCandles.push({
    time: new Date().toLocaleTimeString("zh-CN", { hour: "2-digit", minute: "2-digit" }),
    reason: reason || "心绪波动",
    open,
    close,
    high,
    low,
  });
  state.market.moodCandles = state.market.moodCandles.slice(-18);
}

function improveMood(points, reason = "") {
  const before = clampMoodScore(state.market.moodScore);
  state.market.moodScore = clampMoodScore(before + points);
  if (state.market.moodScore !== before) recordMoodPoint(reason, before, state.market.moodScore);
  if (reason && state.market.moodScore > before) state.market.lastMoodReason = reason;
  renderMarketHud();
}

function renderMarketHud() {
  if (!els.marketHud) return;
  els.marketHud.hidden = !state.role;
  if (!state.role) {
    if (els.directorPanel) els.directorPanel.hidden = true;
    return;
  }
  const stall = state.market.stall || {};
  const daily = currentDailyMarket();
  els.marketStallButton?.classList.toggle("is-open", stall.signboard === "open");
  els.marketStallButton?.classList.toggle("is-alert", Boolean(stall.visitor));
  els.marketDailyButton?.classList.toggle("is-open", Boolean(daily.headlines?.length));
  els.marketDailyButton?.classList.toggle("is-alert", Boolean(state.market.entranceCompleted && !state.market.commissions?.completed?.has("aroma-flip")));
  els.marketExchangeButton?.classList.toggle("is-alert", Boolean(state.market.entranceCompleted && state.market.orders?.some((order) => !order.completed && marketInventoryCount(order.want) > 0)));
  [els.marketGuideButton, els.newbieHudButton, els.marketExchangeButton, els.marketDailyButton, els.marketStallButton].forEach((button) => {
    button?.classList.remove("is-director");
  });
  setText(els.marketCoins, `${state.market.coins} 心币 · ${state.market.title}`);
  if (!state.market.entranceCompleted) {
    setText(els.marketGoal, marketNextGoal());
    if (els.marketProgress) els.marketProgress.hidden = true;
    if (els.moodMeter) els.moodMeter.hidden = true;
    updateDirectorPanel();
    return;
  }
  const bought = state.market.counters.bought > 0 ? "已买" : "待买";
  const sold = state.market.counters.sold > 0 ? "已卖" : "待卖";
  const tradeProgress = Math.min(2, (state.market.counters.bought > 0 ? 1 : 0) + (state.market.counters.sold > 0 ? 1 : 0));
  const areaProgress = state.market.areas.size;
  const codexProgress = state.market.codex.size;
  const stallProgress = Math.min(1, state.market.counters.stallSales);
  const stallLabel = stall.visitor ? "来客" : stall.signboard === "open" ? "营业" : `${stallProgress}/1`;
  setText(els.marketGoal, `${marketNextGoal()} · 买卖 ${bought}/${sold} · 场景 ${state.market.areas.size}/${MARKET_AREAS.length}`);
  if (els.moodMeter) els.moodMeter.hidden = false;
  const moodScore = clampMoodScore(state.market.moodScore);
  setText(els.moodMeterText, `${moodStage(moodScore)} ${moodScore}%`);
  if (els.moodMeterBar) els.moodMeterBar.style.width = `${moodScore}%`;
  if (els.marketProgress) els.marketProgress.hidden = false;
  setHudProgress(els.marketProgressTrade, `买卖 ${tradeProgress}/2`, tradeProgress >= 2);
  setHudProgress(els.marketProgressAreas, `场景 ${areaProgress}/${MARKET_AREAS.length}`, areaProgress >= 3);
  setHudProgress(els.marketProgressCodex, `图鉴 ${codexProgress}`, codexProgress >= 5);
  setHudProgress(els.marketProgressStall, `开摊 ${stallLabel}`, stallProgress >= 1 || Boolean(stall.visitor));
  updateDirectorPanel();
}

function currentEntranceChoice() {
  return ENTRY_INTENT_CHOICES.find((item) => item.key === state.market.entranceChoice) || ENTRY_INTENT_CHOICES[0];
}

function entranceGuideProfile(choice = currentEntranceChoice()) {
  return CORE_MARKET_PROFILES.find((item) => item.key === choice?.recommend) || CORE_MARKET_PROFILES[0];
}

function initialGuideSetting(profileOrKey) {
  const key = typeof profileOrKey === "string" ? profileOrKey : profileOrKey?.key;
  return INITIAL_GUIDE_NPC_SETTINGS[key] || null;
}

function isInitialGuideProfile(profile) {
  return Boolean(initialGuideSetting(profile));
}

function isCurrentInitialGuide(profile) {
  return Boolean(profile && state.market.entranceCompleted && profile.key === currentEntranceChoice().recommend);
}

function firstAvailableSellOffer(profile) {
  const buys = profile?.buys || [];
  const choice = currentEntranceChoice();
  let index = buys.findIndex((offer) => offer.item === choice.item && marketInventoryCount(offer.item) > 0);
  if (index < 0) index = buys.findIndex((offer) => marketInventoryCount(offer.item) > 0);
  if (index < 0) return null;
  return { offer: buys[index], index, quote: marketPriceForOffer(profile, buys[index], "sell") };
}

function firstGuideBuyOffer(profile) {
  const sells = (profile?.sells || []).filter((offer) => !SECONDARY_MARKET_ITEMS.has(offer.item));
  if (!sells.length) return null;
  const offer = sells[0];
  return { offer, index: (profile?.sells || []).indexOf(offer), quote: marketPriceForOffer(profile, offer, "buy") };
}

function initialGuideOpening(profile) {
  const setting = initialGuideSetting(profile);
  if (!setting) return profile?.line || "";
  const choice = currentEntranceChoice();
  const opening = setting.opening?.[choice.key] || profile.line;
  const current = isCurrentInitialGuide(profile)
    ? `你登记的今日一念是「${choice.item}」，我正是你的初始引导人。`
    : `你登记的今日一念是「${choice.item}」，这里也能问路；若要走最短主线，可以去找「${entranceGuideProfile(choice).name}」。`;
  return `${profile.line}\n\n${current}\n${opening}\n\n身份设定：${setting.role}。${setting.setting}`;
}

function initialGuideTradeText(profile) {
  const setting = initialGuideSetting(profile);
  if (!setting) return "";
  const sell = firstAvailableSellOffer(profile);
  const buy = firstGuideBuyOffer(profile);
  const sellText = sell
    ? `你现在可卖「${sell.offer.item}」，今日可得 ${sell.quote.price} 心币。`
    : `你手上暂时没有我最收的「${setting.accepts.join("、")}」。`;
  const buyText = buy ? `我这里可买「${buy.offer.item}」，今日要花 ${buy.quote.price} 心币。` : "";
  return `${setting.tradeTip}\n${sellText}${buyText ? `\n${buyText}` : ""}`;
}

function initialGuideQuickButtons(profile) {
  if (!isInitialGuideProfile(profile)) return "";
  const buttons = [];
  const sell = firstAvailableSellOffer(profile);
  const buy = firstGuideBuyOffer(profile);
  if (sell) buttons.push(dialogueButton("sell", `先卖出：${sell.offer.item} · 得 ${sell.quote.price} 心币`, { npc: profile.npcId, index: sell.index, kind: "sell" }));
  if (buy) buttons.push(dialogueButton("buy", `再买入：${buy.offer.item} · 花 ${buy.quote.price} 心币`, { npc: profile.npcId, index: buy.index, kind: "buy" }));
  if (profile.key === "fortune") buttons.push(dialogueButton("fortune", "直接求一支今日签", { npc: profile.npcId }));
  return buttons.join("");
}

function initialGuideSayPlaceholder(profile) {
  const setting = initialGuideSetting(profile);
  if (!setting) return "例如：我今天有点犹豫，但想先做一件小事。";
  const placeholders = {
    comfort: "例如：我很犹豫，怕自己选错，但又想往前走。",
    memory: "例如：我真的有点累，像一直走不到地方。",
    fortune: "例如：我不知道今天该往哪里走，想要一点方向。",
    clarity: "例如：我一直拖着不开始，明知道该做却动不了。",
  };
  return placeholders[profile.key] || `例如：我带着${setting.accepts[0]}来，不知道怎么交易。`;
}

function initialGuideMoodLine(profile, analysis) {
  const context = analysis.contextLabel;
  const blocker = analysis.blockerLabel;
  const need = analysis.needLabel;
  const weight = analysis.intensityLabel;
  if (profile.key === "comfort") {
    const openings = {
      work: `你提到的是差事里的${blocker}，先别急着把自己判成不行。`,
      study: `课业里的${blocker}最容易把人压成一团，先把呼吸放慢。`,
      relation: `人情里的${blocker}会让话变重，我先替你把它接住。`,
      create: `创作里的${blocker}不是空白，是心还没找到安全的开口。`,
      body: `身体已经在替你说累了，这句心事不用再硬撑。`,
      trade: `你已经在想买卖了，很好；先看清自己手上哪一份心事最重。`,
      daily: `这句话的重量我听见了，它现在是${weight}的「${analysis.item}」。`,
    };
    return `${openings[analysis.context] || openings.daily}你现在更像是${need}，所以我不会催你立刻变好。`;
  }
  if (profile.key === "memory") {
    const openings = {
      work: `差事让你累，不一定是今天一件事，是旧账一层层压上来。`,
      study: `课业的疲惫常不是题太多，而是一直没真正卸下。`,
      relation: `人情里的旧话最占地方，没说完就会在心里反复响。`,
      create: `创作卡住时，旧梦仓先不催灵感，只问你是不是太久没歇。`,
      body: `身体这条线很清楚：先卸货，再上路。`,
      trade: `你把经历拿来交易，这并不冷；在心市里，经验本来就是货。`,
      daily: `我听见一只旧木匣在响，里面装着${weight}的「${analysis.item}」。`,
    };
    return `${openings[analysis.context] || openings.daily}这份${blocker}可以先存进仓里，不必背着它逛完整条街。`;
  }
  if (profile.key === "fortune") {
    const openings = {
      work: `以差事入签，签眼落在「${blocker}」。`,
      study: `以课业入签，今日不问输赢，先问第一处落笔。`,
      relation: `以人情入签，宜开口，但不宜把所有话一次说尽。`,
      create: `以创作入签，空白不是凶兆，是火还没落到纸上。`,
      body: `以身体入签，困倦压住签面，宜慢行。`,
      trade: `以买卖入签，今日宜先看行情，再动心币。`,
      daily: `这句话落签为「${analysis.item}」，轻重为${weight}。`,
    };
    return `${openings[analysis.context] || openings.daily}你现在想要的是${analysis.needLabel}；签能点灯，但路还要你自己走。`;
  }
  if (profile.key === "clarity") {
    const openings = {
      work: `差事不是怪物，真正绊你的是${blocker}。`,
      study: `课业别再整团看，先拆成一张纸、一道题、一刻钟。`,
      relation: `人情里最怕绕。该解释就解释，该停下就停下。`,
      create: `创作不是等灵感赏脸，是先交出一个粗糙开头。`,
      body: `真累就休息，别把清醒令当硬撑的借口。`,
      trade: `想交易就看价，不要只看情绪。手上有货，先找收货的人。`,
      daily: `我拆开说：这不是一团乱，是${blocker}卡住了。`,
    };
    return `${openings[analysis.context] || openings.daily}你说得${weight}，但下一步必须小到今天能做。`;
  }
  return "";
}

function initialGuideNeedLine(profile, analysis) {
  if (profile.key === "comfort") {
    if (analysis.need === "advice") return "你要建议也可以，但先别用建议继续逼自己；我会先把话说轻，再给你一条小路。";
    if (analysis.need === "clarity") return "你想被点醒，可你的心现在更需要先落地；清醒可以稍后去折枝客那里买。";
    if (analysis.need === "trade") return "买卖很清楚：把重的卖掉，把轻的买回来。";
    return "我先接住你说出来的这一句，再把它变成可以交易的心货。";
  }
  if (profile.key === "memory") {
    if (analysis.need === "advice") return "建议可以有，但旧梦仓先问：你是不是已经背着同一件事太久了？";
    if (analysis.need === "comfort") return "想被安慰时，不必证明自己真的很累；疲惫本身就够资格入仓。";
    if (analysis.need === "choice") return "选择之前，先把旧包袱放下，否则每条路都像上坡。";
    return "我把这句话记成一段旧梦，先帮你从身上卸下来。";
  }
  if (profile.key === "fortune") {
    if (analysis.need === "choice") return "你问的是选择，那就只看今日：哪一条路能让你先动一步？";
    if (analysis.need === "advice") return "签文不给长篇方案，只给今日宜忌；方案要去找理性的人拆。";
    if (analysis.need === "comfort") return "若你只是想被接住，先去问心巷；若你想问方向，就留在签台。";
    return "我会把你的话压成一支短签，不替你活，只替你照一下脚边。";
  }
  if (profile.key === "clarity") {
    if (analysis.need === "comfort") return "想被安慰就直说，不丢人；但如果你来我摊前，我会把借口和理由分开。";
    if (analysis.need === "advice") return "建议只有一条：把下一步写小，小到你无法继续假装没法开始。";
    if (analysis.need === "choice") return "选择题先砍掉一个最不想承担的答案，剩下的才值得比较。";
    return "我不负责哄你舒服，我负责把能动的那一步指出来。";
  }
  return "";
}

function initialGuideTradeActionLine(profile, analysis, sell) {
  const buy = firstGuideBuyOffer(profile);
  if (sell) {
    return `交易建议：先点【先卖出：${sell.offer.item}】，得 ${sell.quote.price} 心币；再考虑买「${buy?.offer?.item || initialGuideSetting(profile)?.turnsTo || "心货"}」。`;
  }
  const target = entranceGuideProfile(currentEntranceChoice());
  if (analysis.key === "trade") return `你在谈交易，但我这里暂时没有能直接收的货。先去找「${target.name}」，再回来做买卖路线。`;
  return `你手上暂时没有我最收的货。若想走主线，先点【听取引荐】找「${target.name}」。`;
}

function initialGuideReply(profile, words, read) {
  const setting = initialGuideSetting(profile);
  if (!setting) return "";
  const choice = currentEntranceChoice();
  const analysis = read?.analysis || analyzePlayerWords(words);
  const base = setting.replies?.[analysis.key] || setting.replies?.plain || "";
  const isMatchedGuide = isCurrentInitialGuide(profile);
  const sell = firstAvailableSellOffer(profile);
  const reading = `我听到三个信号：${analysis.contextLabel}、${analysis.blockerLabel}、${analysis.needLabel}。`;
  const moodLine = initialGuideMoodLine(profile, analysis);
  const needLine = initialGuideNeedLine(profile, analysis);
  const nextAction = initialGuideTradeActionLine(profile, analysis, sell);
  const relation = isMatchedGuide
    ? `你是带着「${choice.item}」来找我的，这条线我会带你完成第一笔卖出。`
    : `你今日登记的是「${choice.item}」，真正的初始引导人是「${entranceGuideProfile(choice).name}」。我也能回应你，但主线会更适合他。`;
  return `${reading}\n${moodLine}\n${needLine}\n\n${base}\n\n${relation}\n${nextAction}`;
}

function showNewbieGuide(stage = "entry", force = false) {
  if (!els.newbieGuide || (state.tutorial.dismissed && !force)) return;
  state.tutorial.stage = stage;
  els.newbieGuide.hidden = false;
  els.newbieGuide.dataset.stage = stage;
  if (stage === "stall") {
    const mentor = CORE_MARKET_PROFILES.find((item) => item.key === "stall");
    const stallDone = state.market.counters.stallSales > 0;
    setText(els.newbieGuideTitle, stallDone ? "三分钟路线已经跑通" : "现在把自己变成摊主");
    setText(
      els.newbieGuideText,
      stallDone
        ? "你已经完成入市、买卖、看盘、看行情和第一位来客。接下来可以继续做行情委托、订单板、拍卖或收集人物图鉴。"
        : `第一轮买卖已经完成。下一步去找「${mentor?.name || "摊师阿衡"}」或直接打开小摊：先定个性和售卖内容，再挂出招牌。第一位来客会立刻到，写一句回应就能看到匹配评分、成交价和口碑。`
    );
    setText(els.newbieFocusButton, stallDone ? "回看心市" : `带我去${mentor?.name || "摊师阿衡"}`);
  } else if (stage === "trade") {
    const choice = currentEntranceChoice();
    const guide = entranceGuideProfile(choice);
    const sold = state.market.counters.sold > 0;
    setText(els.newbieGuideTitle, sold ? "第一轮买卖：再买一件心货" : "第一轮买卖：先卖后买");
    setText(
      els.newbieGuideText,
      sold
        ? `你已经卖出心事。现在留在「${guide.name}」或点下面按钮回到摊前，选择【买卖心货】，买入第一件能改变心境的心货。完成一买一卖后，路线会带你去看心市 K 线。`
        : `目标只有一个：先找到「${guide.name}」。点地面走路，拖动画面或按右下角箭头看远处，滚轮 / + / - 放缩；迷路就点 ◎ 回到自己。靠近后点摊主，选择买卖心货，先卖出「${choice.item}」换心币。`
    );
    setText(els.newbieFocusButton, `带我去${guide.name}`);
  } else {
    setText(els.newbieGuideTitle, "先学会看地图");
    setText(
      els.newbieGuideText,
      "第一步先点地面，让角色走起来。想看远处就拖动画面，或按右下角箭头移动视野；看不清就用滚轮 / + / - 放缩，找不到自己就点 ◎。接下来先打开问心帖，领取入市钱袋。"
    );
    setText(els.newbieFocusButton, "打开问心帖");
  }
}

function hideNewbieGuide() {
  state.tutorial.dismissed = true;
  if (els.newbieGuide) els.newbieGuide.hidden = true;
}

function suggestedTutorialStage() {
  if (!state.market.entranceCompleted) return "entry";
  if (state.market.counters.bought > 0 && state.market.counters.sold > 0) return "stall";
  return "trade";
}

function reopenNewbieGuide() {
  showNewbieGuide(suggestedTutorialStage(), true);
}

function focusTutorialTarget() {
  if (!state.market.entranceCompleted) {
    renderWelcomeMarketPanel();
    showNewbieGuide("entry", true);
    return;
  }
  if (state.tutorial.stage === "stall" && state.market.counters.stallSales > 0) {
    renderMarketExchangePanel();
    return;
  }
  if (state.tutorial.stage === "stall" || (state.market.counters.bought > 0 && state.market.counters.sold > 0)) {
    focusCoreNpc("stall");
    showNewbieGuide("stall", true);
    return;
  }
  const choice = currentEntranceChoice();
  focusCoreNpc(choice.recommend || "comfort");
  showNewbieGuide("stall", true);
}

function marketItemsText() {
  const entries = Object.entries(state.market.inventory).filter(([, count]) => count > 0);
  return entries.length ? entries.map(([item, count]) => `${escapeHtml(item)} x${count}`).join("、") : "暂无心货";
}

function marketPanel(title, body) {
  if (!els.marketPanel || !els.marketPanelBody) return;
  els.marketPanel.dataset.panel = "";
  els.marketPanelBody.innerHTML = `<h2>${escapeHtml(title)}</h2>${body}`;
  els.marketPanel.hidden = false;
}

function guidePanel(title, body) {
  if (!els.marketPanel || !els.marketPanelBody) return;
  els.marketPanel.dataset.panel = "guide";
  els.marketPanelBody.innerHTML = `<h2>${escapeHtml(title)}</h2>${body}`;
  els.marketPanel.hidden = false;
}

function closeMarketPanel() {
  if (els.marketPanel) els.marketPanel.hidden = true;
}

function clearDialogTyping() {
  state.dialog.typingToken += 1;
  if (state.dialog.typingTimer) clearInterval(state.dialog.typingTimer);
  state.dialog.typingTimer = null;
  if (els.dialog) delete els.dialog.dataset.typing;
}

function typeDialogText(text) {
  clearDialogTyping();
  const fullText = String(text || "");
  state.dialog.fullText = fullText;
  if (!els.dialogText) return;
  if (!fullText) {
    setText(els.dialogText, "");
    return;
  }
  const token = state.dialog.typingToken;
  let index = 0;
  els.dialog.dataset.typing = "true";
  setText(els.dialogText, "");
  state.dialog.typingTimer = setInterval(() => {
    if (token !== state.dialog.typingToken) return;
    index += 2;
    setText(els.dialogText, fullText.slice(0, index));
    if (index >= fullText.length) clearDialogTyping();
  }, 18);
}

function closeNpcDialog() {
  clearDialogTyping();
  state.dialog.npcId = "";
  state.dialog.mode = "root";
  if (els.dialog) els.dialog.hidden = true;
  exitDialogueMusic();
}

function setDialogPortrait(npc) {
  const profile = marketProfileForNpc(npc);
  const sprite = state.render?.npcSprites?.[npc?.id];
  const frame = frameForSprite(sprite, npc?.direction, 120);
  const fallback = profile?.name?.slice(0, 1) || displayNpcName(npc).slice(0, 1) || "心";
  setText(els.dialogPortraitFallback, fallback);
  if (frame?.url && els.dialogPortraitImage) {
    els.dialogPortraitImage.src = frame.url;
    els.dialogPortraitImage.hidden = false;
    if (els.dialogPortraitFallback) els.dialogPortraitFallback.hidden = true;
  } else {
    if (els.dialogPortraitImage) els.dialogPortraitImage.hidden = true;
    if (els.dialogPortraitFallback) els.dialogPortraitFallback.hidden = false;
  }
}

function faceNpcToRole(npc) {
  if (!npc || !state.role?.position) return;
  const p = npcWorld(npc);
  npc.direction = directionFromDelta(state.role.position.x - p.x, state.role.position.y - p.y);
}

function dialogueButton(action, label, attrs = {}) {
  const extra = Object.entries(attrs)
    .map(([key, value]) => ` data-${key}="${escapeHtml(value)}"`)
    .join("");
  return `<button data-dialog-action="${escapeHtml(action)}"${extra} type="button">${escapeHtml(label)}</button>`;
}

function detectWordContext(text) {
  const contexts = [
    { key: "work", label: "差事", pattern: /工作|上班|老板|同事|项目|汇报|简历|面试|加班|客户|会议|绩效/ },
    { key: "study", label: "课业", pattern: /学习|考试|作业|论文|课程|老师|学校|ddl|deadline|复习|题|成绩/ },
    { key: "relation", label: "人情", pattern: /朋友|恋爱|对象|分手|家人|父母|关系|吵架|喜欢|社交|聊天|回复|道歉/ },
    { key: "create", label: "创作", pattern: /写|画|设计|方案|作品|比赛|创作|视频|文案|灵感|点子|开题|策划/ },
    { key: "trade", label: "买卖", pattern: /买|卖|交易|心币|钱|贵|便宜|赚|亏|价格|摊|行情|利润/ },
    { key: "body", label: "身体", pattern: /睡|身体|头疼|胃|生病|病|休息|熬夜|困|累|疲/ },
  ];
  return contexts.find((item) => item.pattern.test(text)) || { key: "daily", label: "今日", pattern: null };
}

function detectWordNeed(text) {
  const needs = [
    { key: "comfort", label: "想被接住", pattern: /安慰|陪|抱|理解|别骂|撑不住|难受|委屈|哭|崩|好累/ },
    { key: "advice", label: "想要步骤", pattern: /怎么办|怎么做|建议|方法|步骤|计划|第一步|如何|方案/ },
    { key: "clarity", label: "想被点醒", pattern: /骂醒|批评|清醒|真话|直接|别客气|点醒|别哄/ },
    { key: "choice", label: "想做选择", pattern: /选|选择|要不要|该不该|去不去|买不买|做不做|决定/ },
    { key: "fortune", label: "想求方向", pattern: /运气|吉凶|签|方向|未来|今天宜|测|占卜|玄学/ },
    { key: "trade", label: "想做买卖", pattern: /买|卖|交易|心币|钱|价格|赚|亏|行情|摊/ },
  ];
  return needs.find((item) => item.pattern.test(text)) || { key: "listen", label: "想先说出来", pattern: null };
}

function detectWordBlocker(text) {
  const blockers = [
    { key: "deadline", label: "期限压着", pattern: /ddl|deadline|截止|明天|今晚|马上|来不及|倒计时|快交/ },
    { key: "fear", label: "怕失败", pattern: /怕|害怕|失败|丢人|做不好|被骂|不敢|担心|焦虑|紧张/ },
    { key: "energy", label: "没力气", pattern: /累|疲|困|睡不着|没力|耗尽|撑不住|麻木|不想动/ },
    { key: "overthink", label: "想太多", pattern: /想太多|内耗|纠结|反复|脑子停不下|绕|卡住|乱/ },
    { key: "choice", label: "选择太多", pattern: /选择|选项|不知道选|方向太多|都可以|都不行/ },
    { key: "start", label: "开不了头", pattern: /开始|开头|第一步|动不了|拖|拖延|懒|推|不想做/ },
  ];
  return blockers.find((item) => item.pattern.test(text)) || { key: "unclear", label: "还没说清", pattern: null };
}

function analyzePlayerWords(words) {
  const text = String(words || "").trim();
  const context = detectWordContext(text);
  const need = detectWordNeed(text);
  const blocker = detectWordBlocker(text);
  let key = "plain";
  let item = "心事";
  let hint = "这句话可以先被听见，再变成一笔心货买卖。";
  if (/买|卖|交易|心币|钱|贵|便宜|赚|亏|价格|摊|行情|利润/.test(text)) {
    key = "trade";
    item = "交易念头";
    hint = "先判断手上有什么可卖，再决定买什么能把状态扭回来。";
  } else if (/拖|懒|推|ddl|deadline|截止|不想做|明天|动不了|刷手机|摆烂/.test(text)) {
    key = "delay";
    item = "拖延";
    hint = "把事情切成今日能完成的一小步。";
  } else if (/累|疲|困|睡|倦|没力|耗尽|撑不住|麻木|熬夜/.test(text)) {
    key = "tired";
    item = "疲惫";
    hint = "先把疲惫卖给愿意收它的人，再买一件能慢下来的心货。";
  } else if (/迷|乱|方向|不知道|选择|未来|困惑|空|没头绪/.test(text)) {
    key = "lost";
    item = "迷茫";
    hint = "先求一个方向，不急着求完整答案。";
  } else if (/怕|焦虑|不安|担心|犹豫|纠结|迟疑|摇摆|不敢/.test(text)) {
    key = "hesitation";
    item = "犹豫";
    hint = "先把犹豫说出来，再用交易把它换轻。";
  } else if (/气|烦|讨厌|委屈|难受|崩|哭|伤心|憋屈|破防/.test(text)) {
    key = "hurt";
    item = "委屈";
    hint = "这类心事适合先被接住，再决定要不要换成行动。";
  } else if (/灵感|写|画|创作|点子|方案|想法|卡|开题/.test(text)) {
    key = "inspire";
    item = "卡壳";
    hint = "不要等完整灵感，先买一粒能开头的火星。";
  }
  const intensity = /崩|撑不住|受不了|完了|死定|非常|特别|超级|太/.test(text) ? "high" : /有点|一点|稍微|可能|好像/.test(text) ? "low" : "mid";
  return {
    text,
    key,
    item,
    hint,
    context: context.key,
    contextLabel: context.label,
    need: need.key,
    needLabel: need.label,
    blocker: blocker.key,
    blockerLabel: blocker.label,
    intensity,
    intensityLabel: intensity === "high" ? "很重" : intensity === "low" ? "轻微" : "明显",
  };
}

function classifyPlayerWords(words) {
  const analysis = analyzePlayerWords(words);
  return { key: analysis.key, item: analysis.item, hint: analysis.hint, analysis };
}

function npcReplyForWords(profile, words) {
  const text = String(words || "").trim().slice(0, 80);
  if (!text) return "你可以先写一句此刻想说的话，我会按这个摊主的个性给你回应。";
  const read = classifyPlayerWords(text);
  const initialReply = initialGuideReply(profile, text, read);
  if (initialReply) return initialReply;
  const replies = {
    comfort: `我听见了。你说“${text}”，这更像一枚「${read.item}」。不用急着把它解释清楚，先把它放在灯下歇一歇。${read.hint}`,
    clarity: `我听懂了。你说“${text}”，这里最要紧的是把「${read.item}」换成下一步。今日只做一件能落地的小事，其余先不管。`,
    fortune: `以“${text}”入签，签面落在「${read.item}」。今日宜开口，不宜空等。${read.hint}`,
    inspire: `这句“${text}”里有火星，尤其是「${read.item}」这一点。把它改成一个问题，灵感就有地方落脚。`,
    network: `我把“${text}”记下了。它像一张写着「${read.item}」的人情帖，我会建议你把它递给真正收这类心事的人。`,
    repair: `“${text}”可以再说轻一点，也可以说准一点。若这是「${read.item}」，先别急着解释，先问自己想修复什么边界。`,
    trade: `这句“${text}”也有行情。它现在像「${read.item}」：若有人需要，它就是能卖出的心货；若你缺它，也可以花心币买回来。`,
    stall: `这就是你的摊位味道。来客若带着「${read.item}」来，你可以先回应一句真话，再决定卖安慰、建议、批评还是签语。`,
  };
  return replies[profile?.key] || `我听见你说“${text}”。我把它记作「${read.item}」。${read.hint}`;
}

function performNpcSay(profile) {
  const npc = profile ? npcForProfile(profile) : state.selectedNpc;
  const input = document.querySelector("#npcSayInput");
  const words = String(input?.value || "").trim();
  if (!words) {
    if (npc) renderNpcDialog(npc, "say", "先写一句你现在想对这位摊主说的话。");
    return;
  }
  const response = npcReplyForWords(profile, words);
  addMarketRecord({ npc: profile?.name || "心市摊主", action: "交谈", item: "一句话", amount: 0, result: words.slice(0, 40) });
  improveMood(5, "先说出一句真实的话");
  triggerMarketFx("talk", "一句话入市", profile);
  if (npc) renderNpcDialog(npc, "root", response);
}

function renderNpcDialog(npc, mode = "root", notice = "") {
  const profile = marketProfileForNpc(npc);
  if (!profile || !els.dialog) return;
  closeMarketPanel();
  faceNpcToRole(npc);
  unlockMarketCodex(profile);
  unlockMarketArea(profile.areaKey || profile.key);
  state.selectedNpc = npc;
  state.dialog.npcId = String(npc.id);
  state.dialog.mode = mode;
  els.dialog.hidden = false;
  els.dialog.dataset.speaking = "true";
  enterDialogueMusic();
  setDialogPortrait(npc);
  setText(els.dialogSpeaker, profile.name);
  setText(els.dialogSubtitle, `${profile.title} · ${profile.personality}`);

  const recommendTargets = (profile.recommends || [])
    .map((key) => CORE_MARKET_PROFILES.find((item) => item.key === key))
    .filter(Boolean);
  const prefix = notice ? `${notice}\n\n` : "";
  let text = `${prefix}${profile.line}`;
  let options = "";

  if (mode === "root" && profile.key === "stall") {
    text = `${prefix}${profile.line}\n\n你已经不是只逛市的人了，也可以挂出自己的招牌。开店分三步：定个性、定商品、挂招牌。第一位客人会马上来，后面的客人会短间隔来访。`;
    options = [
      dialogueButton("stall-guide", "听阿衡讲开店"),
      dialogueButton("open-stall", "经营我的小摊"),
      dialogueButton("say", "我先说一句"),
      dialogueButton("recommend", "听取引荐"),
    ].join("");
  } else if (mode === "root" && isInitialGuideProfile(profile)) {
    text = `${prefix}${initialGuideOpening(profile)}`;
    options = [
      dialogueButton("say", "我先说一句"),
      initialGuideQuickButtons(profile),
      dialogueButton("trade", "展开买卖心货"),
      dialogueButton("daily-market", "今日行情"),
      dialogueButton("recommend", "听取引荐"),
    ].join("");
  } else if (mode === "root") {
    text = `${prefix}${profile.line}\n\n你可以先说一句自己的话，也可以直接做买卖：卖出心事换心币，买入心货改心境。`;
    options = [
      dialogueButton("say", "我先说一句"),
      dialogueButton("info", "打听人情消息"),
      dialogueButton("trade", "买卖心货"),
      dialogueButton("daily-market", "今日行情"),
      dialogueButton("recommend", "听取引荐"),
    ].join("");
  } else if (mode === "info") {
    const credentials = ["交易凭证", "成交记录"].map((item) => `${item} x${marketInventoryCount(item)}`).join("，");
    const secondaryBuys = (profile.buys || [])
      .map((offer, index) => ({ offer, index }))
      .filter(({ offer }) => SECONDARY_MARKET_ITEMS.has(offer.item))
      .map(({ offer, index }) => {
        const quote = marketPriceForOffer(profile, offer, "sell");
        return dialogueButton("sell", `交付${offer.item} · 得 ${quote.price} 心币 ${marketPriceButtonSuffix(quote)}`, { npc: profile.npcId, index, kind: "sell" });
      })
      .join("");
    text = `${prefix}${profile.name}压低声音，把今日人情消息摊在案上。\n\n你手上的凭据：${credentials}。这些账册类信息都收在这里，不占主对话。`;
    options = [
      secondaryBuys,
      dialogueButton("daily-market", "今日行情"),
      dialogueButton("ledger", "查看交易簿"),
      dialogueButton("codex", "图鉴线索"),
      dialogueButton("areas", "场景线索"),
      dialogueButton("root", "返回"),
    ].join("");
  } else if (mode === "trade") {
    const sells = (profile.sells || [])
      .map((offer, index) => ({ offer, index }))
      .filter(({ offer }) => !SECONDARY_MARKET_ITEMS.has(offer.item))
      .map(({ offer, index }) => {
        const quote = marketPriceForOffer(profile, offer, "buy");
        return dialogueButton("buy", `我要买：${offer.item} · 花 ${quote.price} 心币 ${marketPriceButtonSuffix(quote)}`, { npc: profile.npcId, index, kind: "buy" });
      })
      .join("");
    const buys = (profile.buys || [])
      .map((offer, index) => ({ offer, index }))
      .filter(({ offer }) => !SECONDARY_MARKET_ITEMS.has(offer.item))
      .map(({ offer, index }) => {
        const quote = marketPriceForOffer(profile, offer, "sell");
        return dialogueButton("sell", `我要卖：${offer.item} · 得 ${quote.price} 心币 ${marketPriceButtonSuffix(quote)}`, { npc: profile.npcId, index, kind: "sell" });
      })
      .join("");
    const special =
      profile.key === "fortune"
        ? `${dialogueButton("fortune", "求今日签 · 5 心币", { npc: profile.npcId })}${dialogueButton("fortune-reroll", "重测一签 · 3 心币", { npc: profile.npcId })}`
        : profile.key === "stall"
        ? dialogueButton("open-stall", "请阿衡教我开摊")
        : profile.key === "fame"
        ? dialogueButton("codex", "查看名录图鉴")
        : "";
    const areaQuote = marketAreaRate(profile.areaKey || profile.key);
    const guideTip = initialGuideTradeText(profile);
    text = `${prefix}${profile.name}把可交易的心货摆上案面。\n\n买：花心币获得心货。卖：交出你身上的心事或物件，换回心币。\n\n${guideTip ? `${guideTip}\n\n` : ""}今日${areaQuote.name}买入价 ${Math.round(areaQuote.buy * 100)}%，卖出价 ${Math.round(areaQuote.sell * 100)}%。你的心货：${marketItemsText()}。`;
    options = [sells, buys, special, dialogueButton("daily-market", "今日行情"), dialogueButton("root", "返回")].join("");
  } else if (mode === "say") {
    const setting = initialGuideSetting(profile);
    text = `${prefix}${profile.name}看向你，等你先开口。\n\n${setting ? `他/她是「${setting.role}」，会按你的话判断你更像需要卖出哪种心事。` : "写一句你现在想说的话，摊主会按自己的个性回应你。"}`;
    options = `<div class="npc-say-box">
      <textarea id="npcSayInput" maxlength="80" placeholder="${escapeHtml(initialGuideSayPlaceholder(profile))}"></textarea>
      <div>
        ${dialogueButton("say-submit", "递上这句话", { npc: profile.npcId })}
        ${dialogueButton("root", "返回")}
      </div>
    </div>`;
  } else if (mode === "stall-tutorial") {
    const mentor = CORE_MARKET_PROFILES.find((item) => item.key === "stall");
    text = `${prefix}${profile.name}把交易凭证推回你手边。\n\n“你已经做完一买一卖。若想让别人来找你，就去开摊司找${mentor?.name || "摊师阿衡"}。开店不复杂：先定你卖什么，再挂出招牌，来客到了再选择接待或婉拒。”`;
    options = [
      dialogueButton("refer", `去找${mentor?.name || "摊师阿衡"}`, { key: "stall" }),
      dialogueButton("open-stall", "先看我的小摊"),
      dialogueButton("trade", "继续买卖"),
    ].join("");
  } else if (mode === "stall-guide") {
    text = `${prefix}${profile.name}抬手点了点你的手札。\n\n“开摊不是开一个空面板，是把你自己的表达方式摆出来卖。”\n\n一、先选摊位个性：温和、犀利、玄学、理性或诗意。\n二、再选售卖内容：安慰、批评、建议、灵感或签语。\n三、挂出招牌。第一位客人会马上到，后面的客人会隔一小会儿再来。来客到了，你可以接待，也可以婉拒。”`;
    options = [
      dialogueButton("open-stall", "现在开摊"),
      dialogueButton("say", "问阿衡一句"),
      dialogueButton("root", "返回"),
    ].join("");
  } else if (mode === "recommend") {
    const target = recommendTargets[0];
    text = target
      ? `${prefix}${profile.name}看了看你的心境，替你递出一张人情帖。\n\n“你该去找${target.name}。${target.area}那边，正好有人懂这件事。”`
      : `${prefix}${profile.name}暂时没有新的引荐，只让你先沿长街多走几步。`;
    options = [
      target ? dialogueButton("refer", `标记${target.name}`, { key: target.key }) : "",
      dialogueButton("root", "返回"),
    ].join("");
  }

  els.dialogOptions.innerHTML = options;
  typeDialogText(text);
  renderMarketHud();
}

function renderNpcMarketPanel(npc) {
  renderNpcDialog(npc, "root");
}

function renderStallTutorialPanel(sourceName = "刚才那位摊主") {
  marketPanel(
    "开摊教程",
    `<p class="market-muted">${escapeHtml(sourceName)}提醒你：第一轮买卖已经跑通，现在可以去开摊司把自己也变成摊主。</p>
     <div class="reward-grid">
       <div class="reward-card"><span>第一步</span><strong>定个性</strong><small>选择温和、犀利、玄学、理性或诗意，决定你怎样回应来客。</small></div>
       <div class="reward-card"><span>第二步</span><strong>定商品</strong><small>选择安慰、批评、建议、灵感或签语，明确你卖什么。</small></div>
       <div class="reward-card"><span>第三步</span><strong>挂招牌</strong><small>第一位客人马上来，后面的客人短间隔到访；你可以接待，也可以婉拒。</small></div>
     </div>
     <div class="market-row guide-actions">
       <button class="guide-primary" data-market-action="refer" data-key="stall" type="button">去找摊师阿衡</button>
       <button class="guide-primary" data-market-action="stall" type="button">打开我的小摊</button>
       <button class="guide-secondary" data-market-action="newbie" type="button">重开新手指引</button>
     </div>`
  );
}

function maybeShowStallTutorial(npc, notice, options = {}) {
  const totalTrades = state.market.counters.bought + state.market.counters.sold;
  if (state.market.stallTutorialSeen || totalTrades < 2) return false;
  state.market.stallTutorialSeen = true;
  const profile = npc ? marketProfileForNpc(npc) : null;
  addMarketRecord({ npc: profile?.name || "心市摊主", action: "开摊引荐", item: "开摊司", amount: 0, result: "完成第一轮买卖后，摊主推荐你去找摊师阿衡学习开店。" });
  showNewbieGuide("trade", true);
  if (options.dialog && npc) renderNpcDialog(npc, "stall-tutorial", `${notice}\n\n下一步：可以学习开摊。`);
  else renderStallTutorialPanel(profile?.name || "刚才那位摊主");
  return true;
}

function spendCoins(price) {
  if (state.market.coins < price) return false;
  state.market.coins -= price;
  return true;
}

function performBuy(profile, index, options = {}) {
  const offer = profile?.sells?.[index];
  if (!offer) return;
  const npc = npcForProfile(profile);
  const quote = marketPriceForOffer(profile, offer, "buy");
  if (!spendCoins(quote.price)) {
    if (options.dialog && npc) renderNpcDialog(npc, "trade", "你还差些心币。可以先把手上的心事卖给愿意收的人。");
    else marketPanel("心币不足", `<p>你还差些心币。可以先把手上的心事卖给愿意收的人。</p>`);
    return;
  }
  addMarketItem(offer.item, 1);
  addMarketItem("交易凭证", 1);
  markMarketRouteBought(offer.item);
  state.market.counters.bought += 1;
  state.market.mood = offer.item;
  improveMood(12, `买入「${offer.item}」`);
  unlockMarketCodex(profile);
  addMarketRecord({ npc: profile.name, action: "买入", item: offer.item, amount: -quote.price, result: `${offer.note} ${marketPriceDetailText(quote)}。` });
  triggerMarketFx("buy", `买入「${offer.item}」`, profile);
  checkMarketAchievements();
  if (npc) {
    const message = `成交。你买入「${offer.item}」，支出 ${quote.price} 心币。\n${offer.note}\n${marketPriceDetailText(quote)}。`;
    if (maybeShowStallTutorial(npc, message, options)) return;
    if (options.dialog) renderNpcDialog(npc, "trade", message);
    else renderNpcMarketPanel(npc);
  }
}

function performSell(profile, index, options = {}) {
  const offer = profile?.buys?.[index];
  if (!offer) return;
  const npc = npcForProfile(profile);
  const quote = marketPriceForOffer(profile, offer, "sell");
  if (marketInventoryCount(offer.item) <= 0) {
    if (options.dialog && npc) renderNpcDialog(npc, options.mode || "trade", `你现在没有「${offer.item}」。先去其他摊位买入或交换。`);
    else marketPanel("暂无可卖心货", `<p>你现在没有「${escapeHtml(offer.item)}」。先去其他摊位买入或交换。</p>`);
    return;
  }
  addMarketItem(offer.item, -1);
  if (offer.item !== "交易凭证") addMarketItem("交易凭证", 1);
  state.market.coins += quote.price;
  state.market.counters.sold += 1;
  if (state.market.mood === offer.item) state.market.mood = "心事已轻";
  improveMood(18, `卖出「${offer.item}」`);
  unlockMarketCodex(profile);
  addMarketRecord({ npc: profile.name, action: "卖出", item: offer.item, amount: quote.price, result: `${offer.note} ${marketPriceDetailText(quote)}。` });
  triggerMarketFx("sell", `卖出「${offer.item}」`, profile);
  const completedCommission = profile.key === "trade" && offer.item === "安心香" && !state.market.commissions.completed.has("aroma-flip");
  if (completedCommission) {
    completeMarketCommission("aroma-flip", `你把「安心香」卖给铁算盘秦，完成一条买低卖高路线。`);
  }
  checkMarketAchievements();
  if (npc) {
    const commissionText = completedCommission ? "\n今日委托完成：额外奖励 8 心币，并解锁称号「行商小牙人」。" : "";
    const message = `成交。你卖出「${offer.item}」，收入 ${quote.price} 心币。\n${offer.note}\n${marketPriceDetailText(quote)}。${commissionText}`;
    if (maybeShowStallTutorial(npc, message, options)) return;
    if (options.dialog) renderNpcDialog(npc, options.mode || "trade", message);
    else renderNpcMarketPanel(npc);
  }
}

function performFortune(profile, reroll = false, options = {}) {
  const price = reroll ? 3 : 5;
  const npc = npcForProfile(profile);
  if (!spendCoins(price)) {
    if (options.dialog && npc) renderNpcDialog(npc, "trade", "签台不收真钱，只收心币。先做一笔买卖再来。");
    else marketPanel("心币不足", "<p>签台不收真钱，只收心币。先做一笔买卖再来。</p>");
    return;
  }
  const fortune = FORTUNES[Math.floor(Math.random() * FORTUNES.length)];
  state.market.lastFortune = fortune;
  state.market.counters.fortunes += 1;
  addMarketItem("今日签", 1);
  addMarketItem("交易凭证", 1);
  improveMood(reroll ? 4 : 8, reroll ? "重测签文" : "求得今日签");
  unlockMarketCodex(profile);
  addMarketRecord({ npc: profile.name, action: reroll ? "重测" : "求签", item: "今日签", amount: -price, result: fortune });
  triggerMarketFx("fortune", reroll ? "签文重测" : "签文落定", profile);
  checkMarketAchievements();
  if (options.dialog && npc) renderNpcDialog(npc, "trade", `签文落定：${fortune}。\n签不替你走路，只替你点灯。`);
  else marketPanel(profile.name, `<p>${escapeHtml(profile.line)}</p><div class="market-card"><strong>${escapeHtml(fortune)}</strong><small>签不替你走路，只替你点灯。</small></div><button data-market-action="fortune-reroll" data-npc="${escapeHtml(profile.npcId)}" type="button">再测一签 · 3 心币</button>`);
}

function focusCoreNpc(key) {
  const npc = state.market.coreNpcByKey.get(key);
  if (!npc) return;
  state.selectedNpc = npc;
  state.guidance = {
    npcId: String(npc.id),
    label: `点击${displayNpcName(npc)}交易`,
    startedAt: performance.now(),
  };
  state.market.counters.referrals += 1;
  improveMood(3, "接受 NPC 引荐");
  addMarketRecord({ npc: "人情引荐", action: "引荐", item: displayNpcName(npc), amount: 0, result: "已在地图上标记目标摊主，并自动带你走到摊前" });
  triggerMarketFx("talk", "人情引荐", marketProfileForNpc(npc));
  checkMarketAchievements();
  const p = npcWorld(npc);
  const target = nearestWalkablePoint({ x: p.x, y: p.y + 30 }, state.role?.position || p) || { x: p.x, y: p.y + 30 };
  if (state.view.width && state.view.height) {
    setCameraPosition(p.x - state.view.width / state.zoom / 2, p.y - state.view.height / state.zoom / 2, { manualHold: CAMERA_MANUAL_HOLD_MS });
  }
  requestMove(target.x, target.y, { mark: true });
  closeMarketPanel();
  closeNpcDialog();
}

function performEntranceChoice(key) {
  if (state.market.entranceCompleted) {
    renderGuidePanel();
    return;
  }
  const choice = ENTRY_INTENT_CHOICES.find((item) => item.key === key) || ENTRY_INTENT_CHOICES[0];
  const guide = entranceGuideProfile(choice);
  state.market.pendingEntranceChoice = choice.key;
  guidePanel(
    "领取入市钱袋",
    `<p class="market-muted">名录官收下你的问心帖，按下朱印。你登记的今日一念是「${escapeHtml(choice.item)}」。确认后，下面这些才会正式放进你的手札和交易簿。</p>
     <div class="reward-grid">
       <div class="reward-card"><span>入市钱袋</span><strong>${choice.coins} 心币</strong><small>心市给新客的第一笔虚拟本金。</small></div>
       <div class="reward-card"><span>今日一念</span><strong>${escapeHtml(choice.item)} x1</strong><small>${escapeHtml(choice.line)}</small></div>
       <div class="reward-card"><span>随身心货</span><strong>${escapeHtml(choice.gift)} x1</strong><small>可在市集中买卖、打听或换取线索。</small></div>
     </div>
     <div class="guide-status-card">
       <strong>初始引导人：${escapeHtml(guide.name)} · ${escapeHtml(guide.area)}</strong>
       <small>${escapeHtml(choice.note)} 心情起点：${escapeHtml(moodStage(choice.startScore || 20))} ${escapeHtml(choice.startScore || 20)}%。</small>
     </div>
     <div class="market-row guide-actions entrance-actions">
       <button class="guide-primary" data-market-action="claim-intent" data-key="${escapeHtml(choice.key)}" type="button">领取入市钱袋</button>
       <button class="guide-secondary" data-market-action="restart-intent" type="button">重选今日一念</button>
     </div>`
  );
  renderMarketHud();
}

function performEntranceMatch() {
  const input = document.querySelector("#customIntentInput");
  const text = input?.value || "";
  const key = matchEntranceChoice(text);
  if (!key) {
    renderWelcomeMarketPanel("先写一句你现在的状态，比如“我有点焦虑，不知道该怎么开始”。");
    return;
  }
  performEntranceChoice(key);
}

function performEntranceClaim(key) {
  if (state.market.entranceCompleted) {
    renderGuidePanel();
    return;
  }
  const choice = ENTRY_INTENT_CHOICES.find((item) => item.key === key) || ENTRY_INTENT_CHOICES.find((item) => item.key === state.market.pendingEntranceChoice) || ENTRY_INTENT_CHOICES[0];
  state.market.entranceCompleted = true;
  state.market.entranceChoice = choice.key;
  state.market.pendingEntranceChoice = "";
  state.market.coins = choice.coins;
  state.market.mood = choice.item;
  state.market.moodScore = clampMoodScore(choice.startScore || 20);
  state.market.title = "初入心市";
  state.market.inventory = {};
  recordMoodPoint("入市登记", Math.max(0, state.market.moodScore - 8), state.market.moodScore);
  addMarketItem(choice.item, 1);
  addMarketItem(choice.gift, 1);
  addMarketRecord({
    action: "入市登记",
    item: choice.item,
    amount: choice.coins,
    result: `登记今日一念「${choice.item}」，领取二十心币、${choice.item} x1、${choice.gift} x1。`,
  });
  triggerMarketFx("buy", "入市钱袋", marketCoreProfileByKey(choice.recommend));
  guidePanel(
    "钱袋已入手札",
    `<p class="market-muted">名录官替你落下一笔：今日一念已登记，入市钱袋已交付。心市不问来处，只记你愿意拿什么入市。你的心情会随着交谈、买卖和求签慢慢由阴转晴。</p>
     <div class="guide-status-card">
       <strong>${escapeHtml(choice.coins)} 心币 · 今日一念：${escapeHtml(choice.item)} · ${moodStage(state.market.moodScore)} ${state.market.moodScore}%</strong>
       <small>初始引导人：${escapeHtml(entranceGuideProfile(choice).name)}。${escapeHtml(choice.note)}</small>
     </div>
     <div class="trade-primer">
       <strong>下一步：先卖出心事</strong>
       <small>点击下面的路线按钮，系统会把你带到匹配的引导人面前。对话时选择【买卖心货】，再点【我要卖：${escapeHtml(choice.item)}】；卖出后留在摊前，再买入第一件心货。</small>
     </div>
     <div class="market-row guide-actions">
       <button class="guide-primary" data-market-action="refer" data-key="${escapeHtml(choice.recommend)}" type="button">先找${escapeHtml(entranceGuideProfile(choice).name)}</button>
       <button class="guide-primary" data-market-action="ledger" type="button">查看交易簿</button>
       <button class="guide-secondary" data-market-action="close-panel" type="button">收下钱袋</button>
     </div>`
  );
  renderMarketHud();
  showNewbieGuide("trade", true);
}

function renderGuidePanel() {
  if (!state.market.entranceCompleted) {
    renderWelcomeMarketPanel();
    return;
  }
  guidePanel(
    "心市手札",
    `<p class="market-muted">手札只记录和查看，不抢主交互。和 NPC 面对面对话，才是天元心市的主要体验。</p>
     <div class="guide-status-card">
       <strong>${escapeHtml(state.market.coins)} 心币 · ${escapeHtml(state.market.title)}</strong>
       <small>${escapeHtml(marketNextGoal())}</small>
     </div>
     <div class="market-row guide-actions">
        <button class="guide-primary" data-market-action="ledger" type="button">打开交易簿</button>
        <button class="guide-primary" data-market-action="contest-creativity" type="button">参赛创意札</button>
        <button class="guide-primary" data-market-action="exchange" type="button">进入心市</button>
        <button class="guide-primary" data-market-action="daily-market" type="button">查看今日行情</button>
        <button class="guide-primary" data-market-action="codex" type="button">查看图鉴称号</button>
       <button class="guide-primary" data-market-action="areas" type="button">查看场景图鉴</button>
       <button class="guide-primary" data-market-action="stall" type="button">经营我的小摊</button>
       <button class="guide-secondary" data-market-action="newbie" type="button">重开新手指引</button>
       <button class="guide-secondary" data-market-action="refer" data-key="${escapeHtml(currentEntranceChoice().recommend || "comfort")}" type="button">标记当前引导人</button>
     </div>`
  );
}

function profilePortraitUrl(profile) {
  const npc = npcForProfile(profile);
  const sprite = npc && state.render?.npcSprites?.[npc.id];
  const frame = frameForSprite(sprite, npc?.direction, 160);
  return frame?.url || "";
}

function profileCodexBio(profile) {
  if (!profile) return "";
  const setting = initialGuideSetting(profile);
  if (setting) return setting.setting;
  if (profile.key === "comfort") return "常年守着问心巷的一盏温烛，替来客收起一时放不下的委屈与犹豫。";
  if (profile.key === "clarity") return "清醒街上最利落的江湖客，话锋像刀，却只剪烂枝，不伤树根。";
  if (profile.key === "fortune") return "青云签台掌签人，不替人决定命数，只把迷雾里的灯拨亮一点。";
  if (profile.key === "inspire") return "灵感坊的火种贩子，专把空白、卡壳和无聊烧成一句可以开头的话。";
  if (profile.key === "network") return "人情桥边最会递话的人，知道长安城里每一段未送达的消息。";
  if (profile.key === "fame") return "名望楼执册人，把每一次买卖、称号与图鉴都认真记入心市名录。";
  if (profile.key === "memory") return "旧梦仓的守仓人，收想念，也卖那些还没被好好讲完的旧故事。";
  if (profile.key === "repair") return "和笺铺掌笺人，替人把太重的话裁轻，把说不出口的话写成书信。";
  if (profile.key === "trade") return "心货行的老铁算盘，相信情绪也有行情，买卖也能看见人心冷暖。";
  if (profile.key === "stall") return "开摊司的引路人，教新客把自己的表达方式变成一间小小摊位。";
  return `${profile.originalName || profile.name}在天元长街摆着流动心货摊，常把自己的心事交给更懂这个领域的主摊。`;
}

function renderCodexPanel() {
  const cards = [...state.market.profilesByNpcId.values()]
    .filter((profile) => state.market.codex.has(profile.key))
    .map((profile) => {
      const portrait = profilePortraitUrl(profile);
      const tags = (profile.tags || []).map((tag) => `<span class="market-tag">${escapeHtml(tag)}</span>`).join("");
      return `<article class="codex-card">
        <div class="codex-portrait">${portrait ? `<img src="${escapeHtml(portrait)}" alt="" />` : `<span>${escapeHtml(profile.name.slice(0, 1))}</span>`}</div>
        <div class="codex-copy">
          <h3>${escapeHtml(profile.name)}</h3>
          <p class="codex-meta">${escapeHtml(profile.title)} · ${escapeHtml(profile.area)}</p>
          <p><b>个性</b>${escapeHtml(profile.personality)}</p>
          <p><b>生平</b>${escapeHtml(profileCodexBio(profile))}</p>
          <p><b>交易</b>售 ${escapeHtml((profile.sells || []).map((item) => item.item).join("、") || "心货")}，收 ${escapeHtml((profile.buys || []).map((item) => item.item).join("、") || "心事")}</p>
          <p class="codex-line">“${escapeHtml(profile.line)}”</p>
          <div class="market-tags">${tags}</div>
          ${profile.modelName ? `<small>原型：${escapeHtml(profile.originalName)} / ${escapeHtml(profile.modelName)}</small>` : ""}
        </div>
      </article>`;
    })
    .join("");
  const achievements = [...state.market.achievements]
    .map((id) => (MARKET_ACHIEVEMENTS[id] ? { id, ...MARKET_ACHIEVEMENTS[id] } : null))
    .filter(Boolean)
    .map((item) => `<div class="title-card"><strong>${escapeHtml(item.name)}</strong><small>${escapeHtml(item.desc)}</small></div>`)
    .join("");
  marketPanel("心市图鉴", `<p class="market-muted">已解锁 ${state.market.codex.size} 张人格摊主卡。称号、人物、生平和交易关系都会在这里沉淀。</p>
    <h3>已获称号</h3>
    <div class="title-grid">${achievements || '<div class="title-card"><strong>暂无称号</strong><small>完成第一次买卖后会解锁「问心入市」。</small></div>'}</div>
    <h3>人物图鉴</h3>
    <div class="market-list codex-list">${cards || '<p>还没有图鉴，先点击 NPC 完成交易。</p>'}</div>`);
}

function renderLedgerPanel() {
  const rows = state.market.records
    .map((record) => `<div class="market-card"><strong>${escapeHtml(record.time)} · ${escapeHtml(record.action)} ${escapeHtml(record.item)} (${escapeHtml(record.amount)})</strong><small>${escapeHtml(record.npc)}：${escapeHtml(record.result || "已记入交易簿")}</small></div>`)
    .join("");
  marketPanel("交易簿", `<p class="market-muted">每次买卖、求签、引荐和开摊都会留下记录。</p><div class="market-list">${rows || '<p>暂无交易记录。</p>'}</div>`);
}

function contestCreativityMetrics() {
  const tradeScore = Math.min(100, (state.market.counters.bought > 0 ? 34 : 0) + (state.market.counters.sold > 0 ? 34 : 0) + Math.min(32, Math.round(state.market.moodScore / 3)));
  const marketScore = Math.min(100, 40 + (state.market.commissions?.completed?.size ? 30 : 0) + Math.min(30, (currentDailyMarket().headlines?.length || 0) * 6));
  const stallScore = Math.min(100, (state.market.stall?.signboard === "open" ? 25 : 0) + Math.min(45, state.market.counters.stallSales * 30) + Math.min(30, state.market.stall?.reputation || 0));
  const exploreScore = Math.min(100, Math.round((state.market.areas.size / MARKET_AREAS.length) * 55) + Math.min(45, state.market.codex.size * 9));
  const accessScore = Math.min(100, 45 + (state.market.guideSeen ? 25 : 0) + (state.tutorial.dismissed ? 10 : 0) + (state.guidance?.npcId ? 20 : 0));
  const systemScore = Math.min(100, 28 + Math.min(28, (state.market.orders || []).length * 5) + (state.market.auction ? 22 : 0) + Math.min(22, state.market.achievements.size * 4));
  const metrics = [
    { name: "情绪交易", score: tradeScore, desc: "把犹豫、疲惫、灵感等抽象心事变成可买可卖的心货。" },
    { name: "动态行情", score: marketScore, desc: "每日涨跌、场景价差、套利委托共同影响买卖与小摊价格。" },
    { name: "小摊表达", score: stallScore, desc: "来客有偏好，玩家写回应，系统给匹配评分、成交价和口碑变化。" },
    { name: "长安探索", score: exploreScore, desc: "NPC、场景、图鉴和带路按钮把开放地图变成路线式探索。" },
    { name: "新手可达", score: accessScore, desc: "右下角地图控件、手札、指引、HUD 目标降低初次上手成本。" },
    { name: "扩展空间", score: systemScore, desc: "订单、拍卖、称号、记录簿让作品具备继续扩展的经营框架。" },
  ];
  const total = Math.round(metrics.reduce((sum, item) => sum + item.score, 0) / metrics.length);
  return { total, metrics };
}

function contestScoreLabel(score) {
  if (score >= 85) return "成熟可展示";
  if (score >= 70) return "亮点清晰";
  if (score >= 55) return "可继续补强";
  return "先跑通主循环";
}

function renderContestCreativityPanel() {
  unlockAchievement("creativeCurator");
  const { total, metrics } = contestCreativityMetrics();
  const metricCards = metrics
    .map((item) => `<div class="contest-metric">
      <div><strong>${escapeHtml(item.name)}</strong><span>${item.score}</span></div>
      <i><b style="width:${item.score}%"></b></i>
      <small>${escapeHtml(item.desc)}</small>
    </div>`)
    .join("");
  const routeCards = [
    { tag: "1", title: "30 秒看懂主题", text: "领取入市钱袋，确认“心事也可以成为货物”的核心设定。", action: "newbie", label: "打开指引" },
    { tag: "2", title: "1 分钟验证玩法", text: "找初始引导人卖出今日一念，再买入第一件心货，让心情条变化。", action: "refer", key: currentEntranceChoice().recommend || "comfort", label: "标记引导人" },
    { tag: "3", title: "2 分钟看到创新", text: "打开今日行情，看同一心货在不同场景的价差和委托路线。", action: "daily-market", label: "查看行情" },
    { tag: "4", title: "3 分钟体验差异", text: "挂出小摊招牌，按来客偏好写一句回应，观察匹配评分、价格和口碑。", action: "stall", label: "经营小摊" },
  ]
    .map((item) => `<div class="contest-route-card">
      <span>${escapeHtml(item.tag)}</span>
      <div>
        <strong>${escapeHtml(item.title)}</strong>
        <small>${escapeHtml(item.text)}</small>
        <button data-market-action="${escapeHtml(item.action)}"${item.key ? ` data-key="${escapeHtml(item.key)}"` : ""} type="button">${escapeHtml(item.label)}</button>
      </div>
    </div>`)
    .join("");
  marketPanel(
    "参赛创意札",
    `<section class="contest-hero">
       <span>比赛亮点</span>
       <h3>长安集市里的情绪经济系统</h3>
       <p>作品把“心情、话术、关系、行情”做成可操作的游戏循环：玩家不是读设定，而是在买卖、探索、开摊和回应来客时理解设定。</p>
       <div class="contest-score"><strong>${total}</strong><small>${escapeHtml(contestScoreLabel(total))}</small></div>
     </section>
     <h3>创意评分</h3>
     <div class="contest-metric-grid">${metricCards}</div>
     <h3>评委体验路线</h3>
     <div class="contest-route-list">${routeCards}</div>
     <h3>一句话介绍</h3>
     <div class="guide-status-card"><strong>如果只能讲一句：</strong><small>这是一款把古风长安、情绪交易、动态行情和玩家话术评分结合起来的轻量经营探索游戏。</small></div>`
  );
}

function renderMoodKlineSvg() {
  const currentScore = clampMoodScore(state.market.moodScore);
  const candles = state.market.moodCandles?.length
    ? state.market.moodCandles
    : [{ time: "--:--", reason: "未入市", open: currentScore, close: currentScore, high: currentScore, low: currentScore }];
  const width = 460;
  const height = 184;
  const padX = 34;
  const padTop = 24;
  const padBottom = 30;
  const plotW = width - padX * 2;
  const plotH = height - padTop - padBottom;
  const step = plotW / Math.max(1, candles.length);
  const baseY = padTop + plotH;
  const xAt = (index) => padX + step * index + step / 2;
  const y = (score) => padTop + (100 - clampMoodScore(score)) / 100 * plotH;
  const chartId = `moodKline${candles.length}${currentScore}${Math.round(Math.random() * 100000)}`;
  const areaId = `${chartId}Area`;
  const glowId = `${chartId}Glow`;
  const gridScores = [0, 25, 50, 75, 100];
  const grid = gridScores
    .map((score) => {
      const yy = y(score).toFixed(1);
      return `<line x1="${padX}" y1="${yy}" x2="${width - padX}" y2="${yy}" /><text x="${padX - 8}" y="${(Number(yy) + 4).toFixed(1)}">${score}</text>`;
    })
    .join("");
  const closePoints = candles.map((item, index) => `${xAt(index).toFixed(1)},${y(item.close).toFixed(1)}`);
  const line = closePoints.join(" ");
  const area = `${xAt(0).toFixed(1)},${baseY.toFixed(1)} ${line} ${xAt(candles.length - 1).toFixed(1)},${baseY.toFixed(1)}`;
  const bodies = candles
    .map((item, index) => {
      const x = xAt(index);
      const openY = y(item.open);
      const closeY = y(item.close);
      const highY = y(item.high);
      const lowY = y(item.low);
      const top = Math.min(openY, closeY);
      const bodyH = Math.max(4, Math.abs(closeY - openY));
      const bodyW = Math.max(6, Math.min(16, step * 0.46));
      const up = item.close >= item.open;
      return `<g class="candle ${up ? "is-up" : "is-down"}">
        <line class="wick" x1="${x.toFixed(1)}" y1="${highY.toFixed(1)}" x2="${x.toFixed(1)}" y2="${lowY.toFixed(1)}" />
        <rect x="${(x - bodyW / 2).toFixed(1)}" y="${top.toFixed(1)}" width="${bodyW.toFixed(1)}" height="${bodyH.toFixed(1)}" rx="2" />
      </g>`;
    })
    .join("");
  const latest = candles[candles.length - 1];
  const latestX = xAt(candles.length - 1);
  const latestY = y(latest.close);
  const labelOnLeft = latestX > width - padX - 58;
  const labelX = labelOnLeft ? latestX - 12 : latestX + 12;
  const labelAnchor = labelOnLeft ? "end" : "start";
  const high = Math.max(...candles.map((item) => clampMoodScore(item.high)));
  const low = Math.min(...candles.map((item) => clampMoodScore(item.low)));
  const firstTime = candles[0]?.time || "--:--";
  const lastTime = latest?.time || "--:--";
  return `<svg class="mood-kline-chart" viewBox="0 0 ${width} ${height}" role="img" aria-label="心情K线">
    <defs>
      <linearGradient id="${areaId}" x1="0" x2="0" y1="0" y2="1">
        <stop offset="0%" stop-color="#418b65" stop-opacity="0.34" />
        <stop offset="100%" stop-color="#418b65" stop-opacity="0" />
      </linearGradient>
      <filter id="${glowId}" x="-20%" y="-60%" width="140%" height="220%">
        <feGaussianBlur stdDeviation="2.5" result="blur" />
        <feMerge>
          <feMergeNode in="blur" />
          <feMergeNode in="SourceGraphic" />
        </feMerge>
      </filter>
    </defs>
    <rect class="chart-frame" x="8" y="8" width="${width - 16}" height="${height - 16}" rx="12" />
    <text class="chart-caption" x="${padX}" y="18">心情指数</text>
    <text class="chart-summary" x="${width - padX}" y="18">高 ${high} · 低 ${low}</text>
    <g class="grid">${grid}</g>
    <polygon class="mood-area" points="${area}" fill="url(#${areaId})" />
    ${bodies}
    <polyline class="mood-line" points="${line}" filter="url(#${glowId})" />
    <g class="last-marker">
      <line x1="${latestX.toFixed(1)}" y1="${padTop}" x2="${latestX.toFixed(1)}" y2="${baseY}" />
      <circle cx="${latestX.toFixed(1)}" cy="${latestY.toFixed(1)}" r="4.4" />
      <text x="${labelX.toFixed(1)}" y="${(latestY + 4).toFixed(1)}" text-anchor="${labelAnchor}">${clampMoodScore(latest.close)}%</text>
    </g>
    <g class="time-axis">
      <text x="${padX}" y="${height - 12}">${escapeHtml(firstTime)}</text>
      <text x="${width - padX}" y="${height - 12}" text-anchor="end">${escapeHtml(lastTime)}</text>
    </g>
  </svg>`;
}

function renderMoodKlinePanel() {
  ensureDirectorState().exchangeSeen = true;
  const rows = [...(state.market.moodCandles || [])].slice(-8).reverse()
    .map((item) => `<div class="market-card">
      <strong>${escapeHtml(item.time)} · ${escapeHtml(item.reason)}</strong>
      <small>开 ${item.open} · 高 ${item.high} · 低 ${item.low} · 收 ${item.close}，${escapeHtml(moodStage(item.close))}</small>
    </div>`)
    .join("");
  marketPanel(
    "心情 K 线",
    `<p class="market-muted">每次交谈、买卖、求签、开摊成交都会写入心情走势。这里把“心情由坏转好”做成市场盘面。</p>
     <div class="mood-kline-wrap">${renderMoodKlineSvg()}</div>
     <div class="guide-status-card"><strong>当前收盘：${state.market.moodScore}% · ${escapeHtml(moodStage(state.market.moodScore))}</strong><small>${escapeHtml(state.market.lastMoodReason || "尚未产生明显波动")}</small></div>
     <div class="market-row">
       <button data-market-action="orders" type="button">看情绪订单板</button>
       <button data-market-action="auction" type="button">去心货拍卖</button>
       <button class="guide-secondary" data-market-action="exchange" type="button">返回心市</button>
     </div>
     <h3>最近波动</h3>
     <div class="market-list">${rows || '<p>暂无 K 线记录，先完成入市问心帖。</p>'}</div>`
  );
  renderMarketHud();
}

function renderEmotionOrdersPanel(notice = "") {
  if (!state.market.orders?.length) state.market.orders = createMarketOrders();
  const rows = state.market.orders.map((order) => {
    const count = marketInventoryCount(order.want);
    const completed = Boolean(order.completed);
    return `<article class="order-card ${completed ? "is-complete" : order.hot ? "is-hot" : ""}">
      <span>${completed ? "已交付" : order.hot ? "急单" : "求购"}</span>
      <div>
        <strong>${escapeHtml(order.requester)} 求购「${escapeHtml(order.want)}」</strong>
        <small>${escapeHtml(order.note)} 今日行情：${escapeHtml(order.label)}。你持有 ${count}，交付可得 ${order.reward} 心币。</small>
        <div class="market-route-actions">
          ${completed ? `<button data-market-action="ledger" type="button">查看交易簿</button>` : count > 0 ? `<button data-market-action="complete-order" data-id="${escapeHtml(order.id)}" type="button">交付订单 · 卖出${escapeHtml(order.want)}</button>` : `<button data-market-action="refer" data-key="${escapeHtml(order.sourceKey)}" type="button">去找货源</button>`}
          ${!completed ? `<button class="guide-secondary" data-market-action="refer" data-key="${escapeHtml(order.areaKey)}" type="button">标记交付处</button>` : ""}
        </div>
      </div>
    </article>`;
  }).join("");
  marketPanel(
    "情绪订单板",
    `${notice ? `<p class="market-notice">${escapeHtml(notice)}</p>` : ""}
     <p class="market-muted">订单板把市场需求直接摆出来：先获得或买入心货，再交付卖出。适合比赛时快速展示“能买、能卖、能接单”。</p>
     <div class="market-list">${rows}</div>
     <div class="market-row">
       <button data-market-action="exchange" type="button">返回心市</button>
       <button class="guide-secondary" data-market-action="daily-market" type="button">查看今日行情</button>
     </div>`
  );
}

function completeEmotionOrder(id) {
  const order = state.market.orders?.find((item) => item.id === id);
  if (!order) return;
  if (order.completed) {
    renderEmotionOrdersPanel("这张订单已经交付过了。");
    return;
  }
  if (marketInventoryCount(order.want) <= 0) {
    renderEmotionOrdersPanel(`你还没有「${order.want}」。先去买入、求签、交谈或找对应摊主获得。`);
    return;
  }
  addMarketItem(order.want, -1);
  addMarketItem("交易凭证", 1);
  order.completed = true;
  state.market.coins += order.reward;
  improveMood(9, `交付订单「${order.want}」`);
  unlockAchievement("orderBroker");
  addMarketRecord({ npc: order.requester, action: "订单交付", item: order.want, amount: order.reward, result: `情绪订单成交：${order.note}` });
  triggerMarketFx("order", `订单成交 +${order.reward}`, marketCoreProfileByKey(order.areaKey));
  renderEmotionOrdersPanel(`成交。你向${order.requester}交付「${order.want}」，收入 ${order.reward} 心币。`);
}

function currentAuction() {
  if (!state.market.auction) state.market.auction = createAuctionState();
  return state.market.auction;
}

function finishAuction(price, mode = "落槌") {
  const auction = currentAuction();
  if (state.market.coins < price) {
    renderAuctionPanel(`心币不足。当前需要 ${price} 心币，你只有 ${state.market.coins}。`);
    return;
  }
  state.market.coins -= price;
  addMarketItem(auction.item, 1);
  addMarketItem("交易凭证", 1);
  auction.closed = true;
  auction.winner = "玩家";
  improveMood(7, `${mode}拍得「${auction.item}」`);
  unlockAchievement("auctionWinner");
  addMarketRecord({ npc: auction.auctioneer, action: mode, item: auction.item, amount: -price, result: `心货拍卖成交，${auction.pitch}` });
  triggerMarketFx("auction", `落槌「${auction.item}」`, marketCoreProfileByKey(auction.sourceKey));
  renderAuctionPanel(`${mode}。你以 ${price} 心币拍得「${auction.item}」。`);
}

function placeAuctionBid() {
  const auction = currentAuction();
  if (auction.closed) {
    state.market.auction = createAuctionState(auction.index + 1);
    renderAuctionPanel("上一件拍品已经落槌，已换上新拍品。");
    return;
  }
  const bid = Math.max(auction.npcBid, auction.playerBid) + 2 + auction.rounds;
  if (state.market.coins < bid) {
    renderAuctionPanel(`你举不起这一牌。下一口至少 ${bid} 心币。`);
    return;
  }
  auction.playerBid = bid;
  auction.rounds += 1;
  if (bid >= auction.buyout || auction.rounds >= 2) {
    finishAuction(bid, "举牌落槌");
    return;
  }
  auction.npcBid = Math.min(auction.buyout - 1, bid + 2);
  renderAuctionPanel(`你举牌到 ${bid} 心币，${auction.auctioneer}那边有人追到 ${auction.npcBid}。再举一次即可争取落槌。`);
}

function buyoutAuction() {
  const auction = currentAuction();
  if (auction.closed) {
    renderAuctionPanel("这件拍品已经成交，可以换下一件。");
    return;
  }
  finishAuction(auction.buyout, "一口价");
}

function passAuction() {
  const current = currentAuction();
  state.market.auction = createAuctionState(current.index + 1);
  renderAuctionPanel("已换上下一件拍品。");
}

function renderAuctionPanel(notice = "") {
  const auction = currentAuction();
  const status = auction.closed
    ? `已由${auction.winner || "买家"}拍得`
    : auction.playerBid
    ? `你出价 ${auction.playerBid}，当前场上最高 ${Math.max(auction.playerBid, auction.npcBid)}`
    : `起拍 ${auction.base}，当前 NPC 出价 ${auction.npcBid}`;
  marketPanel(
    "心货拍卖",
    `${notice ? `<p class="market-notice">${escapeHtml(notice)}</p>` : ""}
     <section class="auction-card ${auction.closed ? "is-closed" : ""}">
       <span>${escapeHtml(auction.trendLabel)}拍品</span>
       <h3>${escapeHtml(auction.item)}</h3>
       <p>${escapeHtml(auction.pitch)}</p>
       <div class="auction-stats">
         <div><strong>${auction.base}</strong><small>起拍</small></div>
         <div><strong>${auction.npcBid}</strong><small>NPC 出价</small></div>
         <div><strong>${auction.buyout}</strong><small>一口价</small></div>
       </div>
       <div class="guide-status-card"><strong>${escapeHtml(status)}</strong><small>拍卖只使用虚拟心币；拍得后心货进入你的手札，可继续转卖或交订单。</small></div>
       <div class="market-row">
         ${auction.closed ? `<button data-market-action="auction-pass" type="button">下一件拍品</button>` : `<button data-market-action="auction-bid" type="button">举牌加价</button><button data-market-action="auction-buyout" type="button">一口价拿下</button>`}
         <button class="guide-secondary" data-market-action="refer" data-key="${escapeHtml(auction.sourceKey)}" type="button">找原摊主</button>
         <button class="guide-secondary" data-market-action="exchange" type="button">返回心市</button>
       </div>
     </section>`
  );
}

function renderMarketExchangePanel() {
  ensureDirectorState().exchangeSeen = true;
  const readyOrders = (state.market.orders || []).filter((order) => !order.completed && marketInventoryCount(order.want) > 0);
  const openOrders = (state.market.orders || []).filter((order) => !order.completed).length;
  const auction = currentAuction();
  marketPanel(
    "心市",
    `<p class="market-muted">这里是前三分钟的记忆点：刚才的买卖会写进心情 K 线，后续订单、拍卖和行情都围绕心货流通展开。</p>
     <div class="guide-status-card"><strong>当前收盘：${state.market.moodScore}% · ${escapeHtml(moodStage(state.market.moodScore))}</strong><small>${escapeHtml(state.market.lastMoodReason || "完成第一轮买卖后，这里会显示你的心情波动。")}</small></div>
     <div class="exchange-grid">
       <article class="exchange-card">
         <span>心情 K 线</span>
         <div class="mini-kline">${renderMoodKlineSvg()}</div>
         <strong>${state.market.moodScore}% · ${escapeHtml(moodStage(state.market.moodScore))}</strong>
         <small>${escapeHtml(state.market.lastMoodReason || "完成交易后会形成走势")}</small>
         <button data-market-action="mood-kline" type="button">查看走势</button>
       </article>
       <article class="exchange-card">
         <span>情绪订单板</span>
         <strong>${readyOrders.length} 张可交付 · ${openOrders} 张未完成</strong>
         <small>有货就能直接卖出，没货就按订单去找货源。</small>
         <button data-market-action="orders" type="button">查看订单板</button>
       </article>
       <article class="exchange-card">
         <span>心货拍卖</span>
         <strong>${escapeHtml(auction.item)} · 起拍 ${auction.base}</strong>
         <small>${escapeHtml(auction.pitch)}</small>
         <button data-market-action="auction" type="button">进入拍卖</button>
       </article>
     </div>
     <div class="market-row">
       <button class="guide-secondary" data-market-action="daily-market" type="button">今日行情</button>
       <button class="guide-secondary" data-market-action="ledger" type="button">交易簿</button>
     </div>`
  );
  renderMarketHud();
}

function renderDailyMarketPanel() {
  ensureDirectorState().dailySeen = true;
  const daily = currentDailyMarket();
  const headlineText = daily.headlines.length
    ? daily.headlines.map((item) => `「${item.item}」${item.label}`).join("，")
    : "今日心货平稳流通";
  const itemRows = MARKET_PRICE_ITEMS.map((item) => {
    const trend = marketTrendForItem(item);
    const change = Math.round((trend.multiplier - 1) * 100);
    return `<div class="market-rate is-${escapeHtml(trend.key)}">
      <span>${escapeHtml(trend.tone)}</span>
      <strong>${escapeHtml(item)} · ${escapeHtml(trend.label)}</strong>
      <small>${change > 0 ? "+" : ""}${change}% · ${escapeHtml(trend.note)}</small>
    </div>`;
  }).join("");
  const areaRows = MARKET_AREAS.map((area) => {
    const quote = marketAreaRate(area.key);
    return `<div class="market-card">
      <strong>${escapeHtml(area.name)} · ${escapeHtml(quote.note)}</strong>
      <small>买入价 ${Math.round(quote.buy * 100)}% · 卖出价 ${Math.round(quote.sell * 100)}%。本地偏好：${escapeHtml((MARKET_AREA_AFFINITY[area.key] || []).slice(0, 4).join("、") || "无")}。</small>
      ${state.market.coreNpcByKey.get(area.key) ? `<button data-market-action="refer" data-key="${escapeHtml(area.key)}" type="button">前往${escapeHtml(area.name)}</button>` : ""}
    </div>`;
  }).join("");
  const commission = activeMarketCommission();
  const commissionButtons =
    commission.stage === "completed"
      ? `<button data-market-action="codex" type="button">查看称号图鉴</button>`
      : commission.stage === "sell"
      ? `<button data-market-action="refer" data-key="${escapeHtml(commission.sellKey)}" type="button">去卖给${escapeHtml(commission.sellName)}</button>`
      : `<button data-market-action="refer" data-key="${escapeHtml(commission.buyKey)}" type="button">去买${escapeHtml(commission.item)}</button>`;
  const routeRows = marketRouteRecommendations()
    .map((route) => `<div class="market-route-card ${route.profit >= 0 ? "is-profit" : "is-risk"}">
      <span>${route.profit >= 0 ? "赚" : "险"}</span>
      <div>
        <strong>${escapeHtml(route.title)} · ${escapeHtml(route.item)}</strong>
        <small>${escapeHtml(route.buyName)} ${route.buyPrice ? `买 ${route.buyPrice}` : "获得"} → ${escapeHtml(route.sellName)} 卖 ${route.sellPrice}，预估${route.profit >= 0 ? "收益" : "差价"} ${route.profit} 心币。${escapeHtml(route.note)}</small>
        <div class="market-route-actions">
          ${route.buyKey ? `<button data-market-action="refer" data-key="${escapeHtml(route.buyKey)}" type="button">标记买入点</button>` : ""}
          ${route.sellKey ? `<button data-market-action="refer" data-key="${escapeHtml(route.sellKey)}" type="button">标记卖出点</button>` : ""}
        </div>
      </div>
    </div>`)
    .join("");
  const stall = state.market.stall || defaultStallState();
  const stallTrend = marketTrendForItem(stall.product);
  marketPanel(
    "今日行情",
    `<p class="market-muted">今日 ${escapeHtml(daily.dateKey)}，长安心市价格会同时影响 NPC 买卖和你的小摊成交。不同场景有不同买入价、卖出价，本地偏好的心货会再修正一次。</p>
     <div class="guide-status-card"><strong>行情摘记：${escapeHtml(headlineText)}</strong><small>当前小摊主售「${escapeHtml(stall.product)}」为${escapeHtml(stallTrend.label)}，口碑 ${stall.reputation || 0}/100 · ${escapeHtml(stallReputationLabel(stall.reputation))}。</small></div>
     <section class="commission-card">
       <span>今日委托</span>
       <h3>${escapeHtml(commission.title)}</h3>
       <p>${escapeHtml(commission.status)}</p>
       <small>奖励：${commission.reward} 心币 · 称号「行商小牙人」。这条路线专门展示“先买入，再卖出”的市场属性。</small>
       <div class="market-row">${commissionButtons}</div>
     </section>
     <h3>推荐套利路线</h3>
     <div class="market-route-list">${routeRows}</div>
     <h3>心货涨跌</h3>
     <div class="daily-market-grid">${itemRows}</div>
     <h3>场景价差</h3>
     <div class="market-list">${areaRows}</div>`
  );
  renderMarketHud();
}

function renderAreaPanel() {
  const rows = MARKET_AREAS.map((area) => {
    const unlocked = state.market.areas.has(area.key);
    const npc = state.market.coreNpcByKey.get(area.key);
    const npcName = npc ? displayNpcName(npc) : "待开放摊主";
    return `<div class="market-card ${unlocked ? "is-unlocked" : ""}"><strong>${escapeHtml(area.name)} · ${escapeHtml(area.focus)}</strong><small>${escapeHtml(area.note)} 主摊：${escapeHtml(npcName)}。${unlocked ? "已入图鉴" : "点击主摊后解锁"}</small>${npc ? `<button data-market-action="refer" data-key="${escapeHtml(area.key)}" type="button">前往主摊</button>` : ""}</div>`;
  }).join("");
  marketPanel(
    "场景图鉴",
    `<p class="market-muted">长安城被重写为 ${MARKET_SCENE_TOTAL} 处心市景点；当前先开放 10 个核心场景，普通 NPC 会把你引向对应领域的主摊。</p><div class="market-list">${rows}</div>`
  );
}

function renderWelcomeMarketPanel(notice = "") {
  if (state.market.entranceCompleted) {
    renderGuidePanel();
    return;
  }
  state.market.guideSeen = true;
  const cards = ENTRY_INTENT_CHOICES.map(
    (choice) => `<button class="intent-card" data-market-action="choose-intent" data-key="${escapeHtml(choice.key)}" type="button">
      <strong>${escapeHtml(choice.item)}</strong>
    </button>`
  ).join("");
  guidePanel(
    "入市问心帖",
    `${notice ? `<p class="market-notice">${escapeHtml(notice)}</p>` : ""}
     <p class="market-muted">先选一枚今日一念。心市会把它变成你的第一件可交易心货，并给你一条三分钟路线：卖出、买入、看行情、开摊接客。</p>
     <div class="intent-grid">${cards}</div>
     <div class="custom-intent">
       <label for="customIntentInput">写下我现在的状态</label>
       <div>
         <input id="customIntentInput" maxlength="28" placeholder="例如：我有点焦虑，不知道该怎么开始" />
         <button class="guide-primary" data-market-action="match-intent" type="button">帮我匹配</button>
       </div>
     </div>
     <p class="market-muted">确认领取后，左上角路线会持续提示下一步；不知道去哪就点路线按钮。</p>`
  );
}

function renderStallPanel(notice = "") {
  const stall = state.market.stall;
  const personalities = ["温和", "犀利", "玄学", "理性", "诗意"];
  const products = ["安慰", "批评", "建议", "灵感", "签语"];
  const visitor = stall.visitor;
  const pButtons = personalities
    .map((item) => `<button class="${stall.personality === item ? "is-selected" : ""}" data-market-action="stall-personality" data-value="${escapeHtml(item)}" type="button"${visitor ? " disabled" : ""}>${escapeHtml(item)}</button>`)
    .join("");
  const productButtons = products
    .map((item) => `<button class="${stall.product === item ? "is-selected" : ""}" data-market-action="stall-product" data-value="${escapeHtml(item)}" type="button"${visitor ? " disabled" : ""}>${escapeHtml(item)}</button>`)
    .join("");
  const isOpen = stall.signboard === "open";
  const status = visitor ? "来客在摊前" : isOpen ? "招牌已挂出" : "招牌未挂出";
  const visitorQuote = visitor ? stallVisitorQuote(stall, visitor) : null;
  const visitorCard = visitor
    ? `<section class="stall-visitor">
        <span class="stall-badge">来客状态</span>
        <h3>${escapeHtml(visitor.name)}</h3>
        <p>${escapeHtml(visitor.line)}</p>
        <div class="guide-status-card">
          <strong>${escapeHtml(visitor.need)}</strong>
          <small>${escapeHtml(visitorPreferenceText(visitor))}。若成交，将以「${escapeHtml(stall.personality)}」的方式卖出「${escapeHtml(stall.product)}」。</small>
        </div>
        <div class="stall-score">
          <div><strong>匹配 ${visitorQuote.score}/100 · ${escapeHtml(visitorQuote.label)}</strong><small>${escapeHtml(visitorQuote.reasons.join("、"))}</small></div>
          <span class="match-meter"><i style="width:${visitorQuote.score}%"></i></span>
        </div>
        <div class="guide-status-card">
          <strong>预估成交价 ${visitorQuote.price} 心币</strong>
          <small>基础 ${visitorQuote.base}，${escapeHtml(visitorQuote.detail)}；成交或婉拒后会短间隔预约下一位客人。</small>
        </div>
        <div class="stall-response-box">
          <label for="stallReplyInput">写一句你要卖给来客的话</label>
          <textarea id="stallReplyInput" maxlength="90" placeholder="例如：先别急着把整条路走完，今晚只要把第一步写下来。"></textarea>
          <small>系统会按字数、关键词、摊位个性和来客需求评估成交价与口碑。</small>
        </div>
        <div class="market-row">
          <button data-market-action="stall-deal" data-kind="sell" type="button">递上回应并成交</button>
          <button class="guide-secondary" data-market-action="stall-decline" type="button">婉拒这位客人</button>
          <button class="guide-secondary" data-market-action="close-panel" type="button">先让客人等一下</button>
        </div>
      </section>`
    : `<div class="trade-primer">
        <strong>${isOpen ? "招牌状态：营业中" : "招牌状态：未营业"}</strong>
        <small>${isOpen ? "下一位客人正在路上。你可以关掉面板继续逛，客人到后再从「开摊」入口处理。" : "手札里只设置招牌；点「挂出招牌」后，第一位客人会立刻来到摊前。"}</small>
      </div>`;
  stallPanel(
    "我的心货小摊",
    `${notice ? `<p class="market-notice">${escapeHtml(notice)}</p>` : ""}
     <p class="market-muted">先设置招牌，再挂出营业。成交或婉拒一位来客后，系统会短间隔预约下一位，面板可以随时关掉。</p>
     <div class="stall-status-grid">
       <div class="market-card"><span class="stall-badge">招牌状态</span><strong>${escapeHtml(status)}</strong><small>${escapeHtml(stall.sign)}</small></div>
       <div class="market-card"><span class="stall-badge">今日小摊</span><strong>${state.market.counters.stallSales} 单成交</strong><small>${isOpen ? "招牌挂着，客人会陆续来。" : "招牌收起时不会来新客。"}</small></div>
       <div class="market-card"><span class="stall-badge">口碑</span><strong>${stall.reputation || 0}/100 · ${escapeHtml(stallReputationLabel(stall.reputation))}</strong><small>匹配度高的成交会涨口碑，勉强成交会伤口碑。</small></div>
     </div>
     ${visitorCard}
     <h3>摊位个性</h3><div class="market-row">${pButtons}</div>
     <h3>售卖内容</h3><div class="market-row">${productButtons}</div>
     <div class="market-row">
       ${isOpen ? `<button class="guide-secondary" data-market-action="stall-close-sign" type="button">收起招牌</button>` : `<button data-market-action="stall-open-sign" data-kind="sell" type="button">挂出招牌</button>`}
       <button class="guide-secondary" data-market-action="close-panel" type="button">关掉面板继续逛</button>
     </div>`
  );
}

function stallPanel(title, body) {
  if (!els.marketPanel || !els.marketPanelBody) return;
  els.marketPanel.dataset.panel = "stall";
  els.marketPanelBody.innerHTML = `<h2>${escapeHtml(title)}</h2>${body}`;
  els.marketPanel.hidden = false;
}

function nextStallVisitor() {
  const stall = state.market.stall;
  const pool = STALL_VISITOR_POOL[stall.product] || Object.values(STALL_VISITOR_POOL).flat();
  const index = stall.visitorIndex % pool.length;
  stall.visitorIndex += 1;
  return { ...pool[index], product: stall.product, personality: stall.personality };
}

function renderStallArrivalPanel() {
  const stall = state.market.stall;
  const visitor = stall?.visitor;
  if (!visitor) return;
  const quote = stallVisitorQuote(stall, visitor);
  stallPanel(
    "有客到摊前",
    `<p class="market-muted">你的小摊招牌被人看见了。可以现在接待，也可以先放着，继续探索长安。</p>
     <section class="stall-visitor">
       <span class="stall-badge">新来客</span>
       <h3>${escapeHtml(visitor.name)}</h3>
       <p>${escapeHtml(visitor.line)}</p>
       <div class="guide-status-card"><strong>${escapeHtml(visitor.need)}</strong><small>${escapeHtml(visitorPreferenceText(visitor))}。预估成交价 ${quote.price} 心币，匹配 ${quote.score}/100。</small></div>
       <div class="market-row">
         <button data-market-action="stall" type="button">接待这位来客</button>
         <button class="guide-secondary" data-market-action="close-panel" type="button">稍后处理</button>
       </div>
     </section>`
  );
}

function showNextStallVisitor() {
  const stall = state.market.stall;
  if (!stall || stall.signboard !== "open" || stall.visitor) return;
  stall.visitor = nextStallVisitor();
  stall.nextVisitorAt = 0;
  renderMarketHud();
  if (els.marketPanel && !els.marketPanel.hidden && els.marketPanel.dataset.panel === "stall") renderStallPanel();
  else if (!els.dialog || els.dialog.hidden) renderStallArrivalPanel();
}

function scheduleNextStallVisitor(delay = STALL_VISITOR_DELAY_MS) {
  const stall = state.market.stall;
  clearStallVisitorTimer();
  if (!stall || stall.signboard !== "open") return;
  stall.nextVisitorAt = Date.now() + delay;
  stall.visitorTimer = window.setTimeout(() => {
    stall.visitorTimer = null;
    showNextStallVisitor();
  }, delay);
  renderMarketHud();
}

function openStallSign() {
  const stall = state.market.stall;
  stall.signboard = "open";
  clearStallVisitorTimer();
  if (!stall.visitor) stall.visitor = nextStallVisitor();
  triggerMarketFx("stall", "招牌已挂出", marketCoreProfileByKey("stall"));
  renderStallPanel();
  renderMarketHud();
}

function closeStallSign() {
  const stall = state.market.stall;
  clearStallVisitorTimer();
  stall.signboard = "closed";
  stall.visitor = null;
  renderStallPanel();
  renderMarketHud();
}

function completeStallVisitor(outcome) {
  const stall = state.market.stall;
  const visitor = stall.visitor;
  if (!visitor) {
    renderStallPanel();
    return;
  }
  const quote = stallVisitorQuote(stall, visitor);
  stall.visitor = null;
  if (outcome === "deal") {
    const response = String(document.querySelector("#stallReplyInput")?.value || "").trim();
    if (!response) {
      stall.visitor = visitor;
      renderStallPanel("先写一句回应给来客，再决定成交。你的话术会影响成交价和口碑。");
      return;
    }
    const responseQuote = stallResponseQuote(stall, visitor, response);
    const reputationDelta = stallReputationDeltaForDeal(responseQuote.score);
    state.market.coins += responseQuote.price;
    setStallReputation((stall.reputation || 0) + reputationDelta);
    state.market.counters.stallSales += 1;
    improveMood(responseQuote.score >= 70 ? 12 : 7, "经营小摊完成成交");
    addMarketItem("成交记录", 1);
    addMarketRecord({ npc: visitor.name, action: "小摊成交", item: stall.product, amount: responseQuote.price, result: `${visitor.need} 回应「${response.slice(0, 26)}」；${responseQuote.label} ${responseQuote.score}/100，口碑 ${reputationDelta >= 0 ? "+" : ""}${reputationDelta}。` });
    triggerMarketFx("stall", `小摊成交 +${responseQuote.price}`, marketCoreProfileByKey("stall"));
    checkMarketAchievements();
    scheduleNextStallVisitor();
    stallPanel(
      "小摊成交",
      `<div class="market-card"><strong>${escapeHtml(visitor.name)}买走了「${escapeHtml(stall.product)}」</strong><small>${escapeHtml(visitor.need)} 收入 ${responseQuote.price} 心币，${escapeHtml(responseQuote.label)} ${responseQuote.score}/100，口碑 ${reputationDelta >= 0 ? "+" : ""}${reputationDelta}。下一位客人会稍后到招牌前。</small></div>
       <div class="guide-status-card"><strong>你的回应</strong><small>${escapeHtml(response)}</small></div>
       <div class="guide-status-card"><strong>成交评估</strong><small>${escapeHtml(responseQuote.responseReasons.join("、"))}；基础报价 ${quote.price}，话术修正 ${responseQuote.responseDelta >= 0 ? "+" : ""}${responseQuote.responseDelta}。</small></div>
       <div class="market-row">
         <button data-market-action="stall" type="button">查看招牌状态</button>
         <button class="guide-secondary" data-market-action="close-panel" type="button">关掉面板继续逛</button>
       </div>`
    );
    return;
  }
  const reputationDelta = quote.score < 55 ? 1 : 0;
  if (reputationDelta) setStallReputation((stall.reputation || 0) + reputationDelta);
  addMarketRecord({ npc: visitor.name, action: "小摊婉拒", item: stall.product, amount: 0, result: `你没有接下这位客人的请求：${visitor.need} 匹配 ${quote.score}/100。${reputationDelta ? "守住边界，口碑 +1。" : ""}` });
  triggerMarketFx("talk", "婉拒来客", marketCoreProfileByKey("stall"));
  scheduleNextStallVisitor();
  stallPanel(
    "已婉拒来客",
    `<div class="market-card"><strong>${escapeHtml(visitor.name)}暂时离摊</strong><small>你婉拒了这次请求。匹配 ${quote.score}/100${reputationDelta ? "，口碑 +1" : ""}。招牌仍挂着，下一位客人会稍后到来。</small></div>
     <div class="market-row">
       <button data-market-action="stall" type="button">查看招牌状态</button>
       <button class="guide-secondary" data-market-action="close-panel" type="button">关掉面板继续逛</button>
     </div>`
  );
}

function handleDirectorAction(event) {
  const button = event.target.closest("[data-director-action]");
  if (!button) return;
  const action = button.dataset.directorAction;
  if (action === "route") {
    renderDirectorRoutePanel();
  } else if (action === "intent") {
    renderWelcomeMarketPanel();
    showNewbieGuide("entry", true);
  } else if (action === "guide") {
    if (!state.market.entranceCompleted) renderWelcomeMarketPanel();
    else focusCoreNpc(currentEntranceChoice().recommend || "comfort");
  } else if (action === "exchange") {
    renderMarketExchangePanel();
  } else if (action === "daily") {
    renderDailyMarketPanel();
  } else if (action === "stall") {
    if (!state.market.entranceCompleted) renderWelcomeMarketPanel();
    else renderStallPanel();
  }
  renderMarketHud();
}

function handleMarketAction(event) {
  const button = event.target.closest("[data-market-action]");
  if (!button) return;
  const action = button.dataset.marketAction;
  const profile = state.market.profilesByNpcId.get(String(button.dataset.npc || ""));
  if (action === "buy") performBuy(profile, Number(button.dataset.index || 0));
  else if (action === "sell") performSell(profile, Number(button.dataset.index || 0));
  else if (action === "fortune") performFortune(profile, false);
  else if (action === "fortune-reroll") performFortune(profile, true);
  else if (action === "refer") focusCoreNpc(button.dataset.key);
  else if (action === "codex") renderCodexPanel();
  else if (action === "ledger") renderLedgerPanel();
  else if (action === "contest-creativity") renderContestCreativityPanel();
  else if (action === "exchange") renderMarketExchangePanel();
  else if (action === "mood-kline") renderMoodKlinePanel();
  else if (action === "orders") renderEmotionOrdersPanel();
  else if (action === "complete-order") completeEmotionOrder(button.dataset.id);
  else if (action === "auction") renderAuctionPanel();
  else if (action === "auction-bid") placeAuctionBid();
  else if (action === "auction-buyout") buyoutAuction();
  else if (action === "auction-pass") passAuction();
  else if (action === "daily-market") renderDailyMarketPanel();
  else if (action === "areas") renderAreaPanel();
  else if (action === "stall" || action === "open-stall") renderStallPanel();
  else if (action === "newbie") reopenNewbieGuide();
  else if (action === "choose-intent") performEntranceChoice(button.dataset.key);
  else if (action === "claim-intent") performEntranceClaim(button.dataset.key);
  else if (action === "restart-intent") {
    state.market.pendingEntranceChoice = "";
    renderWelcomeMarketPanel();
  } else if (action === "match-intent") performEntranceMatch();
  else if (action === "close-panel") closeMarketPanel();
  else if (action === "stall-personality") {
    state.market.stall.personality = button.dataset.value || state.market.stall.personality;
    state.market.stall.sign = stallSignText(state.market.stall.personality, state.market.stall.product);
    renderStallPanel();
  } else if (action === "stall-product") {
    state.market.stall.product = button.dataset.value || state.market.stall.product;
    state.market.stall.sign = stallSignText(state.market.stall.personality, state.market.stall.product);
    renderStallPanel();
  } else if (action === "stall-open-sign") {
    openStallSign();
  } else if (action === "stall-close-sign") {
    closeStallSign();
  } else if (action === "stall-deal") {
    completeStallVisitor("deal");
  } else if (action === "stall-decline") {
    completeStallVisitor("decline");
  }
  renderMarketHud();
}

function handleDialogAction(event) {
  const button = event.target.closest("[data-dialog-action]");
  if (!button) return;
  const action = button.dataset.dialogAction;
  const profile = state.market.profilesByNpcId.get(String(button.dataset.npc || state.dialog.npcId || ""));
  const npc = profile ? npcForProfile(profile) : state.selectedNpc;
  if (action === "root" && npc) renderNpcDialog(npc, "root");
  else if (action === "info" && npc) renderNpcDialog(npc, "info");
  else if (action === "trade" && npc) renderNpcDialog(npc, "trade");
  else if (action === "recommend" && npc) renderNpcDialog(npc, "recommend");
  else if (action === "stall-guide" && npc) renderNpcDialog(npc, "stall-guide");
  else if (action === "say" && npc) renderNpcDialog(npc, "say");
  else if (action === "say-submit") performNpcSay(profile);
  else if (action === "buy") performBuy(profile, Number(button.dataset.index || 0), { dialog: true });
  else if (action === "sell") performSell(profile, Number(button.dataset.index || 0), { dialog: true, mode: state.dialog.mode === "info" ? "info" : "trade" });
  else if (action === "fortune") performFortune(profile, false, { dialog: true });
  else if (action === "fortune-reroll") performFortune(profile, true, { dialog: true });
  else if (action === "refer") focusCoreNpc(button.dataset.key);
  else if (action === "codex") renderCodexPanel();
  else if (action === "ledger") renderLedgerPanel();
  else if (action === "contest-creativity") renderContestCreativityPanel();
  else if (action === "exchange") renderMarketExchangePanel();
  else if (action === "mood-kline") renderMoodKlinePanel();
  else if (action === "orders") renderEmotionOrdersPanel();
  else if (action === "complete-order") completeEmotionOrder(button.dataset.id);
  else if (action === "auction") renderAuctionPanel();
  else if (action === "auction-bid") placeAuctionBid();
  else if (action === "auction-buyout") buyoutAuction();
  else if (action === "auction-pass") passAuction();
  else if (action === "daily-market") renderDailyMarketPanel();
  else if (action === "areas") renderAreaPanel();
  else if (action === "open-stall" || action === "stall") renderStallPanel();
  renderMarketHud();
}

function applyRenderBounds() {
  const rendered = state.render?.scene;
  if (!state.scene || !rendered?.width || !rendered?.height) return;
  state.scene.map = state.scene.map || {};
  state.scene.map.bounds = {
    ...(state.scene.map.bounds || {}),
    width: rendered.width,
    height: rendered.height,
    maxTileX: Math.ceil(rendered.width / TILE_SCALE),
    maxTileY: Math.ceil(rendered.height / TILE_SCALE),
  };
}

function createLayerCanvas(width, height) {
  const w = Math.max(1, Math.ceil(width));
  const h = Math.max(1, Math.ceil(height));
  const layer = typeof OffscreenCanvas === "function" ? new OffscreenCanvas(w, h) : document.createElement("canvas");
  layer.width = w;
  layer.height = h;
  return layer;
}

function invalidatePanCache() {
  state.panCache.valid = false;
  state.panCache.transform = "";
}

function schedulePanCacheRebuild(delay = 80) {
  void delay;
}

function panCacheMargin() {
  const zoom = Number.isFinite(state.zoom) ? state.zoom : 1;
  return Math.round(clampValue(PAN_CACHE_MARGIN * Math.min(1, zoom), PAN_CACHE_MIN_MARGIN, PAN_CACHE_MARGIN));
}

function layerContext(layer, alpha = true) {
  const layerCtx = layer.getContext("2d", { alpha });
  layerCtx.imageSmoothingEnabled = false;
  return layerCtx;
}

function makeChunks(width, height) {
  const cols = Math.ceil(width / CHUNK_WIDTH);
  const rows = Math.ceil(height / CHUNK_HEIGHT);
  const chunks = [];
  for (let row = 0; row < rows; row += 1) {
    for (let col = 0; col < cols; col += 1) {
      const x = col * CHUNK_WIDTH;
      const y = row * CHUNK_HEIGHT;
      chunks.push({
        col,
        row,
        x,
        y,
        width: Math.min(CHUNK_WIDTH, width - x),
        height: Math.min(CHUNK_HEIGHT, height - y),
        items: [],
        canvas: null,
      });
    }
  }
  return { chunks, cols, rows };
}

function pushItemToChunks(item, layer) {
  const minCol = Math.max(0, Math.floor(item.x / CHUNK_WIDTH));
  const maxCol = Math.min(layer.cols - 1, Math.floor((item.x + item.width - 1) / CHUNK_WIDTH));
  const minRow = Math.max(0, Math.floor(item.y / CHUNK_HEIGHT));
  const maxRow = Math.min(layer.rows - 1, Math.floor((item.y + item.height - 1) / CHUNK_HEIGHT));

  for (let row = minRow; row <= maxRow; row += 1) {
    for (let col = minCol; col <= maxCol; col += 1) {
      layer.chunks[row * layer.cols + col].items.push(item);
    }
  }
}

function buildSceneLayers(rendered) {
  const width = Number(rendered?.width || 0);
  const height = Number(rendered?.height || 0);
  const base = makeChunks(width, height);
  const masks = makeChunks(width, height);
  const tiles = [...(rendered?.tiles || [])];
  const maskItems = [...(rendered?.masks || [])];

  for (const tile of tiles) pushItemToChunks(tile, base);
  for (const mask of maskItems) pushItemToChunks(mask, masks);

  return {
    width,
    height,
    cols: base.cols,
    rows: base.rows,
    ready: false,
    base: base.chunks,
    masks: masks.chunks,
    tiles,
    maskItems,
    fullBase: null,
    fullMasks: null,
    useFull: false,
  };
}

function renderFullLayer(layers, items, type) {
  const layer = createLayerCanvas(layers.width, layers.height);
  const layerCtx = layerContext(layer, type !== "base");

  if (type === "base") {
    layerCtx.fillStyle = "#050706";
    layerCtx.fillRect(0, 0, layers.width, layers.height);
  }

  for (const item of items) {
    const record = imageRecord(item.url);
    if (!record?.ready || record.error) continue;
    layerCtx.drawImage(record.image, item.x, item.y, item.width, item.height);
  }
  return layer;
}

function tryComposeFullLayers(layers) {
  const pixels = layers.width * layers.height;
  if (!layers.width || !layers.height || pixels > FULL_LAYER_MAX_PIXELS) return false;

  try {
    layers.fullBase = renderFullLayer(layers, layers.tiles, "base");
    layers.fullMasks = renderFullLayer(layers, layers.maskItems, "mask");
    layers.useFull = true;
    layers.tiles = [];
    layers.maskItems = [];
    for (const chunk of [...layers.base, ...layers.masks]) chunk.items = [];
    return true;
  } catch (error) {
    layers.fullBase = null;
    layers.fullMasks = null;
    layers.useFull = false;
    return false;
  }
}

function renderChunk(chunk, type) {
  if (chunk.canvas) return chunk.canvas;
  if (type === "mask" && !chunk.items.length) return null;

  const layer = createLayerCanvas(chunk.width, chunk.height);
  const layerCtx = layerContext(layer, type !== "base");

  if (type === "base") {
    layerCtx.fillStyle = "#050706";
    layerCtx.fillRect(0, 0, chunk.width, chunk.height);
  }

  for (const item of chunk.items) {
    const record = imageRecord(item.url);
    if (!record?.ready || record.error) continue;
    layerCtx.drawImage(record.image, item.x - chunk.x, item.y - chunk.y, item.width, item.height);
  }

  chunk.canvas = layer;
  chunk.items = [];
  return chunk.canvas;
}

function nextIdleFrame() {
  return new Promise((resolve) => {
    if ("requestIdleCallback" in window) {
      window.requestIdleCallback(resolve, { timeout: 80 });
      return;
    }
    window.setTimeout(resolve, 0);
  });
}

async function composeStaticLayers(layers, onProgress) {
  if (USE_FULL_LAYER && tryComposeFullLayers(layers)) {
    if (onProgress) onProgress(1, 1);
    return;
  }

  const jobs = [
    ...layers.base.map((chunk) => ({ chunk, type: "base" })),
    ...layers.masks.filter((chunk) => chunk.items.length).map((chunk) => ({ chunk, type: "mask" })),
  ];

  for (let index = 0; index < jobs.length; index += 1) {
    renderChunk(jobs[index].chunk, jobs[index].type);
    if (onProgress) {
      onProgress(index + 1, jobs.length);
    }
    if ((index + 1) % 4 === 0) await nextIdleFrame();
  }
}

function drawFullLayer(layer) {
  const layers = state.layers;
  if (!layer || !layers?.width || !layers?.height) return;

  const camera = currentCamera();
  const sx = Math.max(0, Math.floor(camera.x));
  const sy = Math.max(0, Math.floor(camera.y));
  const sourceRight = Math.min(layers.width, Math.ceil(camera.x + state.view.width / state.zoom) + 2);
  const sourceBottom = Math.min(layers.height, Math.ceil(camera.y + state.view.height / state.zoom) + 2);
  const sw = Math.max(1, sourceRight - sx);
  const sh = Math.max(1, sourceBottom - sy);

  const dx = (sx - camera.x) * state.zoom;
  const dy = (sy - camera.y) * state.zoom;
  ctx.drawImage(layer, sx, sy, sw, sh, dx, dy, Math.max(1, sw * state.zoom), Math.max(1, sh * state.zoom));
}

function isDraggingMap() {
  return Boolean(state.pointer.down && state.pointer.moved);
}

function drawChunkLayer(chunks) {
  const layers = state.layers;
  if (!layers) return;
  const camera = currentCamera();
  const rect = visibleWorldRect(isDraggingMap() ? DRAG_DRAW_PAD : STATIC_DRAW_PAD);
  const minCol = Math.max(0, Math.floor(rect.left / CHUNK_WIDTH));
  const maxCol = Math.min(layers.cols - 1, Math.floor(rect.right / CHUNK_WIDTH));
  const minRow = Math.max(0, Math.floor(rect.top / CHUNK_HEIGHT));
  const maxRow = Math.min(layers.rows - 1, Math.floor(rect.bottom / CHUNK_HEIGHT));

  for (let row = minRow; row <= maxRow; row += 1) {
    for (let col = minCol; col <= maxCol; col += 1) {
      const chunk = chunks[row * layers.cols + col];
      if (!chunk?.canvas) continue;

      const x0 = Math.round((chunk.x - camera.x) * state.zoom);
      const y0 = Math.round((chunk.y - camera.y) * state.zoom);
      const x1 = Math.round((chunk.x + chunk.width - camera.x) * state.zoom);
      const y1 = Math.round((chunk.y + chunk.height - camera.y) * state.zoom);
      const width = Math.max(1, x1 - x0);
      const height = Math.max(1, y1 - y0);
      ctx.drawImage(chunk.canvas, x0, y0, width, height);
    }
  }
}

function drawRawSceneItems(items, fillBase = false) {
  if (!items?.length) return false;
  const camera = currentCamera();
  const rect = visibleWorldRect(isDraggingMap() ? DRAG_DRAW_PAD : STATIC_DRAW_PAD);
  let drawn = 0;

  if (fillBase) {
    ctx.fillStyle = "#101411";
    ctx.fillRect(0, 0, state.view.width, state.view.height);
  }

  for (const item of items) {
    if (item.x > rect.right || item.y > rect.bottom || item.x + item.width < rect.left || item.y + item.height < rect.top) continue;
    const record = imageRecord(item.url);
    if (!record?.ready || record.error) continue;
    const x0 = Math.round((item.x - camera.x) * state.zoom);
    const y0 = Math.round((item.y - camera.y) * state.zoom);
    const x1 = Math.round((item.x + item.width - camera.x) * state.zoom);
    const y1 = Math.round((item.y + item.height - camera.y) * state.zoom);
    ctx.drawImage(record.image, x0, y0, Math.max(1, x1 - x0), Math.max(1, y1 - y0));
    drawn += 1;
  }

  return drawn > 0;
}

function renderChunksToCache(cacheCtx, chunks, cache, type) {
  const layers = state.layers;
  if (!layers) return;
  const zoom = cache.zoom;
  const dpr = cache.dpr || 1;
  const rect = {
    left: cache.x,
    top: cache.y,
    right: cache.x + cache.width / zoom,
    bottom: cache.y + cache.height / zoom,
  };
  const minCol = Math.max(0, Math.floor(rect.left / CHUNK_WIDTH));
  const maxCol = Math.min(layers.cols - 1, Math.floor(rect.right / CHUNK_WIDTH));
  const minRow = Math.max(0, Math.floor(rect.top / CHUNK_HEIGHT));
  const maxRow = Math.min(layers.rows - 1, Math.floor(rect.bottom / CHUNK_HEIGHT));

  cacheCtx.setTransform(dpr, 0, 0, dpr, 0, 0);
  cacheCtx.imageSmoothingEnabled = false;

  if (type === "base") {
    cacheCtx.fillStyle = "#050706";
    cacheCtx.fillRect(0, 0, cache.width, cache.height);
  } else {
    cacheCtx.clearRect(0, 0, cache.width, cache.height);
  }

  for (let row = minRow; row <= maxRow; row += 1) {
    for (let col = minCol; col <= maxCol; col += 1) {
      const chunk = chunks[row * layers.cols + col];
      if (!chunk?.canvas) continue;

      const x0 = Math.round((chunk.x - cache.x) * zoom);
      const y0 = Math.round((chunk.y - cache.y) * zoom);
      const x1 = Math.round((chunk.x + chunk.width - cache.x) * zoom);
      const y1 = Math.round((chunk.y + chunk.height - cache.y) * zoom);
      cacheCtx.drawImage(chunk.canvas, x0, y0, Math.max(1, x1 - x0), Math.max(1, y1 - y0));
    }
  }
}

function resizePanCache(width, height) {
  const cache = state.panCache;
  const dpr = STATIC_LAYER_DPR;
  if (cache.base && cache.masks && cache.width === width && cache.height === height && cache.dpr === dpr) return;
  cache.base = sceneCanvas;
  cache.masks = maskCanvas;
  cache.width = width;
  cache.height = height;
  cache.dpr = dpr;

  for (const layer of [sceneCanvas, maskCanvas]) {
    layer.width = Math.max(1, Math.ceil(width * dpr));
    layer.height = Math.max(1, Math.ceil(height * dpr));
    layer.style.width = `${width}px`;
    layer.style.height = `${height}px`;
  }
}

function buildPanCache() {
  return false;
  const layers = state.layers;
  if (!layers || !state.view.width || !state.view.height || !state.zoom) return false;

  const margin = panCacheMargin();
  const width = Math.ceil(state.view.width + margin * 2);
  const height = Math.ceil(state.view.height + margin * 2);
  resizePanCache(width, height);

  const camera = currentCamera();
  const maxX = Math.max(0, layers.width - width / state.zoom);
  const maxY = Math.max(0, layers.height - height / state.zoom);
  const cache = state.panCache;
  cache.x = clampValue(camera.x - margin / state.zoom, 0, maxX);
  cache.y = clampValue(camera.y - margin / state.zoom, 0, maxY);
  cache.zoom = state.zoom;

  renderChunksToCache(sceneCtx, state.layers.base, cache, "base");
  renderChunksToCache(maskCtx, state.layers.masks, cache, "mask");
  cache.valid = true;
  positionPanCache();
  return true;
}

function panCacheCoversViewport() {
  const cache = state.panCache;
  if (!cache.valid || !cache.base || !cache.masks) return false;
  const margin = panCacheMargin();
  if (cache.width !== Math.ceil(state.view.width + margin * 2)) return false;
  if (cache.height !== Math.ceil(state.view.height + margin * 2)) return false;
  if (Math.abs(cache.zoom - state.zoom) > 0.0001) return false;

  const camera = currentCamera();
  const sx = (camera.x - cache.x) * state.zoom;
  const sy = (camera.y - cache.y) * state.zoom;
  return sx >= 0 && sy >= 0 && sx + state.view.width <= cache.width && sy + state.view.height <= cache.height;
}

function positionPanCache() {
  const cache = state.panCache;
  if (!cache.valid || !cache.base || !cache.masks) return;
  const camera = currentCamera();
  const x = ((cache.x - camera.x) * state.zoom).toFixed(3);
  const y = ((cache.y - camera.y) * state.zoom).toFixed(3);
  const transform = `translate3d(${x}px, ${y}px, 0)`;
  if (cache.transform === transform) return;
  cache.transform = transform;
  sceneCanvas.style.transform = transform;
  maskCanvas.style.transform = transform;
}

function ensureStaticSceneCache() {
  if (!state.scene || !state.layers?.ready) return false;
  if (!panCacheCoversViewport()) {
    if (!isDraggingMap()) schedulePanCacheRebuild();
    positionPanCache();
    return Boolean(state.panCache.valid);
  }
  positionPanCache();
  return true;
}

function drawPanCacheLayer(type) {
  if (!isDraggingMap()) return false;
  if (!panCacheCoversViewport() && !state.panCache.valid) return false;
  const cache = state.panCache;
  const layer = type === "base" ? cache.base : cache.masks;
  if (!layer) return false;
  const camera = currentCamera();
  const sx = (camera.x - cache.x) * state.zoom;
  const sy = (camera.y - cache.y) * state.zoom;
  ctx.imageSmoothingEnabled = false;
  ctx.drawImage(layer, sx, sy, state.view.width, state.view.height, 0, 0, state.view.width, state.view.height);
  return true;
}

function drawSceneBase() {
  if (CLOUD_FAST_BOOT && state.layers?.ready) warmVisibleSceneNow();
  if (CLOUD_FAST_BOOT && state.render?.scene?.tiles?.length) {
    drawRawSceneItems(state.render.scene.tiles, true);
    return;
  }
  if (state.layers?.useFull && state.layers.fullBase) {
    ctx.imageSmoothingEnabled = false;
    drawFullLayer(state.layers.fullBase);
    return;
  }

  if (!state.layers?.base?.length) {
    ctx.fillStyle = "#101411";
    ctx.fillRect(0, 0, state.view.width, state.view.height);
    return;
  }
  drawChunkLayer(state.layers.base);
}

function drawMasks() {
  if (CLOUD_FAST_BOOT && state.render?.scene?.masks?.length) {
    drawRawSceneItems(state.render.scene.masks, false);
    return;
  }
  if (state.layers?.useFull && state.layers.fullMasks) {
    ctx.imageSmoothingEnabled = false;
    drawFullLayer(state.layers.fullMasks);
    return;
  }

  if (!state.layers?.masks?.length) return;
  drawChunkLayer(state.layers.masks);
}

async function prepareGpuLayers(layers) {
  if (!layers || !gpuBaseLayer.ok || !gpuMaskLayer.ok) return false;
  await gpuBaseLayer.uploadChunks(layers.base);
  await gpuMaskLayer.uploadChunks(layers.masks);
  return true;
}

function drawGpuSceneLayers() {
  if (!state.scene || !state.layers?.ready || !gpuBaseLayer.ok || !gpuMaskLayer.ok) {
    if (sceneCanvas) sceneCanvas.hidden = true;
    if (maskCanvas) maskCanvas.hidden = true;
    return false;
  }

  const camera = currentCamera();
  const baseDrawn = gpuBaseLayer.draw(state.layers.base, camera, state.zoom, state.view);
  const masksDrawn = gpuMaskLayer.draw(state.layers.masks, camera, state.zoom, state.view);
  if (!baseDrawn || !masksDrawn) {
    sceneCanvas.hidden = true;
    maskCanvas.hidden = true;
    if (CLOUD_FAST_BOOT) warmVisibleSceneNow();
    return false;
  }
  sceneCanvas.hidden = false;
  maskCanvas.hidden = false;
  return true;
}

function frameForSprite(sprite, direction = 0, interval = 130, time = state.now) {
  const frames = sprite?.manifest?.frames || [];
  if (!frames.length) return null;
  const framesPerGroup = Math.max(1, Number(sprite.manifest.framesPerGroup || 1));
  const groups = Math.max(1, Number(sprite.manifest.groups || 1));
  const group = Math.abs(Math.round(direction || 0)) % groups;
  const frame = Math.floor(time / interval) % framesPerGroup;
  return frames.find((item) => item.index === group * framesPerGroup + frame) || frames[group * framesPerGroup] || frames[0];
}

function decodeBase64Bytes(value) {
  const raw = atob(String(value || ""));
  const bytes = new Uint8Array(raw.length);
  for (let index = 0; index < raw.length; index += 1) {
    bytes[index] = raw.charCodeAt(index);
  }
  return bytes;
}

function hydrateCollisionGrid(rendered) {
  const collision = rendered?.scene?.collision;
  if (!collision?.data || collision.bytes) return;
  collision.bytes = decodeBase64Bytes(collision.data);
}

function clearPathWorkerTimeout() {
  if (!state.pathWorker.timeout) return;
  window.clearTimeout(state.pathWorker.timeout);
  state.pathWorker.timeout = null;
}

function initPathWorker() {
  const collision = state.render?.scene?.collision;
  if (state.pathWorker.ready || state.pathWorker.failed || !collision?.bytes || typeof Worker !== "function") return;
  try {
    const worker = new Worker(`/path-worker.js?v=${APP_VERSION}`);
    worker.onmessage = (event) => {
      const message = event.data || {};
      if (message.type !== "path" || !state.role || message.commandId !== state.move.commandId) return;
      clearPathWorkerTimeout();
      state.move.pendingPath = false;
      const target = message.target;
      let path = Array.isArray(message.path) ? message.path : [];
      if (!path.length || !target) return;

      const current = state.role.position;
      if (hasWalkableLine(current, target)) {
        path = [target];
      } else {
        let nearestIndex = 0;
        let nearestDistance = Infinity;
        for (let index = 0; index < path.length; index += 1) {
          const distance = Math.hypot(path[index].x - current.x, path[index].y - current.y);
          if (distance < nearestDistance) {
            nearestDistance = distance;
            nearestIndex = index;
          }
        }
        path = path.slice(Math.max(0, nearestIndex));
      }
      setMovePath(path, target, { mark: false, preserveVelocity: true, impulse: false });
    };
    worker.onerror = () => {
      clearPathWorkerTimeout();
      state.pathWorker.failed = true;
      state.pathWorker.ready = false;
    };
    const bytes = collision.bytes.slice();
    worker.postMessage(
      {
        type: "init",
        collision: {
          width: Number(collision.width || 0),
          height: Number(collision.height || 0),
          cellSize: Number(collision.cellSize || TILE_SCALE),
          blockedValue: Number(collision.blockedValue ?? 1),
          bytes: bytes.buffer,
        },
      },
      [bytes.buffer]
    );
    state.pathWorker.worker = worker;
    state.pathWorker.ready = true;
  } catch {
    state.pathWorker.failed = true;
  }
}

function clampPointToBounds(x, y) {
  const bounds = state.scene?.map?.bounds;
  if (!bounds) return { x, y };
  return {
    x: Math.max(0, Math.min(bounds.width, x)),
    y: Math.max(0, Math.min(bounds.height, y)),
  };
}

function isWalkablePoint(x, y) {
  const bounds = state.scene?.map?.bounds;
  if (!bounds || x < 0 || y < 0 || x > bounds.width || y > bounds.height) return false;
  const collision = state.render?.scene?.collision;
  if (!collision?.bytes) return true;
  const cellSize = Number(collision.cellSize || TILE_SCALE);
  const width = Number(collision.width || 0);
  const height = Number(collision.height || 0);
  const blockedValue = Number(collision.blockedValue ?? 1);
  if (!width || !height) return true;

  for (const sample of COLLISION_SAMPLES) {
    const cx = Math.floor((x + sample.x) / cellSize);
    const cy = Math.floor((y + sample.y) / cellSize);
    if (cx < 0 || cy < 0 || cx >= width || cy >= height) return false;
    if (collision.bytes[cy * width + cx] === blockedValue) return false;
  }
  return true;
}

function collisionGrid() {
  const collision = state.render?.scene?.collision;
  if (!collision?.bytes) return null;
  const width = Number(collision.width || 0);
  const height = Number(collision.height || 0);
  const cellSize = Number(collision.cellSize || TILE_SCALE);
  return width && height ? { collision, width, height, cellSize } : null;
}

function pointToCell(point) {
  const grid = collisionGrid();
  if (!grid) return null;
  return {
    x: Math.max(0, Math.min(grid.width - 1, Math.floor(point.x / grid.cellSize))),
    y: Math.max(0, Math.min(grid.height - 1, Math.floor(point.y / grid.cellSize))),
  };
}

function cellCenter(cell) {
  const grid = collisionGrid();
  const size = grid?.cellSize || TILE_SCALE;
  return { x: (cell.x + 0.5) * size, y: (cell.y + 0.5) * size };
}

function heapPush(heap, item) {
  heap.push(item);
  let index = heap.length - 1;
  while (index > 0) {
    const parent = (index - 1) >> 1;
    if (heap[parent].score <= item.score) break;
    heap[index] = heap[parent];
    index = parent;
  }
  heap[index] = item;
}

function heapPop(heap) {
  const first = heap[0];
  const last = heap.pop();
  if (heap.length && last) {
    let index = 0;
    while (true) {
      const left = index * 2 + 1;
      const right = left + 1;
      if (left >= heap.length) break;
      const child = right < heap.length && heap[right].score < heap[left].score ? right : left;
      if (heap[child].score >= last.score) break;
      heap[index] = heap[child];
      index = child;
    }
    heap[index] = last;
  }
  return first;
}

function hasWalkableLine(from, to) {
  const distance = Math.hypot(to.x - from.x, to.y - from.y);
  const steps = Math.max(1, Math.ceil(distance / 10));
  for (let index = 1; index <= steps; index += 1) {
    const t = index / steps;
    const x = from.x + (to.x - from.x) * t;
    const y = from.y + (to.y - from.y) * t;
    if (!isWalkablePoint(x, y)) return false;
  }
  return true;
}

function smoothPath(points) {
  if (points.length <= 2) return points;
  const smoothed = [points[0]];
  let anchor = 0;
  while (anchor < points.length - 1) {
    let next = points.length - 1;
    while (next > anchor + 1 && !hasWalkableLine(points[anchor], points[next])) {
      next -= 1;
    }
    smoothed.push(points[next]);
    anchor = next;
  }
  return smoothed;
}

function findWalkPath(origin, target, maxVisited = PATH_MAX_VISITED) {
  if (hasWalkableLine(origin, target)) return [target];
  const grid = collisionGrid();
  if (!grid) return [target];
  const start = pointToCell(origin);
  const goal = pointToCell(target);
  if (!start || !goal) return null;
  if (start.x === goal.x && start.y === goal.y) return [target];

  const total = grid.width * grid.height;
  const startIndex = start.y * grid.width + start.x;
  const goalIndex = goal.y * grid.width + goal.x;
  const gScore = new Float64Array(total);
  const cameFrom = new Int32Array(total);
  const closed = new Uint8Array(total);
  const walkable = new Int8Array(total);
  gScore.fill(Infinity);
  cameFrom.fill(-1);

  function canUseCell(x, y) {
    if (x < 0 || y < 0 || x >= grid.width || y >= grid.height) return false;
    const index = y * grid.width + x;
    if (!walkable[index]) {
      walkable[index] = isWalkablePoint((x + 0.5) * grid.cellSize, (y + 0.5) * grid.cellSize) ? 1 : -1;
    }
    return walkable[index] === 1;
  }

  function estimate(x, y) {
    const dx = Math.abs(goal.x - x);
    const dy = Math.abs(goal.y - y);
    return Math.max(dx, dy) + (Math.SQRT2 - 1) * Math.min(dx, dy);
  }

  if (!canUseCell(start.x, start.y) || !canUseCell(goal.x, goal.y)) return null;

  const open = [];
  gScore[startIndex] = 0;
  heapPush(open, { x: start.x, y: start.y, index: startIndex, score: estimate(start.x, start.y) });

  const directions = [
    [1, 0, 1],
    [-1, 0, 1],
    [0, 1, 1],
    [0, -1, 1],
    [1, 1, Math.SQRT2],
    [-1, 1, Math.SQRT2],
    [1, -1, Math.SQRT2],
    [-1, -1, Math.SQRT2],
  ];
  let found = -1;
  let visited = 0;

  while (open.length && visited < maxVisited) {
    const current = heapPop(open);
    if (!current || closed[current.index]) continue;
    closed[current.index] = 1;
    visited += 1;
    if (current.index === goalIndex) {
      found = current.index;
      break;
    }

    for (const [dx, dy, cost] of directions) {
      const x = current.x + dx;
      const y = current.y + dy;
      if (!canUseCell(x, y)) continue;
      if (dx && dy && (!canUseCell(current.x + dx, current.y) || !canUseCell(current.x, current.y + dy))) continue;
      const index = y * grid.width + x;
      if (closed[index]) continue;
      const nextScore = gScore[current.index] + cost;
      if (nextScore >= gScore[index]) continue;
      cameFrom[index] = current.index;
      gScore[index] = nextScore;
      heapPush(open, { x, y, index, score: nextScore + estimate(x, y) });
    }
  }

  if (found < 0) return null;
  const cells = [];
  for (let index = found; index >= 0; index = cameFrom[index]) {
    cells.push({ x: index % grid.width, y: Math.floor(index / grid.width) });
    if (index === startIndex) break;
  }
  cells.reverse();
  const points = cells.map(cellCenter);
  points[0] = { x: origin.x, y: origin.y };
  points[points.length - 1] = { x: target.x, y: target.y };
  return smoothPath(points).slice(1);
}

function nearestWalkablePoint(target, origin = null) {
  const base = clampPointToBounds(target.x, target.y);
  if (isWalkablePoint(base.x, base.y)) return base;
  const start = origin || state.role?.position || base;
  let best = null;
  let bestDistance = Infinity;
  for (let radius = 12; radius <= 260; radius += 12) {
    for (let angle = 0; angle < Math.PI * 2; angle += Math.PI / 12) {
      const candidate = clampPointToBounds(base.x + Math.cos(angle) * radius, base.y + Math.sin(angle) * radius);
      if (!isWalkablePoint(candidate.x, candidate.y)) continue;
      const distance = Math.hypot(candidate.x - start.x, candidate.y - start.y);
      if (distance < bestDistance) {
        best = candidate;
        bestDistance = distance;
      }
    }
    if (best) return best;
  }
  return origin && isWalkablePoint(origin.x, origin.y) ? { x: origin.x, y: origin.y } : null;
}

function firstReachablePoint(origin, target) {
  const distance = Math.hypot(target.x - origin.x, target.y - origin.y);
  if (distance < 1) return target;
  const steps = Math.max(1, Math.ceil(distance / PATH_PREVIEW_STEP));
  let last = { x: origin.x, y: origin.y };
  for (let index = 1; index <= steps; index += 1) {
    const t = index / steps;
    const point = {
      x: origin.x + (target.x - origin.x) * t,
      y: origin.y + (target.y - origin.y) * t,
    };
    if (!isWalkablePoint(point.x, point.y)) break;
    last = point;
  }
  return Math.hypot(last.x - origin.x, last.y - origin.y) > 8 ? last : null;
}

function setMovePath(path, finalTarget, options = {}) {
  if (!state.role || !Array.isArray(path) || !path.length) return false;
  const cleanPath = path.filter((point) => point && Number.isFinite(point.x) && Number.isFinite(point.y));
  if (!cleanPath.length) return false;

  const pos = state.role.position;
  const next = cleanPath[0];
  const dx = next.x - pos.x;
  const dy = next.y - pos.y;
  const distance = Math.hypot(dx, dy);
  if (distance < 0.5) return false;

  const direction = directionFromDelta(dx, dy);
  state.role.position.direction = direction;
  state.move.renderDirection = direction;
  state.move.target = next;
  state.move.path = cleanPath.slice(1);
  state.move.finalTarget = finalTarget || cleanPath[cleanPath.length - 1];
  state.move.pendingPath = Boolean(options.pendingPath);

  if (!Number.isFinite(state.move.renderX) || !Number.isFinite(state.move.renderY)) {
    state.move.renderX = pos.x;
    state.move.renderY = pos.y;
  }

  const impulse = options.impulse === false ? 0 : Number(options.impulse || CLICK_IMPULSE_SPEED);
  const currentSpeed = vectorLength(state.move.vx, state.move.vy);
  if (impulse && currentSpeed < impulse) {
    state.move.vx = (dx / distance) * impulse;
    state.move.vy = (dy / distance) * impulse;
    state.move.currentSpeed = impulse;
  }
  return true;
}

function requestWorkerPath(commandId, target) {
  const worker = state.pathWorker.worker;
  if (!worker || !state.pathWorker.ready || !state.role) return false;
  const origin = { x: state.role.position.x, y: state.role.position.y };
  clearPathWorkerTimeout();
  state.move.pendingPath = true;
  try {
    worker.postMessage({ type: "path", commandId, origin, target });
    const timeout = window.setTimeout(() => {
      if (state.pathWorker.timeout === timeout) state.pathWorker.timeout = null;
      if (commandId !== state.move.commandId || !state.move.pendingPath) return;
      state.move.commandId += 1;
      state.move.pendingPath = false;
    }, PATH_WORKER_TIMEOUT_MS);
    state.pathWorker.timeout = timeout;
    return true;
  } catch {
    clearPathWorkerTimeout();
    state.pathWorker.ready = false;
    state.pathWorker.failed = true;
    state.move.pendingPath = false;
    return false;
  }
}

function requestAsyncPathFallback(commandId, target) {
  const originAtRequest = state.role ? { x: state.role.position.x, y: state.role.position.y } : null;
  const distance = originAtRequest ? Math.hypot(target.x - originAtRequest.x, target.y - originAtRequest.y) : Infinity;
  if (distance > MAIN_THREAD_PATH_MAX_DISTANCE || state.zoom < 0.7) {
    state.move.pendingPath = false;
    return;
  }

  state.move.pendingPath = true;
  window.setTimeout(() => {
    if (!state.role || commandId !== state.move.commandId) return;
    const origin = { x: state.role.position.x, y: state.role.position.y };
    const path = findWalkPath(origin, target, MAIN_THREAD_PATH_MAX_VISITED);
    if (commandId !== state.move.commandId) return;
    state.move.pendingPath = false;
    if (path?.length) setMovePath(path, target, { mark: false, preserveVelocity: true, impulse: false });
  }, 0);
}

function labelWidth(label) {
  const text = String(label || "");
  if (!text) return 0;
  if (state.labelWidths.has(text)) return state.labelWidths.get(text);
  ctx.font = LABEL_FONT;
  const width = Math.min(232, ctx.measureText(text).width + 22);
  state.labelWidths.set(text, width);
  return width;
}

function drawRoundedRect(context, x, y, width, height, radius) {
  if (typeof context.roundRect === "function") {
    context.roundRect(x, y, width, height, radius);
    return;
  }
  const r = Math.min(radius, width / 2, height / 2);
  context.moveTo(x + r, y);
  context.arcTo(x + width, y, x + width, y + height, r);
  context.arcTo(x + width, y + height, x, y + height, r);
  context.arcTo(x, y + height, x, y, r);
  context.arcTo(x, y, x + width, y, r);
}

function drawLabel(text, x, y, color = "#f7eed6") {
  const label = String(text || "");
  if (!label) return;
  const width = labelWidth(label);
  const labelX = x - width / 2;
  const labelY = y - 30;
  ctx.font = LABEL_FONT;
  ctx.save();
  ctx.shadowColor = "rgba(0, 0, 0, 0.26)";
  ctx.shadowBlur = 9;
  ctx.shadowOffsetY = 2;
  ctx.beginPath();
  drawRoundedRect(ctx, labelX, labelY, width, 22, 7);
  ctx.fillStyle = "rgba(16, 24, 22, 0.74)";
  ctx.fill();
  ctx.shadowColor = "transparent";
  ctx.strokeStyle = "rgba(230, 198, 126, 0.28)";
  ctx.lineWidth = 1;
  ctx.stroke();
  ctx.fillStyle = color;
  ctx.textAlign = "center";
  ctx.textBaseline = "alphabetic";
  ctx.fillText(label, x, y - 15, width - 10);
  ctx.restore();
}

function directionFromDelta(dx, dy) {
  if (Math.abs(dx) < 0.1 && Math.abs(dy) < 0.1) return state.role?.position?.direction || 0;
  const degrees = (Math.atan2(dy, dx) * 180) / Math.PI;
  const sector = Math.floor((((degrees + 360) % 360) + 22.5) / 45) % 8;
  return DIRECTION_GROUPS[sector];
}

function resetMotionState(immediateCamera = false) {
  if (!state.role) return;
  clearPathWorkerTimeout();
  const pos = state.role.position;
  state.move.target = null;
  state.move.path = [];
  state.move.finalTarget = null;
  state.move.pendingPath = false;
  state.move.vx = 0;
  state.move.vy = 0;
  state.move.currentSpeed = 0;
  state.move.renderX = pos.x;
  state.move.renderY = pos.y;
  state.move.renderDirection = pos.direction || 0;
  state.move.animationTime = 0;
  centerCamera(immediateCamera);
}

function isRoleMoving() {
  return Boolean(state.move.target) || vectorLength(state.move.vx, state.move.vy) > 12;
}

function syncRolePosition(force = false) {
  if (!state.token || !state.role) return;
  const now = performance.now();
  if (!force && now - state.move.lastSyncAt < 250) return;
  state.move.lastSyncAt = now;
  const pos = state.role.position;
  fetchJson("/api/player/move", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ mapId: MAP_ID, x: pos.x, y: pos.y, direction: pos.direction }),
  }).catch((error) => setStatus(error.message));
}

function stopMotion(sync = true, immediate = true) {
  clearPathWorkerTimeout();
  state.move.target = null;
  state.move.path = [];
  state.move.finalTarget = null;
  state.move.pendingPath = false;
  if (immediate) {
    state.move.vx = 0;
    state.move.vy = 0;
    state.move.currentSpeed = 0;
  }
  if (sync) syncRolePosition(true);
}

function advanceMoveTarget() {
  const next = state.move.path.shift();
  if (next) {
    state.move.target = next;
    return true;
  }
  if (state.move.pendingPath) {
    state.move.target = null;
    state.move.path = [];
    state.move.currentSpeed = Math.max(80, state.move.currentSpeed * 0.55);
    return false;
  }
  state.move.target = null;
  state.move.finalTarget = null;
  state.move.pendingPath = false;
  state.move.vx = 0;
  state.move.vy = 0;
  state.move.currentSpeed = 0;
  syncRolePosition(true);
  return false;
}

function remainingMoveDistance(pos) {
  let total = 0;
  let previous = pos;
  if (state.move.target) {
    total += Math.hypot(state.move.target.x - previous.x, state.move.target.y - previous.y);
    previous = state.move.target;
  }
  for (const point of state.move.path) {
    total += Math.hypot(point.x - previous.x, point.y - previous.y);
    previous = point;
  }
  return total;
}

function updateWaypointLookahead(pos) {
  if (!state.move.target) return;
  let distance = Math.hypot(state.move.target.x - pos.x, state.move.target.y - pos.y);
  while (state.move.path.length && distance <= MOVE_WAYPOINT_ADVANCE) {
    state.move.target = state.move.path.shift();
    distance = Math.hypot(state.move.target.x - pos.x, state.move.target.y - pos.y);
  }

  const next = state.move.path[0];
  if (next && distance <= MOVE_CORNER_LOOKAHEAD && hasWalkableLine(pos, next)) {
    state.move.target = state.move.path.shift();
  }
}

function updateRenderPose(delta) {
  if (!state.role) return;
  const pos = state.role.position;
  if (!Number.isFinite(state.move.renderX) || !Number.isFinite(state.move.renderY)) {
    state.move.renderX = pos.x;
    state.move.renderY = pos.y;
  }

  const alpha = expAlpha(ROLE_RENDER_SMOOTHING, delta);
  state.move.renderX += (pos.x - state.move.renderX) * alpha;
  state.move.renderY += (pos.y - state.move.renderY) * alpha;
  if (state.move.currentSpeed > 18) {
    state.move.renderDirection = directionFromDelta(state.move.vx, state.move.vy);
  } else {
    state.move.renderDirection = pos.direction || state.move.renderDirection || 0;
  }

  const speedRatio = Math.max(0, Math.min(1.4, vectorLength(state.move.vx, state.move.vy) / state.move.maxSpeed));
  state.move.animationTime += delta * 1000 * (isRoleMoving() ? Math.max(0.82, speedRatio) : 0.45);
}

function updateMotion(delta) {
  if (!state.role) return;
  if (!state.move.target) {
    const speed = vectorLength(state.move.vx, state.move.vy);
    const nextSpeed = Math.max(0, speed - MOVE_DECELERATION * delta);
    if (speed > 0 && nextSpeed > 0) {
      const scale = nextSpeed / speed;
      state.move.vx *= scale;
      state.move.vy *= scale;
    } else {
      state.move.vx = 0;
      state.move.vy = 0;
    }
    state.move.currentSpeed = nextSpeed;
    return;
  }

  const pos = state.role.position;
  updateWaypointLookahead(pos);
  if (!state.move.target) {
    return;
  }

  const dx = state.move.target.x - pos.x;
  const dy = state.move.target.y - pos.y;
  const distance = Math.hypot(dx, dy);
  if (distance > 0.1) pos.direction = directionFromDelta(dx, dy);

  if (distance <= MOVE_ARRIVE_DISTANCE) {
    pos.x = state.move.target.x;
    pos.y = state.move.target.y;
    advanceMoveTarget();
    return;
  }

  const remainingDistance = remainingMoveDistance(pos);
  const speed = vectorLength(state.move.vx, state.move.vy);
  const stoppingDistance = (speed * speed) / (2 * MOVE_DECELERATION);
  let desiredSpeed = state.move.maxSpeed;
  if (remainingDistance <= stoppingDistance + 50) {
    desiredSpeed = Math.min(state.move.maxSpeed, Math.sqrt(Math.max(0, 2 * MOVE_DECELERATION * Math.max(0, remainingDistance - MOVE_ARRIVE_DISTANCE))));
  }

  if (desiredSpeed < 70 && distance > 18) {
    desiredSpeed = 70;
  }

  const desiredVx = (dx / distance) * desiredSpeed;
  const desiredVy = (dy / distance) * desiredSpeed;
  const steeringRate = desiredSpeed > speed ? MOVE_ACCELERATION : MOVE_DECELERATION;
  const steering = limitVector(desiredVx - state.move.vx, desiredVy - state.move.vy, steeringRate * delta);
  state.move.vx += steering.x;
  state.move.vy += steering.y;

  const limitedVelocity = limitVector(state.move.vx, state.move.vy, state.move.maxSpeed);
  state.move.vx = limitedVelocity.x;
  state.move.vy = limitedVelocity.y;
  state.move.currentSpeed = vectorLength(state.move.vx, state.move.vy);
  if (state.move.currentSpeed > 8) {
    pos.direction = directionFromDelta(state.move.vx, state.move.vy);
  }

  const stepX = state.move.vx * delta;
  const stepY = state.move.vy * delta;
  const stepLength = Math.hypot(stepX, stepY);
  if (stepLength > distance) {
    const scale = distance / Math.max(1, stepLength);
    state.move.vx *= scale;
    state.move.vy *= scale;
  }

  const nextX = pos.x + state.move.vx * delta;
  const nextY = pos.y + state.move.vy * delta;
  let moved = false;
  if (isWalkablePoint(nextX, nextY)) {
    pos.x = nextX;
    pos.y = nextY;
    moved = true;
  } else {
    const canMoveX = isWalkablePoint(nextX, pos.y);
    const canMoveY = isWalkablePoint(pos.x, nextY);
    if (canMoveX && (!canMoveY || Math.abs(dx) >= Math.abs(dy))) {
      pos.x = nextX;
      state.move.vy = 0;
      moved = true;
    } else if (canMoveY) {
      pos.y = nextY;
      state.move.vx = 0;
      moved = true;
    }
  }
  if (!moved) {
    stopMotion(true);
    return;
  }
}

function keyboardVector() {
  const x = (state.keyboard.right ? 1 : 0) - (state.keyboard.left ? 1 : 0);
  const y = (state.keyboard.down ? 1 : 0) - (state.keyboard.up ? 1 : 0);
  const length = Math.hypot(x, y);
  return length ? { x: x / length, y: y / length } : null;
}

function updateKeyboardIntent(now) {
  if (!state.role || !state.scene || els.game.hidden) return;
  const vector = keyboardVector();
  if (!vector) {
    if (state.keyboard.active) {
      state.keyboard.active = false;
      stopMotion(true, false);
    }
    return;
  }

  state.keyboard.active = true;
  if (now - state.keyboard.lastRequestAt < 90) return;
  state.keyboard.lastRequestAt = now;
  const pos = state.role.position;
  requestMove(pos.x + vector.x * 260, pos.y + vector.y * 260, { mark: false, preserveVelocity: true, directOnly: true, impulse: 150 });
}

function drawNpcGuideArrow(npc, screen, frame) {
  if (!state.guidance?.npcId || state.guidance.npcId !== String(npc.id)) return;
  const topY = screen.y - Math.max(48, (frame?.y || 42) * state.zoom) - 16;
  const bob = Math.sin(state.now / 180) * 7;
  const x = screen.x;
  const y = topY + bob;
  ctx.save();
  ctx.shadowColor = "rgba(0, 0, 0, 0.38)";
  ctx.shadowBlur = 10;
  ctx.fillStyle = "#ffd76a";
  ctx.strokeStyle = "rgba(70, 42, 18, 0.8)";
  ctx.lineWidth = 2;
  ctx.beginPath();
  ctx.moveTo(x, y + 26);
  ctx.lineTo(x - 15, y);
  ctx.lineTo(x + 15, y);
  ctx.closePath();
  ctx.fill();
  ctx.stroke();
  ctx.shadowColor = "transparent";
  ctx.fillStyle = "#fff2cf";
  ctx.beginPath();
  ctx.arc(x, y - 10, 9, 0, Math.PI * 2);
  ctx.fill();
  if (!isDraggingMap() && state.guidance.label) drawLabel(state.guidance.label, x, y - 18, "#ffd76a");
  ctx.restore();
}

function drawNpc(npc) {
  const x = Number.isFinite(npc._wx) ? npc._wx : Number(npc.x || 0) * TILE_SCALE;
  const y = Number.isFinite(npc._wy) ? npc._wy : Number(npc.y || 0) * TILE_SCALE;
  if (!isPointVisibleWorld(x, y, 240)) return;

  const s = worldToScreen(x, y);
  const active = state.selectedNpc && String(state.selectedNpc.id) === npc._idString;
  const speaking = active && state.dialog.npcId === String(npc.id) && els.dialog && !els.dialog.hidden;
  const sprite = state.render?.npcSprites?.[npc.id];
  const frame = frameForSprite(sprite, npc.direction, speaking ? 92 : 160);
  const record = frame && imageRecord(frame.url);

  if (record?.ready && !record.error) {
    const bob = speaking ? Math.sin(state.now / 120) * 1.4 : 0;
    ctx.imageSmoothingEnabled = false;
    ctx.drawImage(record.image, s.x - frame.x * state.zoom, s.y + bob - frame.y * state.zoom, frame.width * state.zoom, frame.height * state.zoom);
    if (active) {
      ctx.strokeStyle = "#e7c777";
      ctx.lineWidth = 2;
      ctx.beginPath();
      ctx.ellipse(s.x, s.y - 2, 18 * state.zoom, 8 * state.zoom, 0, 0, Math.PI * 2);
      ctx.stroke();
    }
    drawNpcGuideArrow(npc, s, frame);
    if (!isDraggingMap()) drawLabel(displayNpcName(npc), s.x, s.y - Math.max(22, frame.y * state.zoom), active ? "#f0cd7a" : "#eaf2df");
    return;
  }
}

function drawRole() {
  if (!state.role) return;
  const pos = state.role.position;
  const x = Number.isFinite(state.move.renderX) ? state.move.renderX : pos.x;
  const y = Number.isFinite(state.move.renderY) ? state.move.renderY : pos.y;
  const direction = state.move.renderDirection || pos.direction || 0;
  const moving = isRoleMoving();
  const s = worldToScreen(x, y);
  const sprite = moving ? state.roleSprites?.sprites?.walk : state.roleSprites?.sprites?.stand;
  const frame = frameForSprite(sprite, direction, moving ? 92 : 175, state.move.animationTime);
  const record = frame && imageRecord(frame.url);

  if (record?.ready && !record.error) {
    ctx.imageSmoothingEnabled = false;
    ctx.drawImage(record.image, s.x - frame.x * state.zoom, s.y - frame.y * state.zoom, frame.width * state.zoom, frame.height * state.zoom);
    if (!isDraggingMap()) drawLabel(state.role.name, s.x, s.y - Math.max(22, frame.y * state.zoom), "#f0cd7a");
    return;
  }

  ctx.fillStyle = "#e7c777";
  ctx.beginPath();
  ctx.arc(s.x, s.y, 14, 0, Math.PI * 2);
  ctx.fill();
  if (!isDraggingMap()) drawLabel(state.role.name, s.x, s.y, "#f0cd7a");
}

function drawMarks() {
  const now = state.now;
  state.marks = state.marks.filter((mark) => now - mark.time < 700);
  for (const mark of state.marks) {
    const age = (now - mark.time) / 700;
    const s = worldToScreen(mark.x, mark.y);
    ctx.strokeStyle = `rgba(230, 199, 119, ${1 - age})`;
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.arc(s.x, s.y, (8 + age * 24) * state.zoom, 0, Math.PI * 2);
    ctx.stroke();
  }
}

function drawWorldEffects() {
  const now = state.now;
  state.worldEffects = state.worldEffects.filter((effect) => now - effect.time < effect.duration);
  for (const effect of state.worldEffects) {
    const age = (now - effect.time) / effect.duration;
    const alpha = Math.max(0, 1 - age);
    const s = worldToScreen(effect.x, effect.y);
    ctx.save();
    ctx.globalAlpha = alpha;
    ctx.strokeStyle = effect.color;
    ctx.lineWidth = 1.5;
    ctx.beginPath();
    ctx.arc(s.x, s.y, (12 + age * 38) * state.zoom, 0, Math.PI * 2);
    ctx.stroke();
    for (const particle of effect.particles) {
      const px = s.x + particle.vx * age * state.zoom;
      const py = s.y + particle.vy * age * state.zoom + 36 * age * age;
      ctx.fillStyle = particle.color;
      ctx.beginPath();
      ctx.arc(px, py, particle.size * (1 - age * 0.45), 0, Math.PI * 2);
      ctx.fill();
    }
    if (effect.text) {
      ctx.font = "700 13px Microsoft YaHei, PingFang SC, sans-serif";
      ctx.textAlign = "center";
      ctx.textBaseline = "middle";
      ctx.fillStyle = `rgba(255, 245, 207, ${alpha})`;
      ctx.strokeStyle = `rgba(25, 15, 9, ${alpha * 0.58})`;
      ctx.lineWidth = 3;
      const ty = s.y - 34 - age * 36;
      ctx.strokeText(effect.text, s.x, ty);
      ctx.fillText(effect.text, s.x, ty);
    }
    ctx.restore();
  }
}

function drawEffects() {
  for (const effect of state.scene?.effects || []) {
    const p = pointWorld(effect);
    if (!isPointVisibleWorld(p.x, p.y, 60)) continue;
    const s = worldToScreen(p.x, p.y);
    const pulse = 0.5 + Math.sin(state.now / 420 + p.x * 0.01) * 0.5;
    ctx.strokeStyle = `rgba(151, 207, 184, ${0.32 + pulse * 0.28})`;
    ctx.lineWidth = 1.5;
    ctx.beginPath();
    ctx.arc(s.x, s.y, 8 + pulse * 6, 0, Math.PI * 2);
    ctx.stroke();
  }
}

function drawEntities() {
  const entities = [];
  for (const npc of state.scene?.npcs || []) {
    if (!isPointVisibleWorld(npc._wx, npc._wy, 260)) continue;
    entities.push({ type: "npc", y: npc._sortY, npc });
  }
  if (state.role) entities.push({ type: "role", y: Number.isFinite(state.move.renderY) ? state.move.renderY : state.role.position.y });
  entities.sort((a, b) => a.y - b.y);

  for (const entity of entities) {
    if (entity.type === "role") drawRole();
    else drawNpc(entity.npc);
  }
}

function trackFps(now) {
  state.perf.frames += 1;
  const elapsed = now - state.perf.lastAt;
  if (elapsed < 1000) return;
  state.perf.fps = Math.round((state.perf.frames * 1000) / elapsed);
  state.perf.frames = 0;
  state.perf.lastAt = now;
}

function updateGameStatus(now) {
  if (!state.role || now - state.ui.lastStatusAt < 300) return;
  state.ui.lastStatusAt = now;
}

function draw(now = performance.now()) {
  state.now = now;
  ensureCanvasSize();
  trackFps(now);
  applyPendingCameraPan();

  const frameDelta = Math.min(0.08, (now - state.lastFrame) / 1000);
  state.lastFrame = now;
  updateKeyboardIntent(now);
  state.accumulator += frameDelta;
  let steps = 0;
  while (state.accumulator >= SIMULATION_STEP && steps < MAX_SIMULATION_STEPS) {
    updateMotion(SIMULATION_STEP);
    state.accumulator -= SIMULATION_STEP;
    steps += 1;
  }
  if (steps === MAX_SIMULATION_STEPS) state.accumulator = 0;
  updateRenderPose(Math.min(frameDelta, MAX_RENDER_DELTA));
  updateCamera(Math.min(frameDelta, CAMERA_MAX_DELTA));
  const hasGpuMap = CLOUD_FAST_BOOT ? false : drawGpuSceneLayers();

  ctx.imageSmoothingEnabled = false;
  ctx.clearRect(0, 0, state.view.width, state.view.height);
  if (!state.scene || !state.layers) {
    ctx.fillStyle = "#050706";
    ctx.fillRect(0, 0, state.view.width, state.view.height);
  }

  if (state.scene) {
    if (!hasGpuMap) drawSceneBase();
    if (!isDraggingMap()) {
      drawEffects();
      drawMarks();
      drawWorldEffects();
    }
    drawEntities();
    if (!hasGpuMap) drawMasks();
    updateGameStatus(now);
  }

  requestAnimationFrame(draw);
}

async function loadRenderedScene() {
  if (state.render?.scene?.tiles?.length && state.layers?.ready) {
    hydrateCollisionGrid(state.render);
    return state.render;
  }

  setStatus(TEXT.loadingCity);
  const data = await fetchJson(`/api/render/scene/${MAP_ID}`);
  hydrateCollisionGrid(data);
  state.render = data;
  initPathWorker();
  const staticUrls = sceneStaticUrls(data);
  const spriteUrlsToLoad = npcSpriteUrls(data);

  if (CLOUD_FAST_BOOT) {
    setEntryStatus(TEXT.loadingScene, 12, "首屏地图");
    ensureCanvasSize();
    state.layers = buildSceneLayers(data.scene);
    invalidatePanCache();
    const initialJobs = initialSceneChunkJobs(state.layers);
    await composeChunkJobs(initialJobs, (done, total) => {
      setEntryStatus(TEXT.composingMapProgress(done, total), progressBetween(12, 76, done, total), "首屏地图");
    });
    await prepareGpuLayers(state.layers);
    state.layers.ready = true;
    invalidatePanCache();
    scheduleSceneBackgroundWarmup(state.layers);

    filterUnavailableNpcs();
    if (state.scene && data.scene?.width && data.scene?.height) {
      applyRenderBounds();
      centerCamera();
    }
    window.setTimeout(warmVisibleSceneNow, 0);
    return data;
  }

  setEntryStatus(TEXT.loadingScene, 8, TEXT.loadingSceneDetail(0, staticUrls.length + spriteUrlsToLoad.length));
  await warmImages([...staticUrls, ...spriteUrlsToLoad], (done, total) => {
    setEntryStatus(TEXT.loadingSceneProgress(done, total), progressBetween(8, 58, done, total), TEXT.loadingSceneDetail(done, total));
  });

  setEntryStatus(TEXT.composingMap, 58, TEXT.composingMapDetail(0, 1));
  state.layers = buildSceneLayers(data.scene);
  invalidatePanCache();
  await composeStaticLayers(state.layers, (done, total) => {
    setEntryStatus(TEXT.composingMapProgress(done, total), progressBetween(58, 76, done, total), TEXT.composingMapDetail(done, total));
  });
  await prepareGpuLayers(state.layers);
  state.layers.ready = true;
  invalidatePanCache();
  releaseImages(staticUrls);

  filterUnavailableNpcs();
  if (state.scene && data.scene?.width && data.scene?.height) {
    applyRenderBounds();
    centerCamera();
  }
  return data;
}

function startSceneLoad() {
  if (state.render?.scene?.tiles?.length && state.layers?.ready) {
    return Promise.resolve(state.render);
  }
  if (!state.sceneLoadPromise) {
    state.sceneLoadPromise = loadRenderedScene().finally(() => {
      state.sceneLoadPromise = null;
    });
  }
  return state.sceneLoadPromise;
}

async function loadRoleSprite(model) {
  if (state.roleSpriteCache.has(model)) {
    state.roleSprites = state.roleSpriteCache.get(model);
    return state.roleSprites;
  }
  const data = await fetchJson(`/api/render/model?model=${encodeURIComponent(model)}`);
  const urls = [...spriteUrls(data.sprites?.stand), ...spriteUrls(data.sprites?.walk)];
  if (CLOUD_FAST_BOOT) {
    await warmImages(urls.slice(0, 18));
    window.setTimeout(() => warmImages(urls).catch(() => {}), 800);
  } else {
    await warmImages(urls);
  }
  state.roleSpriteCache.set(data.model, data);
  state.roleSprites = data;
  return data;
}

async function runPool(items, limit, fn, onProgress) {
  let cursor = 0;
  let done = 0;

  async function worker() {
    while (cursor < items.length) {
      const index = cursor;
      cursor += 1;
      await fn(items[index], index);
      done += 1;
      if (onProgress) onProgress(done, items.length);
    }
  }

  await Promise.all(Array.from({ length: Math.min(limit, items.length || 1) }, worker));
}

async function preloadRuntime(roleModels) {
  els.loginOpenButton.disabled = true;
  els.accountButton.disabled = true;
  els.guestButton.disabled = true;

  if (CLOUD_FAST_BOOT) {
    const preload = await waitForServerStaticPreload();
    await preloadCriticalEntryAssets(preload.criticalUrls || []);
    setEntryStatus("正在铺开长安市集首屏…", 74, "");
    await startSceneLoad();
    state.runtimeReady = true;
    const ready = await fetchJson("/generated/runtime-ready.json").catch(() => null);
    const roleCount = ready?.roles?.length || roleModels.length;
    setEntryStatus(TEXT.runtimeReady(state.scene.npcs.length, roleCount), 100, TEXT.runtimeReadyDetail);
    preloadMusicAsset();
    els.loginOpenButton.disabled = false;
    els.accountButton.disabled = false;
    els.guestButton.disabled = false;
    return;
  }

  await loadRenderedScene();

  setEntryStatus(TEXT.loadingRoles, 76, TEXT.loadingRolesDetail(0, roleModels.length));
  await runPool(
    roleModels,
    ROLE_CONCURRENCY,
    (model) => loadRoleSprite(model),
    (done, total) => setEntryStatus(TEXT.loadingRolesProgress(done, total), progressBetween(76, 99, done, total), TEXT.loadingRolesDetail(done, total))
  );

  state.runtimeReady = true;
  const ready = await fetchJson("/generated/runtime-ready.json").catch(() => null);
  const roleCount = ready?.roles?.length || roleModels.length;
  setEntryStatus(TEXT.runtimeReady(state.scene.npcs.length, roleCount), 100, TEXT.runtimeReadyDetail);
  preloadMusicAsset();
  els.loginOpenButton.disabled = false;
  els.accountButton.disabled = false;
  els.guestButton.disabled = false;
}

async function enterGame(payload) {
  state.token = payload.token;
  state.role = payload.role;
  state.scene = payload.world;
  resetMarketSession();
  prepareWorldData(state.scene);
  applyRenderBounds();
  filterUnavailableNpcs();
  setupMarketWorld();
  state.roleSprites = state.roleSpriteCache.get(state.role.model) || null;
  state.selectedNpc = null;
  els.entry.hidden = true;
  els.game.hidden = false;
  markResizeDirty();
  ensureCanvasSize();
  requestAnimationFrame(() => {
    markResizeDirty();
    ensureCanvasSize();
  });
  resetMotionState(true);
  setStatus(TEXT.enteringCity);

  if (CLOUD_FAST_BOOT) {
    const scenePromise = startSceneLoad();
    renderMarketHud();
    renderWelcomeMarketPanel();
    showNewbieGuide("entry", true);
    window.setTimeout(tryAutoplayMusic, 120);
    setStatus(TEXT.loadingVisibleScene);
    Promise.all([scenePromise, loadRoleSprite(state.role.model)])
      .then(() => {
        applyRenderBounds();
        filterUnavailableNpcs();
        setupMarketWorld();
        resetMotionState(true);
        renderMarketHud();
        setStatus(TEXT.enteredCity(state.role.name));
      })
      .catch((error) => setStatus(error.message));
    return;
  }

  await Promise.all([
    state.render ? Promise.resolve(state.render) : loadRenderedScene(),
    state.roleSprites ? Promise.resolve(state.roleSprites) : loadRoleSprite(state.role.model),
  ]);

  applyRenderBounds();
  filterUnavailableNpcs();
  setupMarketWorld();
  resetMotionState(true);
  renderMarketHud();
  renderWelcomeMarketPanel();
  showNewbieGuide("entry", true);
  window.setTimeout(tryAutoplayMusic, 120);
  setStatus(TEXT.enteredCity(state.role.name));
}

async function enterGuest() {
  if (!state.runtimeReady) return;
  primeMusicFromEntryGesture();
  els.guestButton.disabled = true;
  setEntryStatus(TEXT.creatingGuest, 100, TEXT.runtimeReadyDetail);
  try {
    const payload = await fetchJson("/api/auth/guest", { method: "POST", headers: { "Content-Type": "application/json" }, body: "{}" });
    await enterGame(payload);
  } catch (error) {
    setEntryStatus(error.message);
  } finally {
    els.guestButton.disabled = false;
  }
}

async function enterAccount(event) {
  event.preventDefault();
  if (!state.runtimeReady) return;
  primeMusicFromEntryGesture();
  els.accountButton.disabled = true;
  setEntryStatus(TEXT.accountEnter, 100, TEXT.runtimeReadyDetail);
  try {
    const payload = await fetchJson("/api/auth/enter", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        username: els.username.value,
        password: els.password.value,
        roleName: els.roleName.value,
        model: els.model.value,
      }),
    });
    await enterGame(payload);
  } catch (error) {
    setEntryStatus(error.message);
  } finally {
    els.accountButton.disabled = false;
  }
}

function canvasPoint(event) {
  const rect = canvas.getBoundingClientRect();
  if (rect.width > 0 && rect.height > 0) return { x: event.clientX - rect.left, y: event.clientY - rect.top };
  return { x: event.clientX, y: event.clientY };
}

function requestMove(x, y, options = {}) {
  if (!state.scene || !state.role) return;
  const origin = { x: state.role.position.x, y: state.role.position.y };
  const target = nearestWalkablePoint({ x, y }, state.role.position);
  if (!target) return;
  const commandId = state.move.commandId + 1;
  state.move.commandId = commandId;
  clearPathWorkerTimeout();
  if (options.mark !== false) state.marks.push({ ...target, time: performance.now() });

  if (options.preserveVelocity !== false && state.move.currentSpeed > 10) {
    const currentSpeed = vectorLength(state.move.vx, state.move.vy);
    if (currentSpeed > state.move.maxSpeed) {
      const limited = limitVector(state.move.vx, state.move.vy, state.move.maxSpeed);
      state.move.vx = limited.x;
      state.move.vy = limited.y;
    }
  }

  if (hasWalkableLine(origin, target)) {
    setMovePath([target], target, { ...options, pendingPath: false });
    return;
  }

  const preview = firstReachablePoint(origin, target);
  if (preview) {
    setMovePath([preview], target, { ...options, pendingPath: !options.directOnly });
  } else {
    state.role.position.direction = directionFromDelta(target.x - origin.x, target.y - origin.y);
    state.move.renderDirection = state.role.position.direction;
  }

  if (options.directOnly) return;
  if (!requestWorkerPath(commandId, target)) requestAsyncPathFallback(commandId, target);
}

function nearestNpc(world) {
  let best = null;
  let bestDistance = 42;
  for (const npc of state.scene?.npcs || []) {
    const distance = Math.hypot(npc._wx - world.x, npc._wy - world.y);
    if (distance < bestDistance) {
      best = npc;
      bestDistance = distance;
    }
  }
  return best;
}

async function talkToNpc(npc) {
  state.selectedNpc = npc;
  if (state.guidance?.npcId === String(npc.id)) state.guidance = { npcId: "", label: "", startedAt: 0 };
  requestMove(npcWorld(npc).x, npcWorld(npc).y + 24);
  const profile = marketProfileForNpc(npc);
  if (profile) {
    renderNpcMarketPanel(npc);
    return;
  }
  els.dialogSpeaker.textContent = displayNpcName(npc);
  els.dialogText.textContent = "这位摊主还在布置心货，先去找长街上的核心摊主吧。";
  els.dialogOptions.innerHTML = `<button type="button">知道了</button>`;
  state.dialog.npcId = String(npc.id);
  els.dialog.hidden = false;
  enterDialogueMusic();
  els.dialogOptions.querySelector("button")?.addEventListener("click", () => {
    closeNpcDialog();
  });
}

canvas.addEventListener("pointerdown", (event) => {
  canvas.setPointerCapture(event.pointerId);
  const point = canvasPoint(event);
  state.pointer = { down: true, x: point.x, y: point.y, moved: false, pendingDx: 0, pendingDy: 0 };
});

canvas.addEventListener("pointermove", (event) => {
  if (!state.pointer.down) return;
  const point = canvasPoint(event);
  const dx = point.x - state.pointer.x;
  const dy = point.y - state.pointer.y;
  if (!state.pointer.moved && Math.abs(dx) + Math.abs(dy) > 5) {
    state.pointer.moved = true;
  }
  if (state.pointer.moved) queueCameraPan(dx, dy);
  state.pointer.x = point.x;
  state.pointer.y = point.y;
});

canvas.addEventListener("pointerup", (event) => {
  const point = canvasPoint(event);
  const wasDrag = state.pointer.moved;
  if (wasDrag) applyPendingCameraPan();
  state.pointer.down = false;
  if (wasDrag) {
    return;
  }
  if (!state.scene) return;

  const world = screenToWorld(point.x, point.y);
  const npc = nearestNpc(world);
  if (npc) {
    talkToNpc(npc).catch((error) => setStatus(error.message));
    return;
  }

  closeNpcDialog();
  requestMove(world.x, world.y);
});

function closeGameManual() {
  if (els.gameManualPanel) els.gameManualPanel.hidden = true;
}

els.manualOpenButton?.addEventListener("click", () => {
  if (els.gameManualPanel) els.gameManualPanel.hidden = false;
});

els.gameManualClose?.addEventListener("click", closeGameManual);

els.gameManualPanel?.addEventListener("click", (event) => {
  if (event.target === els.gameManualPanel) closeGameManual();
});

els.marketCloseButton?.addEventListener("click", closeMarketPanel);
els.marketPanel?.addEventListener("click", handleMarketAction);
els.marketPanel?.addEventListener("click", handleDirectorAction);
els.directorPanel?.addEventListener("click", handleDirectorAction);
els.marketGuideButton?.addEventListener("click", renderGuidePanel);
els.newbieHudButton?.addEventListener("click", reopenNewbieGuide);
els.audioToggleButton?.addEventListener("click", toggleMusic);
els.marketExchangeButton?.addEventListener("click", renderMarketExchangePanel);
els.marketDailyButton?.addEventListener("click", renderDailyMarketPanel);
els.marketCodexButton?.addEventListener("click", renderCodexPanel);
els.marketLedgerButton?.addEventListener("click", renderLedgerPanel);
els.marketAreaButton?.addEventListener("click", renderAreaPanel);
els.marketStallButton?.addEventListener("click", renderStallPanel);
els.dialogOptions?.addEventListener("click", handleDialogAction);
els.dialogCloseButton?.addEventListener("click", closeNpcDialog);
els.newbieFocusButton?.addEventListener("click", focusTutorialTarget);
els.newbieCloseButton?.addEventListener("click", hideNewbieGuide);

canvas.addEventListener("wheel", (event) => {
  event.preventDefault();
  setMapZoom(state.zoom + (event.deltaY < 0 ? MAP_ZOOM_STEP : -MAP_ZOOM_STEP), event.offsetX, event.offsetY);
});

els.mapZoomInButton?.addEventListener("click", () => zoomMapBy(MAP_ZOOM_STEP));
els.mapZoomOutButton?.addEventListener("click", () => zoomMapBy(-MAP_ZOOM_STEP));
els.mapCenterButton?.addEventListener("click", centerMapOnRole);
els.mapPanUpButton?.addEventListener("click", () => panMapBy(0, -MAP_CONTROL_PAN_STEP));
els.mapPanDownButton?.addEventListener("click", () => panMapBy(0, MAP_CONTROL_PAN_STEP));
els.mapPanLeftButton?.addEventListener("click", () => panMapBy(-MAP_CONTROL_PAN_STEP, 0));
els.mapPanRightButton?.addEventListener("click", () => panMapBy(MAP_CONTROL_PAN_STEP, 0));

function setKeyboardDirection(key, down) {
  const value = key.toLowerCase();
  if (key === "ArrowUp" || value === "w") state.keyboard.up = down;
  else if (key === "ArrowDown" || value === "s") state.keyboard.down = down;
  else if (key === "ArrowLeft" || value === "a") state.keyboard.left = down;
  else if (key === "ArrowRight" || value === "d") state.keyboard.right = down;
  else return false;
  return true;
}

function clearKeyboardState() {
  state.keyboard.up = false;
  state.keyboard.down = false;
  state.keyboard.left = false;
  state.keyboard.right = false;
  state.keyboard.active = false;
}

function pauseInteraction() {
  clearKeyboardState();
  state.pointer.down = false;
  state.pointer.moved = false;
  state.pointer.pendingDx = 0;
  state.pointer.pendingDy = 0;
  state.accumulator = 0;
  state.lastFrame = performance.now();
  if (state.role) stopMotion(true, false);
}

window.addEventListener("keydown", (event) => {
  if (event.key === "Escape") {
    closeNpcDialog();
    closeMarketPanel();
    closeGameManual();
  }
  if (!state.role || !state.scene || els.game.hidden) return;
  if (!setKeyboardDirection(event.key, true)) return;
  event.preventDefault();
});

window.addEventListener("keyup", (event) => {
  if (!setKeyboardDirection(event.key, false)) return;
  event.preventDefault();
});

window.addEventListener("blur", pauseInteraction);
document.addEventListener("visibilitychange", () => {
  if (document.hidden) pauseInteraction();
});
canvas.addEventListener("pointercancel", () => {
  state.pointer.down = false;
  state.pointer.moved = false;
  state.pointer.pendingDx = 0;
  state.pointer.pendingDy = 0;
});

async function bootstrap() {
  els.loginOpenButton.disabled = true;
  els.accountButton.disabled = true;
  els.guestButton.disabled = true;
  const data = await fetchJson("/api/bootstrap");
  const models = data.roleModels || [];
  els.model.innerHTML = models.map((model) => `<option value="${escapeHtml(model)}">${escapeHtml(model)}</option>`).join("");
  const scene = await fetchJson(`/api/scene/${data.defaultMapId || MAP_ID}`);
  state.scene = scene;
  prepareWorldData(state.scene);
  setEntryStatus(TEXT.bootstrap(scene.map.name), 4, "");
  await preloadRuntime(models);
}

const HOME_TEXT = {
  zh: {
    navHome: "\u9996\u9875",
    navAbout: "\u5173\u4e8e\u4f5c\u54c1",
    eyebrow: "\u95ee\u5fc3\u5165\u5e02\uff0c\u4e07\u5ff5\u7686\u53ef\u4ea4\u6613",
    title: "\u5929\u5143\u5fc3\u5e02",
    heroCopy: "\u5728\u53e4\u98ce\u957f\u5b89\u91cc\u4e70\u5356\u5b89\u6170\u3001\u6e05\u9192\u3001\u7b7e\u8fd0\u4e0e\u7075\u611f\uff0c\u4e5f\u80fd\u5f00\u8bbe\u81ea\u5df1\u7684\u6027\u683c\u5c0f\u644a\u3002",
    featureOneTitle: "\u5fc3\u8d27\u4e70\u5356",
    featureOneCopy: "\u4e0e\u644a\u4e3b\u4ea4\u6362\u5b89\u6170\u3001\u6e05\u9192\u3001\u7b7e\u8fd0\u4e0e\u7075\u611f\u3002",
    featureTwoTitle: "\u6536\u5f55\u9645\u9047",
    featureTwoCopy: "\u6bcf\u6b21\u4e70\u5356\u90fd\u7559\u4e0b\u8bb0\u5f55\uff0c\u6162\u6162\u770b\u89c1\u4eba\u4e0e\u573a\u666f\u3002",
    featureThreeTitle: "\u81ea\u8bbe\u5c0f\u644a",
    featureThreeCopy: "\u9009\u62e9\u6027\u683c\u4e0e\u552e\u5356\u5185\u5bb9\uff0c\u63a5\u5f85\u4e00\u4f4d\u6765\u8bbf\u8005\u3002",
    entryHint: "\u65e0\u9700\u6ce8\u518c\u4e5f\u53ef\u5148\u4ee5\u8bbf\u5ba2\u5165\u5e02\uff0c\u7ea6\u4e24\u5206\u949f\u4f53\u9a8c\u4e00\u6b21\u4e70\u4e0e\u5356\u3002",
    entryLabel: "\u8fdb\u5165\u5fc3\u5e02",
    entryTitle: "\u767b\u5f55\u6216\u6ce8\u518c",
    accountLabel: "\u8d26\u53f7",
    passwordLabel: "\u5bc6\u7801",
    roleNameLabel: "\u89d2\u8272\u540d",
    modelLabel: "\u89d2\u8272",
    loginOpenButton: "\u767b\u5f55 / \u6ce8\u518c",
    accountButton: "\u786e\u8ba4\u8fdb\u5165",
    guestButton: "\u8bbf\u5ba2\u6a21\u5f0f",
    accountPlaceholder: "\u4f8b\u5982 tiany01",
    passwordPlaceholder: "\u81f3\u5c11 3 \u4f4d",
    roleNamePlaceholder: "\u9996\u6b21\u6ce8\u518c\u65f6\u4f7f\u7528",
    aboutEyebrow: "\u4f5c\u54c1\u5b9a\u4e49",
    aboutTitle: "\u5173\u4e8e\u5929\u5143\u5fc3\u5e02",
    aboutBody: "\u5929\u5143\u5fc3\u5e02\u662f\u4e00\u4e2a\u53ef\u64cd\u4f5c\u7684\u53e4\u98ce\u4eba\u683c\u4ea4\u6613\u5e02\u96c6\u3002\u5b83\u628a\u5b89\u6170\u3001\u6e05\u9192\u3001\u7b7e\u8fd0\u4e0e\u7075\u611f\u8bbe\u8ba1\u6210\u53ef\u4e70\u53ef\u5356\u7684\u865a\u62df\u5fc3\u8d27\uff0c\u8ba9\u7528\u6237\u5728\u77ed\u65f6\u95f4\u5185\u4f53\u9a8c\u4e00\u6b21\u5165\u5e02\u3001\u4ea4\u6362\u4e0e\u5f00\u644a\u7684\u5b8c\u6574\u6d41\u7a0b\u3002\u5168\u90e8\u4ea4\u6613\u5747\u4e3a\u6a21\u62df\u5185\u5bb9\uff0c\u4e0d\u6d89\u53ca\u771f\u5b9e\u652f\u4ed8\u3002",
  },
  en: {
    navHome: "Home",
    navAbout: "About",
    eyebrow: "Enter with a question; every thought can be traded",
    title: "Tiany Heart Market",
    heroCopy: "Trade comfort, clarity, fortune and inspiration in an ancient-style market, then open your own personality stall.",
    featureOneTitle: "Heart Goods",
    featureOneCopy: "Exchange comfort, clarity, fortune and inspiration with market keepers.",
    featureTwoTitle: "Encounters",
    featureTwoCopy: "Each trade leaves a record of people, places and passing thoughts.",
    featureThreeTitle: "Your Stall",
    featureThreeCopy: "Choose a personality and offering, then receive a visitor.",
    entryHint: "Enter as a guest and finish one buy-and-sell loop in about two minutes.",
    entryLabel: "Enter Heart Market",
    entryTitle: "Sign in or register",
    accountLabel: "Account",
    passwordLabel: "Password",
    roleNameLabel: "Role name",
    modelLabel: "Role",
    loginOpenButton: "Sign in / Register",
    accountButton: "Confirm entry",
    guestButton: "Guest mode",
    accountPlaceholder: "e.g. tiany01",
    passwordPlaceholder: "At least 3 chars",
    roleNamePlaceholder: "Used on first registration",
    aboutEyebrow: "Definition",
    aboutTitle: "About Tiany Heart Market",
    aboutBody: "An interactive ancient-style personality market where visitors can buy, sell, draw fortunes, collect codex cards and run a simulated stall.",
  },
};

function applyHomeLanguage(lang) {
  const next = HOME_TEXT[lang] ? lang : "zh";
  document.body.dataset.lang = next;
  document.documentElement.lang = next === "zh" ? "zh-CN" : "en";
  document.querySelectorAll("[data-i18n]").forEach((node) => {
    const text = HOME_TEXT[next][node.dataset.i18n];
    if (text) setText(node, text);
  });
  document.querySelectorAll("[data-i18n-placeholder]").forEach((node) => {
    const text = HOME_TEXT[next][node.dataset.i18nPlaceholder];
    if (text) node.placeholder = text;
  });
}

function initHomeUi() {
  const themeToggle = document.querySelector("#themeToggle");
  const languageToggle = document.querySelector("#languageToggle");
  const aboutToggle = document.querySelector("#aboutToggle");
  const aboutPanel = document.querySelector("#aboutPanel");
  const aboutClose = document.querySelector("#aboutClose");
  const loginOpen = document.querySelector("#loginOpenButton");
  const authPanel = document.querySelector("#authPanel");
  const authClose = document.querySelector("#authClose");
  try {
    const savedTheme = localStorage.getItem("tiany-theme");
    const savedLang = localStorage.getItem("tiany-lang");
    if (savedTheme) document.body.dataset.theme = savedTheme;
    applyHomeLanguage(savedLang || document.body.dataset.lang || "zh");
  } catch {
    applyHomeLanguage(document.body.dataset.lang || "zh");
  }

  themeToggle?.addEventListener("click", () => {
    const next = document.body.dataset.theme === "ink" ? "light" : "ink";
    document.body.dataset.theme = next;
    try {
      localStorage.setItem("tiany-theme", next);
    } catch {}
  });

  languageToggle?.addEventListener("click", () => {
    const next = document.body.dataset.lang === "zh" ? "en" : "zh";
    applyHomeLanguage(next);
    try {
      localStorage.setItem("tiany-lang", next);
    } catch {}
  });

  function closeAbout() {
    if (aboutPanel) aboutPanel.hidden = true;
  }

  function closeAuth() {
    if (authPanel) authPanel.hidden = true;
  }

  aboutToggle?.addEventListener("click", () => {
    if (aboutPanel) aboutPanel.hidden = false;
  });
  aboutClose?.addEventListener("click", closeAbout);
  aboutPanel?.addEventListener("click", (event) => {
    if (event.target === aboutPanel) closeAbout();
  });
  loginOpen?.addEventListener("click", () => {
    if (authPanel) authPanel.hidden = false;
    window.setTimeout(() => els.username?.focus(), 40);
  });
  authClose?.addEventListener("click", closeAuth);
  authPanel?.addEventListener("click", (event) => {
    if (event.target === authPanel) closeAuth();
  });
  els.homeAudioButton?.addEventListener("click", toggleHomeMusic);
  updateHomeAudioButton();
  try {
    ensureHomeAudioElement().load?.();
  } catch {
    // Homepage music is decorative; ignore preload failures.
  }
  bindHomeMusicAutostart();
  window.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      closeAbout();
      closeAuth();
    }
  });
}

els.authForm.addEventListener("submit", enterAccount);
els.guestButton.addEventListener("click", enterGuest);
window.addEventListener("resize", () => {
  markResizeDirty();
});
window.addEventListener("orientationchange", () => {
  markResizeDirty();
});
window.visualViewport?.addEventListener("resize", () => {
  markResizeDirty();
});
window.visualViewport?.addEventListener("scroll", () => {
  markResizeDirty();
});

initHomeUi();
bootstrap().catch((error) => setEntryStatus(error.message));
draw();
