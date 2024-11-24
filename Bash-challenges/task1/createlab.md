# Windows Subsystem for Linux (WSL) Setup Guide

## Overview
This guide provides instructions for setting up a Linux environment on Windows using either Windows Subsystem for Linux (WSL) or Oracle VirtualBox.

## Environment Options

### Option 1: Oracle VirtualBox
- Install Oracle VirtualBox
- Install your preferred Linux distribution as a virtual machine

### Option 2: Windows Subsystem for Linux (WSL)

#### Prerequisites
- Windows 10 or Windows 11
- Hardware virtualization support enabled in BIOS

#### Basic Installation
1. Open PowerShell as Administrator and run:
```powershell
wsl --install
```
This command:
- Enables required Windows features
- Installs Ubuntu by default
- Enables Virtual Machine Platform

#### Manual Installation (if automatic installation fails)
1. Enable required Windows features:
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
2. Restart your system
3. Install a Linux distribution from the Microsoft Store:
   - Ubuntu
   - Debian
   - Kali Linux
   - Others as available

#### Post-Installation Steps
1. Update WSL:
```powershell
wsl --update
```

2. Verify installation:
```powershell
wsl --list --verbose
```

## Troubleshooting Guide

### Common Issues and Solutions

#### 1. WslRegisterDistribution Failed
**Error Message**: "WslRegisterDistribution failed with error"
**Solution**: 
- Check and enable virtualization in BIOS settings

#### 2. WSL 2 Kernel Update Required
**Error Message**: "WSL 2 requires an update to its kernel component"
**Solution**:
- Download and install the latest WSL 2 kernel update from Microsoft's official website

#### 3. Performance Issues
**Solution**:
```powershell
wsl --set-version  2
```
This command switches your distribution to WSL 2 for improved performance.

## Additional Resources
- If you encounter other issues, consult:
  - Official Microsoft WSL documentation
  - ChatGPT or other online resources
  - Community forums

## Notes
- Linux users can practice bash commands directly in their terminal without additional setup
- WSL provides a native Linux experience on Windows without the overhead of full virtualization
- Regular updates are recommended for optimal performance and security