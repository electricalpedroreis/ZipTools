@echo off
setlocal

set "ZIPTOOLS=%USERPROFILE%\Documents\ZipTools"

if not exist "%ZIPTOOLS%" mkdir "%ZIPTOOLS%"
copy /y "ExtractZipAndDelete.ps1" "%ZIPTOOLS%\" >nul

(
    echo Windows Registry Editor Version 5.00
    echo.
    echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\.zip\shell\Extract To Folder And Delete]
    echo "FriendlyName"="Extract to same-named folder & delete ZIP"
    echo "Icon"="shell32.dll,-47"
    echo.
    echo [HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\.zip\shell\Extract To Folder And Delete\command]
    echo @="powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File %ZIPTOOLS%\ExtractZipAndDelete.ps1 %%1"
) > "%TEMP%\InstallExtractAndDelete.reg"

regedit /s "%TEMP%\InstallExtractAndDelete.reg"

echo.
echo Installed successfully!
echo Right-click any .zip file and select "Extract to same-named folder & delete ZIP".
echo.
pause