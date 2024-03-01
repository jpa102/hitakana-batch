@echo off

for %%# in (/errorlevel /el) do (
	if "%~1" equ "%%~#" (
		goto errorlevelvalues
	)
)

title hitakana - Command line (compile from source)

echo Please wait...
ping localhost -n 6 > nul

::
::	failsafe condition code block

if exist $tmp (
	echo.
	echo   ERROR! $tmp directory exists
	echo   The compiler cannot proceed.
	echo.
	echo Please check the contents of the $tmp directory.
	echo.
	echo.
	pause
	exit /b 1
)

::

echo.
echo.

cls
echo Compiling all source files...
ping localhost -n 3 > nul

::============================================
::	compile all files

cd basicwords
echo.
echo 	[basicwords.bat]
echo.
copy /b header.txt + presencevariable.txt + wordvariables.txt basicwords.bat

cd ..

cd installer
echo.
echo 	[install.bat]
echo.
copy /b header.txt + askdirectory.txt + makedirectory.txt + installprocess.txt + endinstaller.txt install.bat

cd ..

cd mainexe
echo.
echo 	[main.cmd]
echo.
copy /b header.txt + debugcheck.txt + inifile.txt + simplemessagevar.txt + displaymessage.txt + resizewindow.txt + fastloading.txt + admincheck.txt + varsandexec.txt main.cmd

cd ..

cd printhelpscript
echo.
echo 	[PrintHelp.bat]
echo.
copy PrintHelp.txt PrintHelp.bat

cd ..

cd uninstaller
echo.
echo 	[uninstall.cmd]
echo.
copy /b header.txt + variables.txt + askuser.txt + mainexecute.txt uninstall.cmd

cd ..

cd utilities

cd clearscreen
echo.
echo 	[clear.bat]
echo.
copy /b header.txt + simplemessagecheck.txt + minimaltext.txt + normaltext.txt + endlabel.txt clear.bat

cd ..

cd definevariables
echo.
echo 	[define.bat]
echo.
copy /b header.txt + debugcheck.txt + variables.txt define.bat

cd ..

cd displayindex
echo.
echo 	[indexlister.bat]
echo.
copy /b header.txt + debugcheck.txt + pingwait.txt + miscellchars.txt + katakanaindex.txt + separator.txt + hiraganaindex.txt indexlister.bat

cd ..

cd displaymessage
echo.
echo 	[displaymessage.bat]
echo.
copy /b header.txt + debugcheck.txt + simplemessagecheck.txt + alternatepage.txt + normalpage.txt + endlabel.txt displaymessage.bat

cd ..

cd mainlauncher
echo.
echo 	[_launcher.cmd]
echo.
copy /b header.txt + debugcheck.txt + loaddatabase.txt + displaystatusver.txt + callscripts.txt _launcher.cmd

cd ..
cd ..

echo.
echo.
echo.



::============================================
::	move all files to src folder

md $tmp
cd $tmp

md addons && md data && md utils
cd ..

cd basicwords

move basicwords.bat ..
cd ..
move basicwords.bat $tmp\addons

cd database

if not exist database.pdb (
	echo.
	echo [ERROR] database.pdb is not present, maybe you've accidentally deleted it?
	echo         if so, then you need to redownload the complete source again.
	echo.
	echo.
	pause
	cd ..
	cd installer
	del install.bat
	cd ..
	cd mainexe
	del main.cmd
	cd ..
	cd printhelpscript
	del PrintHelp.bat
	cd ..
	cd uninstaller
	del uninstall.cmd
	cd ..
	cd utilities
	cd clearscreen
	del clear.bat
	cd ..
	cd definevariables
	del define.bat
	cd ..
	cd displayindex
	del indexlister.bat
	cd ..
	cd displaymessage
	del displaymessage.bat
	cd ..
	cd mainlauncher
	del _launcher.cmd
	cd ..
	cd ..
	rd /s /q $tmp
	exit /b 69
)

copy database.pdb .. && copy raw_database.txt ..
cd ..
move database.pdb $tmp\data && move raw_database.txt $tmp\data

cd installer
move install.bat ..
cd ..
move install.bat $tmp

cd mainexe
move main.cmd .. && copy main.ini ..
cd ..
move main.cmd $tmp && move main.ini $tmp

cd printhelpscript
move PrintHelp.bat ..
cd ..
move PrintHelp.bat $tmp

cd text
copy *.txt ..
cd ..
ren about.txt about.bat && move about.bat $tmp && move build.txt $tmp\addons && move doc.txt $tmp && move license.txt $tmp

cd uninstaller
move uninstall.cmd ..
cd ..
move uninstall.cmd $tmp

cd utilities

cd clearscreen
move clear.bat ..
cd ..

cd definevariables
move define.bat ..
cd ..

cd displayindex
move indexlister.bat ..
cd ..

cd displaymessage
move displaymessage.bat ..
cd ..

cd mainlauncher
move _launcher.cmd ..
cd ..

move *.bat .. && move *.cmd ..
cd ..
move *.bat $tmp\utils && move _launcher.cmd $tmp\utils

cd buildexefiles
copy build.txt build.cmd
copy "[NOTE] hitakanabatch_setup.sed.txt" ..
move build.cmd ..
copy build.ini ..
copy hitakanabatch_setup.txt ..
cd ..
move "[NOTE] hitakanabatch_setup.sed.txt" $tmp
move build.cmd $tmp
move build.ini $tmp
move hitakanabatch_setup.txt $tmp

move $tmp ..
cd ..
cd $tmp
move addons ..
move data ..
move utils ..
move *.* ..
cd ..
rd /s /q $tmp

echo.
echo.
echo Done!
echo Check out the src folder now
ping localhost -n 10 > nul
echo.
echo.
pause
exit /b 0

:errorlevelvalues
echo.
echo   %~nx0 - error levels
echo.
echo 	 0 - compiled successfully
echo 	 1 - compiled unsuccessfully
echo 	69 - database.pdb missing from compilation
echo.
echo.
pause
exit /b 0
