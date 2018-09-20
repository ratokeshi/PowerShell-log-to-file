Function Main {
    Log -File "D:\Apps\Logs\$Env:computername.log"

    $tcp = (get-childitem c:\windows\system32\drivers\tcpip.sys).Versioninfo.ProductVersionRaw
    $dfs = (get-childitem C:\Windows\Microsoft.NET\Framework\v2.0.50727\dfsvc.exe).Versioninfo.ProductVersionRaw

    Log "TCPIP.sys Version on $computer is:" $tcp
    Log "DFSVC.exe Version on $computer is:" $dfs

    If (get-wmiobject win32_share | where-object {$_.Name -eq "REMINST"}) {Log "The REMINST share exists on $computer"}
    Else {Log "The REMINST share DOES NOT exist on $computer - Please create as per standards"}

    "KB2450944", "KB3150513", "KB3176935" | ForEach {
        $hotfix = Get-HotFix -Id $_ -ErrorAction SilentlyContinue
        If ($hotfix) {Log -Color Green Hotfix $_ is installed}
        Else {Log -Color Red Hotfix $_ " is NOT installed - Please ensure you install this hotfix"}
    }
}
