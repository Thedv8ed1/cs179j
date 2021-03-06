// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Sobel_Loop_HConvH_proc8 (
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
        in_data_TDATA,
        in_data_TVALID,
        in_data_TREADY,
        in_data_TKEEP,
        in_data_TSTRB,
        in_data_TUSER,
        in_data_TLAST,
        in_data_TID,
        in_data_TDEST,
        hconv_din,
        hconv_full_n,
        hconv_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_pp0_stage0 = 5'd8;
parameter    ap_ST_fsm_state6 = 5'd16;

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
input  [7:0] in_data_TDATA;
input   in_data_TVALID;
output   in_data_TREADY;
input  [0:0] in_data_TKEEP;
input  [0:0] in_data_TSTRB;
input  [0:0] in_data_TUSER;
input  [0:0] in_data_TLAST;
input  [0:0] in_data_TID;
input  [0:0] in_data_TDEST;
output  [7:0] hconv_din;
input   hconv_full_n;
output   hconv_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg h_read;
reg w_read;
reg hconv_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    h_blk_n;
reg    w_blk_n;
reg    in_data_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] icmp_ln41_fu_166_p2;
reg    hconv_blk_n;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] icmp_ln51_reg_251;
reg   [63:0] indvar_flatten_reg_117;
reg   [10:0] row_reg_128;
reg   [31:0] h_read_reg_211;
reg   [31:0] w_read_reg_216;
wire    ap_CS_fsm_state2;
wire   [63:0] grp_fu_145_p2;
reg   [63:0] bound_reg_232;
wire    ap_CS_fsm_state3;
wire   [63:0] add_ln41_fu_151_p2;
reg    ap_block_state4_pp0_stage0_iter0;
reg    ap_block_state5_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [7:0] sub_ln213_fu_183_p2;
reg   [7:0] sub_ln213_reg_246;
wire   [0:0] icmp_ln51_fu_199_p2;
wire   [10:0] row_1_fu_205_p2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] grp_fu_145_p0;
wire   [31:0] grp_fu_145_p1;
wire   [31:0] zext_ln42_fu_157_p1;
wire   [0:0] icmp_ln42_fu_161_p2;
wire   [10:0] select_ln41_fu_171_p3;
wire   [9:0] tmp_fu_189_p4;
wire    ap_CS_fsm_state6;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_in_data_V_data_V_U_apdone_blk;
wire   [7:0] in_data_TDATA_int_regslice;
wire    in_data_TVALID_int_regslice;
reg    in_data_TREADY_int_regslice;
wire    regslice_both_in_data_V_data_V_U_ack_in;
wire    regslice_both_in_data_V_keep_V_U_apdone_blk;
wire   [0:0] in_data_TKEEP_int_regslice;
wire    regslice_both_in_data_V_keep_V_U_vld_out;
wire    regslice_both_in_data_V_keep_V_U_ack_in;
wire    regslice_both_in_data_V_strb_V_U_apdone_blk;
wire   [0:0] in_data_TSTRB_int_regslice;
wire    regslice_both_in_data_V_strb_V_U_vld_out;
wire    regslice_both_in_data_V_strb_V_U_ack_in;
wire    regslice_both_in_data_V_user_V_U_apdone_blk;
wire   [0:0] in_data_TUSER_int_regslice;
wire    regslice_both_in_data_V_user_V_U_vld_out;
wire    regslice_both_in_data_V_user_V_U_ack_in;
wire    regslice_both_in_data_V_last_V_U_apdone_blk;
wire   [0:0] in_data_TLAST_int_regslice;
wire    regslice_both_in_data_V_last_V_U_vld_out;
wire    regslice_both_in_data_V_last_V_U_ack_in;
wire    regslice_both_in_data_V_id_V_U_apdone_blk;
wire   [0:0] in_data_TID_int_regslice;
wire    regslice_both_in_data_V_id_V_U_vld_out;
wire    regslice_both_in_data_V_id_V_U_ack_in;
wire    regslice_both_in_data_V_dest_V_U_apdone_blk;
wire   [0:0] in_data_TDEST_int_regslice;
wire    regslice_both_in_data_V_dest_V_U_vld_out;
wire    regslice_both_in_data_V_dest_V_U_ack_in;
wire   [63:0] grp_fu_145_p00;
wire   [63:0] grp_fu_145_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

Sobel_mul_32ns_32ns_64_2_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32ns_32ns_64_2_1_U10(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_145_p0),
    .din1(grp_fu_145_p1),
    .ce(1'b1),
    .dout(grp_fu_145_p2)
);

Sobel_regslice_both #(
    .DataWidth( 8 ))
regslice_both_in_data_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(in_data_TDATA),
    .vld_in(in_data_TVALID),
    .ack_in(regslice_both_in_data_V_data_V_U_ack_in),
    .data_out(in_data_TDATA_int_regslice),
    .vld_out(in_data_TVALID_int_regslice),
    .ack_out(in_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_data_V_data_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_data_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(in_data_TKEEP),
    .vld_in(in_data_TVALID),
    .ack_in(regslice_both_in_data_V_keep_V_U_ack_in),
    .data_out(in_data_TKEEP_int_regslice),
    .vld_out(regslice_both_in_data_V_keep_V_U_vld_out),
    .ack_out(in_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_data_V_keep_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_data_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(in_data_TSTRB),
    .vld_in(in_data_TVALID),
    .ack_in(regslice_both_in_data_V_strb_V_U_ack_in),
    .data_out(in_data_TSTRB_int_regslice),
    .vld_out(regslice_both_in_data_V_strb_V_U_vld_out),
    .ack_out(in_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_data_V_strb_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_data_V_user_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(in_data_TUSER),
    .vld_in(in_data_TVALID),
    .ack_in(regslice_both_in_data_V_user_V_U_ack_in),
    .data_out(in_data_TUSER_int_regslice),
    .vld_out(regslice_both_in_data_V_user_V_U_vld_out),
    .ack_out(in_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_data_V_user_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_data_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(in_data_TLAST),
    .vld_in(in_data_TVALID),
    .ack_in(regslice_both_in_data_V_last_V_U_ack_in),
    .data_out(in_data_TLAST_int_regslice),
    .vld_out(regslice_both_in_data_V_last_V_U_vld_out),
    .ack_out(in_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_data_V_last_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_data_V_id_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(in_data_TID),
    .vld_in(in_data_TVALID),
    .ack_in(regslice_both_in_data_V_id_V_U_ack_in),
    .data_out(in_data_TID_int_regslice),
    .vld_out(regslice_both_in_data_V_id_V_U_vld_out),
    .ack_out(in_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_data_V_id_V_U_apdone_blk)
);

Sobel_regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_data_V_dest_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(in_data_TDEST),
    .vld_in(in_data_TVALID),
    .ack_in(regslice_both_in_data_V_dest_V_U_ack_in),
    .data_out(in_data_TDEST_int_regslice),
    .vld_out(regslice_both_in_data_V_dest_V_U_vld_out),
    .ack_out(in_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_data_V_dest_V_U_apdone_blk)
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
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state4))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln41_fu_166_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_117 <= add_ln41_fu_151_p2;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        indvar_flatten_reg_117 <= 64'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln41_fu_166_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        row_reg_128 <= row_1_fu_205_p2;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        row_reg_128 <= 11'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        bound_reg_232 <= grp_fu_145_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        h_read_reg_211 <= h_dout;
        w_read_reg_216 <= w_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln41_fu_166_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln51_reg_251 <= icmp_ln51_fu_199_p2;
        sub_ln213_reg_246 <= sub_ln213_fu_183_p2;
    end
end

always @ (*) begin
    if ((icmp_ln41_fu_166_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
    if ((~((w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        h_read = 1'b1;
    end else begin
        h_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln51_reg_251 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        hconv_blk_n = hconv_full_n;
    end else begin
        hconv_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln51_reg_251 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        hconv_write = 1'b1;
    end else begin
        hconv_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln41_fu_166_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_data_TDATA_blk_n = in_data_TVALID_int_regslice;
    end else begin
        in_data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln41_fu_166_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        in_data_TREADY_int_regslice = 1'b1;
    end else begin
        in_data_TREADY_int_regslice = 1'b0;
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
    if ((~((w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        w_read = 1'b1;
    end else begin
        w_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            if (~((icmp_ln41_fu_166_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((icmp_ln41_fu_166_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln41_fu_151_p2 = (indvar_flatten_reg_117 + 64'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((icmp_ln51_reg_251 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (hconv_full_n == 1'b0)) | ((icmp_ln41_fu_166_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (in_data_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((icmp_ln51_reg_251 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (hconv_full_n == 1'b0)) | ((icmp_ln41_fu_166_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (in_data_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((icmp_ln51_reg_251 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (hconv_full_n == 1'b0)) | ((icmp_ln41_fu_166_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (in_data_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state1 = ((w_empty_n == 1'b0) | (h_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state4_pp0_stage0_iter0 = ((icmp_ln41_fu_166_p2 == 1'd0) & (in_data_TVALID_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state5_pp0_stage0_iter1 = ((icmp_ln51_reg_251 == 1'd0) & (hconv_full_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign grp_fu_145_p0 = grp_fu_145_p00;

assign grp_fu_145_p00 = h_read_reg_211;

assign grp_fu_145_p1 = grp_fu_145_p10;

assign grp_fu_145_p10 = w_read_reg_216;

assign hconv_din = sub_ln213_reg_246;

assign icmp_ln41_fu_166_p2 = ((indvar_flatten_reg_117 == bound_reg_232) ? 1'b1 : 1'b0);

assign icmp_ln42_fu_161_p2 = (($signed(zext_ln42_fu_157_p1) < $signed(w_read_reg_216)) ? 1'b1 : 1'b0);

assign icmp_ln51_fu_199_p2 = ((tmp_fu_189_p4 == 10'd0) ? 1'b1 : 1'b0);

assign in_data_TREADY = regslice_both_in_data_V_data_V_U_ack_in;

assign row_1_fu_205_p2 = (select_ln41_fu_171_p3 + 11'd1);

assign select_ln41_fu_171_p3 = ((icmp_ln42_fu_161_p2[0:0] == 1'b1) ? row_reg_128 : 11'd0);

assign sub_ln213_fu_183_p2 = (8'd0 - in_data_TDATA_int_regslice);

assign tmp_fu_189_p4 = {{select_ln41_fu_171_p3[10:1]}};

assign zext_ln42_fu_157_p1 = row_reg_128;

endmodule //Sobel_Loop_HConvH_proc8
