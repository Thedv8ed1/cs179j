`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 10:09:05 PM
// Design Name: 
// Module Name: conv
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

module conv(
input        i_clk,
input [215:0] i_pixel_data, // (3 bytes/pixel)*(8bits/byte)*(3pixels/row)*3 rows
input        i_pixel_data_valid,
output reg [23:0] o_convolved_data, // output single pixel
output reg   o_convolved_data_valid
    );
    
integer i; 
reg [8:0] kernel [8:0]; // kernal values, total kernal entries. [8:0] kernel [14:0] for a 15x15 kernal
reg [27:0] multData[8:0]; // worst case pixel values of 255,255,255 * 9 for the kernal requires 28 bits
reg [27:0] sumDataInt;
reg [27:0] sumData;
reg multDataValid;
reg sumDataValid;
reg convolved_data_valid;

reg [8:0] threeXthree;
initial
begin
    threeXthree[8]=1;threeXthree[7]=2;threeXthree[6]=1;
    threeXthree[5]=2;threeXthree[4]=4;threeXthree[3]=2;
    threeXthree[2]=1;threeXthree[1]=2;threeXthree[0]=1;
    //kernel[0]=
    for(i=0;i<9;i=i+1)
    begin
        kernel[i]=threeXthree[i];
    end
end    
    
always @(posedge i_clk)
begin
    for(i=0;i<9;i=i+1)
    begin
        multData[i] <= kernel[i]*i_pixel_data[i*24+:24];//
    end
    multDataValid <= i_pixel_data_valid;
end


always @(*)
begin
    sumDataInt = 0;
    for(i=0;i<9;i=i+1)
    begin
        sumDataInt = sumDataInt + multData[i];
    end
end

always @(posedge i_clk)
begin
    sumData<=sumDataInt;
    sumDataValid<=multDataValid;
end
    
always @(posedge i_clk)
begin
    o_convolved_data<=sumData/16;
    o_convolved_data_valid<=sumDataValid;
end
    
endmodule