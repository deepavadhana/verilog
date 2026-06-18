// INTERFACE
interface dff(input clk);
  logic q;
  logic d;
  clocking cb @(posedge clk);
    default input #1step output #0;
    output q;
    input d;
  endclocking
  modport dut (clocking cb,input clk);
    modport tb (input q,output d,input clk);
    endinterface

//DUT
    module dut (dff.dut inf);
      always@(inf.cb)
        inf.cb.q<=inf.cb.d;
    endmodule

//TOP MODULE
      module top;
      bit clk=1;
      initial 
      forever #5 clk=~clk;
      
      dff inf (clk);
      dut i(inf);
      tb t1(inf);
      initial 
        $monitor("time=%0t,d=%0b,q=%0b",$time,inf.d,inf.q);
    endmodule

//TESTBENCH
module tb(dff.tb inf);
  task drv;
    repeat(3) begin
      $monitor("time=%0t,d=%0b,q=%0b",$time,inf.d,inf.q);
      @(posedge inf.clk)
      inf.d<=$random;
    end
$finish;
  endtask
    initial begin
      drv();
    end
    endmodule
