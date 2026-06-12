class home;
  bit power;
  string switch;
  int no_of_fans;
  task home_automation();
    power=1;
    switch="ON";
    no_of_fans=8;
  endtask 
endclass
module home_auto;
home h1;
  initial begin
  
  if(h1==null)
    $display("obj is empty");
  else 
    $display("obj is not empty");
    h1=new();
  if(h1==null)
    $display("obj is empty");
  else 
    $display("obj is not empty");
  end
initial begin
    h1=new();
  h1.home_automation();
  if(h1==null)
    $display("obj is empty");
  else 
    $display("obj is not empty");
  end
endmodule
