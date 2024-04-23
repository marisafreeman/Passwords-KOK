$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "C:\Passwords-KOK"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

$action = { 
    Start-Sleep -Seconds 2
    git -C "C:\Passwords-KOK" add -A
    git -C "C:\Passwords-KOK" commit -m "Automatic commit from PowerShell"
    git -C "C:\Passwords-KOK" push
}

Register-ObjectEvent $watcher "Created" -Action $action
Register-ObjectEvent $watcher "Changed" -Action $action
Register-ObjectEvent $watcher "Deleted" -Action $action
Register-ObjectEvent $watcher "Renamed" -Action $action

while ($true) { Start-Sleep -Seconds 10 }
