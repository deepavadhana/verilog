class mobile;
  bit power;
  int battery;
  string ntw;
  task turn_on_phone();
    power=1;
    ntw="connected";
    $display ("power is %0d and the network is %0s",power,ntw);
  endtask
endclass
module mobile_phone;
  initial begin
    mobile m1;
    m1=new();
    m1.turn_on_phone();
    $display("object creation successful");
  end
endmodule
