// Code your design here
module and_gate(
  input a,
  input b,
  input clk,
  output y);
  assign y=a&&b;
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg a;
  reg b;
  reg clk;
  wire y;
  and_gate dut (.a(a),.b(b),.clk(clk),.y(y));
  always #5 clk=~clk;
  initial begin
     $monitor("Pass : values of a==%0d b==%0d at time =%0t",a,b,$time);
    #5; clk<=0;
    a<=0; b<=0;
    #5; a<=0; b<=1;
      #5; a<=1; b<=0;
      #5; a<=1; b<=1;
      
   #20; $finish;
  end
  sequence seq;
    @(posedge clk) (a==1&&b==1);
  endsequence
  property pr;
    seq;
  endproperty
  assert property (pr)
  $display("Pass : values of a==%0d b==%0d at time =%0t",a,b,$time);
  else
    $display("Fail : values of a==%0d b==%0d at time =%0t",a,b,$time);
    endmodule
    
