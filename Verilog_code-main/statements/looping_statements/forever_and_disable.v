module forever_and_disable_tb;
  reg clk;
 initial begin
    clk = 0;
  end
  initial begin : CLOCK_ENABLE
    forever #5 clk = ~clk;
  end
  initial begin
    $dumpfile("dump.vcd");       
    $dumpvars(0, forever_and_disable_tb); 
   $monitor("time=%0t clk=%0b", $time, clk);
     #50 disable CLOCK_ENABLE;    
     #50 $finish;             
  end
endmodule
