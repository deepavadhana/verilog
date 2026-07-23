module and_gate(input a,input b,input clk,output y);
  assign y=a&&b;
endmodule
// Code your testbench here
module tb;
  reg clk;
  reg a;
  reg b;
  wire y;
  and_gate dut (.a(a),.b(b),.clk(clk),.y(y));
  always #5 clk=~clk;
  
  initial begin
    $monitor("values of a=%0d,b=%0d,y=%0d",a,b,y);
    #2;clk<=0;a<=0;b<=0;
    #2;a<=0;b<=1;
    #2;a<=1;b<=0;
    #2;a<=1;b<=1;
    #20;$finish;
  end
always@(posedge clk )begin
      assert(a<=0&&b<=0) $display("Time=%0t",$time);else
        assert(a<=0&&b<=1) $display("Time=%0t",$time);else
          assert(a<=1&&b<=0)$display("Time=%0t",$time);else
            assert(a<=1&&b<=1)$display("Time=%0t",$time);else
              $display("Failed Time=%0t",$time);
    end
      endmodule

