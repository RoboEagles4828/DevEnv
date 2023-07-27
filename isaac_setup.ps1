$ProgressPreference = 'SilentlyContinue'
if (-not (Test-Path "$env:LOCALAPPDATA\ov")) {
    "Omniverse not installed. Installing..."
    Invoke-WebRequest 'https://install.launcher.omniverse.nvidia.com/installers/omniverse-launcher-win.exe' -OutFile isaac_sim_windows.exe
    ./isaac_sim_windows.exe
    "Omniverse installed!"
}
while (-not (Test-Path "$env:LOCALAPPDATA\ov\pkg\isaac_sim-2022.2.1")) {
    "Isaac sim not installed. Please install it"
    Write-Host "Press Enter when installed"
    $null = Read-Host

}
"Install ROS2..."
Invoke-WebRequest 'https://www.dropbox.com/scl/fi/chckfua0ontxc9t2hnvrk/ROS2_foxy.zip?rlkey=1zk4u7kjgzfxw85n24pavj9r7&dl=1' -OutFile ROS2_foxy.zip
Expand-Archive -LiteralPath .\ROS2_foxy.zip -DestinationPath .\C:\
"ROS 2 installed!"
"Setup Isaac sim..."
(Get-Content -Path "$env:LOCALAPPDATA\ov\pkg\isaac_sim-2022.2.1/apps/omni.isaac.sim.base.kit") | ForEach-Object {$_ -replace 'isaac.startup.ros_bridge_extension = ""', 'isaac.startup.ros_bridge_extension = "omni.isaac.ros2_bridge"'} | Set-Content -Path "$env:LOCALAPPDATA\ov\pkg\isaac_sim-2022.2.1/apps/omni.isaac.sim.base.kit"
"Setup Done!"
"To run isaac sim, run isaac.bat outside of dev container"