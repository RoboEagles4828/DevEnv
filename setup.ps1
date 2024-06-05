if ((Get-Location).Path -notmatch 'DevEnv$') {
    Write-Error "This script must be run from the DevEnv directory"
    exit 1
}
$ProgressPreference = 'SilentlyContinue'
"Install winget..."
$result = Get-AppPackage *Microsoft.DesktopAppInstaller*|Select-Object Name
if ($null -eq $result) {
    Invoke-WebRequest -Uri https://aka.ms/winget-cli-win -OutFile winget-cli.msi
    Start-Process msiexec.exe -Wait -ArgumentList '/i winget-cli.msi /quiet /qn /norestart'
    Remove-Item winget-cli.msi
}
else {
    "winget already installed"
}
"Install WSL"
wsl --install -d Ubuntu

# "Downloading kernel..."
# Invoke-WebRequest 'https://www.dropbox.com/scl/fi/ztih8g597da374n11ndor/kernel.zip?rlkey=x9l74ebavb26cq77z5opivybx&dl=1' -OutFile kernel.zip
# "Downloading kernel... Done!"
# Expand-Archive -LiteralPath .\kernel.zip -DestinationPath .\kernel
# mkdir C:\Sources
# cp .\kernel\vmlinux C:\Sources\vmlinu
# rm .\kernel
# rm .\kernel.zip

"Setting up WSLconfig..."
cp .\.wslconfig C:\Users\$Env:UserName\.wslconfig
"Setting up WSLconfig... Done!"

"Install winget apps...!"
winget install vscode
winget install git.git
winget install docker.dockerdesktop
winget install usbipd
"Install winget apps... Done!"

"Setting up VSCode..."
Start-Process powershell -verb runas -ArgumentList "-file ${pwd}/code-setup.ps1" -WorkingDirectory ${pwd}
```
