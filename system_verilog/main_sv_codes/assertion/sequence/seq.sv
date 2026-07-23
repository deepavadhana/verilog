module seq;
  bit clk,x,y;
  always #5 clk=~clk;
  sequence seqA;
    x ##5 y;
  endsequence
  sequence seqB;
    x && y;
  endsequence
  property pr;
    @(posedge clk)
      seqA|->seqB;
  endproperty
  time_a: assert property(pr)
    $info("Pass at time=%0t",$time);
    else
      $error("Fail at time=%0t",$time);
    initial begin
      $monitor("values of x=%0d ,y=%0d,time=%0t",x,y,$time);
      x=0;
      y=0;
      #10;
      x=0;
      #10;
      y=1;
      #10;
      x=1;
      #20;
      y=0;
      #10;
      x=1;
      #2;
      y=1;
      #100; $finish;
      end
    endmodule


    Clock

↑    ↑    ↑    ↑    ↑    ↑
|    |    |    |    |    |
x-------------------------->
      wait 5 clocks
                     |
                     |
                     V
                     y

If this happens,
then at this same ending clock

x && y

must also be TRUE
    
  
