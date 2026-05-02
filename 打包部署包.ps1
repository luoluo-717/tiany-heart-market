param(
  [string]$OutputPath = ""
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $OutputPath) {
  $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
  $OutputPath = Join-Path (Split-Path -Parent $root) "tiany-heart-market-$stamp.zip"
}

$required = @(
  "web\server.js",
  "web\package.json",
  "web\public\index.html",
  "web\public\generated\runtime-ready.json",
  "XYQCS",
  "GGELUA\lua.exe"
)

foreach ($item in $required) {
  $path = Join-Path $root $item
  if (-not (Test-Path $path)) {
    throw "缺少部署必要文件：$item"
  }
}

$temp = Join-Path $env:TEMP ("tiany-deploy-" + [guid]::NewGuid().ToString("N"))
$stage = Join-Path $temp "tiany"
New-Item -ItemType Directory -Path $stage | Out-Null

$include = @("web", "XYQCS", "GGELUA")
foreach ($name in $include) {
  Copy-Item -LiteralPath (Join-Path $root $name) -Destination (Join-Path $stage $name) -Recurse -Force
}

$excludePatterns = @(
  "*.log",
  "*.pid",
  "test-results",
  "homepage-check*.png"
)

Get-ChildItem -LiteralPath $stage -Recurse -Force | Where-Object {
  $entry = $_
  $excludePatterns | Where-Object { $entry.Name -like $_ }
} | Sort-Object FullName -Descending | ForEach-Object {
  Remove-Item -LiteralPath $_.FullName -Recurse -Force
}

if (Test-Path $OutputPath) {
  Remove-Item -LiteralPath $OutputPath -Force
}

Compress-Archive -LiteralPath $stage -DestinationPath $OutputPath -Force
Remove-Item -LiteralPath $temp -Recurse -Force

Write-Host "部署包已生成：$OutputPath"
