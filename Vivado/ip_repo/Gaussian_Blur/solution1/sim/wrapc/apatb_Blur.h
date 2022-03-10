// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_Blur (
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&in_data),
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&out_data),
int w,
int h,
double sigma,
int kernal);
