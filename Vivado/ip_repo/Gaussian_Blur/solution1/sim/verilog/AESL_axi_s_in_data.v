// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

`define TV_IN_in_data_TDATA "../tv/cdatafile/c.Blur.autotvin_in_data_V_data_V.dat"
`define INGRESS_STATUS_in_data_TDATA "../tv/stream_size/stream_ingress_status_in_data_V_data_V.dat"
`define TV_IN_in_data_TKEEP "../tv/cdatafile/c.Blur.autotvin_in_data_V_keep_V.dat"
`define INGRESS_STATUS_in_data_TKEEP "../tv/stream_size/stream_ingress_status_in_data_V_keep_V.dat"
`define TV_IN_in_data_TSTRB "../tv/cdatafile/c.Blur.autotvin_in_data_V_strb_V.dat"
`define INGRESS_STATUS_in_data_TSTRB "../tv/stream_size/stream_ingress_status_in_data_V_strb_V.dat"
`define TV_IN_in_data_TLAST "../tv/cdatafile/c.Blur.autotvin_in_data_V_last_V.dat"
`define INGRESS_STATUS_in_data_TLAST "../tv/stream_size/stream_ingress_status_in_data_V_last_V.dat"

`define AUTOTB_TRANSACTION_NUM 1

module AESL_axi_s_in_data (
    input clk,
    input reset,
    output [24 - 1:0] TRAN_in_data_TDATA,
    output [3 - 1:0] TRAN_in_data_TKEEP,
    output [3 - 1:0] TRAN_in_data_TSTRB,
    output TRAN_in_data_TLAST,
    output TRAN_in_data_TVALID,
    input TRAN_in_data_TREADY,
    input ready,
    input done,
    output [31:0] transaction);

    wire TRAN_in_data_TVALID_temp;
    wire in_data_TDATA_full;
    wire in_data_TDATA_empty;
    reg in_data_TDATA_write_en;
    reg [24 - 1:0] in_data_TDATA_write_data;
    reg in_data_TDATA_read_en;
    wire [24 - 1:0] in_data_TDATA_read_data;
    
    fifo #(1310720, 24) fifo_in_data_TDATA (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(in_data_TDATA_write_en),
        .write_data(in_data_TDATA_write_data),
        .read_clock(clk),
        .read_en(in_data_TDATA_read_en),
        .read_data(in_data_TDATA_read_data),
        .full(in_data_TDATA_full),
        .empty(in_data_TDATA_empty));
    
    always @ (*) begin
        in_data_TDATA_write_en <= 0;
        in_data_TDATA_read_en <= TRAN_in_data_TREADY & TRAN_in_data_TVALID;
    end
    
    assign TRAN_in_data_TDATA = in_data_TDATA_read_data;
    wire in_data_TKEEP_full;
    wire in_data_TKEEP_empty;
    reg in_data_TKEEP_write_en;
    reg [3 - 1:0] in_data_TKEEP_write_data;
    reg in_data_TKEEP_read_en;
    wire [3 - 1:0] in_data_TKEEP_read_data;
    
    fifo #(1310720, 3) fifo_in_data_TKEEP (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(in_data_TKEEP_write_en),
        .write_data(in_data_TKEEP_write_data),
        .read_clock(clk),
        .read_en(in_data_TKEEP_read_en),
        .read_data(in_data_TKEEP_read_data),
        .full(in_data_TKEEP_full),
        .empty(in_data_TKEEP_empty));
    
    always @ (*) begin
        in_data_TKEEP_write_en <= 0;
        in_data_TKEEP_read_en <= TRAN_in_data_TREADY & TRAN_in_data_TVALID;
    end
    
    assign TRAN_in_data_TKEEP = in_data_TKEEP_read_data;
    wire in_data_TSTRB_full;
    wire in_data_TSTRB_empty;
    reg in_data_TSTRB_write_en;
    reg [3 - 1:0] in_data_TSTRB_write_data;
    reg in_data_TSTRB_read_en;
    wire [3 - 1:0] in_data_TSTRB_read_data;
    
    fifo #(1310720, 3) fifo_in_data_TSTRB (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(in_data_TSTRB_write_en),
        .write_data(in_data_TSTRB_write_data),
        .read_clock(clk),
        .read_en(in_data_TSTRB_read_en),
        .read_data(in_data_TSTRB_read_data),
        .full(in_data_TSTRB_full),
        .empty(in_data_TSTRB_empty));
    
    always @ (*) begin
        in_data_TSTRB_write_en <= 0;
        in_data_TSTRB_read_en <= TRAN_in_data_TREADY & TRAN_in_data_TVALID;
    end
    
    assign TRAN_in_data_TSTRB = in_data_TSTRB_read_data;
    wire in_data_TLAST_full;
    wire in_data_TLAST_empty;
    reg in_data_TLAST_write_en;
    reg [1 - 1:0] in_data_TLAST_write_data;
    reg in_data_TLAST_read_en;
    wire [1 - 1:0] in_data_TLAST_read_data;
    
    fifo #(1310720, 1) fifo_in_data_TLAST (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(in_data_TLAST_write_en),
        .write_data(in_data_TLAST_write_data),
        .read_clock(clk),
        .read_en(in_data_TLAST_read_en),
        .read_data(in_data_TLAST_read_data),
        .full(in_data_TLAST_full),
        .empty(in_data_TLAST_empty));
    
    always @ (*) begin
        in_data_TLAST_write_en <= 0;
        in_data_TLAST_read_en <= TRAN_in_data_TREADY & TRAN_in_data_TVALID;
    end
    
    assign TRAN_in_data_TLAST = in_data_TLAST_read_data;
    assign TRAN_in_data_TVALID = TRAN_in_data_TVALID_temp;

    
    reg in_data_TDATA_valid = 0; // ingress buffer indicator: in_data_TDATA
    reg in_data_TKEEP_valid = 0; // ingress buffer indicator: in_data_TKEEP
    reg in_data_TSTRB_valid = 0; // ingress buffer indicator: in_data_TSTRB
    reg in_data_TLAST_valid = 0; // ingress buffer indicator: in_data_TLAST
    
    assign TRAN_in_data_TVALID_temp = ~(in_data_TDATA_empty || in_data_TKEEP_empty || in_data_TSTRB_empty || in_data_TLAST_empty) || (in_data_TDATA_valid && in_data_TKEEP_valid && in_data_TSTRB_valid && in_data_TLAST_valid);
    
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
    
    reg [31:0] transaction_load_in_data_TDATA;
    
    assign transaction = transaction_load_in_data_TDATA;
    
    initial begin : AXI_stream_driver_in_data_TDATA
        integer fp;
        reg [191:0] token;
        reg [24 - 1:0] data;
        reg [191:0] data_integer;
        integer fp_ingress_status;
        reg [191:0] token_ingress_status;
        reg [31:0] ingress_status;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_in_data_TDATA = 0;
        fifo_in_data_TDATA.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_in_data_TDATA, "r");
        if (fp == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_in_data_TDATA);
            $finish;
        end
        fp_ingress_status = $fopen(`INGRESS_STATUS_in_data_TDATA, "r");
        if (fp_ingress_status == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `INGRESS_STATUS_in_data_TDATA);
            $finish;
        end
        token = read_token(fp);
        token_ingress_status = read_token(fp_ingress_status);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        token_ingress_status = read_token(fp_ingress_status);
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // load ingress status at beginning of transaction
                    fifo_in_data_TDATA.clear();
                    token = read_token(fp);
                    ret = $sscanf(token_ingress_status, "%d", ingress_status);
                    token_ingress_status = read_token(fp_ingress_status);
                    while (token != "[[/transaction]]") begin
                        if (fifo_in_data_TDATA.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_in_data_TDATA.push(data);
                        token = read_token(fp);
                        ret = $sscanf(token_ingress_status, "%d", ingress_status);
                        token_ingress_status = read_token(fp_ingress_status);
                    end
                    in_data_TDATA_valid = (ingress_status > 0);
                    token = read_token(fp);
                    token_ingress_status = read_token(fp_ingress_status);
                end else begin
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                    if (fp_ingress_status != 0) begin
                        $fclose(fp_ingress_status);
                        fp_ingress_status = 0;
                    end
                end
                transaction_load_in_data_TDATA = transaction_load_in_data_TDATA + 1;
            end
        end
    end
    
    reg [31:0] transaction_load_in_data_TKEEP;
    
    initial begin : AXI_stream_driver_in_data_TKEEP
        integer fp;
        reg [191:0] token;
        reg [3 - 1:0] data;
        reg [191:0] data_integer;
        integer fp_ingress_status;
        reg [191:0] token_ingress_status;
        reg [31:0] ingress_status;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_in_data_TKEEP = 0;
        fifo_in_data_TKEEP.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_in_data_TKEEP, "r");
        if (fp == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_in_data_TKEEP);
            $finish;
        end
        fp_ingress_status = $fopen(`INGRESS_STATUS_in_data_TKEEP, "r");
        if (fp_ingress_status == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `INGRESS_STATUS_in_data_TKEEP);
            $finish;
        end
        token = read_token(fp);
        token_ingress_status = read_token(fp_ingress_status);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        token_ingress_status = read_token(fp_ingress_status);
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // load ingress status at beginning of transaction
                    fifo_in_data_TKEEP.clear();
                    token = read_token(fp);
                    ret = $sscanf(token_ingress_status, "%d", ingress_status);
                    token_ingress_status = read_token(fp_ingress_status);
                    while (token != "[[/transaction]]") begin
                        if (fifo_in_data_TKEEP.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_in_data_TKEEP.push(data);
                        token = read_token(fp);
                        ret = $sscanf(token_ingress_status, "%d", ingress_status);
                        token_ingress_status = read_token(fp_ingress_status);
                    end
                    in_data_TKEEP_valid = (ingress_status > 0);
                    token = read_token(fp);
                    token_ingress_status = read_token(fp_ingress_status);
                end else begin
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                    if (fp_ingress_status != 0) begin
                        $fclose(fp_ingress_status);
                        fp_ingress_status = 0;
                    end
                end
                transaction_load_in_data_TKEEP = transaction_load_in_data_TKEEP + 1;
            end
        end
    end
    
    reg [31:0] transaction_load_in_data_TSTRB;
    
    initial begin : AXI_stream_driver_in_data_TSTRB
        integer fp;
        reg [191:0] token;
        reg [3 - 1:0] data;
        reg [191:0] data_integer;
        integer fp_ingress_status;
        reg [191:0] token_ingress_status;
        reg [31:0] ingress_status;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_in_data_TSTRB = 0;
        fifo_in_data_TSTRB.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_in_data_TSTRB, "r");
        if (fp == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_in_data_TSTRB);
            $finish;
        end
        fp_ingress_status = $fopen(`INGRESS_STATUS_in_data_TSTRB, "r");
        if (fp_ingress_status == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `INGRESS_STATUS_in_data_TSTRB);
            $finish;
        end
        token = read_token(fp);
        token_ingress_status = read_token(fp_ingress_status);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        token_ingress_status = read_token(fp_ingress_status);
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // load ingress status at beginning of transaction
                    fifo_in_data_TSTRB.clear();
                    token = read_token(fp);
                    ret = $sscanf(token_ingress_status, "%d", ingress_status);
                    token_ingress_status = read_token(fp_ingress_status);
                    while (token != "[[/transaction]]") begin
                        if (fifo_in_data_TSTRB.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_in_data_TSTRB.push(data);
                        token = read_token(fp);
                        ret = $sscanf(token_ingress_status, "%d", ingress_status);
                        token_ingress_status = read_token(fp_ingress_status);
                    end
                    in_data_TSTRB_valid = (ingress_status > 0);
                    token = read_token(fp);
                    token_ingress_status = read_token(fp_ingress_status);
                end else begin
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                    if (fp_ingress_status != 0) begin
                        $fclose(fp_ingress_status);
                        fp_ingress_status = 0;
                    end
                end
                transaction_load_in_data_TSTRB = transaction_load_in_data_TSTRB + 1;
            end
        end
    end
    
    reg [31:0] transaction_load_in_data_TLAST;
    
    initial begin : AXI_stream_driver_in_data_TLAST
        integer fp;
        reg [191:0] token;
        reg [1 - 1:0] data;
        reg [191:0] data_integer;
        integer fp_ingress_status;
        reg [191:0] token_ingress_status;
        reg [31:0] ingress_status;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_in_data_TLAST = 0;
        fifo_in_data_TLAST.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_in_data_TLAST, "r");
        if (fp == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_in_data_TLAST);
            $finish;
        end
        fp_ingress_status = $fopen(`INGRESS_STATUS_in_data_TLAST, "r");
        if (fp_ingress_status == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `INGRESS_STATUS_in_data_TLAST);
            $finish;
        end
        token = read_token(fp);
        token_ingress_status = read_token(fp_ingress_status);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        token_ingress_status = read_token(fp_ingress_status);
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // load ingress status at beginning of transaction
                    fifo_in_data_TLAST.clear();
                    token = read_token(fp);
                    ret = $sscanf(token_ingress_status, "%d", ingress_status);
                    token_ingress_status = read_token(fp_ingress_status);
                    while (token != "[[/transaction]]") begin
                        if (fifo_in_data_TLAST.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_in_data_TLAST.push(data);
                        token = read_token(fp);
                        ret = $sscanf(token_ingress_status, "%d", ingress_status);
                        token_ingress_status = read_token(fp_ingress_status);
                    end
                    in_data_TLAST_valid = (ingress_status > 0);
                    token = read_token(fp);
                    token_ingress_status = read_token(fp_ingress_status);
                end else begin
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                    if (fp_ingress_status != 0) begin
                        $fclose(fp_ingress_status);
                        fp_ingress_status = 0;
                    end
                end
                transaction_load_in_data_TLAST = transaction_load_in_data_TLAST + 1;
            end
        end
    end

endmodule
