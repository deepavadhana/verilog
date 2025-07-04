module top_module(
    input clk_50Mhz,      
    input rst,              
    input rx,         
    input btn,            
    output tx,            
    output [7:0] LED       
    );

   wire rx_full, rx_empty, btn_tick;
    wire [7:0] rec_data, rec_data1;
  
uart_test UART_UNIT(
    .clk_50Mhz(clk_50Mhz),
    .rst(rst),
    .read_uart(btn_tick),
    .write_uart(btn_tick),
    .rx(rx),
    .write_data(rec_data1),
    .rx_full(rx_full),
    .rx_empty(rx_empty),
    .read_data(rec_data),
    .tx(tx)
  );

  debouncer DEBOUNCE_INST (
    .clk_50Mhz(clk_50Mhz),
    .rst(rst),
    .btn(btn),
    .db_level(),
    .db_tick(btn_tick)
  );

 assign rec_data1 = ((rec_data >= 8'h20) && (rec_data < 8'h7E)) ? rec_data + 1 : 8'h2E; 
 
    assign LED = rec_data;           
    
endmodule
