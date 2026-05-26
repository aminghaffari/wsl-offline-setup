param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [Parameter(Mandatory = $true)]
    [string]$InstallPath,

    [Parameter(Mandatory = $true)]
    [string]$TarPath
)

if (!(Test-Path $TarPath)) {
    throw "Distro tar file not found: $TarPath"
}

if (!(Test-Path $InstallPath)) {
    New-Item -ItemType Directory -Path $InstallPath | Out-Null
}

Write-Host "Importing distro $Name..."
wsl --import $Name $InstallPath $TarPath --version 2

Write-Host "Done."
Write-Host "Run with: wsl -d $Name"
