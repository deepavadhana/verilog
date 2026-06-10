module data_types;
  longint a;
 
  initial begin
    $display("Before initialisation :%0b",a);
   
    a=64'b1010_1111_0101_0101_01x0_10z1_0xxx_xz0z;
    
    $display("After initialisation :%0b",a);
   
    a=13457200060;
   
    $display("After initialisation :%0d",a);
    
   
  end 
endmodule
