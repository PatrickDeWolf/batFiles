$ShortcutName = "GRIDZZZZZZ"  
$ShortcutTarget = "https://gridz.be"  
$Shell = New-Object -ComObject ("WScript.Shell")
$ShortcutPath = $env:USERPROFILE + "\Desktop\" + $ShortcutName + ".url"
$Favorite = $Shell.CreateShortcut($ShortcutPath)

$Favorite.TargetPath = $ShortcutTarget
$Favorite.IconLocation = "C:\Program Files\Internet Explorer\iexplore.exe, 0"
$Favorite.Save()
Write-Host "Shortcut created: $ShortcutPath"
