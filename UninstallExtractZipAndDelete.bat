@echo off
setlocal

set "ZIPTOOLS=%USERPROFILE%\Documents\ZipTools"

reg delete "HKEY_CURRENT_USER\Software\Classes\SystemFileAssociations\.zip\shell\ExtractToFolderAndDelete" /f

if exist "%ZIPTOOLS%" (
    rmdir /s /q "%ZIPTOOLS%"
    echo Removed: %ZIPTOOLS%
) else (
    echo Folder not found: %ZIPTOOLS%
)

echo.
echo Uninstalled successfully.
echo.
pause