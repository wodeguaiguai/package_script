@echo off

cd /d %~dp0

if "%TIME:~0,1%"=="1" (
	set filename=mdias-%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%%TIME:~0,2%%TIME:~3,2%
) else (
	if "%TIME:~0,1%"=="2" (
		set filename=mdias-%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%%TIME:~0,2%%TIME:~3,2%
	) else (
		set filename=mdias-%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%0%TIME:~1,1%%TIME:~3,2%
	)
)

call package-full.bat %filename%
call package-patch.bat %filename%