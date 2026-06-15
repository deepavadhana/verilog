virtual class parent;
  int id;
  string name;
  function new();
    this.id=id;
    this.name=name;
  endfunction
  function void display();
    $display("name:%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  int id;
  string name;
  function new();
    this.id=id;
    this.name=name;
  endfunction
  function void display();
    $display("name:%0s,id=%0d",name,id);
  endfunction
endclass
  module abstract_class;
    child c;
    initial begin
      c=new();
      c.name="deepa";
      c.id=12;
      c.display();
    end
  endmodule
