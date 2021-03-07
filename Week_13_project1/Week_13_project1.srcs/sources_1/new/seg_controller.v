module seg_controller(input clk, input [7:0] tot, sod, sell, output reg [3:0] bcd, output reg [5:0] dig);
    reg [4:0] timer;
    reg [2:0] dig_sel;
    always @(posedge clk) begin
        if(timer == 5'd23) timer = 0;
        else timer = timer + 1;
    end

    always @(timer) begin
        if(timer[1:0] == 2'b11) dig_sel = 3'd6; // 데드 타임
        else dig_sel = timer[4:2];
    end

    always @(dig_sel) begin
        case(dig_sel)
            3'd0 : begin // dig1 LED 1 표시
               bcd <= sod[7:4];
               dig <= 6'b100000;
            end
            3'd1 : begin // dig 2 LED 2 표시
               bcd <= sod[3:0];
               dig <= 6'b010000;
            end
            3'd2 : begin // dig 3 LED 3 표시
               bcd <= tot[7:4];
               dig <= 6'b001000;
            end
            3'd3 : begin // dig 4 LED 4 표시
               bcd <= tot[3:0];
               dig <= 6'b000100;
            end
            3'd4 : begin // dig 5 LED 5 표시
               bcd <= sell[7:4];
               dig <= 6'b000010;
            end
            3'd5 : begin // dig 6 LED 6 표시
               bcd <= sell[3:0];
               dig <= 6'b000001;
            end
            3'd6 : begin // dead time
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