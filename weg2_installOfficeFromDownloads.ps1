

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}
New-Item -Path "c:\" -Name "TEMP" -ItemType "directory" -Force 2>> c:\error2.txt
Expand-Archive C:\Users\$env:Username\Downloads\ff\Office2019.zip -DestinationPath c:\TEMP -Force 2>> c:\error2.txt
Start-Process -WindowStyle Hidden c:\TEMP\Office2019\Setup.exe "/configure c:\TEMP\Office2019\configuration.xml" | Start-Sleep -s 360 2>> C:\error2.txt
Start-Sleep -s 360
Remove-Item "c:\TEMP\Office2019" -Recurse -Force
Start-Sleep -s 60
cd "C:\Program Files\Microsoft Office\Office16" 2>> C:\error2.txt
Start-Sleep -s 60
cscript ospp.vbs /act 2>> C:\error2.txt
exit-Pssession
