module incorrect_usage_casex(input [1:0]a,output reg out);
  always@(a)begin
    casex(a)
      2'b0x:out=a[0];
      2'bx1:out=a[1];
      default:out=1'b1;
    endcase
  end
endmodule
     
      //TESTBENCH

module incorrect_usage_casex_tb;
  reg[1:0]a;
  wire out;
  
  incorrect_usage_casex uut (.a(a),.out(out)); 
    initial begin 
      a=2'b10;
      $monitor("time=%0t a=%0b out=%0b ",$time,a,out);
      #10 a=2'b10;
      #10 a=2'b11;
      #10 a=2'b00;
      #10 a=2'b01;
      #10 a=2'b00;
    end
endmodule
     
