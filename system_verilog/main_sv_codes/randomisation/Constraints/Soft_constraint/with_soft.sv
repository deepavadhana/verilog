
class seq;
  rand bit [3:0] val;
  rand bit [4:0] a;
  constraint cons { soft val inside{[10:20]};} //here soft is used so that no conflict occurs
endclass
module inline_constr();
  seq s=new();
  initial begin
    repeat (8) begin
      s.randomize();
      $display("Value=%0d",s.val); 
      s.randomize with {val inside{[1:6]};};
      $display("After inline constraint Value=%0d",s.val);
    end
  end
endmodule
                   
