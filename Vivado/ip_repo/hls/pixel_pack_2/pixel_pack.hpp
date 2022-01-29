// Copyright (C) 2021 Xilinx, Inc
//
// SPDX-License-Identifier: BSD-3-Clause

#include <ap_fixed.h>
#include <ap_int.h>
#include "hls_stream.h"
#include <ap_axi_sdata.h>

typedef ap_axiu<48,1,0,0> narrow_pixel;
typedef ap_axiu<64,1,0,0> wide_pixel;

typedef hls::stream<narrow_pixel> narrow_stream;
typedef hls::stream<wide_pixel> wide_stream;

#define V_24 0
#define V_32 1
#define V_8 2
#define V_16 3
#define V_16C 4

void pixel_pack_2(narrow_stream& stream_in_48, wide_stream& stream_out_64,
                int mode, ap_uint<8> alpha);