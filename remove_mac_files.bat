%~d1
title Mac files in USB Remover
@echo -----------------------------
@echo Scanning USB for MAC leftover files and folders...
dir /b /a:H | findstr /r "\<\.[^\.]*" > mac.temp
dir /b /a:HD | findstr /r "\<\.[^\.]*" > macdir.temp
@echo -----------------------------
@echo Deleting found files
@for /f "tokens=*" %%a in (mac.temp) do @call :DelFile "%%a"
@for /f "tokens=*" %%a in (macdir.temp) do @call :DelFolder "%%a"
@echo -----------------------------
@echo Clean up!
del mac.temp
del macdir.temp
@echo -----------------------------
@pause
@exit /b

:DelFile
@attrib -r -a -s -h +i /s /d %1
del /s /q /f %1
@exit /b

:DelFolder
@attrib -r -a -s -h +i /s /d %1
@rmdir /s /q %1
@echo Deleted folder - %1
@exit /b