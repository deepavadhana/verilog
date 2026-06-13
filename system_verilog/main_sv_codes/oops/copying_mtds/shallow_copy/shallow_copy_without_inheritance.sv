class home;
  int id;
  string name;
  bit [3:0] power;
  function new();
    power=4'b0011;
    name="deepa";
    id=11;
  endfunction
  function void display();
    $display("name:%0s,id=%0d,power:%0d",name,id,power);
  endfunction
endclass
  module home_class;
    home h1;
    home h2;
    initial begin
      h1=new();
      $display("Before changes of h1");
      h1.display();
      h2=new h1;
      $display("Before changes of h2");
      h2.display();

      h1.name="chitra";
      $display("After changes of h1");
      h1.display();
      $display("After changes of h1 ,h2 remains");
      h2.display();
      
      h2.name="guna";
      $display("After changes of h2 ,h1 remains");
      h1.display();
      $display("After changes of h2");
      h2.display();
    end
  endmodule
