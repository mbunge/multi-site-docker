@echo off
@setlocal enableextensions enabledelayedexpansion
@echo off
setlocal enableextensions enabledelayedexpansion

set "curpath=%~dp0"
set "cmd=%1"
REM Move to parent folder
cd "%curpath%\.."

REM Main is recognize command and executes

IF "%cmd%"=="start" (
    call :start
) ELSE IF "%cmd%"=="stop" (
    call :stop
) ELSE IF "%cmd%"=="restart" (
    call :restart
) ELSE IF "%cmd%"=="resume" (
    call :resume
) ELSE IF "%cmd%"=="suspend" (
    call :suspend
) ELSE IF "%cmd%"=="reload" (
    call :reload
) ELSE IF "%cmd%"=="destroy" (
    call :destroy
) ELSE (
    echo "No command called. end doing nothing"
)

exit /B 0

:start
echo "start containers"
docker-compose up -d engage
exit /B 0

:stop
echo "stop containers"
docker-compose down
exit /B 0

:restart
call :stop
call :start
exit /B 0

:resume
docker-compose start
exit /B 0

:suspend
docker-compose stop
exit /B 0

:reload
docker-compose restart
exit /B 0

:destroy
call :stop
rem set "images=docker images -q"
rem docker rmi -f $(docker images -q)

rem executes similar to docker rmi -f $(docker images -q)
FOR /F "usebackq tokens=*" %%a IN (`docker images -q`) DO echo %%a
exit /B 0