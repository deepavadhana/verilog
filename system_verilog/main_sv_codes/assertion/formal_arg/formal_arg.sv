
module formal_arg;
  bit clk,a,b,c,d;
  always #5 clk=~clk;
  initial begin
    #10; clk=0;
    #10; a=0; b=0;
    #5;  c=0; d=0;
    #10; a=1; b=0;
    #5;  c=1; d=0;
    #10; b=1;
    #10; b=0;
    #5;  c=0; d=1;
    #10; a=0; b=1;
    #10; a=1; b=0;
    #5;  c=1; d=1;
    #10; a=1; b=1;
    #50 ; $finish;
  end
  sequence no_datatype(x,y);
    x&&y;
  endsequence
  sequence with_datatype(bit x,bit y);
    x&&y;
  endsequence
  property pr(a,b);
    @(posedge clk)
    a|-> no_datatype(a,b);
  endproperty
  property pt(bit c,bit d);
    @(posedge clk)
    c|-> with_datatype(c,d);
  endproperty
  time_a: assert property(pr(a,b))
    $info("PASS");
    else
    $error("FAIL");
    time_b: assert property(pt(c,d))
    $info("PASS");
    else
    $error("FAIL");
    endmodule
      
      
    
  
  
    
  
    
