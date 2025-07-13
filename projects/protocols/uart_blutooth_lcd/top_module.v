module top_module(
    input clk_50Mhz,
    input rst,
    input rx,
    output [7:0] lcd_data,
    output lcd_en,
    output lcd_rs
);
   wire tick;

    baudrate_generator #(.DIVISOR(325)) baud_gen (
        .clk(clk_50Mhz),
        .rst(rst),
        .tick(tick)
    );
   wire [7:0] rx_data;
    wire rx_ready;

    uart_receiver uart_rx (
        .clk(clk_50Mhz),
        .rst(rst),
        .tick(tick),
        .rx(rx),
        .data_out(rx_data),
        .ready(rx_ready)
    );
    reg rx_ready_d;
    always @(posedge clk_50Mhz or posedge rst)
        if (rst)
            rx_ready_d <= 0;
        else
            rx_ready_d <= rx_ready;

    wire rx_new = rx_ready & ~rx_ready_d;
    reg [7:0] uart_byte;
    always @(posedge clk_50Mhz or posedge rst) begin
        if (rst)
            uart_byte <= 8'h20;
        else if (rx_new)
            uart_byte <= (rx_data >= 8'h20 && rx_data <= 8'h7E) ? rx_data : 8'h20;
    end
   lcd_driver lcd (
        .clk(clk_50Mhz),
        .rst(rst),
        .char_in(uart_byte),
        .lcd_data(lcd_data),
        .lcd_en(lcd_en),
        .lcd_rs(lcd_rs)
    );

endmodule
