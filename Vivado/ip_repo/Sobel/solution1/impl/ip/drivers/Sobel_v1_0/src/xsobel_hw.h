// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of w
//        bit 31~0 - w[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of h
//        bit 31~0 - h[31:0] (Read/Write)
// 0x1c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSOBEL_CONTROL_ADDR_W_DATA 0x10
#define XSOBEL_CONTROL_BITS_W_DATA 32
#define XSOBEL_CONTROL_ADDR_H_DATA 0x18
#define XSOBEL_CONTROL_BITS_H_DATA 32

