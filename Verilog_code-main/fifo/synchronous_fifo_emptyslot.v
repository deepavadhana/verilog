module synchronousfifo #(parameter DEPTH=8, DATA_WIDTH=8)(
  input wen, ren, clk, reset,
  input [DATA_WIDTH-1:0] din,
  output reg [DATA_WIDTH-1:0] dout,
  output full, empty
);
  reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];
  reg [$clog2(DEPTH):0] wptr = 0, rptr = 0;

  always @(posedge clk) begin
    if (!reset) begin
      wptr <= 0;
    end else if (wen && !full) begin
      fifo[wptr[$clog2(DEPTH)-1:0]] <= din;
      wptr <= wptr + 1;
    end
  end

  always @(posedge clk) begin
    if (!reset) begin
      rptr <= 0;
      dout <= 0;
    end else if (ren && !empty) begin
      dout <= fifo[rptr[$clog2(DEPTH)-1:0]];
      rptr <= rptr + 1;
    end
  end

  assign full = (wptr - rptr == DEPTH);
  assign empty = (wptr == rptr);

endmodule

//TESTBENCH

module synchronousfifo_tb;
  parameter DATA_WIDTH = 8;
  parameter DEPTH = 8;
  reg clk, reset, wen, ren;
  reg [DATA_WIDTH-1:0] din;
  wire [DATA_WIDTH-1:0] dout;
  wire full, empty;
synchronousfifo #(DEPTH, DATA_WIDTH) fifo (
    .clk(clk),
    .reset(reset),
    .wen(wen),
    .ren(ren),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
  );
  initial clk = 0;
  always #5 clk = ~clk;
  initial begin
    reset = 0; wen = 0; ren = 0; din = 0;
    #10 reset = 1; 
    #10;
    repeat (5) begin
      @(posedge clk);
      if (!full) begin
        wen = 1;
        din = $urandom % 256;
        $display("WRITE: %0d", din);
      end
    end
    wen = 0;
    #50; 
    repeat (5) begin
      @(posedge clk);
      if (!empty) begin
        ren = 1;
        @(posedge clk); 
        $display("READ : %0d", dout);
        ren = 0;
      end
    end
    $display("FIFO Test Completed.");
    #50 $finish;
  end
    initial begin
    $dumpfile("fifo.vcd");
    $dumpvars;
  end

endmodule
