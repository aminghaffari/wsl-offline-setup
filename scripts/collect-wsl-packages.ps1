#Requires -RunAsAdministrator

param(
    [string]$DownloadPath = ".\packages"
)

Write-Host "Preparing package directory..."

if (!(Test-Path $DownloadPath)) {
    New-Item -ItemType Directory -Path $DownloadPath | Out-Null
}

$kernelUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$kernelOutput = Join-Path $DownloadPath "wsl_update_x64.msi"

Write-Host "Downloading WSL kernel update..."
Invoke-WebRequest -Uri $kernelUrl -OutFile $kernelOutput

Write-Host "Kernel package downloaded:"
Write-Host $kernelOutput

Write-Host ""
Write-Host "=================================================="
Write-Host "IMPORTANT:"
Write-Host "Download the latest WSL package manually from:"
Write-Host "https://github.com/microsoft/WSL/releases"
Write-Host ""
Write-Host "Place the downloaded:"
Write-Host "wsl.msixbundle"
Write-Host ""
Write-Host "inside:"
Write-Host $DownloadPath
Write-Host "=================================================="
