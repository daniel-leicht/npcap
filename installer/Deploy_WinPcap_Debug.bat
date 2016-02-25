
set DRIVER_NAME=npf
set DEPLOY_FOLDER_NAME=win7_above_winpcap
set VISTA_DEPLOY_FOLDER_NAME=vista_winpcap
set VS_CONFIG_MODE=(WinPcap Mode)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Copy Npcap driver files
xcopy /Y	"..\packetWin7\npf\Win7 Debug%VS_CONFIG_MODE%\npf\%DRIVER_NAME%.cat"						.\%DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\Win7 Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.inf"						.\%DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\Win7 Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%_wfp.inf"					.\%DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\Win7 Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.sys"						.\%DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\x64\Win7 Debug%VS_CONFIG_MODE%\%DRIVER_NAME%\%DRIVER_NAME%.cat"					.\%DEPLOY_FOLDER_NAME%\x64\
xcopy /Y	"..\packetWin7\npf\x64\Win7 Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.inf"					.\%DEPLOY_FOLDER_NAME%\x64\
xcopy /Y	"..\packetWin7\npf\x64\Win7 Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%_wfp.inf"				.\%DEPLOY_FOLDER_NAME%\x64\
xcopy /Y	"..\packetWin7\npf\x64\Win7 Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.sys"					.\%DEPLOY_FOLDER_NAME%\x64\

xcopy /Y	"..\packetWin7\npf\Vista Debug%VS_CONFIG_MODE%\npf\%DRIVER_NAME%.cat"						.\%VISTA_DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\Vista Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.inf"						.\%VISTA_DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\Vista Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%_wfp.inf"					.\%VISTA_DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\Vista Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.sys"						.\%VISTA_DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\npf\x64\Vista Debug%VS_CONFIG_MODE%\%DRIVER_NAME%\%DRIVER_NAME%.cat"					.\%VISTA_DEPLOY_FOLDER_NAME%\x64\
xcopy /Y	"..\packetWin7\npf\x64\Vista Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.inf"					.\%VISTA_DEPLOY_FOLDER_NAME%\x64\
xcopy /Y	"..\packetWin7\npf\x64\Vista Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%_wfp.inf"				.\%VISTA_DEPLOY_FOLDER_NAME%\x64\
xcopy /Y	"..\packetWin7\npf\x64\Vista Debug%VS_CONFIG_MODE%\npf Package\%DRIVER_NAME%.sys"					.\%VISTA_DEPLOY_FOLDER_NAME%\x64\

:: Copy Packet.dll
xcopy /Y	"..\packetWin7\Dll\Project\Release No NetMon and AirPcap%VS_CONFIG_MODE%\Packet.dll"		.\%DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\Dll\Project\x64\Release No NetMon and AirPcap%VS_CONFIG_MODE%\Packet.dll"	.\%DEPLOY_FOLDER_NAME%\x64\

:: Copy NPFInstall.exe
xcopy /Y	"..\packetWin7\NPFInstall\Release%VS_CONFIG_MODE%\NPFInstall.exe"							.\%DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\NPFInstall\x64\Release%VS_CONFIG_MODE%\NPFInstall.exe"						.\%DEPLOY_FOLDER_NAME%\x64\

:: Copy NPcapHelper.exe
xcopy /Y	"..\packetWin7\Helper\release\NPcapHelper.exe"								.\%DEPLOY_FOLDER_NAME%\x86\
xcopy /Y	"..\packetWin7\Helper\x64\release\NPcapHelper.exe"							.\%DEPLOY_FOLDER_NAME%\x64\

:: Npcap uses the original WinPcap wpcap.dll with exactly the same code, we just changed the version number.
:: Copy wpcap.dll
xcopy /Y	"..\wpcap\PRJ\Release No AirPcap\x86\wpcap.dll"								.\
xcopy /Y	"..\wpcap\PRJ\Release No AirPcap\x64\wpcap.dll"								.\x64\

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: First need to add "signtool.exe" to PATH, then put the cert file (e.g. C:\xxx.pfx) to environment variable %NPF_CERT_PATH%,
:: put the private key string (e.g. 123456) to environment variable %NPF_SIGN_PK%

:: Sign Npcap driver for Vista
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%VISTA_DEPLOY_FOLDER_NAME%\x86\%DRIVER_NAME%.sys
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%VISTA_DEPLOY_FOLDER_NAME%\x86\%DRIVER_NAME%.cat
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%VISTA_DEPLOY_FOLDER_NAME%\x64\%DRIVER_NAME%.sys
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%VISTA_DEPLOY_FOLDER_NAME%\x64\%DRIVER_NAME%.cat

:: Sign Npcap driver for Win7 and later
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x86\%DRIVER_NAME%.sys
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x86\%DRIVER_NAME%.cat
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x64\%DRIVER_NAME%.sys
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x64\%DRIVER_NAME%.cat

:: Sign Packet.dll
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x86\Packet.dll
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x64\Packet.dll

:: Sign NPFInstall.exe
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x86\NPFInstall.exe
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x64\NPFInstall.exe

:: Sign NPcapHelper.exe
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x86\NPcapHelper.exe
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\%DEPLOY_FOLDER_NAME%\x64\NPcapHelper.exe

:: Sign wpcap.dll
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\wpcap.dll
signtool sign /f %NPF_CERT_PATH% /p %NPF_SIGN_PK% .\x64\wpcap.dll

pause
