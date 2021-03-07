module N_adder(input [3:0] a, b, output reg [3:0] sum, output reg c_out);
    always @(*) begin
        {c_out, sum} <= a + b;
    end 
endmodule
