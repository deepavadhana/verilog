// Code your testbench here
// or browse Examples
module union_unpacked;
  typedef union {
    //string name;
    int i;
    byte b;
  }emp;
  initial begin
    emp e;
    //e.name="deepa";
    //$display("Union :%s",e.name);
     e.i=234;
    $display("Union :%d",e.i);
    e.b=8'h34;
    $display("Union :%d",e.b);
    
  end
endmodule
