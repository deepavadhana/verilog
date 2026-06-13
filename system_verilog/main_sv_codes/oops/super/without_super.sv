//THIS IS SAME AS OVERRIDING IN INHERITANCE IF HAVING SAME NAME OF FUNCTION AND PROPERTIES
class parent;
  string name;
  int id;
  function void display();
    $display("parent class: name=%0s , id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  string name;
  int id;
  function void display();
    $display("child class: name=%0s , id=%0d",name,id);
  endfunction
endclass
module inheritance_overiding_without_super;
  child c;
  initial begin
    c=new();
    c.name="DEEPA";
    c.id=16;
    c.display();
  end
endmodule
