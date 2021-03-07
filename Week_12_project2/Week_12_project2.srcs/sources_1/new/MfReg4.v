`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/29 09:48:04
// Design Name: 
// Module Name: MfReg4
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


module MfReg4(in, out, ld, shr, shl, clk, rst);
	input [3:0] in;
	output [7:0] out;
	input ld, shr, shl, rst, clk;
	reg [7:0] r;

	always @(posedge clk) begin
		if (rst == 1)
			r <= 8'b0000;
		else if (ld == 1) begin
		    r[3:0] <= in;
		end
		else if (shr == 1) begin
			r = r >> 1; 	r[7] = 0;
		end
		else if (shl == 1) begin
			r = r << 1;	r[0] = 0;
		end
	end
	
	assign out = r;		
endmodule