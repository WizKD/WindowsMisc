@echo off
rem Program made by _Wiz, version .1
rem Intent of this program is to take music from a USB or other device and import the tunes into itunes, automatically
rem Please provide the program with the directory in which the music files are stored, i.e. D:\MusicFiles. The program will then
rem copy those files to the users desktop, open itunes.exe, and have itunes copy the music itself. Once this has completed
rem the Iterator.bat will clean the desktop of the temporary music files.
rem You will want to be sure that itunes will automatically copy the new files added by going to: edit -> preferences -> advanced -> copy files ...
rem 
rem Last updated 10/3/2012 - Comments

echo.
echo == Running folder iterator by _Wiz v0.1 ==
echo.
echo == Using folder name: %1
echo At this time the program will start making temporary changes to your computer.
echo If you do not wish for the program to run, press ctrl+c at this time & echo. & echo. & pause
echo == Creating temp directory
mkdir "%userprofile%\Desktop\musictemp\"
echo == temp created
echo.
echo.
echo == Begin extraction to temp directory
For /F "Delims=" %%! in ('Dir "%1\" /b /s /a-d 2^>nul') do (
   @echo.%%! &(
   @xcopy "%%!" "%userprofile%\Desktop\musictemp\" /i /y /f /c) 
)
echo == Extraction completed
echo.
echo.
start itunes.exe
for %%c in (%userprofile%\Desktop\musictemp\*.*) do (
echo "Opening %%c" & %%c
)
echo.
echo.
echo Pausing to complete program -- needed because iTunes is ghetto & pause
rmdir /S /Q "%userprofile%\Desktop\musictemp\"
echo == Iterator has completed. ==
echo == Exiting ==
