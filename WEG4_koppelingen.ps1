$SourceFilePath = "C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE"
$ShortcUUUUutPath = "C:\Users\$env:Username\Desktop\WORD.lnk"
$ShortcutPath = "C:\Users\$env:Username\OneDrive\Bureaublad\WORD.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()


$SourceFilePath2 = "C:\Program Files \Microsoft Office\root\Office16\EXCEL.EXE"
$ShortcUUUUutPath2 = "C:\Users\$env:Username\Desktop\EXCEL.lnk"
$ShortcutPath2 = "C:\Users\$env:Username\OneDrive\Bureaublad\EXCEL.lnk"
$WScriptObj2 = New-Object -ComObject ("WScript.Shell")
$shortcut2 = $WscriptObj2.CreateShortcut($ShortcutPath2)
$shortcut2.TargetPath = $SourceFilePath2
$shortcut2.Save()

$SourceFilePath3 = "C:\Program Files (x86)\Microsoft Office\root\Office16\POWERPNT.EXE"
$ShortcUUUUutPath3 = "C:\Users\$env:Username\Desktop\POWERPNT.lnk"
$ShortcutPath3 = "C:\Users\$env:Username\OneDrive\Bureaublad\POWERPNT.lnk"
$WScriptObj3 = New-Object -ComObject ("WScript.Shell")
$shortcut3 = $WscriptObj3.CreateShortcut($ShortcutPath3)
$shortcut3.TargetPath = $SourceFilePath3
$shortcut3.Save()

$SourceFilePath4 = "https://kamolenbeek.smartschool.be"
$ShortcUUUUutPath3 = "C:\Users\$env:Username\Desktop\POWERPNT.lnk"
$ShortcutPath4 = "C:\Users\$env:Username\OneDrive\Bureaublad\SMARTSCHOOL.url"
$WScriptObj4 = New-Object -ComObject ("WScript.Shell")
$shortcut4 = $WscriptObj4.CreateShortcut($ShortcutPath4)
$shortcut4.TargetPath = $SourceFilePath4
$shortcut4.Save()



