#Requires -RunAsAdministrator

param(
    [string]$KernelMsiPath = ".\packages\wsl_update_x64.msi",
    [string]$WslMsixBundlePath = ".\packages\wsl.msixbundle"
)

Write-Host "Enabling WSL feature..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Write-Host "Enabling Virtual Machine Platform..."
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

if (Test-Path $KernelMsiPath) {
    Write-Host "Installing WSL kernel update..."
    Start-Process msiexec.exe -ArgumentList "/i `"$KernelMsiPath`" /quiet /norestart" -Wait
} else {
    Write-Warning "Kernel MSI not found: $KernelMsiPath"
}

if (Test-Path $WslMsixBundlePath) {
    Write-Host "Installing WSL package..."
    Add-AppxPackage $WslMsixBundlePath
} else {
    Write-Warning "WSL MSIX bundle not found: $WslMsixBundlePath"
}

Write-Host "Setting WSL2 as default..."
wsl --set-default-version 2

Write-Host "Done. Please restart Windows if required."
