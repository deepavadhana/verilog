module seq;
  bit clk,a,b;
  always #5 clk=~clk;
  initial begin
    clk=0;
    #5; a=1;b=0;
    #5; a=0;b=0;
    #5; a=1;b=1;
    #5; a=0;b=1;
    #5; a=1;b=0;
    #5; a=1;b=1;
    #5; a=0;b=0;
    #5; a=1;b=1;
    #5; a=0;b=1;
    #5; a=1;b=0;
    #5; a=1;b=1;
    #100; $finish;
  end
  property pr;
    @(posedge clk) a|->$past(b);
  endproperty
  assert property(pr)
    $info("Pass");
    else
      $info("Fail");
    endmodule
    
