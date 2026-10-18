param([string]$zipPath)

$logPath = "$env:TEMP\ExtractZipAndDelete.log"
Add-Content -Path $logPath -Value "$(Get-Date) - Started: $zipPath"

try {
    if (-not (Test-Path -LiteralPath $zipPath)) {
        Add-Content -Path $logPath -Value "ERROR: File not found: $zipPath"
        exit 1
    }

    $dir   = [System.IO.Path]::GetDirectoryName($zipPath)
    $name  = [System.IO.Path]::GetFileNameWithoutExtension($zipPath)
    $outDir = [System.IO.Path]::Combine($dir, $name)

    Add-Content -Path $logPath -Value "Extracting to: $outDir"
    Expand-Archive -LiteralPath $zipPath -DestinationPath $outDir -Force

    Add-Content -Path $logPath -Value "Deleting zip: $zipPath"
    Remove-Item -LiteralPath $zipPath -Force

    Add-Content -Path $logPath -Value "Success"
}
catch {
    Add-Content -Path $logPath -Value "ERROR: $($_.Exception.Message)"
    # Zip is kept if anything fails
}
