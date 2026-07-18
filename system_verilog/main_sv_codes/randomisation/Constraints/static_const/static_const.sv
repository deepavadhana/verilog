// Code your design here
class seq;
  rand bit [7:0]a;
  rand bit [7:0]b;
  constraint cons {a inside {[10:30]};}
  static constraint cons1 {b inside {40,80,20};}
endclass
module static_constr;
  seq s1=new();
  seq s2=new();
  initial begin
    repeat(10)begin
      s1.randomize();
      s2.randomize();
      $display("Before disabling the s2 ,value of s1 a=%0d , b=%0d ",s1.a,s1.b);
      $display("Before disabling the s2 ,value of s2 a=%0d , b=%0d ",s2.a,s2.b);
    end
    s2.b.cons1.constraint_mode(0);
    s1.randomize();
    s2.randomize();
    $display("After disabling the s2 ,value of s1 a=%0d , b=%0d ",s1.a,s1.b);
    $display("After disabling the s2 ,value of s2 a=%0d , b=%0d ",s2.a,s2.b);
    end
endmodule
  
