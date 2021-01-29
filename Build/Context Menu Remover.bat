::https://github.com/brendan8c/REG-files-for-Windows
@echo off
setlocal EnableDelayedExpansion
color a
@REM This bat file is saved in CP 866 encoding. In VSCode.
@REM Этот bat файл сохранён в кодировке CP 866. В VSCode.
@REM chcp 866 > nul
@REM chcp 1251 > nul
@REM chcp 65001 > nul   
echo --------------------------------------------------------------------------------
echo.
echo                       Choose language (Выберите язык)
echo.
echo                               [1] ENG [2] RUS
echo.
choice /c 12
echo.
echo --------------------------------------------------------------------------------
if %errorlevel% == 2 goto RUS
if %errorlevel% == 1 goto ENG

@REM RUS ??
echo --------------------------------------------------------------------------------
:RUS
set lang=RUS
echo.
echo  [1] Удалить (Одну запись)
echo.
echo  [2] Удалить (Выпадающее меню категорий)
echo.
choice /c 12
echo.
if %errorlevel% == 2 goto const2-ru
if %errorlevel% == 1 goto const1-ru

@REM const1-ru and error-next-ru
echo --------------------------------------------------------------------------------
:error-next-ru
:const1-ru
echo.
echo  Какое значение вы хотите удалить?
echo.
reg query "HKEY_CLASSES_ROOT\Directory\shell"
echo.
set /p value="Введите название меню: "
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%" /f
echo.
echo --------------------------------------------------------------------------------
echo.
echo.  Все сделано!
echo.
pause
exit

@REM const2-ru
echo --------------------------------------------------------------------------------
:const2-ru
echo.
echo  Какое значение вы хотите удалить?
echo.
reg query "HKEY_CLASSES_ROOT\Directory\ContextMenus"
echo.
@REM If an error occurs, transfer to another parameter.. If the (ContextMenus) section does not exist in the registry yet.
@REM Если происходит ошибка перекидываем на другой параметр.. Если раздела (ContextMenus) в реестре ещё нет.
if ERRORLEVEL 1 goto error-next-ru

set /p value="Введите название меню: "
reg delete "HKEY_CLASSES_ROOT\Directory\ContextMenus\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%" /f
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Все сделано!
echo.
pause
exit

@REM ENG ??
echo --------------------------------------------------------------------------------
:ENG
set lang=ENG
echo.
echo  [1] Delete (Single entry)
echo.
echo  [2] Delete (Category dropdown menu)
echo.
choice /c 12
echo.
if %errorlevel% == 2 goto const2-en
if %errorlevel% == 1 goto const1-en

@REM const1 and error-next-en ??
echo --------------------------------------------------------------------------------
:error-next-en
:const1-en
echo.
echo  Which value do you want to remove?
echo.
reg query "HKEY_CLASSES_ROOT\Directory\shell"
echo.
set /p value="Enter menu name: "
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%" /f
echo.
echo --------------------------------------------------------------------------------
echo.
echo.  All done!
echo.
pause
exit

@REM const2-en ??
echo --------------------------------------------------------------------------------
:const2-en
echo.
echo  Which value do you want to remove?
echo.
reg query "HKEY_CLASSES_ROOT\Directory\ContextMenus"
echo.
@REM If an error occurs, transfer to another parameter.. If the (ContextMenus) section does not exist in the registry yet.
@REM Если происходит ошибка перекидываем на другой параметр.. Если раздела (ContextMenus) в реестре ещё нет.
if ERRORLEVEL 1 goto error-next-en

set /p value="Enter menu name: "
reg delete "HKEY_CLASSES_ROOT\Directory\ContextMenus\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%" /f
echo.
echo --------------------------------------------------------------------------------
echo.
echo  All done!
echo.
pause
exit