module uart_test#(
  parameter DBITS=8,
            SBITS=16,
            BAUD_RATE=27,
            BAUD_BITS=5,
            FIFO_EXP=2)(
  input clk_50Mhz,
  input rst,
  input rx,
  input read_uart,
  input write_uart,
  input [DBITS-1:0] write_data,
  output rx_full,
  output rx_empty,
  output tx,
  output [DBITS-1:0] read_data);
  
  wire tick;
  wire tx_done_tick;
  wire rx_done_tick;
  wire tx_empty;
  wire tx_fifo_not_empty;
  wire [DBITS-1:0] tx_fifo_out;
  wire [DBITS-1:0] rx_data_out;
  wire tx_full;
  baudrate#(.M(BAUD_BITS),.N(BAUD_RATE))
  BAUDRATE
  (.clk_50Mhz(clk_50Mhz),
   .rst(rst),
   .tick(tick));
  reciever#(.DBITS(DBITS),.SBITS(SBITS))
  RECIEVER
  (.clk_50Mhz(clk_50Mhz),
   .rst(rst),
   .tick(tick),
   .rx(rx),
   .ready(rx_done_tick),
   .data_out(rx_data_out));
  transmitter#(.DBITS(DBITS),.SBITS(SBITS))
  TRANSMITTER
  (.clk_50Mhz(clk_50Mhz),
   .rst(rst),
   .tick(tick),
   .tx(tx),
   .t_en(tx_fifo_not_empty),
   .din(tx_fifo_out),
   .tx_busy(tx_done_tick));
  fifo_reciever#(.WIDTH(DBITS),.ADDRESS(FIFO_EXP))
  FIFO_RECIEVER
  (.clk_50Mhz(clk_50Mhz),
   .rst(rst),
   .write_data(rx_data_out),
   .read_data(read_data),
   .full(rx_full),
   .empty(rx_empty),
   .wen(rx_done_tick),
   .ren(read_uart));
  fifo_transmitter#(.WIDTH(DBITS),.ADDRESS(FIFO_EXP))
  FIFO_TRANSMITTER
  (.clk_50Mhz(clk_50Mhz),
   .rst(rst),
   .write_data(write_data),
   .read_data(tx_fifo_out),
   .full(tx_full),
   .empty(tx_empty),
   .wen(write_uart),
   .ren(tx_done_tick));
  assign tx_fifo_not_empty=~tx_empty;
endmodule
