#*************************
# VERIFICATION
#*************************

do variables.do

mkdir wlf

##################################################################################################
# TEST SOURCES ###################################################################################
##################################################################################################

##################################################################################################
# ACCELERATOR_MEMORY_SORT_VECTOR_TEST 
##################################################################################################

alias model_memory_sort_vector_verification_compilation {
  echo "TEST: ACCELERATOR_MEMORY_SORT_VECTOR_TEST"

  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/memory/model_memory_pkg.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/memory/model_memory_stimulus.vhd
  vcom -2008 -reportprogress 300 -work work $verification_path/dnc/memory/model_memory_testbench.vhd

  vsim -g /model_memory_testbench/ENABLE_ACCELERATOR_MEMORY_SORT_VECTOR_TEST=true -t ps +notimingchecks -L unisim work.model_memory_testbench

  #MACROS
  add log -r sim:/model_memory_testbench/*

  #WAVES
  view -title model_memory_sort_vector wave
  do $simulation_path/model/dnc/memory/msim/waves/model_memory_sort_vector.do

  force -freeze sim:/model_memory_pkg/STIMULUS_ACCELERATOR_MEMORY_SORT_VECTOR_TEST true 0
  force -freeze sim:/model_memory_pkg/STIMULUS_ACCELERATOR_MEMORY_SORT_VECTOR_CASE_0 true 0

  onbreak {resume}
  run -all

  dataset save sim wlf/model_memory_sort_vector_test.wlf
}

##################################################################################################

alias v01 {
  model_memory_sort_vector_verification_compilation 
}

echo "************************************************************"
echo "v01 . ACCELERATOR-MEMORY-SORT-VECTOR-TEST"
echo "************************************************************"