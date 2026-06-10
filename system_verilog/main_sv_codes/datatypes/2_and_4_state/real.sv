module data_types;
  real a;
 
  initial begin
    $display("Before initialisation :%0b",a);
   
    a=64'b1010_1111_0101_0101_01x0_10z1_0xxx_xz0z;
    
    $display("After initialisation :%0b",a);
   
    a=1344.45;
   
    $display("After initialisation :%f",a);
    
    a=1344.45;
   
    $display("After initialisation :%0",a);
    
   
  end 
endmodule
