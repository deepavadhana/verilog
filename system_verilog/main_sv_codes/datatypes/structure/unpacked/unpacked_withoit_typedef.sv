module structure;
  struct{
    string name;
    int id;
    byte data;
  }e1;
  initial begin
    
    e1.name="deepa";
    e1.id=12;
    e1.data=4'b1010;
    $display("E1 details: %0s %0d %0b",e1.name,e1.id,e1.data);
   
    e1.name="chitra";
    e1.id=11;
    e1.data=4'b1110;
    $display("E2 details: %p",e1.name,e1.id,e1.data);
  end
endmodule
    
    
    
