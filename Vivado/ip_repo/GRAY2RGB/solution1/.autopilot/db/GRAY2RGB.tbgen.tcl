set moduleName GRAY2RGB
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {GRAY2RGB}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_data_V_data_V int 8 regular {axi_s 0 volatile  { in_data Data } }  }
	{ in_data_V_keep_V int 1 regular {axi_s 0 volatile  { in_data Keep } }  }
	{ in_data_V_strb_V int 1 regular {axi_s 0 volatile  { in_data Strb } }  }
	{ in_data_V_user_V int 1 regular {axi_s 0 volatile  { in_data User } }  }
	{ in_data_V_last_V int 1 regular {axi_s 0 volatile  { in_data Last } }  }
	{ in_data_V_id_V int 1 regular {axi_s 0 volatile  { in_data ID } }  }
	{ in_data_V_dest_V int 1 regular {axi_s 0 volatile  { in_data Dest } }  }
	{ out_data_V_data_V int 24 regular {axi_s 1 volatile  { out_data Data } }  }
	{ out_data_V_keep_V int 3 regular {axi_s 1 volatile  { out_data Keep } }  }
	{ out_data_V_strb_V int 3 regular {axi_s 1 volatile  { out_data Strb } }  }
	{ out_data_V_user_V int 1 regular {axi_s 1 volatile  { out_data User } }  }
	{ out_data_V_last_V int 1 regular {axi_s 1 volatile  { out_data Last } }  }
	{ out_data_V_id_V int 1 regular {axi_s 1 volatile  { out_data ID } }  }
	{ out_data_V_dest_V int 1 regular {axi_s 1 volatile  { out_data Dest } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_data_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.data.V","cData": "char","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.keep.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.strb.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.user.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.id.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.dest.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.data.V","cData": "int24","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.keep.V","cData": "int3","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.strb.V","cData": "int3","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.user.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.id.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.dest.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_data_TDATA sc_in sc_lv 8 signal 0 } 
	{ in_data_TVALID sc_in sc_logic 1 invld 6 } 
	{ in_data_TREADY sc_out sc_logic 1 inacc 6 } 
	{ in_data_TKEEP sc_in sc_lv 1 signal 1 } 
	{ in_data_TSTRB sc_in sc_lv 1 signal 2 } 
	{ in_data_TUSER sc_in sc_lv 1 signal 3 } 
	{ in_data_TLAST sc_in sc_lv 1 signal 4 } 
	{ in_data_TID sc_in sc_lv 1 signal 5 } 
	{ in_data_TDEST sc_in sc_lv 1 signal 6 } 
	{ out_data_TDATA sc_out sc_lv 24 signal 7 } 
	{ out_data_TVALID sc_out sc_logic 1 outvld 13 } 
	{ out_data_TREADY sc_in sc_logic 1 outacc 13 } 
	{ out_data_TKEEP sc_out sc_lv 3 signal 8 } 
	{ out_data_TSTRB sc_out sc_lv 3 signal 9 } 
	{ out_data_TUSER sc_out sc_lv 1 signal 10 } 
	{ out_data_TLAST sc_out sc_lv 1 signal 11 } 
	{ out_data_TID sc_out sc_lv 1 signal 12 } 
	{ out_data_TDEST sc_out sc_lv 1 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_data_V_data_V", "role": "default" }} , 
 	{ "name": "in_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "in_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "in_data_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_keep_V", "role": "default" }} , 
 	{ "name": "in_data_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_strb_V", "role": "default" }} , 
 	{ "name": "in_data_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_user_V", "role": "default" }} , 
 	{ "name": "in_data_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_last_V", "role": "default" }} , 
 	{ "name": "in_data_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_id_V", "role": "default" }} , 
 	{ "name": "in_data_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "out_data_V_data_V", "role": "default" }} , 
 	{ "name": "out_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_data_V_keep_V", "role": "default" }} , 
 	{ "name": "out_data_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_data_V_strb_V", "role": "default" }} , 
 	{ "name": "out_data_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_user_V", "role": "default" }} , 
 	{ "name": "out_data_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_last_V", "role": "default" }} , 
 	{ "name": "out_data_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_id_V", "role": "default" }} , 
 	{ "name": "out_data_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"],
		"CDFG" : "GRAY2RGB",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "in_data_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_data_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_id_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_data_V_dest_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "out_data_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_data_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_data_V_dest_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_data_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_keep_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_strb_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_user_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_last_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_id_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_dest_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_data_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_keep_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_strb_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_user_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_last_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_id_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_data_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	GRAY2RGB {
		in_data_V_data_V {Type I LastRead 1 FirstWrite -1}
		in_data_V_keep_V {Type I LastRead 1 FirstWrite -1}
		in_data_V_strb_V {Type I LastRead 1 FirstWrite -1}
		in_data_V_user_V {Type I LastRead 1 FirstWrite -1}
		in_data_V_last_V {Type I LastRead 1 FirstWrite -1}
		in_data_V_id_V {Type I LastRead 1 FirstWrite -1}
		in_data_V_dest_V {Type I LastRead 1 FirstWrite -1}
		out_data_V_data_V {Type O LastRead -1 FirstWrite 1}
		out_data_V_keep_V {Type O LastRead -1 FirstWrite 1}
		out_data_V_strb_V {Type O LastRead -1 FirstWrite 1}
		out_data_V_user_V {Type O LastRead -1 FirstWrite 1}
		out_data_V_last_V {Type O LastRead -1 FirstWrite 1}
		out_data_V_id_V {Type O LastRead -1 FirstWrite 1}
		out_data_V_dest_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_data_V_data_V { axis {  { in_data_TDATA in_data 0 8 } } }
	in_data_V_keep_V { axis {  { in_data_TKEEP in_data 0 1 } } }
	in_data_V_strb_V { axis {  { in_data_TSTRB in_data 0 1 } } }
	in_data_V_user_V { axis {  { in_data_TUSER in_data 0 1 } } }
	in_data_V_last_V { axis {  { in_data_TLAST in_data 0 1 } } }
	in_data_V_id_V { axis {  { in_data_TID in_data 0 1 } } }
	in_data_V_dest_V { axis {  { in_data_TVALID in_vld 0 1 }  { in_data_TREADY in_acc 1 1 }  { in_data_TDEST in_data 0 1 } } }
	out_data_V_data_V { axis {  { out_data_TDATA out_data 1 24 } } }
	out_data_V_keep_V { axis {  { out_data_TKEEP out_data 1 3 } } }
	out_data_V_strb_V { axis {  { out_data_TSTRB out_data 1 3 } } }
	out_data_V_user_V { axis {  { out_data_TUSER out_data 1 1 } } }
	out_data_V_last_V { axis {  { out_data_TLAST out_data 1 1 } } }
	out_data_V_id_V { axis {  { out_data_TID out_data 1 1 } } }
	out_data_V_dest_V { axis {  { out_data_TVALID out_vld 1 1 }  { out_data_TREADY out_acc 0 1 }  { out_data_TDEST out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
