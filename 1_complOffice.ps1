#kopieer de office naar de downloads\ff folder

#New-Item -Path "C:\Users\$env:Username\Downloads\" -Name "tep" -ItemType "directory"

#${PSScriptRoot} 2019
Copy-Item -Path ".\usb\Office2019" -Destination "C:\Users\$env:Username\Downloads\tep\" -recurse -Force 2>> .\errorOfficeCopy.txt
echo "Office gekopieerd naar downloads nog niet geinstalleerd"

#kopieer seb naar downloads
Copy-Item -Path ".\usb\SEB_3.3.2.413_SetupBundle.exe" -Destination "C:\Users\$env:Username\Downloads\tep\" -recurse -Force 2>> .\errorSebCopy.txt
echo "SEB gekopieerd naar downloads nog niet geinstalleerd"


#admin rechten
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

#policy rechten
Set-ExecutionPolicy Bypass
echo "Bypass gezet";

#installeer seb
Start-Process -FilePath "C:\Users\$env:Username\Downloads\tep\SEB_3.3.2.413_SetupBundle.exe"
echo"install SEB"


#installeer office

New-Item -Path "c:\" -Name "TEMP" -ItemType "directory" -Force 2>> .\errorOfficeOnstall.txt
Expand-Archive C:\Users\$env:Username\Downloads\tep\Office2019.zip -DestinationPath c:\TEMP -Force 2>> .\errorUnzipOffice.txt
Start-Process -WindowStyle Hidden c:\TEMP\Office2019\Setup.exe "/configure c:\TEMP\Office2019\configuration.xml" | Start-Sleep -s 360 2>> .\error2.txt
Start-Sleep -s 360<"Remove-Item "c:\TEMP\Office2019" -Recurse -Force
Start-Sleep -s 60
cd "C:\Program Files\Microsoft Office\Office16" 2>> .\error2.txt
Start-Sleep -s 60
cscript ospp.vbs /act 2>> .\error2.txt
echo"install Office"
exit-Pssession





