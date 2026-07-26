task and_or_operations;
  input [7:0] a,b;
  output [7:0] out_and,out_or ;
  begin
   out_and=a&b;
    out_or=a|b;
  end
  endtask

//TESTBENCH

module tb;
  reg [7:0]a,b;
  reg [7:0] result_out_and,result_out_or;
  task and_or_operations;
  input [7:0] a,b;
  output [7:0] out_and,out_or ;
  begin
   out_and=a&b;
    out_or=a|b;
  end
  endtask
  initial begin
    $monitor("a=%0b b=%0b out_and=%0b out_or=%0b",a,b,result_out_and,result_out_or);
and_or_operations(a,b,result_out_and,result_out_or);
    #1a=8'b00110011;b=8'b00101110;
 and_or_operations(a,b,result_out_and,result_out_or);     
    #1a=8'b01010101;b=8'b01010111;
  and_or_operations(a,b,result_out_and,result_out_or);   
    #1a=8'b10100011;b=8'b10100011;
  and_or_operations(a,b,result_out_and,result_out_or);   
  end
  endmodule
