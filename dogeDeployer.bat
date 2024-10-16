@echo off
echo This Script was developed by net.doge
echo .
echo                 ;i.
echo                  M$L                    .;i.
echo                  M$Y;                .;iii;;.
echo     wow         ;$YY$i._           .iiii;;;;;
echo                .iiiYYYYYYiiiii;;;;i;iii;; ;;;
echo              .;iYYYYYYiLogonYYYiiiiiii;;  ;;;
echo           .YYYY$$$$YYYYnet.dogeYYYYiii;; ;;;;
echo         .YYY$$$$$$YYYYYY$$$$iiiY$$$$$$$ii;;;;
echo        :YYYF`,  TYYYYY$$$$$YYYYYYYi$$$$$iiiii;
echo        Y$MM: \  :YYYY$$P"````"T$YYMMMMMMMMiiYY.
echo     `.;$$M$$b.,dYY$$Yi; .(     .YYMMM$$$MMMMYY
echo   .._$MMMMM$!YYYYYYYYYi;.`"  .;iiMMM$MMMMMMMYY
echo    ._$MMMP` ```""4$$$$$iiiiiiii$MMMMMMMMMMMMMY;
echo     MMMM$:       :$$$$$$$MMMMMMMMMMM$$MMMMMMMYYL
echo    :MMMM$$.    .;PPb$$$$MMMMMMMMMM$$$$MMMMMMiYYU:
echo     iMM$$;;: ;;;;i$$$$$$$MMMMM$$$$MMMMMMMMMMYYYYY
echo     `$$$$i .. ``:iiii!*"``.$$$$$$$$$MMMMMMM$YiYYY
echo      :Y$$iii;;;.. ` ..;;i$$$$$$$$$MMMMMM$$YYYYiYY:
echo       :$$$$$iiiiiii$$$$$$$$$$$MMMMMMMMMMYYYYiiYYYY.
echo        `$$$$$$$$$$$$$$$$$$$$MMONEYMMM$YYYYYiiiYYYYYY
echo         YY$$$$$$$$$$$$$$$$MMMMMMM$$YYYiiiiiiYYYYYYY
echo        :YYYYYY$$$$$$$$$$$$$$$$$$YYYYYYYiiiiYYYYYYi'
echo  such sysmon
echo                                      very splunk
echo                  wow
echo .           
echo This script will help you build your splunk and sysmon deployment script!
echo .
echo You can create a script to deploy in a local folder or from a network share!
echo An example network share can be something like... \\DC01\Share

:start
set /p choice1=Install from 1.Local Folder or 2.Network Share? 1=Local 2=Network Share - Choice: 
if "%choice1%"=="1" (
    set share=.
    echo @echo off > %share%\deploymentScriptbyDoge.bat
    goto menu
) else if "%choice1%"=="2" (
	    goto sharename
) else (
    echo invalid choice, try again!
    goto start
)

:sharename
set /p share=Enter your share name (don't put the trailing \) 
set /p share2=Confirm your share name!                         
if "%share%"=="%share2%" (
    echo @echo off > %share%\deploymentScriptbyDoge.bat
    goto menu
)
if "%share%" NEQ "%share2%" (
    echo share names don't match! Copy and paste it from the file explorer if you need to...
    goto sharename
)

:menu
cls
echo .
echo                 ;i.
echo                  M$L                    .;i.
echo                  M$Y;                .;iii;;.
echo     wow         ;$YY$i._           .iiii;;;;;
echo                .iiiYYYYYYiiiii;;;;i;iii;; ;;;
echo              .;iYYYYYYiLogonYYYiiiiiii;;  ;;;
echo           .YYYY$$$$YYYYnet.dogeYYYYiii;; ;;;;
echo         .YYY$$$$$$YYYYYY$$$$iiiY$$$$$$$ii;;;;
echo        :YYYF`,  TYYYYY$$$$$YYYYYYYi$$$$$iiiii;
echo        Y$MM: \  :YYYY$$P"````"T$YYMMMMMMMMiiYY.
echo     `.;$$M$$b.,dYY$$Yi; .(     .YYMMM$$$MMMMYY
echo   .._$MMMMM$!YYYYYYYYYi;.`"  .;iiMMM$MMMMMMMYY
echo    ._$MMMP` ```""4$$$$$iiiiiiii$MMMMMMMMMMMMMY;
echo     MMMM$:       :$$$$$$$MMMMMMMMMMM$$MMMMMMMYYL
echo    :MMMM$$.    .;PPb$$$$MMMMMMMMMM$$$$MMMMMMiYYU:
echo     iMM$$;;: ;;;;i$$$$$$$MMMMM$$$$MMMMMMMMMMYYYYY
echo     `$$$$i .. ``:iiii!*"``.$$$$$$$$$MMMMMMM$YiYYY
echo      :Y$$iii;;;.. ` ..;;i$$$$$$$$$MMMMMM$$YYYYiYY:
echo       :$$$$$iiiiiii$$$$$$$$$$$MMMMMMMMMMYYYYiiYYYY.
echo        `$$$$$$$$$$$$$$$$$$$$MMONEYMMM$YYYYYiiiYYYYYY
echo         YY$$$$$$$$$$$$$$$$MMMMMMM$$YYYiiiiiiYYYYYYY
echo        :YYYYYY$$$$$$$$$$$$$$$$$$YYYYYYYiiiiYYYYYYi'
echo  such sysmon
echo                                      very splunk
echo                  wow
echo .
echo ====================================================
echo         %share% Deployment Menu
echo ====================================================
echo       1. Install Everything!!!
echo       2. Include Sysmon Install 
echo       3. Include Splunk Universal Forwarder Install
echo       4. Uninstall Splunk
echo       5. Run the Created Script!!
echo       6. Check Local Installs
echo       0. Exit
echo ====================================================
set /p choice2=Please enter your choice... 

if "%choice2%"=="0" goto exit
if "%choice2%"=="1" goto everything
if "%choice2%"=="2" goto sysmon
if "%choice2%"=="3" goto Splunk
if "%choice2%"=="4" goto cleanup
if "%choice2%"=="5" goto RunDeploy
if "%choice2%"=="6" (
    goto installChecker
) else (
    echo INVALID CHOICE!!!
    pause
    goto menu
)

:RunDeploy
echo Starting your deployment Script! (deploymentScriptbyDoge.bat)
%share%\deploymentScriptbyDoge.bat
pause
goto Menu



:sysmon
echo Including Sysmon in your Script. Remember to include the .EXE in your deployment directory!
set /p sysmonConfigCheck=Do you have a configuration file? y/N
if "%sysmonConfigCheck%"=="y" (
    set /p configFileName=Enter full filename including Extension... 
    pause
    goto sysmonwrite
) else if "%sysmonConfigCheck%"=="N" (
    echo %share%\sysmon.exe -accepteula -i >> %share%\deploymentScriptbyDoge.bat
    goto menu
) else (
    echo INVALID CHOICE!!!
    pause
    goto sysmon
)
:sysmonwrite
echo installing Sysmon with configuration file %share%\%configFileName%
echo %share%\sysmon.exe -accepteula -i "%share%\%configFileName%" >> %share%\deploymentScriptbyDoge.bat
pause
goto menu


:Splunk
echo Including SplunkUF in your Script. Remember to include the .EXE in your deployment directory!
set splunkDeploymentPort=8089
set splunkIndexPort=9997
set splunkUserName=splunk
set /p splunkInstanceIP=Enter your Splunk IP address... 
set /p splunkDeploymentPort=Enter your deployment port (default 8089)... 
set /p splunkIndexPort=Enter your Indexer's Listening port (default 9997)... 
set /p splunkUserName=Enter your universal forwarder's splunk account name (default splunk)...
goto splunkwrite
:splunkwrite
cls
echo ==========================================================================================
echo           Splunk IP is ------------------ %splunkInstanceIP%
echo           Splunk Deployment Server is --- %splunkInstanceIp%:%splunkDeploymentPort%
echo           Splunk Indexer is ------------- %splunkInstanceIP%:%splunkIndexPort%
echo           SplunkUF account is ----------- %splunkUserName%
echo ==========================================================================================
echo .
set /p splunkConfirm=Is this information Correct? [y/N] - 
if "%splunkConfirm%"=="y" (
    echo adding to your deployment script!
    echo msiexec.exe /i "%share%\splunkuniversalforwarder.msi" DEPLOYMENT_SERVER="%splunkInstanceIp%:%splunkDeploymentPort%" RECEIVING_INDEXER="%splunkInstanceIP%:%splunkIndexPort%" AGREETOLICENSE=Yes SERVICESTARTTYPE=AUTO LAUNCHSPLUNK=1 USE_LOCAL_SYSTEM=1 SPLUNKUSERNAME=splunk GENRANDOMPASSWORD=1 WINEVENTLOG_APP_ENABLE=1 WINEVENTLOG_SEC_ENABLE=1 WINEVENTLOG_SYS_ENABLE=1 WINEVENTLOG_FWD_ENABLE=1 WINEVENTLOG_SET_ENABLE=1 PERFMON=network ENABLEADMON=1 /passive >> %share%\deploymentScriptbyDoge.bat
    echo copy "%share%\inputs.conf" "C:\Program Files\SplunkUniversalForwarder\etc\system\local\" >> %share%\deploymentScriptbyDoge.bat
) else (
    goto Splunk
)
pause
goto menu


:everything
echo Including the Full Package... Remember to include the .EXEs in your deployment directory!
echo Including Sysmon in your Script. Remember to include the .EXE in your deployment directory!
set /p sysmonConfigCheck=Do you have a configuration file? y/N
if "%sysmonConfigCheck%"=="y" (
    set /p configFileName=Enter full filename including Extension... 
    pause
    goto sysmonInstallE
) else if "%sysmonConfigCheck%"=="N" (
    set configFileName=
    echo %share%\sysmon.exe -accepteula -i >> %share%\deploymentScriptbyDoge.bat
    goto menu
) else (
    echo INVALID CHOICE!!!
    pause
    goto sysmon
)
:sysmonInstallE
echo installing Sysmon with configuration file %share%\%configFileName%
echo %share%\sysmon.exe -accepteula -i "%share%\%configFileName%" >> %share%\deploymentScriptbyDoge.bat
pause


:SplunkE
echo Including SplunkUF in your Script. Remember to include the .EXE in your deployment directory!
set splunkDeploymentPort=8089
set splunkIndexPort=9997
set splunkUserName=splunk
set /p splunkInstanceIP=Enter your Splunk IP address... 
set /p splunkDeploymentPort=Enter your deployment port (default 8089)... 
set /p splunkIndexPort=Enter your Indexer's Listening port (default 9997)... 
set /p splunkUserName=Enter your universal forwarder's splunk account name (default splunk)...
goto splunkwrite
:splunkwriteE
cls
echo ==========================================================================================
echo                Splunk IP is ------------------ %splunkInstanceIP%
echo                Splunk Deployment Server is --- %splunkInstanceIp%:%splunkDeploymentPort%
echo                Splunk Indexer is ------------- %splunkInstanceIP%:%splunkIndexPort%
echo                SplunkUF account is ----------- %splunkUserName%
echo ==========================================================================================
echo .
set /p splunkConfirm=Is this information Correct? [y/N] - 
if "%splunkConfirm%"=="y" (
    echo adding to your deployment script!
    echo msiexec.exe /i "%share%\splunkuniversalforwarder.msi" DEPLOYMENT_SERVER="%splunkInstanceIp%:%splunkDeploymentPort%" RECEIVING_INDEXER="%splunkInstanceIP%:%splunkIndexPort%" AGREETOLICENSE=Yes SERVICESTARTTYPE=AUTO LAUNCHSPLUNK=1 USE_LOCAL_SYSTEM=1 SPLUNKUSERNAME=splunk GENRANDOMPASSWORD=1 WINEVENTLOG_APP_ENABLE=1 WINEVENTLOG_SEC_ENABLE=1 WINEVENTLOG_SYS_ENABLE=1 WINEVENTLOG_FWD_ENABLE=1 WINEVENTLOG_SET_ENABLE=1 PERFMON=network ENABLEADMON=1 /passive >> %share%\deploymentScriptbyDoge.bat
    echo copy "%share%\inputs.conf" "C:\Program Files\SplunkUniversalForwarder\etc\system\local\" >> %share%\deploymentScriptbyDoge.bat
) else (
    goto SplunkE
)
pause
goto menu

:cleanup
set /p uninstall=Are you sure you want to uninstall everything? [y/N] 
if "%uninstall%"=="y" (
    echo Removing the Full Package!
    msiexec.exe /x "%share%\splunkuniversalforwarder.msi" /passive
) else if "%uninstall%"=="N" (
    echo Cancelling! Returning to menu...
    timeout /t 3 /nobreak
    goto menu
) else (
    echo INVALID CHOICE!!!
    timeout /t 3 /nobreak
    goto cleanup
)
pause
goto menu

:installChecker
set serviceName=Sysmon
REM Check if the service is installed
sc query %serviceName% >nul 2>&1
if errorlevel 1 (
    echo %serviceName% is not installed.
) else (
    echo %serviceName% is installed.
    REM Check if the service is running
    sc query %serviceName% | find "RUNNING" >nul
    if errorlevel 1 (
        echo %serviceName% is installed but not running.
    ) else (
        echo %serviceName% is running.
    )
)
set serviceName=SplunkForwarder
REM Check if the service is installed
sc query %serviceName% >nul 2>&1
if errorlevel 1 (
    echo %serviceName% is not installed.
) else (
    echo %serviceName% is installed.
    REM Check if the service is running
    sc query %serviceName% | find "RUNNING" >nul
    if errorlevel 1 (
        echo %serviceName% is installed but not running.
    ) else (
        echo %serviceName% is running.
    )
)
pause
goto menu

:exit
echo Goodbye!
timeout /t 2 /nobreak