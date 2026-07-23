// Code your design here
module seq;
  bit clk,a,b;
  always#5 clk=~clk;
  initial begin
    clk=0;
    #5; a=0;b=0;
      #5; a=1;b=0;
      #5; a=0;b=1;
      #5; a=1;b=0;
      #5; a=1;b=1;
      #5; a=0;b=1;
      #5; a=1;b=0;
      #5; a=0;b=1;
      #5; a=1;b=0;
      #5; a=0;b=1;
    #50; $finish;
  end
  property pr;
    @(posedge clk) a|->##4 b[*3];
  endproperty
  assert property(pr)
    $info("Pass");
    else
      $error("Fail");
    endmodule
    
