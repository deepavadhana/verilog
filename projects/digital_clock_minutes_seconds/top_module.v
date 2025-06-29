module top_module(
  input clk_50Mhz,
  input rst,
  output wire [7:0] seg,
  output wire [3:0] out
);
  wire clk_1hz,clk_500hz;
  
  clk_divider dut1(.clk_50Mhz(clk_50Mhz),
    .rst(rst),
    .clk_1hz(clk_1hz),
    .clk_500hz(clk_500hz)
  );

  seg_counter dut2( .clk_1hz(clk_1hz),.clk_50Mhz(clk_50Mhz),.rst(rst), .out(out), .seg(seg));
endmodule

