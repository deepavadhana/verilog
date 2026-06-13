
class parent;
  string name;
  int id;
  function new(string name,int id);
    this.name=name;
    this.id=id;
  endfunction
  function void display();
    $display("Base class : name=%0s,id=%0d",name,id);
  endfunction
endclass
class child extends parent;
  string cname;
  function new(string name_p,int id,string name_c);
    super.new(name_p,id);
    this.cname=name_c;
  endfunction
  function void display();
    $display("Child class : parent_name=%0s,id=%0d, child_name=%0s",name,id,cname);
  endfunction
endclass
module super_new;
  child c;
  initial begin
    c=new("deepa",16,"vadhana");
    c.display();
  end
endmodule
