@echo off
setlocal enableextensions enabledelayedexpansion

REM Move to parent folder
set "appPath=%~dp1"
set "command=%2"
set "composer=docker run --rm -it --volume .:/app prooph/composer:5.6"

cd "%appPath%"

REM start composer

echo "Configure composer for github"

%composer% config -g github-oauth.github.com a26c52c2999767d2f102ca73fd72cacb08004952"

echo "Run dockerized composer %command% in %appPath%"
%composer% %command%