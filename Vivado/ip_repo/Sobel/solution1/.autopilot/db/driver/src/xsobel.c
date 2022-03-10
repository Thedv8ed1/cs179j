// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsobel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSobel_CfgInitialize(XSobel *InstancePtr, XSobel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSobel_Set_w(XSobel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_CONTROL_ADDR_W_DATA, Data);
}

u32 XSobel_Get_w(XSobel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_CONTROL_ADDR_W_DATA);
    return Data;
}

void XSobel_Set_h(XSobel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_CONTROL_ADDR_H_DATA, Data);
}

u32 XSobel_Get_h(XSobel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_CONTROL_ADDR_H_DATA);
    return Data;
}

