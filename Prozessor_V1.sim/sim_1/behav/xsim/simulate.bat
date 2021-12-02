@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sun Nov 21 08:18:22 +0100 2021
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim toplevel_tb_behaviour_cfg_behav -key {Behavioral:sim_1:Functional:toplevel_tb_behaviour_cfg} -tclbatch toplevel_tb_behaviour_cfg.tcl -view C:/Users/vinma/Xilinx_Projekte/Prozessor_V1/toplevel_tb_behaviour_cfg_behav.wcfg -log simulate.log"
call xsim  toplevel_tb_behaviour_cfg_behav -key {Behavioral:sim_1:Functional:toplevel_tb_behaviour_cfg} -tclbatch toplevel_tb_behaviour_cfg.tcl -view C:/Users/vinma/Xilinx_Projekte/Prozessor_V1/toplevel_tb_behaviour_cfg_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
