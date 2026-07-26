module casex_problems(input [3:0]a, input [1:0]sel,output reg y);
  always@(a or sel) begin
    casex(sel) 
      2'b0x: y=a[0];
      2'bx1: y=a[1];
      default:y=1'b0;
      endcase
    
      end
      endmodule

//TESTBENCH

module tb;
  reg [3:0]a;
  reg[1:0]sel;
  wire y;
  
  casex_problems uut(.a(a),.sel(sel),.y(y));
  
  initial begin
   a=4'b0101;
    $monitor("time=%0t  |  a=%0b |sel=%0b| y=%0b",$time,a,sel,y);
    #10 sel=2'b01 ;
    #10 sel=2'b11 ;#10 sel=2'b10 ;#10 sel=2'b00 ;
    #10 sel=2'bxx ;
   
    #50 $finish;
  end
endmodule
    
