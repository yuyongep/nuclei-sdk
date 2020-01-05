@echo off
set NUCLEI_TOOL_ROOT=C:\Nuclei
set NMSIS_ROOT=..\NMSIS

# Create your setup_config.bat
# and define NUCLEI_TOOL_ROOT or NMSIS_ROOT like below
# set NUCLEI_TOOL_ROOT=D:\Software\Nuclei
# set NMSIS_ROOT=D:\Source\NMSIS
set SETUP_CONFIG=setup_config.bat

if exist %SETUP_CONFIG% call %SETUP_CONFIG%

set PATH=%NUCLEI_TOOL_ROOT%\gcc\bin;%NUCLEI_TOOL_ROOT%\openocd\bin;%NUCLEI_TOOL_ROOT%\build-tools\bin;%PATH%
set NMSIS_ROOT=%NMSIS_ROOT%
@echo on
