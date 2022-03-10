set moduleName Loop_HConvH_proc8
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
set C_modelName {Loop_HConvH_proc8}
set C_modelType { void 0 }
set C_modelArgList {
	{ h int 32 regular {fifo 0}  }
	{ w int 32 regular {fifo 0}  }
	{ in_data_V_data_V int 8 regular {axi_s 0 volatile  { in_data Data } }  }
	{ in_data_V_keep_V int 1 regular {axi_s 0 volatile  { in_data Keep } }  }
	{ in_data_V_strb_V int 1 regular {axi_s 0 volatile  { in_data Strb } }  }
	{ in_data_V_user_V int 1 regular {axi_s 0 volatile  { in_data User } }  }
	{ in_data_V_last_V int 1 regular {axi_s 0 volatile  { in_data Last } }  }
	{ in_data_V_id_V int 1 regular {axi_s 0 volatile  { in_data ID } }  }
	{ in_data_V_dest_V int 1 regular {axi_s 0 volatile  { in_data Dest } }  }
	{ hconv int 8 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "h", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "w", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_data_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "in_data_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_data_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_data_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_data_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_data_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "hconv", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
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
	{ w_dout sc_in sc_lv 32 signal 1 } 
	{ w_empty_n sc_in sc_logic 1 signal 1 } 
	{ w_read sc_out sc_logic 1 signal 1 } 
	{ in_data_TDATA sc_in sc_lv 8 signal 2 } 
	{ in_data_TVALID sc_in sc_logic 1 invld 8 } 
	{ in_data_TREADY sc_out sc_logic 1 inacc 8 } 
	{ in_data_TKEEP sc_in sc_lv 1 signal 3 } 
	{ in_data_TSTRB sc_in sc_lv 1 signal 4 } 
	{ in_data_TUSER sc_in sc_lv 1 signal 5 } 
	{ in_data_TLAST sc_in sc_lv 1 signal 6 } 
	{ in_data_TID sc_in sc_lv 1 signal 7 } 
	{ in_data_TDEST sc_in sc_lv 1 signal 8 } 
	{ hconv_din sc_out sc_lv 8 signal 9 } 
	{ hconv_full_n sc_in sc_logic 1 signal 9 } 
	{ hconv_write sc_out sc_logic 1 signal 9 } 
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
 	{ "name": "w_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "w", "role": "dout" }} , 
 	{ "name": "w_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w", "role": "empty_n" }} , 
 	{ "name": "w_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "w", "role": "read" }} , 
 	{ "name": "in_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_data_V_data_V", "role": "default" }} , 
 	{ "name": "in_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "in_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "in_data_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_keep_V", "role": "default" }} , 
 	{ "name": "in_data_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_strb_V", "role": "default" }} , 
 	{ "name": "in_data_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_user_V", "role": "default" }} , 
 	{ "name": "in_data_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_last_V", "role": "default" }} , 
 	{ "name": "in_data_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_id_V", "role": "default" }} , 
 	{ "name": "in_data_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "hconv_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "hconv", "role": "din" }} , 
 	{ "name": "hconv_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hconv", "role": "full_n" }} , 
 	{ "name": "hconv_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hconv", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "Loop_HConvH_proc8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "2070605",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "h", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "w_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_data_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_data_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_id_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_dest_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "hconv", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "hconv_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_32ns_64_2_1_U10", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_id_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_HConvH_proc8 {
		h {Type I LastRead 0 FirstWrite -1}
		w {Type I LastRead 0 FirstWrite -1}
		in_data_V_data_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_keep_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_strb_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_user_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_last_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_id_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_dest_V {Type I LastRead 3 FirstWrite -1}
		hconv {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "2070605"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "2070605"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	h { ap_fifo {  { h_dout fifo_data 0 32 }  { h_empty_n fifo_status 0 1 }  { h_read fifo_update 1 1 } } }
	w { ap_fifo {  { w_dout fifo_data 0 32 }  { w_empty_n fifo_status 0 1 }  { w_read fifo_update 1 1 } } }
	in_data_V_data_V { axis {  { in_data_TDATA in_data 0 8 } } }
	in_data_V_keep_V { axis {  { in_data_TKEEP in_data 0 1 } } }
	in_data_V_strb_V { axis {  { in_data_TSTRB in_data 0 1 } } }
	in_data_V_user_V { axis {  { in_data_TUSER in_data 0 1 } } }
	in_data_V_last_V { axis {  { in_data_TLAST in_data 0 1 } } }
	in_data_V_id_V { axis {  { in_data_TID in_data 0 1 } } }
	in_data_V_dest_V { axis {  { in_data_TVALID in_vld 0 1 }  { in_data_TREADY in_acc 1 1 }  { in_data_TDEST in_data 0 1 } } }
	hconv { ap_fifo {  { hconv_din fifo_data 1 8 }  { hconv_full_n fifo_status 0 1 }  { hconv_write fifo_update 1 1 } } }
}
