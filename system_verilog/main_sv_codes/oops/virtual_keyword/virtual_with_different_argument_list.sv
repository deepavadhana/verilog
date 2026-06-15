class parent;
  int id;
  string name;
  virtual function void display(int id,string name);
    $display("name=%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  int id;
  function new(int id);
    this.id=id;
  endfunction
  function void display(int id);
    $display("id=%0d",id);
  endfunction
endclass
module different_argument_list;
  parent p;
  child c;
  initial begin
    c=new();
    p=c;
    p.display();
  end
endmodule
