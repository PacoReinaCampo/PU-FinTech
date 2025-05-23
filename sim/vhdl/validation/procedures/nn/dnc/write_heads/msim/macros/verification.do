#*************************
# VERIFICATION
#*************************

do variables.do

mkdir wlf

##################################################################################################
# TEST SOURCES ###################################################################################
##################################################################################################

##################################################################################################
# ACCELERATOR_ALLOCATION_GATE_TEST 
##################################################################################################

alias model_allocation_gate_verification_compilation {
  echo "TEST: ACCELERATOR_ALLOCATION_GATE_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_testbench.vhd

  vsim -g /model_write_heads_testbench/ENABLE_ACCELERATOR_ALLOCATION_GATE_TEST=true -t ps +notimingchecks -L unisim work.model_write_heads_testbench

  #MACROS
  add log -r sim:/model_write_heads_testbench/*

  #WAVES
  view -title model_allocation_gate wave
  do $simulation_path/model/dnc/write_heads/msim/waves/model_allocation_gate.do

  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_ALLOCATION_GATE_TEST true 0
  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_ALLOCATION_GATE_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_allocation_gate_test.wlf
}

##################################################################################################
# ACCELERATOR_ERASE_VECTOR_TEST 
##################################################################################################

alias model_erase_vector_verification_compilation {
  echo "TEST: ACCELERATOR_ERASE_VECTOR_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_testbench.vhd

  vsim -g /model_write_heads_testbench/ENABLE_ACCELERATOR_ERASE_VECTOR_TEST=true -t ps +notimingchecks -L unisim work.model_write_heads_testbench

  #MACROS
  add log -r sim:/model_write_heads_testbench/*

  #WAVES
  view -title model_erase_vector wave
  do $simulation_path/model/dnc/write_heads/msim/waves/model_erase_vector.do

  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_ERASE_VECTOR_TEST true 0
  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_ERASE_VECTOR_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_erase_vector_test.wlf
}

##################################################################################################
# ACCELERATOR_WRITE_GATE_TEST 
##################################################################################################

alias model_write_gate_verification_compilation {
  echo "TEST: ACCELERATOR_WRITE_GATE_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_testbench.vhd

  vsim -g /model_write_heads_testbench/ENABLE_ACCELERATOR_WRITE_GATE_TEST=true -t ps +notimingchecks -L unisim work.model_write_heads_testbench

  #MACROS
  add log -r sim:/model_write_heads_testbench/*

  #WAVES
  view -title model_write_gate wave
  do $simulation_path/model/dnc/write_heads/msim/waves/model_write_gate.do

  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_GATE_TEST true 0
  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_GATE_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_write_gate_test.wlf
}

##################################################################################################
# ACCELERATOR_WRITE_KEY_TEST 
##################################################################################################

alias model_write_key_verification_compilation {
  echo "TEST: ACCELERATOR_WRITE_KEY_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_testbench.vhd

  vsim -g /model_write_heads_testbench/ENABLE_ACCELERATOR_WRITE_KEY_TEST=true -t ps +notimingchecks -L unisim work.model_write_heads_testbench

  #MACROS
  add log -r sim:/model_write_heads_testbench/*

  #WAVES
  view -title model_write_key wave
  do $simulation_path/model/dnc/write_heads/msim/waves/model_write_key.do

  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_KEY_TEST true 0
  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_KEY_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_write_key_test.wlf
}

##################################################################################################
# ACCELERATOR_WRITE_STRENGTH_TEST 
##################################################################################################

alias model_write_strength_verification_compilation {
  echo "TEST: ACCELERATOR_WRITE_STRENGTH_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_testbench.vhd

  vsim -g /model_write_heads_testbench/ENABLE_ACCELERATOR_WRITE_STRENGTH_TEST=true -t ps +notimingchecks -L unisim work.model_write_heads_testbench

  #MACROS
  add log -r sim:/model_write_heads_testbench/*

  #WAVES
  view -title model_write_strength wave
  do $simulation_path/model/dnc/write_heads/msim/waves/model_write_strength.do

  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_STRENGTH_TEST true 0
  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_STRENGTH_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_write_strength_test.wlf
}

##################################################################################################
# ACCELERATOR_WRITE_VECTOR_TEST 
##################################################################################################

alias model_write_vector_verification_compilation {
  echo "TEST: ACCELERATOR_WRITE_VECTOR_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/write_heads/model_write_heads_testbench.vhd

  vsim -g /model_write_heads_testbench/ENABLE_ACCELERATOR_WRITE_VECTOR_TEST=true -t ps +notimingchecks -L unisim work.model_write_heads_testbench

  #MACROS
  add log -r sim:/model_write_heads_testbench/*

  #WAVES
  view -title model_write_vector wave
  do $simulation_path/model/dnc/write_heads/msim/waves/model_write_vector.do

  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_VECTOR_TEST true 0
  force -freeze sim:/model_write_heads_pkg/STIMULUS_ACCELERATOR_WRITE_VECTOR_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_write_vector_test.wlf
}

##################################################################################################

alias v01 {
  model_allocation_gate_verification_compilation 
}

alias v02 {
  model_erase_vector_verification_compilation 
}

alias v03 {
  model_write_gate_verification_compilation 
}

alias v04 {
  model_write_key_verification_compilation 
}

alias v05 {
  model_write_strength_verification_compilation 
}

alias v06 {
  model_write_vector_verification_compilation 
}

echo "****************************************"
echo "v01 . ACCELERATOR-ALLOCATION-GATE-TEST"
echo "v02 . ACCELERATOR-ERASE-VECTOR-TEST"
echo "v03 . ACCELERATOR-WRITE-GATE-TEST"
echo "v04 . ACCELERATOR-WRITE-KEY-TEST"
echo "v05 . ACCELERATOR-WRITE-STRENGTH-TEST"
echo "v06 . ACCELERATOR-WRITE-VECTOR-TEST"
echo "****************************************"