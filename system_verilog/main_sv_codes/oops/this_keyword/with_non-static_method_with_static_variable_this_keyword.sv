//with nonstatic mtd call and static variable this keyword can be used
  class mobile;
  int battery;
  string name;
  bit [3:0] power;
  function static values (int battery,string name,bit [3:0] power);
    this.power=power;
    this.battery=battery;
    this.name=name;
  endfunction
  function void display();
    $display("battery=%0d,name=%0s,power=%0d",battery,name,power);
  endfunction
endclass
module mobile_details;
  mobile m1,m2;
  initial begin
    m1=new();
    m2=new();
    m1.values(10,"samsung",4'd4);
    m2.values(20,"vivo",4'd9);
    m1.display();
    m2.display();
    end
endmodule
