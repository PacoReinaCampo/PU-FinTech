#*******************
# DESIGN COMPILATION
#*******************

do variables.do

vlib work

##################################################################################################
# model_convolutional_linear_design_compilation
##################################################################################################

alias model_convolutional_linear_design_compilation {
  vlog -sv -reportprogress 300 -work work $design_path/pkg/model_arithmetic_verilog_pkg.sv
  vlog -sv -reportprogress 300 -work work $design_path/pkg/model_math_verilog_pkg.sv
  vlog -sv -reportprogress 300 -work work $design_path/pkg/model_linear_controller_verilog_pkg.sv

  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/scalar/model_scalar_float_adder.sv
  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/scalar/model_scalar_float_multiplier.sv
  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/scalar/model_scalar_float_divider.sv

  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/vector/model_vector_float_adder.sv
  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/vector/model_vector_float_multiplier.sv
  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/vector/model_vector_float_divider.sv

  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/matrix/model_matrix_float_adder.sv
  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/matrix/model_matrix_float_multiplier.sv
  vlog -sv -reportprogress 300 -work work $design_path/arithmetic/float/matrix/model_matrix_float_divider.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/vector/model_dot_product.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/vector/model_vector_convolution.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/vector/model_vector_cosine_similarity.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/vector/model_vector_multiplication.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/vector/model_vector_summation.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/vector/model_vector_module.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_convolution.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_inverse.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_multiplication.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_product.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_summation.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_transpose.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_vector_convolution.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/matrix/model_matrix_vector_product.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/tensor/model_tensor_convolution.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/tensor/model_tensor_inverse.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/tensor/model_tensor_matrix_convolution.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/tensor/model_tensor_matrix_product.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/tensor/model_tensor_product.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/algebra/tensor/model_tensor_transpose.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/vector/model_vector_differentiation.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/vector/model_vector_integration.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/vector/model_vector_softmax.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/matrix/model_matrix_differentiation.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/matrix/model_matrix_integration.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/matrix/model_matrix_softmax.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/tensor/model_tensor_differentiation.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/tensor/model_tensor_integration.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/calculus/tensor/model_tensor_softmax.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/function/scalar/model_scalar_logistic_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/function/scalar/model_scalar_oneplus_function.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/function/vector/model_vector_logistic_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/function/vector/model_vector_oneplus_function.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/function/matrix/model_matrix_logistic_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/function/matrix/model_matrix_oneplus_function.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/series/scalar/model_scalar_cosh_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/scalar/model_scalar_exponentiator_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/scalar/model_scalar_logarithm_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/scalar/model_scalar_sinh_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/scalar/model_scalar_tanh_function.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/series/vector/model_vector_cosh_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/vector/model_vector_exponentiator_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/vector/model_vector_logarithm_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/vector/model_vector_sinh_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/vector/model_vector_tanh_function.sv

  vlog -sv -reportprogress 300 -work work $design_path/math/series/matrix/model_matrix_cosh_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/matrix/model_matrix_exponentiator_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/matrix/model_matrix_logarithm_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/matrix/model_matrix_sinh_function.sv
  vlog -sv -reportprogress 300 -work work $design_path/math/series/matrix/model_matrix_tanh_function.sv

  vlog -sv -reportprogress 300 -work work $design_path/trainer/linear/model_trainer.sv

  vlog -sv -reportprogress 300 -work work $design_path/state/linear/convolutional/model_controller.sv
}

##################################################################################################

alias d01 {
  model_convolutional_linear_design_compilation
}

echo "****************************************"
echo "d01 . MODEL-CONVOLUTIONAL-LINEAR-TEST"
echo "****************************************"
