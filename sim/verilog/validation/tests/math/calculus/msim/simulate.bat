@echo off
call ../../../../../../../settings64_msim.bat

vlib work
vlog -sv -stats=none -f system.vc
vsim -c -do run.do work.model_calculus_testbench
pause
