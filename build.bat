@echo off
echo [*] Setting up environment...
call setup_x64.bat

echo [*] Creating output directory...
mkdir bin\x64\Release 2>nul

echo [*] Compiling resources...
rc.exe /nologo /fo drvloader.res drvloader.rc
if %ERRORLEVEL% neq 0 (
    echo [!] Resource compilation failed.
    exit /b %ERRORLEVEL%
)

echo [*] Compiling C++ code...
cl.exe /nologo /utf-8 /GS- /Gy /Gw /Os /Brepro /Oy /GF /EHsc /MD /std:c++latest /DNDEBUG /D_CONSOLE /DWIN32_LEAN_AND_MEAN /DNOMINMAX /DUNICODE /D_UNICODE DrvLoader.cpp ConfigManager.cpp ResourceInstaller.cpp DrvCore.cpp SymbolDownloader.cpp UserInterface.cpp drvloader.res /link /OPT:REF /OPT:ICF=10 /MERGE:.rdata=.text /MERGE:.pdata=.text /NXCOMPAT /DYNAMICBASE /INCREMENTAL:NO /Brepro /SUBSYSTEM:CONSOLE /MACHINE:X64 kernel32.lib user32.lib psapi.lib advapi32.lib /OUT:bin\x64\Release\drvloader.exe
if %ERRORLEVEL% neq 0 (
    echo [!] C++ compilation failed.
    exit /b %ERRORLEVEL%
)

echo [*] Running post-build event...
powershell -Command "& {$f='bin\x64\Release\drvloader.exe'; (Get-Item $f).CreationTime='2026-01-01 00:00:00'; (Get-Item $f).LastWriteTime='2026-01-01 00:00:00'}"

echo [*] Build completed successfully.
