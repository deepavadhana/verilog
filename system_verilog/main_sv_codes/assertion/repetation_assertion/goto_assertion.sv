
module seq;
  bit clk,a,b,c;
  always#5 clk=~clk;
  initial begin
    clk=0;
    #5; a=0;b=0;c=0;
      #5; a=1;b=0;c=0;
      #5; a=0;b=1;c=1;
      #5; a=1;b=0;c=0;
      #5; a=1;b=1;c=1;
      #5; a=0;b=1;c=0;
      #5; a=1;b=0;c=1;
      #5; a=0;b=1;c=1;
      #5; a=1;b=0;c=0;
      #5; a=0;b=1;c=1;
    #50; $finish;
  end
  property pr;
    @(posedge clk) a|->b[->3] ##1 c;
  endproperty
  assert property(pr)
    $info("Pass");
    else
      $error("Fail");
    endmodule
    
