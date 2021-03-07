module controller(input clk, rst, c, buy,  output reg coin_in, output reg soda_sell, output reg coin_rst);
  parameter INIT=2'd0, WAIT=2'd1, INSERT = 2'd2, DISP = 2'd3;
  reg [1:0] state, next_state;

  always @(c, buy,  state) begin
      case(state)
           INIT: begin
              coin_rst <= 1; soda_sell <= 0; coin_in <= 0;
              next_state<=WAIT;
           end
           WAIT: begin
              coin_rst <= 0; soda_sell <= 0; coin_in <= 0;
              if(c)  next_state <= INSERT;
              else begin
                  if(buy==1)
                       next_state <= DISP;
                  else
                       next_state <= WAIT;
              end
           end
           INSERT : begin
               coin_rst <= 0; soda_sell <= 0; coin_in <= 1;
               next_state<=WAIT;           
           end
           DISP : begin
               coin_rst <= 0; soda_sell <= 1; coin_in <= 1;
               next_state<=WAIT;           
           end
           default : begin
                next_state <= INIT;
           end
      endcase
  end

  always @(posedge clk) begin
      if(rst==1)
          state<=INIT;
      else
          state<=next_state;
  end
endmodule