`timescale 1ns / 1ps

module SISO(
   input din_i, 
   input clk_i, 
   output dout_o
);

//net(s)
wire D1;
wire D2;
wire D3;

//SISO Flip Flops
Dff B0(.D_i(din_i), 
   .clk_i(clk_i), 
   .dout_o(D1));
Dff B1(.D_i(D1), 
   .clk_i(clk_i), 
   .dout_o(D2));
Dff B2(.D_i(D2), 
   .clk_i(clk_i), 
   .dout_o(D3));
Dff B3(.D_i(D3), 
   .clk_i(clk_i), 
   .dout_o(dout_o));

endmodule

//D Flip Flop
module Dff(
   input D_i, 
   input clk_i, 
   output reg dout_o
);

always@(posedge clk_i)
   dout_o <= D_i;

endmodule