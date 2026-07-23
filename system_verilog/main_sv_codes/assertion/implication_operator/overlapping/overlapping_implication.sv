module overlapping_impli;
  bit clk,valid,a,b;
  always #5 clk = ~clk;
  initial begin
    $monitor("Values of valid=%0d , a=%0d ,b=%0d,time=%0t",valid,a,b,$time);
    valid=1;
    #10;
    a=0; b=0;
    #10;
    a=1; b=0;
    #10;
    b=1;
    #10;
    b=0;
    #10;
    a=0;b=1;
    #10;
    a=1;b=1;
    #100;
    $finish;
  end
  property pr;
    @(posedge clk) valid |-> (a ##3 b);
  endproperty
  time_a: assert property (pr)
    $info ("pass");
    else
      $error ("fail");
     endmodule
    
