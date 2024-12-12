############################################################################
# Capturing a screenshot
#############################################################################
$OutPath = "$env:USERPROFILE\Documents\ScreenShot"
if (-not (Test-Path $OutPath)) {
    New-Item $OutPath -ItemType Directory -Force
}

$FileName = "$env:COMPUTERNAME - $(get-date -f yyyy-MM-dd_HHmmss).png"
$File = Join-Path $OutPath $FileName

Add-Type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing

# Gather Screen resolution information
$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$Width = $Screen.Width
$Height = $Screen.Height
$Left = $Screen.Left
$Top = $Screen.Top

# Create bitmap using the top-left and bottom-right bounds
$bitmap = New-Object System.Drawing.Bitmap $Width, $Height

# Create Graphics object
$graphic = [System.Drawing.Graphics]::FromImage($bitmap)

# Attempt to capture screen and save it
try {
    $graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)
    $bitmap.Save($File)
    Write-Output "Screenshot saved to: $File"
} catch {
    Write-Error "Failed to capture or save screenshot: $_"
}

# Cleanup
$graphic.Dispose()
$bitmap.Dispose()
#############################################################################
