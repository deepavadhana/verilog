//here the parent and child have different arguments so the after p=c the p.display will points to child obj as usual 
//as in o/p u can see the parent id=23 not its own id 
class parent;
  int id;
  string name;
  function void display();
    $display("base class : name=%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  string name;
  function void display();
    $display("child class : name=%0s,id=%0d",name,id);
  endfunction
endclass
module same_arg_polymorphism;
  child c;
  parent p;
  initial begin
    c=new();
    p=c;
    p.name="deepa";
    p.id=16;
    c.name="shana";
    c.id=23;
    p.display();
    c.display();
  end
endmodule
