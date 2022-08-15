@echo off
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM + Example build script for Windows                            +
REM +                                                             +
REM + Change the following `set' statements to adapt them to your +
REM + local settings:                                             +
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM The directory where the DLL will be built
set build_dir="C:\Temp"

REM The FileMaker extension directory
set target_dir="C:\Program Files (x86)\Adobe\Acrobat 11.0\Acrobat\plug_ins"

REM The delivery script
set script="C:\Acrobat Actions\pdf-plugin-tools\deliver.lisp"

REM The LispWorks executable
set lispworks="C:\Program Files (x86)\LispWorks\lispworks-6-1-0-x86-win32.exe"

REM The name of the plug-in (the .fmx file)
set name=PDFLisp

REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM + Don't change anything below this point.                     +
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

cd %build_dir%
if errorlevel 1 (
  echo Couldn't change to directory %build_dir%.
  pause
) else (
  %lispworks% -build %script% %name%
  if errorlevel 1 (
    echo Couldn't build DLL.
    pause
  ) else (
    copy /Y %name%.api %target_dir%
    if errorlevel 1 (
      echo Couldn't copy DLL into %target_dir%.
    pause
    )
	del %name%.api
  )
)
