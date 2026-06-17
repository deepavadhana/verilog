//DUT
module and_gate(input a,b,output y);
  assign y=a&b;
endmodule
//INTERFACE
interface and_if;
  logic a;
  logic b;
  logic y;
endinterface
//TOP MODULE
module top();
  and_if inf();
  and_gate a1(.a(inf.a),.b(inf.b),.y(inf.y));
  tb t1(inf);
endmodule
//TESTBENCH
module tb(and_if inf);
  initial begin
    $monitor("time=%0t :output =%b ,input a=%b ,input b=%b",$time,inf.y,inf.a,inf.b);
    inf.a=1;
    inf.b=0;
    #10
    inf.a=0;
    inf.b=0;
    #5
    inf.a=0;
    inf.b=1;
    #5
    inf.a=1;
    inf.b=1;
  end
endmodule
