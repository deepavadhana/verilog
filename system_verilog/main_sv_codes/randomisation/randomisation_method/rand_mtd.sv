// Code your design here
class generator ;
  rand logic [3:0] data;
  constraint cons {data==2;}
endclass
module randomisation();
 generator gen=new();
  initial begin
     
    if(gen.randomize())
      $display("Randomisation success,%0d",gen.data);
    else 
      $display("Randmisation failed,%0d",gen.data);
  end
  initial begin
    if(gen.randomize() with {data==3;})
      $display("Value=%0d",gen.data);
    else
      $display("Value=%0d",gen.data);
  end
endmodule
  
    
  
                     
