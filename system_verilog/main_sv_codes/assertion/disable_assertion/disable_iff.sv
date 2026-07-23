
module and_gate (
  input a,input b,input rst,input clk,output y);
  assign y=a&&b;
endmodule

module tb;
  reg a;
  reg b;
  reg rst;
  reg clk;
  wire y;
  and_gate dut (.a(a),.b(b),.y(y),.clk(clk),.rst(rst));
  always #5 clk=~clk;
  initial begin
    rst<=1;
    clk<=0;
    #10; a<=0;b<=0;
    #10; rst<=0;
     #10; a<=1;b<=0;
    #10; a<=0;b<=1;
    #10; rst<=1;
    #5; rst<=0;
     #10; a<=1;b<=1;
  #50; $finish;
  end
  property pr;
    @(posedge clk) disable iff(rst)
    a&&b;
  endproperty
  time_a:assert property(pr)
    $info ("Pass");
    else
      $error("Fail");
    endmodule
    

    
