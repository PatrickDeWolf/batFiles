<#
This script changes the desktop wallpaper. 
It downloads an image from a URL, saves it to a specified directory, 
and sets it as the desktop wallpaper using the SystemParametersInfo API.
#>

# Define the URL of the image and the path where it will be saved
$url = "https://campustoverfluit.be/so/gal/6KantoorFotoArt/colorbild.jpg"



$DesktopImageValue = "C:\mdm\wallpaper\wallpaper.jpg"
$directory = "C:\mdm\wallpaper"

# Create the directory if it doesn't exist
If (-not (Test-Path -Path $directory)) {
    New-Item -Path $directory -ItemType directory
}

# Download the image from the URL
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $DesktopImageValue)

# Ensure the image was downloaded successfully
If (-not (Test-Path -Path $DesktopImageValue)) {
    Write-Host "Failed to download image."
    exit
}

# Set the wallpaper using SystemParametersInfo API
function Set-Wallpaper {
    param([string]$imagePath)
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateINI = 0x01
    $SendWinIniChange = 0x02

    # Call the SystemParametersInfo function to set the wallpaper
    Add-Type @"
        using System;
        using System.Runtime.InteropServices;
        public class Wallpaper {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@

    # Set the wallpaper
    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $imagePath, $UpdateINI -bor $SendWinIniChange)
}

# Call the function to set the wallpaper
Set-Wallpaper -imagePath $DesktopImageValue

Write-Host "Desktop wallpaper has been set from $url"
