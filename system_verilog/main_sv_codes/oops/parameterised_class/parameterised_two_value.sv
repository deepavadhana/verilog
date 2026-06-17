class cricket#(parameter a ,b);
  bit [a-1:0] runs;
  bit [b-1:0] teams;
  function new();
    runs=16;
    teams=7;
  endfunction
  function void display();
    $display("value of runs=%0d,value of teams=%0d",runs,teams);
  endfunction
endclass
module parameterised_cls;
  initial begin
    cricket#(5,4) c;
    c=new();
    c.display();
  end
endmodule
