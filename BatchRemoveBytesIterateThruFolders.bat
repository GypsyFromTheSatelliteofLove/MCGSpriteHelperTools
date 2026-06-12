@echo off
::set "target_dir=C:\path\to\your\folder"
set "bytes_to_skip=6"

::cd /d "%target_dir%"
echo Processing, this may take up to a few minutes...

for /d %%i in (*) do (
    echo %%i
    set "fileSize=%%~zA"
    if fileSize GTR 100 (
        for %%F in (%%i\*_Mek) do (
        powershell -Command "$b = [System.IO.File]::ReadAllBytes('%%F'); if ($b.Length -gt %bytes_to_skip%) {[System.IO.File]::WriteAllBytes('%%F.shp', $b[%bytes_to_skip%..($b.Length-1)]) }"
        )
    )
)
