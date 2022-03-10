`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 07:25:49 PM
// Design Name: 
// Module Name: lineBuffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// 5x5 kernal, need to read 5 pixels from the buffer
// 720p has 720 horizontal lines , 1280 columns
module lineBuffer(
input   i_clk,
input   i_rst,
input [23:0] i_data, // 3 bytes per pixel of data
input i_data_valid,
output [71:0] o_data, // 3 bytes per pixel, read 3 pixels
input i_rd_data
);
// width of memory 
// each pixel is 24 bits, we have 1280 pixels in a line 
reg [23:0] line [511:0]; //line buffer
reg [8:0] wrPntr; // [10:0] bits required to point to a number of 1280
reg [8:0] rdPntr;

always @(posedge i_clk)
begin
    if(i_data_valid) // if there is valid data
        line[wrPntr]<=i_data; // store it in the write pointer
end

// write
always @(posedge i_clk)
begin
    if(i_rst) // if reset signal
        wrPntr<='d0; // init write pointer to 0
    else if(i_data_valid) // if the data is valid
        wrPntr<=wrPntr+'d1; // increment write pointer for storage
end

// concatonate data in verilog
assign o_data = {line[rdPntr],line[rdPntr+1],line[rdPntr+2]};
// read
always @(posedge i_clk)
begin
    if(i_rst) // if reset signal
        rdPntr<='d0; //
    else if(i_rd_data)
        rdPntr <= rdPntr + 'd1;
end


endmodule