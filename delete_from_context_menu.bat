@echo off

set /p app="What is the app name you want to delete?: "

if not [%app%] == [] (
   set /p open_file="Do you want to remove launching from all files? (y/n): "
   set /p open_background="Do you want to remove opening it from current directory? (y/n): "
) else (
   echo No app name, terminating...
   pause
   exit /B
)

if not [%open_file%] == [y] if NOT [%open_background%] == [y] (

   echo No operation needed, terminating...
   pause
   exit /B
)

bin\\delete_builder.exe %app%, %open_file%, %open_background%,

if not %ERRORLEVEL% == 0 (
   echo Files couldn't be builded, terminating...
   pause
   exit /B
)

deleter_script.bat