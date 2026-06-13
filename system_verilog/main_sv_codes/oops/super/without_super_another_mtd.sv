//without arguments in the constructor
//Usually, we create an object for both base and child class and then do a method call and assign values to their class properties.
//To prove that SystemVerilog does super.new() function calls internally. 
//An object is only created for the child class and then the child class handle is assigned to its base class. 
//This is required to refer to the memory location for a base class that is created on super.new() call. 
//Later base class data variable value is assigned. On calling display() method for the corresponding class handle, to print respective class properties.
class parent;
  string name;
  int id;
  function void display();
    $display("base class : name:%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  string name;
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
    p=c;
    p.name="deepavadhana";
    p.id=36;
    p.display();
    c.display();
    end
endmodule
    
