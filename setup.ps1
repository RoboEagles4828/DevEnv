Set-ExecutionPolicy Bypass -Scope Process -Force
Start-Process powershell -verb runas -ArgumentList "-file ${pwd}/setup-pwshell.ps1" -WorkingDirectory ${pwd}
```