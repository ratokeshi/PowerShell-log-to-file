# Verify AppData\Powershell-logs exists if not create it
$pslogpath = "$env:appdata\PowerShell-Logs"
if (!(test-path -path $pslogpath)) {new-item -path $pslogpath -itemtype directory}

# Start logging into this directory with computername and date time stamp in filename
Start-Transcript -Path "$env:appdata\PowerShell-Logs\$Env:computername-$(((get-date).ToUniversalTime()).ToString("yyyyMMddThhmmssZ")).log" -NoClobber
