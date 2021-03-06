@echo off
echo %~dp0
set dir=%~dp0

echo This install script works on Windows 7.
echo Window 8 and Windows 10 are not fully tested.

REM delete \ at end of dir
if "%dir:~-1%\" == "\\" (
    set dir=%dir:~0,-1%
)

setx CUSTOMVIMRUNTIME "%dir%" -m
echo $CUSTOMVIMRUNTIME setted.
setx MYVIMRC "%dir%\vimrc.vim" -m
echo $MYVIMRC setted.
set vimbackup="%HOME%\.vimbackup"
setx VIMBACKUP "%vimbackup%" -m
echo $VIMBACKUP setted.

if exist "%vimbackup%" (
    echo %vimbackup% already exists.
) else (
    md "%vimbackup%"
)

set vimrc="%USERPROFILE%\_vimrc"
if exist "%vimrc%" (
    echo %vimrc% already exist. Backup it.
    copy "%vimrc%" "%vimrc%.bak"
)
echo source $MYVIMRC > %vimrc%

vim +PluginInstall +qall
pause
