cd "C:\Users\$Env:UserName\Downloads\DevEnv-main\DevEnv-main"

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

wsl --install -d Ubuntu

"Downloading kernel..."
Invoke-WebRequest 'https://www.dropbox.com/scl/fi/ztih8g597da374n11ndor/kernel.zip?rlkey=x9l74ebavb26cq77z5opivybx&dl=1' -OutFile kernel.zip
"Downloading kernel... Done!"
Expand-Archive -LiteralPath .\kernel.zip -DestinationPath .\kernel
mkdir C:\Sources
Move-Item .\kernel\vmlinux C:\Sources\vmlinux
rm .\kernel
rm .\kernel.zip

"Setting up WSLconfig..."
mv .\.wslconfig C:\Users\$Env:UserName\.wslconfig
"Setting up WSLconfig... Done!"

"Install winget apps...!"
winget install vscode
winget install git.git
winget install docker.dockerdesktop
winget install usbipd
"Install winget apps... Done!"

"Setting up VSCode..."
Start-Process powershell -verb runas -ArgumentList "-file ${pwd}/code-setup.ps1"
