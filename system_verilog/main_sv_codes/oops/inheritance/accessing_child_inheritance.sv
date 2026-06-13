//here we can use same name for function in both parent and child this doesnt lead to any overriding as we created seperate object for both parent and child
class parent;
  string name;
  int id;
  function void display();
    $display("base class : name:%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  function void display();
    $display("child class : name:%0s,id=%0d",name,id);
  endfunction
endclass
module inheritance_overridng;
  child c;
  parent p;
  initial begin
    p=new();
    c=new();
    c.name="deepa";
    c.id=16;
    c.display();
    p.name="deepavadhana";
    p.id=36;
    p.display();
    end
endmodule
    
