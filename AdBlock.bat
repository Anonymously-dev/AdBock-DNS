@echo press 1 for AdGuard DNS
@echo press 2 for Google DNS
@echo press 3 for Cloudflare DNS
@echo press 4 for Default DNS
@echo press 5 for Exit
@echo off

:: Main Menu
:BEGIN
CHOICE /N /C:12345 /M ""
IF ERRORLEVEL 5 GOTO CHOICE5
IF ERRORLEVEL 4 GOTO CHOICE4
IF ERRORLEVEL 3 GOTO CHOICE3
IF ERRORLEVEL 2 GOTO CHOICE2
IF ERRORLEVEL 1 GOTO CHOICE1

:CHOICE1
:: AdGuard DNS
netsh interface ipv4 set dns name="Wi-Fi" static 94.140.14.14
netsh interface ipv4 add dns name="Wi-Fi" 94.140.15.15 index=2
cls
echo DNS servers set to AdGuard DNS on Wi-Fi interface.
pause
exit

:CHOICE2
:: Google DNS
netsh interface ipv4 set dns name="Wi-Fi" static 8.8.8.8
netsh interface ipv4 add dns name="Wi-Fi" 8.8.4.4 index=2
cls
echo DNS servers set to Google DNS on Wi-Fi interface.
pause
exit

:CHOICE3
:: Cloudflare DNS
netsh interface ipv4 set dns name="Wi-Fi" static 1.1.1.1
netsh interface ipv4 add dns name="Wi-Fi" 1.0.0.1 index=2
cls
echo DNS servers set to Cloudflare DNS on Wi-Fi interface.
pause
exit

:CHOICE4
:: Default DNS (via DHCP)
netsh interface ipv4 set dns name="Wi-Fi" source=dhcp
netsh interface ipv4 delete dns name="Wi-Fi" addr=
cls
echo DNS servers set to Default (automatic) on Wi-Fi interface.
pause
exit

:CHOICE5
exit
