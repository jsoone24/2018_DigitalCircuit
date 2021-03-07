`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/10 13:34:37
// Design Name: 
// Module Name: czxcz
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

module seg_display(input clk_100MHz, input rst,output [5:0] digit, output [7:0] seg_out);
    wire clk_10KHz, clk_1Hz; wire [3:0] bcd;
    wire [13:0] value;
    integer n;
    parameter N1 = 32'd10000, N2 = 32'd20000000;
    
    initial begin
          n <= 32'd9999;
     end
            
    clk_Ndiv clk_div1(clk_100MHz, N2, clk_1Hz);
    clk_Ndiv clk_div2(clk_100MHz, N1, clk_10KHz);
    sync_counter_rst count(n,clk_1Hz, ~rst, value);
    seg_controller seg_cont(clk_10KHz, value, bcd, digit);
    bcd_dec bcd_dec(bcd, seg_out); 
endmodule
