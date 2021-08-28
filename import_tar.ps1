Write-Host "WSLにUbuntuをインポートします。"

Param(
  [String]$Arg1,
  [String]$Arg2,
  [String]$Arg3
)

$DistroName = $Arg1
$InstallLocation = $Arg2
$InstallTarFile = $Arg3

# wslコマンドが存在するか
try {
  Get-Command -Name wsl -ErrorAction Stop > $null
} catch {
  Write-Host "wslコマンドが存在しません。"
  exit 1
}

# tarファイルがあるか
try {
  if (!(Test-Path $InstallTarFile)) { throw }
} catch {
  Write-Host "指定されたtarファイルが見つかりません。"
  exit 1
}

# wsl --import <DistroName> <InstallLocation> <InstallTarFile>
wsl --import $DistroName $InstallLocation $InstallTarFile

Write-Host "Done."
