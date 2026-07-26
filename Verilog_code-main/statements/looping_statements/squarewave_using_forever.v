
  module square_wave_tb;
  reg clk;
  initial begin  clk=0;
  forever #5 clk=~clk;
     end
    initial begin
      #10$monitor ("time=%0t clk=%0b",$time,clk);
      $dumpfile("dump.vcd");
      $dumpvars();
       #30 $finish;
       end
  endmodule
