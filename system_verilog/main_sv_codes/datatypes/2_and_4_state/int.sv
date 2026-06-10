module data_types;
  int a;
 
  initial begin
    $display("Before initialisation :%0b",a);
   
    a=32'b1010_1111_0101_0101_01x0_10z1_0xxx_xz0z;
    
    $display("After initialisation :%0b",a);
   
    a=1345260;
   
    $display("After initialisation :%0d",a);
    
   
  end 
endmodule
