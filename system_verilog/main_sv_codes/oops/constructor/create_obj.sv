class home;
  int no_fans;
  function new(int n);
    no_fans=n;
  endfunction
  task home_automation();
    $display("No of fans: %0d",no_fans);
  endtask
endclass
module constructor_obj;
  home h;
  initial begin
    h=new(10);
    h.home_automation();
  end
endmodule
  
