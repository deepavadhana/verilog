// Code your testbench here
// or browse Examples
module seq;
  bit clk,a;
  logic [3:0] b;
  always #5 clk=~clk;
  initial begin
    clk=0;
    #5; a=1;b=4'b1000;
    #5; a=0;b=4'b1110;
    #5; a=1;b=4'b1011;
    #5; a=0;b=4'b1001;
    #5; a=1;b=4'b0000;
    #5; a=1;b=4'b0001;
    #5; a=0;b=4'b1100;
    #5; a=1;b=4'b0100;
    #5; a=0;b=4'b1000;
    #5; a=1;b=4'b1010;
    #5; a=1;b=4'b1001;
    #100; $finish;
  end
  property pr;
    @(posedge clk) a|->$onehot(b);
  endproperty
  assert property(pr)
    $info("Pass");
    else
      $info("Fail");
    endmodule
    
