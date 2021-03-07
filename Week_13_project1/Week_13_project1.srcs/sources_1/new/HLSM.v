module HLSM(input clk, rst, c, buy, input [3:0] a, output [7:0] total, soda, sell_num );
    wire  coin_in, soda_sell, coin_rst;
    controller cont(clk, rst, c, buy, coin_in, soda_sell, coin_rst);
    datapath data(clk, coin_in, soda_sell, coin_rst, a, soda, total, sell_num);
endmodule