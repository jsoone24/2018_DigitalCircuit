`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/10 13:34:21
// Design Name: 
// Module Name: seg
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


module seg_controller(input clk, input [13:0] value, output reg [3:0] bcd, output reg [5:0] dig);
    reg [3:0] timer;
    reg [2:0] dig_sel;
    reg [3:0] num_1, num_10 , num_100, num_1000;
    always @(posedge clk) begin
        if(timer == 4'd15) timer = 0;
        else timer = timer + 1;
    end
    
   always @(timer) begin
            if(timer[1:0] == 2'b11) dig_sel = 3'd4;  // 데드 타임
            else dig_sel = timer[3:2];
   end
    always @(value) begin
        num_1 <= value % 4'd10;
        num_10 <= ((value % 7'd100) / 4'd10);
        num_100 <= ((value % 10'd1000) / 7'd100);
        num_1000 <= (value / 10'd1000);
    end//1의 자리와 10의자리를 숫자를 구하는 수식?
    
    always @(dig_sel) begin
        case(dig_sel)
            3'd0 : begin // dig6 1의 자리 표시
                bcd <= num_1;
                dig <= 6'b000001;
            end
            3'd1 : begin // dig 2 10의 자리 표시
                bcd <= num_10;
                dig <= 6'b000010;
            end
            3'd2 : begin // dig 3 100의 자리 표시
                 bcd <= num_100;
                 dig <= 6'b000100;
            end
            3'd3 : begin // dig 4 1000의 자리 표시
                 bcd <= num_1000;
                 dig <= 6'b001000;
            end
            3'd4 : begin // dead time
                bcd <= 4'b0000;
                dig <= 6'b000000;
            end
            default : begin // 모든 dig LED 0 표시
                bcd <= 4'b0000;
                dig <= 6'b111111;
            end
        endcase
    end
endmodule
