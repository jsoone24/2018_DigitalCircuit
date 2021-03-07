`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 10:36:32
// Design Name: 
// Module Name: top
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


module top(input clk, input rst, input in, output [2:0] moore_out, output [2:0] mealy_out);
    wire div_clk;
    parameter N = 32'd200000000;
    clk_Ndiv clk_div(clk, N,div_clk); 
    moore_FSM moore_fsm(in, rst, div_clk, moore_out);
    mealy_FSM mealy_fsm(in, rst, div_clk, mealy_out);
endmodule
