:: This Extracts all the files in the folder with a .PAK extension and extracts .shp files
:: loops for 200 times since this is the max I have found for legs inside a PAK file- slow tho, so you can modify maxIterations
@echo off
setlocal EnableDelayedExpansion

set "baseString=_"
set "basePad3=_000"
set "basePad2=_00"
set "basePad1=_0"
set "fileType=_Mek"
set "maxIterations=200"

for %%F in (*.PAK) do (
    set "oldName=%%F"
    set "folderName=!oldName:~0,-4!"
    set "fileName=!folderName!\!folderName!"

    mkdir !folderName!

    echo Reading %%F, this may take a few minutes

    for /l %%i in (0,1,%maxIterations%) do (	
        if %%i LEQ 9 (
            set "finalString=!fileName!%basePad3%%%i%fileType%"
        ) else if %%i LEQ 99 (
            set "finalString=!fileName!%basePad2%%%i%fileType%"
        ) else if %%i LEQ 999 (
            set "finalString=!fileName!%basePad1%%%i%fileType%"
        ) else set "finalString=!fileName!%baseString%%%i%fileType%"
  
	start "" /wait "pakextract.exe" %%F %%i !finalString!
    )
)


:: we need to make 1st layer extractors for every sprite pak (from files in data/SPRITES)
:: then we need to make 2nd layer extractors for every unit pak (indexed 0 upwards from sprite pak)
:: then we need to determine if the extracted files need bit manipulation for SHP viewing
:: then we also need some sort of bit mapping/palette manipulation for color correction