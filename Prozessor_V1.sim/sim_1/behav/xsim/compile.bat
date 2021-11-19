@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : compile.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for compiling the simulation design source files
REM
REM Generated by Vivado on Fri Nov 19 12:53:28 +0100 2021
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: compile.bat
REM
REM ****************************************************************************
echo "xvlog --incr --relax -prj toplevel_tb_behaviour_cfg_vlog.prj"
call xvlog  --incr --relax -prj toplevel_tb_behaviour_cfg_vlog.prj -log xvlog.log
call type xvlog.log > compile.log
echo "xvhdl --incr --relax -prj toplevel_tb_behaviour_cfg_vhdl.prj"
call xvhdl  --incr --relax -prj toplevel_tb_behaviour_cfg_vhdl.prj -log xvhdl.log
call type xvhdl.log >> compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
