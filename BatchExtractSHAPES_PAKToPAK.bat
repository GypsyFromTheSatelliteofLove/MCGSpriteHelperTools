:: This Extracts the first file in the folder with a .PAK extension- creates more PAK files
:: loops for 1280 times since this is close to the max I have found inside a PAK file- slow tho, so you can modify maxIterations
@echo off
setlocal EnableDelayedExpansion

set "baseString=_"
set "basePad3=_000"
set "basePad2=_00"
set "basePad1=_0"
set "fileType=.PAK"
set "maxIterations=1280"

set "folderName=SHAPES"
set "fileName=!folderName!\!folderName!"

echo Reading SHAPES, this may take a few minutes

mkdir "SHAPES"

for /l %%i in (0,1,%maxIterations%) do (	
    if %%i LEQ 9 (
        set "finalString=!fileName!%basePad3%%%i%fileType%"
    ) else if %%i LEQ 99 (
        set "finalString=!fileName!%basePad2%%%i%fileType%"
    ) else if %%i LEQ 999 (
        set "finalString=!fileName!%basePad1%%%i%fileType%"
    ) else set "finalString=!fileName!%baseString%%%i%fileType%"
  
    start "" /wait "pakextract.exe" "SHAPES.PAK" %%i !finalString!  
)

:: we need to make 1st layer extractors for every sprite pak (from files in data/SPRITES)
:: then we need to make 2nd layer extractors for every unit pak (indexed 0 upwards from sprite pak)
:: then we need to determine if the extracted files need bit manipulation for SHP viewing
:: then we also need some sort of bit mapping/palette manipulation for color correction
