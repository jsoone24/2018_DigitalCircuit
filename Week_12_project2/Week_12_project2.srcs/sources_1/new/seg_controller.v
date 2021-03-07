module seg_controller(input clk, input [7:0] in, output reg [3:0] bcd, output reg [5:0] dig);
    reg [2:0] timer;
    reg [2:0] dig_sel;
    always @(posedge clk) begin
        if(timer == 3'd7) timer = 0;
        else timer = timer + 1;
    end
    
    always @(timer) begin
        if(timer[1:0] == 2'b11) dig_sel = 3'd2;  // 데드 타임
        else dig_sel = timer[2];
    end
    
    always @(dig_sel) begin
        case(dig_sel)
            3'd0 : begin // dig6 1의 자리 표시
                bcd <= in[3:0];
                dig <= 6'b000001;
            end
            3'd1 : begin // dig 2 10의 자리 표시
                bcd <= in[7:4];
                dig <= 6'b000010;
            end
            3'd2 : begin // dead time
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