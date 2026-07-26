module Mooreoverlapping (clk, reset, w, z);
  input clk, reset, w;
  output reg z;
  reg [3:0] CS, NS;

  parameter A = 4'h1, B = 4'h2, C = 4'h3, D = 4'h4, E = 4'h5;

  always @(posedge clk or negedge reset) begin
    if (!reset)
      CS <= A;
    else
      CS <= NS;
  end

  always @(*) begin
    case (CS)
      A: NS = (w == 0) ? A : B;
      B: NS = (w == 0) ? C : B;
      C: NS = (w == 0) ? A : D;
      D: NS = (w == 0) ? E : B;
      E: NS = (w == 0) ? A : D;
      default: NS = A;
    endcase
  end

  always @(*) begin
    case (CS)
      A, B, C, D: z = 0;
      E: z = 1;
      default: z = 0;
    endcase
  end
endmodule

//TESTBENCH

module Mooreoverlapping_tb;
  reg clk, reset, w;
  wire z;

  Mooreoverlapping mol(clk, reset, w, z);

  initial clk = 0;
  always #3 clk = ~clk;

  initial begin
    reset = 1; w = 0;
    #4 reset = 0;
    #5 reset = 1;

    #6 w = 1;
    #7 w = 1;
    #7 w = 0;
    #7 w = 1;
    #7 w = 0;
    #7 w = 1;
    #7 w = 1;
    #7 w = 0;
    #7 w = 1;
    #7 w = 0;
    #7 w = 1;
    
    #10 $finish;
  end

  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(0, Mooreoverlapping_tb);
  end
endmodule
