@echo off
setlocal enabledelayedexpansion
cd /d %~dp0

set phase="init"

:init
    call:notif "Auto-Cleaner" "Initiating system scan..."

:dateset
    net stop wuauserv
    net stop cryptSvc
    net stop bits
    net stop msiserver
    net stop TrustedInstaller
    Ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
    Ren C:\Windows\System32\catroot2 Catroot2.old
    set phase="dateset"
    set today=%date:~4%
    set day=%today:~3,-5%
    set month=%today:~0,-8%
    set year=%today:~6%
    set formatted_date=%year%-%month%-%day%
    set formatted_time=%time:~0, -3%
    set formatted_time=%formatted_time: =%
    set formatted_time=%formatted_time::=_%
    set filename=%formatted_date%~%formatted_time%-cbs.log
    goto:sfc_scannow_precall

:sfc_scannow_precall
    set phase="sfc_scannow"
    break > "logs\%filename%"
    ::findstr /c:"[SR]"

    call:notif "Auto-Cleaner" "Starting system file checker. This will run in the background."

:sfc_scannow_postcall
    START /WAIT /b sfc /scannow
    type "%windir%\logs\cbs\cbs.log" > "%cd%\logs\%filename%"
    break > %windir%\logs\cbs\cbs.log
    copy NUL currentcbsdetails.log
    copy NUL currentsfcdetails.log
    findstr %formatted_date% logs\%filename% %windir%\logs\cbs\cbs.log > currentcbsdetails.log
    findstr /c:"[SR]" %windir%\logs\cbs\cbs.log > currentsfcdetails.log

    >nul find "Cannot repair memberfile" currentsfcdetails.log && (goto:dism_precall)
    >nul find "Repaired file" currentsfcdetails.log && (goto:dism_precall)
    >nul find "Repairing corrupted file" currentsfcdetails.log && (goto:dism_precall)

    goto:completed_precall

:dism_precall
    set phase="dism"
    call:notif "Auto-Cleaner" "Corruption detected - running dism and checking with sfc."

:dism_postcall
    START /WAIT /b dism -online -cleanup-image -restorehealth
    goto:sfc_scannow_precall

:completed_precall
    set phase="completed"
    net start wuauserv
    net start cryptSvc
    net start bits
    net start msiserver
    net start TrustedInstaller
    call:notif "Auto-Cleaner" "No corruption was detected on your system. System scanning completed."

:notif
    set type=Information
    set "$Titre=%~1"
    Set "$Message=%~2"

    ::You can replace the $Icon value by Information, error, warning and none
    Set "$Icon=Information"
    for /f "delims=" %%a in ('powershell -c "[reflection.assembly]::loadwithpartialname('System.Windows.Forms');[reflection.assembly]::loadwithpartialname('System.Drawing');$notify = new-object system.windows.forms.notifyicon;$notify.icon = [System.Drawing.SystemIcons]::%$Icon%;$notify.visible = $true;$notify.showballoontip(10,'%$Titre%','%$Message%',[system.windows.forms.tooltipicon]::None)"') do (set $=)
    if %phase% EQU "dism" (goto:dism_postcall)
    if %phase% EQU "completed" (EXIT)
    if %phase% EQU "sfc_scannow" (goto:sfc_scannow_postcall)