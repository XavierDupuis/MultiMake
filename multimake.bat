@echo off
REM COMMENT PREVIOUS LINE FOR DEBUGGING PERSPECTIVE

REM ***********************************************
REM @file Multimake.bat
REM @author XAVIER DUPUIS (xavier0978@hotmail.fr)
REM @brief 
REM @version 0.1
REM @date 2020-03-30
REM 
REM @copyright Copyright (c) 2020
REM ***********************************************

setLocal EnableDelayedExpansion 
cls
title MultiMakefile
echo === MULTIMAKEFILE BEGIN ===
echo.

REM LOCAL DIRECTORIES AND FILES
set DEFAULT_PROJECT_FOLDER=project
set OUTPUT_DIR=output
set OUTPUT_RUN=run
set OUTPUT_test=test

REM GET OPTION
set option=%1
echo    make %option%
echo.

:: READING CUSTOM USER INPUTS
set PROJECTS[1]=%DEFAULT_PROJECT_FOLDER%
if exist "projects.txt" (
	set i=0
    for /F %%a in (projects.txt) do (
        if exist %%a (
            set /A i+=1
            set PROJECTS[!i!]=%%a
        )
    )
    set NProjects=!i!
)
set NProjects=1
IF NOT exist !PROJECTS[1]! (echo    NO PROJECT FOUND && goto :END)

REM DISPATCHING
IF [%option%]==[]       (call :RUN)
IF [%option%]==[run]    (call :RUN)
IF [%option%]==[help]   (call :HELP)
IF [%option%]==[test]   (call :TEST)
IF [%option%]==[clean]  (call :CLEAN)
goto END

REM **** RULES ****
:HELP
echo **********************************************************************
echo ** ./multimake.bat [arg]                                            **
echo **     [no_arg] : Executes MAKE rules and outputs to /output/run    **
echo **     run      : Executes MAKE rules and outputs to /output/run    **
echo **     help     : Displays help informations                        **
echo **     test     : Executes MAKE rules and outputs to /output/test   **
echo **     clean    : Delete /output, /bin and /build directories       **
echo **********************************************************************
goto :EOF

:RUN
IF NOT exist %OUTPUT_DIR% (md %OUTPUT_DIR%)
cd %OUTPUT_DIR% 
IF NOT exist %OUTPUT_RUN% (md %OUTPUT_RUN%)
cd ..
for /L %%i in (1,1,!NProjects!) do (
    cd !PROJECTS[%%i]!
    call make run > ../%OUTPUT_DIR%/%OUTPUT_RUN%/!PROJECTS[%%i]!.txt
    cd ..
)
goto :EOF

:TEST
IF NOT exist %OUTPUT_DIR%  (md %OUTPUT_DIR%)
cd %OUTPUT_DIR% 
IF NOT exist %OUTPUT_TEST% (md %OUTPUT_TEST%)
cd ..
for /L %%i in (1,1,!NProjects!) do (
    cd !PROJECTS[%%i]!
    call make test > ../%OUTPUT_DIR%/%OUTPUT_TEST%/!PROJECTS[%%i]!.txt
    cd ..
)
goto :EOF

:CLEAN
for /L %%i in (1,1,!NProjects!) do (
    cd !PROJECTS[%%i]!
    call make clean
    cd ..
)
IF exist %OUTPUT_DIR% (rmdir %OUTPUT_DIR% /q /s)
goto :EOF

:END
echo.
echo ===  MULTIMAKEFILE END  === 