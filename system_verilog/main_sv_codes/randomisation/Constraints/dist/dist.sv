class seq;
  rand bit [3:0] a;
  rand bit [3:0] b;
  constraint cons { a  dist {3:/4 , [5:8]:/7};}
  constraint con { b  dist {3:=4 , [5:8]:=7};}
endclass
module dist_cons;
  seq s=new();
  initial begin
    repeat(10) begin
      if(s.randomize());
      $display("Randomised values with weights value of a =%0d value of b=%0d ",s.a,s.b);
    end
  end
endmodule
