`timescale 1ns / 1ps

module tb_SISO();
reg din_ti;
reg clk_ti;
wire dout_to;

//instantiation
SISO DUT(.din_i(din_ti), 
   .clk_i(clk_ti), 
   .dout_o(dout_to));

//clock
initial begin
   clk_ti = 1'b0;
   forever 
      #5 clk_ti = ~clk_ti;
end

//feeding
initial begin
   din_ti = 1'b0; 
   repeat(50)
      #10 din_ti = $urandom_range(0, 1);
   #10 $finish;
end

//capture
initial begin
$monitor("Time: %0t | Clock: %b | Input: %b | Output: %b", $time, clk_ti, din_ti, dout_to);
$dumpfile("SISO.vcd");
$dumpvars(0, tb_SISO);
end

endmodule