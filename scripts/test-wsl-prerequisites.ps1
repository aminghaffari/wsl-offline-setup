$os = Get-CimInstance Win32_OperatingSystem
$build = [int]$os.BuildNumber

Write-Host "Windows Build: $build"

if ($build -lt 19041) {
    Write-Warning "WSL2 requires Windows 10 build 19041+ or Windows 11."
} else {
    Write-Host "Windows build is compatible."
}

$features = @(
    "Microsoft-Windows-Subsystem-Linux",
    "VirtualMachinePlatform"
)

foreach ($feature in $features) {
    $state = dism.exe /online /get-featureinfo /featurename:$feature | Select-String "State"
    Write-Host "$feature => $state"
}

$virtualization = Get-CimInstance Win32_Processor | Select-Object -ExpandProperty VirtualizationFirmwareEnabled

if ($virtualization) {
    Write-Host "Virtualization is enabled."
} else {
    Write-Warning "Virtualization is disabled in BIOS/UEFI."
}
