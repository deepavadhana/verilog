
module Moorenonoverlapping (clk,reset,w,z);
  input clk,reset,w;
  output reg z;
  reg [2:0]CS,NS;
  parameter A=6'h1;
  parameter B=6'h2;
  parameter C=6'h3;
  parameter D=6'h4;
  parameter E=6'h5;
  parameter F=6'h6;
  always@(posedge clk,negedge reset)
    begin if(reset==0)
      CS<=A;
  else CS<=NS;
    end
  always@(w,CS)
    begin
      case({CS})
        A: begin
          if (w==1)
            NS=B;
          else NS=A;
        end
        B: begin 
          if (w==1)
            NS=C;
          else 
            NS=A;
        end
        C: begin
          if (w==1)
            NS=C;
          else NS=D;
        end
        D: begin
          if(w==1)
            NS=A;
          else NS=E;
        end
        E: begin
          if(w==1)
            NS=F;
          else 
            NS=A;
        end
        F: begin
          
            NS=A;
          
        end
      endcase
    end
  always@(CS) begin
    case(CS)
      A: z=0;
      B: z=0;
      C: z=0;
      D: z=0;
      E: z=0;
      F: z=1;
      default:z=0;
    endcase
  end
endmodule
            
//testbench

module Moorenonoverlapping_tb;
  reg clk, reset, w;
  wire z;
 Moorenonoverlapping mo(clk, reset, w, z);
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

          
