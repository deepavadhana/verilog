//DUT
module and_gate(and_intr inf);
  assign inf.DUT_MP.r=inf.DUT_MP.p&inf.DUT_MP.q;
endmodule
//INTERFACE
interface and_intr;
  logic p;
  logic q;
  logic r;
  modport DUT_MP (input q,output r);//port p is not given hence in further modules accessing p will lead to error
  modport TB_MP (input r,output p,output q);
endinterface
//TOP MODULE
module top;
  and_intr inf();
  and_gate a (inf);
  and_tb a1 (inf);
endmodule
//TESTBENCH
module and_tb(and_intr inf);
  initial begin
    repeat(2) begin
      $monitor("DISPLAYING THE RESULTS:TIME=%0t,P=%0b,Q=%0b,R=%0b",$time,inf.TB_MP.p,inf.TB_MP.q,inf.TB_MP.r);
      #1;
      inf.TB_MP.p=$random;
      
       #1;
       inf.TB_MP.q=$random;
      
    end
  end
endmodule
