module top_module #(
  parameter M = 5,
  parameter N = 27,
  parameter DBITS = 8,
  parameter SBITS = 16
)(
  input clk_50Mhz,
  input rst,
  input rx,
  output tx,
  output [DBITS-1:0] led,
  output [7:0] seg,
  output [3:0] an,
  output [7:0] lcd_data,
  output lcd_en,
  output lcd_rs

);
assign an = 4'b1111;  
assign seg[7] = 1'b1; 


  wire tick;
  wire [DBITS-1:0] rx_data;
  wire rx_ready;
  wire tx_busy;
  reg [DBITS-1:0] rx_data_reg;
  reg [DBITS-1:0] r_data_reg;
  reg tx_start;

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

  transmitter #(
    .DBITS(DBITS),
    .SBITS(SBITS)
  ) uart_transmitter (
    .clk_50Mhz(clk_50Mhz),
    .rst(rst),
    .tick(tick),
    .t_en(tx_start),
    .din(rx_data_reg),
    .tx_busy(tx_busy),
    .tx(tx)
  );

  always @(posedge clk_50Mhz) begin
    if (rst) begin
      rx_data_reg <= 0;
      tx_start <= 0;
    end else begin
      if (rx_ready && !tx_busy) begin
        rx_data_reg <= rx_data;
        tx_start <= 1;
      end else begin
        tx_start <= 0;
      end
    end
  end

  assign led = rx_data_reg;
wire [4:0] char_index;

assign char_index = (rx_data_reg >= "A" && rx_data_reg <= "Z") ?
                    rx_data_reg - "A" :
                    5'd31;  // invalid/default

seg7_alphabet_decoder seg_inst (
  .bin(char_index),
  .seg(seg)
);
always @(posedge clk_50Mhz) begin
        if (rst)
            r_data_reg <= 8'h20;
        else if (rx_ready)
            r_data_reg <= rx_data;
    end

  lcd_driver lcd (
    .clk(clk_50Mhz),
    .rst(rst),
    .char_in(r_data_reg),
    .lcd_data(lcd_data),
    .lcd_en(lcd_en),
    .lcd_rs(lcd_rs)
);


endmodule
