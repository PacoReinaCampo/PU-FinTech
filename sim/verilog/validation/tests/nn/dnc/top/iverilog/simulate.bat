@echo off
call ../../../../../../../../settings64_iverilog.bat

iverilog -g2012 -o system.vvp -c system.s -s model_top_testbench
vvp system.vvp
pause
