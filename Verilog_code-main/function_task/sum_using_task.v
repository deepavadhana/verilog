task add8;
  input [7:0] a,b;
  output [8:0] sum;
  begin
    sum=a+b;
  end
  endtask
//TESTBENCH

module tb;
  reg [7:0]a,b;
  reg [8:0] result;
  task add8;
  input [7:0] a,b;
  output [8:0] sum;
  begin
    sum=a+b;
  end
  endtask
  initial begin
     $monitor("a=%0d b=%0d sum=%0d",a,b,result);

    #1a=8'd4;b=8'd8;
      add8(a,b,result);
    #1a=8'd9;b=8'd3;
     add8(a,b,result);
    #1a=8'd10;b=8'd30;
     add8(a,b,result);
  end
  endmodule
