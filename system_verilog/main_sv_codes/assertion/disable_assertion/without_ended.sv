// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module seq;
  bit clk,d,k;
  always #5 clk=~clk;
  initial begin
    clk=0;
    #5;d=0;
    #5;k=0;
    #5;d=1;
    #5;k=0;
    #5;d=0;
    #5;k=1;
    #5;d=1;
    #5;k=1;
    #10;
    $finish;
  end
  sequence seqA;
    @(posedge clk) 
        d;
  endsequence
   sequence seqB;
    @(posedge clk) 
        ##4 k;
  endsequence
  
  property pr;
    @(posedge clk) seqA|->##4 seqB;
  endproperty
  time_a: assert property(pr)
    $info ("Pass");
    else
      $error("Fail");
    initial begin
      $dumpfile("dut.vcd");
      $dumpvars();
    end
    endmodule
    
