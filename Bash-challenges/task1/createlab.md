*If we are using windows we have to create virtual environment for running bash. If we are using Linux we can practice directly there.
#In windowa:
    -we can install oracle virtual box and install linux there.
    -We can install Windows Subsystem for Linux (wsl) by following steps:
        -wsl require windows 10/11.
        -Enable wsl using command: wsl --install [this installs ubuntu and enables necessary features like Virtual Machine Platform]
            -If we encounter issues. Try doing:
                -open Powershellas Admin and run:
                    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
                    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
                -restart system
            
            If still issue persist then solveusing chatGgpt or other resources.

    If wsl --install doesn't automatically install a distribution:
        -install a Luinux distribution (ubuntu, debian, kali, etc) from microsoft store. Lunch the distribution and complete setup by creating username and password

    Update Wsl using command: wsl --update

    verify installation using command: wsl --list --verbose







    Some troubleshooting ideas:

        -Error: WslRegisterDistribution failed with error:
                -Ensure virtualization is enabled in the BIOS.
        -Error: WSL 2 requires an update to its kernel component:
                - Download and install latest WSL 2 kernel update from Microsoft's official page.
        -Slow performance:
                -use wsl --set-version <distro(like ubuntu, kali, etc)> 2 to switch to WSL 2 for better performance.