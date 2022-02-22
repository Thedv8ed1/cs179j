// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xinvert_color.h"

extern XInvert_color_Config XInvert_color_ConfigTable[];

XInvert_color_Config *XInvert_color_LookupConfig(u16 DeviceId) {
	XInvert_color_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XINVERT_COLOR_NUM_INSTANCES; Index++) {
		if (XInvert_color_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XInvert_color_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XInvert_color_Initialize(XInvert_color *InstancePtr, u16 DeviceId) {
	XInvert_color_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XInvert_color_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XInvert_color_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

