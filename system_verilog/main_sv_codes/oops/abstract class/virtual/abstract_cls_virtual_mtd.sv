virtual class parent;
  int id;
  string name;
  virtual function void display();
    $display("parent class: name=%0s , id=%0d ",name,id);
  endfunction
endclass
class child extends parent;
  int id;
  string name;
  virtual function void display();
    $display("child class: name=%0s , id=%0d ",name,id);
  endfunction
endclass
module virtual_mtd_abstract_cls;
  initial begin
    parent p;
    child c;
    c=new();
    p=c;
    p.name="guna";//here the virtual mtd is used so the p pointing to child obj will get displayed and hence here no assignment to name and id is provided hence o/p will be child class: name= ,id=0
    p.id=25;
    p.display();
    c.name="deepa";//here the name and id are assigned so the required o/p is printed
    c.id=16;
    c.display();
   end
endmodule
  
