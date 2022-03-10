// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmux.h"

extern XMux_Config XMux_ConfigTable[];

XMux_Config *XMux_LookupConfig(u16 DeviceId) {
	XMux_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMUX_NUM_INSTANCES; Index++) {
		if (XMux_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMux_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMux_Initialize(XMux *InstancePtr, u16 DeviceId) {
	XMux_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMux_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMux_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

