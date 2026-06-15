//here  no virtual mtd is used so its not necessary that child obj should be printed hence base cls is printed here eventhough p=c;
//Important note is both the parent and child class have same arguments hence both parent and child have seperate memory hence the child obj is not printed when called p.display();
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
