// Code your design here
class seq;
  rand bit [5:0] val,val1,val2,val3;
  rand bit t1,t2;
  constraint cons { val<val1; val1==val2 ; val2>val3; val3>4;}
  constraint cons1 { (t1==1) -> (t2==0) ;}
endclass
module bidirectional_const();
  seq s=new();
  initial begin
    repeat (8) begin
      s.randomize();
      $display("Values of val=%0d,val1=%0d , val2=%0d ,val3=%0d",s.val,s.val1,s.val2,s.val3);
      $display("Values of t1=%0d ,t2=%0d",s.t1,s.t2);
                      end
                      end
                      
                      endmodule
  
