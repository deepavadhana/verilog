//dynamic casting 
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
    p=new();
    $cast(c,p);//here this is called dynamic casting used when p obj is created and c handle is assigned to p ,
               //in this case eventhough after assigning it runtime error get expected as base handle is not pointing to obj that is compartible with child handle
    //dynamic casting fails as the obj created is parent cls -refer the notes (reason:as the child have all the properties of parent +child how can the parent be assigned to child its illegal 
    p.name="deepa";
    p.id=16;
    c.name="shana";
    c.id=23;
    p.display();
    c.display();
  end
endmodule
