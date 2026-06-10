module data_types;
  byte a;
  initial begin
    $display("Before initialisation :%0b",a);
    
    a=8'b10001111;
    $display("After initialisation :%0b",a);
    
    
    a=8'bxxxzz111;
    $display("After initialisation :%0b",a);
    
    
  end 
endmodule
