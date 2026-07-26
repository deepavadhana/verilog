module repeat_counter;
  reg [3:0] count;
  initial count=0;
  initial begin
  repeat (16)
    begin
      #10 count=count+1;
      $monitor("time=%0t count=%0b",$time,count);
      $dumpfile("dump.vcd");
      $dumpvars();
    end
  end
endmodule
  
  
