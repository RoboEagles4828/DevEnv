code --install-extension ms-vscode.remote-explorer
code --install-extension ms-vscode-remote.remote-containers
# Get the path to the settings.json file
$path = "C:\Users\$env:UserName\AppData\Roaming\Code\User\settings.json"

# Check if the file exists
if (-not (Test-Path $path)) {
    # Write-Error "File not found: $path"
    # return
    "Vscode settings does not exist, creating new settings file."
    New-Item C:\Users\$env:UserName\AppData\Roaming\Code\User\settings.json -type file
    Set-Content $path "{`n`"dev.containers.executeInWSL`":true`n}"
}

# Read the contents of the file
$content = Get-Content $path -Raw

# Convert the contents to a JSON object
$json = ConvertFrom-Json $content


# Check if the property already exists

if ($json | Get-Member -Name 'dev.containers.executeInWSL') {
    Write-Host "Property already exists in $path"
    return
}

# Add the new property to the existing object
$json | add-member -Name "dev.containers.executeInWSL" -value $true -MemberType NoteProperty

# Convert the JSON object back to a string
$newContent = ConvertTo-Json $json -Depth 100

# Write the new contents to the file
Set-Content $path $newContent

Write-Host "Property added to $path"

code