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
// Permission is hereby granted, free of charge, to any person obtaining x copy  //
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

package MatrixMath

func MatrixConvolution(data_a_in [][]float64, data_b_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_a_in))
  for i, x := range data_a_in {
    for j, _ := range x {
      data_out[i] = append(data_out[i], data_a_in[i][j] * data_b_in[i][j])
    }
  }
  return data_out
}

func MatrixInverse(data_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_in))
  for i, a := range data_in {
    for j, _ := range a {
      data_out[i] = append(data_out[i], data_in[j][i])
    }
  }
  return data_out
}

func MatrixMultiplication(data_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_in))
  for i, a := range data_in {
    for j, _ := range a {
      data_out[i] = append(data_out[i], data_in[j][i])
    }
  }
  return data_out
}

func MatrixProduct(data_a_in [][]float64, data_b_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_a_in))
  for i, x := range data_a_in {
    for j, _ := range x {
      data_out[i] = append(data_out[i], data_a_in[i][j] * data_b_in[i][j])
    }
  }
  return data_out
}

func MatrixSummation(data_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_in))
  for i, a := range data_in {
    for j, _ := range a {
      data_out[i] = append(data_out[i], data_in[j][i])
    }
  }
  return data_out
}

func MatrixTranspose(data_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_in))
  for i, a := range data_in {
    for j, _ := range a {
      data_out[i] = append(data_out[i], data_in[j][i])
    }
  }
  return data_out
}

func MatrixDifferentiation(data_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_in))
  for i, x := range data_in {
    for j, _ := range x {
      data_out[i] = append(data_out[i], data_in[i][j])
    }
  }
  return data_out
}

func MatrixIntegration(data_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_in))
  for i, x := range data_in {
    for j, _ := range x {
      data_out[i] = append(data_out[i], data_in[i][j])
    }
  }
  return data_out
}

func MatrixSoftmax(data_in [][]float64) [][]float64 {
  data_out := make([][]float64, len(data_in))
  for i, x := range data_in {
    for j, _ := range x {
      data_out[i] = append(data_out[i], data_in[i][j])
    }
  }
  return data_out
}
