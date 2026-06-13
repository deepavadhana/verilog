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
  initial begin
    c=new();
    c.name="deepa";
    c.id=16;
    c.display();
  end
endmodule
    
