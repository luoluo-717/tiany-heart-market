# 长安城 Web 轻量版

这是裁剪后的 Web 游戏运行包。项目只保留长安城 `1001`、长安城 NPC、17 个可创建角色模型，以及浏览器运行需要的预编译 PNG 资源。

## 启动

```powershell
cd "C:\Users\陈骆彦\Desktop\比赛\游戏源码\tiany\web"
npm start
```

默认地址：

```text
http://127.0.0.1:8080
```

部署到服务器：

```powershell
$env:HOST="0.0.0.0"
$env:PORT="8080"
npm start
```

## 预编译

`npm start` 默认会先检查并预编译长安城运行资源：

- 长安城地图块：840
- 长安城遮罩：818
- NPC 精灵源文件：47
- 可创建角色：17 个模型，均包含站立和行走帧

也可以单独执行：

```powershell
npm run precompile
```

前端入口页会热加载这些静态 PNG。进入游戏后不再现场解码 `.map` / `.was`，地图 Canvas 全屏显示。

## 当前体积

裁剪后主目录约 315 MB：

- `web`：约 232 MB，包含预编译后的地图、遮罩、NPC 和角色帧
- `XYQCS`：约 64 MB，仅保留 `lua` 数据、`1001.map` 和 81 个必要 WAS 源文件
- `GGELUA`：约 19 MB，仅保留预编译工具链最小运行件

账号数据写入 `web/data/users.json`，每个账号只允许一个角色。
