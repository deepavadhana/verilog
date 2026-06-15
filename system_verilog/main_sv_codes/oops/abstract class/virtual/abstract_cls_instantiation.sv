// abstract class is not expected to be instantiated. In the below example, a compilation error is expected for the abstract class
//here if we remove the virtual keyword then no error occurs
virtual class parent;
  int id;
  string name;
  function void display();
    $display("name=%0s,id=%0d",name,id);
  endfunction
endclass
  module abstraction_error;
    parent p;
    initial begin
      p=new();
      p.name="deepa";
      p.id=13;
      p.display();
    end
  endmodule
