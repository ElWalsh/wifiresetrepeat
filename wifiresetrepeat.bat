REM Restart Wireless Connection 3 times on start up.
REM Repeats 3 times if ping not successful ad infinitum.
:begin
ping -n 1 google.com
if %errorlevel% EQU 0 ECHO Internet Connection Present
netsh wlan disconnect interface=Wifi
TIMEOUT 3
netsh wlan connect ssid=* Name=* Interface=Wifi
TIMEOUT 5
netsh wlan disconnect interface=Wifi
TIMEOUT 3
netsh wlan connect ssid=* Name=* Interface=Wifi
TIMEOUT 5
netsh wlan disconnect interface=Wifi
TIMEOUT 3
netsh wlan connect ssid=* Name=* Interface=Wifi
TIMEOUT 10
ping -n 1 google.com
if %errorlevel% EQU 0 goto end
if %errorlevel% EQU 1 goto begin
:end



