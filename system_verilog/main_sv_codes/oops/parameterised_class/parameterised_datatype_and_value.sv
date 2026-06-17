class cricket#(parameter a ,type team =string); //here the a is the value of the data passed and the team is the type of datatype needs to be assigned here default string is assigned
  bit [a-1:0] runs;
  team teams;
  function new();
    runs=16;
    teams="CSK";
  endfunction
  function void display();
    $display("value of runs=%0d,value of teams=%0s",runs,teams);
  endfunction
endclass
module parameterised_cls;
  initial begin
    cricket#(5) c;//value of the a should be assigned in creation of object
    c=new();
    c.display();
  end
endmodule
