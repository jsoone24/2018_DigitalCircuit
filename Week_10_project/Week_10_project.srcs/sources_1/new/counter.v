`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/10 13:34:03
// Design Name: 
// Module Name: counter
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


module sync_counter_rst(input [31:0] n,input clk, input rst, output reg [13:0] count);
    always @(posedge clk, negedge rst) begin
        if( rst == 0 ) count <= 0;
       else if (count == (n-1)) count <= 0;
        else count <= count + 1;
    end
endmodule