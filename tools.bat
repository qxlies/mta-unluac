@echo off
:menu
color D7
echo ==============================================
echo Choose action:
echo [1] Unprotect luac
echo [2] Decompile luac
echo [3] * Optional: Fix cyrillic
echo [4] Exit
echo ==============================================
set /p choice=Enter action number (1-4): 

cls
if "%choice%"=="1" (
    echo Executing unprotect.py...
    python unprotect.py
    goto end
) else if "%choice%"=="2" (
    echo Executing decompile.py...
    python decompile.py
    goto end
) else if "%choice%"=="3" (
    echo Executing rusfix.py...
    python cyrillicfix.py
    goto end
) else if "%choice%"=="4" (
    exit
) else (
    goto menu
)

:end
timeout /t 1 >nul
cls
echo [ Operation is completed ]
goto menu