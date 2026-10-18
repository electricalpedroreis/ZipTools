Windows PC

Righ-click option to both extract zip and delete it.
It will extract to a folder with same zip name in the same location, and if all goes well, removes the zip file.

If anything goes wrong, you can check the logs here:
%TEMP%\ExtractZipAndDelete.log


# To install:
Run InstallZipExtractAndDelete.bat

# To uninstall:
Run UninstallExtractZipAndDelete.bat

[Or manually do:
Open Registry Editor (regedit), navigate to:
HKEY_CLASSES_ROOT\SystemFileAssociations\.zip\shell\Extract To Folder And Delete
Right-click Extract To Folder And Delete > Delete.

You can also delete the ZipTools folder if you no longer need the script:
C:\Users\%USERNAME%\Documents\ZipTools]
