@echo off
call ../../../../../../../../settings64_msim.bat

vlib work
vlog -sv -stats=none -f system.f
vsim -c -do run.do work.model_read_heads_testbench
pause
