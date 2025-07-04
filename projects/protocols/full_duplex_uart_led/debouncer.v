module debouncer(
  input clk_50Mhz,
  input rst,
  input btn,
  output reg db_level,
  output reg db_tick
);
  parameter N = 20;
  parameter [1:0] ZERO = 2'b00, WAIT = 2'b01, ONE = 2'b10;
  reg [1:0] state, next_state;
  reg [N-1:0] qreg;
  wire [N-1:0] qnext;
  reg qload, qdec;
  wire qzero;

  always @(posedge clk_50Mhz or posedge rst) begin
    if (rst) begin
      state <= ZERO;
      qreg <= 0;
    end else begin
      state <= next_state;
      qreg <= qnext;
    end
  end

  assign qnext = (qload) ? {N{1'b1}} : (qdec) ? qreg - 1 : qreg;
  assign qzero = (qnext == 0);

  always @(*) begin
    next_state = state;
    qload = 1'b0;
    qdec = 1'b0;
    db_tick = 1'b0;
    case (state)
      ZERO: begin
        db_level = 1'b0;
        if (btn) begin
          next_state = WAIT;
          qload = 1'b1;
        end
      end
      WAIT: begin
        db_level = 1'b0;
        if (btn) begin
          qdec = 1'b1;
          if (qzero) begin
            next_state = ONE;
            db_tick = 1'b1;
          end
        end else begin
          next_state = ZERO;
        end
      end
      ONE: begin
        db_level = 1'b1;
        if (~btn) begin
          qdec = 1'b1;
          if (qzero)
            next_state = ZERO;
        end
      end
      default: next_state = ZERO;
    endcase
  end
endmodule

  
 
   
