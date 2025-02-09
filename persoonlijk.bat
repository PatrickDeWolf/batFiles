@echo off
title Beveiligde Map
setlocal enabledelayedexpansion

::set "usb_drive=%~d0"  REM Dit pakt de stationsletter waar het script draait
::set "folder=%usb_drive%\prive"  REM Beveiligde map op de USB-stick



set "script_dir=%~dp0"
set "folder=%script_dir%prive"  
if "%script_dir:~-1%"=="\" set "folder=%script_dir%prive"  REM Corrigeer extra backslash indien nodig


set "password=0002"  REM Wijzig hier het wachtwoord

:: Controleer of de map verborgen is
if exist "%folder%" (
    attrib "%folder%" | find "H" >nul
    if not errorlevel 1 (
        :: echo Map is momenteel verborgen.
        set /p "input=Wachtwoord invoeren om verborgen map te openen: "
        
        if "!input!"=="%password%" (
            echo Correct wachtwoord! Map wordt zichtbaar...
            attrib -s -h "%folder%" /s /d
            explorer "%folder%"
			exit
        ) else (
            echo Fout wachtwoord! Toegang geweigerd.
            exit
        )
    ) else (
       :: echo Map verbergen...
        attrib +s +h "%folder%" /s /d
        echo Map verborgen!
    )
) else (
    echo Map niet gevonden. Nieuwe beveiligde map wordt aangemaakt...
    mkdir "%folder%"
    attrib +s +h "%folder%" /s /d
    echo Map verborgen!
)

pause
