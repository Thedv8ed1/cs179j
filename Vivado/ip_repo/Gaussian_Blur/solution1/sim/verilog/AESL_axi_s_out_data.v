// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

`define TV_OUT_out_data_TDATA "../tv/rtldatafile/rtl.Blur.autotvout_out_data_V_data_V.dat"
`define EGRESS_STATUS_out_data_TDATA "../tv/stream_size/stream_egress_status_out_data_V_data_V.dat"
`define TV_OUT_out_data_TKEEP "../tv/rtldatafile/rtl.Blur.autotvout_out_data_V_keep_V.dat"
`define EGRESS_STATUS_out_data_TKEEP "../tv/stream_size/stream_egress_status_out_data_V_keep_V.dat"
`define TV_OUT_out_data_TSTRB "../tv/rtldatafile/rtl.Blur.autotvout_out_data_V_strb_V.dat"
`define EGRESS_STATUS_out_data_TSTRB "../tv/stream_size/stream_egress_status_out_data_V_strb_V.dat"
`define TV_OUT_out_data_TLAST "../tv/rtldatafile/rtl.Blur.autotvout_out_data_V_last_V.dat"
`define EGRESS_STATUS_out_data_TLAST "../tv/stream_size/stream_egress_status_out_data_V_last_V.dat"

`define AUTOTB_TRANSACTION_NUM 1

module AESL_axi_s_out_data (
    input clk,
    input reset,
    input [24 - 1:0] TRAN_out_data_TDATA,
    input [3 - 1:0] TRAN_out_data_TKEEP,
    input [3 - 1:0] TRAN_out_data_TSTRB,
    input TRAN_out_data_TLAST,
    input TRAN_out_data_TVALID,
    output TRAN_out_data_TREADY,
    input ready,
    input done,
    output [31:0] transaction);

    wire TRAN_out_data_TVALID_temp;
    wire out_data_TDATA_full;
    wire out_data_TDATA_empty;
    reg out_data_TDATA_write_en;
    reg [24 - 1:0] out_data_TDATA_write_data;
    reg out_data_TDATA_read_en;
    wire [24 - 1:0] out_data_TDATA_read_data;
    
    fifo #(1310720, 24) fifo_out_data_TDATA (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(out_data_TDATA_write_en),
        .write_data(out_data_TDATA_write_data),
        .read_clock(clk),
        .read_en(out_data_TDATA_read_en),
        .read_data(out_data_TDATA_read_data),
        .full(out_data_TDATA_full),
        .empty(out_data_TDATA_empty));
    
    always @ (*) begin
        out_data_TDATA_write_en <= TRAN_out_data_TVALID;
        out_data_TDATA_write_data <= TRAN_out_data_TDATA;
        out_data_TDATA_read_en <= 0;
    end
    wire out_data_TKEEP_full;
    wire out_data_TKEEP_empty;
    reg out_data_TKEEP_write_en;
    reg [3 - 1:0] out_data_TKEEP_write_data;
    reg out_data_TKEEP_read_en;
    wire [3 - 1:0] out_data_TKEEP_read_data;
    
    fifo #(1310720, 3) fifo_out_data_TKEEP (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(out_data_TKEEP_write_en),
        .write_data(out_data_TKEEP_write_data),
        .read_clock(clk),
        .read_en(out_data_TKEEP_read_en),
        .read_data(out_data_TKEEP_read_data),
        .full(out_data_TKEEP_full),
        .empty(out_data_TKEEP_empty));
    
    always @ (*) begin
        out_data_TKEEP_write_en <= TRAN_out_data_TVALID;
        out_data_TKEEP_write_data <= TRAN_out_data_TKEEP;
        out_data_TKEEP_read_en <= 0;
    end
    wire out_data_TSTRB_full;
    wire out_data_TSTRB_empty;
    reg out_data_TSTRB_write_en;
    reg [3 - 1:0] out_data_TSTRB_write_data;
    reg out_data_TSTRB_read_en;
    wire [3 - 1:0] out_data_TSTRB_read_data;
    
    fifo #(1310720, 3) fifo_out_data_TSTRB (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(out_data_TSTRB_write_en),
        .write_data(out_data_TSTRB_write_data),
        .read_clock(clk),
        .read_en(out_data_TSTRB_read_en),
        .read_data(out_data_TSTRB_read_data),
        .full(out_data_TSTRB_full),
        .empty(out_data_TSTRB_empty));
    
    always @ (*) begin
        out_data_TSTRB_write_en <= TRAN_out_data_TVALID;
        out_data_TSTRB_write_data <= TRAN_out_data_TSTRB;
        out_data_TSTRB_read_en <= 0;
    end
    wire out_data_TLAST_full;
    wire out_data_TLAST_empty;
    reg out_data_TLAST_write_en;
    reg [1 - 1:0] out_data_TLAST_write_data;
    reg out_data_TLAST_read_en;
    wire [1 - 1:0] out_data_TLAST_read_data;
    
    fifo #(1310720, 1) fifo_out_data_TLAST (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(out_data_TLAST_write_en),
        .write_data(out_data_TLAST_write_data),
        .read_clock(clk),
        .read_en(out_data_TLAST_read_en),
        .read_data(out_data_TLAST_read_data),
        .full(out_data_TLAST_full),
        .empty(out_data_TLAST_empty));
    
    always @ (*) begin
        out_data_TLAST_write_en <= TRAN_out_data_TVALID;
        out_data_TLAST_write_data <= TRAN_out_data_TLAST;
        out_data_TLAST_read_en <= 0;
    end
    assign TRAN_out_data_TVALID = TRAN_out_data_TVALID_temp;

    
    assign TRAN_out_data_TREADY = ~(out_data_TDATA_full || out_data_TKEEP_full || out_data_TSTRB_full || out_data_TLAST_full);
    
    function is_blank_char(input [7:0] in_char);
        if (in_char == " " || in_char == "\011" || in_char == "\012" || in_char == "\015") begin
            is_blank_char = 1;
        end else begin
            is_blank_char = 0;
        end
    endfunction
    
    function [191:0] read_token(input integer fp);
        integer ret;
        begin
            read_token = "";
                    ret = 0;
                    ret = $fscanf(fp,"%s",read_token);
        end
    endfunction
    
    function [191:0] rm_0x(input [191:0] token);
        reg [191:0] token_tmp;
        integer i;
        begin
            token_tmp = "";
            for (i = 0; token[15:0] != "0x"; token = token >> 8) begin
                token_tmp = (token[7:0] << (8 * i)) | token_tmp;
                i = i + 1;
            end
            rm_0x = token_tmp;
        end
    endfunction
    
    reg done_1;
    
    always @ (posedge clk or reset) begin
        if (~reset) begin
            done_1 <= 0;
        end else begin
            done_1 <= done;
        end
    end
    
    reg [31:0] transaction_save_out_data_TDATA;
    
    assign transaction = transaction_save_out_data_TDATA;
    
    initial begin : AXI_stream_receiver_out_data_TDATA
        integer fp;
        reg [24 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_out_data_TDATA = 0;
        fifo_out_data_TDATA.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_out_data_TDATA, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_out_data_TDATA);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_out_data_TDATA);
                while (~fifo_out_data_TDATA.empty) begin
                    fifo_out_data_TDATA.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_out_data_TDATA = transaction_save_out_data_TDATA + 1;
                fifo_out_data_TDATA.clear();
                $fclose(fp);
            end
        end
    end
    
    reg [31:0] transaction_save_out_data_TKEEP;
    
    initial begin : AXI_stream_receiver_out_data_TKEEP
        integer fp;
        reg [3 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_out_data_TKEEP = 0;
        fifo_out_data_TKEEP.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_out_data_TKEEP, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_out_data_TKEEP);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_out_data_TKEEP);
                while (~fifo_out_data_TKEEP.empty) begin
                    fifo_out_data_TKEEP.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_out_data_TKEEP = transaction_save_out_data_TKEEP + 1;
                fifo_out_data_TKEEP.clear();
                $fclose(fp);
            end
        end
    end
    
    reg [31:0] transaction_save_out_data_TSTRB;
    
    initial begin : AXI_stream_receiver_out_data_TSTRB
        integer fp;
        reg [3 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_out_data_TSTRB = 0;
        fifo_out_data_TSTRB.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_out_data_TSTRB, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_out_data_TSTRB);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_out_data_TSTRB);
                while (~fifo_out_data_TSTRB.empty) begin
                    fifo_out_data_TSTRB.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_out_data_TSTRB = transaction_save_out_data_TSTRB + 1;
                fifo_out_data_TSTRB.clear();
                $fclose(fp);
            end
        end
    end
    
    reg [31:0] transaction_save_out_data_TLAST;
    
    initial begin : AXI_stream_receiver_out_data_TLAST
        integer fp;
        reg [1 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_out_data_TLAST = 0;
        fifo_out_data_TLAST.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_out_data_TLAST, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_out_data_TLAST);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_out_data_TLAST);
                while (~fifo_out_data_TLAST.empty) begin
                    fifo_out_data_TLAST.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_out_data_TLAST = transaction_save_out_data_TLAST + 1;
                fifo_out_data_TLAST.clear();
                $fclose(fp);
            end
        end
    end

endmodule
