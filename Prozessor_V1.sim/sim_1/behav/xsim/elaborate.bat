@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Fri Nov 05 10:49:12 +0100 2021
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 610c9153cb5a4beb8ee82eb5c8f3b44c --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot toplevel_tb_behaviour_cfg_behav xil_defaultlib.toplevel_tb_behaviour_cfg -log elaborate.log"
call xelab  -wto 610c9153cb5a4beb8ee82eb5c8f3b44c --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot toplevel_tb_behaviour_cfg_behav xil_defaultlib.toplevel_tb_behaviour_cfg -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
