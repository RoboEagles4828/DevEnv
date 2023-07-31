# DevEnv
1) Ensure that virtualization is turned on in bios
2) Open Powershell as Administrator and run
```Set-ExecutionPolicy unrestricted```
3) Run setup.ps1 which installs
   - WSL2
   - WSL2 kernel that support cameras, multicasting, xbox controllers and blueooth
   - winget
   - docker-desktop
   - git
   - usbipd
   - vscode
     - dev container extension
     - remote explorer extension
4) Restart your PC
   
5) If you have an RTX Nvidia GPU
   - Run isaac_setup.ps1 which installs
      - Omniverse Launcher (You must manually install isaac sim inside of the launcher)
      - ROS2 for windows
      - Adds isaac extension to your worksapce     
   
7) Open the DevEnv folder in vscode and reopen container
   - Installs ROS2 Humble docker image
  

