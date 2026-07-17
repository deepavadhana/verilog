// Code your design here
class check;
  rand bit [2:0] a;
  constraint cons {a>10;}
  constraint cons1 {a<10;}
endclass
module check_rand;
  check c=new();
  initial begin
    if(c.randomize()) begin
      $display("Randomisation is done");
    $display("The value of randomisation result %0d",c.a);
    end 
      else begin
        $display("Randomisation is not done");
     $display("The value of randomisation result %0d",c.a);
      end
    end
  endmodule
    
