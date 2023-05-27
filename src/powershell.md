# SSH
- Configure windows: https://theitbros.com/ssh-into-windows/
- `ipconfig` - Display ip details


# Scripts
1. Create file `test.ps1`
2. Add content `Write-Host "Hello, world"`
3. Run the script `./test.ps1`

Note: If you can't execute, run the following command to give execution policy:
```powershell
Set-ExecutionPolicy RemoteSigned
```
To display execution policy list:
```powershell
Get ExecutionPolicy -List
```

# General
* `powershell` - Move from cmd to powershell
* `cls` - Clear terminal

# Logging
* `Write-Host "Hello, World"`

# Files
* `Get-ChildItem` - List files
* `Get-Content <filename>` - Display file content
* `Add-Content <filename> "<content>"` - Append content to the file
* `Set-Content <filename> "<content>"` - Set file content
* `New-Item <file-name>` - Create file
* `Remove-Item <file-name>` - Remove file
* `New-Item <dir-name> -ItemType Directory` - Create directory
* `Set-Location <path>` - Set current location
