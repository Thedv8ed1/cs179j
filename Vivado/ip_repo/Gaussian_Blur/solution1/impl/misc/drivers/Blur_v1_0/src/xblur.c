// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xblur.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBlur_CfgInitialize(XBlur *InstancePtr, XBlur_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBlur_Set_w(XBlur *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBlur_WriteReg(InstancePtr->Control_BaseAddress, XBLUR_CONTROL_ADDR_W_DATA, Data);
}

u32 XBlur_Get_w(XBlur *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBlur_ReadReg(InstancePtr->Control_BaseAddress, XBLUR_CONTROL_ADDR_W_DATA);
    return Data;
}

void XBlur_Set_h(XBlur *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBlur_WriteReg(InstancePtr->Control_BaseAddress, XBLUR_CONTROL_ADDR_H_DATA, Data);
}

u32 XBlur_Get_h(XBlur *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBlur_ReadReg(InstancePtr->Control_BaseAddress, XBLUR_CONTROL_ADDR_H_DATA);
    return Data;
}

