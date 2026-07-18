
class parent;
  rand bit [3:0] a;
  constraint cons {a >0;a<10;}
endclass
class child extends parent;
  constraint cons1 {a  inside {[10:30]};} //different name of the constraint so the child class doesnot override the constraint of parent class it can see all of these
                                            //rand bit [3:0] a;
                                            //constraint cons {a >0;a<10;}
                                            //constraint cons1 {a  inside {[10:30]};}
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
    
