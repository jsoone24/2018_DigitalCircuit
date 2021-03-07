`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/29 09:46:40
// Design Name: 
// Module Name: top_module
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


module top_module(input clk_100MHz, input ld, input shr,input shl,input rst, input [3:0] in, output [7:0] seg_out, output [5:0] digit);
    wire clk_out1, clk_out2; wire [3:0] bcd;
    wire [7:0] out;
    parameter N1 = 32'd10000, N2 = 32'd100000000;
    clk_Ndiv clk_div1(clk_100MHz, N1, clk_out1);
    clk_Ndiv clk_div2(clk_100MHz, N2, clk_out2);
    MfReg4 mfr(in, out, ld, shr, shl, clk_out2, rst);
    seg_controller seg( clk_out1, out,  bcd,  digit);
    bcd_dec bcd_dec(bcd, seg_out); 
endmodule
