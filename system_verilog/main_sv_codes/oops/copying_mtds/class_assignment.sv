class mobile;
  string name;
  int id;
  bit[3:0] power;
  function new();
    name="samsung";
    id=11;
    power=4'b1111;
  endfunction
  function void display();
    $display("NAME:%0s,ID=%0d,POWER:%0d",name,id,power);
  endfunction
endclass
  module mobile_details;
    mobile m1;
    mobile m2;
    initial begin
      m1=new();
      m1.display();
      m2=m1;
      m2.display();
      m1.name="vivo";
      m1.power=4'b1010;
      m1.display();
      m2.display();
    end
    endmodule
