set moduleName Loop_VConvH_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Loop_VConvH_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ h int 32 regular {fifo 0}  }
	{ vconv_xlim_loc int 32 regular {fifo 0}  }
	{ hconv int 24 regular {fifo 0 volatile }  }
	{ vconv int 24 regular {fifo 1 volatile }  }
	{ h_out int 32 regular {fifo 1}  }
	{ vconv_xlim_loc_out int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "h", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "vconv_xlim_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "hconv", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "vconv", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "h_out", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "vconv_xlim_loc_out", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ h_dout sc_in sc_lv 32 signal 0 } 
	{ h_empty_n sc_in sc_logic 1 signal 0 } 
	{ h_read sc_out sc_logic 1 signal 0 } 
	{ vconv_xlim_loc_dout sc_in sc_lv 32 signal 1 } 
	{ vconv_xlim_loc_empty_n sc_in sc_logic 1 signal 1 } 
	{ vconv_xlim_loc_read sc_out sc_logic 1 signal 1 } 
	{ hconv_dout sc_in sc_lv 24 signal 2 } 
	{ hconv_empty_n sc_in sc_logic 1 signal 2 } 
	{ hconv_read sc_out sc_logic 1 signal 2 } 
	{ vconv_din sc_out sc_lv 24 signal 3 } 
	{ vconv_full_n sc_in sc_logic 1 signal 3 } 
	{ vconv_write sc_out sc_logic 1 signal 3 } 
	{ h_out_din sc_out sc_lv 32 signal 4 } 
	{ h_out_full_n sc_in sc_logic 1 signal 4 } 
	{ h_out_write sc_out sc_logic 1 signal 4 } 
	{ vconv_xlim_loc_out_din sc_out sc_lv 32 signal 5 } 
	{ vconv_xlim_loc_out_full_n sc_in sc_logic 1 signal 5 } 
	{ vconv_xlim_loc_out_write sc_out sc_logic 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "h_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h", "role": "dout" }} , 
 	{ "name": "h_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "empty_n" }} , 
 	{ "name": "h_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h", "role": "read" }} , 
 	{ "name": "vconv_xlim_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vconv_xlim_loc", "role": "dout" }} , 
 	{ "name": "vconv_xlim_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc", "role": "empty_n" }} , 
 	{ "name": "vconv_xlim_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc", "role": "read" }} , 
 	{ "name": "hconv_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "hconv", "role": "dout" }} , 
 	{ "name": "hconv_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hconv", "role": "empty_n" }} , 
 	{ "name": "hconv_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hconv", "role": "read" }} , 
 	{ "name": "vconv_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "vconv", "role": "din" }} , 
 	{ "name": "vconv_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv", "role": "full_n" }} , 
 	{ "name": "vconv_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv", "role": "write" }} , 
 	{ "name": "h_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h_out", "role": "din" }} , 
 	{ "name": "h_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h_out", "role": "full_n" }} , 
 	{ "name": "h_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h_out", "role": "write" }} , 
 	{ "name": "vconv_xlim_loc_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vconv_xlim_loc_out", "role": "din" }} , 
 	{ "name": "vconv_xlim_loc_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc_out", "role": "full_n" }} , 
 	{ "name": "vconv_xlim_loc_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"],
		"CDFG" : "Loop_VConvH_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"DependenceCheck" : [
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_53", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_85", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_0_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_105", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_105", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_0_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_55", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_92", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_1_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_113", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_113", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_1_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_105", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_105", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_0_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_53", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_85", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_0_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_57", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_106", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_2_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_130", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_130", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_2_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_113", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_113", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_1_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_55", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_92", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_1_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_59", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_114", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_3_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_135", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_135", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_3_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_130", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_130", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_2_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_57", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_106", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_2_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_61", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_131", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_4_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_143", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_143", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_4_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_135", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_135", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_3_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_59", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_114", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_3_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_63", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_136", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_5_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_151", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_151", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_5_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_143", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_143", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_4_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_61", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_131", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_4_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_65", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_144", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_6_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_168", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_168", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_6_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_151", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_151", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_5_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_63", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_136", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_5_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_67", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_152", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_7_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_173", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_173", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_7_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_168", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_168", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_6_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_65", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_144", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_6_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_69", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_169", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_8_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_181", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_181", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_8_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_173", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_173", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_7_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_67", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_152", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_7_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_71", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_174", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_9_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_189", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_189", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_9_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_181", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_181", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_8_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_69", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_169", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_8_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_73", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_182", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_10_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_197", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_197", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_10_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_189", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_189", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_9_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_71", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_174", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_9_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_75", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_190", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_11_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_205", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_205", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_11_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_197", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_197", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_10_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_73", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_182", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_10_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_77", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_198", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_12_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_216", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_216", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_12_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_205", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_205", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_11_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_75", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_190", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_11_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_79", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_206", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_13_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter2", "ToInitialOperation" : "ap_enable_operation_227", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_227", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_13_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_216", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_216", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_12_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_77", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_198", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_12_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_227", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_227", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_13_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_79", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_206", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_13_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Gaussian_Blur/blur.cpp:65:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]}],
		"Port" : [
			{"Name" : "h", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv_xlim_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "vconv_xlim_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "hconv", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "hconv_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "vconv_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "h_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv_xlim_loc_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "vconv_xlim_loc_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linebuf_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_13", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_7_max_dsp_1_U37", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_7_max_dsp_1_U38", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_7_max_dsp_1_U39", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.uitodp_32ns_64_6_no_dsp_1_U40", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.uitodp_32ns_64_6_no_dsp_1_U41", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.uitodp_32ns_64_6_no_dsp_1_U42", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_32ns_64_2_1_U43", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VConvH_proc {
		h {Type I LastRead 0 FirstWrite -1}
		vconv_xlim_loc {Type I LastRead 0 FirstWrite -1}
		hconv {Type I LastRead 4 FirstWrite -1}
		vconv {Type O LastRead -1 FirstWrite 24}
		h_out {Type O LastRead -1 FirstWrite 0}
		vconv_xlim_loc_out {Type O LastRead -1 FirstWrite 0}
		linebuf_V_0 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_1 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_2 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_3 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_4 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_5 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_6 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_7 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_8 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_9 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_10 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_11 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_12 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_13 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	h { ap_fifo {  { h_dout fifo_data 0 32 }  { h_empty_n fifo_status 0 1 }  { h_read fifo_update 1 1 } } }
	vconv_xlim_loc { ap_fifo {  { vconv_xlim_loc_dout fifo_data 0 32 }  { vconv_xlim_loc_empty_n fifo_status 0 1 }  { vconv_xlim_loc_read fifo_update 1 1 } } }
	hconv { ap_fifo {  { hconv_dout fifo_data 0 24 }  { hconv_empty_n fifo_status 0 1 }  { hconv_read fifo_update 1 1 } } }
	vconv { ap_fifo {  { vconv_din fifo_data 1 24 }  { vconv_full_n fifo_status 0 1 }  { vconv_write fifo_update 1 1 } } }
	h_out { ap_fifo {  { h_out_din fifo_data 1 32 }  { h_out_full_n fifo_status 0 1 }  { h_out_write fifo_update 1 1 } } }
	vconv_xlim_loc_out { ap_fifo {  { vconv_xlim_loc_out_din fifo_data 1 32 }  { vconv_xlim_loc_out_full_n fifo_status 0 1 }  { vconv_xlim_loc_out_write fifo_update 1 1 } } }
}
