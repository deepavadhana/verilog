module seq;
  bit clk,a;
  logic [3:0] b;
  always #5 clk=~clk;
  initial begin
    clk=0;
    #5; a=1;b=4'b10xx;
    #5; a=0;b=4'bxz10;
    #5; a=1;b=4'b1011;
    #5; a=0;b=4'b1x01;
    #5; a=1;b=4'b0000;
    #5; a=1;b=4'b0xx1;
    #5; a=0;b=4'b1100;
    #5; a=1;b=4'b0zz0;
    #5; a=0;b=4'b1000;
    #5; a=1;b=4'b1x10;
    #5; a=1;b=4'bzzzx;
    #100; $finish;
  end
  property pr;
    @(posedge clk) a|->$isunknown(b);
  endproperty
  assert property(pr)
    $info("Pass");
    else
      $info("Fail");
    endmodule
    
