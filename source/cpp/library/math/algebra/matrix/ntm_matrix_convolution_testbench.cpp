///////////////////////////////////////////////////////////////////////////////////
//                                            __ _      _     _                  //
//                                           / _(_)    | |   | |                 //
//                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 //
//               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 //
//              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 //
//               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 //
//                  | |                                                          //
//                  |_|                                                          //
//                                                                               //
//                                                                               //
//              Peripheral-NTM for MPSoC                                         //
//              Neural Turing Machine for MPSoC                                  //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
//                                                                               //
// Copyright (c) 2020-2024 by the author(s)                                      //
//                                                                               //
// Permission is hereby granted, free of charge, to any person obtaining a copy  //
// of this software and associated documentation files (the "Software"), to deal //
// in the Software without restriction, including without limitation the rights  //
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     //
// copies of the Software, and to permit persons to whom the Software is         //
// furnished to do so, subject to the following conditions:                      //
//                                                                               //
// The above copyright notice and this permission notice shall be included in    //
// all copies or substantial portions of the Software.                           //
//                                                                               //
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    //
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      //
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   //
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        //
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, //
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     //
// THE SOFTWARE.                                                                 //
//                                                                               //
// ============================================================================= //
// Author(s):                                                                    //
//   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////

#include "systemc.h"
#include "ntm_matrix_convolution_design.cpp"

int sc_main(int argc, char *argv[]) {
  matrix_convolution matrix_convolution("MATRIX_CONVOLUTION");

  sc_signal<bool> clock;
  sc_signal<sc_int<4>> data_a_in[4][4];
  sc_signal<sc_int<4>> data_b_in[4][4];
  sc_signal<sc_int<4>> data_out[4][4];

  matrix_convolution.clock(clock);

  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      matrix_convolution.data_a_in[i][j](data_a_in[i][j]);
      matrix_convolution.data_b_in[i][j](data_b_in[i][j]);

      matrix_convolution.data_out[i][j](data_out[i][j]);
    }
  }

  for(int i=0; i<4; i++) {
    for(int j=0; j<4; j++) {
      data_a_in[i][j] = i + j;
      data_b_in[i][j] = i - j;
    }
  }

  clock = 0;
  sc_start(1, SC_NS);
  clock = 1;
  sc_start(1, SC_NS);

  for(int i=0; i<4; i++) {
    for(int j=0; j<4; j++) {
      cout << "@" << sc_time_stamp() << ": data_out[" << i << ", " << j << "] = " << data_out[i][j].read() << endl;
    }
  }

  return 0;
}
