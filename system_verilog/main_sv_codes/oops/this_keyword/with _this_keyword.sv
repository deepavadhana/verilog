class mobile;
  int battery;
  string name;
  bit [3:0] power;
  function values (int battery,string name,bit [3:0] power);
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
    m1.name="samsung";
    m1.power=3'd4;
    m1.battery=10;
    m2.name="vivo";
    m2.power=4'd9;
    m2.battery=20;
    m1.display();
    m2.display();
    end
endmodule
    
