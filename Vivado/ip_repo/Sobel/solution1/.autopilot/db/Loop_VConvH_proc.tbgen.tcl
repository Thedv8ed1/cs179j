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
	{ hconv int 8 regular {fifo 0 volatile }  }
	{ vconv int 8 regular {fifo 1 volatile }  }
	{ h_out int 32 regular {fifo 1}  }
	{ vconv_xlim_loc_out int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "h", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "vconv_xlim_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "hconv", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "vconv", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
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
	{ hconv_dout sc_in sc_lv 8 signal 2 } 
	{ hconv_empty_n sc_in sc_logic 1 signal 2 } 
	{ hconv_read sc_out sc_logic 1 signal 2 } 
	{ vconv_din sc_out sc_lv 8 signal 3 } 
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
 	{ "name": "hconv_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hconv", "role": "dout" }} , 
 	{ "name": "hconv_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hconv", "role": "empty_n" }} , 
 	{ "name": "hconv_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hconv", "role": "read" }} , 
 	{ "name": "vconv_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vconv", "role": "din" }} , 
 	{ "name": "vconv_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv", "role": "full_n" }} , 
 	{ "name": "vconv_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv", "role": "write" }} , 
 	{ "name": "h_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "h_out", "role": "din" }} , 
 	{ "name": "h_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h_out", "role": "full_n" }} , 
 	{ "name": "h_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "h_out", "role": "write" }} , 
 	{ "name": "vconv_xlim_loc_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vconv_xlim_loc_out", "role": "din" }} , 
 	{ "name": "vconv_xlim_loc_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc_out", "role": "full_n" }} , 
 	{ "name": "vconv_xlim_loc_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
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
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_41", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_50", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_1_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "null", "ToInitialOperation" : "ap_enable_operation_52", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_52", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_1_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Sobel/Sobel.cpp:58:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_52", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_52", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_1_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_41", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_50", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_1_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Sobel/Sobel.cpp:58:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]}],
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
			{"Name" : "linebuf_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_0", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.linebuf_V_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_32ns_64_2_1_U29", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_VConvH_proc {
		h {Type I LastRead 0 FirstWrite -1}
		vconv_xlim_loc {Type I LastRead 0 FirstWrite -1}
		hconv {Type I LastRead 4 FirstWrite -1}
		vconv {Type O LastRead -1 FirstWrite 4}
		h_out {Type O LastRead -1 FirstWrite 0}
		vconv_xlim_loc_out {Type O LastRead -1 FirstWrite 0}
		linebuf_V_1 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_0 {Type O LastRead -1 FirstWrite -1}}}

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
	hconv { ap_fifo {  { hconv_dout fifo_data 0 8 }  { hconv_empty_n fifo_status 0 1 }  { hconv_read fifo_update 1 1 } } }
	vconv { ap_fifo {  { vconv_din fifo_data 1 8 }  { vconv_full_n fifo_status 0 1 }  { vconv_write fifo_update 1 1 } } }
	h_out { ap_fifo {  { h_out_din fifo_data 1 32 }  { h_out_full_n fifo_status 0 1 }  { h_out_write fifo_update 1 1 } } }
	vconv_xlim_loc_out { ap_fifo {  { vconv_xlim_loc_out_din fifo_data 1 32 }  { vconv_xlim_loc_out_full_n fifo_status 0 1 }  { vconv_xlim_loc_out_write fifo_update 1 1 } } }
}
