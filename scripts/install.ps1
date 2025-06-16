<#
.SYNOPSIS
    Αυτό το script εγκαθιστά Python 3.12 (x64) αν λείπει,
    εγκαθιστά/ενημερώνει pipx και στη συνέχεια
    εγκαθιστά την εφαρμογή medtracker-win.
#>

$ProgressPreference = 'SilentlyContinue'

function Ensure-Python {
    if (-not (Get-Command "python" -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Python 3.12..."
        Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe" -OutFile "$env:TEMP\pysetup.exe"
        Start-Process "$env:TEMP\pysetup.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
    }
}

function Ensure-Pipx {
    python -m pip install --upgrade pip
    python -m pip install --upgrade pipx
    python -m pipx ensurepath
}

Ensure-Python
Ensure-Pipx
pipx install --force git+https://github.com/ChrisParty/medtracker-win
Write-Host "`n✅ Ολοκληρώθηκε! Τρέξτε:  medtracker"
