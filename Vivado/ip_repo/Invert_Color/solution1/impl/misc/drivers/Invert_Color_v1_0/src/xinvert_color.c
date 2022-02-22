// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xinvert_color.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XInvert_color_CfgInitialize(XInvert_color *InstancePtr, XInvert_color_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XInvert_color_Set_a(XInvert_color *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInvert_color_WriteReg(InstancePtr->Control_BaseAddress, XINVERT_COLOR_CONTROL_ADDR_A_DATA, Data);
}

u32 XInvert_color_Get_a(XInvert_color *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInvert_color_ReadReg(InstancePtr->Control_BaseAddress, XINVERT_COLOR_CONTROL_ADDR_A_DATA);
    return Data;
}

