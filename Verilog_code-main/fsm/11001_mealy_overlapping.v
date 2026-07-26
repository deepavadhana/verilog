module Mealyoverlapping (clk,reset,w,z);
  input clk,reset,w;
  output reg z;
       reg[5:0] CS,NS;
  parameter A=6'h1;
  parameter B=6'h2;
  parameter C=6'h3;
  parameter D=6'h4;
  parameter E=6'h5;
  parameter F=6'h6;
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
               NS=A;
             else
               NS=C;
           end
             C:begin
               if(w==0)
                 NS=D;
               else
                 NS=C;
             end
               D:begin
                 if(w==0)
                   NS=E;
                 else
                   NS=A;
               end
           E:begin
                 if(w==0)
                   NS=A;
                 else
                   NS=F;
               end
           F:begin
                 if(w==0)
                   NS=A;
                 else
                   NS=C;
               end
           
           default:NS<=A;
         endcase
       end
       assign z=(CS==F&& (w==1)? 1:0);
     endmodule

     //Testbench

module Mealyoverlapping_tb;
  reg clk, reset, w;
  wire z;
 Mealyoverlapping mo(clk, reset, w, z);
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
    $dumpvars(0, Mealyoverlapping_tb);
  end
endmodule


           
           
       
    
  
      
  

  
