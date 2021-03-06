// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Blur_Block_split549_proc (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        w_dout,
        w_empty_n,
        w_read,
        w_out_din,
        w_out_full_n,
        w_out_write,
        vconv_xlim_out_out_din,
        vconv_xlim_out_out_full_n,
        vconv_xlim_out_out_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [31:0] w_dout;
input   w_empty_n;
output   w_read;
output  [31:0] w_out_din;
input   w_out_full_n;
output   w_out_write;
output  [31:0] vconv_xlim_out_out_din;
input   vconv_xlim_out_out_full_n;
output   vconv_xlim_out_out_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg w_read;
reg w_out_write;
reg vconv_xlim_out_out_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    w_blk_n;
reg    w_out_blk_n;
wire    ap_CS_fsm_state2;
reg    vconv_xlim_out_out_blk_n;
reg   [31:0] w_read_reg_52;
reg    ap_block_state1;
reg    ap_block_state2;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
end

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
        end else if ((~((vconv_xlim_out_out_full_n == 1'b0) | (w_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        w_read_reg_52 <= w_dout;
    end
end

always @ (*) begin
    if ((~((vconv_xlim_out_out_full_n == 1'b0) | (w_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((vconv_xlim_out_out_full_n == 1'b0) | (w_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        vconv_xlim_out_out_blk_n = vconv_xlim_out_out_full_n;
    end else begin
        vconv_xlim_out_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((vconv_xlim_out_out_full_n == 1'b0) | (w_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        vconv_xlim_out_out_write = 1'b1;
    end else begin
        vconv_xlim_out_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        w_blk_n = w_empty_n;
    end else begin
        w_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        w_out_blk_n = w_out_full_n;
    end else begin
        w_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((vconv_xlim_out_out_full_n == 1'b0) | (w_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        w_out_write = 1'b1;
    end else begin
        w_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (w_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        w_read = 1'b1;
    end else begin
        w_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((real_start == 1'b0) | (w_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((vconv_xlim_out_out_full_n == 1'b0) | (w_out_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (w_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2 = ((vconv_xlim_out_out_full_n == 1'b0) | (w_out_full_n == 1'b0));
end

assign ap_ready = internal_ap_ready;

assign start_out = real_start;

assign vconv_xlim_out_out_din = ($signed(w_read_reg_52) + $signed(32'd4294967282));

assign w_out_din = w_read_reg_52;

endmodule //Blur_Block_split549_proc
