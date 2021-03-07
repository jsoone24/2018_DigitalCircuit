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
