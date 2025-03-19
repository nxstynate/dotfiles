@echo off
title Startup Script
echo Starting applications...

:: Give Windows time to initialize services
timeout /t 5 /nobreak >nul

:: Launch GlazeWM last to ensure all windows are properly initialized
echo Launching GlazeWM...
start "" "C:\Program Files\glzr.io\GlazeWM\glazewm.exe"

:: Wait for applications to open before launching GlazeWM
echo Waiting for applications to start...
timeout /t 5 /nobreak >nul


:: Launch Applications
echo Launching WezTerm as Administrator...
powershell -Command "Start-Process 'C:\Program Files\WezTerm\wezterm-gui.exe' -Verb RunAs"

REM echo Launching Win-Vind...
REM start "" "C:\Users\Paul\scoop\shims\win-vind.exe"

echo Launching Blender...
REM start "" "C:\Program Files\Blender Foundation\Blender 4.2\blender.exe"

C:\Users\Paul\scoop\shims\win-vind.exe

echo Launching Google Chrome windows...
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window "https://www.google.com"
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window "https://voice.google.com"
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window --start-fullscreen "https://calendar.google.com"
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window --start-fullscreen "https://mail.google.com"
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window --start-fullscreen "https://trello.com/b/vHEaopgO/template"

echo Launching Slack...
start "" "C:\Users\Paul\AppData\Local\slack\slack.exe"

echo Launching Discord...
start "" "C:\Users\Paul\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"

echo All applications started successfully!
exit

