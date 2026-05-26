# WSL Offline Toolkit

Enterprise-ready toolkit for installing and deploying WSL2 on Windows without internet access.

## Features

- Enable required Windows features
- Install WSL2 kernel update offline
- Install WSL package from `.msixbundle`
- Import Linux distributions from `.tar`
- Validate Windows prerequisites
- Support air-gapped and enterprise environments

## Repository Structure

- `scripts/`: PowerShell automation scripts
- `docs/`: Installation and troubleshooting guides
- `packages/`: Offline WSL packages, not committed to Git
- `distros/`: Linux rootfs or exported WSL distro files, not committed to Git
- `examples/`: Sample configuration files

## Quick Start

Run PowerShell as Administrator:

```powershell
.\scripts\test-wsl-prerequisites.ps1
.\scripts\install-wsl-offline.ps1
.\scripts\import-distro.ps1 -Name Ubuntu -InstallPath D:\WSL\Ubuntu -TarPath .\distros\ubuntu.tar
