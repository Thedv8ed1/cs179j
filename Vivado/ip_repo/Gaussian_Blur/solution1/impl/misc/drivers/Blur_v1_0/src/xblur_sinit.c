// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xblur.h"

extern XBlur_Config XBlur_ConfigTable[];

XBlur_Config *XBlur_LookupConfig(u16 DeviceId) {
	XBlur_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBLUR_NUM_INSTANCES; Index++) {
		if (XBlur_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBlur_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBlur_Initialize(XBlur *InstancePtr, u16 DeviceId) {
	XBlur_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBlur_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBlur_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

