// Code your design here
class seq;
  rand bit [3:0] val;
  rand bit [4:0] a;
  constraint cons {val inside{[10:20]};}
  constraint cons1 {a > 10; a<20;}
endclass
module inline_constr();
  seq s=new();
  initial begin
    repeat (8) begin
      s.randomize();
      $display("Value=%0d ,a=%0d",s.val,s.a); 
    s.randomize with {val inside{[1:6]};};
    s.randomize with {a>0 ;a<10;};
      $display("After inline constraint Value=%0d ,a=%0d",s.val,s.a);
    end
  end
endmodule
                   
