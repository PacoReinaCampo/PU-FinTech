```
code
├── arithmetic
│   ├── matrix
│   │   ├── **ntm_matrix_adder.rs**
│   │   ├── **ntm_matrix_divider.rs**
│   │   └── **ntm_matrix_multiplier.rs**
│   ├── scalar
│   │   ├── **ntm_scalar_adder.rs**
│   │   ├── **ntm_scalar_divider.rs**
│   │   └── **ntm_scalar_multiplier.rs**
│   ├── tensor
│   │   ├── **ntm_tensor_adder.rs**
│   │   ├── **ntm_tensor_divider.rs**
│   │   └── **ntm_tensor_multiplier.rs**
│   └── vector
│       ├── **ntm_vector_adder.rs**
│       ├── **ntm_vector_divider.rs**
│       └── **ntm_vector_multiplier.rs**
├── controller
│   ├── FNN
│   │   ├── convolutional
│   │   │   └── ntm_controller.rs
│   │   └── standard
│   │       └── ntm_controller.rs
│   ├── LSTM
│   │   ├── convolutional
│   │   │   ├── ntm_activation_gate_vector.rs
│   │   │   ├── ntm_controller.rs
│   │   │   ├── ntm_forget_gate_vector.rs
│   │   │   ├── ntm_hidden_gate_vector.rs
│   │   │   ├── ntm_input_gate_vector.rs
│   │   │   ├── ntm_output_gate_vector.rs
│   │   │   └── ntm_state_gate_vector.rs
│   │   └── standard
│   │       ├── ntm_activation_gate_vector.rs
│   │       ├── ntm_controller.rs
│   │       ├── ntm_forget_gate_vector.rs
│   │       ├── ntm_hidden_gate_vector.rs
│   │       ├── ntm_input_gate_vector.rs
│   │       ├── ntm_output_gate_vector.rs
│   │       └── ntm_state_gate_vector.rs
│   └── transformer
│       ├── components
│       │   ├── ntm_masked_multi_head_attention.rs
│       │   ├── ntm_masked_scaled_dot_product_attention.rs
│       │   ├── ntm_multi_head_attention.rs
│       │   └── ntm_scaled_dot_product_attention.rs
│       ├── fnn
│       │   └── ntm_fnn.rs
│       ├── functions
│       │   ├── ntm_layer_norm.rs
│       │   └── ntm_positional_encoding.rs
│       ├── inputs
│       │   ├── ntm_inputs_vector.rs
│       │   ├── ntm_keys_vector.rs
│       │   ├── ntm_queries_vector.rs
│       │   └── ntm_values_vector.rs
│       ├── lstm
│       │   ├── ntm_activation_gate_vector.rs
│       │   ├── ntm_forget_gate_vector.rs
│       │   ├── ntm_hidden_gate_vector.rs
│       │   ├── ntm_input_gate_vector.rs
│       │   ├── ntm_lstm.rs
│       │   ├── ntm_output_gate_vector.rs
│       │   └── ntm_state_gate_vector.rs
│       └── top
│           ├── ntm_controller.rs
│           ├── ntm_decoder.rs
│           └── ntm_encoder.rs
├── dnc
│   ├── memory
│   │   ├── dnc_addressing.rs
│   │   ├── dnc_allocation_weighting.rs
│   │   ├── dnc_backward_weighting.rs
│   │   ├── dnc_forward_weighting.rs
│   │   ├── dnc_matrix_content_based_addressing.rs
│   │   ├── dnc_memory_matrix.rs
│   │   ├── dnc_memory_retention_vector.rs
│   │   ├── dnc_precedence_weighting.rs
│   │   ├── dnc_read_content_weighting.rs
│   │   ├── dnc_read_vectors.rs
│   │   ├── dnc_read_weighting.rs
│   │   ├── dnc_sort_vector.rs
│   │   ├── dnc_temporal_link_matrix.rs
│   │   ├── dnc_usage_vector.rs
│   │   ├── dnc_vector_content_based_addressing.rs
│   │   ├── dnc_write_content_weighting.rs
│   │   └── dnc_write_weighting.rs
│   ├── top
│   │   ├── dnc_interface_matrix.rs
│   │   ├── dnc_interface_top.rs
│   │   ├── dnc_interface_vector.rs
│   │   ├── dnc_output_vector.rs
│   │   └── dnc_top.rs
│   └── trained
│       └── dnc_trained_top.rs
├── math
│   ├── algebra
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_convolution.rs**
│   │   │   ├── **ntm_matrix_inverse.rs**
│   │   │   ├── **ntm_matrix_multiplication.rs**
│   │   │   ├── **ntm_matrix_product.rs**
│   │   │   ├── **ntm_matrix_summation.rs**
│   │   │   ├── **ntm_matrix_transpose.rs**
│   │   │   ├── **ntm_matrix_vector_convolution.rs**
│   │   │   ├── **ntm_matrix_vector_product.rs**
│   │   │   └── **ntm_transpose_vector_product.rs**
│   │   ├── scalar
│   │   │   ├── **ntm_scalar_multiplication.rs**
│   │   │   └── **ntm_scalar_summation.rs**
│   │   ├── tensor
│   │   │   ├── ntm_tensor_convolution.rs
│   │   │   ├── ntm_tensor_inverse.rs
│   │   │   ├── ntm_tensor_matrix_convolution.rs
│   │   │   ├── ntm_tensor_matrix_product.rs
│   │   │   ├── ntm_tensor_multiplication.rs
│   │   │   ├── ntm_tensor_product.rs
│   │   │   ├── ntm_tensor_summation.rs
│   │   │   └── ntm_tensor_transpose.rs
│   │   └── vector
│   │       ├── **ntm_dot_product.rs**
│   │       ├── **ntm_vector_convolution.rs**
│   │       ├── **ntm_vector_cosine_similarity.rs**
│   │       ├── **ntm_vector_module.rs**
│   │       ├── **ntm_vector_multiplication.rs**
│   │       └── **ntm_vector_summation.rs**
│   ├── calculus
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_differentiation.rs**
│   │   │   ├── **ntm_matrix_integration.rs**
│   │   │   └── **ntm_matrix_softmax.rs**
│   │   ├── tensor
│   │   │   ├── **ntm_tensor_differentiation.rs**
│   │   │   ├── **ntm_tensor_integration.rs**
│   │   │   └── **ntm_tensor_softmax.rs**
│   │   └── vector
│   │       ├── **ntm_vector_differentiation.rs**
│   │       ├── **ntm_vector_integration.rs**
│   │       └── **ntm_vector_softmax.rs**
│   ├── function
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_logistic_function.rs**
│   │   │   └── **ntm_matrix_oneplus_function.rs**
│   │   ├── scalar
│   │   │   ├── **ntm_scalar_logistic_function.rs**
│   │   │   └── **ntm_scalar_oneplus_function.rs**
│   │   └── vector
│   │       ├── **ntm_vector_logistic_function.rs**
│   │       └── **ntm_vector_oneplus_function.rs**
│   └── statitics
│       ├── matrix
│       │   ├── **ntm_matrix_deviation.rs**
│       │   └── **ntm_matrix_mean.rs**
│       ├── scalar
│       │   ├── **ntm_scalar_deviation.rs**
│       │   └── **ntm_scalar_mean.rs**
│       └── vector
│           ├── **ntm_vector_deviation.rs**
│           └── **ntm_vector_mean.rs**
├── ntm
│   ├── memory
│   │   ├── ntm_addressing.rs
│   │   ├── ntm_matrix_content_based_addressing.rs
│   │   └── ntm_vector_content_based_addressing.rs
│   ├── read_heads
│   │   └── ntm_reading.rs
│   ├── top
│   │   ├── ntm_interface_matrix.rs
│   │   ├── ntm_interface_top.rs
│   │   ├── ntm_interface_vector.rs
│   │   ├── ntm_output_vector.rs
│   │   └── ntm_top.rs
│   ├── trained
│   │   └── ntm_trained_top.rs
│   └── write_heads
│       ├── ntm_erasing.rs
│       └── ntm_writing.rs
├── state
│   ├── feedback
│   │   ├── ntm_state_matrix_feedforward.rs
│   │   ├── ntm_state_matrix_input.rs
│   │   ├── ntm_state_matrix_output.rs
│   │   └── ntm_state_matrix_state.rs
│   ├── outputs
│   │   ├── ntm_state_vector_output.rs
│   │   └── ntm_state_vector_state.rs
│   └── top
│       └── ntm_state_top.rs
└── trainer
    ├── differentiation
    │   ├── ntm_matrix_controller_differentiation.rs
    │   └── ntm_vector_controller_differentiation.rs
    ├── FNN
    │   ├── ntm_fnn_b_trainer.rs
    │   ├── ntm_fnn_d_trainer.rs
    │   ├── ntm_fnn_k_trainer.rs
    │   ├── ntm_fnn_trainer.rs
    │   ├── ntm_fnn_u_trainer.rs
    │   ├── ntm_fnn_v_trainer.rs
    │   └── ntm_fnn_w_trainer.rs
    └── LSTM
        ├── activation
        │   ├── ntm_lstm_activation_b_trainer.rs
        │   ├── ntm_lstm_activation_d_trainer.rs
        │   ├── ntm_lstm_activation_k_trainer.rs
        │   ├── ntm_lstm_activation_trainer.rs
        │   ├── ntm_lstm_activation_u_trainer.rs
        │   ├── ntm_lstm_activation_v_trainer.rs
        │   └── ntm_lstm_activation_w_trainer.rs
        ├── forget
        │   ├── ntm_lstm_forget_b_trainer.rs
        │   ├── ntm_lstm_forget_d_trainer.rs
        │   ├── ntm_lstm_forget_k_trainer.rs
        │   ├── ntm_lstm_forget_trainer.rs
        │   ├── ntm_lstm_forget_u_trainer.rs
        │   ├── ntm_lstm_forget_v_trainer.rs
        │   └── ntm_lstm_forget_w_trainer.rs
        ├── input
        │   ├── ntm_lstm_input_b_trainer.rs
        │   ├── ntm_lstm_input_d_trainer.rs
        │   ├── ntm_lstm_input_k_trainer.rs
        │   ├── ntm_lstm_input_trainer.rs
        │   ├── ntm_lstm_input_u_trainer.rs
        │   ├── ntm_lstm_input_v_trainer.rs
        │   └── ntm_lstm_input_w_trainer.rs
        └── output
            ├── ntm_lstm_output_b_trainer.rs
            ├── ntm_lstm_output_d_trainer.rs
            ├── ntm_lstm_output_k_trainer.rs
            ├── ntm_lstm_output_trainer.rs
            ├── ntm_lstm_output_u_trainer.rs
            ├── ntm_lstm_output_v_trainer.rs
            └── ntm_lstm_output_w_trainer.rs
```

59 directories, 174 files