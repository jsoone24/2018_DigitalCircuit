`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 10:36:32
// Design Name: 
// Module Name: mealy_FSM
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


//mealy state machine

module mealy_FSM(input in, input rst, input clk, output reg [2:0] out);
    parameter INIT = 2'b00, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;
    reg [1:0] state;         //state register 
    reg [1:0] next_state;
    always @(in , state) begin
                case(state)
                    INIT : begin
                        out <= 3'b000;
                        next_state <= S1;
                    end
                    S1 : begin
                        if(in) begin
                            out <= 3'b010;
                            next_state <= S2;
                        end   
                        else  begin
                            out <= 3'b001;
                            next_state <= S1;
                        end
                    end
                    S2 : begin
                        if(in) begin
                            out <= 3'b100;
                            next_state <= S3;
                        end
                        else begin
                            out <= 3'b010;
                            next_state <= S1;
                        end
                    end
                    S3 : begin
                        if(in) begin
                            out <=3'b111;
                            next_state <= S1;
                        end
                        else begin
                            out <= 3'b010;
                            next_state <= S2;
                        end
                    end
                 endcase
        end
   always @(posedge clk) begin
        if(rst) state <= INIT;
        else state <= next_state;
   end
endmodule
