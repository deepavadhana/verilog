class packet;
  int id;
  string name;
  function new();
    id=13;
    name="geetha";
  endfunction
  virtual function void display();
    $display("id=%0d,name=%0s",id,name);
  endfunction
  endclass
class packet1 extends packet;
  string name;
  function new();
    name="deepa";
  endfunction
  function void display();
    $display("name=%0s",name);
  endfunction
  endclass
class packet2 extends packet1;
  int id;
  function new();
    id=14;
  endfunction
  function void display();
    $display("id=%0d",id);
  endfunction
  endclass
module virtual_function;
  packet p,pp;
  packet1 p1;
  packet2 p2;
  initial begin
    p1=new();
    p2=new();
    p=p1;
    pp=new p2;
    $display("with virtual : p_display");//p handle points to p1 obj
    p.display();
    $display("with virtual : pp_display");//pp handle points to p2 obj
    pp.display();
    $display("with virtual : p1_display");//p1 obj
    p1.display();
    $display("with virtual : p2_display");//p2 obj
    p2.display();
  end
endmodule
