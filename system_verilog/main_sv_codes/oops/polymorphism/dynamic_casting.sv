class parent;
  int id;
  string name;
  function void display();
    $display("base class : name=%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  int id;
  string name;
  function void display();
    $display("child class : name=%0s,id=%0d",name,id);
  endfunction
endclass
module same_arg_polymorphism;
  child c;
  parent p;
  initial begin
    c=new();//here child obj is created  
    p=c;//sv checks what obj does the ptr points to hence child obj be treated /cast to child class hence it suceeds
    $cast(c,p);// hence child obj be treated /cast to child class hence it suceeds
    p.name="deepa";
    p.id=16;
    c.name="shana";
    c.id=23;
    c.display();
  end
endmodule
