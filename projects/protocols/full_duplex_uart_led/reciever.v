 module reciever#(parameter DBITS=8, SBITS=16)(
  input clk_50Mhz,
  input rst,
  input tick,
  input rx,
  output reg ready,
  output [DBITS-1:0] data_out
);
  localparam [1:0]
    IDLE  = 2'b00,
    START = 2'b01,
    DATA  = 2'b10,
    STOP  = 2'b11;

  reg [1:0] state, next_state;
  reg [2:0] bits, bits_next;
  reg [3:0] tick_reg, tick_next;
  reg [7:0] data_reg, data_next;

  // Double synchronizer for rx to prevent metastability
  reg rx_sync_0, rx_sync_1;
  wire rx_stable;

  assign rx_stable = rx_sync_1;

  always @(posedge clk_50Mhz) begin
    rx_sync_0 <= rx;
    rx_sync_1 <= rx_sync_0;
  end

  always @(posedge clk_50Mhz or posedge rst) begin
    if (rst) begin
      state     <= IDLE;
      bits      <= 0;
      data_reg  <= 0;
      tick_reg  <= 0;
    end else begin
      state     <= next_state;
      bits      <= bits_next;
      data_reg  <= data_next;
      tick_reg  <= tick_next;
    end
  end

  always @(*) begin
    next_state = state;
    bits_next  = bits;
    data_next  = data_reg;
    tick_next  = tick_reg;
    ready      = 1'b0;

    case (state)
      IDLE: begin
        if (~rx_stable) begin
          next_state = START;
          tick_next  = 0;
        end
      end

      START: begin
        if (tick) begin
          if (tick_reg == 8) begin  
            tick_next  = 0;
            next_state = DATA;
            bits_next  = 0;
          end else begin
            tick_next = tick_reg + 1;
          end
        end
      end

      DATA: begin
        if (tick) begin
          if (tick_reg == 15) begin
            tick_next  = 0;
            data_next  = {rx_stable, data_reg[7:1]}; 
            if (bits == (DBITS - 1)) begin
              next_state = STOP;
            end else begin
              bits_next = bits + 1;
            end
          end else begin
            tick_next = tick_reg + 1;
          end
        end
      end

      STOP: begin
        if (tick) begin
          if (tick_reg == (SBITS - 1)) begin
            ready = 1'b1;
            next_state = IDLE;
          end else begin
            tick_next = tick_reg + 1;
          end
        end
      end
    endcase
  end

  assign data_out = data_reg;
endmodule
