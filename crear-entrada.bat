@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo.
echo ═══════════════════════════════════════
echo   Nueva entrada para el Cuaderno
echo ═══════════════════════════════════════
echo.

set /p TITULO="Título de la entrada: "
set /p TAGS="Tags (separados por coma): "
set /p SUMMARY="Resumen / summary: "

REM ── generar slug ──
set "SLUG=%TITULO%"
set "SLUG=!SLUG: =-%"
set "SLUG=!SLUG:á=a!"
set "SLUG=!SLUG:é=e!"
set "SLUG=!SLUG:í=i!"
set "SLUG=!SLUG:ó=o!"
set "SLUG=!SLUG:ú=u!"
set "SLUG=!SLUG:ñ=n!"
set "SLUG=!SLUG:Á=A!"
set "SLUG=!SLUG:É=E!"
set "SLUG=!SLUG:Í=I!"
set "SLUG=!SLUG:Ó=O!"
set "SLUG=!SLUG:Ú=U!"
set "SLUG=!SLUG:Ñ=N!"
set "SLUG=!SLUG:?=!"
set "SLUG=!SLUG:¿=!"
set "SLUG=!SLUG:¡=!"
set "SLUG=!SLUG:,=!"
set "SLUG=!SLUG:;=!"
set "SLUG=!SLUG::=!"
set "SLUG=!SLUG:.=!"
set "SLUG=!SLUG:^=!"
set "SLUG=!SLUG:^^=!"
set "SLUG=!SLUG:!=!"
set "SLUG=!SLUG:)=!"
set "SLUG=!SLUG:(=!"

REM ── fecha ──
for /f "tokens=1-3 delims=/" %%a in ('echo %date%') do set FECHA=%%c-%%b-%%a
if "%FECHA%"=="" for /f %%a in ('powershell -Command "Get-Date -Format yyyy-MM-dd"') do set FECHA=%%a

set "DIR=src\content\cuaderno"

REM ── crear ES ──
set "FILE=%DIR%\%SLUG%.md"
(
echo ---
echo title: "%TITULO%"
echo date: %FECHA%
echo slug: %SLUG%
echo lang: es
echo tags: [%TAGS%]
echo summary: "%SUMMARY%"
echo ---
echo.
echo .
) > "%FILE%"
echo   Creado: %FILE%

REM ── crear EN ──
set "FILE_EN=%DIR%\%SLUG%.en.md"
(
echo ---
echo title: "TITLE HERE"
echo date: %FECHA%
echo translation_key: %SLUG%
echo lang: en
echo tags: [%TAGS%]
echo summary: "SUMMARY HERE"
echo ---
echo.
echo .
) > "%FILE_EN%"
echo   Creado: %FILE_EN%

echo.
echo ═══════════════════════════════════════
echo   Listo. Edita los archivos y guarda.
echo   Astro recarga solo si esta corriendo.
echo ═══════════════════════════════════════
echo.

endlocal
pause
