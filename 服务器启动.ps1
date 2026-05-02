param(
  [int]$Port = 8080,
  [string]$HostName = "0.0.0.0",
  [switch]$SkipPrecompile
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$web = Join-Path $root "web"

if (-not (Test-Path (Join-Path $web "server.js"))) {
  throw "没有找到 web\server.js，请确认脚本放在 tiany 目录下运行。"
}

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  throw "服务器未安装 Node.js。请先安装 Node.js 18 或 20 LTS。"
}

$env:HOST = $HostName
$env:PORT = [string]$Port
if ($SkipPrecompile) {
  $env:PRECOMPILE = "0"
}

Set-Location $web
Write-Host "正在启动天元心市： http://127.0.0.1:$Port"
Write-Host "公网访问请使用： http://服务器公网IP:$Port"
npm start
