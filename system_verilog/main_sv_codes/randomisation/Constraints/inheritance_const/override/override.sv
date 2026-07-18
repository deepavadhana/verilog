class parent;
  rand bit [3:0] a;
  constraint cons {a >0;a<10;}
endclass
class child extends parent;
  constraint cons {a  inside {[10:30]};} //same constraint name as parent class so the child class overrides the constraint of parent class
endclass
module inheritance_const;
  parent p=new();
  child c=new();
  initial begin
    repeat(8)begin
    p.randomize();
      $display("Values of parent class a=%0d",p.a);
    end
    repeat(8) begin 
      c.randomize();
      $display("Values of child class a=%0d",c.a);
  end
  end
endmodule
    
