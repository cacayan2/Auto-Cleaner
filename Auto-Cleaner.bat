@echo off
setlocal disableDelayedExpansion
set q=^"

goto check_Permissions

:check_Permissions
    call :c 0A "Thank you for using this auto-cleaner tool, designed by L1M3!" /n
    echo Before we can continue, the commands run by this cleaner require administrator permissions. 
    echo We'll be checking that before running the tool.
    PAUSE    
    set /a time = 3
    :loading 
        cls
        echo Administrative permissions required. Detecting permissions.
        echo [*---- 20%%]
        timeout -t 1 /nobreak > nul
        cls
        echo Administrative permissions required. Detecting permissions.
        echo [**--- 40%%]
        timeout -t 1 /nobreak > nul
        cls
        echo Administrative permissions required. Detecting permissions.
        echo [***-- 60%%]
        timeout -t 1 /nobreak > nul
        cls
        echo Administrative permissions required. Detecting permissions.
        echo [****- 80%%]
        timeout -t 1 /nobreak > nul
        cls
        echo Administrative permissions required. Detecting permissions.
        echo [***** 100%%]
        timeout -t 1 /nobreak > nul
        net session >nul 2>&1
        if %errorLevel% == 0 (
            call :c 0A "Success: Administrative permissions confirmed." /n
            timeout -t 2 /nobreak >nul 
            cls
            goto auto-cleaner
        ) else (
            call :c 0C "Failure: Current permissions inadequate." /n
            timeout -t 2 /nobreak > nul
            echo Please execute this batch file with administrative permissions first. 
            echo The commands require administrative permissions to execute. 
            echo Automatically exiting in 10 seconds or press any key to exit now.
            timeout -t 10 > nul
            EXIT
        )

:auto-cleaner
    call :c 0A " ________  ________  ___  ___  _______   ________  ___  __        ___    ___ " /n
    call :c 0A "|\   ____\|\   __  \|\  \|\  \|\  ___ \ |\   __  \|\  \|\  \     |\  \  /  /|" /n
    call :c 0A "\ \  \___|\ \  \|\  \ \  \\\  \ \   __/|\ \  \|\  \ \  \/  /|_   \ \  \/  / /" /n
    call :c 0A " \ \_____  \ \  \\\  \ \  \\\  \ \  \_|/_\ \   __  \ \   ___  \   \ \    / / " /n
    call :c 0A "  \|____|\  \ \  \\\  \ \  \\\  \ \  \_|\ \ \  \ \  \ \  \\ \  \   \/  /  /  " /n
    call :c 0A "    ____\_\  \ \_____  \ \_______\ \_______\ \__\ \__\ \__\\ \__\__/  / /    " /n
    call :c 0A "   |\_________\|___| \__\|_______|\|_______|\|__|\|__|\|__| \|__|\___/ /     " /n
    call :c 0A "   \|_________|     \|__|                                       \|___|/      " /n
    call :c 0C " ________  ___       _______   ________  ________                            " /n
    call :c 0C "|\   ____\|\  \     |\  ___ \ |\   __  \|\   ___  \                          " /n
    call :c 0C "\ \  \___|\ \  \    \ \   __/|\ \  \|\  \ \  \\ \  \                         " /n
    call :c 0C " \ \  \    \ \  \    \ \  \_|/_\ \   __  \ \  \\ \  \                        " /n
    call :c 0C "  \ \  \____\ \  \____\ \  \_|\ \ \  \ \  \ \  \\ \  \                       " /n
    call :c 0C "   \ \_______\ \_______\ \_______\ \__\ \__\ \__\\ \__\                      " /n
    call :c 0C "    \|_______|\|_______|\|_______|\|__|\|__|\|__| \|__|                      " /n

    ECHO                         ,----------------,              ,---------,
    ECHO                 ,-----------------------,          ,'        ,'^|
    ECHO             ,'                      ,'^|        ,'        ,'  ^|
    ECHO             +-----------------------+  ^|      ,'        ,'    ^|
    ECHO             ^|  .-----------------.  ^|  ^|     +---------+      ^|
    ECHO             ^|  ^|                 ^|  ^|  ^|     ^| -==----'^|      ^|
    ECHO             ^|  ^|  Brought to     ^|  ^|  ^|     ^|         ^|      ^|
    ECHO             ^|  ^|  you by:        ^|  ^|  ^|/----^|`---=    ^|      ^|
    ECHO             ^|  ^|  L1M3!          ^|  ^|  ^|   ,/^|==== ooo ^|      ;
    ECHO             ^|  ^|                 ^|  ^|  ^|  // ^|(((( [33]^|    ,'
    ECHO             ^|  `-----------------'  ^|,' .;'^| ^|((((     ^|  ,'
    ECHO             +-----------------------+  ;;  ^| ^|         ^|,'     
    ECHO                 /_)______________(_/  //'   ^| +---------+
    ECHO         ___________________________/___  `,
    ECHO         /  oooooooooooooooo  .o.  oooo /,   \,'-----------
    ECHO         / ==ooooooooooooooo==.o.  ooo= //   ,`\--{)B     ,'
    ECHO         /_==__==========__==_ooo__ooo=_/'   /___________,'

    timeout -t 3 /nobreak > nul
    ECHO ___________________________________________________________________
    ECHO ___________________________________________________________________
    ECHO This auto-cleaner automatically runs sfc /scannow and dism -online -cleanup-image -restorehealth at the 
    ECHO click of a button. 
    ECHO Feel free to share this file with anyone else who wants to use it!
    ECHO Please note that this does not check logs or reruns commands if corruption is detected. 
    ECHO To begin the cleanup process, press any key...
    PAUSE > nul

    set /A countdown = 10
    :timer_loop
        cls
        ECHO Starting cleanup in %countdown% seconds...

        timeout -t 1 /nobreak > nul

        set /a countdown=%countdown% -1
        if %countdown% NEQ 0 goto :timer_loop

    :actual
        cls
        ECHO Starting sfc /scannow...
        START /WAIT /b sfc /scannow
        ECHO ___________________________________________________________________
        ECHO ___________________________________________________________________
        call :c 0B "Finished sfc /scannow! Starting deployment image service management..."
        START /WAIT /b dism -online -cleanup-image -restorehealth
        call :c 0B "Finished dism -online -cleanup-image -restorehealth!" /n 
        ECHO ___________________________________________________________________
        ECHO ___________________________________________________________________
        ECHO.
        ECHO Completed cleanup process! Please look at the output for sfc /scannow above. If the output says:
        call :c 0A "Windows Resource Protection did not find any integrity violations." /n
        ECHO Then you are likely safe from any OS errors and corruption and can resume normal system operations. 
        ECHO.
        ECHO If the output says: 
        call :c 0B "Windows Resource Protection found corrupt files and successfully repaired them. Details are in the CBS.Log %WinDir%\Logs\CBS\CBS.log." /n
        ECHO Then it is highly recommended you run the auto-cleaner again until you get the no integrity violations output. 
        ECHO.
        ECHO If you have been running the auto-cleaner multiple times and still cannot get the WRE did not find any integrity violations output
        ECHO or if you have any other output such as: 
        call :c 0C "Windows Resource Protection could not perform the requested operation." /n
        call :c 0C "Windows Resource Protection found corrupt files but was unable to fix some of them." /n
        ECHO We recommend running this file in safe mode. Otherwise, your system may have deep corruption that may require a clean windows install. 
        ECHO.
        goto exit_menu
    
    :exit_menu
      ECHO Thank you for using this cleaning tool!
      ECHO If you would like to rerun the cleanup process, type y or yes. 
      ECHO Otherwise, type n or no to exit the tool.
      CHOICE /M "Press Y to rerun the cleaning tool, N to exit."
      if %errorlevel% equ 1 (
      goto actual) else if %errorlevel% equ 2 (
        ECHO Goodbye!
        timeout -t 2 > NUL
        EXIT
      ) else (
        goto exit_menu_wrong
      )
      

    :exit_menu_wrong
      CHOICE /M "Invalid response. Press Y to rerun the cleaning tool, N to exit."
        if %errorlevel% equ 1 (
        goto actual) else if %errorlevel% equ 2 (
          ECHO Goodbye!
          timeout -t 2 > NUL
          EXIT
        ) else (
          goto exit_menu_wrong
        )

:c
setlocal enableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:colorPrint Color  Str  [/n]
setlocal
set "s=%~2"
call :colorPrintVar %1 s %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined DEL call :initColorPrint
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b


:initColorPrint
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b


:cleanupColorPrint
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b
