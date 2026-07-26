module Mooreoverlapping (input clk, reset, w, output reg z);
  reg [2:0] CS, NS;
  parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5;
  always @(posedge clk or negedge reset) begin
    if (!reset)
      CS <= A;
    else
      CS <= NS;
  end
  always @(*) begin
    case (CS)
      A: NS = (w == 1) ? B : A;
      B: NS = (w == 1) ? C : A;
      C: NS = (w == 0) ? D : C;
      D: NS = (w == 0) ? E : A;
      E: NS = (w == 1) ? F : A;
      F: NS = (w == 1) ? B : A; 
      default: NS = A;
    endcase
  end
  always @(*) begin
    case (CS)
      F: z = 1;
      default: z = 0;
    endcase
  end
endmodule

//Testbench

module Mooreoverlapping_tb;
  reg clk, reset, w;
  wire z;
 Mooreoverlapping mo(clk, reset, w, z);
  initial clk = 0;
  always #5 clk = ~clk;
  initial begin
    w = 0;
    reset = 0;
    #3 reset = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1; 
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1; 
    #10 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
