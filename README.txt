Hey all! Here are some tools and instructions plus info on how to extract sprites from your MCG files

Heres how this works so far:
MechCommander Gold has its sprite files in DATA\SPRITES. The files are compressed in PAKs. 
Each PAK file contains another PAK file. Ex. TORSOS90 contains the higher resolution torso sprites for mechs. 
Inside TORSOS90.PAK are the PAK files for individual mechs (23 in total). For every individual mech PAK file, 
you can extract a set of .shp files (shape files, similar to Panzer General 2s format). These can be viewed with IconTools

You will need:
1. IconTools from LuizGuzman - SHP file viewer and SHP to png/bmp converter
2. PakExtract.exe from cmusta - https://github.com/oseparovic/MCGExtracted probably best place to get

To start off, the tools i made are not very good (so be kind and patient hehe). They are basically simple batch files to automate
all you need to do to extract

INSTRUCTIONS:
1. COPY you DATA\SPRITES folder from MCG ISO or game install location to a new location; safety first
2. Get IconTools and PakExtract
3. copy PakExtract.exe to the folder of the files you want to extract
4. Extract contents of this zip file and place in the folder of the files you want to extract
5. Use BatchExtractAllMechPAKsToPAKs.bat to extract all mech sprites PAK files; will create its own file structure 
	- 4 folders are expected: LARMS90, LEGS90, RARMS90, TORSOS90
	- Copy PakExtract.exe, BatchExtractAllMechLEGS_PAKsToSHPs.bat, and BatchRemoveBytesIteratesThruFolders.bat to LEGS90
	- Use BatchExtractAllMechLEGS_PAKsToSHPs.bat, can take some time (up to 20 min or more)
	- Use BatchRemoveBytesIteratesThruFolders.bat - this creates a copy of the files with 6 bytes removed from header
		a. these 6 bytes contain info about how the sprite is meant to be used but will interfere with IconTools
		b. i made the batch file make copies so that you can retain the info if so needed
	- For arms and torso, copy PakExtract.exe and BatchRemoveBytesIteratesThruFolders.bat to each of the folders	
	- for arms and torso, copy BatchExtractAllMechPartPAKsToSHPs.bat
		* arms and torsos have way more files so i made a different batch file to process them
	- just run BatchExtractAllMechPartPAKsToSHPs.bat then BatchRemoveBytesIteratesThruFolders.bat in each of the folders 
		* this will take time... arms and torso contain up to 700 .shp files each!
	- you can now use IconTools to view these
	- use the Palette Tools -> Load Palette (PSP ascii) option to load PSP_Custom_MC.PAL to get a better color palette
		* the color palette is in a text format so it is simple to make your own!
6. Use BatchExtractSHAPES_PAKToPAKs.bat to extract first part of vehicles and objects sprites
	* i realized late that there are a lot of empty PAKs in this one... check the PAK file size before extracting them all to shp!
7. Use BatchExtractSHAPES90_PAKtoPAKs.bat to extract rest of object sprites
	- all of these extractors will create their own file structure 
	- for both SHAPES and SHAPES90 folders, we will not need BatchRemoveBytesIteratesThruFolders
		* only mechs needed the extra 6 bytes
	- copy PakExtract.exe and BatchExtractPAKToSHP.bat to the SHAPES and SHAPES90 folders
	- run the batch file and youre pretty much done... tho this one takes a whole while as SHAPES has 1000+ entries

IF a file is skipped, you can still use PakExtract.exe manually; in cmd.exe, go to the folder where PakExtract.exe is then
run it with arguments like so:
	- c:\YourInstallPath\FolderYoureExtracting\PakExtract.exe <FileName> <index; 0 onward> <desired filename for extracted>

Thats it i think for now!

Theres a bunch more info on this at https://www.moddb.com/members/mcrizzen/addons/mcg-sprites
	- IronArthur has gone the farthest with this and has decoded most of the bytes of the .SHP files
	- included are info on pixel coordinates for each part so you can piece it together thru code :)
