all: build simulate

build:
	if [ ! -e work ]; then vlib work; fi
	vlog -sv -stats=none -f system.f

simulate:
	vsim -c -do run.do work.model_memory_testbench

clean:
	rm -rf work transcript *.vstf *.wlf
