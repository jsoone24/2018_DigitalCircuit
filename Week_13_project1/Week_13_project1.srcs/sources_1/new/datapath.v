`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 09:37:45
// Design Name: 
// Module Name: datapath
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


module datapath(input clk, ld, sell, rst, input [3:0] a, output [7:0] soda, output reg [7:0] total, output [7:0] sell_num);
    parameter SODA = 8'h1E;
    reg [7:0] mux_out, reg_out, sub_out, add_out, cnt;
    reg soda_lt, and_out;
    
    always @(posedge clk) begin
        if(rst) begin
            total <= 0;
            cnt <= 0;
        end
        else if(ld) begin
            total <= mux_out;
        end 
        if(and_out) cnt = cnt + 1;
    end

    always @(*) begin
        if(sell) begin
            if(total >= SODA) begin
                mux_out = total - SODA;
                and_out = 1;
            end
            else begin
                mux_out = total;
                and_out = 0;
            end
        end
        else begin
            mux_out = total + a;
            and_out = 0;
        end
    end

    assign sell_num = cnt;
    assign soda = SODA;
endmodule

