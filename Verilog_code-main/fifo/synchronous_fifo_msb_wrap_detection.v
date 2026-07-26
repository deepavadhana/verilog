module fifo #(
  parameter WIDTH = 8,
  parameter DEPTH = 16,
  parameter ADDRESS = 4
)(input clk, rst,
  input wen, ren,
  input [WIDTH-1:0] din,
  output reg [WIDTH-1:0] dout,
  output reg full, empty
);
  reg [WIDTH-1:0] mem [0:DEPTH-1];
  reg [ADDRESS:0] wptr = 0;
  reg [ADDRESS:0] rptr = 0;
  wire [ADDRESS-1:0] waddr = wptr[ADDRESS-1:0];
  wire [ADDRESS-1:0] raddr = rptr[ADDRESS-1:0];
  always @(posedge clk) begin
    if (rst)
      wptr <= 0;
    else if (wen && !full) begin
      mem[waddr] <= din;
      wptr <= wptr + 1;
    end
  end
  always @(posedge clk) begin
    if (rst) begin
      rptr <= 0;
      dout <= 0;
    end else if (ren && !empty) begin
      dout <= mem[raddr];
      rptr <= rptr + 1;
    end
  end
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      full <= 0;
      empty <= 1;
    end else begin
      full  <= (wptr[ADDRESS] != rptr[ADDRESS]) && (waddr == raddr);
      empty <= (wptr == rptr);
    end
  end
endmodule

//TESTBENCH

module fifo_tb;
  parameter WIDTH = 8;
  parameter DEPTH = 16;
  parameter ADDRESS = 4;
  reg clk, rst, wen, ren;
  reg [WIDTH-1:0] din;
  wire [WIDTH-1:0] dout;
  wire full, empty;
  fifo #(.WIDTH(WIDTH), .DEPTH(DEPTH),.ADDRESS(ADDRESS)) uut (.clk(clk),.rst(rst),.wen(wen),.ren(ren),.din(din), .dout(dout),.full(full), .empty(empty));
 always #5 clk = ~clk;
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, fifo_tb);
    clk = 0;
    rst = 1; wen = 0; ren = 0; din = 0;
    #12 rst = 0;
   repeat (5) begin 
      @(posedge clk);
      if (!full) begin
        wen = 1;
        din = $urandom % 256;
        $display("WRITE: %0d", din);
      end
      @(posedge clk); 
      wen = 0;
    end
    #20;repeat (5) begin
      @(posedge clk);
      if (!empty) ren = 1;
      @(posedge clk);
      if (ren) begin
        $display("READ : %0d", dout);
        ren = 0;
      end
    end
    #20 $finish;
  end
endmodule
