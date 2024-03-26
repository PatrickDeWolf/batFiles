$file = 'C:\sys\wolf\AAN.bat'
if (-not(Test-Path -Path $file -PathType Leaf)) {

Write-Host "Program Files (x86)"
$base = 'C:\Program Files (x86)\Microsoft Office\root\Office16'
}else{


Write-Host "Program Files"
$base = 'C:\sys\wolf'


}

$bblad= ([Environment]::GetFolderPath("Desktop"))
#echo $base
#echo $bblad




$SourceFilePath3 = "$base\AAN.bat"
$ShortcutPath3 = "$bblad\OUTLOOK.lnk"
$WScriptObj3 = New-Object -ComObject ("WScript.Shell")
$shortcut3 = $WscriptObj3.CreateShortcut($ShortcutPath3)
$shortcut3.TargetPath = $SourceFilePath3
$shortcut3.Save()



