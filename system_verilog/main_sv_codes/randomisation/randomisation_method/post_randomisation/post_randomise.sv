// Code your design here
class generator;
  rand bit [3:0] value;
  constraint cons {value>5;};
  int check;
  function void pre_randomize();
    $display("IT IS PRE_RANDOMISE");
    check=0;
  endfunction
  function void post_randomize();
    $display("IT IS POST_RANDOMISE");
    check=1;
  endfunction
endclass
module post_randomisation();
  generator gen=new();
  int check;
  initial begin
    check=gen.randomize();
    $display("Randomisation takes place");
    if(check==1)
      $display("Pre Randomisation takes place ");
    else
      $display("Pre Randomisation does not takes place ");
      
    
    check=gen.randomize() with {value <5;};
    $display(" Randomisation takes place %0d",gen.value);
    if(check==1)
      $display("Post Randomisation takes place ");
    else
      $display("Post Randomisation does not takes place ");
  end
    endmodule
