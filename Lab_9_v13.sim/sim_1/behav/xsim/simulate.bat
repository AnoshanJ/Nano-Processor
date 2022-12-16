@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Aug 13 23:50:58 +0530 2022
REM SW Build 2258646 on Thu Jun 14 20:03:12 MDT 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim NanoProcessor_TB_behav -key {Behavioral:sim_1:Functional:NanoProcessor_TB} -tclbatch NanoProcessor_TB.tcl -view D:/1. CSE/Xilinx_Vivado/Lab_9/Lab_9_v13/Lab_9_v13.srcs/sim_1/imports/lab 9 v4/Nanoporcessor_TB_behav.wcfg -view D:/1. CSE/Xilinx_Vivado/Lab_9/Lab_9_v13/Lab_9_v13.srcs/sim_1/imports/Lab_9_v8/Reg_Bank_TB_behav.wcfg -view D:/1. CSE/Xilinx_Vivado/Lab_9/Lab_9_v13/Lab_9_v13.srcs/sim_1/imports/Lab_9_v8/Instruction_Decoder.wcfg -view D:/1. CSE/Xilinx_Vivado/Lab_9/Lab_9_v13/Lab_9_v13.srcs/sim_1/imports/Lab_9_v8/NanoProcessor_TB_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0