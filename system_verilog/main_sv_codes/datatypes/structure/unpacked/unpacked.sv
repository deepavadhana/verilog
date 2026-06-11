module structure;
  typedef struct{
    string name;
    int id;
    byte data;
  }employee;
  initial begin
    employee e1,e2;
    e1.name="deepa";
    e1.id=12;
    e1.data=4'b1010;
    $display("E1 details: %p",e1);
   
    e2.name="chitra";
    e2.id=11;
    e2.data=4'b1110;
    $display("E2 details: %p",e2);
  end
endmodule
    
    
    
