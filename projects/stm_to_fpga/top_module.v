module top_module #(
  parameter M = 5,
  parameter N = 27,
  parameter DBITS = 8,
  parameter SBITS = 16
)(
  input clk_50Mhz,
  input rst,
  input rx,
  output [DBITS-1:0] rx_data,
  output rx_ready
);

  wire tick;

  baudrate #(
    .M(M),
    .N(N)
  ) uart_baudrate (
    .clk_50Mhz(clk_50Mhz),
    .rst(rst),
    .tick(tick)
  );

  reciever #(
    .DBITS(DBITS),
    .SBITS(SBITS)
  ) uart_receiver (
    .clk_50Mhz(clk_50Mhz),
    .rst(rst),
    .tick(tick),
    .rx(rx),
    .ready(rx_ready),
    .data_out(rx_data)
  );

endmodule
