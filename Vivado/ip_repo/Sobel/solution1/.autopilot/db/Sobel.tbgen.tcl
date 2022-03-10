set moduleName Sobel
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Sobel}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_data_V_data_V int 8 regular {axi_s 0 volatile  { in_data Data } }  }
	{ in_data_V_keep_V int 1 regular {axi_s 0 volatile  { in_data Keep } }  }
	{ in_data_V_strb_V int 1 regular {axi_s 0 volatile  { in_data Strb } }  }
	{ in_data_V_user_V int 1 regular {axi_s 0 volatile  { in_data User } }  }
	{ in_data_V_last_V int 1 regular {axi_s 0 volatile  { in_data Last } }  }
	{ in_data_V_id_V int 1 regular {axi_s 0 volatile  { in_data ID } }  }
	{ in_data_V_dest_V int 1 regular {axi_s 0 volatile  { in_data Dest } }  }
	{ out_data_V_data_V int 8 regular {axi_s 1 volatile  { out_data Data } }  }
	{ out_data_V_keep_V int 1 regular {axi_s 1 volatile  { out_data Keep } }  }
	{ out_data_V_strb_V int 1 regular {axi_s 1 volatile  { out_data Strb } }  }
	{ out_data_V_user_V int 1 regular {axi_s 1 volatile  { out_data User } }  }
	{ out_data_V_last_V int 1 regular {axi_s 1 volatile  { out_data Last } }  }
	{ out_data_V_id_V int 1 regular {axi_s 1 volatile  { out_data ID } }  }
	{ out_data_V_dest_V int 1 regular {axi_s 1 volatile  { out_data Dest } }  }
	{ w int 32 regular {axi_slave 0}  }
	{ h int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_data_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.data.V","cData": "char","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.keep.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.strb.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.user.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.id.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_data_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V.dest.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_data_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.data.V","cData": "char","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_keep_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.keep.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_strb_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.strb.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.user.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.id.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_data_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_data.V.dest.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "w", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "w","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "h", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "h","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_data_TDATA sc_in sc_lv 8 signal 0 } 
	{ in_data_TKEEP sc_in sc_lv 1 signal 1 } 
	{ in_data_TSTRB sc_in sc_lv 1 signal 2 } 
	{ in_data_TUSER sc_in sc_lv 1 signal 3 } 
	{ in_data_TLAST sc_in sc_lv 1 signal 4 } 
	{ in_data_TID sc_in sc_lv 1 signal 5 } 
	{ in_data_TDEST sc_in sc_lv 1 signal 6 } 
	{ out_data_TDATA sc_out sc_lv 8 signal 7 } 
	{ out_data_TKEEP sc_out sc_lv 1 signal 8 } 
	{ out_data_TSTRB sc_out sc_lv 1 signal 9 } 
	{ out_data_TUSER sc_out sc_lv 1 signal 10 } 
	{ out_data_TLAST sc_out sc_lv 1 signal 11 } 
	{ out_data_TID sc_out sc_lv 1 signal 12 } 
	{ out_data_TDEST sc_out sc_lv 1 signal 13 } 
	{ in_data_TVALID sc_in sc_logic 1 invld 6 } 
	{ in_data_TREADY sc_out sc_logic 1 inacc 6 } 
	{ out_data_TVALID sc_out sc_logic 1 outvld 13 } 
	{ out_data_TREADY sc_in sc_logic 1 outacc 13 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"w","role":"data","value":"16"},{"name":"h","role":"data","value":"24"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_data_V_data_V", "role": "default" }} , 
 	{ "name": "in_data_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_keep_V", "role": "default" }} , 
 	{ "name": "in_data_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_strb_V", "role": "default" }} , 
 	{ "name": "in_data_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_user_V", "role": "default" }} , 
 	{ "name": "in_data_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_last_V", "role": "default" }} , 
 	{ "name": "in_data_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_id_V", "role": "default" }} , 
 	{ "name": "in_data_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_data_V_data_V", "role": "default" }} , 
 	{ "name": "out_data_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_keep_V", "role": "default" }} , 
 	{ "name": "out_data_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_strb_V", "role": "default" }} , 
 	{ "name": "out_data_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_user_V", "role": "default" }} , 
 	{ "name": "out_data_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_last_V", "role": "default" }} , 
 	{ "name": "out_data_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_id_V", "role": "default" }} , 
 	{ "name": "out_data_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_data_V_dest_V", "role": "default" }} , 
 	{ "name": "in_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "in_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_data_V_dest_V", "role": "default" }} , 
 	{ "name": "out_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_data_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "13", "17", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40"],
		"CDFG" : "Sobel",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "2", "Name" : "Sobel_entry9_U0"}],
		"OutputProcess" : [
			{"ID" : "17", "Name" : "Loop_Border_proc_U0"}],
		"Port" : [
			{"Name" : "in_data_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Loop_HConvH_proc8_U0", "Port" : "in_data_V_data_V"}]},
			{"Name" : "in_data_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Loop_HConvH_proc8_U0", "Port" : "in_data_V_keep_V"}]},
			{"Name" : "in_data_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Loop_HConvH_proc8_U0", "Port" : "in_data_V_strb_V"}]},
			{"Name" : "in_data_V_user_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Loop_HConvH_proc8_U0", "Port" : "in_data_V_user_V"}]},
			{"Name" : "in_data_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Loop_HConvH_proc8_U0", "Port" : "in_data_V_last_V"}]},
			{"Name" : "in_data_V_id_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Loop_HConvH_proc8_U0", "Port" : "in_data_V_id_V"}]},
			{"Name" : "in_data_V_dest_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "Loop_HConvH_proc8_U0", "Port" : "in_data_V_dest_V"}]},
			{"Name" : "out_data_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "Loop_Border_proc_U0", "Port" : "out_data_V_data_V"}]},
			{"Name" : "out_data_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "Loop_Border_proc_U0", "Port" : "out_data_V_keep_V"}]},
			{"Name" : "out_data_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "Loop_Border_proc_U0", "Port" : "out_data_V_strb_V"}]},
			{"Name" : "out_data_V_user_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "Loop_Border_proc_U0", "Port" : "out_data_V_user_V"}]},
			{"Name" : "out_data_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "Loop_Border_proc_U0", "Port" : "out_data_V_last_V"}]},
			{"Name" : "out_data_V_id_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "Loop_Border_proc_U0", "Port" : "out_data_V_id_V"}]},
			{"Name" : "out_data_V_dest_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "Loop_Border_proc_U0", "Port" : "out_data_V_dest_V"}]},
			{"Name" : "w", "Type" : "None", "Direction" : "I"},
			{"Name" : "h", "Type" : "None", "Direction" : "I"},
			{"Name" : "linebuf_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "Loop_VConvH_proc_U0", "Port" : "linebuf_V_1"}]},
			{"Name" : "linebuf_V_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "Loop_VConvH_proc_U0", "Port" : "linebuf_V_0"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Sobel_entry9_U0", "Parent" : "0",
		"CDFG" : "Sobel_entry9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "w", "Type" : "None", "Direction" : "I"},
			{"Name" : "h", "Type" : "None", "Direction" : "I"},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "3", "DependentChan" : "27", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "28", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "w_out1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "h_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "29", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "h_out2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "13", "DependentChan" : "30", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_out2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_split32_proc_U0", "Parent" : "0",
		"CDFG" : "Block_split32_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "2",
		"StartFifo" : "start_for_Block_split32_proc_U0_U",
		"Port" : [
			{"Name" : "w", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "27", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "w_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "31", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "w_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv_xlim_out_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "13", "DependentChan" : "32", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "vconv_xlim_out_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0", "Parent" : "0", "Child" : ["5", "6", "7", "8", "9", "10", "11", "12"],
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
		"StartSource" : "2",
		"StartFifo" : "start_for_Loop_HConvH_proc8_U0_U",
		"Port" : [
			{"Name" : "h", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "29", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "28", "DependentChanDepth" : "2", "DependentChanType" : "2",
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
			{"Name" : "hconv", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "13", "DependentChan" : "33", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "hconv_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.mul_32ns_32ns_64_2_1_U10", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.regslice_both_in_data_V_data_V_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.regslice_both_in_data_V_keep_V_U", "Parent" : "4"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.regslice_both_in_data_V_strb_V_U", "Parent" : "4"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.regslice_both_in_data_V_user_V_U", "Parent" : "4"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.regslice_both_in_data_V_last_V_U", "Parent" : "4"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.regslice_both_in_data_V_id_V_U", "Parent" : "4"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_HConvH_proc8_U0.regslice_both_in_data_V_dest_V_U", "Parent" : "4"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_VConvH_proc_U0", "Parent" : "0", "Child" : ["14", "15", "16"],
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
		"StartSource" : "2",
		"StartFifo" : "start_for_Loop_VConvH_proc_U0_U",
		"DependenceCheck" : [
			{"FromInitialState" : "ap_enable_state4_pp0_iter0_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter0", "FromInitialOperation" : "ap_enable_operation_41", "FromInitialSV" : "3", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_50", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_1_address1", "FromType" : "R", "ToInitialState" : "ap_enable_state5_pp0_iter1_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter1", "ToInitialNextIteration" : "null", "ToInitialOperation" : "ap_enable_operation_52", "ToInitialSV" : "4", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_52", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_1_address0", "ToType" : "W", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Sobel/Sobel.cpp:58:51)", "Type" : "WAR"},
			{"FromInitialState" : "ap_enable_state5_pp0_iter1_stage0", "FromInitialIteration" : "ap_enable_reg_pp0_iter1", "FromInitialOperation" : "ap_enable_operation_52", "FromInitialSV" : "4", "FromFinalState" : "ap_enable_state5_pp0_iter1_stage0", "FromFinalIteration" : "ap_enable_reg_pp0_iter1", "FromFinalOperation" : "ap_enable_operation_52", "FromFinalSV" : "4", "FromAddress" : "linebuf_V_1_address0", "FromType" : "W", "ToInitialState" : "ap_enable_state4_pp0_iter0_stage0", "ToInitialIteration" : "ap_enable_reg_pp0_iter0", "ToInitialNextIteration" : "ap_enable_reg_pp0_iter1", "ToInitialOperation" : "ap_enable_operation_41", "ToInitialSV" : "3", "ToFinalState" : "ap_enable_state5_pp0_iter1_stage0", "ToFinalIteration" : "ap_enable_reg_pp0_iter1", "ToFinalOperation" : "ap_enable_operation_50", "ToFinalSV" : "4", "ToAddress" : "linebuf_V_1_address1", "ToType" : "R", "PipelineBlock" : "ap_block_pp0", "AddressWidth" : "11", "II" : "1", "Pragma" : "(Sobel/Sobel.cpp:58:51)", "Type" : "RAW", "StateEnableSignalListForFifoShift" : ["ap_enable_state4_pp0_iter0_stage0", "ap_enable_state5_pp0_iter1_stage0"]}],
		"Port" : [
			{"Name" : "h", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "30", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv_xlim_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "32", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "vconv_xlim_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "hconv", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "33", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "hconv_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "34", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "vconv_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "h_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "35", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv_xlim_loc_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "36", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "vconv_xlim_loc_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linebuf_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "linebuf_V_0", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VConvH_proc_U0.linebuf_V_1_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VConvH_proc_U0.linebuf_V_0_U", "Parent" : "13"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_VConvH_proc_U0.mul_32ns_32ns_64_2_1_U29", "Parent" : "13"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0", "Parent" : "0", "Child" : ["18", "19", "20", "21", "22", "23", "24", "25", "26"],
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
		"StartSource" : "3",
		"StartFifo" : "start_for_Loop_Border_proc_U0_U",
		"Port" : [
			{"Name" : "h", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "13", "DependentChan" : "35", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "h_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "31", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "w_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "vconv_xlim_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "13", "DependentChan" : "36", "DependentChanDepth" : "2", "DependentChanType" : "2",
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
			{"Name" : "vconv", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "13", "DependentChan" : "34", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "vconv_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.borderbuf_V_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.mul_32ns_32ns_64_2_1_U38", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.regslice_both_out_data_V_data_V_U", "Parent" : "17"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.regslice_both_out_data_V_keep_V_U", "Parent" : "17"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.regslice_both_out_data_V_strb_V_U", "Parent" : "17"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.regslice_both_out_data_V_user_V_U", "Parent" : "17"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.regslice_both_out_data_V_last_V_U", "Parent" : "17"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.regslice_both_out_data_V_id_V_U", "Parent" : "17"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_Border_proc_U0.regslice_both_out_data_V_dest_V_U", "Parent" : "17"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_c_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_c37_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.h_c_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.h_c38_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.w_c39_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.vconv_xlim_loc_c_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hconv_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.vconv_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.h_c40_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.vconv_xlim_loc_c41_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Block_split32_proc_U0_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_HConvH_proc8_U0_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_VConvH_proc_U0_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_Loop_Border_proc_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Sobel {
		in_data_V_data_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_keep_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_strb_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_user_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_last_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_id_V {Type I LastRead 3 FirstWrite -1}
		in_data_V_dest_V {Type I LastRead 3 FirstWrite -1}
		out_data_V_data_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_keep_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_strb_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_user_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_last_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_id_V {Type O LastRead -1 FirstWrite 6}
		out_data_V_dest_V {Type O LastRead -1 FirstWrite 6}
		w {Type I LastRead 0 FirstWrite -1}
		h {Type I LastRead 0 FirstWrite -1}
		linebuf_V_1 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_0 {Type O LastRead -1 FirstWrite -1}}
	Sobel_entry9 {
		w {Type I LastRead 0 FirstWrite -1}
		h {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 0}
		w_out1 {Type O LastRead -1 FirstWrite 0}
		h_out {Type O LastRead -1 FirstWrite 0}
		h_out2 {Type O LastRead -1 FirstWrite 0}}
	Block_split32_proc {
		w {Type I LastRead 0 FirstWrite -1}
		w_out {Type O LastRead -1 FirstWrite 1}
		vconv_xlim_out_out {Type O LastRead -1 FirstWrite 1}}
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
		hconv {Type O LastRead -1 FirstWrite 4}}
	Loop_VConvH_proc {
		h {Type I LastRead 0 FirstWrite -1}
		vconv_xlim_loc {Type I LastRead 0 FirstWrite -1}
		hconv {Type I LastRead 4 FirstWrite -1}
		vconv {Type O LastRead -1 FirstWrite 4}
		h_out {Type O LastRead -1 FirstWrite 0}
		vconv_xlim_loc_out {Type O LastRead -1 FirstWrite 0}
		linebuf_V_1 {Type IO LastRead -1 FirstWrite -1}
		linebuf_V_0 {Type O LastRead -1 FirstWrite -1}}
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
]}

set Spec2ImplPortList { 
	in_data_V_data_V { axis {  { in_data_TDATA in_data 0 8 } } }
	in_data_V_keep_V { axis {  { in_data_TKEEP in_data 0 1 } } }
	in_data_V_strb_V { axis {  { in_data_TSTRB in_data 0 1 } } }
	in_data_V_user_V { axis {  { in_data_TUSER in_data 0 1 } } }
	in_data_V_last_V { axis {  { in_data_TLAST in_data 0 1 } } }
	in_data_V_id_V { axis {  { in_data_TID in_data 0 1 } } }
	in_data_V_dest_V { axis {  { in_data_TDEST in_data 0 1 }  { in_data_TVALID in_vld 0 1 }  { in_data_TREADY in_acc 1 1 } } }
	out_data_V_data_V { axis {  { out_data_TDATA out_data 1 8 } } }
	out_data_V_keep_V { axis {  { out_data_TKEEP out_data 1 1 } } }
	out_data_V_strb_V { axis {  { out_data_TSTRB out_data 1 1 } } }
	out_data_V_user_V { axis {  { out_data_TUSER out_data 1 1 } } }
	out_data_V_last_V { axis {  { out_data_TLAST out_data 1 1 } } }
	out_data_V_id_V { axis {  { out_data_TID out_data 1 1 } } }
	out_data_V_dest_V { axis {  { out_data_TDEST out_data 1 1 }  { out_data_TVALID out_vld 1 1 }  { out_data_TREADY out_acc 0 1 } } }
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
