Copy-Item -Path ".\usb\Office201" -Destination "C:\Users\$env:Username\Downloads\ff" -recurse -Force
cd C:\Users\$env:Username\Downloads\ff\
./provisioningoffice.ps1


