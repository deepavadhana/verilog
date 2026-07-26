 module Mealynonoverlapping (clk,reset,w,z);
  input clk,reset,w;
  output reg z;
  reg[3:0] CS,NS;
 
  parameter A=4'h1;
  parameter B=4'h2;
  parameter C=4'h3;
  parameter D=4'h4;
  always@(posedge clk,negedge reset)
   begin if(reset==0)
      CS<=A;

     else CS<=NS ;
    end
       always@(w,CS)begin
         case({CS})
           A: 
             begin
               if(w==0)
             NS=A;
           else
             NS=B;
             end
           B:begin
             if(w==0)
               NS=C;
             else
               NS=B;
           end
             C:begin
               if(w==0)
                 NS=A;
               else
                 NS=D;
             end
               D:begin
                 if(w==0)
                   NS=B;
                 else
                   NS=A;
               end
           default:NS<=A;
         endcase
       end
     assign z=(CS==D&& (w==0)? 1:0);
     endmodule
   //TESTBENCH 
// Code your testbench here
// or browse Examples
module Mealynonoverlapping_tb;
  reg clk,reset,w;
  wire z;
  Mealynonoverlapping mno (clk,reset,w,z);
 initial clk=0;
  always #2 clk=~clk;
  initial
    begin
      w=0;
      #1 reset=0;
      #2 reset=1;
      #3 w=1;
      #4 w=0;
      #4 w=1;
      #5 w=0;
      #5 w=1;
      #5 w=0;
      #5 w=1;
      #3 w=1;
      #5 w=0;
      #5 w=1;
      #5 w=0;
      #5 w=1;
      #10 $finish;
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
    
     
               
           
           
       
    
