set moduleName Loop_Border_proc
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
set C_modelName {Loop_Border_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ h int 32 regular {fifo 0}  }
	{ w int 32 regular {fifo 0}  }
	{ vconv_xlim_loc int 32 regular {fifo 0}  }
	{ out_data_V_data_V int 24 regular {axi_s 1 volatile  { out_data Data } }  }
	{ out_data_V_keep_V int 3 regular {axi_s 1 volatile  { out_data Keep } }  }
	{ out_data_V_strb_V int 3 regular {axi_s 1 volatile  { out_data Strb } }  }
	{ out_data_V_user_V int 1 regular {axi_s 1 volatile  { out_data User } }  }
	{ out_data_V_last_V int 1 regular {axi_s 1 volatile  { out_data Last } }  }
	{ out_data_V_id_V int 1 regular {axi_s 1 volatile  { out_data ID } }  }
	{ out_data_V_dest_V int 1 regular {axi_s 1 volatile  { out_data Dest } }  }
	{ vconv int 24 regular {fifo 0 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "h", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "w", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "vconv_xlim_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_data_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_data_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_data_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_data_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_data_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_data_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "vconv", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
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
	{ vconv_xlim_loc_dout sc_in sc_lv 32 signal 2 } 
	{ vconv_xlim_loc_empty_n sc_in sc_logic 1 signal 2 } 
	{ vconv_xlim_loc_read sc_out sc_logic 1 signal 2 } 
	{ out_data_TDATA sc_out sc_lv 24 signal 3 } 
	{ out_data_TVALID sc_out sc_logic 1 outvld 9 } 
	{ out_data_TREADY sc_in sc_logic 1 outacc 9 } 
	{ out_data_TKEEP sc_out sc_lv 3 signal 4 } 
	{ out_data_TSTRB sc_out sc_lv 3 signal 5 } 
	{ out_data_TUSER sc_out sc_lv 1 signal 6 } 
	{ out_data_TLAST sc_out sc_lv 1 signal 7 } 
	{ out_data_TID sc_out sc_lv 1 signal 8 } 
	{ out_data_TDEST sc_out sc_lv 1 signal 9 } 
	{ vconv_dout sc_in sc_lv 24 signal 10 } 
	{ vconv_empty_n sc_in sc_logic 1 signal 10 } 
	{ vconv_read sc_out sc_logic 1 signal 10 } 
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
 	{ "name": "vconv_xlim_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vconv_xlim_loc", "role": "dout" }} , 
 	{ "name": "vconv_xlim_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc", "role": "empty_n" }} , 
 	{ "name": "vconv_xlim_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv_xlim_loc", "role": "read" }} , 
 	{ "name": "out_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "out_data_V_data_V", "role": "default" }} , 
 	{ "name": "out_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_data_V_keep_V", "role": "default" }} , 
 	{ "name": "out_data_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_data_V_strb_V", "role": "default" }} , 
 	{ "name": "out_data_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_user_V", "role": "default" }} , 
 	{ "name": "out_data_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_last_V", "role": "default" }} , 
 	{ "name": "out_data_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_id_V", "role": "default" }} , 
 	{ "name": "out_data_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_dest_V", "role": "default" }} , 
 	{ "name": "vconv_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "vconv", "role": "dout" }} , 
 	{ "name": "vconv_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv", "role": "empty_n" }} , 
 	{ "name": "vconv_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vconv", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "Loop_Border_proc",
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
		"Port" : [
			{"Name" : "h", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "w_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv_xlim_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "vconv_xlim_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_data_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_data_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "vconv", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "vconv_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.borderbuf_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_32ns_64_2_1_U51", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_data_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_keep_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_strb_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_user_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_last_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_id_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Loop_Border_proc {
		h {Type I LastRead 0 FirstWrite -1}
		w {Type I LastRead 0 FirstWrite -1}
		vconv_xlim_loc {Type I LastRead 0 FirstWrite -1}
		out_data_V_data_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_keep_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_strb_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_user_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_last_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_id_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_dest_V {Type O LastRead -1 FirstWrite 6}
		vconv {Type I LastRead 4 FirstWrite -1}}}

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
	w { ap_fifo {  { w_dout fifo_data 0 32 }  { w_empty_n fifo_status 0 1 }  { w_read fifo_update 1 1 } } }
	vconv_xlim_loc { ap_fifo {  { vconv_xlim_loc_dout fifo_data 0 32 }  { vconv_xlim_loc_empty_n fifo_status 0 1 }  { vconv_xlim_loc_read fifo_update 1 1 } } }
	out_data_V_data_V { axis {  { out_data_TDATA out_data 1 24 } } }
	out_data_V_keep_V { axis {  { out_data_TKEEP out_data 1 3 } } }
	out_data_V_strb_V { axis {  { out_data_TSTRB out_data 1 3 } } }
	out_data_V_user_V { axis {  { out_data_TUSER out_data 1 1 } } }
	out_data_V_last_V { axis {  { out_data_TLAST out_data 1 1 } } }
	out_data_V_id_V { axis {  { out_data_TID out_data 1 1 } } }
	out_data_V_dest_V { axis {  { out_data_TVALID out_vld 1 1 }  { out_data_TREADY out_acc 0 1 }  { out_data_TDEST out_data 1 1 } } }
	vconv { ap_fifo {  { vconv_dout fifo_data 0 24 }  { vconv_empty_n fifo_status 0 1 }  { vconv_read fifo_update 1 1 } } }
}
