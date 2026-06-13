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
    super.name="DEEPAVADHANA";
    super.id=11;
    super.display();
    $display("child class: name=%0s , id=%0d",name,id);
  endfunction
endclass
module inheritance_super;
  child c;
  initial begin
    c=new();
    c.name="DEEPA";
    c.id=16;
    c.display();
  end
endmodule
