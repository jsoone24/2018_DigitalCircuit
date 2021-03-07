`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/10 13:33:44
// Design Name: 
// Module Name: z
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


module bcd_dec(input [3:0] bcd, output reg [7:0] seg);
    always @(*) begin
        case(bcd)
            4'b0000 : seg = 8'b00111111;  //LED 0
            4'b0001 : seg = 8'b00000110;  //LED 1
            4'b0010 : seg = 8'b01011011;  //LED 2
            4'b0011 : seg = 8'b01001111;  //LED 3
            4'b0100 : seg = 8'b01100110;  //LED 4
            4'b0101 : seg = 8'b01101101;  //LED 5
            4'b0110 : seg = 8'b01111101;  //LED 6
            4'b0111 : seg = 8'b00000111;  //LED 7
            4'b1000 : seg = 8'b01111111;  //LED 8
            4'b1001 : seg = 8'b01100111;  //LED 9
            default : seg = 8'b00111111; // default 0
        endcase
    end    
endmodule
