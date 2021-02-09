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

@REM RUS
echo --------------------------------------------------------------------------------
:RUS
set lang=RUS
echo Привет %username%
echo.
echo  Пожалуйста, избегайте использования пробелов, вы можете сломать значение
echo.
echo  реестра, попробуйте использовать пробелы только для путей или имен файлов.
echo.
echo  Как вы хотите, чтобы называлось Меню?
echo.
set /p MUIVerb="Введите: "
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Укажите путь к файлу иконки. Используйте два знака \\
echo.
echo  ПРИМЕР: было C:\Windows\System32.ico стало C:\\Windows\\System32.ico
echo.
set /p Icon="Введите: "
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Укажите путь к файлу. Используйте два знака \\
echo.
echo  ПРИМЕР: было C:\Windows\System32.exe стало C:\\Windows\\System32.exe
echo.
set /p exec="Введите: "
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Что вы хотите, чтобы это было?
echo.
echo  [1] Одна запись.
echo.
echo  [2] Как выпадающее меню категорий.
echo.
choice /c 12
echo.
IF %ERRORLEVEL% == 2 goto two
IF %ERRORLEVEL% == 1 goto one
exit

@REM ENG
echo --------------------------------------------------------------------------------
:ENG
set lang=ENG
echo Hello %username%
echo.
echo  Please avoid using spaces, you can break the value
echo.
echo  registry, try using spaces only for paths or filenames.
echo.
echo  What do you want the Menu to be called?
echo.
set /p MUIVerb="Enter: "
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Specify the path to the icon file. Use two signs \\
echo.
echo  EXAMPLE: was C:\Windows\System32.ico became C:\\Windows\\System32.ico
echo.
set /p Icon="Enter: "
echo.
echo --------------------------------------------------------------------------------
echo.
echo  Specify the path to the file. Use two signs \\
echo.
echo  EXAMPLE: was C:\Windows\System32.exe became C:\\Windows\\System32.exe
echo.
set /p exec="Enter: "
echo.
echo --------------------------------------------------------------------------------
echo.
echo  What do you want it to be?
echo.
echo  [1] One entry.
echo.
echo  [2] Like a dropdown menu of categories.
echo.
choice /c 12
echo.
IF %ERRORLEVEL% == 2 goto two
IF %ERRORLEVEL% == 1 goto one
exit

@REM The Menu.reg file is saved in the encoding (chcp 1251)! To view it correctly, change the encoding of your code editor to (chcp 1251)!
@REM Файл Menu.reg сохраняется в кодировке (chcp 1251)! Чтобы его корректно просмотреть измените кодировку вашего редактора кода на (chcp 1251)!
@REM two
@REM echo ------------------------------------------------------------------
:two
chcp 1251 > nul
echo.Windows Registry Editor Version 5.00 > Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\background\shell\%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\%MUIVerb%\shell\%MUIVerb%_admin] >> Menu.reg
echo."MUIVerb"="%MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
@REM echo.@="powershell.exe -command Start-Process %exec% -Verb RunAs" >> Menu.reg
@REM echo.@="nircmd elevate %exec% \"%1\"" >> Menu.reg
echo.@="mshta vbscript:createobject(\"shell.application\").shellexecute(\"%exec%\",\"\",\"\",\"runas\",1)(window.close)" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\%MUIVerb%\shell\%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\%MUIVerb%\shell\%MUIVerb%_admin\command] >> Menu.reg
echo."MUIVerb"="%MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
@REM echo.@="powershell.exe -command Start-Process %exec% -Verb RunAs" >> Menu.reg
@REM echo.@="nircmd elevate %exec% \"%1\"" >> Menu.reg
echo.@="mshta vbscript:createobject(\"shell.application\").shellexecute(\"%exec%\",\"\",\"\",\"runas\",1)(window.close)" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\%MUIVerb%\shell\%MUIVerb%\command] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg
if "%lang%"=="RUS" ( goto done2-ru )
if "%lang%"=="ENG" ( goto done2-en )

@REM The Menu.reg file is saved in the encoding (chcp 1251)! To view it correctly, change the encoding of your code editor to (chcp 1251)!
@REM Файл Menu.reg сохраняется в кодировке (chcp 1251)! Чтобы его корректно просмотреть измените кодировку вашего редактора кода на (chcp 1251)!
@REM one
@REM echo ------------------------------------------------------------------
:one
chcp 1251 > nul
echo.Windows Registry Editor Version 5.00 > Menu.reg
echo.  >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\%MUIVerb%] >> Menu.reg
echo.@="" >> Menu.reg
echo."Extended"="" >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\%MUIVerb%\command] >> Menu.reg 
echo.@="%exec%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\Background\shell\%MUIVerb%] >> Menu.reg 
echo.@="" >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\Background\shell\%MUIVerb%\command] >> Menu.reg 
echo.@="%exec%" >> Menu.reg
if "%lang%"=="RUS" ( goto done1-ru )
if "%lang%"=="ENG" ( goto done1-en )

@REM done1-ru
@REM echo ------------------------------------------------------------------
:done1-ru
chcp 866 > nul
echo --------------------------------------------------------------------------------
echo.
echo Готово!
echo.
echo  Открыть файл "menu.reg" применить изменения!
echo.
echo --------------------------------------------------------------------------------
echo  Если вы хотите удалить контекстное меню, используйте данный файл
echo.
echo  "Context Menu Remover.bat", либо сделайте это вручную.
echo.
echo  [1] Показать как удалить вручную. (создаст файл Readme.txt с инструкцией)   
echo.
echo  [2] Выход.
echo.
choice /c 12
echo.
echo --------------------------------------------------------------------------------
if errorlevel 2 exit
if errorlevel 1 goto notepad-ru1
:notepad-ru1
echo
echo Чтобы сделать это вручную, перейдите в [HKEY_CLASSES_ROOT\Directory\shell] и удалите %MUIVerb% >temp.txt
echo наконец перейти к [HKEY_CLASSES_ROOT\Directory\backround\shell] и удалите %MUIVerb% >>temp.txt
echo и меню будет удалено! >>temp.txt
@REM Вывод в юникоде
cmd /U /C type temp.txt > Readme.txt
del temp.txt
exit

@REM done1-en
@REM echo ------------------------------------------------------------------
:done1-en
chcp 866 > nul
echo --------------------------------------------------------------------------------
echo.
echo Done!
echo.
echo  Open the file "menu.reg" to apply changes!
echo.
echo --------------------------------------------------------------------------------
echo  If you want to remove the context menu, use this file
echo.
echo  "Context Menu Remover.bat", or do it manually.
echo.
echo  [1] Show how to delete manually. (create a Readme.txt file with instructions)
echo.
echo  [2] Exit.
echo.
choice /c 12
echo.
echo --------------------------------------------------------------------------------
if errorlevel 2 exit
if errorlevel 1 goto notepad-en1
:notepad-en1
echo
echo To do it manually go to [HKEY_CLASSES_ROOT\Directory\shell] and remove %MUIVerb% >temp.txt
echo finally go to [HKEY_CLASSES_ROOT\Directory\backround\shell] and remove %MUIVerb% >>temp.txt
echo and the menu will be removed! >>temp.txt
@REM Unicode output
cmd /U /C type temp.txt > Readme.txt
del temp.txt
exit

@REM done2-ru
@REM echo --------------------------------------------------------------------------------
:done2-ru
chcp 866 > nul
echo --------------------------------------------------------------------------------
echo.
echo Готово!
echo.
echo  Открыть файл "menu.reg" применить изменения!
echo.
echo --------------------------------------------------------------------------------
echo  Если вы хотите удалить контекстное меню, используйте данный файл
echo.
echo  "Context Menu Remover.bat", либо сделайте это вручную.
echo.
echo  [1] Показать как удалить вручную. (создаст файл Readme.txt с инструкцией)   
echo.
echo  [2] Выход.
echo.
choice /c 12
echo.
echo --------------------------------------------------------------------------------
if errorlevel 2 exit
if errorlevel 1 goto notepad-ru2
:notepad-ru2
echo
echo Чтобы сделать это вручную, перейдите в [HKEY_CLASSES_ROOT\Directory\shell] и удалите %MUIVerb% >temp.txt
echo затем перейдите к [HKEY_CLASSES_ROOT\Directory\ContextMenus] и удалите %MUIVerb% >>temp.txt
echo наконец перейти к [HKEY_CLASSES_ROOT\Directory\backround\shell] и удалите %MUIVerb% >>temp.txt
echo и меню будет удалено! >>temp.txt
@REM Вывод в юникоде
cmd /U /C type temp.txt > Readme.txt
del temp.txt
exit

@REM done2-en
@REM echo --------------------------------------------------------------------------------
:done2-en
chcp 866 > nul
echo --------------------------------------------------------------------------------
echo.
echo Done!
echo.
echo  Open the file "menu.reg" to apply changes!
echo.
echo --------------------------------------------------------------------------------
echo  If you want to remove the context menu, use this file
echo.
echo  "Context Menu Remover.bat", or do it manually.
echo.
echo  [1] Show how to delete manually. (create a Readme.txt file with instructions)   
echo.
echo  [2] Exit.
echo.
choice /c 12
echo.
echo --------------------------------------------------------------------------------
if errorlevel 2 exit
if errorlevel 1 goto notepad-en2
:notepad-en2
echo
echo To do it manually go to [HKEY_CLASSES_ROOT\Directory\shell] and remove %MUIVerb% >temp.txt
echo then go to [HKEY_CLASSES_ROOT\Directory\ContextMenus] and remove %MUIVerb% >>temp.txt
echo finally go to [HKEY_CLASSES_ROOT\Directory\backround\shell] and remove %MUIVerb% >>temp.txt
echo and the menu will be removed! >>temp.txt
@REM Unicode output
cmd /U /C type temp.txt > Readme.txt
del temp.txt
exit