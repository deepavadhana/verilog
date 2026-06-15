
class parent;
  int id;
  string name;
virtual function void display();
  $display("Parent class:name=%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  int id;
   function void display();
     $display("Child class: id=%0d",id);
  endfunction
endclass
module without_virtual;
  child c;
  parent p;
  initial begin
    p=new();
    c=new();
    p=c;
    p.name="deepa";
    c.id=13;
    p.id=16;
    c.display();
    p.display();
  end
endmodule
