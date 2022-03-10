// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xmux.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMux_CfgInitialize(XMux *InstancePtr, XMux_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMux_Set_filter_setting(XMux *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMux_WriteReg(InstancePtr->Control_BaseAddress, XMUX_CONTROL_ADDR_FILTER_SETTING_DATA, Data);
}

u32 XMux_Get_filter_setting(XMux *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMux_ReadReg(InstancePtr->Control_BaseAddress, XMUX_CONTROL_ADDR_FILTER_SETTING_DATA);
    return Data;
}

