// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Sobel_Loop_Border_proc (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        h_dout,
        h_empty_n,
        h_read,
        w_dout,
        w_empty_n,
        w_read,
        vconv_xlim_loc_dout,
        vconv_xlim_loc_empty_n,
        vconv_xlim_loc_read,
        out_data_TDATA,
        out_data_TVALID,
        out_data_TREADY,
        out_data_TKEEP,
        out_data_TSTRB,
        out_data_TUSER,
        out_data_TLAST,
        out_data_TID,
        out_data_TDEST,
        vconv_dout,
        vconv_empty_n,
        vconv_read
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_pp0_stage0 = 5'd8;
parameter    ap_ST_fsm_state9 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] h_dout;
input   h_empty_n;
output   h_read;
input  [31:0] w_dout;
input   w_empty_n;
output   w_read;
input  [31:0] vconv_xlim_loc_dout;
input   vconv_xlim_loc_empty_n;
output   vconv_xlim_loc_read;
output  [7:0] out_data_TDATA;
output   out_data_TVALID;
input   out_data_TREADY;
output  [0:0] out_data_TKEEP;
output  [0:0] out_data_TSTRB;
output  [0:0] out_data_TUSER;
output  [0:0] out_data_TLAST;
output  [0:0] out_data_TID;
output  [0:0] out_data_TDEST;
input  [7:0] vconv_dout;
input   vconv_empty_n;
output   vconv_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg h_read;
reg w_read;
reg vconv_xlim_loc_read;
reg vconv_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    h_blk_n;
reg    w_blk_n;
reg    vconv_xlim_loc_blk_n;
reg    out_data_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter3;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln76_reg_625;
reg   [0:0] icmp_ln76_reg_625_pp0_iter2_reg;
reg    ap_enable_reg_pp0_iter4;
reg   [0:0] icmp_ln76_reg_625_pp0_iter3_reg;
reg    vconv_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] select_ln76_2_reg_636;
reg   [0:0] icmp_ln81_reg_650;
reg   [63:0] indvar_flatten_reg_184;
reg   [10:0] i_reg_195;
reg   [31:0] j_reg_206;
reg   [31:0] h_read_reg_562;
reg   [31:0] w_read_reg_568;
reg   [31:0] vconv_xlim_loc_read_reg_576;
wire    ap_CS_fsm_state2;
wire   [31:0] sub85_i_i_i_fu_229_p2;
reg   [31:0] sub85_i_i_i_reg_591;
wire    ap_CS_fsm_state3;
wire   [31:0] sub75_i_i_i_fu_234_p2;
reg   [31:0] sub75_i_i_i_reg_599;
wire   [31:0] sub72_i_i_i_fu_239_p2;
reg   [31:0] sub72_i_i_i_reg_604;
wire  signed [32:0] sext_ln74_fu_244_p1;
reg  signed [32:0] sext_ln74_reg_609;
wire   [63:0] grp_fu_223_p2;
reg   [63:0] bound_reg_615;
wire   [63:0] add_ln76_fu_247_p2;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state4_pp0_stage0_iter0;
reg    ap_predicate_op81_read_state5;
reg    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_state6_pp0_stage0_iter2;
reg    ap_block_state7_pp0_stage0_iter3;
reg    ap_block_state7_io;
reg    ap_block_state8_pp0_stage0_iter4;
reg    ap_block_state8_io;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln76_fu_301_p2;
reg   [0:0] icmp_ln76_reg_625_pp0_iter1_reg;
wire   [31:0] select_ln76_fu_321_p3;
reg   [31:0] select_ln76_reg_629;
reg   [31:0] select_ln76_reg_629_pp0_iter1_reg;
wire   [0:0] select_ln76_2_fu_381_p3;
reg   [0:0] select_ln76_2_reg_636_pp0_iter1_reg;
wire   [10:0] select_ln76_3_fu_389_p3;
wire   [10:0] trunc_ln75_fu_401_p1;
reg   [10:0] trunc_ln75_reg_645;
reg   [10:0] trunc_ln75_reg_645_pp0_iter1_reg;
wire   [0:0] icmp_ln81_fu_405_p2;
wire   [0:0] icmp_ln87_fu_410_p2;
reg   [0:0] icmp_ln87_reg_654;
reg   [0:0] icmp_ln87_reg_654_pp0_iter1_reg;
wire   [0:0] icmp_ln92_fu_415_p2;
reg   [0:0] icmp_ln92_reg_659;
reg   [0:0] icmp_ln92_reg_659_pp0_iter1_reg;
reg   [0:0] icmp_ln92_reg_659_pp0_iter2_reg;
wire   [0:0] output_last_V_fu_425_p2;
reg   [0:0] output_last_V_reg_664;
reg   [0:0] output_last_V_reg_664_pp0_iter1_reg;
reg   [0:0] output_last_V_reg_664_pp0_iter2_reg;
wire   [31:0] add_ln75_fu_431_p2;
wire   [0:0] icmp_ln90_fu_494_p2;
reg   [0:0] icmp_ln90_reg_674;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter2;
wire   [10:0] borderbuf_V_address0;
reg    borderbuf_V_ce0;
reg    borderbuf_V_we0;
wire   [10:0] borderbuf_V_address1;
reg    borderbuf_V_ce1;
wire   [7:0] borderbuf_V_q1;
wire   [63:0] zext_ln75_1_fu_437_p1;
wire   [63:0] zext_ln95_fu_505_p1;
reg   [7:0] pix_in_fu_90;
reg   [7:0] r_edge_pix_fu_94;
wire   [7:0] select_ln87_fu_468_p3;
reg   [7:0] l_edge_pix_fu_98;
wire   [7:0] l_edge_pix_1_fu_460_p3;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] grp_fu_223_p0;
wire   [31:0] grp_fu_223_p1;
wire   [31:0] zext_ln76_1_fu_253_p1;
wire   [9:0] tmp_fu_268_p4;
wire   [0:0] notrhs_i_i_fu_284_p2;
wire   [0:0] icmp20_fu_278_p2;
wire   [0:0] cmp63_i_i_i_fu_257_p2;
wire   [0:0] brmerge_not_i_i_fu_289_p2;
wire   [10:0] add_ln74_fu_306_p2;
wire   [0:0] icmp_ln75_fu_316_p2;
wire   [31:0] zext_ln76_fu_312_p1;
wire   [0:0] cmp86_i_i_i_mid1_fu_335_p2;
wire   [0:0] cmp86_i_i_i_fu_263_p2;
wire   [9:0] tmp_4_fu_348_p4;
wire   [0:0] notrhs_i_i_mid1_fu_364_p2;
wire   [0:0] icmp_fu_358_p2;
wire   [0:0] cmp63_i_i_i_mid1_fu_329_p2;
wire   [0:0] brmerge_not_i_i_mid1_fu_369_p2;
wire   [0:0] brmerge237_i_i_mid1_fu_375_p2;
wire   [0:0] brmerge237_i_i_fu_295_p2;
wire   [32:0] zext_ln75_fu_397_p1;
wire   [0:0] select_ln76_1_fu_340_p3;
wire   [0:0] icmp_ln100_fu_420_p2;
wire   [0:0] icmp_ln85_fu_455_p2;
wire   [30:0] tmp_5_fu_485_p4;
wire   [10:0] add_ln95_fu_500_p2;
wire   [0:0] xor_ln90_fu_516_p2;
wire   [0:0] and_ln92_fu_521_p2;
wire   [7:0] select_ln92_fu_526_p3;
wire    ap_CS_fsm_state9;
wire    regslice_both_out_data_V_data_V_U_apdone_blk;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [7:0] out_data_TDATA_int_regslice;
reg    out_data_TVALID_int_regslice;
wire    out_data_TREADY_int_regslice;
wire    regslice_both_out_data_V_data_V_U_vld_out;
wire    regslice_both_out_data_V_keep_V_U_apdone_blk;
wire    regslice_both_out_data_V_keep_V_U_ack_in_dummy;
wire    regslice_both_out_data_V_keep_V_U_vld_out;
wire    regslice_both_out_data_V_strb_V_U_apdone_blk;
wire    regslice_both_out_data_V_strb_V_U_ack_in_dummy;
wire    regslice_both_out_data_V_strb_V_U_vld_out;
wire    regslice_both_out_data_V_user_V_U_apdone_blk;
wire    regslice_both_out_data_V_user_V_U_ack_in_dummy;
wire    regslice_both_out_data_V_user_V_U_vld_out;
wire    regslice_both_out_data_V_last_V_U_apdone_blk;
wire    regslice_both_out_data_V_last_V_U_ack_in_dummy;
wire    regslice_both_out_data_V_last_V_U_vld_out;
wire    regslice_both_out_data_V_id_V_U_apdone_blk;
wire    regslice_both_out_data_V_id_V_U_ack_in_dummy;
wire    regslice_both_out_data_V_id_V_U_vld_out;
wire    regslice_both_out_data_V_dest_V_U_apdone_blk;
wire    regslice_both_out_data_V_dest_V_U_ack_in_dummy;
wire    regslice_both_out_data_V_dest_V_U_vld_out;
wire   [63:0] grp_fu_223_p00;
wire   [63:0] grp_fu_223_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

Sobel_Loop_Border_proc_borderbuf_V #(
    .DataWidth( 8 ),
    .AddressRange( 1918 ),
    .AddressWidth( 11 ))
borderbuf_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(borderbuf_V_address0),
    .ce0(borderbuf_V_ce0),
    .we0(borderbuf_V_we0),
    .d0(vconv_dout),
    .address1(borderbuf_V_address1),
    .ce1(borderbuf_V_ce1),
    .q1(borderbuf_V_q1)
);

Sobel_mul_32ns_32ns_64_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32ns_32ns_64_2_1_U38(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_223_p0),
    .din1(grp_fu_223_p1),
    .ce(1'b1),
    .dout(grp_fu_223_p2)
);

Sobel_regslice_both #(
    .DataWidth( 8 ))
regslice_both_out_data_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(out_data_TDATA_int_regslice),
    .vld_in(out_data_TVALID_int_regslice),
    .ack_in(out_data_TREADY_int_regslice),
    .data_out(out_data_TDATA),
    .vld_out(regslice_both_out_data_V_data_V_U_vld_out),
    .ack_out(out_data_TREADY),
    .apdone_blk(regslice_both_out_data_V_data_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_data_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd1),
    .vld_in(out_data_TVALID_int_regslice),
    .ack_in(regslice_both_out_data_V_keep_V_U_ack_in_dummy),
    .data_out(out_data_TKEEP),
    .vld_out(regslice_both_out_data_V_keep_V_U_vld_out),
    .ack_out(out_data_TREADY),
    .apdone_blk(regslice_both_out_data_V_keep_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_data_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd1),
    .vld_in(out_data_TVALID_int_regslice),
    .ack_in(regslice_both_out_data_V_strb_V_U_ack_in_dummy),
    .data_out(out_data_TSTRB),
    .vld_out(regslice_both_out_data_V_strb_V_U_vld_out),
    .ack_out(out_data_TREADY),
    .apdone_blk(regslice_both_out_data_V_strb_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_data_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd0),
    .vld_in(out_data_TVALID_int_regslice),
    .ack_in(regslice_both_out_data_V_user_V_U_ack_in_dummy),
    .data_out(out_data_TUSER),
    .vld_out(regslice_both_out_data_V_user_V_U_vld_out),
    .ack_out(out_data_TREADY),
    .apdone_blk(regslice_both_out_data_V_user_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_data_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(output_last_V_reg_664_pp0_iter2_reg),
    .vld_in(out_data_TVALID_int_regslice),
    .ack_in(regslice_both_out_data_V_last_V_U_ack_in_dummy),
    .data_out(out_data_TLAST),
    .vld_out(regslice_both_out_data_V_last_V_U_vld_out),
    .ack_out(out_data_TREADY),
    .apdone_blk(regslice_both_out_data_V_last_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_data_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd0),
    .vld_in(out_data_TVALID_int_regslice),
    .ack_in(regslice_both_out_data_V_id_V_U_ack_in_dummy),
    .data_out(out_data_TID),
    .vld_out(regslice_both_out_data_V_id_V_U_vld_out),
    .ack_out(out_data_TREADY),
    .apdone_blk(regslice_both_out_data_V_id_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_data_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(1'd0),
    .vld_in(out_data_TVALID_int_regslice),
    .ack_in(regslice_both_out_data_V_dest_V_U_ack_in_dummy),
    .data_out(out_data_TDEST),
    .vld_out(regslice_both_out_data_V_dest_V_U_vld_out),
    .ack_out(out_data_TREADY),
    .apdone_blk(regslice_both_out_data_V_dest_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((regslice_both_out_data_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state9))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state4))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state4)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln76_fu_301_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        i_reg_195 <= select_ln76_3_fu_389_p3;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        i_reg_195 <= 11'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln76_fu_301_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_184 <= add_ln76_fu_247_p2;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        indvar_flatten_reg_184 <= 64'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln76_fu_301_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        j_reg_206 <= add_ln75_fu_431_p2;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        j_reg_206 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        bound_reg_615 <= grp_fu_223_p2;
        sext_ln74_reg_609 <= sext_ln74_fu_244_p1;
        sub72_i_i_i_reg_604 <= sub72_i_i_i_fu_239_p2;
        sub75_i_i_i_reg_599 <= sub75_i_i_i_fu_234_p2;
        sub85_i_i_i_reg_591 <= sub85_i_i_i_fu_229_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        h_read_reg_562 <= h_dout;
        vconv_xlim_loc_read_reg_576 <= vconv_xlim_loc_dout;
        w_read_reg_568 <= w_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln76_reg_625 <= icmp_ln76_fu_301_p2;
        icmp_ln76_reg_625_pp0_iter1_reg <= icmp_ln76_reg_625;
        icmp_ln87_reg_654_pp0_iter1_reg <= icmp_ln87_reg_654;
        icmp_ln92_reg_659_pp0_iter1_reg <= icmp_ln92_reg_659;
        output_last_V_reg_664_pp0_iter1_reg <= output_last_V_reg_664;
        select_ln76_2_reg_636_pp0_iter1_reg <= select_ln76_2_reg_636;
        select_ln76_reg_629_pp0_iter1_reg <= select_ln76_reg_629;
        trunc_ln75_reg_645_pp0_iter1_reg <= trunc_ln75_reg_645;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln76_reg_625_pp0_iter2_reg <= icmp_ln76_reg_625_pp0_iter1_reg;
        icmp_ln76_reg_625_pp0_iter3_reg <= icmp_ln76_reg_625_pp0_iter2_reg;
        icmp_ln92_reg_659_pp0_iter2_reg <= icmp_ln92_reg_659_pp0_iter1_reg;
        output_last_V_reg_664_pp0_iter2_reg <= output_last_V_reg_664_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (select_ln76_2_fu_381_p3 == 1'd1) & (icmp_ln76_fu_301_p2 == 1'd0))) begin
        icmp_ln81_reg_650 <= icmp_ln81_fu_405_p2;
        icmp_ln87_reg_654 <= icmp_ln87_fu_410_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln76_reg_625_pp0_iter1_reg == 1'd0))) begin
        icmp_ln90_reg_674 <= icmp_ln90_fu_494_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln76_fu_301_p2 == 1'd0))) begin
        icmp_ln92_reg_659 <= icmp_ln92_fu_415_p2;
        output_last_V_reg_664 <= output_last_V_fu_425_p2;
        select_ln76_2_reg_636 <= select_ln76_2_fu_381_p3;
        select_ln76_reg_629 <= select_ln76_fu_321_p3;
        trunc_ln75_reg_645 <= trunc_ln75_fu_401_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (select_ln76_2_reg_636_pp0_iter1_reg == 1'd1))) begin
        l_edge_pix_fu_98 <= l_edge_pix_1_fu_460_p3;
        r_edge_pix_fu_94 <= select_ln87_fu_468_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln81_reg_650 == 1'd1) & (select_ln76_2_reg_636 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        pix_in_fu_90 <= vconv_dout;
    end
end

always @ (*) begin
    if ((icmp_ln76_fu_301_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_out_data_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state9))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_out_data_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state9))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        borderbuf_V_ce0 = 1'b1;
    end else begin
        borderbuf_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        borderbuf_V_ce1 = 1'b1;
    end else begin
        borderbuf_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln81_reg_650 == 1'd1) & (select_ln76_2_reg_636 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        borderbuf_V_we0 = 1'b1;
    end else begin
        borderbuf_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        h_blk_n = h_empty_n;
    end else begin
        h_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((vconv_xlim_loc_empty_n == 1'b0) | (w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        h_read = 1'b1;
    end else begin
        h_read = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln76_reg_625_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((icmp_ln76_reg_625_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1)))) begin
        out_data_TDATA_blk_n = out_data_TREADY_int_regslice;
    end else begin
        out_data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln76_reg_625_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        out_data_TVALID_int_regslice = 1'b1;
    end else begin
        out_data_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln81_reg_650 == 1'd1) & (select_ln76_2_reg_636 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        vconv_blk_n = vconv_empty_n;
    end else begin
        vconv_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op81_read_state5 == 1'b1))) begin
        vconv_read = 1'b1;
    end else begin
        vconv_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        vconv_xlim_loc_blk_n = vconv_xlim_loc_empty_n;
    end else begin
        vconv_xlim_loc_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((vconv_xlim_loc_empty_n == 1'b0) | (w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        vconv_xlim_loc_read = 1'b1;
    end else begin
        vconv_xlim_loc_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        w_blk_n = w_empty_n;
    end else begin
        w_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((vconv_xlim_loc_empty_n == 1'b0) | (w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        w_read = 1'b1;
    end else begin
        w_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((vconv_xlim_loc_empty_n == 1'b0) | (w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln76_fu_301_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b0)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln76_fu_301_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((regslice_both_out_data_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln74_fu_306_p2 = (i_reg_195 + 11'd1);

assign add_ln75_fu_431_p2 = (select_ln76_fu_321_p3 + 32'd1);

assign add_ln76_fu_247_p2 = (indvar_flatten_reg_184 + 64'd1);

assign add_ln95_fu_500_p2 = ($signed(trunc_ln75_reg_645_pp0_iter1_reg) + $signed(11'd2047));

assign and_ln92_fu_521_p2 = (xor_ln90_fu_516_p2 & icmp_ln92_reg_659_pp0_iter2_reg);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (vconv_empty_n == 1'b0) & (ap_predicate_op81_read_state5 == 1'b1)) | ((icmp_ln76_reg_625_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (out_data_TREADY_int_regslice == 1'b0)) | ((icmp_ln76_reg_625_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (out_data_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (vconv_empty_n == 1'b0) & (ap_predicate_op81_read_state5 == 1'b1)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & ((1'b1 == ap_block_state8_io) | ((icmp_ln76_reg_625_pp0_iter3_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state7_io) | ((icmp_ln76_reg_625_pp0_iter2_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter1 == 1'b1) & (vconv_empty_n == 1'b0) & (ap_predicate_op81_read_state5 == 1'b1)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & ((1'b1 == ap_block_state8_io) | ((icmp_ln76_reg_625_pp0_iter3_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state7_io) | ((icmp_ln76_reg_625_pp0_iter2_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state1 = ((vconv_xlim_loc_empty_n == 1'b0) | (w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter1 = ((vconv_empty_n == 1'b0) & (ap_predicate_op81_read_state5 == 1'b1));
end

assign ap_block_state6_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state7_io = ((icmp_ln76_reg_625_pp0_iter2_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state7_pp0_stage0_iter3 = ((icmp_ln76_reg_625_pp0_iter2_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state8_io = ((icmp_ln76_reg_625_pp0_iter3_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state8_pp0_stage0_iter4 = ((icmp_ln76_reg_625_pp0_iter3_reg == 1'd0) & (out_data_TREADY_int_regslice == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_op81_read_state5 = ((icmp_ln81_reg_650 == 1'd1) & (select_ln76_2_reg_636 == 1'd1));
end

assign borderbuf_V_address0 = zext_ln75_1_fu_437_p1;

assign borderbuf_V_address1 = zext_ln95_fu_505_p1;

assign brmerge237_i_i_fu_295_p2 = (cmp63_i_i_i_fu_257_p2 | brmerge_not_i_i_fu_289_p2);

assign brmerge237_i_i_mid1_fu_375_p2 = (cmp63_i_i_i_mid1_fu_329_p2 | brmerge_not_i_i_mid1_fu_369_p2);

assign brmerge_not_i_i_fu_289_p2 = (notrhs_i_i_fu_284_p2 & icmp20_fu_278_p2);

assign brmerge_not_i_i_mid1_fu_369_p2 = (notrhs_i_i_mid1_fu_364_p2 & icmp_fu_358_p2);

assign cmp63_i_i_i_fu_257_p2 = ((i_reg_195 == 11'd0) ? 1'b1 : 1'b0);

assign cmp63_i_i_i_mid1_fu_329_p2 = ((add_ln74_fu_306_p2 == 11'd0) ? 1'b1 : 1'b0);

assign cmp86_i_i_i_fu_263_p2 = ((zext_ln76_1_fu_253_p1 == sub85_i_i_i_reg_591) ? 1'b1 : 1'b0);

assign cmp86_i_i_i_mid1_fu_335_p2 = ((zext_ln76_fu_312_p1 == sub85_i_i_i_reg_591) ? 1'b1 : 1'b0);

assign grp_fu_223_p0 = grp_fu_223_p00;

assign grp_fu_223_p00 = h_read_reg_562;

assign grp_fu_223_p1 = grp_fu_223_p10;

assign grp_fu_223_p10 = w_read_reg_568;

assign icmp20_fu_278_p2 = ((tmp_fu_268_p4 != 10'd0) ? 1'b1 : 1'b0);

assign icmp_fu_358_p2 = ((tmp_4_fu_348_p4 != 10'd0) ? 1'b1 : 1'b0);

assign icmp_ln100_fu_420_p2 = ((select_ln76_fu_321_p3 == sub75_i_i_i_reg_599) ? 1'b1 : 1'b0);

assign icmp_ln75_fu_316_p2 = ((j_reg_206 == w_read_reg_568) ? 1'b1 : 1'b0);

assign icmp_ln76_fu_301_p2 = ((indvar_flatten_reg_184 == bound_reg_615) ? 1'b1 : 1'b0);

assign icmp_ln81_fu_405_p2 = (($signed(zext_ln75_fu_397_p1) < $signed(sext_ln74_reg_609)) ? 1'b1 : 1'b0);

assign icmp_ln85_fu_455_p2 = ((select_ln76_reg_629_pp0_iter1_reg == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln87_fu_410_p2 = ((select_ln76_fu_321_p3 == sub72_i_i_i_reg_604) ? 1'b1 : 1'b0);

assign icmp_ln90_fu_494_p2 = ((tmp_5_fu_485_p4 == 31'd0) ? 1'b1 : 1'b0);

assign icmp_ln92_fu_415_p2 = (($signed(zext_ln75_fu_397_p1) < $signed(sext_ln74_reg_609)) ? 1'b1 : 1'b0);

assign l_edge_pix_1_fu_460_p3 = ((icmp_ln85_fu_455_p2[0:0] == 1'b1) ? pix_in_fu_90 : l_edge_pix_fu_98);

assign notrhs_i_i_fu_284_p2 = (($signed(zext_ln76_1_fu_253_p1) < $signed(sub85_i_i_i_reg_591)) ? 1'b1 : 1'b0);

assign notrhs_i_i_mid1_fu_364_p2 = (($signed(zext_ln76_fu_312_p1) < $signed(sub85_i_i_i_reg_591)) ? 1'b1 : 1'b0);

assign out_data_TDATA_int_regslice = ((icmp_ln90_reg_674[0:0] == 1'b1) ? l_edge_pix_fu_98 : select_ln92_fu_526_p3);

assign out_data_TVALID = regslice_both_out_data_V_data_V_U_vld_out;

assign output_last_V_fu_425_p2 = (select_ln76_1_fu_340_p3 & icmp_ln100_fu_420_p2);

assign select_ln76_1_fu_340_p3 = ((icmp_ln75_fu_316_p2[0:0] == 1'b1) ? cmp86_i_i_i_mid1_fu_335_p2 : cmp86_i_i_i_fu_263_p2);

assign select_ln76_2_fu_381_p3 = ((icmp_ln75_fu_316_p2[0:0] == 1'b1) ? brmerge237_i_i_mid1_fu_375_p2 : brmerge237_i_i_fu_295_p2);

assign select_ln76_3_fu_389_p3 = ((icmp_ln75_fu_316_p2[0:0] == 1'b1) ? add_ln74_fu_306_p2 : i_reg_195);

assign select_ln76_fu_321_p3 = ((icmp_ln75_fu_316_p2[0:0] == 1'b1) ? 32'd0 : j_reg_206);

assign select_ln87_fu_468_p3 = ((icmp_ln87_reg_654_pp0_iter1_reg[0:0] == 1'b1) ? pix_in_fu_90 : r_edge_pix_fu_94);

assign select_ln92_fu_526_p3 = ((and_ln92_fu_521_p2[0:0] == 1'b1) ? borderbuf_V_q1 : r_edge_pix_fu_94);

assign sext_ln74_fu_244_p1 = $signed(vconv_xlim_loc_read_reg_576);

assign sub72_i_i_i_fu_239_p2 = ($signed(w_read_reg_568) + $signed(32'd4294967293));

assign sub75_i_i_i_fu_234_p2 = ($signed(w_read_reg_568) + $signed(32'd4294967295));

assign sub85_i_i_i_fu_229_p2 = ($signed(h_read_reg_562) + $signed(32'd4294967295));

assign tmp_4_fu_348_p4 = {{add_ln74_fu_306_p2[10:1]}};

assign tmp_5_fu_485_p4 = {{select_ln76_reg_629_pp0_iter1_reg[31:1]}};

assign tmp_fu_268_p4 = {{i_reg_195[10:1]}};

assign trunc_ln75_fu_401_p1 = select_ln76_fu_321_p3[10:0];

assign xor_ln90_fu_516_p2 = (icmp_ln90_reg_674 ^ 1'd1);

assign zext_ln75_1_fu_437_p1 = select_ln76_reg_629;

assign zext_ln75_fu_397_p1 = select_ln76_fu_321_p3;

assign zext_ln76_1_fu_253_p1 = i_reg_195;

assign zext_ln76_fu_312_p1 = add_ln74_fu_306_p2;

assign zext_ln95_fu_505_p1 = add_ln95_fu_500_p2;

endmodule //Sobel_Loop_Border_proc
