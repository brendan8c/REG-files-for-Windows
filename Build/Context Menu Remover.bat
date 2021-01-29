::https://github.com/brendan8c/REG-files-for-Windows
@echo off
setlocal EnableDelayedExpansion
color a
@REM This bat file is saved in CP 866 encoding. In VSCode.
@REM ��� bat 䠩� ��࠭� � ����஢�� CP 866. � VSCode.
@REM chcp 866 > nul
@REM chcp 1251 > nul
@REM chcp 65001 > nul   
echo --------------------------------------------------------------------------------
echo.
echo                       Choose language (�롥�� ��)
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
echo  [1] ������� (���� ������)
echo.
echo  [2] ������� (�믠���饥 ���� ��⥣�਩)
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
echo  ����� ���祭�� �� ��� 㤠����?
echo.
reg query "HKEY_CLASSES_ROOT\Directory\shell"
echo.
set /p value="������ �������� ����: "
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%" /f
echo.
echo --------------------------------------------------------------------------------
echo.
echo.  �� ᤥ����!
echo.
pause
exit

@REM const2-ru
echo --------------------------------------------------------------------------------
:const2-ru
echo.
echo  ����� ���祭�� �� ��� 㤠����?
echo.
reg query "HKEY_CLASSES_ROOT\Directory\ContextMenus"
echo.
@REM If an error occurs, transfer to another parameter.. If the (ContextMenus) section does not exist in the registry yet.
@REM �᫨ �ந�室�� �訡�� ��४��뢠�� �� ��㣮� ��ࠬ���.. �᫨ ࠧ���� (ContextMenus) � ॥��� ��� ���.
if ERRORLEVEL 1 goto error-next-ru

set /p value="������ �������� ����: "
reg delete "HKEY_CLASSES_ROOT\Directory\ContextMenus\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%" /f
echo.
echo --------------------------------------------------------------------------------
echo.
echo  �� ᤥ����!
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
@REM �᫨ �ந�室�� �訡�� ��४��뢠�� �� ��㣮� ��ࠬ���.. �᫨ ࠧ���� (ContextMenus) � ॥��� ��� ���.
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