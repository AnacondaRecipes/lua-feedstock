@echo off
setlocal

set CHANGE=deactivate
mkdir "%PREFIX%\etc\conda\%CHANGE%.d"
copy "%RECIPE_DIR%\%CHANGE%.bat" "%PREFIX%\etc\conda\%CHANGE%.d\%PKG_NAME%_%CHANGE%.bat"

set CHANGE=activate
mkdir "%PREFIX%\etc\conda\%CHANGE%.d"
copy "%RECIPE_DIR%\%CHANGE%.bat" "%PREFIX%\etc\conda\%CHANGE%.d\%PKG_NAME%_%CHANGE%.bat"

set "MYCFLAGS=-DLUA_USE_WINDOWS -DLUA_BUILD_AS_DLL -I%PREFIX%\include"
set "MYLDFLAGS=-L%PREFIX%\lib"

make PLAT=mingw INSTALL_TOP=%PREFIX% MYCFLAGS="%MYCFLAGS%" MYLDFLAGS="%MYLDFLAGS%"
if errorlevel 1 exit /b 1

make install INSTALL_TOP=%PREFIX%
if errorlevel 1 exit /b 1

endlocal
