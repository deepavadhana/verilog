module transmitter #(parameter DBITS = 8, SBITS = 16)(
  input clk_50Mhz,
  input rst,
  input tick,
  input t_en,
  input [DBITS-1:0] din,
  output reg tx_busy,
  output tx
);

  localparam [1:0] IDLE  = 2'b00,
                   START = 2'b01,
                   DATA  = 2'b10,
                   STOP  = 2'b11;

  reg [1:0] state, next_state;
  reg [2:0] bits, bits_next;
  reg [DBITS-1:0] data_reg, data_next;
  reg [3:0] tick_reg, tick_next;
  reg tx_reg, tx_next;

  
  always @(posedge clk_50Mhz or posedge rst) begin
    if (rst) begin
      state     <= IDLE;
      bits      <= 0;
      data_reg  <= 0;
      tick_reg  <= 0;
      tx_reg    <= 1'b1;
    end else begin
      state     <= next_state;
      bits      <= bits_next;
      data_reg  <= data_next;
      tick_reg  <= tick_next;
      tx_reg    <= tx_next;
    end
  end
  always @(*) begin
    next_state = state;
    bits_next  = bits;
    data_next  = data_reg;
    tick_next  = tick_reg;
    tx_next    = tx_reg;
    tx_busy = (state != IDLE);

    case (state)
      IDLE: begin
        tx_next = 1'b1;
        if (t_en) begin
          next_state = START;
          data_next  = din;
          tick_next  = 0;
        end
      end

      START: begin
        tx_next = 1'b0;
        if (tick) begin
          if (tick_reg == 15) begin
            next_state = DATA;
            bits_next  = 0;
            tick_next  = 0;
          end else begin
            tick_next = tick_reg + 1;
          end
        end
      end

      DATA: begin
        tx_next = data_reg[0];
        if (tick) begin
          if (tick_reg == 8) begin 
            tick_next = 0;
            data_next = data_reg >> 1;
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
        tx_next = 1'b1;
        if (tick) begin
          if (tick_reg == (SBITS - 1)) begin
            next_state = IDLE;
          end else begin
            tick_next = tick_reg + 1;
          end
        end
      end
    endcase
  end

  assign tx = tx_reg;

endmodule
