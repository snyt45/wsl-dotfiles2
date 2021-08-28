Param(
  [Parameter(Mandatory=$true)]
  [String]$Arg1,
  [Parameter(Mandatory=$true)]
  [String]$Arg2,
  [Parameter(Mandatory=$true)]
  [String]$Arg3
)

Write-Host "WSLにUbuntuをインポートします。"

# Write-Error時に終了エラーを発生させる。
$ErrorActionPreference = 'Stop'

$DistroName = $Arg1
$InstallLocation = $Arg2
$InstallTarFile = $Arg3

# TODO: デバッグ用。不要になったら削除する
Write-Host "DistroName=${DistroName}"
Write-Host "InstallLocation=${InstallLocation}"
Write-Host "InstallTarFile=${InstallTarFile}"

# wslコマンドが存在するか
try {
  Get-Command -Name wsl -ErrorAction Stop > $null
} catch {
  Write-Error "wslコマンドが存在しません。"
}

# tarファイルがあるか
try {
  if (!(Test-Path $InstallTarFile)) { throw }
} catch {
  Write-Error "指定されたtarファイルが見つかりません。"
}

# wsl --import <DistroName> <InstallLocation> <InstallTarFile>
wsl --import $DistroName $InstallLocation $InstallTarFile

Write-Host "Done."
