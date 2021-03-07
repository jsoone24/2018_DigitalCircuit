`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 10:36:32
// Design Name: 
// Module Name: clk_Ndiv
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


module clk_Ndiv(input clk_100MHz, input [31:0] n, output reg clk_out);
    integer count, N;
    always @(*) N <= ((n/2)-1);
    always @(posedge clk_100MHz) begin
        if(count == N) begin
            count <= 0;
            clk_out <= ~clk_out;
        end
        else count <= count + 1;
    end
endmodule
