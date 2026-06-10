module data_types;
  time a;
 
  initial begin
    $display("Before initialisation :%0t",a);
   
   #10;
   
    a=$time;
    
    $display("After initialisation :%0t",a);
    
   
  end 
endmodule
